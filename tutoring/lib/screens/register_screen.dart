import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tutor_auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  void _submitRegister() async {
    // 1. Validaciones básicas
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showError('Por favor, completa todos los campos.');
      return;
    }

    if (password != confirmPassword) {
      _showError('Las contraseñas no coinciden.');
      return;
    }

    if (password.length < 6) {
      _showError('La contraseña debe tener al menos 6 caracteres.');
      return;
    }

    // 2. Enviar datos al backend
    setState(() => _isLoading = true);

    final provider = Provider.of<TutorAuthProvider>(context, listen: false);
    String? errorMessage = await provider.register(name, email, password);

    setState(() => _isLoading = false);

    // 3. Manejar el resultado
    if (errorMessage == null) {
      // Éxito: Mostrar mensaje de bienvenida
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '¡Cuenta creada! Bienvenido a la supervisión de MathIA.',
          ),
          backgroundColor: Colors.green,
        ),
      );

      // CAMBIO AQUÍ: En lugar de Navigator.pop, vamos directo al panel
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/dashboard',
        (route) => false,
      );
    } else {
      // Error: Mostrar el mensaje que devolvió Python
      _showError(errorMessage);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // Para evitar overflow en pantallas más pequeñas
          child: Container(
            width:
                450, // Ligeramente más ancho que el login por los campos extra
            padding: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.person_add_alt_1,
                  size: 50,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Crear Cuenta de Tutor',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Regístrate para supervisar a tus estudiantes.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // --- CAMPOS DEL FORMULARIO ---
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre Completo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo Electrónico',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscurePassword,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar Contraseña',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 32),

                // --- BOTÓN DE REGISTRO ---
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submitRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Registrarse',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
                const SizedBox(height: 16),

                // --- NAVEGACIÓN DE VUELTA AL LOGIN ---
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    '¿Ya tienes cuenta? Inicia sesión aquí.',
                    style: TextStyle(
                      color: Colors.blue, // Azul MathIA resaltado
                      fontSize: 14,
                      fontWeight: FontWeight
                          .bold, // Negrita para darle intención de clic
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
