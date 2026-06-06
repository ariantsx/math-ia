import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tutor_auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _submitLogin() async {
    setState(() => _isLoading = true);

    final provider = Provider.of<TutorAuthProvider>(context, listen: false);
    bool success = await provider.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (success) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Credenciales incorrectas. Verifica tu email y contraseña.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width:
              400, // Ancho fijo para que no se deforme en monitores ultra anchos
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          // ... dentro de lib/screens/login_screen.dart -> build -> Container ...
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.analytics, size: 60, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'MathIA Supervisión',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              // Campo: Correo
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),

              // Campo: Contraseña
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 24,
              ), // Quitamos el Align que tiraba el texto a la derecha
              // Botón Principal: Ingresar
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitLogin,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Ingresar al Panel',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
              ),
              const SizedBox(
                height: 24,
              ), // Espacio de separación antes de los enlaces
              // 1. Enlace: ¿Olvidaste tu contraseña? (Centrado y tono medio Gris)
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/forgot-password'),
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Colors.grey.shade600, // Tono medio gris impecable
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 8), // Separación corta entre enlaces
              // 2. Enlace: Registrarse (Centrado y color Azul)
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text(
                  '¿No tienes cuenta? Regístrate como Tutor.',
                  style: TextStyle(
                    color: Colors.blue, // Azul MathIA resaltado
                    fontSize: 14,
                    fontWeight:
                        FontWeight.bold, // Negrita para darle intención de clic
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
