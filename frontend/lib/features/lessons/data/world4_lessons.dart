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
        return _level4Primos;
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
  // Tags: "concepto_factor", "identificar_factores"
  // ==========================================
  static final List<LessonSlide> _level1Factores = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Caverna de los Primos',
      content:
          '¡Bienvenido al Mundo 4!\n\nTe adentrarás en una mina oscura y misteriosa donde los números se descomponen en joyas más pequeñas llamadas "Factores".',
      icon: Icons.landscape,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es un Factor?',
      content:
          'Un factor es un número que divide exactamente a otro número, sin dejar ningún residuo.\n\nTambién puedes pensarlo así: Los factores son los números que multiplicas para obtener otro número. Por ejemplo, 2 y 3 son factores de 6, porque 2 × 3 = 6.',
      icon: Icons.diamond,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Si 4 × 5 = 20, ¿qué papel cumplen el 4 y el 5?',
      options: [
        'Son factores de 20',
        'Son múltiplos de 20',
        'Son primos',
        'Son residuos',
      ],
      correctAnswerIndex: 0,
      feedback:
          'Los números que se multiplican para formar un producto se llaman factores.',
      conceptTag: 'concepto_factor',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Encontrar Factores',
      content:
          'Los factores suelen venir en parejas. Si quieres encontrar los factores de 10, piensa en qué multiplicaciones dan 10:\n\n• 1 × 10 = 10\n• 2 × 5 = 10\n\nEntonces, los factores de 10 son: 1, 2, 5 y 10.',
      icon: Icons.search,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Cuál de los siguientes números es un factor de 15?',
      options: ['2', '3', '6', '10'],
      correctAnswerIndex: 1,
      feedback: '3 es un factor de 15 porque 3 × 5 = 15.',
      conceptTag: 'identificar_factores',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Factores',
      content: 'Resuelve estos 4 ejercicios para superar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Qué es un factor de un número?',
      options: [
        'Un número que lo divide de forma exacta',
        'Un número más grande que él',
        'El resultado de sumarlo',
        'Un número impar',
      ],
      correctAnswerIndex: 0,
      feedback: 'Un factor es un divisor exacto, no deja residuo al dividir.',
      conceptTag: 'concepto_factor',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Selecciona TODOS los factores del número 8:',
      options: ['1, 2, 4, 8', '2, 4', '1, 8', '2, 3, 4'],
      correctAnswerIndex: 0,
      feedback: 'Las parejas son 1×8 y 2×4. Por lo tanto, son 1, 2, 4 y 8.',
      conceptTag: 'identificar_factores',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: '¿Es el número 7 un factor de 21?',
      options: [
        'Sí, porque 7 × 3 = 21',
        'No, porque es impar',
        'Sí, porque 7 + 14 = 21',
        'No, 21 no tiene factores',
      ],
      correctAnswerIndex: 0,
      feedback:
          'Sí, como existe un número entero (3) que multiplicado por 7 da 21, el 7 es factor.',
      conceptTag: 'concepto_factor',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: '¿Cuál de estos NO es un factor de 12?',
      options: ['3', '4', '5', '6'],
      correctAnswerIndex: 2,
      feedback:
          'No hay ningún número entero que multiplicado por 5 dé 12. El 5 no es factor.',
      conceptTag: 'identificar_factores',
    ),
  ];

  // ==========================================
  // NIVEL 2: MÚLTIPLOS (1)
  // Tags: "concepto_multiplo", "identificar_multiplos"
  // ==========================================
  static final List<LessonSlide> _level2Multiplos = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Múltiplos Infinitos',
      content:
          'Mientras los factores son más pequeños que el número, ¡los múltiplos crecen hasta el infinito!',
      icon: Icons.all_inclusive,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es un Múltiplo?',
      content:
          'Un múltiplo es el resultado de multiplicar un número por cualquier número entero.\n\nBásicamente, son las tablas de multiplicar. Los múltiplos de 5 son: 5, 10, 15, 20, 25... ¡y así para siempre!',
      icon: Icons.format_list_numbered,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Conceptualmente, ¿cuántos múltiplos tiene un número?',
      options: ['Solo dos', 'Depende del número', 'Infinitos', 'Diez'],
      correctAnswerIndex: 2,
      feedback:
          'Como puedes multiplicar por números cada vez más grandes, los múltiplos nunca terminan.',
      conceptTag: 'concepto_multiplo',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Múltiplo Universal',
      content:
          'Todo número es múltiplo de sí mismo (porque número × 1 = el mismo número).\n\nAdemás, el 0 es múltiplo de TODOS los números (porque número × 0 = 0).',
      icon: Icons.stars,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Identifica cuál de los siguientes es un múltiplo de 7:',
      options: ['1', '14', '3', '10'],
      correctAnswerIndex: 1,
      feedback: '14 es múltiplo de 7 porque 7 × 2 = 14.',
      conceptTag: 'identificar_multiplos',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Múltiplos',
      content:
          'Demuestra qué tan bien conoces los múltiplos en este test final.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Cuáles son los primeros tres múltiplos positivos de 4?',
      options: ['4, 8, 12', '1, 2, 4', '4, 16, 24', '8, 12, 16'],
      correctAnswerIndex: 0,
      feedback: 'Los primeros multiplicados por 1, 2 y 3 son: 4, 8 y 12.',
      conceptTag: 'identificar_multiplos',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Si un número "A" está en la tabla de multiplicar de "B", entonces "A" es...',
      options: [
        'Un factor de B',
        'Un múltiplo de B',
        'Un número primo',
        'Un residuo',
      ],
      correctAnswerIndex: 1,
      feedback:
          'Estar en la tabla de multiplicar significa ser el resultado de multiplicarlo, o sea, un múltiplo.',
      conceptTag: 'concepto_multiplo',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: '¿Es 30 un múltiplo de 6?',
      options: [
        'Sí, porque 6 × 5 = 30',
        'No, 30 es factor de 6',
        'Sí, porque termina en 0',
        'No, no lo es',
      ],
      correctAnswerIndex: 0,
      feedback: 'Sí, al multiplicar 6 por el entero 5, obtenemos 30.',
      conceptTag: 'identificar_multiplos',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: '¿Cuál de los siguientes NO es múltiplo de 9?',
      options: ['18', '27', '36', '40'],
      correctAnswerIndex: 3,
      feedback:
          '40 no está en la tabla del 9 (9x4=36, 9x5=45). No es múltiplo.',
      conceptTag: 'identificar_multiplos',
    ),
  ];

  // ==========================================
  // NIVEL 3: CRITERIOS DE DIVISIBILIDAD (2)
  // Tags: "divisibilidad_avanzada", "divisibilidad_2_3_5"
  // ==========================================
  static final List<LessonSlide> _level3Divisibilidad = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Reglas de Divisibilidad',
      content:
          '¿Se puede saber si un número divide a otro sin tener que hacer la división? ¡Sí, usando atajos mentales llamados criterios de divisibilidad!',
      icon: Icons.visibility,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Reglas del 2, 3 y 5',
      content:
          '• Divisible por 2: Si termina en número par o 0 (Ej: 14, 20).\n• Divisible por 3: Si al sumar sus cifras da un múltiplo de 3 (Ej: 15 -> 1+5=6).\n• Divisible por 5: Si termina en 0 o 5 (Ej: 25, 40).',
      icon: Icons.rule,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Sin dividir, ¿puedes decir si 123 es divisible por 3?',
      options: [
        'Sí, porque 1+2+3=6',
        'No, porque termina en 3',
        'Sí, porque es impar',
        'No',
      ],
      correctAnswerIndex: 0,
      feedback:
          'La suma de sus dígitos (1+2+3) es 6, y 6 es múltiplo de 3, por lo tanto 123 es divisible entre 3.',
      conceptTag: 'divisibilidad_2_3_5',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Reglas Avanzadas',
      content:
          '• Divisible por 6: Si cumple la regla del 2 Y también la del 3 al mismo tiempo.\n• Divisible por 9: Si la suma de sus cifras da un múltiplo de 9.\n• Divisible por 10: Si termina en 0.',
      icon: Icons.psychology,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Es el número 18 divisible por 6?',
      options: ['Sí, porque es par y suma 9', 'No', 'Solo por 2', 'Solo por 3'],
      correctAnswerIndex: 0,
      feedback:
          '18 es par (divisible por 2) y sus cifras suman 9 (divisible por 3). Al cumplir ambas, es divisible por 6.',
      conceptTag: 'divisibilidad_avanzada',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Divisibilidad',
      content: 'Aplica los trucos mentales para resolver rápido.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Por qué el número 45 es divisible entre 5?',
      options: [
        'Porque termina en 5',
        'Porque es impar',
        'Porque 4+5=9',
        'No es divisible entre 5',
      ],
      correctAnswerIndex: 0,
      feedback:
          'La regla del 5 dice que todo número que termina en 0 o en 5 es divisible por él.',
      conceptTag: 'divisibilidad_2_3_5',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: '¿El número 270 es divisible por 9?',
      options: [
        'Sí, porque 2+7+0 = 9',
        'No, porque termina en 0',
        'Sí, porque es par',
        'No se puede saber',
      ],
      correctAnswerIndex: 0,
      feedback:
          'Sumamos las cifras: 2+7+0 = 9. Como 9 es múltiplo de 9, la regla se cumple.',
      conceptTag: 'divisibilidad_avanzada',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: '¿Cuál de estos números NO es divisible por 2?',
      options: ['104', '22', '37', '90'],
      correctAnswerIndex: 2,
      feedback:
          'El 37 termina en un número impar (7), por lo tanto no es divisible entre 2.',
      conceptTag: 'divisibilidad_2_3_5',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Para que un número sea divisible por 10, su última cifra DEBE ser obligatoriamente:',
      options: ['Un 0', 'Un 5', 'Un número par', 'Un 0 o un 5'],
      correctAnswerIndex: 0,
      feedback:
          'La regla avanzada del 10 dicta que el número debe terminar exclusivamente en 0.',
      conceptTag: 'divisibilidad_avanzada',
    ),
  ];

  // ==========================================
  // NIVEL 4: NÚMEROS PRIMOS (3)
  // Tags: "identificar_primos", "primos_vs_compuestos"
  // ==========================================
  static final List<LessonSlide> _level4Primos = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Números Primos y Compuestos',
      content:
          'En el corazón de la caverna encontramos las piedras angulares de las matemáticas: los números primos.',
      icon: Icons.vpn_key,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es un Número Primo?',
      content:
          'Un número primo es un número mayor que 1 que tiene EXACTAMENTE DOS factores: el 1 y él mismo.\n\nPor ejemplo, el 7 solo puede dividirse entre 1 y 7. ¡El 7 es primo!',
      icon: Icons.shield,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Es el número 5 un número primo?',
      options: ['Sí', 'No', 'Es par', 'Tiene 3 factores'],
      correctAnswerIndex: 0,
      feedback:
          'Sí, porque los únicos números que multiplicados dan 5 son 1 y 5.',
      conceptTag: 'identificar_primos',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Números Compuestos',
      content:
          'Si un número tiene MÁS de dos factores, se llama Número Compuesto. Está "compuesto" de números más pequeños.\n\nPor ejemplo, el 4 tiene como factores el 1, 2 y 4. ¡Es compuesto!',
      icon: Icons.widgets,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'El número 6 tiene como factores a 1, 2, 3 y 6. ¿Qué tipo de número es?',
      options: ['Compuesto', 'Primo', 'Ninguno', 'Múltiplo'],
      correctAnswerIndex: 0,
      feedback:
          'Al tener más de dos factores, el número 6 entra en la categoría de Compuesto.',
      conceptTag: 'primos_vs_compuestos',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Primos',
      content: 'Diferencia a los primos de los compuestos.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Cuál de los siguientes es un número primo?',
      options: ['9', '11', '10', '15'],
      correctAnswerIndex: 1,
      feedback: 'El 11 solo puede dividirse de forma exacta entre 1 y 11.',
      conceptTag: 'identificar_primos',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          '¿Cuál es la diferencia principal entre un primo y un compuesto?',
      options: [
        'El primo tiene exactamente 2 factores y el compuesto más de 2.',
        'El primo es impar y el compuesto par.',
        'No hay diferencia.',
        'El compuesto solo se divide por 1.',
      ],
      correctAnswerIndex: 0,
      feedback:
          'La cantidad de factores es lo que define su naturaleza: Primos tienen 2, compuestos tienen 3 o más.',
      conceptTag: 'primos_vs_compuestos',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: '¿Es el número 2 un número primo?',
      options: [
        'Sí, es el único primo par',
        'No, todos los pares son compuestos',
        'No, porque se divide entre 2',
        'Solo a veces',
      ],
      correctAnswerIndex: 0,
      feedback:
          'El 2 solo tiene dos factores (1 y 2). Es primo y es el único primo par que existe.',
      conceptTag: 'identificar_primos',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'El número 1 tiene solo un factor (el mismo 1). ¿Qué tipo de número es?',
      options: ['Ni primo ni compuesto', 'Primo', 'Compuesto', 'Par'],
      correctAnswerIndex: 0,
      feedback:
          'El 1 es un caso especial. No es primo (no tiene 2 factores) ni compuesto (no tiene más de 2).',
      conceptTag: 'primos_vs_compuestos',
    ),
  ];

  // ==========================================
  // NIVEL 5: DESCOMPOSICIÓN PRIMA (4)
  // Tags: "descomposicion_prima"
  // ==========================================
  static final List<LessonSlide> _level5Descomposicion = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Descomposición Prima',
      content:
          'Cualquier número compuesto en el universo puede romperse en piezas más pequeñas hasta que solo queden números primos. ¡Es como el ADN de los números!',
      icon: Icons.biotech,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Árbol de Factores',
      content:
          'Para descomponer un número, lo dividimos paso a paso.\n\nEjemplo: El número 12.\n• 12 = 2 × 6 (El 2 ya es primo, lo encerramos).\n• El 6 se rompe en 2 × 3 (Ambos son primos, los encerramos).\n\nFactores primos de 12: 2 × 2 × 3.',
      icon: Icons.account_tree,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si rompes el número 10 en un árbol de factores, ¿qué números primos obtienes?',
      options: ['2 × 5', '1 × 10', '2 × 3', '5 × 5'],
      correctAnswerIndex: 0,
      feedback:
          'El 10 se divide exactamente en 2 y 5, y ambos ya son números primos.',
      conceptTag: 'descomposicion_prima',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Usando Potencias',
      content:
          'Cuando un número primo se repite en el árbol, usamos potencias para escribirlo más corto.\n\nEn el 12, obtuvimos 2 × 2 × 3. Como el 2 se repite dos veces, lo escribimos como 2² × 3.',
      icon: Icons.superscript,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si un árbol te da 2 × 2 × 2 × 5, ¿cómo lo escribes con potencias?',
      options: ['2³ × 5', '2² × 5', '6 × 5', '2 × 5³'],
      correctAnswerIndex: 0,
      feedback:
          'El número 2 aparece tres veces, por lo tanto se eleva al cubo: 2³ × 5.',
      conceptTag: 'descomposicion_prima',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Descomposición',
      content: 'Resuelve estos 4 ejercicios usando el árbol de factores.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Cuál es la descomposición prima del número 8?',
      options: ['2 × 2 × 2', '2 × 4', '4 × 2', '8 × 1'],
      correctAnswerIndex: 0,
      feedback:
          '8 = 2x4. Luego el 4 = 2x2. El resultado final de puros primos es 2x2x2.',
      conceptTag: 'descomposicion_prima',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: '¿Cuál es la descomposición prima de 18?',
      options: ['2 × 3 × 3', '2 × 9', '3 × 6', '2 × 2 × 3'],
      correctAnswerIndex: 0,
      feedback:
          '18 se divide en 2x9. El 9 se divide en 3x3. Por lo tanto es 2 × 3 × 3.',
      conceptTag: 'descomposicion_prima',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'La expresión 2² × 5 es la descomposición de un número. ¿Qué número es?',
      options: ['20', '10', '25', '14'],
      correctAnswerIndex: 0,
      feedback: 'Resolvemos la expresión: 2² es 4. Luego 4 × 5 = 20.',
      conceptTag: 'descomposicion_prima',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Al hacer el árbol de factores de un número primo (como el 7), ¿qué sucede?',
      options: ['No se puede hacer el árbol', 'Da 7x1', 'Da infinito', 'Da 0'],
      correctAnswerIndex: 0,
      feedback:
          'La descomposición prima solo aplica a los números compuestos. Un primo ya está descompuesto.',
      conceptTag: 'descomposicion_prima',
    ),
  ];

  // ==========================================
  // NIVEL 6: MÁXIMO COMÚN DIVISOR (5)
  // Tags: "concepto_mcd", "calcular_mcd"
  // ==========================================
  static final List<LessonSlide> _level6MCD = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Máximo Común Divisor (MCD)',
      content:
          'A veces necesitamos encontrar el pedazo o factor MÁS GRANDE que puedan compartir dos números distintos al mismo tiempo. Ese es el MCD.',
      icon: Icons.zoom_in_map,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué significa?',
      content:
          'Supongamos que quieres hacer paquetes iguales usando 12 dulces y 8 chocolates, sin que sobre nada. Necesitas encontrar un factor común.\n\nFactores de 12: 1, 2, 3, 4, 6, 12.\nFactores de 8: 1, 2, 4, 8.\n\nEl factor en común MÁS GRANDE es el 4. ¡El MCD es 4!',
      icon: Icons.category,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Conceptualmente, ¿el MCD es un número más grande o más pequeño que los números originales?',
      options: ['Más pequeño o igual', 'Más grande', 'Infinito', 'Cero'],
      correctAnswerIndex: 0,
      feedback:
          'Como es un divisor o factor, no puede ser más grande que los propios números.',
      conceptTag: 'concepto_mcd',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Cómo Calcularlo Rápido',
      content:
          'Para números más grandes, usamos la descomposición prima:\n\n1. Descompón ambos números.\n2. Toma SOLAMENTE los primos que se REPITEN en ambos.\n3. Multiplícalos y obtendrás tu MCD.',
      icon: Icons.construction,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si 10=(2×5) y 15=(3×5), ¿cuál es el único primo que se repite en ambos (su MCD)?',
      options: ['5', '2', '3', '10'],
      correctAnswerIndex: 0,
      feedback:
          'El 5 es el único factor primo que comparten, por lo que su MCD es 5.',
      conceptTag: 'calcular_mcd',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de MCD',
      content: 'Encuentra el mayor divisor común en estos 4 retos.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula el MCD de 6 y 9:',
      options: ['3', '6', '1', '9'],
      correctAnswerIndex: 0,
      feedback:
          'Factores de 6 (1,2,3,6). Factores de 9 (1,3,9). El mayor que comparten es el 3.',
      conceptTag: 'calcular_mcd',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Conceptualmente, ¿para qué sirve el Máximo Común Divisor en la vida real?',
      options: [
        'Para repartir o dividir cosas en partes iguales más grandes posibles',
        'Para multiplicar cosas',
        'Para contar distancias largas',
        'No tiene utilidad',
      ],
      correctAnswerIndex: 0,
      feedback:
          'El MCD es ideal para problemas de reparto exacto sin dejar sobrantes.',
      conceptTag: 'concepto_mcd',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula el MCD de 10 y 20:',
      options: ['10', '5', '2', '20'],
      correctAnswerIndex: 0,
      feedback:
          'El 10 puede dividir tanto al 10 como al 20 de forma exacta. Es el mayor posible.',
      conceptTag: 'calcular_mcd',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Si dos números primos distintos (como 3 y 7) buscan su MCD, ¿cuál será el resultado?',
      options: ['1', '3', '7', '21'],
      correctAnswerIndex: 0,
      feedback:
          'Los números primos solo se dividen por sí mismos y por 1. El único factor que siempre compartirán es el 1.',
      conceptTag: 'concepto_mcd',
    ),
  ];

  // ==========================================
  // NIVEL 7: MÍNIMO COMÚN MÚLTIPLO (6)
  // Tags: "calcular_mcm", "concepto_mcm"
  // ==========================================
  static final List<LessonSlide> _level7MCM = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Mínimo Común Múltiplo (mcm)',
      content:
          'Si el MCD se trata de dividir y hacer pequeño, el Mínimo Común Múltiplo (mcm) se trata de multiplicar y ver cuándo dos cosas coinciden en el futuro.',
      icon: Icons.fast_forward,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué significa?',
      content:
          'Supón que dos buses salen a diferentes horas. El Bus A pasa cada 4 minutos y el Bus B cada 6 min. ¿En qué minuto volverán a encontrarse?\n\nMúltiplos de 4: 4, 8, 12, 16...\nMúltiplos de 6: 6, 12, 18...\n\n¡Ambos coinciden por primera vez en el minuto 12! El mcm es 12.',
      icon: Icons.directions_bus,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Conceptualmente, ¿el mcm suele ser un número más grande o más pequeño que los originales?',
      options: ['Más grande o igual', 'Más pequeño', 'Es siempre 1', 'Cero'],
      correctAnswerIndex: 0,
      feedback:
          'Como es un múltiplo futuro, debe ser igual o más grande que los números de partida.',
      conceptTag: 'concepto_mcm',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Cómo Calcularlo Rápido',
      content:
          'Con la tabla de descomposición:\n1. Coloca ambos números y divídelos juntos por números primos hasta que ambos lleguen a 1.\n2. Multiplica todos los primos que usaste a la derecha.\n¡Ese resultado es tu mcm!',
      icon: Icons.view_column,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si usas los primos 2 y 3 para reducir dos números a 1, ¿cuál es el mcm?',
      options: ['6', '5', '1', '23'],
      correctAnswerIndex: 0,
      feedback: 'Multiplicas los primos utilizados: 2 × 3 = 6.',
      conceptTag: 'calcular_mcm',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Fin de Mundo',
      content: 'Calcula los puntos de encuentro en el futuro.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula el mcm de 3 y 5:',
      options: ['15', '8', '30', '1'],
      correctAnswerIndex: 0,
      feedback:
          'Múltiplos de 3 (3,6,9,12,15) y de 5 (5,10,15). El primero en coincidir es 15.',
      conceptTag: 'calcular_mcm',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Conceptualmente, ¿cuándo usarías el mcm en la vida real?',
      options: [
        'Para calcular cuándo coincidirán dos eventos periódicos',
        'Para dividir una pizza',
        'Para restar dinero',
        'Para ver la edad de alguien',
      ],
      correctAnswerIndex: 0,
      feedback:
          'El mcm es la herramienta perfecta para problemas de coincidencias y tiempos (alarmas, buses, turnos).',
      conceptTag: 'concepto_mcm',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula el mcm de 4 y 8:',
      options: ['8', '32', '12', '4'],
      correctAnswerIndex: 0,
      feedback:
          'Como 8 ya es un múltiplo de 4, el mínimo múltiplo que comparten es el propio 8.',
      conceptTag: 'calcular_mcm',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Calcula el mcm de 2 y 6:',
      options: ['6', '12', '8', '2'],
      correctAnswerIndex: 0,
      feedback:
          'Como 6 está en la tabla de multiplicar del 2, el propio 6 es el primer punto de encuentro.',
      conceptTag: 'calcular_mcm',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Mundo Completado!',
      content:
          '¡Felicidades! Has desentrañado todos los secretos de la Caverna de los Primos.',
      icon: Icons.stars,
    ),
  ];
}
