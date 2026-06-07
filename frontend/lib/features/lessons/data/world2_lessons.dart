import 'package:flutter/material.dart';
import 'lesson_models.dart';

class World2Lessons {
  static List<LessonSlide> getLesson(int levelIndex) {
    switch (levelIndex) {
      case 0:
        return _level1Equivalencia;
      case 1:
        return _level2Simplificacion;
      case 2:
        return _level3SumaRestaHeterogenea;
      case 3:
        return _level4MultDivFracciones;
      case 4:
        return _level5ConversionDecimales;
      case 5:
        return _level6OperacionesDecimales;
      case 6:
        return _level7Redondeo;
      case 7:
        return _level8Porcentajes;
      case 8:
        return _level9AumentosDescuentos;
      default:
        return _level1Equivalencia;
    }
  }

  // ==========================================
  // NIVEL 1: EQUIVALENCIA DE FRACCIONES (0)
  // Tags: "fracciones_equivalentes", "amplificacion"
  // ==========================================
  static final List<LessonSlide> _level1Equivalencia = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Archipiélago Fraccionario',
      content:
          '¡Bienvenido al Mundo 2!\n\nAquí los números se rompen en pedazos. Empezaremos descubriendo cómo dos fracciones diferentes pueden valer exactamente lo mismo.',
      lottieUrl: 'assets/lottie/pizza.json',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Fracciones Equivalentes',
      content:
          'Imagina que compras una pizza y la cortas en 2 partes, comiéndote 1 (1/2).\n\nTu amigo compra otra igual, la corta en 4 partes y se come 2 (2/4).\n\n¡Ambos comieron la misma cantidad! Por lo tanto, 1/2 y 2/4 son fracciones equivalentes.',
      icon: Icons.local_pizza,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Según el ejemplo de la pizza, ¿qué fracción es equivalente a 1/2?',
      options: ['2/4', '1/3', '3/5', '4/6'],
      correctAnswerIndex: 0,
      feedback:
          'Correcto. Comer 1 de 2 pedazos es igual que comer 2 de 4 pedazos.',
      conceptTag: 'fracciones_equivalentes',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Amplificación',
      content:
          'Para encontrar fracciones equivalentes más grandes, usamos la Amplificación.\n\nSimplemente multiplicas el numerador (arriba) y el denominador (abajo) por el mismo número.\n\nEjemplo: 1/3 multiplicando ambos por 2 nos da 2/6.',
      icon: Icons.zoom_out_map,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si amplificas la fracción 2/3 multiplicando arriba y abajo por 3, ¿qué obtienes?',
      options: ['5/6', '6/9', '2/9', '6/3'],
      correctAnswerIndex: 1,
      feedback: 'Al multiplicar 2x3=6 y 3x3=9, obtienes 6/9.',
      conceptTag: 'amplificacion',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Equivalencia',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Qué fracción es equivalente a 3/5?',
      options: ['6/10', '4/5', '9/10', '6/5'],
      correctAnswerIndex: 0,
      feedback: 'Multiplicando por 2 arriba y abajo obtenemos 6/10.',
      conceptTag: 'fracciones_equivalentes',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Si amplificas 1/4 multiplicando por 2, ¿qué fracción resulta?',
      options: ['2/8', '2/4', '1/8', '4/2'],
      correctAnswerIndex: 0,
      feedback: 'Multiplicamos 1x2=2 y 4x2=8. Queda 2/8.',
      conceptTag: 'amplificacion',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: '¿La fracción 2/3 es equivalente a 4/6?',
      options: ['Sí', 'No', 'Solo a veces', 'Depende'],
      correctAnswerIndex: 0,
      feedback: 'Sí, porque 2x2=4 y 3x2=6.',
      conceptTag: 'fracciones_equivalentes',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Si amplificas 3/4 multiplicando por 5, ¿qué obtienes?',
      options: ['15/20', '15/4', '3/20', '8/9'],
      correctAnswerIndex: 0,
      feedback: '3x5=15 y 4x5=20. El resultado es 15/20.',
      conceptTag: 'amplificacion',
    ),
  ];

  // ==========================================
  // NIVEL 2: SIMPLIFICACIÓN DE FRACCIONES (1)
  // Tags: "simplificacion_basica", "fraccion_irreducible"
  // ==========================================
  static final List<LessonSlide> _level2Simplificacion = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Simplificación',
      content:
          'Es el proceso inverso a la amplificación. En lugar de hacer los números más grandes, los haremos más pequeños pero manteniendo su valor.',
      icon: Icons.content_cut,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Cómo Simplificar?',
      content:
          'Para simplificar, dividimos el numerador y el denominador por el mismo número entero de forma exacta.\n\nEjemplo: Tienes 4/8.\n• Divides entre 2 y te queda 2/4.\n• Divides otra vez entre 2 y te queda 1/2.',
      icon: Icons.trending_down,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Simplifica la fracción 6/10 dividiendo entre 2:',
      options: ['3/10', '6/5', '3/5', '2/5'],
      correctAnswerIndex: 2,
      feedback: '6 ÷ 2 = 3 y 10 ÷ 2 = 5. El resultado es 3/5.',
      conceptTag: 'simplificacion_basica',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Fracción Irreducible',
      content:
          'Cuando ya no puedes dividir más la fracción por ningún número común (excepto el 1), has llegado a la Fracción Irreducible.\n\nEs la forma más pura y pequeña de una fracción. Ejemplos: 1/2, 3/5, 7/11.',
      icon: Icons.lock,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Cuál de las siguientes es una fracción irreducible?',
      options: ['2/4', '3/9', '5/7', '10/20'],
      correctAnswerIndex: 2,
      feedback:
          '5 y 7 no comparten ningún divisor común, por lo tanto 5/7 ya no se puede simplificar más.',
      conceptTag: 'fraccion_irreducible',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Simplificación',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Simplifica la fracción 6/8:',
      options: ['3/4', '2/4', '3/8', '4/6'],
      correctAnswerIndex: 0,
      feedback: 'Dividiendo entre 2 obtenemos 3/4.',
      conceptTag: 'simplificacion_basica',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Reduce 12/16 hasta su fracción irreducible:',
      options: ['6/8', '3/4', '2/4', '4/8'],
      correctAnswerIndex: 1,
      feedback:
          'Dividiendo 12 y 16 entre 4 llegamos a 3/4, que ya es irreducible.',
      conceptTag: 'fraccion_irreducible',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Simplifica 10/30 (Consejo: elimina los ceros):',
      options: ['2/3', '1/3', '5/15', '1/5'],
      correctAnswerIndex: 1,
      feedback: 'Al dividir entre 10 quitando los ceros, obtenemos 1/3.',
      conceptTag: 'simplificacion_basica',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: '¿Cuál de estas opciones NO es irreducible?',
      options: ['1/3', '2/5', '6/9', '7/8'],
      correctAnswerIndex: 2,
      feedback: '6/9 aún puede dividirse entre 3 para convertirse en 2/3.',
      conceptTag: 'fraccion_irreducible',
    ),
  ];

  // ==========================================
  // NIVEL 3: SUMA Y RESTA HETEROGÉNEA (2)
  // Tags: "comun_denominador", "suma_fracciones_heterogeneas"
  // ==========================================
  static final List<LessonSlide> _level3SumaRestaHeterogenea = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Suma y Resta Heterogénea',
      content:
          'Cuando las fracciones tienen diferente denominador, no podemos sumarlas directamente. ¡Es como intentar sumar manzanas con naranjas!',
      icon: Icons.add_circle_outline,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Común Denominador',
      content:
          'Para operar, buscamos un denominador común usando el mínimo común múltiplo (mcm).\n\nPara 1/2 y 1/4:\nEl mcm de 2 y 4 es 4.\nAsí, 1/2 se convierte en 2/4. ¡Ahora ambas tienen el mismo denominador!',
      icon: Icons.sync,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          '¿Cuál es el común denominador (mcm) para sumar fracciones con denominadores 3 y 4?',
      options: ['6', '7', '12', '24'],
      correctAnswerIndex: 2,
      feedback:
          'El número más pequeño que está en la tabla de multiplicar del 3 y del 4 es el 12.',
      conceptTag: 'comun_denominador',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Sumando y Restando',
      content:
          'Una vez que ambas fracciones comparten el común denominador, simplemente sumas o restas los numeradores (arriba) y dejas el denominador igual.\n\nEjemplo: 2/4 + 1/4 = 3/4.',
      icon: Icons.mood,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Usando la suma anterior (2/4 + 1/4), ¿qué debes sumar?',
      options: [
        'Solo los denominadores',
        'Solo los numeradores',
        'Ambos',
        'Ninguno',
      ],
      correctAnswerIndex: 1,
      feedback: 'Al homogeneizar, solo se operan los numeradores: 2 + 1 = 3.',
      conceptTag: 'suma_fracciones_heterogeneas',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Suma y Resta',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Cuál es el común denominador entre 2 y 5?',
      options: ['10', '7', '5', '20'],
      correctAnswerIndex: 0,
      feedback: 'El menor múltiplo común de 2 y 5 es 10.',
      conceptTag: 'comun_denominador',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Suma 1/2 + 1/3 (Ayuda: el común denominador es 6)',
      options: ['5/6', '2/5', '1/5', '1/6'],
      correctAnswerIndex: 0,
      feedback: 'Convertimos a sextos: 3/6 + 2/6 = 5/6.',
      conceptTag: 'suma_fracciones_heterogeneas',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Para restar 3/4 - 1/6, ¿qué común denominador usarías?',
      options: ['12', '10', '24', '2'],
      correctAnswerIndex: 0,
      feedback: 'El mcm de 4 y 6 es 12.',
      conceptTag: 'comun_denominador',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Resta 2/3 - 1/6',
      options: ['3/6', '1/3', '1/6', '4/6'],
      correctAnswerIndex: 0,
      feedback:
          'Convertimos 2/3 a 4/6. Luego restas 4/6 - 1/6 = 3/6 (que equivale a 1/2).',
      conceptTag: 'suma_fracciones_heterogeneas',
    ),
  ];

  // ==========================================
  // NIVEL 4: MULTIPLICACIÓN Y DIVISIÓN (3)
  // Tags: "multiplicacion_fracciones", "division_fracciones"
  // ==========================================
  static final List<LessonSlide> _level4MultDivFracciones = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Multiplicación y División',
      content:
          '¡Buenas noticias! Multiplicar y dividir fracciones es mucho más fácil que sumarlas, porque no necesitas buscar un denominador común.',
      icon: Icons.star_border,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Multiplicación en Línea',
      content:
          'Para multiplicar fracciones, simplemente multiplicas de forma horizontal de frente:\n\n• Numerador × Numerador\n• Denominador × Denominador\n\nEjemplo: 2/3 × 4/5 = (2×4) / (3×5) = 8/15.',
      icon: Icons.linear_scale,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Multiplica 1/2 por 3/5:',
      options: ['4/7', '3/10', '5/6', '3/7'],
      correctAnswerIndex: 1,
      feedback:
          'Multiplicación directa: 1x3 = 3 (arriba) y 2x5 = 10 (abajo). Queda 3/10.',
      conceptTag: 'multiplicacion_fracciones',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'División Cruzada',
      content:
          'Para dividir fracciones, multiplicamos en zig-zag o cruzado:\n\nMultiplicas el numerador de la primera por el denominador de la segunda (va arriba), y el denominador de la primera por el numerador de la segunda (va abajo).',
      icon: Icons.healing,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Divide 2/3 entre 1/4 usando la división cruzada:',
      options: ['2/12', '8/3', '3/8', '8/12'],
      correctAnswerIndex: 1,
      feedback:
          'Cruzado: (2x4) va arriba = 8. Y (3x1) va abajo = 3. Resultado 8/3.',
      conceptTag: 'division_fracciones',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Multiplicación y División',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Multiplica 1/4 x 2/3',
      options: ['2/12', '3/7', '4/6', '2/7'],
      correctAnswerIndex: 0,
      feedback: 'Multiplicando en línea: 1x2=2 y 4x3=12.',
      conceptTag: 'multiplicacion_fracciones',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Divide 1/2 ÷ 1/3',
      options: ['3/2', '1/6', '2/3', '2/5'],
      correctAnswerIndex: 0,
      feedback: 'Multiplicando en cruz: 1x3=3 y 2x1=2.',
      conceptTag: 'division_fracciones',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Multiplica 3/5 x 2/5',
      options: ['5/10', '6/25', '6/5', '5/25'],
      correctAnswerIndex: 1,
      feedback: 'Multiplicando en línea: 3x2=6 y 5x5=25.',
      conceptTag: 'multiplicacion_fracciones',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Divide 4/5 ÷ 2/3',
      options: ['12/10', '8/15', '6/8', '10/12'],
      correctAnswerIndex: 0,
      feedback: 'Multiplicando en cruz: 4x3=12 y 5x2=10.',
      conceptTag: 'division_fracciones',
    ),
  ];

  // ==========================================
  // NIVEL 5: CONVERSIÓN A DECIMALES (4)
  // Tags: "decimal_a_fraccion", "fraccion_a_decimal"
  // ==========================================
  static final List<LessonSlide> _level5ConversionDecimales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Fracciones y Decimales',
      content:
          '¿Sabías que una fracción es en realidad una división disfrazada? La línea del medio significa "dividido entre".',
      icon: Icons.swap_horiz,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Fracción a Decimal',
      content:
          'Para convertir una fracción a número decimal, simplemente divide el numerador (arriba) entre el denominador (abajo).\n\nEjemplo: Para 1/2, divides 1 ÷ 2 y obtienes 0.5.',
      icon: Icons.exposure_zero,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si divides 1 entre 4 para convertir 1/4 a decimal, ¿qué obtienes?',
      options: ['0.4', '0.25', '0.14', '1.4'],
      correctAnswerIndex: 1,
      feedback: '1 ÷ 4 es igual a 0.25.',
      conceptTag: 'fraccion_a_decimal',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Decimal a Fracción',
      content:
          'Para hacer el proceso inverso (decimal a fracción), mira cuántos decimales hay.\n\nSi es 0.5 (un decimal), se divide entre 10: 5/10.\nSi es 0.25 (dos decimales), se divide entre 100: 25/100.\nLuego solo debes simplificar.',
      icon: Icons.speed,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Convierte el decimal 0.5 a una fracción irreducible:',
      options: ['1/2', '5/10', '1/5', '2/5'],
      correctAnswerIndex: 0,
      feedback: '0.5 es 5/10, que simplificado entre 5 nos da 1/2.',
      conceptTag: 'decimal_a_fraccion',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Conversión',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Convierte 3/4 a decimal:',
      options: ['0.75', '3.4', '0.34', '1.33'],
      correctAnswerIndex: 0,
      feedback: '3 dividido entre 4 es 0.75.',
      conceptTag: 'fraccion_a_decimal',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Convierte 0.75 a fracción irreducible:',
      options: ['3/4', '75/100', '1/4', '4/3'],
      correctAnswerIndex: 0,
      feedback: '0.75 es 75/100, simplificado entre 25 queda 3/4.',
      conceptTag: 'decimal_a_fraccion',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Convierte 2/5 a decimal:',
      options: ['0.4', '2.5', '0.25', '0.5'],
      correctAnswerIndex: 0,
      feedback: '2 dividido entre 5 es 0.4.',
      conceptTag: 'fraccion_a_decimal',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Convierte 0.2 a fracción irreducible:',
      options: ['1/5', '2/10', '1/2', '2/100'],
      correctAnswerIndex: 0,
      feedback: '0.2 es 2/10, que al simplificarse entre 2 es 1/5.',
      conceptTag: 'decimal_a_fraccion',
    ),
  ];

  // ==========================================
  // NIVEL 6: OPERACIONES CON DECIMALES (5)
  // Tags: "multiplicacion_decimales", "suma_decimales"
  // ==========================================
  static final List<LessonSlide> _level6OperacionesDecimales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Operaciones con Decimales',
      content:
          'Sumar y multiplicar decimales es muy parecido a hacerlo con números enteros, solo hay que cuidar la posición del punto decimal.',
      icon: Icons.add_box,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Suma: Alinear el punto',
      content:
          'Para SUMAR, la regla de oro es alinear los puntos decimales verticalmente. Si un número tiene menos dígitos, rellenas con ceros.\n\nEjemplo: 4.5 + 1.25\n  4.50\n+ 1.25\n  -----\n  5.75',
      icon: Icons.format_line_spacing,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Suma 3.0 + 1.2 alineando los puntos:',
      options: ['4.2', '4.0', '3.2', '1.5'],
      correctAnswerIndex: 0,
      feedback:
          'Se suma de forma directa columna a columna respetando el punto: 4.2.',
      conceptTag: 'suma_decimales',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Multiplicar y Contar',
      content:
          'Para MULTIPLICAR, opera normal como si no hubiera puntos. Al final, cuenta cuántos decimales tenían los dos números originales juntos, y mueve el punto esa cantidad de espacios hacia la izquierda.',
      icon: Icons.unfold_more,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si multiplicas 0.2 × 0.4, tu respuesta debe tener 2 decimales. ¿Cuál es?',
      options: ['0.08', '0.8', '8.0', '0.008'],
      correctAnswerIndex: 0,
      feedback: '2 x 4 es 8. Movimos el punto dos espacios, quedando en 0.08.',
      conceptTag: 'multiplicacion_decimales',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Decimales',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Suma 1.5 + 2.3',
      options: ['3.8', '3.5', '4.8', '2.8'],
      correctAnswerIndex: 0,
      feedback: 'Alineando los puntos: 1.5 + 2.3 = 3.8.',
      conceptTag: 'suma_decimales',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Multiplica 0.2 x 3',
      options: ['0.6', '0.5', '1.2', '6.0'],
      correctAnswerIndex: 0,
      feedback: '2 x 3 = 6, con un decimal es 0.6.',
      conceptTag: 'multiplicacion_decimales',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Suma 2.15 + 1.1',
      options: ['3.25', '3.16', '3.26', '2.26'],
      correctAnswerIndex: 0,
      feedback: 'Alineando con ceros: 2.15 + 1.10 = 3.25.',
      conceptTag: 'suma_decimales',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Multiplica 1.5 x 2',
      options: ['3.0', '1.7', '2.5', '3.5'],
      correctAnswerIndex: 0,
      feedback: '15 x 2 = 30, con un decimal es 3.0.',
      conceptTag: 'multiplicacion_decimales',
    ),
  ];

  // ==========================================
  // NIVEL 7: REDONDEO DE DECIMALES (6)
  // Tags: "redondeo_decimales", "redondeo_enteros"
  // ==========================================
  static final List<LessonSlide> _level7Redondeo = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Redondeo de Decimales',
      content:
          'A veces los decimales son demasiado largos. Redondear sirve para aproximar un número y dejarlo con menos cifras de forma práctica.',
      icon: Icons.auto_awesome,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Regla del 5',
      content:
          'Para redondear decimales, mira el dígito a la derecha de tu objetivo:\n\n• Si es 5 o mayor (5,6,7,8,9): Sumas 1 al dígito objetivo.\n• Si es menor que 5 (0,1,2,3,4): El dígito objetivo se queda igual.',
      icon: Icons.rule,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Usando la regla, redondea 2.55 a un solo decimal:',
      options: ['2.6', '2.5', '3.0', '2.0'],
      correctAnswerIndex: 0,
      feedback:
          'El dígito a la derecha es un 5, por lo que la décima sube de 5 a 6, resultando en 2.6.',
      conceptTag: 'redondeo_decimales',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Redondeo a Enteros',
      content:
          'Si quieres redondear un decimal para que se vuelva un número entero puro (sin punto), miras el primer decimal.\n\nEjemplo: 4.3 a entero. El 3 es menor que 5, así que el número se queda en 4.',
      icon: Icons.lightbulb_outline,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Redondea 4.8 a un número entero:',
      options: ['5', '4', '0', '8'],
      correctAnswerIndex: 0,
      feedback: 'El 8 es mayor que 5, así que el entero sube de 4 a 5.',
      conceptTag: 'redondeo_enteros',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Redondeo',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Redondea 3.46 a un decimal',
      options: ['3.5', '3.4', '3.6', '4.0'],
      correctAnswerIndex: 0,
      feedback: 'El 6 es mayor que 5, así que el 4 sube a 5.',
      conceptTag: 'redondeo_decimales',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Redondea 9.8 a un número entero:',
      options: ['10', '9', '8', '11'],
      correctAnswerIndex: 0,
      feedback:
          'El 8 es mayor a 5, por lo que el 9 sube al siguiente entero (10).',
      conceptTag: 'redondeo_enteros',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Redondea 2.13 a un decimal',
      options: ['2.1', '2.2', '2.0', '2.3'],
      correctAnswerIndex: 0,
      feedback: 'El 3 es menor que 5, así que el 1 se queda igual.',
      conceptTag: 'redondeo_decimales',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Redondea 5.4 a un número entero:',
      options: ['5', '6', '4', '10'],
      correctAnswerIndex: 0,
      feedback: 'El 4 es menor que 5, el entero se mantiene en 5.',
      conceptTag: 'redondeo_enteros',
    ),
  ];

  // ==========================================
  // NIVEL 8: PORCENTAJES (7)
  // Tags: "calcular_porcentaje", "concepto_porcentaje"
  // ==========================================
  static final List<LessonSlide> _level8Porcentajes = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Introducción a Porcentajes',
      content:
          'El símbolo % significa "por cada 100". Un porcentaje es una fracción cuyo denominador es siempre el número 100.',
      icon: Icons.percent,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Concepto',
      content:
          'Decir 50% es lo mismo que decir 50 de cada 100, lo que simplificado es la fracción 1/2.\n\nEl 100% representa el total de algo.',
      icon: Icons.pie_chart,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Conceptualmente, ¿a qué fracción equivale exactamente el 50%?',
      options: ['1/2', '1/4', '1/5', '1/100'],
      correctAnswerIndex: 0,
      feedback: '50/100 simplificado es igual a 1/2 (la mitad).',
      conceptTag: 'concepto_porcentaje',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El truco de los Ceros',
      content:
          'Para calcular un porcentaje rápidamente: Si ambos números terminan en cero, puedes eliminar los dos últimos ceros y simplemente multiplicar lo que queda.\n\nPara el 20% de 60: Tachas un cero del 20, un cero del 60 y multiplicas 2 × 6 = 12.',
      icon: Icons.flash_on,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Usa el truco de los ceros para calcular el 30% de 40:',
      options: ['12', '70', '120', '7'],
      correctAnswerIndex: 0,
      feedback: 'Tachando los ceros nos queda 3 y 4. Multiplicando 3 x 4 = 12.',
      conceptTag: 'calcular_porcentaje',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Porcentajes',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Conceptualmente, ¿a qué fracción equivale el 25%?',
      options: ['1/4', '1/2', '3/4', '1/5'],
      correctAnswerIndex: 0,
      feedback: '25% es la cuarta parte de 100, es decir 1/4.',
      conceptTag: 'concepto_porcentaje',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Calcula el 10% de 50',
      options: ['5', '10', '50', '25'],
      correctAnswerIndex: 0,
      feedback: 'Tachando los ceros: 1 x 5 = 5.',
      conceptTag: 'calcular_porcentaje',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: '¿Qué representa el 100% de algo?',
      options: ['El total', 'La mitad', 'El doble', 'Nada'],
      correctAnswerIndex: 0,
      feedback: 'El 100% representa el total completo de una cantidad.',
      conceptTag: 'concepto_porcentaje',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Calcula el 20% de 40',
      options: ['8', '12', '20', '4'],
      correctAnswerIndex: 0,
      feedback: 'Tachando los ceros: 2 x 4 = 8.',
      conceptTag: 'calcular_porcentaje',
    ),
  ];

  // ==========================================
  // NIVEL 9: AUMENTOS Y DESCUENTOS (8)
  // Tags: "aumento_porcentual", "descuento_porcentual"
  // ==========================================
  static final List<LessonSlide> _level9AumentosDescuentos = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Matemáticas en Tiendas',
      content:
          '¡Llegaste al nivel final! Aquí usaremos todo lo que aprendimos de porcentajes para aplicarlo al dinero y las tiendas.',
      icon: Icons.storefront,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Descuentos (Ofertas)',
      content:
          'Si un zapato de \$100 tiene un 10% de descuento:\n\n1. Calcula el descuento: 10% de \$100 = \$10.\n2. Réstalo al precio original: \$100 - \$10 = \$90.\n¡Pagarás \$90!',
      icon: Icons.local_offer,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si un juego de \$50 tiene 10% de descuento (que es \$5). ¿Cuánto pagarás en total?',
      options: ['\$45', '\$40', '\$55', '\$60'],
      correctAnswerIndex: 0,
      feedback:
          'A los \$50 originales le restas los \$5 de descuento. \$50 - \$5 = \$45.',
      conceptTag: 'descuento_porcentual',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Aumentos (Impuestos)',
      content:
          'Funciona igual, pero SUMANDO.\n\nSi un menú cuesta \$50 y debes pagar un 10% de impuesto extra:\n1. Calcula el impuesto: 10% de \$50 = \$5.\n2. Súmalo al costo base: \$50 + \$5 = \$55.\n¡El precio total es \$55!',
      icon: Icons.trending_up,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si una entrada cuesta \$20 y cobran un 10% de recargo (\$2). ¿Cuánto pagas al final?',
      options: ['\$22', '\$18', '\$20', '\$24'],
      correctAnswerIndex: 0,
      feedback: 'Como es un recargo o aumento, se SUMA. \$20 + \$2 = \$22.',
      conceptTag: 'aumento_porcentual',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Aumentos y Descuentos',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Una camisa de \$20 tiene un 10% de descuento. ¿Cuánto pagarás?',
      options: ['\$18', '\$19', '\$20', '\$22'],
      correctAnswerIndex: 0,
      feedback: 'El 10% de 20 es 2. Restamos 20 - 2 = 18.',
      conceptTag: 'descuento_porcentual',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Un libro de \$50 aumenta su precio un 10%. ¿Cuánto cuesta ahora?',
      options: ['\$55', '\$45', '\$60', '\$50'],
      correctAnswerIndex: 0,
      feedback: 'El 10% de 50 es 5. Sumamos 50 + 5 = 55.',
      conceptTag: 'aumento_porcentual',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'Si te hacen el 50% de descuento en algo de \$80, ¿cuánto pagas?',
      options: ['\$40', '\$50', '\$30', '\$80'],
      correctAnswerIndex: 0,
      feedback: 'El 50% es la mitad. 80 / 2 = 40.',
      conceptTag: 'descuento_porcentual',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Con un impuesto extra del 20% sobre \$10, ¿cuál es el precio final?',
      options: ['\$12', '\$8', '\$10', '\$14'],
      correctAnswerIndex: 0,
      feedback: 'El 20% de 10 es 2. Sumamos el impuesto: 10 + 2 = 12.',
      conceptTag: 'aumento_porcentual',
    ),
  ];
}
