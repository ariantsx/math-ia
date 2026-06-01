import 'package:flutter/material.dart';
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
          '¡Bienvenido al Reino Numérico!\n\nImagina que eres un pastor de ovejas hace miles de años. Necesitas saber si todas regresaron a casa. ¿Cómo lo haces? ¡Contando! Así nacieron los Números Naturales.',
      lottieUrl: 'assets/lottie/castillo.json',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Cantidad y Orden',
      content:
          'Los Naturales (N) empiezan en 1 hacia el infinito: {1, 2, 3...}.\n\nTienen dos grandes usos:\n1. Cardinales: Sirven para decir "cuántos" hay. (Ej: 3 manzanas, 15 años).\n2. Ordinales: Sirven para decir "en qué posición" están. (Ej: 1er lugar, 4to piso).',
      icon: Icons.format_list_numbered,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si en un torneo de videojuegos dices: "Quedé en la posición 2", ¿qué uso le das al número natural?',
      options: [
        'Uso decimal',
        'Uso Cardinal (Cantidad)',
        'Uso Ordinal (Orden)',
        'Uso negativo',
      ],
      correctAnswerIndex: 2,
      feedback:
          '¡Exacto! Al hablar de posiciones (1ro, 2do, 3ro) usamos los números de forma Ordinal.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Misterio del Cero',
      content:
          '¿El Cero (0) es un número natural?\n\nDepende a quién le preguntes. Muchos matemáticos no lo incluyen porque en la naturaleza no señalas algo diciendo "mira, ahí hay cero árboles". Por convención, para contar, empezamos desde el 1.',
      icon: Icons.exposure_zero,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Antecesor y Sucesor',
      content:
          'Otra magia de los Naturales es que siempre tienen un vecino.\n\n- Sucesor: El número que sigue (le sumas 1). El sucesor de 5 es 6.\n- Antecesor: El número que está antes (le restas 1). El antecesor de 5 es 4.',
      icon: Icons.compare_arrows,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¡Aplica lo aprendido!',
      content: '¿Cuál es el sucesor del número 999?',
      options: ['998', '100', '1000', '1001'],
      correctAnswerIndex: 2,
      feedback: 'El sucesor se halla sumando 1. 999 + 1 = 1000.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'La regla del 1',
      content: '¿Cuál es el antecesor del número 1 en los Números Naturales?',
      options: ['El 2', 'El 0', 'El -1', 'No tiene antecesor natural'],
      correctAnswerIndex: 3,
      feedback:
          '¡Cuidado con la trampa! Como los números naturales empiezan en el 1, el 1 es el único que no tiene un antecesor dentro de su propia familia.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Lo que NO son Naturales',
      content:
          'No puedes tener "media oveja" ni puedes contar "-3 árboles".\n\nPor lo tanto, los números con punto decimal (2.5) o con signos negativos (-4) NUNCA son Números Naturales.',
      icon: Icons.block,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Identifica al intruso',
      content:
          'Estás contando los alumnos de tu salón. ¿Qué número de los siguientes NO podrías usar jamás?',
      options: ['25', '14', '32.5', '8'],
      correctAnswerIndex: 2,
      feedback:
          'No existe tal cosa como "32 alumnos y medio". Para contar objetos reales indivisibles usamos siempre números naturales (enteros positivos).',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Demuestra todo lo que has aprendido. Tienes que responder correctamente para ganar tus monedas.',
      icon: Icons.emoji_events,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Cuál conjunto representa a los Números Naturales (N)?',
      options: ['-1, 0, 1, 2', '1, 2, 3, 4...', '1.5, 2.5, 3.5', '0.1, 0.2'],
      correctAnswerIndex: 1,
      feedback:
          'Los naturales son enteros positivos que usamos para contar, desde el 1 al infinito.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Las edades de las personas (Ej: 15 años) se expresan siempre con números...',
      options: ['Negativos', 'Naturales', 'Decimales', 'Imaginarios'],
      correctAnswerIndex: 1,
      feedback:
          'Las edades completas se cuentan en cantidades enteras y positivas.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: '¿El -5 es un número natural?',
      options: [
        'Sí, es cardinal',
        'Sí, es ordinal',
        'No, es negativo',
        'Depende',
      ],
      correctAnswerIndex: 2,
      feedback:
          'Los números negativos no pertenecen a los naturales porque no puedes "contar" objetos en negativo en el mundo real.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Si vas en el piso 5 y subes 1 piso, ¿has hallado el...?',
      options: ['Antecesor', 'Sucesor', 'Cero', 'Decimal'],
      correctAnswerIndex: 1,
      feedback:
          'Sumar 1 a cualquier número natural te da como resultado su sucesor (6).',
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
          '¡Las cosas se enfrían!\n\n¿Cómo representas una deuda de \$5? ¿O una temperatura de 10 grados bajo cero? Aquí nacen los Números Enteros.',
      icon: Icons.ac_unit,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Espejo Matemático',
      content:
          'Los Enteros (Z) incluyen a los Naturales, incluyen al Cero (0), pero añaden algo nuevo: El reflejo negativo (-1, -2, -3...).\n\nEn la vida real:\n(+) Positivo: Dinero a favor, subir pisos, sobre el nivel del mar.\n(-) Negativo: Deudas, bajar al sótano, profundidad del mar.',
      icon: Icons.import_export,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica de Vida Real',
      content:
          'Si estás en la planta baja (piso 0) y bajas 3 pisos en el ascensor para buscar tu auto, ¿en qué piso estás?',
      options: ['Piso 3', 'Piso 0', 'Sótano -3', 'Sótano -1'],
      correctAnswerIndex: 2,
      feedback:
          'Al bajar del cero, entramos al territorio de los números negativos. Llegaste al -3.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Recta Numérica',
      content:
          'Imagina una línea horizontal.\n\nEn el centro exacto está el 0. Hacia la DERECHA avanzan los positivos. Hacia la IZQUIERDA avanzan los negativos.\n\nRegla de oro: Cualquier número que esté MÁS a la DERECHA siempre será MAYOR.',
      icon: Icons.linear_scale,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Distancias y Valor Absoluto',
      content:
          '¿A cuántos pasos del cero está el -4?\n\n¡A 4 pasos! A esto se le llama "Valor Absoluto". La distancia siempre es positiva, sin importar el signo. El valor absoluto de -4 se escribe |-4| y es simplemente 4.',
      icon: Icons.route,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: '¿Quién es mayor?',
      content: 'Siguiendo la regla de la Recta Numérica. ¿Qué número es MAYOR?',
      options: ['-20', '-2', '-50', '-100'],
      correctAnswerIndex: 1,
      feedback:
          'El -2 está más a la derecha (más cerca del cero) que los demás. Piensa en dinero: Deber \$2 es mucho mejor (mayor) que deber \$100.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pasos en la recta',
      content:
          '¿Cuál es el Valor Absoluto de -15? (Es decir, su distancia hasta el cero)',
      options: ['-15', '0', '15', '1'],
      correctAnswerIndex: 2,
      feedback:
          'Las distancias nunca pueden ser negativas. El valor absoluto (la cantidad pura sin signo) de -15 es simplemente 15.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Desplazamientos',
      content:
          'Si te mueves por la recta:\nSumar es caminar hacia la derecha.\nRestar es caminar hacia la izquierda.\n\nSi estás en el -2 y sumas 5 pasos a la derecha, cruzarás el cero y llegarás al +3.',
      icon: Icons.directions_walk,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'A caminar',
      content:
          'La temperatura al amanecer era de -3°C. Al mediodía el sol calentó y la temperatura subió 5 grados. ¿Cuál es la temperatura ahora?',
      options: ['-8°C', '8°C', '2°C', '-2°C'],
      correctAnswerIndex: 2,
      feedback:
          'Estás en -3. Caminas 5 pasos a la derecha: -2, -1, 0, 1, 2. La nueva temperatura es 2°C positivos.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Prepara tu mente para la prueba de los Números Enteros.',
      icon: Icons.emoji_events,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'Si el nivel del mar es 0, un submarino a 40 metros de profundidad es:',
      options: ['40', '0.40', '-40', '0'],
      correctAnswerIndex: 2,
      feedback:
          'La profundidad o todo lo que está por debajo del límite 0 es negativo (-).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: '¿Qué es mayor: una temperatura de -15°C o de -5°C?',
      options: ['-15°C', '-5°C', 'Son igual de frías', 'Cero'],
      correctAnswerIndex: 1,
      feedback: '-5°C está más a la derecha en la recta numérica que -15°C.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: '¿Cuál de estos números es Entero (Z) pero NO Natural (N)?',
      options: ['5', '0', '14', '100'],
      correctAnswerIndex: 1,
      feedback:
          'El cero (0) y los negativos son enteros, pero no naturales (los naturales empiezan en 1).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'El Valor Absoluto de -99 es:',
      options: ['-99', '99', '0', '1'],
      correctAnswerIndex: 1,
      feedback:
          'El valor absoluto es la distancia al cero, siempre se expresa en positivo (99).',
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
          '¡Hora de la pizza!\n\n¿Qué pasa si compartes una pizza con tus amigos? Ya no tienes "1 entera", tienes porciones. Aquí entran los Racionales, para representar pedazos.',
      icon: Icons.local_pizza,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Las Fracciones',
      content:
          'Un Racional (Q) es CUALQUIER número que se pueda escribir como fracción (a / b).\n\n- Numerador (arriba): Cuántos pedazos tomas.\n- Denominador (abajo): En cuántos pedazos iguales se cortó todo.',
      icon: Icons.pie_chart,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Corte de Pizza',
      content:
          'Una pizza se cortó en 8 pedazos iguales y te comiste 3. ¿Qué número racional representa lo que te comiste?',
      options: ['8/3', '3/8', '3.8', '5/8'],
      correctAnswerIndex: 1,
      feedback:
          'El total de cortes va abajo (8) y lo que tomas va arriba (3). La respuesta es 3/8.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Los Decimales',
      content:
          'Toda fracción es en realidad una división escondida.\nSi divides la fracción 1/2 (1 entre 2), el resultado es 0.5.\n\n¡Por lo tanto, todo decimal exacto es también un número racional disfrazado!',
      icon: Icons.calculate,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Límite del Cero',
      content:
          'Hay una regla sagrada en los Racionales:\n\nEl denominador (el de abajo) NUNCA puede ser cero. Tratar de hacer la fracción 5/0 (repartir 5 pizzas entre nadie) causará un Error Matemático.',
      icon: Icons.warning,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Conversiones',
      content: '¿El número decimal 0.25 es un número racional?',
      options: [
        'No, tiene punto',
        'Sí, es igual a 1/4',
        'Solo si es negativo',
        'Es entero',
      ],
      correctAnswerIndex: 1,
      feedback:
          '0.25 es el resultado de dividir 1/4. Todo decimal exacto es racional.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'La regla sagrada',
      content:
          '¿Cuál de estos NO se considera un número racional (es un error)?',
      options: ['3/4', '-0.5', '5 / 0', '0 / 5'],
      correctAnswerIndex: 2,
      feedback:
          'Nunca puedes dividir entre cero. (0/5 sí existe, da 0, pero 5/0 es indefinido).',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El truco de los Enteros',
      content:
          '¿El número entero 5 es racional?\n\n¡SÍ! Todo número entero o natural pertenece también a los Racionales. Para convertir un entero en fracción, solo ponle un "1" debajo. (Ej: 5 = 5/1).',
      icon: Icons.swap_vert,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Disfrazando enteros',
      content:
          'Si quiero escribir el número negativo -8 como un número racional (fracción), ¿cómo lo hago?',
      options: ['-8/8', '8/-1', '-8/1', 'No se puede'],
      correctAnswerIndex: 2,
      feedback:
          'Cualquier entero se vuelve fracción poniéndole un 1 como denominador. -8 dividido entre 1 sigue siendo -8.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Demuestra que dominas el arte de partir las cosas en pedazos.',
      icon: Icons.emoji_events,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Qué número va en el Denominador de una fracción?',
      options: [
        'Lo que tomo',
        'El total de partes iguales',
        'El Cero',
        'El mayor',
      ],
      correctAnswerIndex: 1,
      feedback:
          'El denominador (abajo) indica en cuántas partes iguales se dividió el entero.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'La fracción 2/4 es exactamente igual a:',
      options: ['1/4', '0.25', '1/2', '4/8'],
      correctAnswerIndex: 2,
      feedback:
          'Si simplificas (divides la mitad arriba y abajo), 2/4 es equivalente a 1/2 (0.5).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'La afirmación "Todo número Entero es Racional" es:',
      options: ['Verdadera', 'Falsa', 'A veces', 'Depende'],
      correctAnswerIndex: 0,
      feedback:
          'Es verdadera. Todo entero se vuelve fracción agregándole un 1 abajo.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Si comes la mitad de un pastel, te comiste:',
      options: ['1/3', '0.2', '2/1', '0.5'],
      correctAnswerIndex: 3,
      feedback: 'La mitad es 1/2, que en número decimal se escribe como 0.5.',
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
      icon: Icons.add_circle_outline,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Batalla de Signos 1',
      content:
          'Regla #1: SIGNOS IGUALES SE SUMAN.\n\nSi dos números tienen el mismo signo, sus "ejércitos" se unen (sumas los números) y mantienen su bandera (el signo original).\nEj: 3 + 4 = 7\nEj: -2 - 3 = -5',
      icon: Icons.group_add,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Unión de fuerzas',
      content: 'Aplica la regla de signos iguales. Calcula: -5 - 2',
      options: ['-7', '3', '-3', '7'],
      correctAnswerIndex: 0,
      feedback:
          'Al ser signos iguales (- y -), los números se suman (5+2=7) y se mantiene la bandera negativa (-7).',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Batalla de Signos 2',
      content:
          'Regla #2: SIGNOS DIFERENTES SE RESTAN.\n\nSi chocan un positivo y un negativo, pelean (se restan). ¿Quién gana? Se pone el signo del número más grande.\nEj: -8 + 5 = -3 (Restamos, y como el 8 es mayor y es negativo, gana el menos).',
      icon: Icons.sports_martial_arts,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El truco del Banco',
      content:
          'Si te confundes con la resta, usa dinero:\n- Positivos (+) = Dinero en mi bolsillo.\n- Negativos (-) = Deudas.\n\nSi debo \$10 (-10) y pago con \$15 (+15), cubro la deuda y me sobran \$5 en mi bolsillo (+5).',
      icon: Icons.account_balance_wallet,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Choque de ejércitos',
      content: 'Aplica la regla de signos diferentes: -10 + 4',
      options: ['-14', '6', '-6', '14'],
      correctAnswerIndex: 2,
      feedback:
          'Signos diferentes se restan (10 - 4 = 6). El mayor es 10 (negativo), así que el resultado hereda el signo (-6).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pagando deudas',
      content:
          'Tienes un saldo de -\$15 (debes dinero). Vas a depositar \$10 (+10). ¿Cuál es tu nuevo saldo bancario?',
      options: ['\$5', '-\$5', '-\$25', '\$25'],
      correctAnswerIndex: 1,
      feedback:
          'La operación es -15 + 10. Pagas 10 de tu deuda, pero sigues debiendo 5. El saldo es -5.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Choque de dos signos',
      content:
          'A veces verás dos signos pegados: Ej: 5 - (-2)\n\n¡Dos negativos pegados se convierten en un positivo!\nEs como decir "Le quito (-) una deuda (-)", lo cual es algo bueno (+).\n5 - (-2) se convierte en 5 + 2 = 7.',
      icon: Icons.exposure_plus_1,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Rompiendo signos',
      content: 'Calcula: 10 - (-5)',
      options: ['5', '-5', '15', '-15'],
      correctAnswerIndex: 2,
      feedback:
          'El menos y el menos pegados se transforman en más. La operación real es 10 + 5 = 15.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content: 'Ponte a prueba con estas operaciones. ¡Cuidado con los signos!',
      icon: Icons.emoji_events,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula: 15 - 20',
      options: ['5', '-5', '35', '-35'],
      correctAnswerIndex: 1,
      feedback: 'Tienes 15 pero gastas 20. Quedas debiendo 5 (-5).',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Calcula: -7 - 8',
      options: ['-1', '1', '-15', '15'],
      correctAnswerIndex: 2,
      feedback: 'Signos iguales se suman y mantienen el signo: -15.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula: -3 + 12',
      options: ['-9', '9', '-15', '15'],
      correctAnswerIndex: 1,
      feedback:
          'Signos diferentes se restan (12-3=9). El 12 es el mayor y es positivo.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Calcula: -4 - (-4)',
      options: ['-8', '8', '0', '-16'],
      correctAnswerIndex: 2,
      feedback: '-(-4) se vuelve +4. Entonces, -4 + 4 se restan y da 0.',
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
          'La multiplicación es simplemente un atajo de la suma. En álgebra, lo único nuevo que debes aprender es qué pasa con los signos.',
      icon: Icons.clear,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Ley de Signos',
      content:
          'Memoriza esta tabla obligatoria:\n\n(+) x (+) = +\n(-) x (-) = +\n(+) x (-) = -\n(-) x (+) = -\n\nSi multiplicas signos IGUALES = POSITIVO.\nSi multiplicas signos DIFERENTES = NEGATIVO.',
      icon: Icons.rule,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Signos Iguales',
      content: 'Calcula: (-4) x (-3)',
      options: ['-12', '-7', '12', '7'],
      correctAnswerIndex: 2,
      feedback:
          'Números: 4x3=12. Signos: Menos por menos da más (+). Resultado 12.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Truco Mental',
      content:
          'Imagina esto:\n- El (+) es un "Amigo"\n- El (-) es un "Enemigo"\n\n(-) x (-): El enemigo de mi enemigo, es mi AMIGO (+).\n(+) x (-): El amigo de mi enemigo, es mi ENEMIGO (-).',
      icon: Icons.psychology,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Paréntesis en vez de "X"',
      content:
          'A medida que avanzas en mate, dejarás de ver el signo "X" para multiplicar, ya que se confunde con letras. Ahora se usan paréntesis juntos.\nEj: (5)(4) es igual a decir 5 x 4 = 20.',
      icon: Icons.data_array,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Amigo del Enemigo',
      content: 'Calcula: (5)(-6)',
      options: ['-30', '30', '-1', '11'],
      correctAnswerIndex: 0,
      feedback:
          'El 5 es positivo y el 6 negativo. Más por menos es menos. 5 x 6 = 30. Resultado: -30.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cadenas largas',
      content: 'Resuelve paso a paso. Calcula: (-1)(-1)(-1)',
      options: ['1', '-1', '-3', '3'],
      correctAnswerIndex: 1,
      feedback:
          'Paso a paso: (-1)x(-1) da +1. Luego, ese (+1) se multiplica por el último (-1), dando -1 final.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Cero Absorbente',
      content:
          'El cero es como un agujero negro en la multiplicación. No importa qué tan gigante o negativo sea el número, si lo multiplicas por 0, el resultado SIEMPRE será 0.',
      icon: Icons.tonality,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'El Agujero Negro',
      content: '¿Cuánto es: (-99) x 0 x 5 ?',
      options: ['-99', '495', '0', '-495'],
      correctAnswerIndex: 2,
      feedback:
          'Si hay un cero multiplicando en cualquier parte de la cadena, todo se vuelve cero instantáneamente.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Supera el test de multiplicación y demuestra que dominas la Ley de Signos.',
      icon: Icons.emoji_events,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula: (-8) x (-2)',
      options: ['-16', '16', '-10', '10'],
      correctAnswerIndex: 1,
      feedback: 'Menos por menos es más (+). 8 x 2 = 16.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Si multiplicas un positivo por un negativo, el resultado es:',
      options: ['Positivo', 'Negativo', 'Cero', 'Depende'],
      correctAnswerIndex: 1,
      feedback: 'Signos diferentes siempre dan negativo.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula: 0 x (-1500)',
      options: ['-1500', '1500', '0', 'Indefinido'],
      correctAnswerIndex: 2,
      feedback: 'Todo multiplicado por cero es cero.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Calcula: (2)(-3)(2)',
      options: ['-12', '12', '-6', '7'],
      correctAnswerIndex: 0,
      feedback: '(2)x(-3) = -6. Luego (-6)x(2) = -12.',
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
          'Dividir es repartir algo en partes iguales. La excelente noticia es que usa EXACTAMENTE la misma Ley de Signos que aprendiste en la multiplicación.',
      icon: Icons.horizontal_split,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Misma regla, otra operación',
      content:
          '(+) / (+) = +\n(-) / (-) = +\n(+) / (-) = -\n(-) / (+) = -\n\nDividir dos números con signos iguales da positivo. Signos distintos da negativo.',
      icon: Icons.rule,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Repartir con signos',
      content: 'Calcula: (-20) / (-4)',
      options: ['-5', '5', '-16', '16'],
      correctAnswerIndex: 1,
      feedback:
          'Menos entre menos da más (+). Luego divides 20 entre 4. El resultado es 5 positivo.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Repartir Deudas',
      content:
          'La división con negativos suele usarse para deudas.\n\nTienes una deuda de \$30 (-30) y la repartes entre 3 hermanos. \n-30 / 3 = -10. ¡Cada hermano recibe una deuda de \$10!',
      icon: Icons.money_off,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Fracciones son divisiones',
      content:
          'Recuerda que una fracción como -10 / 2 es lo mismo que decir "menos diez dividido entre dos". Muchas veces verás las divisiones escritas como fracciones en álgebra.',
      icon: Icons.call_split,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'La deuda',
      content: 'Calcula: 18 / (-3)',
      options: ['6', '-6', '15', '-15'],
      correctAnswerIndex: 1,
      feedback:
          'Positivo entre negativo da negativo (-). 18 entre 3 es 6. Resultado: -6.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'El error común',
      content: 'Calcula: (-100) / 10',
      options: ['-10', '10', '1000', '-90'],
      correctAnswerIndex: 0,
      feedback:
          'Negativo entre positivo da negativo. 100 entre 10 es 10. Queda -10.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Límite del Universo',
      content:
          'OJO AL CERO:\n\n- Sí puedes dividir cero: 0 manzanas entre 5 amigos = 0 para cada uno (0/5 = 0).\n- NUNCA PUEDES DIVIDIR ENTRE CERO: 5 manzanas repartidas entre "nadie" no tiene sentido. 5/0 da Error Matemático (Indefinido).',
      icon: Icons.warning,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'No rompas el universo',
      content: '¿Qué pasaría si intentas calcular 10 / 0 en un examen?',
      options: ['Da 0', 'Da 10', 'Da 1', 'Es Indefinido (Error)'],
      correctAnswerIndex: 3,
      feedback:
          'Dividir entre cero no existe. Es una operación matemáticamente indefinida.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Cuestionario Final!',
      content:
          'Demuestra tu habilidad repartiendo números en este cuestionario final.',
      icon: Icons.emoji_events,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula: -50 / -5',
      options: ['-10', '10', '-45', '45'],
      correctAnswerIndex: 1,
      feedback: 'Menos entre menos da más (+). 50 / 5 = 10.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Calcula: 0 / (-8)',
      options: ['-8', '8', '0', 'Indefinido'],
      correctAnswerIndex: 2,
      feedback:
          'Cero dividido entre CUALQUIER número (excepto 0) siempre es 0.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula: -12 / 0',
      options: ['-12', '0', '1', 'Indefinido'],
      correctAnswerIndex: 3,
      feedback: '¡Nunca se puede dividir un número entre cero!',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Calcula: (-24 / 2)',
      options: ['12', '-12', '26', '-26'],
      correctAnswerIndex: 1,
      feedback: 'Negativo entre positivo da negativo. La mitad de 24 es 12.',
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
          'Llegamos al jefe final del Mundo 1.\n\n¿Qué pasa cuando hay sumas, restas y multiplicaciones en una misma ecuación larga? Debes respetar las reglas de la Jerarquía.',
      icon: Icons.account_tree,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Jerarquía (PEMDAS)',
      content:
          'Resuelve SIEMPRE en este estricto orden:\n\n1. Paréntesis.\n2. Exponentes (Potencias).\n3. Multiplicaciones y Divisiones.\n4. Sumas y Restas (Van siempre al final).\n\n*Nota: Si hay operaciones del mismo nivel juntas, lee de izquierda a derecha.*',
      icon: Icons.sort,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El error más común',
      content:
          'Mira esto: 2 + 3 x 4\n\n- Camino Erróneo: Sumo 2+3=5, multiplico por 4 = 20. ❌\n- Camino Correcto: Por la Jerarquía, PRIMERO multiplico 3x4=12. LUEGO sumo 2+12 = 14. ✅\n\n¡La multiplicación es más poderosa que la suma!',
      icon: Icons.priority_high,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'La Trampa',
      content: 'Respeta la jerarquía. Calcula el resultado de: 10 - 2 x 3',
      options: ['24', '4', '16', '15'],
      correctAnswerIndex: 1,
      feedback:
          'Por la jerarquía, la multiplicación (2 x 3 = 6) se hace PRIMERO. Luego restas 10 - 6 = 4.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Multiplicación vs División',
      content:
          'Ambas tienen el mismo poder. Se leen de Izquierda a Derecha. Calcula: 20 / 2 x 5',
      options: ['2', '10', '50', '100'],
      correctAnswerIndex: 2,
      feedback:
          'De izquierda a derecha: Primero 20 / 2 = 10. Luego 10 x 5 = 50.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Poder de los Paréntesis',
      content:
          'El Paréntesis es el Rey absoluto. Rompe cualquier regla de jerarquía.\n\nSi pones una suma dentro de un paréntesis (5 + 3) x 2, ¡estás OBLIGANDO a que esa suma se resuelva antes que la multiplicación!',
      icon: Icons.data_array,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Aplica el Paréntesis',
      content: 'Calcula: (10 - 2) x 3',
      options: ['24', '4', '16', '15'],
      correctAnswerIndex: 0,
      feedback:
          'El paréntesis se hace primero: (10 - 2) = 8. Luego multiplicas el resultado: 8 x 3 = 24.',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Combinando Signos y Jerarquía',
      content:
          'Un nivel avanzado: -5 + 20 / -4\n\n1. División primero: 20 / -4 = -5\n2. Queda: -5 + -5\n3. Dos signos pegados (+ -) se vuelve resta: -5 - 5\n4. Signos iguales se suman: -10.',
      icon: Icons.functions,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'El minijefe',
      content: 'Calcula: 5 + (-2) x 3',
      options: ['9', '-1', '11', '1'],
      correctAnswerIndex: 1,
      feedback:
          'Multiplicación primero: (-2) x 3 = -6. Queda: 5 + (-6). Signos diferentes se restan. 5 - 6 = -1.',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡JEFE FINAL!',
      content:
          'Si pasas esta prueba, habrás conquistado el Reino Numérico por completo. ¡Mucha suerte!',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Calcula: 5 + 5 x 2',
      options: ['20', '15', '25', '10'],
      correctAnswerIndex: 1,
      feedback:
          'Primero la multiplicación: 5 x 2 = 10. Luego la suma: 5 + 10 = 15.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Calcula: (5 + 5) x 2',
      options: ['20', '15', '25', '10'],
      correctAnswerIndex: 0,
      feedback:
          'El paréntesis manda: (5 + 5) = 10. Luego multiplicas: 10 x 2 = 20.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Calcula: 20 / 2 + 5',
      options: ['15', '2.8', '10', '25'],
      correctAnswerIndex: 0,
      feedback:
          'La división tiene prioridad. Primero 20 / 2 = 10. Luego sumas 5.',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Combinación total: -5 + (10 - 2) x 2',
      options: ['6', '11', '26', '-11'],
      correctAnswerIndex: 1,
      feedback:
          'Paso 1: (10 - 2) = 8. Paso 2: 8 x 2 = 16. Paso 3: -5 + 16 = 11.',
    ),
  ];
}
