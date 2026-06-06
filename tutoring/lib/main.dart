import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutoring/screens/forgot_password_screen.dart';
import 'package:tutoring/screens/register_screen.dart';
import 'providers/tutor_auth_provider.dart';
import 'providers/tutor_data_provider.dart'; // <-- NUEVO
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart'; // <-- NUEVO

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TutorAuthProvider()),
        ChangeNotifierProvider(create: (_) => TutorDataProvider()), // <-- NUEVO
      ],
      child: const MathIATutorApp(),
    ),
  );
}

class MathIATutorApp extends StatelessWidget {
  const MathIATutorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MathIA Tutor Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/forgot-password': (context) =>
            ForgotPasswordScreen(), // <-- REGISTRADA
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
