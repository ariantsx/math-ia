enum SlideType { intro, teaching, exercise, quizSummary }

class LessonSlide {
  final SlideType type;
  final String title;
  final String content;

  // Solo para ejercicios/cuestionarios
  final List<String>? options;
  final int? correctAnswerIndex;

  LessonSlide({
    required this.type,
    required this.title,
    required this.content,
    this.options,
    this.correctAnswerIndex,
  });
}
