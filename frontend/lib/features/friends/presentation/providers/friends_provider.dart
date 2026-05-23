import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FriendsProvider extends ChangeNotifier {
  final String _baseUrl = 'http://localhost:3000/api';

  bool _isLoading = false;
  List<dynamic> _leaderboard = [];

  bool get isLoading => _isLoading;
  List<dynamic> get leaderboard => _leaderboard;

  // Cargar tabla de clasificación
  Future<void> fetchLeaderboard(int userId) async {
    _isLoading = true;
    // Usamos Future.microtask para no chocar con el build actual
    Future.microtask(() => notifyListeners());

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/users/$userId/leaderboard'),
      );
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        _leaderboard = decoded['data'];
      }
    } catch (e) {
      debugPrint("Error cargando amigos: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  // Agregar amigo
  Future<Map<String, dynamic>> addFriend(int userId, String email) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/users/$userId/add-friend'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'friend_email': email}),
      );
      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await fetchLeaderboard(userId); // Recargamos la lista
        return {'success': true, 'message': decoded['message']};
      }
      return {'success': false, 'message': decoded['message']};
    } catch (e) {
      return {'success': false, 'message': 'Error de red'};
    }
  }

  // Eliminar amigo
  Future<void> removeFriend(int userId, int friendId) async {
    try {
      final response = await http.delete(
        Uri.parse('$_baseUrl/users/$userId/remove-friend/$friendId'),
      );
      if (response.statusCode == 200) {
        await fetchLeaderboard(userId); // Recargamos la lista
      }
    } catch (e) {
      debugPrint("Error eliminando amigo: $e");
    }
  }

  // --- Lógica Matemática Compartida para calcular el nivel ---
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
}
