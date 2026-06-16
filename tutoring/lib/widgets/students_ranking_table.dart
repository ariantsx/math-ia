import 'package:flutter/material.dart';

class StudentsRankingTable extends StatelessWidget {
  final List<dynamic> students;

  const StudentsRankingTable({Key? key, required this.students})
    : super(key: key);

  // --- POPUP: FICHA PEDAGÓGICA INTEGRAL DEL ESTUDIANTE ---
  void _showStudentDetailsPopup(
    BuildContext context,
    Map<String, dynamic> student,
  ) {
    final failedExercises = student['failed_exercises'] as List? ?? [];
    final scoreStr = student['last_exam_score'] ?? 'Sin intentos';

    Color scoreColor = Colors.grey;
    if (scoreStr != 'Sin intentos') {
      try {
        double numScore = double.parse(scoreStr.split('/')[0]);
        scoreColor = numScore >= 11
            ? Colors.green.shade700
            : Colors.red.shade700;
      } catch (_) {}
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.school, color: Colors.blue),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student['name'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        student['email'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          content: SizedBox(
            width: 750, // Popup ancho premium estilo Web Desktop
            height: 500,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- PANEL IZQUIERDO: MÉTRICAS Y GAMIFICACIÓN ---
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // Card 1: Estado del Nivel Adaptativo IA
                      _buildMetricCard(
                        Icons.psychology,
                        'Nivel de Habilidad IA',
                        'Nivel ${student['skill_level'] ?? 1}',
                        Colors.purple,
                        Colors.purple.shade50,
                      ),
                      const SizedBox(height: 12),
                      // Card 2: Puntos de Experiencia Totales
                      _buildMetricCard(
                        Icons.bolt,
                        'Experiencia Acumulada',
                        '${student['exp'] ?? 0} XP',
                        Colors.orange,
                        Colors.orange.shade50,
                      ),
                      const SizedBox(height: 12),
                      // Card 3: Mundos Completados
                      _buildMetricCard(
                        Icons.public,
                        'Mundos Completados',
                        '${student['worlds_completed'] ?? 0} / 3',
                        Colors.teal,
                        Colors.teal.shade50,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 24),

                // --- PANEL DERECHO: RENDIMIENTO Y EXÁMENES / ERRORES ---
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tarjeta de Estado del Examen
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: scoreColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: scoreColor.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.assignment_turned_in_outlined,
                              color: scoreColor,
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Calificación Último Examen',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  scoreStr,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: scoreColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Historial de fallas dinámico interno
                      const Text(
                        'Historial de Alertas de Aprendizaje',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Expanded(
                        child: failedExercises.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      size: 48,
                                      color: Colors.green.shade400,
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Excelente ritmo, sin fallas críticas.',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: failedExercises.length,
                                itemBuilder: (context, idx) {
                                  final ex = failedExercises[idx];
                                  String concept =
                                      (ex['concept_tag'] ?? 'General')
                                          .toString()
                                          .replaceAll('_', ' ')
                                          .toUpperCase();
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    color: Colors.red.shade50.withOpacity(0.4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: Colors.red.shade100,
                                      ),
                                    ),
                                    child: ExpansionTile(
                                      title: Text(
                                        ex['question_text'] ?? 'Sin enunciado.',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        'TEMA: $concept',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.red.shade700,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.lightbulb,
                                                color: Colors.amber,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 6),
                                              Expanded(
                                                child: Text(
                                                  ex['feedback'] ??
                                                      'Repasar este tema.',
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper Widget para construir las tarjetas métricas del panel izquierdo
  Widget _buildMetricCard(
    IconData icon,
    String title,
    String value,
    Color color,
    Color bgColor,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: color.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // --- LÓGICA DE ORDENAMIENTO (De mayor a menor) ---
    List<dynamic> sortedStudents = List.from(students);
    sortedStudents.sort((a, b) {
      double parseScore(String? scoreStr) {
        if (scoreStr == null || scoreStr == 'Sin intentos') return -1.0;
        try {
          return double.parse(scoreStr.split('/')[0]);
        } catch (_) {
          return -1.0;
        }
      }

      double scoreA = parseScore(a['last_exam_score']);
      double scoreB = parseScore(b['last_exam_score']);
      return scoreB.compareTo(scoreA);
    });

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.grey.shade200),
        child: DataTable(
          showCheckboxColumn: false,
          headingRowColor: MaterialStateProperty.all(Colors.blue.shade50),
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 15,
          ),
          dataRowMinHeight: 55,
          dataRowMaxHeight: 60,
          columns: const [
            DataColumn(
              label: Text('#', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataColumn(label: Text('Estudiante')),
            DataColumn(label: Text('Correo Electrónico')),
            DataColumn(label: Text('Nivel IA')),
            DataColumn(
              label: Text(
                'Último Examen',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(label: Text('Acciones')),
          ],
          rows: List.generate(sortedStudents.length, (index) {
            final student = sortedStudents[index];
            final scoreStr = student['last_exam_score'] ?? 'Sin intentos';

            Color scoreColor = Colors.grey;
            if (scoreStr != 'Sin intentos') {
              try {
                double numScore = double.parse(scoreStr.split('/')[0]);
                scoreColor = numScore >= 11
                    ? Colors.green.shade700
                    : Colors.red.shade700;
              } catch (_) {}
            }

            return DataRow(
              onSelectChanged: (bool? selected) {
                if (selected == true) {
                  // Desplegamos el nuevo popup con la ficha detallada del alumno
                  _showStudentDetailsPopup(context, student);
                }
              },
              cells: [
                DataCell(
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: index == 0
                        ? Colors.amber
                        : (index == 1
                              ? Colors.grey.shade400
                              : (index == 2
                                    ? Colors.orange.shade300
                                    : Colors.blue.shade100)),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: index <= 2 ? Colors.white : Colors.blue.shade800,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(
                          Icons.person,
                          size: 18,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        student['name'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                DataCell(
                  Text(
                    student['email'],
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Nivel ${student['skill_level'] ?? 1}',
                      style: TextStyle(
                        color: Colors.purple.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: scoreColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      scoreStr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: scoreColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  TextButton.icon(
                    onPressed: () => _showFailedExercisesDialog(
                      context,
                      student['name'],
                      student['failed_exercises'] ?? [],
                    ),
                    icon: Icon(
                      (student['failed_exercises'] as List).isEmpty
                          ? Icons.check_circle_outline
                          : Icons.assignment_late_outlined,
                      size: 18,
                    ),
                    label: Text(
                      (student['failed_exercises'] as List).isEmpty
                          ? 'Verificar'
                          : 'Ver Errores',
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          (student['failed_exercises'] as List).isEmpty
                          ? Colors.green
                          : Colors.redAccent,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  // El cuadro de diálogo flotante se queda viviendo dentro del widget de la tabla
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
            width: 600,
            height: 450,
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.lightbulb_outline,
                                    color: Colors.amber,
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
                                            color: Colors.amber,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          exercise['feedback'] ??
                                              'No hay sugerencias específicas de repaso.',
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
}
