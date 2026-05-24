import 'package:flutter/material.dart';
import 'package:math_ia/core/constants/item_catalog.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Reutilizamos el helper del Avatar para que se vea exactamente como en el juego
  Widget _buildUserAvatar(Map<String, dynamic> equipped) {
    final hat = ItemCatalog.getItemById('hats', equipped['hats'] ?? '');
    final glass = ItemCatalog.getItemById('glasses', equipped['glasses'] ?? '');
    final shirt = ItemCatalog.getItemById('shirts', equipped['shirts'] ?? '');

    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3), width: 4),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/robot_base.png',
            fit: BoxFit.contain,
            width: 100,
          ),
          if (shirt != null)
            Image.asset(shirt['imagePath'], fit: BoxFit.contain, width: 100),
          if (glass != null)
            Image.asset(glass['imagePath'], fit: BoxFit.contain, width: 100),
          if (hat != null)
            Image.asset(hat['imagePath'], fit: BoxFit.contain, width: 100),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    // Calculamos el nivel si no tienes el getter directo
    int calculateLevel(int exp) {
      int lvl = 1;
      int expNeeded = 100;
      int tempExp = exp;
      while (tempExp >= expNeeded) {
        lvl++;
        tempExp -= expNeeded;
        expNeeded = (expNeeded * 1.5).toInt();
      }
      return lvl;
    }

    final level = calculateLevel(userProvider.exp);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Mi Perfil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // --- SECCIÓN 1: AVATAR Y NOMBRE ---
            _buildUserAvatar(userProvider.equipped),
            const SizedBox(height: 16),
            Text(
              userProvider.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Nivel $level',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // --- SECCIÓN 2: DATOS PERSONALES ---
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'DATOS DE LA CUENTA',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.blueAccent),
                    title: const Text(
                      'Nombre o Nickname',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    subtitle: Text(
                      userProvider.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.blueAccent),
                    title: const Text(
                      'Correo Electrónico',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    subtitle: Text(
                      userProvider.email,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- SECCIÓN 3: ESTADÍSTICAS DEL JUEGO ---
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ESTADÍSTICAS',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    Icons.star,
                    Colors.amber,
                    'Experiencia',
                    '${userProvider.exp} XP',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    Icons.monetization_on,
                    Colors.orange,
                    'Monedas',
                    '${userProvider.coins}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  // Modificamos el valor que se le envía a la tarjeta de Vidas
                  child: _buildStatCard(
                    Icons.favorite,
                    Colors.redAccent,
                    'Vidas',
                    userProvider.lives >= 5
                        ? '${userProvider.lives} (MÁX)'
                        : '${userProvider.lives} (${userProvider.timeUntilNextLifeFormatted})',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    Icons.assignment_turned_in,
                    Colors.green,
                    'Exámenes',
                    '${userProvider.examHistory.length}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper para construir los cuadritos de estadísticas
  Widget _buildStatCard(
    IconData icon,
    Color color,
    String title,
    String value,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
