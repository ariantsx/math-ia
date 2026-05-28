import 'package:flutter/material.dart';

enum SlideType { intro, teaching, exercise, quizSummary }

class LessonSlide {
  final SlideType type;
  final String title;
  final String content;
  final List<String>? options;
  final int? correctAnswerIndex;
  final String? feedback;

  // Apoyo visual
  final String? imagePath;
  final IconData? icon;
  final String? lottieUrl; // <-- NUEVO: Para animaciones Lottie

  LessonSlide({
    required this.type,
    required this.title,
    required this.content,
    this.options,
    this.correctAnswerIndex,
    this.feedback,
    this.imagePath,
    this.icon,
    this.lottieUrl, // <-- Lo añadimos al constructor
  });
}
