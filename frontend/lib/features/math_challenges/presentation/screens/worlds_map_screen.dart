import 'package:flutter/material.dart';
import 'package:math_ia/core/constants/item_catalog.dart';
import 'package:math_ia/core/constants/worlds_catalog.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/math_challenges/presentation/screens/levels_screen.dart';
import 'package:provider/provider.dart';

class WorldsMapScreen extends StatelessWidget {
  const WorldsMapScreen({super.key});

  // Reutilizamos la lógica de dibujo del avatar
  Widget _buildUserAvatar(Map<String, dynamic> equipped) {
    final hat = ItemCatalog.getItemById('hats', equipped['hats'] ?? '');
    final glass = ItemCatalog.getItemById('glasses', equipped['glasses'] ?? '');
    final shirt = ItemCatalog.getItemById('shirts', equipped['shirts'] ?? '');

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/robot_base.png', fit: BoxFit.contain),
          if (shirt != null)
            Image.asset(shirt['imagePath'], fit: BoxFit.contain),
          if (glass != null)
            Image.asset(glass['imagePath'], fit: BoxFit.contain),
          if (hat != null) Image.asset(hat['imagePath'], fit: BoxFit.contain),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final worlds = WorldsCatalog.worlds;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Mapa de Mundos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // CABECERA CON EL AVATAR HABLANDO
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              children: [
                _buildUserAvatar(userProvider.equipped),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      '¡Hola ${userProvider.name}! ¿Listo para salvar la galaxia resolviendo problemas?\nElige un mundo.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // LISTA DE MUNDOS
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: worlds.length,
              itemBuilder: (context, index) {
                final world = worlds[index];
                final int totalLevels = world['levels'].length;

                // AHORA ES REAL: Leemos cuántos niveles ha pasado de ESTE mundo específico
                final int completedLevels =
                    userProvider.worldProgress[world['id']] ?? 0;
                final double progress = totalLevels > 0
                    ? (completedLevels / totalLevels)
                    : 0.0;

                // --- NUEVA LÓGICA DE BLOQUEO ---
                bool isUnlocked = true;
                if (index > 0) {
                  final previousWorld = worlds[index - 1];
                  final int prevTotal = previousWorld['levels'].length;
                  final int prevCompleted =
                      userProvider.worldProgress[previousWorld['id']] ?? 0;

                  // Si el mundo anterior no está completado al 100%, se bloquea este
                  if (prevCompleted < prevTotal) {
                    isUnlocked = false;
                  }
                }

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: isUnlocked
                      ? 2
                      : 0, // Quitamos sombra si está bloqueado
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: isUnlocked
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelsScreen(
                                  worldData:
                                      world, // <-- Ahora solo pasamos los datos fijos del mundo
                                ),
                              ),
                            );
                          }
                        : () {
                            // Alerta si intenta ingresar a un mundo bloqueado
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  '🔒 Completa el mundo anterior para desbloquear',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.grey.shade800,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            );
                          },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isUnlocked
                              ? world['color'].withOpacity(0.3)
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                        color: isUnlocked
                            ? Colors.transparent
                            : Colors
                                  .grey
                                  .shade100, // Fondo grisáceo si está bloqueado
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: isUnlocked
                              ? world['color'].withOpacity(0.1)
                              : Colors.grey.shade200,
                          child: Icon(
                            isUnlocked ? world['icon'] : Icons.lock,
                            color: isUnlocked
                                ? world['color']
                                : Colors.grey.shade400,
                            size: 32,
                          ),
                        ),
                        title: Text(
                          world['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: isUnlocked
                                ? Colors.black87
                                : Colors.grey.shade500,
                          ),
                        ),

                        // --- AQUÍ ESTÁ EL CAMBIO: SUBTÍTULO CON BARRA DE PROGRESO ---
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isUnlocked
                                    ? world['subtitle']
                                    : 'Mundo bloqueado',
                                style: TextStyle(
                                  color: isUnlocked
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Textos encima de la barra (Ej: "3/7 niveles" y "42%")
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    isUnlocked
                                        ? '$completedLevels/$totalLevels niveles'
                                        : '0/$totalLevels niveles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: isUnlocked
                                          ? world['color']
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                  Text(
                                    isUnlocked
                                        ? '${(progress * 100).toInt()}%'
                                        : '0%',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isUnlocked
                                          ? Colors.grey
                                          : Colors.grey.shade400,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),

                              // La Barra de Progreso Visual
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: isUnlocked ? progress : 0.0,
                                  minHeight:
                                      8, // Un poco más gruesa para que resalte
                                  backgroundColor: Colors.grey.shade200,
                                  color: isUnlocked
                                      ? world['color']
                                      : Colors
                                            .grey
                                            .shade300, // Usa el color temático o gris
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isUnlocked
                                  ? Icons.play_circle_fill
                                  : Icons.lock_outline,
                              color: isUnlocked
                                  ? Colors.blueAccent
                                  : Colors.grey.shade400,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
