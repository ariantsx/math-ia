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
                final double progress = completedLevels / totalLevels;

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // En worlds_map_screen.dart, dentro de tu ListView.builder:
                  child: InkWell(
                    onTap: () {
                      // Pasamos tanto la información del mundo como los niveles completados
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevelsScreen(
                            worldData: world,
                            completedLevels:
                                completedLevels, // <-- NUEVO PARÁMETRO
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: world['color'].withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: world['color'].withOpacity(0.1),
                          child: Icon(
                            world['icon'],
                            color: world['color'],
                            size: 32,
                          ),
                        ),
                        title: Text(
                          world['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        // --- AQUÍ ESTÁ EL CAMBIO: SUBTÍTULO CON BARRA DE PROGRESO ---
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                world['subtitle'],
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              const SizedBox(height: 12),

                              // Textos encima de la barra (Ej: "3/7 niveles" y "42%")
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$completedLevels/$totalLevels niveles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: world['color'],
                                    ),
                                  ),
                                  Text(
                                    '${(progress * 100).toInt()}%',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
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
                                  value: progress,
                                  minHeight:
                                      8, // Un poco más gruesa para que resalte
                                  backgroundColor: Colors.grey.shade200,
                                  color:
                                      world['color'], // Usa el color temático del mundo
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_circle_fill,
                              color: Colors.blueAccent,
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
