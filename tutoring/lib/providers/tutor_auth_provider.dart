import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TutorAuthProvider with ChangeNotifier {
  int? _tutorId;
  String? _tutorName;

  int? get tutorId => _tutorId;
  String? get tutorName => _tutorName;
  bool get isAuthenticated => _tutorId != null;

  // URL de tu backend (Ajusta el puerto si es necesario)
  final String baseUrl = 'http://localhost:3000/api';

  Future<bool> login(String email, String password) async {
    try {
      // Nota: Debes asegurar que este endpoint exista en tu main.py
      final url = Uri.parse('$baseUrl/tutor/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _tutorId = data['id'];
        _tutorName = data['name'];
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      print('Error en login de tutor: $e');
      return false;
    }
  }

  void logout() {
    _tutorId = null;
    _tutorName = null;
    notifyListeners();
  }
}
