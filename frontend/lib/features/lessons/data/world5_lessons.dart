import 'package:flutter/material.dart';
import 'lesson_models.dart';

class World5Lessons {
  static List<LessonSlide> getLesson(int levelIndex) {
    switch (levelIndex) {
      case 0:
        return _level1PotenciasBasicas;
      case 1:
        return _level2Exponentes;
      case 2:
        return _level3PropiedadesPotencias;
      case 3:
        return _level4RaizCuadrada;
      case 4:
        return _level5RaizCubica;
      case 5:
        return _level6PropiedadesRaices;
      default:
        return _level1PotenciasBasicas;
    }
  }

  // ==========================================
  // NIVEL 1: POTENCIAS BÁSICAS (0)
  // ==========================================
  static final List<LessonSlide> _level1PotenciasBasicas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Cumbres de Poder',
      content:
          '¡Bienvenido al Mundo 5!\n\nPrepárate para escalar las Montañas de Exponentes, donde los números crecen a una velocidad vertiginosa.',
      icon: Icons.bolt,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es una Potencia?',
      content:
          'Una potencia es una forma rápida de escribir una multiplicación repetida.\n\nTiene dos partes:\n- Base (el número grande abajo): El número que se multiplica.\n- Exponente (el número pequeñito arriba): Cuántas veces multiplicas la base por sí misma.',
      icon: Icons.superscript,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_potencia',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Calculando Potencias',
      content:
          'Ejemplo: 3² (se lee "tres al cuadrado").\nSignifica 3 x 3 = 9.\n\n¡Cuidado! NO es 3 x 2. Es el número 3 multiplicado por sí mismo 2 veces.',
      icon: Icons.calculate,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'calcular_potencia',
    ),
  ];

  // ==========================================
  // NIVEL 2: EXPONENTES (1)
  // ==========================================
  static final List<LessonSlide> _level2Exponentes = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Reglas Especiales',
      content:
          'En lo alto de la montaña, el oxígeno cambia y los exponentes se comportan de forma extraña. ¡Aprende sus secretos!',
      icon: Icons.air,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Exponente Cero y Uno',
      content:
          'Regla del 1: Cualquier número elevado a la 1 es el mismo número (Ej: 5¹ = 5).\n\nRegla del 0: Cualquier número elevado a la 0 siempre, ¡SIEMPRE da 1! (Ej: 99º = 1, 5º = 1).',
      icon: Icons.exposure_zero,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'exponente_cero_uno',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Base 10',
      content:
          'Elevar el 10 es lo más fácil del mundo. El exponente te dice exactamente cuántos ceros debes poner después del 1.\n\nEjemplo: 10³ = 1,000 (Tres ceros).\n10⁵ = 100,000 (Cinco ceros).',
      icon: Icons.onetwothree,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'potencia_base_diez',
    ),
  ];

  // ==========================================
  // NIVEL 3: PROPIEDADES DE POTENCIAS (2)
  // ==========================================
  static final List<LessonSlide> _level3PropiedadesPotencias = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Atajos de Poder',
      content:
          '¿Para qué calcular números gigantes si podemos usar trucos? Las propiedades te permiten simplificar expresiones enormes.',
      icon: Icons.merge_type,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Multiplicar y Dividir Bases Iguales',
      content:
          'Si las bases son IDÉNTICAS:\n- Al multiplicar: ¡Sumas los exponentes! (2³ x 2² = 2⁵)\n- Al dividir: ¡Restas los exponentes! (5⁴ / 5² = 5²)',
      icon: Icons.compare_arrows,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'multiplicacion_potencias',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Potencia de una Potencia',
      content:
          '¿Qué pasa si elevas una potencia a otra potencia? (Ej: (3²)³).\n\n¡Fácil! Solo multiplicas los exponentes pequeños entre sí: 2 x 3 = 6. Resultado: 3⁶.',
      icon: Icons.layers,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'potencia_de_potencia',
    ),
  ];

  // ==========================================
  // NIVEL 4: RAÍZ CUADRADA (3)
  // ==========================================
  static final List<LessonSlide> _level4RaizCuadrada = [
    LessonSlide(
      type: SlideType.intro,
      title: 'El Descenso',
      content:
          'Todo lo que sube tiene que bajar. La raíz cuadrada es la operación inversa (el enemigo natural) de elevar al cuadrado (²).',
      icon: Icons.south_east,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es la Raíz Cuadrada (√)?',
      content:
          'Encontrar la raíz cuadrada de un número es buscar qué número, multiplicado por SÍ MISMO, te da ese resultado.\n\nEjemplo: √25. Piensa... ¿Qué número multiplicado por sí mismo da 25? ¡El 5! Porque 5 x 5 = 25.',
      icon: Icons.square,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_raiz_cuadrada',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'calcular_raiz_cuadrada',
    ),
  ];

  // ==========================================
  // NIVEL 5: RAÍZ CÚBICA (4)
  // ==========================================
  static final List<LessonSlide> _level5RaizCubica = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Dimensión 3D',
      content:
          'Ya sabes deshacer cuadrados. ¡Ahora vamos a deshacer cubos (³) en la tercera dimensión!',
      icon: Icons.view_in_ar,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es la Raíz Cúbica (∛)?',
      content:
          'Encontrar la raíz cúbica es buscar un número que, multiplicado por SÍ MISMO TRES VECES, te dé ese resultado.\n\nEjemplo: ∛8. Piensa... ¿Qué número usado 3 veces da 8? ¡El 2! Porque 2 x 2 x 2 = 8.',
      icon: Icons.polyline,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_raiz_cubica',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'calcular_raiz_cubica',
    ),
  ];

  // ==========================================
  // NIVEL 6: PROPIEDADES DE RAÍCES (5)
  // ==========================================
  static final List<LessonSlide> _level6PropiedadesRaices = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Magia Subterránea',
      content:
          'Al igual que las potencias, las raíces tienen atajos que te permiten separar problemas grandes en partes pequeñas.',
      icon: Icons.call_split,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Raíz de una Multiplicación',
      content:
          'Si tienes números multiplicándose dentro de una raíz grande, ¡puedes separarlos en dos raíces pequeñas!\n\nEjemplo: √(4 x 9) es lo mismo que √4 x √9.\n√(4) = 2. √(9) = 3.\nEntonces 2 x 3 = 6.',
      icon: Icons.auto_awesome,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'raiz_de_producto',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Raíz de una Fracción',
      content:
          '¡Funciona igual con las divisiones o fracciones! Puedes sacar la raíz del número de arriba y luego la del número de abajo por separado.\n\nEjemplo: √(16/25) se separa en √16 / √25. ¡El resultado es 4/5!',
      icon: Icons.vertical_align_center,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'raiz_de_fraccion',
    ),
  ];
}
