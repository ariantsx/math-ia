import 'package:flutter/material.dart';
import 'package:math_ia/core/constants/item_catalog.dart';
import 'package:math_ia/core/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../providers/exams_provider.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final examProvider = context.watch<ExamsProvider>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Evaluación Continua',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      // Cambiamos la vista dependiendo del estado del examen
      body: _buildCurrentView(context, examProvider),
    );
  }

  Widget _buildCurrentView(BuildContext context, ExamsProvider provider) {
    switch (provider.currentState) {
      case ExamState.intro:
        return _buildIntro(context, provider);
      case ExamState.taking:
        return _buildTakingExam(context, provider);
      case ExamState.summary:
        return _buildSummary(context, provider);
      case ExamState.details:
        return _buildDetails(context, provider);
    }
  }

  // ==========================================
  // VISTA 1: INTRODUCCIÓN (FLUJO UNIFICADO)
  // ==========================================
  Widget _buildIntro(BuildContext context, ExamsProvider provider) {
    final userProvider = context.read<UserProvider>();
    final userId = userProvider.id;
    final history = userProvider.examHistory;

    // Evaluamos si tenemos información para mostrar la tarjeta
    final bool hasRecentExam = provider.lastResult != null;
    final bool hasHistory = history.isNotEmpty;
    final bool showResultCard = hasRecentExam || hasHistory;

    // Preparamos los textos de la nota dependiendo de dónde viene el dato
    String displayGrade = '';
    String displayScore = '';

    if (hasRecentExam) {
      displayGrade = provider.lastResult!.grade;
      displayScore = provider.lastResult!.score.toString();
    } else if (hasHistory) {
      displayGrade = history.last['grade'].toString();
      displayScore = history.last['score'].toString();
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.assignment, size: 100, color: Colors.blueAccent),
            const SizedBox(height: 24),
            const Text(
              '¿Estás listo para el reto?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Este examen consta de 20 preguntas de aritmética. Tendrás exactamente 30 segundos para resolver cada una. No puedes retroceder.\n\nDemuestra lo que has aprendido.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            // --- NUEVO: Control Antifraude de Intento Único ---
            userProvider.examHistory.isNotEmpty ||
                    provider.hasCompletedExamLocally
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.verified_user, color: Colors.green.shade700),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Ya has rendido este examen. Tu calificación está guardada en tu perfil y el tutor ya puede auditarla.',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    onPressed: () => provider.startExam(userId),
                    child: const Text(
                      'Comenzar Examen',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            const SizedBox(height: 24),

            // TARJETA CELESTE UNIFICADA
            if (showResultCard)
              InkWell(
                onTap: () {
                  if (hasRecentExam) {
                    // Si acaba de terminarlo, el resultado ya está en memoria
                    provider.changeState(ExamState.summary);
                  } else {
                    // Si viene de iniciar sesión, lo reconstruimos
                    provider.loadResultFromHistory(history.last);
                  }
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blueAccent.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Último Examen',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Nota: $displayGrade ($displayScore/20)',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blueAccent,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // VISTA 2: EXAMEN EN CURSO
  // ==========================================
  Widget _buildTakingExam(BuildContext context, ExamsProvider provider) {
    final question = provider.currentQuestion;
    final progress = (provider.currentQuestionIndex + 1) / 20;
    // En _buildTakingExam, al presionar una opción:
    final userId = context.read<UserProvider>().id;

    // Color del reloj de arena: Rojo si quedan menos de 10 segundos
    final timerColor = provider.timeLeft <= 10 ? Colors.red : Colors.blueAccent;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Barra superior (Progreso y Tiempo)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pregunta ${provider.currentQuestionIndex + 1}/20',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.timer, color: timerColor),
                  const SizedBox(width: 4),
                  Text(
                    '${provider.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: timerColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 40),

          // Enunciado
          Text(
            question.text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),

          // Opciones (4 Botones)
          ...List.generate(question.options.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ElevatedButton(
                onPressed: () => provider.submitAnswer(
                  index,
                  userId,
                ), // Le pasamos el index y el userId
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  elevation: 1,
                ),
                child: Text(
                  question.options[index],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  // ==========================================
  // VISTA 3: RESUMEN (CALIFICACIÓN Y AVATAR)
  // ==========================================
  Widget _buildSummary(BuildContext context, ExamsProvider provider) {
    final result = provider.lastResult!;
    final userProvider = context.read<UserProvider>();

    // Asignamos colores según la nota peruana
    Color gradeColor;
    if (result.grade == 'AD')
      gradeColor = Colors.green;
    else if (result.grade == 'A')
      gradeColor = Colors.blue;
    else if (result.grade == 'B')
      gradeColor = Colors.orange;
    else
      gradeColor = Colors.red;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '¡Examen Finalizado!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Avatar del usuario leyendo del UserProvider
          _buildUserAvatar(userProvider.equipped),

          const SizedBox(height: 24),
          Text(
            'Tu calificación MINEDU',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          Text(
            result.grade,
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: gradeColor,
            ),
          ),
          Text(
            '(${result.score}/20 correctas)',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () => provider.changeState(ExamState.intro),
                icon: const Icon(Icons.home),
                label: const Text('Finalizar'),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () => provider.changeState(ExamState.details),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.list_alt),
                label: const Text('Ver Errores'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================
  // VISTA 4: DETALLES (RESPUESTAS CORRECTAS VS INCORRECTAS)
  // ==========================================
  Widget _buildDetails(BuildContext context, ExamsProvider provider) {
    final history = provider.lastResult!.questions;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => provider.changeState(ExamState.summary),
              ),
              const Text(
                'Revisión del Examen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: history.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final q = history[index];
              final isCorrect = q.selectedAnswerIndex == q.correctAnswerIndex;
              final skipped = q.selectedAnswerIndex == null;

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: isCorrect
                        ? Colors.green.shade300
                        : Colors.red.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}. ${q.text}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (skipped)
                        const Text(
                          '❌ No respondiste a tiempo.',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else if (isCorrect)
                        Text(
                          '✅ Tu respuesta: ${q.options[q.selectedAnswerIndex!]}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else ...[
                        Text(
                          '❌ Tu respuesta: ${q.options[q.selectedAnswerIndex!]}',
                          style: const TextStyle(color: Colors.red),
                        ),
                        Text(
                          '✅ Respuesta correcta: ${q.options[q.correctAnswerIndex]}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Helper para dibujar el avatar del usuario
  Widget _buildUserAvatar(Map<String, dynamic> equipped) {
    final hat = ItemCatalog.getItemById('hats', equipped['hats'] ?? '');
    final glass = ItemCatalog.getItemById('glasses', equipped['glasses'] ?? '');
    final shirt = ItemCatalog.getItemById('shirts', equipped['shirts'] ?? '');

    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/robot_base.png',
            fit: BoxFit.contain,
            width: 90,
          ),
          if (shirt != null)
            Image.asset(shirt['imagePath'], fit: BoxFit.contain, width: 90),
          if (glass != null)
            Image.asset(glass['imagePath'], fit: BoxFit.contain, width: 90),
          if (hat != null)
            Image.asset(hat['imagePath'], fit: BoxFit.contain, width: 90),
        ],
      ),
    );
  }
}
