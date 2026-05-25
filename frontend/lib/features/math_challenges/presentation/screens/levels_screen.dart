import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:math_ia/features/lessons/presentation/providers/lesson_provider.dart';
import 'package:math_ia/features/lessons/presentation/screens/lesson_screen.dart';

class LevelsScreen extends StatelessWidget {
  final Map<String, dynamic> worldData;
  final int completedLevels; // <-- Recibimos el progreso del usuario

  const LevelsScreen({
    super.key,
    required this.worldData,
    required this.completedLevels,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> levels = worldData['levels'];
    final Color worldColor = worldData['color'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          worldData['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: worldColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          final isLeft = index % 2 == 0;

          // --- LÓGICA DE ESTADOS DEL NIVEL ---
          final bool isCompleted = index < completedLevels;
          final bool isCurrent = index == completedLevels;
          final bool isLocked = index > completedLevels;

          // Asignación dinámica de colores e íconos según el estado
          Color avatarColor;
          Color cardColor;
          Color textColor;
          Widget circleContent;

          if (isCompleted) {
            avatarColor = Colors.green;
            cardColor = Colors.green.shade50;
            textColor = Colors.green.shade800;
            circleContent = const Icon(
              Icons.check,
              color: Colors.white,
              size: 28,
            );
          } else if (isCurrent) {
            avatarColor = worldColor;
            cardColor = Colors.white;
            textColor = Colors.black87;
            circleContent = Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            avatarColor = Colors.grey.shade400;
            cardColor = Colors.grey.shade100;
            textColor = Colors.grey.shade500;
            circleContent = const Icon(
              Icons.lock,
              color: Colors.white,
              size: 24,
            );
          }

          return Row(
            mainAxisAlignment: isLeft
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                margin: const EdgeInsets.only(bottom: 24),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: isLeft
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  children: [
                    // Tarjeta del nivel
                    Card(
                      elevation: isLocked
                          ? 0
                          : 4, // Sin sombra si está bloqueado
                      color: cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        // Borde resaltado SOLO para el nivel actual a jugar
                        side: isCurrent
                            ? BorderSide(color: worldColor, width: 2)
                            : BorderSide.none,
                      ),
                      margin: EdgeInsets.only(
                        left: isLeft ? 40 : 0,
                        right: isLeft ? 0 : 40,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nivel ${index + 1}',
                              style: TextStyle(
                                color: isCompleted
                                    ? Colors.green
                                    : (isLocked ? Colors.grey : worldColor),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              levels[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Círculo flotante (Piedra del camino)
                    Positioned(
                      left: isLeft ? 0 : null,
                      right: isLeft ? null : 0,
                      child: InkWell(
                        // AQUÍ ESTÁ EL BLOQUEO: Si isLocked es true, onTap es null (botón desactivado)
                        // Círculo flotante (Piedra del camino)
                        onTap: isLocked
                            ? null // Botón desactivado si está bloqueado
                            : () {
                                // 1. Inicializamos el proveedor (activará isReviewMode si el nivel ya fue completado)
                                context.read<LessonProvider>().startLesson(
                                  worldId: worldData['id'],
                                  levelIndex: index,
                                  isReview: isCompleted,
                                );

                                // 2. Navegamos a la lección
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LessonScreen(),
                                  ),
                                );
                              },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white, // Borde blanco sutil
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: avatarColor,
                            child: circleContent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
