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
  // Tags: "concepto_potencia", "calcular_potencia"
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
          'Una potencia es una forma rápida de escribir una multiplicación repetida del mismo número.\n\nTiene dos partes:\n• Base (el número grande): El número que se multiplica.\n• Exponente (el número pequeño arriba): Cuántas veces se multiplica la base.',
      icon: Icons.rocket_launch,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'En la potencia 5², ¿cuál es la base y cuál es el exponente?',
      options: [
        'Base 5, Exponente 2',
        'Base 2, Exponente 5',
        'Ambos son 5',
        'Ambos son 2',
      ],
      correctAnswerIndex: 0,
      feedback:
          'El número grande abajo (5) es la base, y el pequeño arriba (2) es el exponente.',
      conceptTag: 'concepto_potencia',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Calculando Potencias',
      content:
          'Para calcular, multiplicas la base por sí misma tantas veces como diga el exponente.\n\nEjemplo: 3² (se lee "tres al cuadrado") no es 3x2. ¡Es 3 x 3 = 9!\nEjemplo: 2³ (se lee "dos al cubo") es 2 x 2 x 2 = 8.',
      icon: Icons.calculate,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Si quieres calcular 4², ¿qué multiplicación debes hacer?',
      options: ['4 x 2', '4 x 4', '2 x 2', '4 + 4'],
      correctAnswerIndex: 1,
      feedback:
          'El exponente 2 indica que debes multiplicar el 4 por sí mismo dos veces: 4 x 4.',
      conceptTag: 'calcular_potencia',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Potencias Básicas',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula el valor de 3²:',
      options: ['9', '6', '3', '27'],
      correctAnswerIndex: 0,
      feedback: '3² significa 3 x 3, lo cual da 9.',
      conceptTag: 'calcular_potencia',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Conceptualmente, ¿qué representa el exponente en una potencia?',
      options: [
        'Cuántas veces se multiplica la base',
        'El número que divide',
        'El resultado de la suma',
        'La mitad de la base',
      ],
      correctAnswerIndex: 0,
      feedback:
          'El exponente (el número pequeño) nos dice cuántas veces la base se multiplica por sí misma.',
      conceptTag: 'concepto_potencia',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula el valor de 2³ (dos al cubo):',
      options: ['8', '6', '12', '4'],
      correctAnswerIndex: 0,
      feedback: '2³ significa 2 x 2 x 2. (2x2=4 y 4x2=8).',
      conceptTag: 'calcular_potencia',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'En la expresión 10⁴, ¿quién es la base?',
      options: ['10', '4', '40', '1000'],
      correctAnswerIndex: 0,
      feedback:
          'La base siempre es el número más grande en tamaño, en este caso el 10.',
      conceptTag: 'concepto_potencia',
    ),
  ];

  // ==========================================
  // NIVEL 2: REGLAS DE EXPONENTES (1)
  // Tags: "potencia_base_diez", "exponente_cero_uno"
  // ==========================================
  static final List<LessonSlide> _level2Exponentes = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Trucos y Reglas Mágicas',
      content:
          'En el mundo de las potencias hay atajos increíbles que te ahorrarán horas de cálculo.',
      icon: Icons.auto_awesome,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Exponente Cero y Uno',
      content:
          'Regla del Uno: Cualquier número elevado a 1 es el mismo número. (Ej: 8¹ = 8).\n\nRegla del Cero: Cualquier número elevado a 0 SIEMPRE es igual a 1. ¡Sin importar qué tan grande sea la base! (Ej: 999º = 1).',
      icon: Icons.looks_one,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Cuánto es 1000 elevado a la potencia 0?',
      options: ['1', '0', '1000', '10'],
      correctAnswerIndex: 0,
      feedback:
          'Todo número (excepto el mismo cero) elevado a 0 siempre da como resultado 1.',
      conceptTag: 'exponente_cero_uno',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Base Diez',
      content:
          'Las potencias de base 10 son las más fáciles del universo.\n\nEl exponente simplemente te dice cuántos ceros debes poner después del 1.\nEjemplo: 10² = 100 (dos ceros).\nEjemplo: 10³ = 1000 (tres ceros).',
      icon: Icons.speed,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Siguiendo la regla de los ceros, ¿cuánto es 10⁴?',
      options: ['10000', '40', '1000', '100000'],
      correctAnswerIndex: 0,
      feedback:
          'El exponente es 4, así que ponemos un 1 seguido de cuatro ceros: 10,000.',
      conceptTag: 'potencia_base_diez',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Reglas',
      content: 'Aplica las reglas mágicas en estos 4 retos.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula el valor de 5º:',
      options: ['1', '5', '0', '50'],
      correctAnswerIndex: 0,
      feedback: 'Cualquier número elevado a cero da 1.',
      conceptTag: 'exponente_cero_uno',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: '¿A qué equivale 10⁵?',
      options: ['100000', '50', '10000', '1000000'],
      correctAnswerIndex: 0,
      feedback:
          'Base 10 elevado a 5 significa escribir el número 1 seguido de cinco ceros (100,000).',
      conceptTag: 'potencia_base_diez',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula el valor de 45¹:',
      options: ['45', '1', '450', '0'],
      correctAnswerIndex: 0,
      feedback: 'Todo número elevado a uno se mantiene exactamente igual (45).',
      conceptTag: 'exponente_cero_uno',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Si escribes el número 1000 como una potencia de base 10, ¿cuál sería?',
      options: ['10³', '10²', '10⁴', '3¹⁰'],
      correctAnswerIndex: 0,
      feedback: 'Como 1000 tiene tres ceros, equivale a 10³.',
      conceptTag: 'potencia_base_diez',
    ),
  ];

  // ==========================================
  // NIVEL 3: PROPIEDADES DE POTENCIAS (2)
  // Tags: "potencia_de_potencia", "multiplicacion_potencias"
  // ==========================================
  static final List<LessonSlide> _level3PropiedadesPotencias = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Propiedades Avanzadas',
      content:
          'Cuando las potencias se juntan y operan entre sí, ocurren fusiones asombrosas.',
      icon: Icons.call_merge,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Multiplicación de Potencias',
      content:
          'Si multiplicas dos potencias que tienen la MISMA BASE, solo tienes que SUMAR los exponentes y dejar la base igual.\n\nEjemplo: 2² × 2³ = 2⁵.\n(Porque 2+3=5). ¡Es así de simple!',
      icon: Icons.add_circle,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Usando la propiedad anterior, ¿cuánto es 5³ × 5⁴?',
      options: ['5⁷', '5¹²', '25⁷', '10⁷'],
      correctAnswerIndex: 0,
      feedback:
          'Como la base es igual (5), solo sumamos los exponentes: 3+4=7. Resultado: 5⁷.',
      conceptTag: 'multiplicacion_potencias',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Potencia de una Potencia',
      content:
          '¿Qué pasa si elevas una potencia a OTRA potencia? Por ejemplo: (3²)³.\n\nEn este caso, dejas la misma base y MULTIPLICAS los exponentes.\nEjemplo: (3²)³ = 3⁶.\n(Porque 2x3=6).',
      icon: Icons.close,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Si resuelves (4³)², ¿qué potencia obtienes?',
      options: ['4⁶', '4⁵', '4⁹', '16⁶'],
      correctAnswerIndex: 0,
      feedback:
          'Debes multiplicar los exponentes: 3x2=6. La base queda igual, resultando en 4⁶.',
      conceptTag: 'potencia_de_potencia',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Propiedades',
      content: 'Suma o multiplica exponentes según corresponda.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Resuelve: 7² × 7⁵',
      options: ['7⁷', '7¹⁰', '49⁷', '7³'],
      correctAnswerIndex: 0,
      feedback:
          'En una multiplicación con bases iguales, sumamos los exponentes (2+5=7). Queda 7⁷.',
      conceptTag: 'multiplicacion_potencias',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Resuelve la potencia de una potencia: (2⁴)³',
      options: ['2¹²', '2⁷', '2¹', '4¹²'],
      correctAnswerIndex: 0,
      feedback: 'Multiplicamos los exponentes (4x3=12). Queda 2¹².',
      conceptTag: 'potencia_de_potencia',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Simplifica la expresión: 10³ × 10³',
      options: ['10⁶', '10⁹', '100⁶', '10⁰'],
      correctAnswerIndex: 0,
      feedback:
          'Al multiplicar bases iguales, sumamos exponentes (3+3=6). Queda 10⁶.',
      conceptTag: 'multiplicacion_potencias',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Calcula: (5²)⁰',
      options: ['5⁰ (que es 1)', '5²', '0', '5'],
      correctAnswerIndex: 0,
      feedback: 'Multiplicas 2x0=0. Queda 5⁰, que por regla siempre da 1.',
      conceptTag: 'potencia_de_potencia',
    ),
  ];

  // ==========================================
  // NIVEL 4: RAÍZ CUADRADA (3)
  // Tags: "concepto_raiz_cuadrada", "calcular_raiz_cuadrada"
  // ==========================================
  static final List<LessonSlide> _level4RaizCuadrada = [
    LessonSlide(
      type: SlideType.intro,
      title: 'La Raíz Cuadrada',
      content:
          'Las montañas no solo suben, también tienen profundas raíces bajo tierra. La raíz cuadrada (√) es exactamente lo contrario a elevar al cuadrado.',
      icon: Icons.hardware,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Concepto',
      content:
          'Sacar la raíz cuadrada de un número significa buscar "qué número multiplicado por SÍ MISMO me da este resultado".\n\nEjemplo: La raíz cuadrada de 9 (escrito √9) es 3, ¡porque 3x3=9!',
      icon: Icons.search,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Conceptualmente, si sabes que 5² = 25, ¿cuál es la raíz cuadrada de 25 (√25)?',
      options: ['5', '25', '2', '12.5'],
      correctAnswerIndex: 0,
      feedback:
          'Como la raíz es la operación contraria a la potencia, si 5x5 es 25, entonces √25 es 5.',
      conceptTag: 'concepto_raiz_cuadrada',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Raíces Exactas',
      content:
          'Existen raíces perfectas que debes memorizar para ser un maestro:\n√4 = 2\n√16 = 4\n√25 = 5\n√36 = 6\n√100 = 10',
      icon: Icons.memory,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Cuánto es √64?',
      options: ['8', '6', '4', '32'],
      correctAnswerIndex: 0,
      feedback: '8 es la respuesta correcta porque 8 × 8 = 64.',
      conceptTag: 'calcular_raiz_cuadrada',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Raíz Cuadrada',
      content: 'Encuentra la base oculta de estos números.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula √81',
      options: ['9', '8', '7', '81'],
      correctAnswerIndex: 0,
      feedback: '9 x 9 = 81. Por lo tanto, √81 = 9.',
      conceptTag: 'calcular_raiz_cuadrada',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Si la raíz cuadrada busca un número multiplicado por sí mismo, ¿cuánto es √1?',
      options: ['1', '0', '2', 'No existe'],
      correctAnswerIndex: 0,
      feedback: '1 x 1 = 1. Por lo tanto, la raíz cuadrada de 1 es el mismo 1.',
      conceptTag: 'concepto_raiz_cuadrada',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula √49',
      options: ['7', '6', '8', '49'],
      correctAnswerIndex: 0,
      feedback: '7 x 7 = 49. Por lo tanto, √49 = 7.',
      conceptTag: 'calcular_raiz_cuadrada',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: '¿Cuál es el resultado de sumar √9 + √16?',
      options: ['7', '25', '5', '12'],
      correctAnswerIndex: 0,
      feedback: '√9 es 3 y √16 es 4. Al sumarlos (3+4) obtenemos 7.',
      conceptTag: 'calcular_raiz_cuadrada',
    ),
  ];

  // ==========================================
  // NIVEL 5: RAÍZ CÚBICA (4)
  // Tags: "calcular_raiz_cubica", "concepto_raiz_cubica"
  // ==========================================
  static final List<LessonSlide> _level5RaizCubica = [
    LessonSlide(
      type: SlideType.intro,
      title: 'La Raíz Cúbica',
      content:
          'Si la raíz cuadrada desarmaba a los cuadrados (²), la raíz cúbica (∛) desarma a los cubos (³).',
      icon: Icons.view_in_ar,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Concepto',
      content:
          'Sacar la raíz cúbica significa buscar un número que, multiplicado por sí mismo TRES VECES, nos dé el resultado original.\n\nEjemplo: ∛8 es 2, ¡porque 2x2x2=8!',
      icon: Icons.lightbulb,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Conceptualmente, ¿cuántas veces debe multiplicarse la respuesta por sí misma para comprobar una raíz cúbica?',
      options: ['3 veces', '2 veces', '1 vez', '4 veces'],
      correctAnswerIndex: 0,
      feedback:
          'La raíz cúbica (∛) implica buscar un número que se multiplique 3 veces por sí mismo.',
      conceptTag: 'concepto_raiz_cubica',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Raíces Cúbicas Comunes',
      content:
          'Al igual que las cuadradas, es útil memorizar las más importantes:\n∛1 = 1 (1x1x1)\n∛8 = 2 (2x2x2)\n∛27 = 3 (3x3x3)\n∛64 = 4 (4x4x4)',
      icon: Icons.star,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Cuánto es ∛27?',
      options: ['3', '9', '2', '4'],
      correctAnswerIndex: 0,
      feedback: '3 x 3 x 3 es igual a 27.',
      conceptTag: 'calcular_raiz_cubica',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Raíz Cúbica',
      content: 'Encuentra el origen de estos números elevados al cubo.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula ∛8',
      options: ['2', '4', '3', '8'],
      correctAnswerIndex: 0,
      feedback: '2 x 2 x 2 = 8.',
      conceptTag: 'calcular_raiz_cubica',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Calcula ∛64',
      options: ['4', '8', '6', '16'],
      correctAnswerIndex: 0,
      feedback: '4 x 4 x 4 = 64.',
      conceptTag: 'calcular_raiz_cubica',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Conceptualmente, si 5³ = 125, entonces ¿cuánto es ∛125?',
      options: ['5', '25', '15', '3'],
      correctAnswerIndex: 0,
      feedback:
          'La raíz cúbica es la operación contraria de elevar al cubo, por lo que la respuesta es la base original (5).',
      conceptTag: 'concepto_raiz_cubica',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Calcula ∛1000',
      options: ['10', '100', '1000', '30'],
      correctAnswerIndex: 0,
      feedback: '10 x 10 x 10 = 1000.',
      conceptTag: 'calcular_raiz_cubica',
    ),
  ];

  // ==========================================
  // NIVEL 6: PROPIEDADES DE RAÍCES (5)
  // Tags: "raiz_de_fraccion", "raiz_de_producto"
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
          'Si tienes números multiplicándose DENTRO de una raíz grande, ¡puedes separarlos en dos raíces pequeñas!\n\nEjemplo: √(4 × 9) es lo mismo que √4 × √9.\n√4 = 2. √9 = 3.\nEntonces 2 × 3 = 6.',
      icon: Icons.auto_awesome,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Usando la propiedad, separa √(25 × 4) y resuélvela:',
      options: ['10', '20', '100', '29'],
      correctAnswerIndex: 0,
      feedback: 'Separamos: √25 × √4 = 5 × 2 = 10.',
      conceptTag: 'raiz_de_producto',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Raíz de una Fracción',
      content:
          '¡Funciona igual con las fracciones! Puedes sacar la raíz del número de arriba y luego la del número de abajo por separado.\n\nEjemplo: √(16/25) se separa en √16 / √25. ¡El resultado es 4/5!',
      icon: Icons.vertical_align_center,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Resuelve √(9/64) sacando la raíz arriba y abajo:',
      options: ['3/8', '3/32', '9/8', '8/3'],
      correctAnswerIndex: 0,
      feedback: 'La √9 es 3 (arriba), y la √64 es 8 (abajo). Queda 3/8.',
      conceptTag: 'raiz_de_fraccion',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Propiedades',
      content: 'Separa y vencerás en estos 4 ejercicios.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Resuelve la raíz del producto: √(9 × 16)',
      options: ['12', '144', '7', '25'],
      correctAnswerIndex: 0,
      feedback: 'Separamos: √9 es 3, y √16 es 4. Multiplicamos 3 x 4 = 12.',
      conceptTag: 'raiz_de_producto',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Calcula la raíz de la fracción: √(81/100)',
      options: ['9/10', '9/50', '81/10', '10/9'],
      correctAnswerIndex: 0,
      feedback:
          'La √81 es 9 (arriba) y la √100 es 10 (abajo). Resultado: 9/10.',
      conceptTag: 'raiz_de_fraccion',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula √(36 × 100) separando la raíz:',
      options: ['60', '360', '136', '600'],
      correctAnswerIndex: 0,
      feedback: 'Separamos: √36 es 6 y √100 es 10. Multiplicamos 6 x 10 = 60.',
      conceptTag: 'raiz_de_producto',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Calcula √(49/4)',
      options: ['7/2', '7/4', '49/2', '2/7'],
      correctAnswerIndex: 0,
      feedback: 'La √49 es 7 y la √4 es 2. Resultado: 7/2.',
      conceptTag: 'raiz_de_fraccion',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Mundo Completado!',
      content:
          '¡Felicidades! Has dominado las Cumbres de Poder y sus profundas raíces.',
      icon: Icons.stars,
    ),
  ];
}
