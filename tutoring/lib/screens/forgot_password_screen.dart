import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tutor_auth_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _codeSent = false; // Controla si ya pasamos al paso 2
  bool _isLoading = false;

  void _requestCode() async {
    if (_emailController.text.trim().isEmpty) return;

    setState(() => _isLoading = true);
    final authProvider = Provider.of<TutorAuthProvider>(context, listen: false);
    bool success = await authProvider.sendRecoveryCode(
      _emailController.text.trim(),
    );
    setState(() => _isLoading = false);

    if (success) {
      setState(() => _codeSent = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Código enviado. Revisa la consola de tu backend.'),
          backgroundColor: Colors.blue,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al procesar la solicitud.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _executeReset() async {
    final code = _codeController.text.trim();
    final newPassword = _passwordController.text.trim();

    if (code.length < 6 || newPassword.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Completa los campos correctamente (Mín. 6 caracteres).',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    final authProvider = Provider.of<TutorAuthProvider>(context, listen: false);
    String? error = await authProvider.resetPassword(
      _emailController.text.trim(),
      code,
      newPassword,
    );
    setState(() => _isLoading = false);

    if (error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Contraseña cambiada con éxito!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); // Regresa al Login de inmediato
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_reset, size: 60, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Recuperar Contraseña',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // PASO 1: Ingresar Email
              TextField(
                controller: _emailController,
                enabled: !_codeSent,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              // PASO 2: Campos Condicionales (Aparecen solo al enviar el correo)
              if (_codeSent) ...[
                const SizedBox(height: 16),
                TextField(
                  controller: _codeController,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Código de 6 dígitos',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.pin),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Nueva Contraseña',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ],

              const SizedBox(height: 32),

              // BOTÓN DINÁMICO
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: _isLoading
                      ? null
                      : (_codeSent ? _executeReset : _requestCode),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          _codeSent ? 'Cambiar Contraseña' : 'Enviar Código',
                          style: const TextStyle(color: Colors.white),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Volver al Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
