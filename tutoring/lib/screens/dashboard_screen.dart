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
  void _showLinkDialog(BuildContext context, int tutorId) {
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
                    'Pídele al estudiante que genere un código desde su aplicación MathIA e ingrésalo aquí:',
                  ),
                  const SizedBox(height: 16),
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
                          if (codeController.text.trim().length < 6) return;

                          setDialogState(() => isLinking = true);

                          final dataProvider = Provider.of<TutorDataProvider>(
                            context,
                            listen: false,
                          );
                          String? error = await dataProvider.linkStudent(
                            tutorId,
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
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              400, // Hace que las tarjetas se adapten al tamaño del monitor
          childAspectRatio: 1.5,
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
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(Icons.person, color: Colors.blue),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          student['name'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  _buildStatRow(
                    Icons.timeline,
                    'Nivel Adaptativo (IA)',
                    '${student['skill_level']} / 10',
                    Colors.purple,
                  ),
                  const SizedBox(height: 10),
                  _buildStatRow(
                    Icons.star,
                    'Experiencia',
                    '${student['exp']} XP',
                    Colors.orange,
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
