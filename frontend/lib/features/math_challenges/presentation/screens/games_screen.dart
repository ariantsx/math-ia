import 'package:flutter/material.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/auth/presentation/screens/login_screen.dart';
import 'package:math_ia/features/exams/presentation/providers/exams_provider.dart';
import 'package:math_ia/features/friends/presentation/providers/friends_provider.dart';
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

  // --- WIDGET REUTILIZABLE PARA LAS TARJETAS DE JUEGO ---
  Widget _buildGameCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        // Aquí agregarías la navegación hacia el juego seleccionado
        // Navigator.pop(context); // Cierra el popup primero
        // Navigator.push(...); // Navega al juego
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Iniciando $title...')));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el usuario en tiempo real
    final user = context.watch<UserProvider>();

    return SafeArea(
      child: Column(
        children: [
          // 1. --- CABECERA DE ESTADÍSTICAS ---
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
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
              children: [
                // Bloque Izquierdo: Nick, Nivel y Experiencia
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Lvl ${user.level}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8),
                          // Barra de experiencia
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: user.currentLevelExp / user.maxLevelExp,
                                minHeight: 8,
                                backgroundColor: Colors.grey[300],
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${user.maxLevelExp}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                // Bloque Central: Monedas y Vidas
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${user.coins}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.favorite, color: Colors.red, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          '${user.lives}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),

                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, size: 30, color: Colors.black87),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  offset: const Offset(
                    0,
                    40,
                  ), // Desplaza el menú un poco hacia abajo para que no cubra el ícono
                  onSelected: (String value) {
                    if (value == 'profile') {
                      // Navegamos apilando la pantalla de Perfil
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    } else if (value == 'logout') {
                      // Flujo de Cerrar Sesión
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
                        const PopupMenuDivider(), // Una pequeña línea separadora
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
