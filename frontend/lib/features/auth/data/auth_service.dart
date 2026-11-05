import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'dart:async'; // ¡Importante agregar esto!
import 'package:http/http.dart' as http;
import 'package:math_ia/core/config/api_config.dart';

class AuthService {
  // Reemplaza esto con la URL real de tu backend.
  // Si usas un emulador de Android y tu backend está en tu PC local, usa 'http://10.0.2.2:3000'
  final String _baseUrl = ApiConfig.baseUrl;

  // Instanciamos el almacenamiento seguro
  final _storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final url = Uri.parse('$_baseUrl/api/login');

      // Realizamos la petición POST al servidor
      final response = await http
          .post(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({'email': email, 'password': password}),
          )
          .timeout(const Duration(seconds: 10));

      // Verificamos si el servidor respondió con un código de éxito (200 OK)
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);

        // Aquí normalmente el backend devuelve un Token (JWT)
        // String token = decodedData['token'];

        final token =
            decodedData['token']; // Asumiendo que tu backend devuelve {"token": "..."}

        // ¡AQUÍ GUARDAMOS EL TOKEN EN EL DISPOSITIVO!
        await _storage.write(key: 'jwt_token', value: token);

        return {
          'success': true,
          'message': 'Login exitoso',
          'data': decodedData,
        };
      } else {
        // Manejamos errores (ej. 401 No Autorizado, 404 No Encontrado)
        final decodedError = jsonDecode(response.body);
        return {
          'success': false,
          'message': decodedError['message'] ?? 'Credenciales incorrectas',
        };
      }
    } catch (e) {
      // Manejamos errores de red (ej. sin internet, servidor caído)
      return {
        'success': false,
        'message': 'Error de conexión: Verifica tu internet o el servidor.',
      };
    }
  }

  Future<int?> verifyAndFetchSessionId() async {
    final token = await _storage.read(key: 'jwt_token');
    if (token == null) return null;

    try {
      final url = Uri.parse('$_baseUrl/api/me');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['user']['id'];
      } else {
        // Si responde 401 (token vencido o inválido), borramos el token
        await logout();
        return null;
      }
    } catch (e) {
      // Error de red
      return null;
    }
  }

  // Función para Cerrar Sesión (Log out)
  Future<void> logout() async {
    await _storage.delete(key: 'jwt_token'); // Borramos el token al salir
  }

  Future<Map<String, dynamic>> register(
    String email,
    String name,
    String password,
  ) async {
    try {
      final url = Uri.parse('$_baseUrl/api/register');

      final response = await http
          .post(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'email': email,
              'name': name,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);

        return {
          'success': true,
          'message':
              decodedData['message'] ??
              'Se envió el correo de confirmación con el código.',
        };
      } else {
        final decodedError = jsonDecode(response.body);
        return {
          'success': false,
          'message': decodedError['message'] ?? 'Error al registrar',
        };
      }
    } on TimeoutException catch (_) {
      return {
        'success': false,
        'message': 'El servidor tardó demasiado en responder.',
      };
    } catch (e) {
      return {'success': false, 'message': 'Error de conexión.'};
    }
  }

  // 2. NUEVA FUNCIÓN: Verificar el código OTP ingresado por el usuario
  Future<Map<String, dynamic>> verifyEmailCode(
    String email,
    String code,
  ) async {
    final url = Uri.parse('$_baseUrl/api/verify-email');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'code': code}),
      );

      if (response.statusCode == 200) {
        // Si el código es correcto, el backend devuelve el JWT final.
        // Lo guardamos de forma segura como en el logins.
        final decodedData = json.decode(response.body);
        final token = decodedData['token'];

        await _storage.write(key: 'jwt_token', value: token);
        return {
          'success': true,
          'message': decodedData['message'] ?? 'Registro exitoso',
          'data': decodedData, // Añadimos esta línea vital para atrapar el ID
        };
      } else {
        final decodedError = jsonDecode(response.body);
        return {
          'success': false,
          'message': decodedError['message'] ?? 'Error al verificar el código',
        };
      }
    } on TimeoutException catch (_) {
      return {
        'success': false,
        'message': 'El servidor tardó demasiado en responder.',
      };
    } catch (e) {
      return {'success': false, 'message': 'Error de conexión.'};
    }
  }

  // ==========================================
  // SOLICITAR CÓDIGO (Olvidé contraseña)
  // ==========================================
  Future<Map<String, dynamic>> forgotPassword(String email) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/api/forgot-password'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'email': email}),
          )
          .timeout(const Duration(seconds: 10));

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'message': decodedData['message']};
      } else {
        return {
          'success': false,
          'message': decodedData['message'] ?? 'Error al solicitar el código',
        };
      }
    } on TimeoutException catch (_) {
      return {
        'success': false,
        'message': 'El servidor tardó demasiado en responder.',
      };
    } catch (e) {
      return {'success': false, 'message': 'Error de conexión.'};
    }
  }

  // ==========================================
  // RESETEAR CONTRASEÑA (Validar código)
  // ==========================================
  Future<Map<String, dynamic>> resetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/api/reset-password'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'code': code,
              'new_password': newPassword,
            }),
          )
          .timeout(const Duration(seconds: 10));

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'message': decodedData['message']};
      } else {
        return {
          'success': false,
          'message': decodedData['message'] ?? 'Error al cambiar la contraseña',
        };
      }
    } on TimeoutException catch (_) {
      return {
        'success': false,
        'message': 'El servidor tardó demasiado en responder.',
      };
    } catch (e) {
      return {'success': false, 'message': 'Error de conexión.'};
    }
  }
}
