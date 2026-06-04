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
  // ==========================================
  static final List<LessonSlide> _level1Equivalencia = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Archipiélago Fraccionario',
      content:
          '¡Bienvenido al Mundo 2!\n\nAquí los números se rompen en pedazos. Empezaremos descubriendo cómo dos fracciones diferentes pueden valer exactamente lo mismo.',
      icon: Icons.sailing,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Fracciones Equivalentes',
      content:
          'Son fracciones que se escriben diferente, pero representan la misma cantidad.\n\nEjemplo: Si comes 1/2 de una pizza, es lo mismo que si la cortas en más pedazos y comes 2/4. ¡La cantidad de pizza en tu estómago es la misma!',
      icon: Icons.pie_chart,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'fracciones_equivalentes',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Amplificación',
      content:
          '¿Cómo creamos fracciones equivalentes? ¡Multiplicando!\n\nSi multiplicas el número de arriba (numerador) y el de abajo (denominador) por el MISMO número, creas un "clon" equivalente.\nEj: 1/3 multiplicado por 2 arriba y abajo se vuelve 2/6.',
      icon: Icons.zoom_out_map,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'amplificacion',
    ),
  ];

  // ==========================================
  // NIVEL 2: SIMPLIFICACIÓN (1)
  // ==========================================
  static final List<LessonSlide> _level2Simplificacion = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Haciéndolo Simple',
      content:
          'Ya sabemos hacer las fracciones más grandes multiplicando. Ahora aprenderemos a hacerlas más pequeñas y manejables.',
      icon: Icons.compress,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Arte de Simplificar',
      content:
          'Simplificar es lo opuesto a amplificar. Tienes que DIVIDIR el numerador y el denominador por el mismo número.\n\nEjemplo: En la fracción 4/8, ambos números se pueden dividir entre 4. ¡El resultado es 1/2!',
      icon: Icons.content_cut,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'simplificacion_basica',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Fracción Irreducible',
      content:
          'Se llama así cuando ya no puedes dividir más a los dos números por un mismo valor.\n\nEjemplo: 3/4 es irreducible porque no hay ningún número que divida al 3 y al 4 al mismo tiempo.',
      icon: Icons.do_not_disturb_on,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'fraccion_irreducible',
    ),
  ];

  // ==========================================
  // NIVEL 3: SUMA Y RESTA (Distinto Denominador) (2)
  // ==========================================
  static final List<LessonSlide> _level3SumaRestaHeterogenea = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Piezas Diferentes',
      content:
          'Sumar fracciones con el mismo número abajo es fácil (1/4 + 2/4 = 3/4). Pero, ¿qué pasa si quieres sumar 1/2 + 1/3? ¡No encajan!',
      icon: Icons.extension,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Buscando el Común Denominador',
      content:
          'El truco está en transformarlas (amplificarlas) para que tengan el MISMO número abajo.\n\nBuscamos un múltiplo común. Para 1/2 y 1/3, el número en común abajo es 6.\n- 1/2 se vuelve 3/6\n- 1/3 se vuelve 2/6\n¡Ahora sí podemos sumar 3/6 + 2/6 = 5/6!',
      icon: Icons.sync_alt,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'comun_denominador',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'suma_fracciones_heterogeneas',
    ),
  ];

  // ==========================================
  // NIVEL 4: MULTIPLICACIÓN Y DIVISIÓN (3)
  // ==========================================
  static final List<LessonSlide> _level4MultDivFracciones = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Multiplicando Pedazos',
      content:
          'A diferencia de la suma, aquí no necesitas buscar denominadores comunes. ¡Es mucho más directo!',
      icon: Icons.clear,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Multiplicación Directa',
      content:
          'Solo tienes que multiplicar los números de arriba entre sí, y los números de abajo entre sí.\n\nEjemplo: 1/2 x 3/4\n- Arriba: 1 x 3 = 3\n- Abajo: 2 x 4 = 8\nResultado: 3/8.',
      icon: Icons.arrow_forward,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'multiplicacion_fracciones',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Truco de la División (El Rebote)',
      content:
          'Para dividir fracciones, usa el método del rebote o "cruzado".\n\nEjemplo: 1/2 ÷ 3/4\n1. Multiplica el 1 de arriba por el 4 de abajo = 4 (va arriba).\n2. Multiplica el 2 de abajo por el 3 de arriba = 6 (va abajo).\nResultado: 4/6.',
      icon: Icons.sync,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'division_fracciones',
    ),
  ];

  // ==========================================
  // NIVEL 5: CONVERSIÓN A DECIMALES (4)
  // ==========================================
  static final List<LessonSlide> _level5ConversionDecimales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Mundos Conectados',
      content:
          'Las fracciones y los decimales son dos idiomas distintos para decir exactamente lo mismo. ¡Vamos a aprender a traducir!',
      icon: Icons.language,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'De Fracción a Decimal',
      content:
          '¡Toda fracción es una división disfrazada! Para convertirla, simplemente divide el número de arriba entre el de abajo.\n\nEjemplo: 3/4 es lo mismo que calcular 3 dividido entre 4. El resultado es 0.75.',
      icon: Icons.calculate,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'fraccion_a_decimal',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'De Decimal a Fracción',
      content:
          'Para ir al revés, escribe el número sin el punto arriba, y abajo pon un 1 seguido de tantos ceros como decimales tenías.\n\nEjemplo: 0.25 tiene dos decimales. Así que escribimos 25 / 100. (Que simplificado es 1/4).',
      icon: Icons.swap_vert,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'decimal_a_fraccion',
    ),
  ];

  // ==========================================
  // NIVEL 6: OPERACIONES CON DECIMALES (5)
  // ==========================================
  static final List<LessonSlide> _level6OperacionesDecimales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Jugando con el Punto',
      content:
          'Hacer operaciones con decimales es casi igual que hacerlas con números normales, solo hay que vigilar de cerca el punto decimal.',
      icon: Icons.ads_click,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Alineando los Puntos',
      content:
          'Para SUMAR o RESTAR decimales, la regla sagrada es alinear los puntos de ambos números uno debajo del otro. Luego, suma normalmente.\n\nEjemplo: 2.5 + 1.25. (Alinea los puntos y agrega un cero si falta espacio: 2.50 + 1.25 = 3.75).',
      icon: Icons.format_align_center,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'suma_decimales',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Multiplicando Decimales',
      content:
          'Multiplica como si no existieran los puntos. Al final, cuenta cuántos decimales había en total entre los dos números originales, y muévele el punto al resultado hacia la izquierda.\n\nEjemplo: 0.5 x 0.2 (Multiplicamos 5x2=10. Había 2 espacios en total, así que movemos el punto 2 veces: 0.10).',
      icon: Icons.multiple_stop,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'multiplicacion_decimales',
    ),
  ];

  // ==========================================
  // NIVEL 7: REDONDEO (6)
  // ==========================================
  static final List<LessonSlide> _level7Redondeo = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Aproximaciones',
      content:
          'A veces no necesitamos números exactos con miles de decimales. El redondeo nos ayuda a tener números más limpios y útiles.',
      icon: Icons.change_circle,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'La Regla del 5',
      content:
          'Ubica el número que quieres redondear y mira a su vecino de la derecha.\n\n- Si el vecino es 5 o más grande (5,6,7,8,9), súmale 1 al número (Sube).\n- Si el vecino es 4 o más pequeño (0,1,2,3,4), déjalo exactamente igual (Se queda).',
      icon: Icons.looks_5,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'redondeo_enteros',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'redondeo_decimales',
    ),
  ];

  // ==========================================
  // NIVEL 8: CÁLCULO DE PORCENTAJES (7)
  // ==========================================
  static final List<LessonSlide> _level8Porcentajes = [
    LessonSlide(
      type: SlideType.intro,
      title: 'El Mundo en 100 Partes',
      content:
          'Los porcentajes (%) están en todos lados: baterías de celular, descargas, descuentos. ¡Porcentaje simplemente significa "por cada 100"!',
      icon: Icons.percent,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Porcentajes y Decimales',
      content:
          'Un porcentaje es solo un número decimal disfrazado. Para usarlo en matemáticas, debes dividirlo entre 100 (o mover el punto dos veces a la izquierda).\n\n- 50% es 0.50\n- 25% es 0.25\n- 5% es 0.05',
      icon: Icons.money,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_porcentaje',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Calculando Porcentajes',
      content:
          'Para saber el porcentaje de una cantidad, solo multiplica la cantidad por el decimal del porcentaje.\n\nEjemplo: ¿Cuánto es el 20% de 50?\n1. El 20% en decimal es 0.20.\n2. Multiplicamos: 50 x 0.20 = 10.\n¡La respuesta es 10!',
      icon: Icons.calculate_outlined,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'calcular_porcentaje',
    ),
  ];

  // ==========================================
  // NIVEL 9: AUMENTOS Y DESCUENTOS (8)
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
          'Si un zapato de \$100 tiene un 20% de descuento:\n\n1. Calcula el descuento: 20% de \$100 = \$20.\n2. Réstalo al precio original: \$100 - \$20 = \$80.\n¡Pagarás \$80!',
      icon: Icons.local_offer,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'descuento_porcentual',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Aumentos (Impuestos)',
      content:
          'Funciona igual, pero SUMANDO.\n\nSi un menú cuesta \$50 y debes pagar un 10% de impuesto extra:\n1. Calcula el impuesto: 10% de \$50 = \$5.\n2. Súmalo al total: \$50 + \$5 = \$55.\n¡El total es \$55!',
      icon: Icons.receipt_long,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'aumento_porcentual',
    ),
  ];
}
