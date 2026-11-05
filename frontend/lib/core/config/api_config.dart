import 'package:flutter/foundation.dart';

class ApiConfig {
  // Leemos la URL desde las variables de entorno de compilación.
  // Si no se pasa ninguna, por defecto apuntará al localhost para desarrollo.
  // static const String baseUrl = String.fromEnvironment(
  //   'API_URL',
  //   defaultValue:
  //       'http://localhost:3000', // URL estándar para el emulador de Android
  // );
  static String get baseUrl {
    const envUrl = String.fromEnvironment('API_URL');

    if (envUrl.isNotEmpty) {
      return envUrl;
    }

    if (kIsWeb) {
      return 'http://localhost:3000';
    }

    return 'http://10.0.2.2:3000';
  }
}
