import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExperiencePieChart extends StatefulWidget {
  final List<dynamic> students;

  const ExperiencePieChart({Key? key, required this.students})
    : super(key: key);

  @override
  _ExperiencePieChartState createState() => _ExperiencePieChartState();
}

class _ExperiencePieChartState extends State<ExperiencePieChart> {
  int touchedIndex = -1;

  // Paleta de colores vibrantes para cada estudiante
  final List<Color> _colors = [
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.teal,
    Colors.deepPurpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.students.length < 2) return const SizedBox.shrink();

    return Container(
      height: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Distribución de Experiencia (XP)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              children: [
                // --- EL GRÁFICO DE PASTEL ---
                Expanded(
                  flex: 2,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!
                                .touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                      sections: List.generate(widget.students.length, (index) {
                        final isTouched = index == touchedIndex;
                        final double fontSize = isTouched
                            ? 18.0
                            : 0.0; // Oculta el texto si no tiene el mouse encima
                        final double radius = isTouched ? 65.0 : 55.0;

                        final student = widget.students[index];
                        // Extraemos la experiencia, si es 0 le damos un valor mínimo (0.1) para que al menos se dibuje una línea
                        final double exp = (student['exp'] ?? 0).toDouble();
                        final double chartValue = exp <= 0 ? 0.1 : exp;

                        return PieChartSectionData(
                          color: _colors[index % _colors.length],
                          value: chartValue,
                          title: isTouched ? '${exp.toInt()} XP' : '',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: const [
                              Shadow(color: Colors.black45, blurRadius: 2),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                // --- LA LEYENDA (Nombres de los estudiantes) ---
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(widget.students.length, (index) {
                      final student = widget.students[index];
                      final isTouched = index == touchedIndex;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            Container(
                              width: isTouched ? 14 : 12,
                              height: isTouched ? 14 : 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _colors[index % _colors.length],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                student['name'].split(
                                  ' ',
                                )[0], // Solo mostramos el primer nombre
                                style: TextStyle(
                                  fontWeight: isTouched
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: isTouched ? 15 : 13,
                                  color: isTouched
                                      ? Colors.black
                                      : Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
