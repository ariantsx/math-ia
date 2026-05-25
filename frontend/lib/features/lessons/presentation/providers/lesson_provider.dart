import 'package:flutter/material.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/lessons/data/lesson_models.dart';
import 'package:math_ia/features/lessons/data/world1_lessons.dart';

class LessonProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  int? _selectedAnswer;
  int? get selectedAnswer => _selectedAnswer;

  bool _hasAnswered = false;
  bool get hasAnswered => _hasAnswered;

  bool _isCorrect = false;
  bool get isCorrect => _isCorrect;

  Set<int> _completedExercises =
      {}; // Guarda los índices de ejercicios ya resueltos

  // --- NUEVO: La lista de diapositivas ahora está vacía al inicio ---
  List<LessonSlide> _slides = [];
  List<LessonSlide> get slides => _slides;

  // Getter seguro (evita errores si _slides está vacío)
  LessonSlide get currentSlide => _slides.isNotEmpty
      ? _slides[_currentIndex]
      : LessonSlide(type: SlideType.intro, title: 'Error', content: '');

  // --- NUEVA VARIABLE: MODO REPASO ---
  bool _isReviewMode = false;
  bool get isReviewMode => _isReviewMode;

  String? _currentWorldId;
  int? _currentLevelIndex;

  // Modificamos startLesson para que reciba al UserProvider
  void startLesson(
    UserProvider userProvider, {
    required String worldId,
    required int levelIndex,
    bool isReview = false,
  }) {
    _currentWorldId = worldId;
    _currentLevelIndex = levelIndex;
    _isReviewMode = isReview;
    _currentIndex = 0;

    if (worldId == 'w1') {
      _slides = World1Lessons.getLesson(levelIndex);
    } else {
      _slides = [
        LessonSlide(
          type: SlideType.intro,
          title: 'Próximamente',
          content: 'Construcción',
        ),
      ];
    }

    // NUEVO: Descargamos el historial de ejercicios de este nivel específico
    _completedExercises = userProvider
        .getCompletedExercises(worldId, levelIndex)
        .toSet();

    _setupCurrentSlideState();
    notifyListeners();
  }

  // Helper para preparar la vista actual
  void _setupCurrentSlideState() {
    // Magia: Es modo repaso O el usuario ya completó este ejercicio antes
    bool isAlreadyCompleted =
        _isReviewMode || _completedExercises.contains(_currentIndex);

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

          // NUEVO: Lo marcamos localmente y en la base de datos
          _completedExercises.add(_currentIndex);
          userProvider.markExerciseCompleted(
            _currentWorldId!,
            _currentLevelIndex!,
            _currentIndex,
          );

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
    // Ya no restringimos el retroceso.
    // El estudiante tiene total libertad de volver a leer la teoría.
    if (_currentIndex > 0) {
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
