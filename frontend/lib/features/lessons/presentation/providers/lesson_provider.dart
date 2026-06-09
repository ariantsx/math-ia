import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:math_ia/core/config/api_config.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/lessons/data/lesson_models.dart';
import 'package:math_ia/features/lessons/data/world1_lessons.dart';
import 'package:math_ia/features/lessons/data/world2_lessons.dart';
import 'package:math_ia/features/lessons/data/world3_lessons.dart';
import 'package:math_ia/features/lessons/data/world4_lessons.dart';
import 'package:math_ia/features/lessons/data/world5_lessons.dart';
import 'package:math_ia/features/lessons/data/world6_lessons.dart';

class LessonProvider extends ChangeNotifier {
  final String _baseUrl = ApiConfig.baseUrl;
  UserProvider? _userProvider;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  int? _selectedAnswer;
  int? get selectedAnswer => _selectedAnswer;

  bool _hasAnswered = false;
  bool get hasAnswered => _hasAnswered;

  bool _isCorrect = false;
  bool get isCorrect => _isCorrect;

  Set<int> _completedExercises = {};

  List<LessonSlide> _slides = [];
  List<LessonSlide> get slides => _slides;

  // ==========================================
  // VARIABLES DE IA (Machine Learning)
  // ==========================================
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isEpicQuest = false;
  bool get isEpicQuest => _isEpicQuest;

  LessonSlide? _dynamicExercise;

  // Memoria Global (Para no repetir ejercicios de BD)
  List<int> _seenExerciseIds = [];

  // --- NUEVO: CACHÉ DE SESIÓN (Para retroceder y avanzar sin perder el ejercicio) ---
  Map<int, LessonSlide> _sessionDynamicExercises = {};
  Map<int, bool> _sessionEpicQuests = {};

  // --- NUEVO: Control antifraude para el algoritmo ---
  bool _isFirstAttempt = true;

  LessonSlide get currentSlide {
    if (_slides.isEmpty) {
      return LessonSlide(type: SlideType.intro, title: 'Error', content: '');
    }

    final originalSlide = _slides[_currentIndex];

    if (originalSlide.type == SlideType.exercise && _dynamicExercise != null) {
      return _dynamicExercise!;
    }

    return originalSlide;
  }

  bool _isReviewMode = false;
  bool get isReviewMode => _isReviewMode;

  String? _currentWorldId;
  int? _currentLevelIndex;

  void startLesson(
    UserProvider userProvider, {
    required String worldId,
    required int levelIndex,
    bool isReview = false,
  }) {
    _userProvider = userProvider;
    _currentWorldId = worldId;
    _currentLevelIndex = levelIndex;
    _isReviewMode = isReview;
    _currentIndex = 0;

    _dynamicExercise = null;
    _isEpicQuest = false;
    _isLoading = false;

    // Limpiamos todas las memorias al iniciar un nivel
    _seenExerciseIds.clear();
    _sessionDynamicExercises.clear();
    _sessionEpicQuests.clear();

    // Dentro de tu función startLesson:
    if (worldId == 'w1') {
      _slides = World1Lessons.getLesson(levelIndex);
    } else if (worldId == 'w2') {
      _slides = World2Lessons.getLesson(levelIndex);
    } else if (worldId == 'w3') {
      _slides = World3Lessons.getLesson(levelIndex);
    } else if (worldId == 'w4') {
      _slides = World4Lessons.getLesson(levelIndex);
    } else if (worldId == 'w5') {
      _slides = World5Lessons.getLesson(levelIndex);
    } else if (worldId == 'w6') {
      _slides = World6Lessons.getLesson(levelIndex); // <-- NUEVO MUNDO 6
    } else {
      _slides = [
        LessonSlide(
          type: SlideType.intro,
          title: 'Próximamente',
          content: 'Construcción',
        ),
      ];
    }

    _completedExercises = userProvider
        .getCompletedExercises(worldId, levelIndex)
        .toSet();
    _setupCurrentSlideState();
    notifyListeners();
  }

  void _setupCurrentSlideState() {
    bool isAlreadyCompleted =
        _isReviewMode || _completedExercises.contains(_currentIndex);

    // --- RESCATE MÁGICO DEL EJERCICIO DEL MODO REPASO ---
    if (_isReviewMode &&
        _userProvider != null &&
        currentSlide.type == SlideType.exercise) {
      final savedData = _userProvider!.getSavedDynamicExercise(
        _currentWorldId!,
        _currentLevelIndex!,
        _currentIndex,
      );
      if (savedData != null) {
        _dynamicExercise = LessonSlide(
          type: SlideType.exercise,
          title: savedData['title'] ?? 'Repaso de Lección',
          content: savedData['content'],
          options: List<String>.from(savedData['options']),
          correctAnswerIndex: savedData['correctAnswerIndex'],
          feedback: savedData['feedback'],
          conceptTag: _slides[_currentIndex].conceptTag,
        );
      }
    }

    if (isAlreadyCompleted && currentSlide.type == SlideType.exercise) {
      _hasAnswered = true;
      _isCorrect = true;
      _selectedAnswer = currentSlide.correctAnswerIndex;
    } else {
      _hasAnswered = false;
      _isCorrect = false;
      _selectedAnswer = null;
    }
  }

  void selectAnswer(int index) {
    if (!_hasAnswered && !_isReviewMode) {
      _selectedAnswer = index;
      notifyListeners();
    }
  }

  Future<void> fetchNextDynamicExercise(UserProvider user) async {
    _isLoading = true;
    _hasAnswered = false;
    _selectedAnswer = null;
    notifyListeners();

    try {
      final url = Uri.parse('$_baseUrl/api/exercises/next');
      final String? targetConcept = _slides[_currentIndex].conceptTag;

      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'world_id': _currentWorldId,
              'level_index': _currentLevelIndex,
              'current_skill_level':
                  user.skillLevel, // <-- AQUÍ VA EL NIVEL DINÁMICO
              'exclude_ids': _seenExerciseIds,
              'target_concept': targetConcept,
            }),
          )
          .timeout(const Duration(seconds: 3));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _isEpicQuest = data['is_epic_quest'] ?? false;
        final exerciseJson = data['exercise'];

        _seenExerciseIds.add(exerciseJson['id']);

        _dynamicExercise = LessonSlide(
          type: SlideType.exercise,
          title: _isEpicQuest ? '¡RETO ÉPICO! x2' : '¡A practicar!',
          content: exerciseJson['question_text'],
          options: List<String>.from(exerciseJson['options']),
          correctAnswerIndex: exerciseJson['correct_answer_index'],
          feedback: exerciseJson['feedback'],
          conceptTag: targetConcept,
          difficulty:
              exerciseJson['difficulty'], // <--- AQUÍ CAPTURAS LA DIFICULTAD DE PYTHON
        );

        // --- GUARDAMOS EL EJERCICIO EN EL CACHÉ POR SI EL USUARIO RETROCEDE ---
        _sessionDynamicExercises[_currentIndex] = _dynamicExercise!;
        _sessionEpicQuests[_currentIndex] = _isEpicQuest;
      } else {
        _isEpicQuest = false;
        _dynamicExercise = _getFallbackExercise();
      }
    } catch (e) {
      print('IA inactiva o error. Plan B activado: $e');
      _isEpicQuest = false;
      _dynamicExercise = _getFallbackExercise();
    } finally {
      _isLoading = false;
    }
  }

  LessonSlide _getFallbackExercise() {
    return _slides[_currentIndex];
  }

  Future<void> nextSlide(
    BuildContext context,
    UserProvider userProvider,
  ) async {
    if (_isLoading) return;

    // 1. EVALUAR EJERCICIOS
    if (!_isReviewMode && currentSlide.type == SlideType.exercise) {
      if (!_hasAnswered) {
        if (_selectedAnswer == null) return;

        int slideDifficulty =
            currentSlide.difficulty ?? userProvider.skillLevel;

        if (_selectedAnswer == currentSlide.correctAnswerIndex) {
          // Si el slide no tiene dificultad (por ser fijo de teoría), asumimos el nivel actual

          _isCorrect = true;

          // --- SOLO PREMIAMOS SI ES SU PRIMER INTENTO ---
          if (_isFirstAttempt) {
            userProvider.addCoins(5);
            userProvider.updateSkillLevel(true, slideDifficulty);
            _showFloatingMessage(
              context,
              '¡Correcto! +5 Monedas',
              Colors.green,
            );
          } else {
            // Si es un reintento, lo felicitamos por corregir, pero NO le subimos el nivel ni damos monedas
            _showFloatingMessage(
              context,
              '¡Bien corregido! Sigamos.',
              Colors.orange,
            );
          }
          _completedExercises.add(_currentIndex);

          userProvider.markExerciseCompleted(
            _currentWorldId!,
            _currentLevelIndex!,
            _currentIndex,
            dynamicExerciseData: _dynamicExercise != null
                ? {
                    'title': _dynamicExercise!.title,
                    'content': _dynamicExercise!.content,
                    'options': _dynamicExercise!.options,
                    'correctAnswerIndex': _dynamicExercise!.correctAnswerIndex,
                    'feedback': _dynamicExercise!.feedback,
                  }
                : null,
          );
        } else {
          _isCorrect = false;
          userProvider.deductLife();

          // --- SOLO CASTIGAMOS Y REPORTAMOS EN EL PRIMER ERROR ---
          if (_isFirstAttempt) {
            userProvider.updateSkillLevel(false, slideDifficulty);

            userProvider.addFailedExercise(
              worldId: _currentWorldId ?? 'Desconocido',
              conceptTag: currentSlide.conceptTag ?? 'Concepto General',
              questionText: currentSlide.content,
              feedback:
                  currentSlide.feedback ?? 'Repasar conceptos de este tema.',
            );

            // Marcamos que ya quemó su primer intento
            _isFirstAttempt = false;
          }

          if (userProvider.lives <= 0) {
            _showFloatingMessage(
              context,
              '¡Te quedaste sin vidas! ❤️‍🩹',
              Colors.red,
            );
            Navigator.pop(context);
            return;
          } else {
            _showFloatingMessage(context, '¡Ups! -1 Vida ❤️', Colors.redAccent);
          }
        }
        _hasAnswered = true;
        notifyListeners();
        return;
      } else {
        if (!_isCorrect) {
          _hasAnswered = false;
          _selectedAnswer = null;
          notifyListeners();
          return;
        }
      }
    }

    // 2. AVANZAR A LA SIGUIENTE DIAPOSITIVA
    if (_currentIndex < _slides.length - 1) {
      _currentIndex++;
      // --- NUEVO: Reseteamos el intento para la nueva pregunta ---
      _isFirstAttempt = true;

      if (_slides[_currentIndex].type == SlideType.exercise && !_isReviewMode) {
        // --- VERIFICAR CACHÉ ANTES DE PEDIR A PYTHON ---
        if (_sessionDynamicExercises.containsKey(_currentIndex)) {
          _dynamicExercise = _sessionDynamicExercises[_currentIndex];
          _isEpicQuest = _sessionEpicQuests[_currentIndex] ?? false;
        } else {
          await fetchNextDynamicExercise(userProvider);
        }
      } else {
        _dynamicExercise = null;
        _isEpicQuest = false;
      }

      _setupCurrentSlideState();
      notifyListeners();
    }
    // 3. FINALIZAR
    else {
      if (_isReviewMode) {
        _showReviewCompleteDialog(context);
      } else {
        userProvider.addCoins(50);
        userProvider.addExp(100);
        userProvider.completeLevel(_currentWorldId!, _currentLevelIndex!);
        _showVictoryDialog(context);
      }
    }
  }

  void previousSlide() {
    if (_isLoading) return;

    if (_currentIndex > 0) {
      _currentIndex--;

      // --- RESTAURAR CACHÉ SI RETROCEDEMOS A UN EJERCICIO ---
      if (_slides[_currentIndex].type == SlideType.exercise && !_isReviewMode) {
        if (_sessionDynamicExercises.containsKey(_currentIndex)) {
          _dynamicExercise = _sessionDynamicExercises[_currentIndex];
          _isEpicQuest = _sessionEpicQuests[_currentIndex] ?? false;
        }
      } else if (_slides[_currentIndex].type != SlideType.exercise) {
        _dynamicExercise = null;
        _isEpicQuest = false;
      }

      _setupCurrentSlideState();
      notifyListeners();
    }
  }

  // ==========================================
  // MÉTODOS VISUALES ORIGINALES
  // ==========================================

  void _showFloatingMessage(BuildContext context, String message, Color color) {
    final screenWidth = MediaQuery.of(context).size.width;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.only(
          bottom: 90,
          left: screenWidth * 0.25,
          right: screenWidth * 0.25,
        ),
        elevation: 6,
      ),
    );
  }

  void _showVictoryDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Column(
            children: [
              Icon(Icons.emoji_events, size: 80, color: Colors.amber),
              SizedBox(height: 16),
              Text(
                '¡Nivel Superado!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '¡Excelente trabajo! Has dominado este tema y tu robot es más fuerte.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.star, color: Colors.blueAccent, size: 45),
                      SizedBox(height: 8),
                      Text(
                        '+100 XP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.amber,
                        size: 45,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '+50',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'CONTINUAR',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
          actionsPadding: const EdgeInsets.only(bottom: 24),
        );
      },
    );
  }

  void _showReviewCompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Column(
            children: [
              Icon(Icons.menu_book, size: 80, color: Colors.blueAccent),
              SizedBox(height: 16),
              Text(
                '¡Repaso Terminado!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Text(
            'Has repasado esta lección con éxito. ¡La práctica hace al maestro!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'VOLVER AL MAPA',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
          actionsPadding: const EdgeInsets.only(bottom: 24),
        );
      },
    );
  }

  // --- LIMPIEZA DE SESIÓN ---
  void clearData() {
    _userProvider = null;
    _currentIndex = 0;
    _selectedAnswer = null;
    _hasAnswered = false;
    _isCorrect = false;

    _completedExercises.clear();
    _slides = [];

    _isLoading = false;
    _isEpicQuest = false;
    _dynamicExercise = null;

    _seenExerciseIds.clear();
    _sessionDynamicExercises.clear();
    _sessionEpicQuests.clear();

    _isReviewMode = false;
    _currentWorldId = null;
    _currentLevelIndex = null;

    notifyListeners();
  }
}
