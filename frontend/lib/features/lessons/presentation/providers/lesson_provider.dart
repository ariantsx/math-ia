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

  // --- NUEVA VARIABLE: MODO REPASO ---
  bool _isReviewMode = false;
  bool get isReviewMode => _isReviewMode;

  String? _currentWorldId;
  int? _currentLevelIndex;

  void startLesson({
    required String worldId,
    required int levelIndex,
    bool isReview = false,
  }) {
    _currentWorldId = worldId;
    _currentLevelIndex = levelIndex;
    _isReviewMode = isReview;
    _currentIndex = 0;
    _setupCurrentSlideState();
    notifyListeners();
  }

  // Helper para preparar la vista actual
  void _setupCurrentSlideState() {
    if (_isReviewMode && currentSlide.type == SlideType.exercise) {
      // Si es repaso, auto-resolvemos la pregunta correctamente
      _hasAnswered = true;
      _isCorrect = true;
      _selectedAnswer = currentSlide.correctAnswerIndex;
    } else {
      // Estado normal para aprender
      _hasAnswered = false;
      _isCorrect = false;
      _selectedAnswer = null;
    }
  }

  void selectAnswer(int index) {
    // Solo puede seleccionar si no ha respondido y NO está en modo repaso
    if (!_hasAnswered && !_isReviewMode) {
      _selectedAnswer = index;
      notifyListeners();
    }
  }

  // --- LÓGICA PRINCIPAL MODIFICADA ---
  void nextSlide(BuildContext context, UserProvider userProvider) {
    // 1. EVALUAR EJERCICIOS EN MODO NORMAL (Aprendizaje)
    if (!_isReviewMode && currentSlide.type == SlideType.exercise) {
      if (!_hasAnswered) {
        // A. El usuario acaba de presionar "Comprobar"
        if (_selectedAnswer == currentSlide.correctAnswerIndex) {
          _isCorrect = true;
          userProvider.addCoins(5);
          _showFloatingMessage(
            context,
            '¡Correcto! +5 Monedas 🟡',
            Colors.green,
          );
        } else {
          _isCorrect = false;
          userProvider.deductLife();
          _showFloatingMessage(context, '¡Ups! -1 Vida ❤️', Colors.redAccent);
        }
        _hasAnswered = true;
        notifyListeners();
        return; // Detenemos la ejecución aquí para que vea su corrección en pantalla
      } else {
        // B. El usuario ya vio si acertó o falló y presionó "Continuar" o "Reintentar"
        if (!_isCorrect) {
          // Si se equivocó, le reiniciamos el ejercicio para que lo intente de nuevo
          _hasAnswered = false;
          _selectedAnswer = null;
          notifyListeners();
          return; // No lo dejamos avanzar hasta que acierte
        }
      }
    }

    // 2. AVANZAR A LA SIGUIENTE DIAPOSITIVA (Teoría o Ejercicio acertado/Modo repaso)
    if (_currentIndex < _slides.length - 1) {
      _currentIndex++;
      _setupCurrentSlideState(); // Preparamos la nueva vista (si es repaso, se auto-responde)
      notifyListeners();
    }
    // 3. FINALIZAR EL NIVEL
    else {
      if (_isReviewMode) {
        // Si solo estaba repasando, mostramos un mensaje sutil sin darle más premios
        _showReviewCompleteDialog(context);
      } else {
        // Si es la primera vez que lo supera: ¡Le damos el botín y guardamos su avance!
        userProvider.addCoins(50);
        userProvider.addExp(100);
        userProvider.completeLevel(
          _currentWorldId!,
          _currentLevelIndex!,
        ); // Guardamos en PostgreSQL
        _showVictoryDialog(context);
      }
    }
  }

  void previousSlide() {
    // En modo repaso siempre puede retroceder. En modo normal, solo si no ha respondido el ejercicio actual.
    if (_currentIndex > 0 && (_isReviewMode || !_hasAnswered)) {
      _currentIndex--;
      _setupCurrentSlideState();
      notifyListeners();
    }
  }

  void clear() {
    _currentIndex = 0;
    _selectedAnswer = null;
    _hasAnswered = false;
    _isCorrect = false;
    _isReviewMode = false;
  }

  // ==========================================
  // EFECTOS VISUALES (FEEDBACK)
  // ==========================================

  void _showFloatingMessage(BuildContext context, String message, Color color) {
    // Obtenemos el ancho total de la pantalla del dispositivo
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ), // Bordes bien curvos
        // AQUÍ ESTÁ EL CAMBIO: Le damos márgenes grandes a los lados para achicar su ancho
        margin: EdgeInsets.only(
          bottom: 90,
          left: screenWidth * 0.25, // Lo empuja 25% desde la izquierda
          right: screenWidth * 0.25, // Lo empuja 25% desde la derecha
        ),
        elevation: 6,
      ),
    );
  }

  void _showVictoryDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Obliga al usuario a tocar el botón
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
                  // Recompensa de Experiencia
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
                  // Recompensa de Monedas
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
              // Eliminamos el SizedBox(width: double.infinity) para que no ocupe toda la pantalla
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra este popup de victoria
                  Navigator.pop(
                    context,
                  ); // Cierra la pantalla de la lección y lo devuelve al mapa
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  // Añadimos 'horizontal: 40' para darle el ancho perfecto al botón
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ), // Bordes un poco más curvos (píldora)
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
          // Reducimos el padding inferior del popup para que el botón no quede tan "flotando"
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
                  Navigator.pop(context); // Cierra popup
                  Navigator.pop(context); // Vuelve al mapa
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
}
