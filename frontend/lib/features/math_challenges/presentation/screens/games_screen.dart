import 'package:flutter/material.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/auth/presentation/screens/login_screen.dart';
import 'package:math_ia/features/exams/presentation/providers/exams_provider.dart';
import 'package:math_ia/features/friends/presentation/providers/friends_provider.dart';
import 'package:math_ia/features/lessons/presentation/providers/lesson_provider.dart';
import 'package:math_ia/features/math_challenges/presentation/screens/worlds_map_screen.dart';
import 'package:math_ia/features/profile/presentation/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  void _logout(BuildContext context) {
    // 1. Limpiamos todos los datos en memoria para que no se filtren al siguiente usuario
    context.read<UserProvider>().clearData();
    context.read<ExamsProvider>().clearData();
    context.read<FriendsProvider>().clearData();
    context.read<LessonProvider>().clearData();

    // 2. Aquí, más adelante, puedes borrar el Token (JWT) guardado en el dispositivo.

    // 3. Navegación segura: Destruye el historial de pantallas y te lleva al Login
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  // --- FUNCIÓN PARA MOSTRAR EL POPUP DE JUEGOS ---
  // Importa la nueva pantalla que crearemos
  // import 'worlds_map_screen.dart';

  void _buildGamesPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Modos de Juego',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Botón Gigante de Aventura Principal
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // Cierra el popup
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorldsMapScreen(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.blue.shade800],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.map, size: 60, color: Colors.white),
                        SizedBox(height: 16),
                        Text(
                          'AVENTURA PRINCIPAL',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Explora los 6 mundos matemáticos',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Espacio para futuros minijuegos (ej. Duelos, Reto Diario)
                const Text(
                  'Más modos de juego próximamente...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // // --- WIDGET REUTILIZABLE PARA LAS TARJETAS DE JUEGO ---
  // Widget _buildGameCard(
  //   BuildContext context, {
  //   required String title,
  //   required IconData icon,
  //   required Color color,
  // }) {
  //   return InkWell(
  //     onTap: () {
  //       // Aquí agregarías la navegación hacia el juego seleccionado
  //       // Navigator.pop(context); // Cierra el popup primero
  //       // Navigator.push(...); // Navega al juego
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text('Iniciando $title...')));
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: color.withOpacity(0.1),
  //         borderRadius: BorderRadius.circular(15),
  //         border: Border.all(color: color.withOpacity(0.5), width: 2),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(icon, size: 40, color: color),
  //           const SizedBox(height: 8),
  //           Text(
  //             title,
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               color: color.withOpacity(0.8),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el usuario en tiempo real
    final user = context.watch<UserProvider>();

    // Calculamos el progreso exacto para la barra de experiencia
    int expNeeded = 100;
    int tempExp = user.exp;
    while (tempExp >= expNeeded) {
      tempExp -= expNeeded;
      expNeeded = (expNeeded * 1.5).toInt();
    }
    double expProgress = tempExp / expNeeded;

    return SafeArea(
      child: Column(
        children: [
          // 1. --- CABECERA DE ESTADÍSTICAS ---
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. IZQUIERDA: EL MENÚ DE TRES RAYAS
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, size: 30, color: Colors.black87),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  offset: const Offset(0, 40),
                  onSelected: (String value) {
                    if (value == 'profile') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    } else if (value == 'logout') {
                      _logout(context);
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'profile',
                          child: Row(
                            children: [
                              Icon(Icons.person, color: Colors.blueAccent),
                              SizedBox(width: 12),
                              Text(
                                'Ver perfil',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const PopupMenuDivider(),
                        const PopupMenuItem<String>(
                          value: 'logout',
                          child: Row(
                            children: [
                              Icon(Icons.logout, color: Colors.redAccent),
                              SizedBox(width: 12),
                              Text(
                                'Cerrar sesión',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                ),

                // 2. CENTRO: NOMBRE, NIVEL Y BARRA DE EXPERIENCIA
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                user.name, // <-- Quitamos el .toUpperCase()
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Si el nombre es muy largo, pone "..."
                              ),
                            ),
                            Text(
                              'Lvl ${user.level}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        // BARRA DE EXPERIENCIA CON TEXTO SUPERPUESTO
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: expProgress,
                                minHeight:
                                    14, // <-- La hicimos un poquito más gruesa para que quepa el texto
                                backgroundColor: Colors.grey.shade200,
                                color: Colors.blueAccent,
                              ),
                            ),
                            // Texto de Experiencia
                            Text(
                              '$tempExp / $expNeeded XP',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                // Pequeña sombra para que el texto resalte sobre el fondo gris y el azul
                                shadows: [
                                  Shadow(
                                    offset: Offset(0.5, 0.5),
                                    blurRadius: 2.0,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. DERECHA: ESTADÍSTICAS DEL USUARIO
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Monedas
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: Colors.amber,
                          size: 24,
                        ),
                        Text(
                          '${user.coins}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    // Vidas + Temporizador
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                              size: 24,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '${user.lives}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        if (user.lives < 5)
                          Text(
                            user.timeUntilNextLifeFormatted,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 2. --- ZONA CENTRAL (AVATAR Y BOTÓN DE JUGAR) ---
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Avatar del usuario (Icono gigante por ahora)
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 4),
                    ),
                    child: const Icon(
                      Icons.face_retouching_natural,
                      size: 100,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Botón Gigante "Jugar Ya"
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => _buildGamesPopup(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.green, // Color que llama a la acción
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'JUGAR YA',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
