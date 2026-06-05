import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/tutor_auth_provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TutorAuthProvider())],
      child: const MathIATutorApp(),
    ),
  );
}

class MathIATutorApp extends StatelessWidget {
  const MathIATutorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MathIA Tutor Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor:
            Colors.grey[100], // Fondo gris claro para la web
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        // '/dashboard': (context) => DashboardScreen(), // La crearemos en el siguiente paso
      },
    );
  }
}
