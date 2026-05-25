import 'package:flutter/material.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/lessons/presentation/providers/lesson_provider.dart';
import 'package:math_ia/features/lessons/presentation/screens/lesson_screen.dart';
import 'package:provider/provider.dart';

class LevelsScreen extends StatelessWidget {
  final Map<String, dynamic> worldData;

  const LevelsScreen({super.key, required this.worldData});

  @override
  Widget build(BuildContext context) {
    final List<String> levels = worldData['levels'];
    final Color worldColor = worldData['color'];

    final user = context.watch<UserProvider>();
    final int completedLevels = user.worldProgress[worldData['id']] ?? 0;

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
        // Quitamos el padding vertical gigante para que los niveles estén más unidos
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          final isLeft = index % 2 == 0; // Alternar izquierda/derecha

          // --- ESTADOS DEL NIVEL ---
          final bool isCompleted = index < completedLevels;
          final bool isCurrent = index == completedLevels;
          final bool isLocked = index > completedLevels;

          // --- COLORES DEL NODO (CÍRCULO) ---
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
              size: 24,
            );
          } else if (isCurrent) {
            avatarColor = worldColor;
            cardColor = Colors.white;
            textColor = Colors.black87;
            circleContent = Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            avatarColor = Colors.grey.shade400;
            cardColor = Colors.grey.shade50;
            textColor = Colors.grey.shade500;
            circleContent = const Icon(
              Icons.lock,
              color: Colors.white,
              size: 20,
            );
          }

          // --- COLORES DE LA LÍNEA DE RUTA ---
          // La línea superior conecta con el nivel anterior
          Color topLineColor = index == 0
              ? Colors.transparent
              : (index <= completedLevels
                    ? Colors.green
                    : Colors.grey.shade300);

          // La línea inferior conecta con el siguiente nivel
          Color bottomLineColor = index == levels.length - 1
              ? Colors.transparent
              : (isCompleted ? Colors.green : Colors.grey.shade300);

          return IntrinsicHeight(
            child: Row(
              children: [
                // --- 1. LADO IZQUIERDO ---
                Expanded(
                  child: isLeft
                      ? _buildLevelCard(
                          index,
                          levels[index],
                          cardColor,
                          textColor,
                          isCurrent,
                          worldColor,
                          isLocked,
                          isLeft,
                        )
                      : const SizedBox(),
                ),

                // --- 2. CENTRO: RUTA CONECTADA Y NODO ---
                SizedBox(
                  width: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // La línea de la ruta (mitad arriba, mitad abajo)
                      Column(
                        children: [
                          Expanded(
                            child: Container(width: 4, color: topLineColor),
                          ),
                          Expanded(
                            child: Container(width: 4, color: bottomLineColor),
                          ),
                        ],
                      ),
                      // El nodo interactivo (El círculo)
                      InkWell(
                        onTap: isLocked
                            ? null
                            : () {
                                context.read<LessonProvider>().startLesson(
                                  user, // <-- AÑADIMOS ESTA LÍNEA (la variable user ya la tienes definida arriba en el build)
                                  worldId: worldData['id'],
                                  levelIndex: index,
                                  isReview: isCompleted,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LessonScreen(),
                                  ),
                                );
                              },
                        child: CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.white, // Borde blanco
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: avatarColor,
                            child: circleContent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // --- 3. LADO DERECHO ---
                Expanded(
                  child: !isLeft
                      ? _buildLevelCard(
                          index,
                          levels[index],
                          cardColor,
                          textColor,
                          isCurrent,
                          worldColor,
                          isLocked,
                          isLeft,
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Helper para construir la tarjeta y no repetir código
  Widget _buildLevelCard(
    int index,
    String title,
    Color cardColor,
    Color textColor,
    bool isCurrent,
    Color worldColor,
    bool isLocked,
    bool isLeft,
  ) {
    return Padding(
      // Padding dinámico para que la tarjeta no choque con los bordes ni con la línea central
      padding: EdgeInsets.only(
        left: isLeft ? 16 : 8,
        right: isLeft ? 8 : 16,
        top: 12,
        bottom: 12,
      ),
      child: Card(
        elevation: isLocked ? 0 : 4,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: isCurrent
              ? BorderSide(color: worldColor, width: 2)
              : BorderSide.none,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nivel ${index + 1}',
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
