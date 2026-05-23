import 'package:flutter/material.dart';
import 'package:math_ia/core/constants/item_catalog.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../providers/friends_provider.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  void initState() {
    super.initState();
    // Cargamos la lista apenas se abre la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = context
          .read<UserProvider>()
          .id; // Asegúrate de tener un getter `id` en tu UserProvider
      context.read<FriendsProvider>().fetchLeaderboard(userId);
    });
  }

  // Popup para agregar amigos
  void _showAddFriendDialog(BuildContext context, int myUserId) {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Agregar Amigo', textAlign: TextAlign.center),
          content: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'ejemplo@correo.com',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                if (email.isEmpty) return;

                Navigator.pop(context); // Cerramos el popup

                final response = await context
                    .read<FriendsProvider>()
                    .addFriend(myUserId, email);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(response['message']),
                      backgroundColor: response['success']
                          ? Colors.green
                          : Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  // Mini-avatar para cada fila de la tabla
  Widget _buildMiniAvatar(Map<String, dynamic> equipped) {
    final hat = ItemCatalog.getItemById('hats', equipped['hats'] ?? '');
    final glass = ItemCatalog.getItemById('glasses', equipped['glasses'] ?? '');
    final shirt = ItemCatalog.getItemById('shirts', equipped['shirts'] ?? '');

    return SizedBox(
      width: 50,
      height: 50,
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
    final friendsProvider = context.watch<FriendsProvider>();
    final userProvider = context.watch<UserProvider>();
    final leaderboard = friendsProvider.leaderboard;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Ranking de Amigos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: friendsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : leaderboard.length <=
                1 // Si solo estás tú en la lista
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.group_add, size: 80, color: Colors.blueGrey),
                  const SizedBox(height: 16),
                  const Text(
                    '¡Aún estás jugando solo!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Agrega a tus amigos matemáticos\ny compite por el primer lugar.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () =>
                        _showAddFriendDialog(context, userProvider.id),
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'Agregar Amigos',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: leaderboard.length,
              itemBuilder: (context, index) {
                final player = leaderboard[index];
                final isMe = player['id'] == userProvider.id;
                final level = friendsProvider.calculateLevel(player['exp']);

                return Card(
                  elevation: isMe ? 4 : 1, // Resaltamos tu propia fila
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: isMe ? Colors.blueAccent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '#${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // --- EL AVATAR DIBUJADO EN TIEMPO REAL ---
                        // Si es mi usuario, leemos la ropa fresca del provider. Si es un amigo, usamos la de la base de datos.
                        _buildMiniAvatar(
                          isMe ? userProvider.equipped : player['equipped'],
                        ),
                      ],
                    ),
                    title: Text(
                      isMe ? 'Tú (${player['name']})' : player['name'],
                      style: TextStyle(
                        fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text('Lvl $level  •  ${player['exp']} XP'),
                    // Botón de eliminar (Tacho de basura rojo) solo si no eres tú
                    trailing: isMe
                        ? const Icon(Icons.star, color: Colors.amber)
                        : IconButton(
                            icon: const Icon(
                              Icons.person_remove,
                              color: Colors.redAccent,
                            ),
                            onPressed: () => friendsProvider.removeFriend(
                              userProvider.id,
                              player['id'],
                            ),
                          ),
                  ),
                );
              },
            ),
      // Botón flotante para agregar más amigos si ya tienes la lista llena
      floatingActionButton: leaderboard.length > 1
          ? FloatingActionButton(
              onPressed: () => _showAddFriendDialog(context, userProvider.id),
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
