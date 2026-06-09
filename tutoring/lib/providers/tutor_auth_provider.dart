import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tutoring/core/config/api_config.dart';

class TutorAuthProvider with ChangeNotifier {
  int? _tutorId;
  String? _tutorName;

  int? get tutorId => _tutorId;
  String? get tutorName => _tutorName;
  bool get isAuthenticated => _tutorId != null;

  // URL de tu backend (Ajusta el puerto si es necesario)
  final String baseUrl = ApiConfig.baseUrl;

  Future<bool> login(String email, String password) async {
    try {
      // Nota: Debes asegurar que este endpoint exista en tu main.py
      final url = Uri.parse('$baseUrl/api/tutor/login');
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

  Future<String?> register(String name, String email, String password) async {
    try {
      final url = Uri.parse('$baseUrl/api/tutor/register');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // --- NUEVO: AUTO-LOGIN INMEDIATO ---
        // Guardamos las credenciales en la sesión activa
        _tutorId = data['id'];
        _tutorName = data['name'];
        notifyListeners();
        // -----------------------------------

        return null; // Null indica que no hubo errores
      } else {
        return data['detail'] ?? 'Error al registrar tutor';
      }
    } catch (e) {
      print('Error en registro de tutor: $e');
      return 'Error de conexión con el servidor.';
    }
  }

  // Paso 1: Enviar correo para solicitar código
  Future<bool> sendRecoveryCode(String email) async {
    try {
      final url = Uri.parse('$baseUrl/api/tutor/forgot-password');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error solicitando código: $e');
      return false;
    }
  }

  // Paso 2: Enviar código y nueva contraseña para el cambio real
  Future<String?> resetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    try {
      final url = Uri.parse('$baseUrl/api/tutor/reset-password');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'code': code,
          'new_password': newPassword,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return null; // Éxito
      } else {
        return data['detail'] ?? 'Error al restaurar la contraseña';
      }
    } catch (e) {
      return 'Error de conexión con el servidor.';
    }
  }

  void logout() {
    _tutorId = null;
    _tutorName = null;
    notifyListeners();
  }
}
