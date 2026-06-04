import 'package:flutter/material.dart';
import 'lesson_models.dart';

class World4Lessons {
  static List<LessonSlide> getLesson(int levelIndex) {
    switch (levelIndex) {
      case 0:
        return _level1Factores;
      case 1:
        return _level2Multiplos;
      case 2:
        return _level3Divisibilidad;
      case 3:
        return _level4NumerosPrimos;
      case 4:
        return _level5Descomposicion;
      case 5:
        return _level6MCD;
      case 6:
        return _level7MCM;
      default:
        return _level1Factores;
    }
  }

  // ==========================================
  // NIVEL 1: FACTORES (0)
  // ==========================================
  static final List<LessonSlide> _level1Factores = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Caverna de los Primos',
      content:
          '¡Bienvenido al Mundo 4!\n\nAdéntrate en la mina profunda donde descubriremos de qué están hechos realmente los números. Empezaremos buscando sus "Factores".',
      icon: Icons.diamond,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es un Factor?',
      content:
          'Los factores son los números que multiplicas para obtener otro número.\n\nEjemplo: Para obtener 10, puedes multiplicar 2 x 5. Entonces, 2 y 5 son factores de 10. ¡También 1 y 10 son factores (1 x 10)!',
      icon: Icons.view_comfy,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_factor',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'identificar_factores',
    ),
  ];

  // ==========================================
  // NIVEL 2: MÚLTIPLOS (1)
  // ==========================================
  static final List<LessonSlide> _level2Multiplos = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Saltos Gigantes',
      content:
          'Si los factores son las piezas pequeñas que arman a un número, los múltiplos son los saltos gigantes que ese número da al multiplicarse.',
      icon: Icons.fast_forward,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es un Múltiplo?',
      content:
          'Un múltiplo es el resultado de multiplicar un número por cualquier número natural (1, 2, 3...).\n\nEjemplo: Los múltiplos de 3 son 3, 6, 9, 12, 15... ¡Es como contar de 3 en 3!',
      icon: Icons.format_list_numbered,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_multiplo',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'identificar_multiplos',
    ),
  ];

  // ==========================================
  // NIVEL 3: CRITERIOS DE DIVISIBILIDAD (2)
  // ==========================================
  static final List<LessonSlide> _level3Divisibilidad = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Magia de División',
      content:
          '¿Quieres saber si un número gigante se puede dividir exactamente sin tener que usar la calculadora? ¡Existen trucos secretos!',
      icon: Icons.auto_fix_high,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Trucos del 2, 3 y 5',
      content:
          '- Entre 2: Debe terminar en número par (0, 2, 4, 6, 8).\n- Entre 3: Si sumas sus dígitos, el resultado es múltiplo de 3 (Ej: 123 -> 1+2+3=6. ¡Se puede!).\n- Entre 5: Debe terminar en 0 o 5.',
      icon: Icons.rule,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'divisibilidad_2_3_5',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'divisibilidad_avanzada',
    ),
  ];

  // ==========================================
  // NIVEL 4: NÚMEROS PRIMOS (3)
  // ==========================================
  static final List<LessonSlide> _level4NumerosPrimos = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Las Gemas Puras',
      content:
          'En la caverna existen números especiales que no pueden ser rotos en pedazos más pequeños. Se llaman Números Primos.',
      icon: Icons.star,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Primos vs Compuestos',
      content:
          'Un NÚMERO PRIMO solo tiene dos factores: el 1 y él mismo. (Ej: 2, 3, 5, 7, 11).\n\nUn NÚMERO COMPUESTO tiene más factores, es decir, se puede romper. (Ej: 4 se rompe en 2x2. El 9 se rompe en 3x3).',
      icon: Icons.shield,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'identificar_primos',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'primos_vs_compuestos',
    ),
  ];

  // ==========================================
  // NIVEL 5: DESCOMPOSICIÓN (4)
  // ==========================================
  static final List<LessonSlide> _level5Descomposicion = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Minería Matemática',
      content:
          'Todo número compuesto está formado por la multiplicación de varios números primos. ¡Es hora de picar piedra y encontrarlos!',
      icon: Icons.hardware,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Árbol de Factores',
      content:
          'Para descomponer un número, divídelo entre números primos (2, 3, 5...) hasta que solo te queden primos.\n\nEjemplo el 12:\n12 / 2 = 6\n6 / 2 = 3\n¡Listo! El 12 está hecho de 2 x 2 x 3.',
      icon: Icons.account_tree,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'descomposicion_prima',
    ),
  ];

  // ==========================================
  // NIVEL 6: MÁXIMO COMÚN DIVISOR (MCD) (5)
  // ==========================================
  static final List<LessonSlide> _level6MCD = [
    LessonSlide(
      type: SlideType.intro,
      title: 'El Mayor Trozo',
      content:
          'Si tienes dos grupos distintos de objetos y quieres dividirlos en paquetes iguales lo más grandes posibles, usas el MCD.',
      icon: Icons.unfold_more,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Calculando el MCD',
      content:
          'El MCD es el número más grande que divide exactamente a dos o más números.\n\nEjemplo: Entre 12 y 16.\nFactores de 12: 1, 2, 3, 4, 6, 12.\nFactores de 16: 1, 2, 4, 8, 16.\nEl número mayor que se repite en ambos es el 4. ¡MCD = 4!',
      icon: Icons.join_inner,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_mcd',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'calcular_mcd',
    ),
  ];

  // ==========================================
  // NIVEL 7: MÍNIMO COMÚN MÚLTIPLO (mcm) (6)
  // ==========================================
  static final List<LessonSlide> _level7MCM = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Punto de Encuentro',
      content:
          'Si dos ranas dan saltos de diferentes tamaños, ¿en qué punto exacto volverán a caer juntas? ¡Eso es el mcm!',
      icon: Icons.call_merge,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Calculando el mcm',
      content:
          'El mcm es el número más pequeño (distinto de cero) que es múltiplo de dos o más números.\n\nEjemplo: Entre 4 y 6.\nMúltiplos de 4: 4, 8, 12, 16...\nMúltiplos de 6: 6, 12, 18...\nEl primer número donde se encuentran es el 12. ¡mcm = 12!',
      icon: Icons.timeline,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_mcm',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'calcular_mcm',
    ),
  ];
}
