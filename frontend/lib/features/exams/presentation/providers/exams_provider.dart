import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// --- MODELOS ---
class ExamQuestion {
  final String text;
  final List<String> options;
  final int correctAnswerIndex;
  int? selectedAnswerIndex;

  ExamQuestion({
    required this.text,
    required this.options,
    required this.correctAnswerIndex,
    this.selectedAnswerIndex,
  });
}

class ExamResult {
  final int score;
  final String grade;
  final List<ExamQuestion> questions;

  ExamResult(this.score, this.grade, this.questions);
}

// --- ESTADOS DEL EXAMEN ---
enum ExamState { intro, taking, summary, details }

class ExamsProvider extends ChangeNotifier {
  final String _baseUrl =
      'http://localhost:3000/api'; // Ajusta la IP según tu entorno

  ExamState _currentState = ExamState.intro;
  ExamState get currentState => _currentState;

  List<ExamQuestion> _currentQuestions = [];
  int _currentQuestionIndex = 0;
  int _timeLeft = 30;
  Timer? _timer;
  ExamResult? lastResult;
  bool _isLoading = false; // Nuevo estado de carga

  // Getters
  ExamQuestion get currentQuestion => _currentQuestions[_currentQuestionIndex];
  int get currentQuestionIndex => _currentQuestionIndex;
  int get timeLeft => _timeLeft;
  bool get isLoading => _isLoading;

  String _calculateGrade(int score) {
    if (score >= 18) return 'AD';
    if (score >= 14) return 'A';
    if (score >= 11) return 'B';
    return 'C';
  }

  void changeState(ExamState newState) {
    _currentState = newState;
    notifyListeners();
  }

  // --- NUEVA LÓGICA: Iniciar examen con base de datos ---
  Future<void> startExam(int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('$_baseUrl/questions'));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List<dynamic> questionsData = decoded['data'];

        _currentQuestions = questionsData
            .map(
              (q) => ExamQuestion(
                text: q['text'],
                options: List<String>.from(q['options']),
                correctAnswerIndex: q['correct_answer_index'],
              ),
            )
            .toList();

        _currentQuestionIndex = 0;
        _currentState = ExamState.taking;
        _startTimer();
      }
    } catch (e) {
      debugPrint("Error descargando preguntas: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  // ... (_startTimer y submitAnswer se mantienen iguales, pero cambiamos a submitAnswerAsync) ...

  void _startTimer() {
    _timeLeft = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        _timeLeft--;
        notifyListeners();
      } else {
        submitAnswer(
          null,
          0,
        ); // Pasamos 0 temporalmente, el _finishExam necesita el userId real
      }
    });
  }

  void submitAnswer(int? selectedIndex, int userId) {
    _timer?.cancel();
    _currentQuestions[_currentQuestionIndex].selectedAnswerIndex =
        selectedIndex;

    if (_currentQuestionIndex < _currentQuestions.length - 1) {
      _currentQuestionIndex++;
      _startTimer();
    } else {
      _finishExamAndSave(userId); // Al terminar, guardamos en base de datos
    }
    notifyListeners();
  }

  // --- NUEVA LÓGICA: Guardar resultado en FastAPI ---
  Future<void> _finishExamAndSave(int userId) async {
    _timer?.cancel();
    int correctAnswers = 0;
    List<Map<String, dynamic>> detailedHistory = [];

    for (var q in _currentQuestions) {
      if (q.selectedAnswerIndex == q.correctAnswerIndex) correctAnswers++;

      detailedHistory.add({
        "question": q.text,
        "selected": q.selectedAnswerIndex,
        "correct": q.correctAnswerIndex,
        "options": q
            .options, // <-- NUEVO: Guardar las opciones para la revisión futura
      });
    }

    lastResult = ExamResult(
      correctAnswers,
      _calculateGrade(correctAnswers),
      List.from(_currentQuestions),
    );

    _currentState = ExamState.summary;
    notifyListeners();

    // Guardar en la base de datos silenciosamente
    try {
      await http.post(
        Uri.parse('$_baseUrl/users/$userId/exams'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'score': correctAnswers,
          'grade': _calculateGrade(correctAnswers),
          'detailed_history': detailedHistory,
        }),
      );
    } catch (e) {
      debugPrint("Error guardando examen: $e");
    }
  }

  // --- NUEVA LÓGICA: Reconstruir examen desde la Base de Datos ---
  void loadResultFromHistory(Map<String, dynamic> historyData) {
    final int score = historyData['score'] ?? 0;
    final String grade = historyData['grade'] ?? 'C';
    final List<dynamic> details = historyData['details'] ?? [];

    List<ExamQuestion> reconstructedQuestions = details.map((d) {
      return ExamQuestion(
        text: d['question'] ?? 'Pregunta',
        // Recuperamos las opciones. Si es un examen viejo que no las guardó, ponemos un relleno seguro para que no colapse
        options: d['options'] != null
            ? List<String>.from(d['options'])
            : ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4'],
        correctAnswerIndex: d['correct'] ?? 0,
        selectedAnswerIndex: d['selected'],
      );
    }).toList();

    lastResult = ExamResult(score, grade, reconstructedQuestions);
    // --- CAMBIO AQUÍ: Ahora lo mandamos a 'summary' en lugar de 'details' ---
    _currentState = ExamState.summary;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // --- LIMPIEZA DE SESIÓN ---
  void clearData() {
    lastResult = null;
    _currentQuestions = [];
    _currentQuestionIndex = 0;
    _currentState = ExamState.intro;
    notifyListeners();
  }
}
