import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutoring/widgets/experience_pie_chart.dart';
import 'package:tutoring/widgets/group_performance_chart.dart';
import 'package:tutoring/widgets/students_ranking_table.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección de Gráficas Grupales superiores
          Row(
            children: [
              Expanded(child: GroupPerformanceChart(students: students)),
              const SizedBox(width: 24),
              Expanded(child: ExperiencePieChart(students: students)),
            ],
          ),
          const SizedBox(height: 32),

          // Título de la sección
          const Text(
            'Ranking de Rendimiento (Últimas Notas)',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // --- LLAMADA AL NUEVO COMPONENTE TABLA MODULARIZADO ---
          StudentsRankingTable(students: students),
        ],
      ),
    );
  }
}
