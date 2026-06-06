import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GroupPerformanceChart extends StatelessWidget {
  final List<dynamic> students;

  const GroupPerformanceChart({Key? key, required this.students})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Si no hay estudiantes o solo hay 1, la gráfica grupal no tiene mucho sentido visual
    if (students.length < 2) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 300, // Altura fija para la gráfica
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
            'Comparativa de Nivel Adaptativo (IA)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10, // El nivel máximo de IA en el juego es 10
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => Colors.blueAccent,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${students[group.x]['name']}\nNivel ${rod.toY.toInt()}',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        // Mostramos solo la primera palabra del nombre del estudiante en el eje X
                        String fullName = students[value.toInt()]['name'];
                        String firstName = fullName.split(' ')[0];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            firstName,
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 2, // Muestra los números del eje Y de 2 en 2
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(color: Colors.grey),
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) =>
                      const FlLine(color: Colors.black12, strokeWidth: 1),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(
                  students.length,
                  (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: (students[index]['skill_level'] ?? 0).toDouble(),
                        color: Colors.purpleAccent,
                        width: 20,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
