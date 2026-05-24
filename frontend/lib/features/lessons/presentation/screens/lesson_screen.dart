import 'package:flutter/material.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/lessons/data/lesson_models.dart';
import 'package:math_ia/features/lessons/presentation/providers/lesson_provider.dart';
import 'package:provider/provider.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  void dispose() {
    // Usamos microtask para limpiar el provider cuando se cierra la pantalla
    Future.microtask(() => context.read<LessonProvider>().clear());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lessonProvider = context.watch<LessonProvider>();
    final userProvider = context.watch<UserProvider>();
    final slide = lessonProvider.currentSlide;
    final progress =
        (lessonProvider.currentIndex + 1) / lessonProvider.slides.length;

    // Verificar si el usuario se quedó sin vidas
    if (userProvider.lives <= 0) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, size: 80, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                '¡Te quedaste sin vidas!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Espera a que se recarguen para intentarlo de nuevo.'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Volver al Mapa'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.pop(context), // Abandonar nivel
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            backgroundColor: Colors.grey[200],
            color: Colors.green,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.redAccent),
                const SizedBox(width: 4),
                Text(
                  '${userProvider.lives}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // TÍTULO E ÍCONO
                    Icon(
                      slide.type == SlideType.exercise
                          ? Icons.psychology
                          : Icons.menu_book,
                      size: 60,
                      color: slide.type == SlideType.exercise
                          ? Colors.purpleAccent
                          : Colors.blueAccent,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      slide.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // CONTENIDO / ENUNCIADO
                    Text(
                      slide.content,
                      style: const TextStyle(fontSize: 18, height: 1.5),
                    ),
                    const SizedBox(height: 32),

                    // OPCIONES (SI ES EJERCICIO)
                    if (slide.type == SlideType.exercise &&
                        slide.options != null)
                      ...List.generate(slide.options!.length, (index) {
                        final isSelected =
                            lessonProvider.selectedAnswer == index;

                        // Lógica de colores si ya respondió
                        Color bgColor = isSelected
                            ? Colors.blue.shade50
                            : Colors.white;
                        Color borderColor = isSelected
                            ? Colors.blueAccent
                            : Colors.grey.shade300;

                        if (lessonProvider.hasAnswered) {
                          if (index == slide.correctAnswerIndex) {
                            bgColor = Colors.green.shade50;
                            borderColor = Colors.green;
                          } else if (isSelected) {
                            bgColor = Colors.red.shade50;
                            borderColor = Colors.red;
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: InkWell(
                            onTap: lessonProvider.hasAnswered
                                ? null
                                : () => lessonProvider.selectAnswer(index),
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: borderColor,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      slide.options![index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color:
                                            lessonProvider.hasAnswered &&
                                                index ==
                                                    slide.correctAnswerIndex
                                            ? Colors.green.shade800
                                            : Colors.black87,
                                      ),
                                    ),
                                  ),
                                  if (lessonProvider.hasAnswered &&
                                      index == slide.correctAnswerIndex)
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  else if (lessonProvider.hasAnswered &&
                                      isSelected)
                                    const Icon(Icons.cancel, color: Colors.red),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  ],
                ),
              ),
            ),

            // PANEL INFERIOR DE BOTONES
            Row(
              children: [
                if (lessonProvider.currentIndex > 0 &&
                    !lessonProvider.hasAnswered)
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () => lessonProvider.previousSlide(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('ATRÁS'),
                    ),
                  ),
                if (lessonProvider.currentIndex > 0 &&
                    !lessonProvider.hasAnswered)
                  const SizedBox(width: 12),

                // BOTÓN PRINCIPAL
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed:
                        (slide.type == SlideType.exercise &&
                            lessonProvider.selectedAnswer == null)
                        ? null
                        : () => lessonProvider.nextSlide(context, userProvider),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lessonProvider.hasAnswered
                          ? (lessonProvider.isCorrect
                                ? Colors.green
                                : Colors.red)
                          : Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      lessonProvider.hasAnswered
                          ? (lessonProvider.isCorrect
                                ? 'CONTINUAR'
                                : 'REINTENTAR')
                          : (slide.type == SlideType.exercise
                                ? 'COMPROBAR'
                                : 'ENTENDIDO'),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
