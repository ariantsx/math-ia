import 'package:flutter/material.dart';
import 'lesson_models.dart';

class World3Lessons {
  static List<LessonSlide> getLesson(int levelIndex) {
    switch (levelIndex) {
      case 0:
        return _level1Razones;
      case 1:
        return _level2PropDirecta;
      case 2:
        return _level3PropInversa;
      case 3:
        return _level4ReglaTresSimple;
      case 4:
        return _level5ReglaTresCompuesta;
      case 5:
        return _level6Escalas;
      default:
        return _level1Razones;
    }
  }

  // ==========================================
  // NIVEL 1: RAZONES (0)
  // Tags: "razones_equivalentes", "concepto_razon"
  // ==========================================
  static final List<LessonSlide> _level1Razones = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Desierto Proporcional',
      content:
          '¡Bienvenido al Mundo 3!\n\nEn este desierto, el agua es valiosa y todo debe compararse. Aquí aprenderemos a medir una cosa en relación con otra usando "Razones".',
      icon: Icons.wb_sunny,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: '¿Qué es una Razón?',
      content:
          'Una razón es simplemente la comparación de dos cantidades dividiéndolas.\n\nSe puede escribir como fracción (3/4), con dos puntos (3:4) o con palabras (3 es a 4).\nEjemplo: Si por cada 3 vasos de agua necesitas 4 limones, la razón es 3:4.',
      icon: Icons.local_drink,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'En un salón hay 5 niñas y 10 niños. ¿Cuál es la razón de niñas a niños?',
      options: ['5:10', '10:5', '1:5', '15:10'],
      correctAnswerIndex: 0,
      feedback:
          'Correcto. Como se nombran primero las niñas (5) y luego los niños (10), la razón exacta es 5:10.',
      conceptTag: 'concepto_razon',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Razones Equivalentes',
      content:
          'Al igual que las fracciones, las razones pueden ser equivalentes si se multiplican o dividen ambos lados por el mismo número.\n\nEjemplo: La razón 5:10 se puede simplificar dividiendo ambos lados entre 5. ¡El resultado es 1:2!',
      icon: Icons.sync_alt,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Simplifica la razón 4:8 a su forma equivalente más pequeña:',
      options: ['2:4', '1:2', '8:4', '1:4'],
      correctAnswerIndex: 1,
      feedback:
          'Dividiendo ambos lados de 4:8 entre 4, obtenemos la razón equivalente 1:2.',
      conceptTag: 'razones_equivalentes',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Razones',
      content: 'Resuelve estos 4 ejercicios para superar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'Si una receta pide 2 tazas de harina por cada 3 de azúcar, la razón de harina a azúcar es:',
      options: ['3:2', '2:3', '2/5', '5:2'],
      correctAnswerIndex: 1,
      feedback:
          'El orden importa. Primero harina (2), luego azúcar (3). Es 2:3.',
      conceptTag: 'concepto_razon',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: '¿Qué razón es equivalente a 10:20?',
      options: ['1:2', '2:1', '2:3', '5:100'],
      correctAnswerIndex: 0,
      feedback: 'Dividiendo ambos números entre 10 obtenemos 1:2.',
      conceptTag: 'razones_equivalentes',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'Hiciste 15 goles en 5 partidos. ¿Cuál es la razón de goles por partido simplificada?',
      options: ['15:5', '3:1', '1:3', '5:15'],
      correctAnswerIndex: 1,
      feedback:
          'La razón es 15:5. Dividiendo entre 5, se reduce a 3:1 (3 goles por cada 1 partido).',
      conceptTag: 'razones_equivalentes',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'En una canasta hay 4 manzanas y 6 peras. La razón de manzanas a peras es:',
      options: ['6:4', '10:4', '4:6', '4:10'],
      correctAnswerIndex: 2,
      feedback: '4 manzanas comparadas con 6 peras se escribe como 4:6.',
      conceptTag: 'concepto_razon',
    ),
  ];

  // ==========================================
  // NIVEL 2: PROPORCIÓN DIRECTA (1)
  // Tags: "proporcion_directa"
  // ==========================================
  static final List<LessonSlide> _level2PropDirecta = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Proporcionalidad Directa',
      content:
          'Dos valores son directamente proporcionales cuando viajan en la misma dirección: Si uno sube, el otro también sube. Si uno baja, el otro baja.',
      icon: Icons.trending_up,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Más por Más',
      content:
          'Ejemplo clásico: Comprar manzanas.\n\n• Si compras MÁS manzanas, pagarás MÁS dinero.\n• Si compras MENOS manzanas, pagarás MENOS dinero.\nComo ambas cosas suben o bajan juntas, es Proporción Directa.',
      icon: Icons.shopping_cart,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Cuál de los siguientes es un ejemplo de proporción directa?',
      options: [
        'Tiempo en auto vs Velocidad',
        'Número de trabajadores vs Tiempo de obra',
        'Horas trabajadas vs Sueldo ganado',
        'Edad vs Estatura',
      ],
      correctAnswerIndex: 2,
      feedback:
          'A más horas trabajadas, mayor será el sueldo que ganas. Ambas suben.',
      conceptTag: 'proporcion_directa',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Constante (K)',
      content:
          'En la proporción directa, si divides una cantidad por la otra, el resultado siempre será el mismo número. Ese número se llama Constante de Proporcionalidad (K).\n\nSi 2 manzanas cuestan \$4, y 3 cuestan \$6. (4/2=2 y 6/3=2). ¡La constante K es 2!',
      icon: Icons.vpn_key,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si 5 dulces cuestan \$10. ¿Cuál es la constante de proporcionalidad (K) del precio por dulce?',
      options: ['2', '5', '50', '0.5'],
      correctAnswerIndex: 0,
      feedback:
          'Divides el precio entre los dulces (10 ÷ 5 = 2). Cada dulce cuesta 2.',
      conceptTag: 'proporcion_directa',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Proporción Directa',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Identifica la proporción directa:',
      options: [
        'Días de vacaciones y Dinero ahorrado',
        'Velocidad y Tiempo de viaje',
        'Litros de pintura y Área pintada',
        'Trabajadores y Días de obra',
      ],
      correctAnswerIndex: 2,
      feedback:
          'A más litros de pintura, más área podrás pintar (Más por Más).',
      conceptTag: 'proporcion_directa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Si 3 cuadernos cuestan \$15, ¿cuál es el costo de 1 cuaderno?',
      options: ['\$3', '\$5', '\$10', '\$12'],
      correctAnswerIndex: 1,
      feedback: '15 ÷ 3 = 5. Cada cuaderno cuesta \$5.',
      conceptTag: 'proporcion_directa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'Si sabes que 1 cuaderno cuesta \$5, ¿cuánto costarán 4 cuadernos?',
      options: ['\$15', '\$20', '\$25', '\$4'],
      correctAnswerIndex: 1,
      feedback: 'Multiplicas la constante por 4: 5 x 4 = \$20.',
      conceptTag: 'proporcion_directa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'En la proporción directa, si una variable se duplica, ¿qué le pasa a la otra?',
      options: [
        'Se reduce a la mitad',
        'Se mantiene igual',
        'También se duplica',
        'Se cuadruplica',
      ],
      correctAnswerIndex: 2,
      feedback:
          'Como van en la misma dirección, si una se duplica, la otra también.',
      conceptTag: 'proporcion_directa',
    ),
  ];

  // ==========================================
  // NIVEL 3: PROPORCIÓN INVERSA (2)
  // Tags: "proporcion_inversa"
  // ==========================================
  static final List<LessonSlide> _level3PropInversa = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Proporcionalidad Inversa',
      content:
          'A veces, las cosas viajan en direcciones opuestas. Si un valor sube, el otro irremediablemente debe bajar. ¡A esto le llamamos Inversa!',
      icon: Icons.call_split,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Más por Menos',
      content:
          'Ejemplo clásico: Pintar una casa.\n\n• Si hay MÁS pintores trabajando, se demorarán MENOS días en terminar.\n• Si hay MENOS pintores, se demorarán MÁS días.\n¡Crecen en sentidos contrarios!',
      icon: Icons.format_paint,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿Cuál de estos casos es una proporción inversa?',
      options: [
        'Peso de un paquete y su precio de envío',
        'Horas de estudio y Nota de examen',
        'Velocidad del auto y Tiempo para llegar a una ciudad',
        'Cantidad de personas y Cajas de pizza compradas',
      ],
      correctAnswerIndex: 2,
      feedback:
          'A MAYOR velocidad vayas, MENOR será el tiempo que demores en llegar. Sentidos contrarios.',
      conceptTag: 'proporcion_inversa',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Constante (K) Inversa',
      content:
          'En la proporción inversa, si MULTIPLICAS una cantidad por la otra, el resultado siempre será el mismo (K).\n\nSi 2 pintores demoran 6 días (2x6=12). Si hay 3 pintores, demorarán 4 días (3x4=12). ¡K siempre es 12!',
      icon: Icons.all_inclusive,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si 4 obreros terminan un muro en 5 días. ¿Cuál es su constante de trabajo (K)?',
      options: ['1', '9', '20', '0.8'],
      correctAnswerIndex: 2,
      feedback: 'Multiplicamos ambas variables: 4 obreros × 5 días = 20.',
      conceptTag: 'proporcion_inversa',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Proporción Inversa',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'En proporción inversa, si la velocidad de un auto se duplica, el tiempo de viaje...',
      options: [
        'Se duplica',
        'Se reduce a la mitad',
        'Se mantiene igual',
        'Se triplica',
      ],
      correctAnswerIndex: 1,
      feedback:
          'Al ser inversa, si multiplicas de un lado (x2), debes dividir del otro (÷2).',
      conceptTag: 'proporcion_inversa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Un tanque de agua dura 10 días para 3 caballos. ¿Cuántos días durará si solo hay 1 caballo?',
      options: ['30 días', '3 días', '15 días', '10 días'],
      correctAnswerIndex: 0,
      feedback: 'Calculamos K: 10x3 = 30. Ahora, 30 ÷ 1 caballo = 30 días.',
      conceptTag: 'proporcion_inversa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Identifica la proporción inversa:',
      options: [
        'Kilos de pan y Precio a pagar',
        'Número de grifos abiertos y Tiempo en llenar una piscina',
        'Horas en internet y Megas consumidos',
        'Distancia caminada y Calorías quemadas',
      ],
      correctAnswerIndex: 1,
      feedback:
          'A MÁS grifos echando agua, MENOS tiempo tardará en llenarse la piscina.',
      conceptTag: 'proporcion_inversa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Si 6 trabajadores limpian un parque en 2 horas, ¿cuánto demorarán 3 trabajadores?',
      options: ['1 hora', '4 horas', '3 horas', '6 horas'],
      correctAnswerIndex: 1,
      feedback:
          'Redujiste los trabajadores a la mitad, así que el tiempo se duplica. K=12, entonces 12 ÷ 3 = 4.',
      conceptTag: 'proporcion_inversa',
    ),
  ];

  // ==========================================
  // NIVEL 4: REGLA DE TRES SIMPLE (3)
  // Tags: "regla_tres_directa", "regla_tres_inversa"
  // ==========================================
  static final List<LessonSlide> _level4ReglaTresSimple = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Regla de Tres Simple',
      content:
          'Cuando conocemos 3 datos y queremos hallar un cuarto dato desconocido (X), usamos esta poderosa técnica matemática.',
      icon: Icons.calculate,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Regla de Tres Directa',
      content:
          'Se usa cuando la relación es Directa (Más/Más).\n\nPara resolver: Multiplicas los datos cruzados y divides por el que sobra.\nEj: Si 2 kilos cuestan \$4, ¿cuánto cuestan 5 kilos?\nX = (5 × 4) ÷ 2 = 10.',
      icon: Icons.clear,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Usando la fórmula (cruzado ÷ sobra): Si 3 lápices cuestan \$9, ¿cuánto cuestan 4 lápices?',
      options: ['\$10', '\$12', '\$15', '\$20'],
      correctAnswerIndex: 1,
      feedback: 'Multiplicas 4x9=36. Divides 36 ÷ 3 = 12.',
      conceptTag: 'regla_tres_directa',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Regla de Tres Inversa',
      content:
          'Se usa cuando la relación es Inversa (Más/Menos).\n\nPara resolver: Multiplicas los datos en línea recta (los dos de arriba) y divides por el que está solo abajo.\nEj: 2 perros comen en 6 días. ¿3 perros?\nX = (2 × 6) ÷ 3 = 4 días.',
      icon: Icons.drag_handle,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Inversa (línea recta ÷ sobra): Si 4 pintores demoran 5 días, ¿cuánto demorarán 10 pintores?',
      options: ['12 días', '8 días', '2 días', '4 días'],
      correctAnswerIndex: 2,
      feedback:
          'Multiplicas en línea recta: 4x5=20. Luego divides entre 10. X = 2 días.',
      conceptTag: 'regla_tres_inversa',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Regla de Tres',
      content: 'Identifica si es directa o inversa antes de resolver.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'Directa: Si en 2 horas recorro 100 km, ¿cuántos km recorreré en 5 horas?',
      options: ['200 km', '250 km', '300 km', '150 km'],
      correctAnswerIndex: 1,
      feedback: 'Cruzado: (5 x 100) / 2 = 500 / 2 = 250 km.',
      conceptTag: 'regla_tres_directa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Inversa: 3 mangueras llenan un tanque en 4 horas. ¿Cuánto demoran 6 mangueras?',
      options: ['8 horas', '2 horas', '4 horas', '6 horas'],
      correctAnswerIndex: 1,
      feedback: 'En línea: (3 x 4) / 6 = 12 / 6 = 2 horas.',
      conceptTag: 'regla_tres_inversa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Directa: 5 dulces cuestan \$15. ¿Cuánto costarán 2 dulces?',
      options: ['\$6', '\$10', '\$4', '\$8'],
      correctAnswerIndex: 0,
      feedback: 'Cruzado: (2 x 15) / 5 = 30 / 5 = \$6.',
      conceptTag: 'regla_tres_directa',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Inversa: Si a 100 km/h un viaje tarda 6 horas, a 120 km/h tardará:',
      options: ['5 horas', '7 horas', '8 horas', '4 horas'],
      correctAnswerIndex: 0,
      feedback: 'En línea: (100 x 6) / 120 = 600 / 120 = 5 horas.',
      conceptTag: 'regla_tres_inversa',
    ),
  ];

  // ==========================================
  // NIVEL 5: REGLA DE TRES COMPUESTA (4)
  // Tags: "regla_tres_compuesta"
  // ==========================================
  static final List<LessonSlide> _level5ReglaTresCompuesta = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Regla de Tres Compuesta',
      content:
          'A veces la vida tiene más de 2 variables. ¿Qué pasa si comparamos trabajadores, con días de trabajo y con metros construidos a la vez?',
      icon: Icons.layers,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Múltiples Variables',
      content:
          'Cuando hay 3 o más columnas, estamos frente a una regla de tres compuesta. Esta puede estar formada por puras relaciones directas, puras inversas, o mezcladas.',
      icon: Icons.device_hub,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          '¿Cuántas variables o columnas mínimas tiene un problema de regla de tres compuesta?',
      options: ['1', '2', '3 o más', 'Solo 4'],
      correctAnswerIndex: 2,
      feedback:
          'Si tiene 2 variables es regla simple. Para ser compuesta debe relacionar 3 o más.',
      conceptTag: 'regla_tres_compuesta',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Método Analítico',
      content:
          'Para resolver, debemos separar el problema en reglas de tres simples.\n\nSiempre debes comparar tu variable de incógnita (la X) primero con la columna 1, y luego la incógnita con la columna 2, para ver si son directas o inversas.',
      icon: Icons.alt_route,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'En el método analítico, ¿contra qué columna debes comparar las demás variables?',
      options: [
        'Contra la primera siempre',
        'Contra la columna que tiene la incógnita (X)',
        'Contra la última columna',
        'No importa',
      ],
      correctAnswerIndex: 1,
      feedback:
          'Todas las relaciones de Directa/Inversa se evalúan comparando contra la columna de la incógnita.',
      conceptTag: 'regla_tres_compuesta',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario Compuesto',
      content: 'Resuelve estos ejercicios analíticos finales.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'Paso 1: Si tienes "Obreros", "Días" y "Metros de obra", y la incógnita está en "Días". ¿Cómo es Obreros vs Días?',
      options: [
        'Directa (más obreros, más días)',
        'Inversa (más obreros, menos días)',
        'Ninguna',
        'Son iguales',
      ],
      correctAnswerIndex: 1,
      feedback: 'A más obreros trabajando, menos días demorarán (Inversa).',
      conceptTag: 'regla_tres_compuesta',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Siguiendo el ejemplo anterior, ¿cómo es "Metros de obra" vs "Días"?',
      options: [
        'Directa (más metros, más días)',
        'Inversa (más metros, menos días)',
        'Ninguna',
        'Son iguales',
      ],
      correctAnswerIndex: 0,
      feedback:
          'A más metros por construir, más días demorarán trabajando (Directa).',
      conceptTag: 'regla_tres_compuesta',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'Si 2 hornos consumen 10 kg de carbón en 5 días. ¿1 horno en 5 días cuánto consumirá?',
      options: ['10 kg', '5 kg', '2.5 kg', '20 kg'],
      correctAnswerIndex: 1,
      feedback:
          'Si los días son iguales, solo miras hornos y carbón (Directa). La mitad de hornos = mitad de carbón (5kg).',
      conceptTag: 'regla_tres_compuesta',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Si 3 gatos comen 3 latas en 3 días. ¿1 gato come 1 lata en cuántos días?',
      options: ['1 día', '3 días', '9 días', '1/3 de día'],
      correctAnswerIndex: 1,
      feedback:
          'Es el famoso acertijo. La tasa de consumo no cambia por gato. 1 gato demora los mismos 3 días en comerse su propia lata.',
      conceptTag: 'regla_tres_compuesta',
    ),
  ];

  // ==========================================
  // NIVEL 6: ESCALAS (5)
  // Tags: "escalas_mapas"
  // ==========================================
  static final List<LessonSlide> _level6Escalas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Mundos en Miniatura',
      content:
          'Has dominado las proporciones. La mejor forma de aplicarlas en la vida real es mediante la cartografía: Leyendo Mapas.',
      icon: Icons.map,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Lectura de Escalas',
      content:
          'Una escala 1:100 significa que "1 centímetro en el dibujo representa 100 centímetros en la vida real".\n\nSi en tu mapa la distancia entre dos ciudades es de 5 cm, en la realidad están a 500 cm de distancia.',
      icon: Icons.search,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'En una escala 1:50, ¿cuánto representa 2 cm de dibujo en la realidad?',
      options: ['50 cm', '25 cm', '100 cm', '200 cm'],
      correctAnswerIndex: 2,
      feedback:
          'Multiplicas los 2 cm del dibujo por los 50 de la escala = 100 cm.',
      conceptTag: 'escalas_mapas',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Calculando el Dibujo',
      content:
          'A veces sabes el tamaño real y quieres dibujarlo. En ese caso se divide el tamaño real entre el número de la escala.\n\nEj: Un auto de 400 cm reales, a escala 1:100. (400 ÷ 100 = 4 cm de dibujo).',
      icon: Icons.edit,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si una mesa real mide 200 cm, ¿cuánto medirá en un dibujo con escala 1:50?',
      options: ['5 cm', '4 cm', '10 cm', '2 cm'],
      correctAnswerIndex: 1,
      feedback:
          'Divides la medida real (200) entre la escala (50) y obtienes 4 cm para tu dibujo.',
      conceptTag: 'escalas_mapas',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Cierre de Mundo',
      content: 'Usa las escalas para navegar el desierto.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'El mapa tiene escala 1:1000. Si mides 5 cm con tu regla, ¿cuánto es la distancia real?',
      options: ['50 cm', '500 cm', '5000 cm', '1000 cm'],
      correctAnswerIndex: 2,
      feedback: 'Multiplicas 5 x 1000 = 5000 cm reales.',
      conceptTag: 'escalas_mapas',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Un edificio real de 800 cm será dibujado a escala 1:100. ¿De qué tamaño será el dibujo?',
      options: ['80 cm', '8 cm', '8000 cm', '0.8 cm'],
      correctAnswerIndex: 1,
      feedback: 'Divides el tamaño real entre la escala: 800 ÷ 100 = 8 cm.',
      conceptTag: 'escalas_mapas',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'Si 1 cm en el mapa equivale a 20 km en la vida real. ¿A cuántos km equivalen 4 cm?',
      options: ['80 km', '24 km', '40 km', '100 km'],
      correctAnswerIndex: 0,
      feedback: 'Proporción directa clásica: 4 x 20 = 80 km.',
      conceptTag: 'escalas_mapas',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'En un plano 1:500, la piscina mide 2 cm de largo. ¿Cuánto mide en la realidad?',
      options: ['250 cm', '1000 cm', '502 cm', '100 cm'],
      correctAnswerIndex: 1,
      feedback:
          'Multiplicas la medida del plano por la escala: 2 x 500 = 1000 cm.',
      conceptTag: 'escalas_mapas',
    ),
  ];
}
