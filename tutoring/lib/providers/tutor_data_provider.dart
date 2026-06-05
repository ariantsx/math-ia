import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TutorDataProvider with ChangeNotifier {
  List<dynamic> _students = [];
  bool _isLoading = false;

  List<dynamic> get students => _students;
  bool get isLoading => _isLoading;

  final String baseUrl = 'http://localhost:3000/api';

  // 1. Obtener la lista de alumnos
  Future<void> fetchDashboardData(int tutorId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('$baseUrl/tutor/$tutorId/dashboard');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _students = data['students'] ?? [];
      }
    } catch (e) {
      print('Error cargando el dashboard: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  // 2. Vincular un nuevo alumno con el código de 6 dígitos
  Future<String?> linkStudent(int tutorId, String code) async {
    try {
      final url = Uri.parse('$baseUrl/tutor/link');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'tutor_id': tutorId, 'code': code.toUpperCase()}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Recargamos la lista si fue exitoso
        await fetchDashboardData(tutorId);
        return null; // Null significa que no hubo error
      } else {
        return data['detail'] ??
            'Error desconocido'; // Retorna el mensaje de error del backend
      }
    } catch (e) {
      return 'Error de conexión con el servidor.';
    }
  }
}
