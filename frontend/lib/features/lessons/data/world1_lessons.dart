import 'lesson_models.dart';

class World1Lessons {
  // Función principal que devuelve la lista de diapositivas según el nivel
  static List<LessonSlide> getLesson(int levelIndex) {
    switch (levelIndex) {
      case 0:
        return _level1Naturales;
      case 1:
        return _level2Enteros;
      case 2:
        return _level3Racionales;
      case 3:
        return _level4SumaResta;
      case 4:
        return _level5Multiplicacion;
      case 5:
        return _level6Division;
      case 6:
        return _level7Combinadas;
      default:
        return _level1Naturales; // Por defecto
    }
  }

  // ==========================================
  // NIVEL 1: NÚMEROS NATURALES
  // ==========================================
  static final List<LessonSlide> _level1Naturales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Números Naturales',
      content:
          '¡Bienvenido al Reino Numérico!\n\nHoy aprenderemos sobre los números más antiguos: Los Números Naturales (N). Son los que usamos para contar.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Cuáles son?',
      content:
          'Empiezan desde el 1 y van hacia el infinito: 1, 2, 3, 4...\n\nUsualmente no incluyen el cero, ya que los usamos para contar objetos reales.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡A practicar!',
      content:
          '¿Cuál de los siguientes conjuntos representa mejor a los números naturales?',
      options: [
        '-1, 0, 1, 2',
        '1, 2, 3, 4...',
        '1.5, 2.5, 3.5',
        '0.1, 0.2, 0.3',
      ],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Demuestra lo que has aprendido. Tienes que responder 5 preguntas seguidas correctamente.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 5',
      content:
          'Si digo "Llegué en 1er lugar", ¿qué uso le estoy dando al número natural?',
      options: [
        'Cardinal (Cantidad)',
        'Ordinal (Orden)',
        'Decimal',
        'Negativo',
      ],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 5',
      content: '¿Cuál de estos números NO es natural?',
      options: ['15', '1000', '-3', '8'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 5',
      content: '¿Qué número natural le sigue a 999?',
      options: ['100', '998', '1000', '1001'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 5',
      content:
          'Las edades de las personas (15 años, 40 años) se expresan con números...',
      options: ['Negativos', 'Naturales', 'Decimales', 'Inimaginables'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 5 de 5',
      content: '¿Cuál es el número natural más pequeño? (Excluyendo el cero)',
      options: ['-1', '0.1', '2', '1'],
      correctAnswerIndex: 3,
    ),
  ];

  // ==========================================
  // NIVEL 2: NÚMEROS ENTEROS
  // ==========================================
  static final List<LessonSlide> _level2Enteros = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Números Enteros (Z)',
      content:
          '¡Las cosas se enfrían!\n\nLos números naturales no eran suficientes para representar deudas o temperaturas bajo cero. Así nacieron los Números Enteros.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Espejo Mágico',
      content:
          'Los Enteros (Z) incluyen a los Naturales (1, 2, 3...), pero añaden el CERO (0) y un "reflejo negativo" para cada número: -1, -2, -3...',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡A practicar!',
      content:
          'Si estás en el piso 3 de un edificio y bajas 5 pisos, ¿en qué piso terminas? (Considerando que hay sótanos)',
      options: ['Piso 0', 'Sótano -1', 'Sótano -2', 'Piso 2'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Demuestra tu dominio sobre los enteros.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 5',
      content: '¿Cuál de estos números es un Entero pero NO un Natural?',
      options: ['5', '0', '14', '100'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 5',
      content:
          '¿Qué es mayor: tener -50 dólares (deber 50) o tener -10 dólares (deber 10)?',
      options: [
        '-50 es mayor',
        '-10 es mayor',
        'Son iguales',
        'Ninguno es un número',
      ],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 5',
      content: 'La temperatura pasó de 2°C a -3°C. ¿Cuántos grados bajó?',
      options: ['1 grado', '5 grados', '3 grados', '2 grados'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 5',
      content: '¿Cuál conjunto representa a los números enteros?',
      options: [
        '1, 2, 3...',
        '0.5, 1.5, 2.5',
        '..., -2, -1, 0, 1, 2, ...',
        'Solo los negativos',
      ],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 5 de 5',
      content:
          'Si el nivel del mar es 0 metros, un submarino a 40 metros de profundidad se representa con:',
      options: ['40', '0.40', '-40', '0'],
      correctAnswerIndex: 2,
    ),
  ];

  // ==========================================
  // NIVEL 3: NÚMEROS RACIONALES
  // ==========================================
  static final List<LessonSlide> _level3Racionales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Racionales (Q)',
      content:
          '¿Qué pasa si cortas una pizza? Ya no tienes 1 pizza entera, tienes porciones. Aquí entran los Números Racionales.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Fracciones y Decimales',
      content:
          'Un número Racional (Q) es CUALQUIER número que se pueda escribir como una fracción (a/b), donde "a" y "b" son enteros, y "b" no es cero.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡A practicar!',
      content: '¿El número 0.5 es un número racional?',
      options: [
        'No, porque tiene punto',
        'Sí, porque es igual a la fracción 1/2',
        'Solo si es positivo',
        'No existe',
      ],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Veamos si lograste entender los racionales.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 5',
      content: '¿El número 4 es un número racional?',
      options: [
        'No, es solo natural',
        'Sí, porque se puede escribir como 4/1',
        'No, es entero',
        'Solo a veces',
      ],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 5',
      content: '¿Cuál de los siguientes NO es un racional?',
      options: ['3/4', '-0.25', '5', 'Un número dividido entre cero (Ej: 5/0)'],
      correctAnswerIndex: 3,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 5',
      content: 'La fracción 2/4 es exactamente igual a qué número decimal?',
      options: ['0.24', '0.4', '0.5', '2.4'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 5',
      content:
          'Comiste 3 porciones de una pizza de 8. ¿Qué número racional representa lo que te comiste?',
      options: ['8/3', '3/8', '3.8', '5/8'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 5 de 5',
      content: 'Todo número Entero es también un número Racional.',
      options: ['Verdadero', 'Falso', 'Solo los pares', 'Solo el cero'],
      correctAnswerIndex: 0,
    ),
  ];

  // ==========================================
  // NIVEL 4: SUMA Y RESTA
  // ==========================================
  static final List<LessonSlide> _level4SumaResta = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Suma y Resta',
      content:
          'Ya conocemos los números. ¡Ahora vamos a jugar con ellos! Empecemos juntando y quitando cantidades.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Signos Iguales y Diferentes',
      content:
          'Regla de oro:\n\n1. Signos iguales se SUMAN y se mantiene el signo (Ej: -2 - 3 = -5).\n2. Signos diferentes se RESTAN y se pone el signo del mayor (Ej: -8 + 5 = -3).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡A practicar!',
      content: 'Resuelve: -10 + 4',
      options: ['-14', '6', '-6', '14'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Ponte a prueba con estas 5 operaciones.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 5',
      content: 'Calcula: 15 - 20',
      options: ['5', '-5', '35', '-35'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 5',
      content: 'Calcula: -7 - 8',
      options: ['-1', '1', '-15', '15'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 5',
      content: 'Calcula: -3 + 12',
      options: ['-9', '9', '-15', '15'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 5',
      content:
          'Tienes una deuda de \$15 (-15) y pagas \$10 (+10). ¿Cuál es tu saldo?',
      options: ['\$5', '-\$5', '-\$25', '\$25'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 5 de 5',
      content: 'Calcula: 0 - 14 + 14',
      options: ['-14', '14', '0', '-28'],
      correctAnswerIndex: 2,
    ),
  ];

  // ==========================================
  // NIVEL 5: MULTIPLICACIÓN
  // ==========================================
  static final List<LessonSlide> _level5Multiplicacion = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Multiplicación',
      content:
          'La multiplicación no es más que una suma rápida y repetida. Pero, ¿qué pasa con los signos?',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Ley de Signos',
      content:
          'Aprende este poema:\n\n(+) x (+) = +\n(-) x (-) = +\n(+) x (-) = -\n(-) x (+) = -\n\n"Amigo de mi amigo es mi amigo (+). Enemigo de mi enemigo es mi amigo (+)."',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡A practicar!',
      content: 'Calcula: (-4) x (-3)',
      options: ['-12', '-7', '12', '7'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Supera el test de multiplicación.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 5',
      content: 'Calcula: 5 x (-6)',
      options: ['-30', '30', '-1', '11'],
      correctAnswerIndex: 0,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 5',
      content: 'Calcula: (-8) x (-2)',
      options: ['-16', '16', '-10', '10'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 5',
      content: 'Al multiplicar un número por CERO, el resultado siempre es...',
      options: ['El mismo número', 'Uno', 'Negativo', 'Cero'],
      correctAnswerIndex: 3,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 5',
      content: 'Calcula: (-1) x (-1) x (-1)',
      options: ['1', '-1', '-3', '3'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 5 de 5',
      content:
          'Si multiplicas un número positivo por uno negativo, el resultado es:',
      options: ['Positivo', 'Negativo', 'Cero', 'Depende de cuál es mayor'],
      correctAnswerIndex: 1,
    ),
  ];

  // ==========================================
  // NIVEL 6: DIVISIÓN
  // ==========================================
  static final List<LessonSlide> _level6Division = [
    LessonSlide(
      type: SlideType.intro,
      title: 'División',
      content:
          'Dividir es repartir en partes iguales. La buena noticia es que usa LA MISMA ley de signos que la multiplicación.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El límite matemático',
      content:
          'OJO: Puedes dividir CERO entre cualquier número (0 / 5 = 0). ¡PERO NUNCA PUEDES DIVIDIR ENTRE CERO! (5 / 0 = Error/Indefinido). El universo explotaría.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡A practicar!',
      content: 'Calcula: (-20) / (-4)',
      options: ['-5', '5', '-16', '16'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Vamos a repartir números con este cuestionario.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 5',
      content: 'Calcula: 18 / (-3)',
      options: ['6', '-6', '15', '-15'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 5',
      content: 'Calcula: (-100) / 10',
      options: ['-10', '10', '1000', '-90'],
      correctAnswerIndex: 0,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 5',
      content: 'Calcula: 0 / (-8)',
      options: ['-8', '8', '0', 'Indefinido'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 5',
      content: 'Calcula: 15 / 0',
      options: ['0', '15', '1', 'Indefinido (No se puede)'],
      correctAnswerIndex: 3,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 5 de 5',
      content:
          'Repartes una deuda de \$30 (-30) entre 3 hermanos. ¿Cuánto le toca a cada uno?',
      options: ['\$10', '-\$10', '-\$30', '\$33'],
      correctAnswerIndex: 1,
    ),
  ];

  // ==========================================
  // NIVEL 7: OPERACIONES COMBINADAS
  // ==========================================
  static final List<LessonSlide> _level7Combinadas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Operaciones Combinadas',
      content:
          'Llegamos al jefe final del Mundo 1.\n\n¿Qué pasa cuando hay sumas, restas y multiplicaciones en una sola ecuación? Tienes que respetar la Jerarquía.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Jerarquía de Operaciones',
      content:
          'Resuelve SIEMPRE en este orden:\n1. Paréntesis\n2. Multiplicaciones y Divisiones\n3. Sumas y Restas\n(Si hay del mismo nivel, se resuelve de izquierda a derecha)',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡A practicar!',
      content: 'Calcula: 2 + 3 x 4\n(Recuerda quién va primero)',
      options: ['20', '14', '24', '9'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'El último reto del Reino Numérico. Demuestra tu jerarquía matemática.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 5',
      content: 'Calcula: 10 - 2 x 3',
      options: ['24', '4', '16', '15'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 5',
      content: 'Calcula: (5 + 3) x 2',
      options: ['11', '16', '13', '10'],
      correctAnswerIndex: 1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 5',
      content: 'Calcula: 20 / 2 + 5',
      options: ['15', '2.8', '10', '25'],
      correctAnswerIndex: 0,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 5',
      content: 'Calcula: 4 + 4 / 4',
      options: ['2', '8', '5', '1'],
      correctAnswerIndex: 2,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 5 de 5',
      content: 'Calcula: -5 + (10 - 2) x 2',
      options: ['6', '11', '26', '-11'],
      correctAnswerIndex: 1,
    ),
  ];
}
