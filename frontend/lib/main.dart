import 'package:flutter/material.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:math_ia/features/exams/presentation/providers/exams_provider.dart';
import 'package:math_ia/features/friends/presentation/providers/friends_provider.dart';
import 'package:math_ia/features/home/presentation/providers/home_provider.dart';
import 'package:math_ia/features/home/presentation/screens/home_screen.dart';
import 'package:math_ia/features/lessons/presentation/providers/lesson_provider.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/auth/presentation/screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => FriendsProvider()),
        ChangeNotifierProvider(create: (_) => ExamsProvider()),
        ChangeNotifierProvider(create: (_) => LessonProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Función orquestadora que se ejecuta al abrir la app
  Future<Widget> _initializeApp(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // 1. Verificamos si el token es válido y obtenemos el ID
    final userId = await authProvider.verifyAndFetchSession();

    if (userId != null) {
      // 2. Si el token es válido, traemos toda la data del usuario a la memoria
      await userProvider.fetchUserData(userId);

      // 3. Todo un éxito, mandamos al alumno al Dashboard/Home
      return const HomeScreen();
    } else {
      // Si no hay token, expiró, o hubo un error 401, lo mandamos a loguearse
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math IA',
      // home: const LoginScreen(),
      home: FutureBuilder<Widget>(
        future: _initializeApp(context),
        builder: (context, snapshot) {
          // Mientras hace las peticiones a la API, mostramos una pantalla de carga
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // Cuando el Future termina, dibuja el Widget que retornó (HomeScreen o LoginScreen)
          if (snapshot.hasData) {
            return snapshot.data!;
          }

          // Fallback por seguridad
          return const LoginScreen();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
