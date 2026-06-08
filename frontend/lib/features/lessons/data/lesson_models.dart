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
  final String? conceptTag; // <-- NUEVO: Etiqueta del tema

  // --- NUEVO: Atributo para guardar la dificultad de la IA ---
  final int? difficulty;

  LessonSlide({
    required this.type,
    required this.title,
    required this.content,
    this.options,
    this.correctAnswerIndex,
    this.feedback,
    this.imagePath,
    this.icon,
    this.lottieUrl,
    this.conceptTag,
    this.difficulty,
  });
}
