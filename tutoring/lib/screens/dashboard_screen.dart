import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tutor_auth_provider.dart';
import '../providers/tutor_data_provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Cargar los datos tan pronto como la pantalla se inicie
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<TutorAuthProvider>(
        context,
        listen: false,
      );
      if (authProvider.tutorId != null) {
        Provider.of<TutorDataProvider>(
          context,
          listen: false,
        ).fetchDashboardData(authProvider.tutorId!);
      }
    });
  }

  // --- MODAL PARA INGRESAR EL CÓDIGO ---
  // En lib/screens/dashboard_screen.dart

  void _showLinkDialog(BuildContext context, int tutorId) {
    final emailController = TextEditingController(); // <-- NUEVO CONTROLADOR
    final codeController = TextEditingController();
    bool isLinking = false;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Vincular Estudiante'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Para proteger la privacidad del estudiante, ingresa su correo registrado y el código de 6 dígitos:',
                  ),
                  const SizedBox(height: 16),

                  // --- NUEVO CAMPO: CORREO ---
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo del Estudiante',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ---------------------------

                  // Campo existente: Código
                  TextField(
                    controller: codeController,
                    maxLength: 6,
                    textCapitalization: TextCapitalization.characters,
                    decoration: const InputDecoration(
                      labelText: 'Código de 6 dígitos',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: isLinking
                      ? null
                      : () async {
                          // Validamos que ambos campos estén llenos
                          if (codeController.text.trim().length < 6 ||
                              emailController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Por favor, ingresa el correo y un código válido.',
                                ),
                              ),
                            );
                            return;
                          }

                          setDialogState(() => isLinking = true);

                          final dataProvider = Provider.of<TutorDataProvider>(
                            context,
                            listen: false,
                          );

                          // <-- PASAMOS EL CORREO A LA FUNCIÓN
                          String? error = await dataProvider.linkStudent(
                            tutorId,
                            emailController.text.trim(),
                            codeController.text.trim(),
                          );

                          setDialogState(() => isLinking = false);

                          Navigator.pop(context); // Cerrar el diálogo

                          if (error == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  '¡Estudiante vinculado con éxito!',
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                  child: isLinking
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Vincular',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showUnlinkConfirmation(
    BuildContext context,
    int tutorId,
    int studentId,
    String studentName,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
              SizedBox(width: 10),
              Text('¿Desvincular estudiante?'),
            ],
          ),
          content: Text(
            '¿Estás seguro de que deseas dejar de supervisar a $studentName? El estudiante no perderá sus datos, pero ya no aparecerá en tu panel.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () async {
                final dataProvider = Provider.of<TutorDataProvider>(
                  context,
                  listen: false,
                );
                String? error = await dataProvider.unlinkStudent(
                  tutorId,
                  studentId,
                );

                Navigator.pop(context); // Cerrar cuadro de diálogo

                if (error == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Se desvinculó a $studentName correctamente.',
                      ),
                      backgroundColor: Colors.orange,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error), backgroundColor: Colors.red),
                  );
                }
              },
              child: const Text(
                'Sí, Desvincular',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<TutorAuthProvider>(context);
    final dataProvider = Provider.of<TutorDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Panel de Tutor: ${authProvider.tutorName}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar Sesión',
            onPressed: () {
              authProvider.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: dataProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildDashboardContent(
              context,
              dataProvider.students,
              authProvider.tutorId!,
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showLinkDialog(context, authProvider.tutorId!),
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Vincular Alumno',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDashboardContent(
    BuildContext context,
    List<dynamic> students,
    int tutorId,
  ) {
    if (students.isEmpty) {
      return const Center(
        child: Text(
          'Aún no supervisas a ningún estudiante.\nHaz clic en "Vincular Alumno" para empezar.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              400, // Hace que las tarjetas se adapten al tamaño del monitor
          childAspectRatio: 1.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- CABECERA ACTUALIZADA CON BOTÓN DE ELIMINAR ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bloque de información (Avatar + Nombre + Correo)
                      Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.blue.shade100,
                              child: const Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    student['name'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    student['email'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // NUEVO: BOTÓN DE DESVINCULACIÓN CON CONFIRMACIÓN
                      IconButton(
                        icon: const Icon(
                          Icons.person_remove_alt_1,
                          color: Colors.redAccent,
                        ),
                        tooltip: 'Desvincular Estudiante',
                        onPressed: () => _showUnlinkConfirmation(
                          context,
                          tutorId,
                          student['id'],
                          student['name'],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),

                  // Nivel de la Inteligencia Artificial
                  _buildStatRow(
                    Icons.psychology,
                    'Nivel Adaptativo (IA)',
                    'Nivel ${student['skill_level']} / 10',
                    Colors.purple,
                  ),
                  const SizedBox(height: 10),

                  // Puntos de Experiencia
                  _buildStatRow(
                    Icons.star,
                    'Experiencia',
                    '${student['exp']} XP',
                    Colors.orange,
                  ),
                  const SizedBox(height: 10),

                  // NUEVO: Nota del Último Examen
                  _buildStatRow(
                    Icons.assignment_turned_in,
                    'Último Examen',
                    '${student['last_exam_score']}',
                    student['last_exam_score'] == 'Sin intentos'
                        ? Colors.grey
                        : Colors.redAccent,
                  ),
                  const SizedBox(height: 10),

                  // NUEVO: Mundos Completados
                  _buildStatRow(
                    Icons.public,
                    'Mundos Completados',
                    '${student['worlds_completed']} / 6',
                    Colors.teal,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.black54)),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
