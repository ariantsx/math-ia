import 'package:flutter/material.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/lessons/data/lesson_models.dart';

class LessonProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  int? _selectedAnswer;
  int? get selectedAnswer => _selectedAnswer;

  bool _hasAnswered = false;
  bool get hasAnswered => _hasAnswered;

  bool _isCorrect = false;
  bool get isCorrect => _isCorrect;

  // --- DATOS DEL NIVEL 1: NÚMEROS NATURALES ---
  final List<LessonSlide> _slides = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Números Naturales',
      content:
          '¡Bienvenido al Reino Numérico!\n\nHoy aprenderemos sobre los números más antiguos y fundamentales: Los Números Naturales (N). Son los que usamos para contar las cosas a nuestro alrededor.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Cuáles son?',
      content:
          'Los números naturales empiezan desde el 1 y van hacia el infinito: 1, 2, 3, 4, 5...\n\nOJO: Algunos matemáticos incluyen el cero (0), pero generalmente los usamos para contar objetos reales (no puedes tener "cero" manzanas sobre la mesa si vas a contarlas).',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Para qué sirven?',
      content:
          'Tienen dos usos principales:\n\n1. Cardinal: Para saber la cantidad (Ej: Tengo 3 hermanos).\n2. Ordinal: Para dar un orden (Ej: Llegué en 1er lugar).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡A practicar!',
      content:
          '¿Cuál de los siguientes conjuntos representa mejor a los números naturales?',
      options: [
        '-1, 0, 1, 2',
        '1, 2, 3, 4...',
        '1.5, 2.5, 3.5',
        '0.1, 0.2, 0.3',
      ],
      correctAnswerIndex: 1,
    ),
    // ... AQUÍ IRÍA MÁS TEORÍA ...
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Has completado la teoría. Ahora deberás responder 5 preguntas seguidas correctamente para superar el nivel.\n\nRecuerda: Si te equivocas, perderás una vida.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 5',
      content:
          'Si digo "Mi salón está en el 2do piso", ¿qué uso le estoy dando al número natural?',
      options: [
        'Cardinal (Cantidad)',
        'Ordinal (Orden)',
        'Decimal',
        'Negativo',
      ],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 5',
      content: '¿Cuál de estos números NO es natural?',
      options: ['15', '1000', '-3', '8'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 5',
      content: '¿Qué número natural le sigue a 999?',
      options: ['100', '998', '1000', '1001'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 5',
      content:
          'Si tienes 5 soles y ganas 3 más, tienes 8. Esta operación pertenece a los números naturales porque...',
      options: [
        'Es una división',
        'Las cantidades son exactas y positivas',
        'Tiene decimales',
        'Da como resultado cero',
      ],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 5 de 5',
      content: '¿Cuál es el número natural más pequeño? (Excluyendo el cero)',
      options: ['-1', '0.1', '2', '1'],
      correctAnswerIndex: 3,
    ),
  ];

  List<LessonSlide> get slides => _slides;
  LessonSlide get currentSlide => _slides[_currentIndex];

  void selectAnswer(int index) {
    if (!_hasAnswered) {
      _selectedAnswer = index;
      notifyListeners();
    }
  }

  // Lógica principal de avanzar y comprobar
  void nextSlide(BuildContext context, UserProvider userProvider) {
    if (currentSlide.type == SlideType.exercise) {
      if (!_hasAnswered) {
        // Comprobar respuesta
        if (_selectedAnswer == currentSlide.correctAnswerIndex) {
          _isCorrect = true;
          userProvider.addCoins(5); // +5 monedas por ejercicio
        } else {
          _isCorrect = false;
          userProvider.deductLife(); // -1 vida por error
        }
        _hasAnswered = true;
        notifyListeners();
        return; // Detenemos aquí para que vea si se equivocó
      } else {
        // Ya respondió y vio el resultado, ahora sí puede avanzar (solo si es correcto)
        if (!_isCorrect) {
          // Si se equivocó, le reiniciamos la vista para que lo intente de nuevo
          _hasAnswered = false;
          _selectedAnswer = null;
          notifyListeners();
          return;
        }
      }
    }

    // Avanzar de página
    if (_currentIndex < _slides.length - 1) {
      _currentIndex++;
      _hasAnswered = false;
      _selectedAnswer = null;
      notifyListeners();
    } else {
      // TERMINÓ EL NIVEL COMPLETAMENTE
      userProvider.addCoins(50);
      userProvider.addExp(100);
      Navigator.pop(context); // Lo devolvemos al mapa de mundos
      // Mostrar mensaje de éxito
    }
  }

  void previousSlide() {
    // Solo puede retroceder si no está en medio de un ejercicio ya respondido y no es la primera
    if (_currentIndex > 0 && !_hasAnswered) {
      _currentIndex--;
      _selectedAnswer = null;
      notifyListeners();
    }
  }

  // Reiniciar estado al salir
  void clear() {
    _currentIndex = 0;
    _selectedAnswer = null;
    _hasAnswered = false;
    _isCorrect = false;
  }
}
