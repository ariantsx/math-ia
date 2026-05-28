import 'lesson_models.dart';

class World1Lessons {
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
        return _level1Naturales;
    }
  }

  // ==========================================
  // NIVEL 1: NÚMEROS NATURALES (N)
  // ==========================================
  static final List<LessonSlide> _level1Naturales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Números Naturales (N)',
      content:
          '¡Bienvenido al Reino Numérico!\n\nImagina que eres un pastor de ovejas hace miles de años. Necesitas saber si todas tus ovejas regresaron a casa. ¿Cómo lo haces? ¡Contando! Así nacieron los números más antiguos de la historia: Los Números Naturales.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Cuáles son y para qué sirven?',
      content:
          'Se representan con la letra "N" y empiezan desde el 1 hacia el infinito: {1, 2, 3, 4, 5...}.\n\nTienen dos usos principales en la vida real:\n1. Cardinales: Para contar cantidades (Ej: Tengo 3 manzanas, tengo 15 años).\n2. Ordinales: Para establecer un orden (Ej: Llegué en 1er lugar, vivo en el 4to piso).',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El misterio del Cero',
      content:
          '¿El Cero (0) es un número natural?\n\nDepende a quién le preguntes. Muchos matemáticos no lo incluyen porque en la naturaleza no señalas algo diciendo "mira, ahí hay cero árboles". Por convención, para contar, empezamos siempre desde el 1.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 1: Uso Ordinal',
      content:
          'Si vas a una carrera de autos y dices: "Mi corredor favorito quedó en la posición 3", ¿qué uso le estás dando al número natural?',
      options: [
        'Decimal',
        'Cardinal (Cantidad)',
        'Ordinal (Orden)',
        'Negativo',
      ],
      correctAnswerIndex: 2,
      feedback:
          '¡Exacto! Cuando hablamos de posiciones (1ro, 2do, 3ro), usamos los números de forma "Ordinal" (para indicar orden).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 2: Identificación',
      content:
          'Si estás contando los alumnos de tu salón, ¿cuál de estos números usarías?',
      options: ['25.5', '-4', '32', '0'],
      correctAnswerIndex: 2,
      feedback:
          'Para contar personas u objetos reales (enteros) se usan los números naturales. No puedes tener "-4 alumnos" ni "25.5 alumnos". 32 es la respuesta.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Demuestra lo que has aprendido. Tienes que responder correctamente para avanzar.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 4',
      content:
          '¿Cuál de los siguientes conjuntos representa mejor a los Números Naturales (N)?',
      options: [
        '-1, 0, 1, 2',
        '1, 2, 3, 4...',
        '1.5, 2.5, 3.5',
        '0.1, 0.2, 0.3',
      ],
      correctAnswerIndex: 1,
      feedback:
          'Los números naturales son los números enteros positivos que usamos para contar objetos reales, empezando desde el 1.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 4',
      content: '¿Cuál de estos números NO es natural?',
      options: ['15', '1000', '-3', '8'],
      correctAnswerIndex: 2,
      feedback:
          'El -3 es un número negativo. No puedes tener "-3 manzanas" físicas en una mesa, por lo que no es un número natural.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 4',
      content:
          'Las edades de las personas (Ej: 15 años, 40 años) se expresan siempre con números...',
      options: ['Negativos', 'Naturales', 'Decimales', 'Inimaginables'],
      correctAnswerIndex: 1,
      feedback:
          'Las edades se cuentan en cantidades enteras positivas, que es la definición exacta de los números naturales.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 4',
      content: '¿Qué número natural le sigue a 999?',
      options: ['100', '998', '1000', '1001'],
      correctAnswerIndex: 2,
      feedback: 'Al igual que al contar, si sumas 1 a 999, obtienes 1000.',
    ),
  ];

  // ==========================================
  // NIVEL 2: NÚMEROS ENTEROS (Z)
  // ==========================================
  static final List<LessonSlide> _level2Enteros = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Números Enteros (Z)',
      content:
          '¡Las cosas se enfrían!\n\nCon el tiempo, la humanidad descubrió que los números naturales no eran suficientes. ¿Cómo representas una deuda de \$5 en el banco? ¿O una temperatura de 10 grados bajo cero? Aquí nacen los Números Enteros.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Espejo Matemático',
      content:
          'Los Números Enteros se representan con la letra "Z". Este conjunto incluye a todos los Naturales (los positivos), incluye al CERO (0) como punto de equilibrio, y añade un "reflejo negativo" para cada número: -1, -2, -3...\n\n- Ganar dinero o subir pisos es positivo (+).\n- Perder dinero o bajar a sótanos son negativos (-).',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Recta Numérica',
      content:
          'Imagina una línea horizontal.\n\nEn el centro exacto está el 0. Hacia la DERECHA avanzan los positivos (1, 2, 3...). Hacia la IZQUIERDA avanzan los negativos (-1, -2, -3...).\n\nRegla de oro: Cualquier número que esté MÁS a la derecha en la recta, siempre será MAYOR.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 1: Sótanos y Ascensores',
      content:
          'Si estás en el piso 3 de un edificio (+3) y el ascensor baja 5 pisos de golpe, ¿en qué piso terminas? (Considerando que el edificio tiene sótanos).',
      options: ['Piso 0', 'Sótano -1', 'Sótano -2', 'Piso 2'],
      correctAnswerIndex: 2,
      feedback:
          'Bajas 3 pisos para llegar a la planta baja (0). Aún te faltan bajar 2 pisos más, lo que te deja en el Sótano -2. Matemáticamente: 3 - 5 = -2.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 2: ¿Quién es mayor?',
      content:
          'Pensando en la Recta Numérica (y en el dinero), ¿qué es mayor: tener -20 o tener -2?',
      options: ['-20 es mayor', '-2 es mayor', 'Son iguales', 'Ninguno existe'],
      correctAnswerIndex: 1,
      feedback:
          'El -2 está más a la derecha en la recta numérica (más cerca del cero). En la vida real: deber \$2 (-2) es mucho mejor situación que deber \$20 (-20).',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Demuestra tu dominio sobre las temperaturas y las deudas.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 4',
      content: '¿Qué es mayor: una temperatura de -15°C o de -5°C?',
      options: ['-15°C', '-5°C', 'Son igual de frías', 'Cero'],
      correctAnswerIndex: 1,
      feedback:
          '-5°C está más cerca de los números positivos. -15°C representa muchísimo más frío.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 4',
      content:
          'La temperatura al amanecer era de 2°C positivos. Al mediodía pasó a -3°C. ¿Cuántos grados bajó en total la temperatura?',
      options: ['1 grado', '5 grados', '3 grados', '2 grados'],
      correctAnswerIndex: 1,
      feedback:
          'Bajó 2 grados para llegar a 0°C, y luego bajó 3 grados más para llegar a -3°C. En total, el descenso fue de 5 grados.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 4',
      content:
          'Si el nivel del mar es 0 metros, un submarino a 40 metros de profundidad se representa con:',
      options: ['40', '0.40', '-40', '0'],
      correctAnswerIndex: 2,
      feedback:
          'Todo lo que está por debajo del nivel del mar (o de la tierra) se considera profundidad, y matemáticamente se representa con números negativos (-).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 4',
      content:
          '¿Cuál de estos números es un Entero (Z) pero NO un Natural (N)?',
      options: ['5', '0', '14', '100'],
      correctAnswerIndex: 1,
      feedback:
          'El cero (0) y todos los negativos pertenecen a los Enteros (Z), pero no a los Naturales (N), ya que estos últimos son del 1 en adelante.',
    ),
  ];

  // ==========================================
  // NIVEL 3: NÚMEROS RACIONALES (Q)
  // ==========================================
  static final List<LessonSlide> _level3Racionales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Racionales (Q)',
      content:
          '¡Hora de la pizza!\n\n¿Qué pasa si compartes una pizza con tus amigos? Ya no tienes "1 pizza entera", tienes porciones. Aquí entran los Números Racionales, que sirven para representar fragmentos o pedazos de cosas enteras.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Fracciones y Decimales',
      content:
          'Un número Racional (Q) es CUALQUIER número que se pueda escribir como una fracción matemática (a/b), donde el número de abajo (el denominador "b") NUNCA puede ser cero.\n\nEjemplos de Racionales:\n- Una fracción: 1/2, 3/4.\n- Un decimal exacto: 0.5 (que es lo mismo que 1/2).',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El secreto de los enteros',
      content:
          '¿Sabías que el número 5 también es racional?\n\n¡Así es! Todos los enteros son racionales porque puedes disfrazarlos de fracción simplemente poniéndoles un "1" abajo. Ej: 5 = 5/1, -8 = -8/1.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 1: La Pizza',
      content:
          'Comiste 3 porciones de una pizza que estaba cortada en 8 pedazos. ¿Qué número racional representa la cantidad de pizza que te comiste?',
      options: ['8/3', '3/8', '3.8', '5/8'],
      correctAnswerIndex: 1,
      feedback:
          'El denominador (abajo) es el total de pedazos (8) y el numerador (arriba) son los pedazos que tomaste (3). Por lo tanto, tomaste 3/8.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 2: Decimales y fracciones',
      content: '¿El número 0.75 es un número racional?',
      options: [
        'Sí, equivale a 3/4',
        'No, porque tiene punto decimal',
        'Solo si es entero',
        'Es irracional',
      ],
      correctAnswerIndex: 0,
      feedback:
          '0.75 equivale exactamente a la fracción 3/4. Todo decimal exacto que pueda volverse fracción es racional.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Demuestra que dominas el arte de partir las cosas en pedazos.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 4',
      content: '¿El número 0.5 es un número racional?',
      options: [
        'No, porque tiene un punto',
        'Sí, porque equivale a la fracción 1/2',
        'Solo si es positivo',
        'No existe',
      ],
      correctAnswerIndex: 1,
      feedback:
          'Cualquier número decimal exacto puede convertirse a fracción (como 0.5 = 1/2), por lo que es racional.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 4',
      content:
          '¿Cuál de los siguientes números NO se considera un número racional (es un error matemático)?',
      options: ['3/4', '-0.25', '5', '5/0 (Dividido entre cero)'],
      correctAnswerIndex: 3,
      feedback:
          'Nunca, jamás, se puede dividir un número entre cero. Es una indefinición matemática (un error), por lo tanto, no es racional.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 4',
      content:
          'Si simplificas (reduces) la fracción 2/4 a su mínima expresión, ¿qué fracción obtienes?',
      options: ['1/4', '2/2', '1/2', '4/8'],
      correctAnswerIndex: 2,
      feedback:
          'Si divides tanto el número de arriba (2) como el de abajo (4) entre dos, obtienes 1/2. Son fracciones equivalentes.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 4',
      content:
          '¿La afirmación "Todo número Entero es también un número Racional" es Verdadera o Falsa?',
      options: [
        'Verdadera',
        'Falsa',
        'Solo aplica a pares',
        'Solo aplica al cero',
      ],
      correctAnswerIndex: 0,
      feedback:
          'Es verdadera. Todo entero puede convertirse en fracción poniéndole un "1" abajo (Ej: 8 = 8/1).',
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
          'Ya conocemos a las familias de los números. ¡Ahora vamos a jugar con ellos en el campo de batalla! Empezaremos con las operaciones de juntar y quitar.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Batalla de los Signos',
      content:
          'Cuando sumas o restas números, imagina que los positivos (+) y negativos (-) son ejércitos enemigos. Aplica estas dos reglas de oro:\n\n1. Signos IGUALES se UNEN (se suman sus valores) y mantienen su bandera (signo). Ej: -2 - 3 = -5.\n2. Signos DIFERENTES se PELEAN (se restan sus valores) y gana el ejército más grande (se pone el signo del número mayor). Ej: -8 + 5 = -3.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Truco del Banco',
      content:
          'Si te confundes, piénsalo como dinero:\n- Positivos (+) = Dinero en tu bolsillo.\n- Negativos (-) = Deudas.\n\nSi tienes -10 (debes 10) y ganas +15, pagas la deuda y te sobran +5 en tu bolsillo.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 1: Signos diferentes',
      content:
          'Aplica la regla de signos diferentes: Tienes un -10 y un +4. ¿Cuál es el resultado de: -10 + 4 ?',
      options: ['-14', '6', '-6', '14'],
      correctAnswerIndex: 2,
      feedback:
          'Como son signos diferentes, se restan (10 - 4 = 6). Y como el número más grande (el 10) es negativo, el resultado hereda ese signo: -6.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 2: Signos iguales',
      content: 'Aplica la regla de signos iguales. Calcula: -5 - 2',
      options: ['-7', '3', '-3', '7'],
      correctAnswerIndex: 0,
      feedback:
          'Al ser signos iguales, ambos ejércitos negativos se unen sumando sus fuerzas (5+2=7) y mantienen su bandera negativa (-7).',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Ponte a prueba con estas 4 operaciones. ¡Cuidado con los signos!',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 4',
      content: 'Calcula el resultado de: 15 - 20',
      options: ['5', '-5', '35', '-35'],
      correctAnswerIndex: 1,
      feedback:
          'Es como tener \$15 pero intentar gastar \$20. Te quedarás debiendo 5, es decir, el resultado es -5.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 4',
      content: 'Calcula el resultado de: -7 - 8',
      options: ['-1', '1', '-15', '15'],
      correctAnswerIndex: 2,
      feedback:
          'Como ambos números tienen el mismo signo (-), se unen (7+8=15) y mantienen su bandera negativa. El resultado es -15.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 4',
      content: 'Calcula el resultado de: -3 + 12',
      options: ['-9', '9', '-15', '15'],
      correctAnswerIndex: 1,
      feedback:
          'Son signos diferentes, así que se restan (12-3=9). El 12 es el mayor y es positivo, así que el resultado es 9 positivo.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 4',
      content:
          'Tienes un saldo de -\$15 (debes dinero). Vas a depositar \$10 (+10). ¿Cuál es tu nuevo saldo bancario?',
      options: ['\$5', '-\$5', '-\$25', '\$25'],
      correctAnswerIndex: 1,
      feedback:
          'La operación es -15 + 10. Pagas 10 de tu deuda, pero sigues debiendo 5. El saldo es -5.',
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
          'La multiplicación es simplemente un atajo. Si quieres sumar el número 5 cien veces, es más fácil multiplicar 5 x 100. Pero en álgebra, lo importante son los signos.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Ley de Signos',
      content:
          'Memoriza esta tabla obligatoria para multiplicaciones y divisiones:\n\n(+) x (+) = +\n(-) x (-) = +\n(+) x (-) = -\n(-) x (+) = -\n\n¡Si multiplicas signos IGUALES siempre da positivo! ¡Si multiplicas signos DIFERENTES da negativo!',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Truco Mental para Signos',
      content:
          'Imagina esto:\n- El (+) es un "Amigo"\n- El (-) es un "Enemigo"\n\n(+) x (+): El amigo de mi amigo, es mi AMIGO (+).\n(-) x (-): El enemigo de mi enemigo, es mi AMIGO (+).\n(+) x (-): El amigo de mi enemigo, es mi ENEMIGO (-).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 1: Enemigo del enemigo',
      content: 'Calcula: (-4) x (-3)',
      options: ['-12', '-7', '12', '7'],
      correctAnswerIndex: 2,
      feedback:
          'Primero multiplicas los números: 4 x 3 = 12. Luego los signos: menos por menos (-) x (-) da más (+). El resultado es 12 positivo.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 2: El poder del Cero',
      content: '¿Cuánto es: (-99) x 0 ?',
      options: ['-99', '99', '0', 'Indefinido'],
      correctAnswerIndex: 2,
      feedback:
          'El cero es el "elemento absorbente". No importa qué tan grande o negativo sea el número, si lo multiplicas por 0, el resultado SIEMPRE será 0.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Supera el test de multiplicación y demuestra que dominas la Ley de Signos.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 4',
      content: 'Calcula: 5 x (-6)',
      options: ['-30', '30', '-1', '11'],
      correctAnswerIndex: 0,
      feedback:
          'El 5 es positivo y el 6 negativo. Más por menos es menos. 5 x 6 = 30. Resultado: -30.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 4',
      content: 'Calcula: (-8) x (-2)',
      options: ['-16', '16', '-10', '10'],
      correctAnswerIndex: 1,
      feedback:
          'Menos por menos es más (+). 8 x 2 = 16. El resultado es 16 positivo.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 4',
      content:
          'Si multiplicas un número negativo por otro negativo, el resultado siempre será:',
      options: ['Negativo', 'Cero', 'Positivo', 'Se restan'],
      correctAnswerIndex: 2,
      feedback:
          'Por la ley de signos, negativo por negativo SIEMPRE da positivo: (-) x (-) = (+).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 4',
      content: 'Analiza en cadena. Calcula: (-1) x (-1) x (-1)',
      options: ['1', '-1', '-3', '3'],
      correctAnswerIndex: 1,
      feedback:
          'Paso a paso: (-1) x (-1) da +1 positivo. Luego, ese (+1) lo multiplicas por el último (-1), lo cual vuelve a dar -1 negativo como resultado final.',
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
          'Dividir es repartir algo en partes iguales. La excelente noticia es que la división usa EXACTAMENTE la misma Ley de Signos que acabas de aprender en la multiplicación.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Repartir Deudas',
      content:
          'Dividir con signos negativos suele usarse para deudas.\n\nEjemplo: Tienes una deuda de \$20 (-20) y la repartes entre tú y tu hermano (2). -20 / 2 = -10. ¡Cada uno debe \$10!\n\nNota que (-) dividido entre (+) dio (-).',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Gran Peligro del Cero',
      content:
          'En las divisiones hay un límite matemático que NUNCA debes cruzar:\n\n- SÍ puedes dividir cero: Si tienes 0 manzanas y las repartes a 5 amigos, cada uno recibe 0 (0 / 5 = 0).\n- NUNCA puedes dividir ENTRE cero: (Ej: 5 / 0). Tratar de repartir 5 manzanas entre "nadie" no tiene sentido. Dará Error matemático.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 1: Signos iguales',
      content:
          'Aplica la ley de signos (menos entre menos). Calcula: (-20) / (-4)',
      options: ['-5', '5', '-16', '16'],
      correctAnswerIndex: 1,
      feedback:
          'Menos entre menos da más (+). Luego divides 20 entre 4. El resultado es 5 positivo.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 2: El límite del universo',
      content: '¿Qué pasaría si intentas calcular 10 / 0 en tu examen?',
      options: ['Da 0', 'Da 10', 'Da 1', 'Es Indefinido (Error)'],
      correctAnswerIndex: 3,
      feedback:
          '¡Dividir entre cero no existe! Es una operación matemáticamente indefinida y causará un error en cualquier calculadora.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Vamos a repartir números con este último cuestionario de operaciones simples.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 4',
      content: 'Calcula: 18 / (-3)',
      options: ['6', '-6', '15', '-15'],
      correctAnswerIndex: 1,
      feedback:
          'Positivo entre negativo da negativo (-). 18 entre 3 es 6. Resultado: -6.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 4',
      content: 'Calcula: (-100) / 10',
      options: ['-10', '10', '1000', '-90'],
      correctAnswerIndex: 0,
      feedback:
          'Negativo entre positivo da negativo (-). 100 dividido entre 10 es 10. Resultado: -10.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 4',
      content: 'Calcula: 0 / (-8)',
      options: ['-8', '8', '0', 'Indefinido'],
      correctAnswerIndex: 2,
      feedback:
          'Cero dividido entre CUALQUIER número (excepto 0), siempre es 0. "Repartir nada entre 8 personas, toca a nada".',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 4',
      content:
          'Tienes una gran deuda total de \$30 (-30) y la divides a partes iguales entre 3 hermanos. ¿Cuánto le toca deber a cada uno?',
      options: ['\$10', '-\$10', '-\$30', '\$33'],
      correctAnswerIndex: 1,
      feedback:
          'Divides la deuda: (-30) / 3. Negativo entre positivo da negativo. A cada hermano le toca una deuda de -10.',
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
          'Llegamos al jefe final del Mundo 1.\n\n¿Qué pasa cuando hay sumas, restas y multiplicaciones en una sola ecuación larga? No puedes resolverlas como tú quieras, debes respetar las reglas de la Jerarquía.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Jerarquía de Operaciones (PEMDAS)',
      content:
          'Resuelve SIEMPRE en este estricto orden:\n\n1. P: Paréntesis (Se resuelve primero).\n2. E: Exponentes/Raíces.\n3. M y D: Multiplicaciones y Divisiones.\n4. S y R: Sumas y Restas (Van siempre al final).\n\n*Nota: Si hay operaciones del mismo nivel juntas, lee de izquierda a derecha.*',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El error más común',
      content:
          'Mira este ejemplo: 2 + 3 x 4\n\n- Camino Erróneo: Sumo 2+3=5, y lo multiplico por 4 = 20. ❌\n- Camino Correcto: Por la Jerarquía, PRIMERO multiplico 3x4=12. LUEGO sumo 2+12 = 14. ✅\n\n¡La multiplicación es más poderosa que la suma!',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 1: La Trampa',
      content: 'Respeta la jerarquía. Calcula el resultado de: 10 - 2 x 3',
      options: ['24', '4', '16', '15'],
      correctAnswerIndex: 1,
      feedback:
          'Por la jerarquía, la multiplicación (2 x 3 = 6) se hace PRIMERO. Luego restas 10 - 6. La respuesta correcta es 4.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica 2: El Poder de los Paréntesis',
      content: 'Ahora intenta este: (10 - 2) x 3',
      options: ['24', '4', '16', '15'],
      correctAnswerIndex: 0,
      feedback:
          '¡Los paréntesis son los reyes! Obligan a hacer la resta primero: (10 - 2) = 8. Luego multiplicas el resultado: 8 x 3 = 24.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'El último reto del Reino Numérico. Demuestra que sabes en qué orden atacar.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1 de 4',
      content: 'Calcula el resultado de: 5 + 5 x 2',
      options: ['20', '15', '25', '10'],
      correctAnswerIndex: 1,
      feedback:
          'Primero la multiplicación: 5 x 2 = 10. Luego la suma: 5 + 10 = 15.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2 de 4',
      content: 'Calcula el resultado de: (5 + 5) x 2',
      options: ['20', '15', '25', '10'],
      correctAnswerIndex: 0,
      feedback:
          'El paréntesis obliga a hacer la suma primero: (5 + 5) = 10. Luego multiplicas: 10 x 2 = 20.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3 de 4',
      content: 'Calcula el resultado de: 20 / 2 + 5',
      options: ['15', '2.8', '10', '25'],
      correctAnswerIndex: 0,
      feedback:
          'La división tiene prioridad sobre la suma. Primero 20 / 2 = 10. Luego le sumas 5. El resultado es 15.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4 de 4',
      content: 'Un reto final combinando todo. Calcula: -5 + (10 - 2) x 2',
      options: ['6', '11', '26', '-11'],
      correctAnswerIndex: 1,
      feedback:
          'Paso 1, paréntesis: (10 - 2) = 8. Paso 2, multiplicar: 8 x 2 = 16. Paso 3, sumar/restar con signos diferentes: -5 + 16 = 11 positivo. ¡Felicidades!',
    ),
  ];
}
