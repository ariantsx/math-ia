import 'package:flutter/material.dart';
import 'package:math_ia/features/lessons/presentation/screens/lesson_screen.dart';

class LevelsScreen extends StatelessWidget {
  final Map<String, dynamic> worldData;

  const LevelsScreen({super.key, required this.worldData});

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
          // Lógica para alternar izquierda y derecha (Efecto Zig-Zag)
          final isLeft = index % 2 == 0;

          return Row(
            mainAxisAlignment: isLeft
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              // Nivel en diseño Zig-Zag
              Container(
                width:
                    MediaQuery.of(context).size.width *
                    0.65, // Ocupa el 65% de la pantalla
                margin: const EdgeInsets.only(bottom: 24),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: isLeft
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  children: [
                    // Tarjeta del nivel
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
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
                                color: worldColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              levels[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Círculo flotante con número (simula la piedra del camino)
                    Positioned(
                      left: isLeft ? 0 : null,
                      right: isLeft ? null : 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LessonScreen(),
                            ),
                          );
                          ;
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: worldColor,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
