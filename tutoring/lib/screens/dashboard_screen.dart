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

  void _showFailedExercisesDialog(
    BuildContext context,
    String studentName,
    List<dynamic> failedExercises,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                failedExercises.isEmpty ? Icons.verified_user : Icons.analytics,
                color: failedExercises.isEmpty
                    ? Colors.green
                    : Colors.redAccent,
              ),
              const SizedBox(width: 12),
              Text('Historial de Prácticas: $studentName'),
            ],
          ),
          content: SizedBox(
            width: 600, // Ancho cómodo para lectura web
            height: 450, // Altura fija con scroll interno seguro
            child: failedExercises.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.emoji_events_outlined,
                          size: 60,
                          color: Colors.green,
                        ),
                        SizedBox(height: 16),
                        Text(
                          '¡Excelente rendimiento!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Este estudiante no tiene errores registrados en sus lecciones actuales.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: failedExercises.length,
                    itemBuilder: (context, index) {
                      final exercise = failedExercises[index];
                      // Formateamos las etiquetas conceptuales para que se vean más amigables
                      String concept = (exercise['concept_tag'] ?? 'General')
                          .toString()
                          .replaceAll('_', ' ')
                          .toUpperCase();

                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        color: Colors.red.shade50.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red.shade100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Cabecera: Identificador del mundo y Tag conceptual
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent.shade100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'MUNDO: ${(exercise['world_id'] ?? '').toString().toUpperCase()}',
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    concept,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // Pregunta fallada
                              const Text(
                                'Ejercicio planteado:',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                exercise['question_text'] ?? 'Sin enunciado.',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              const Divider(height: 24),

                              // Feedback Pedagógico de la IA
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.lightbulb_outline,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Guía de reforzamiento recomendada:',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          exercise['feedback'] ??
                                              'No hay sugerencias específicas de repaso para este ítem.',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade800,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cerrar Historial',
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
