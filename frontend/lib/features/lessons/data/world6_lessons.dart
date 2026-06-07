import 'package:flutter/material.dart';
import 'lesson_models.dart';

class World6Lessons {
  static List<LessonSlide> getLesson(int levelIndex) {
    switch (levelIndex) {
      case 0:
        return _level1ProblemasVerbales;
      case 1:
        return _level2Modelamiento;
      case 2:
        return _level3Estimacion;
      case 3:
        return _level4Finanzas;
      case 4:
        return _level5Medidas;
      case 5:
        return _level6Recetas;
      default:
        return _level1ProblemasVerbales;
    }
  }

  // ==========================================
  // NIVEL 1: PROBLEMAS VERBALES (0)
  // Tags: "problemas_verbales", "traduccion_verbal"
  // ==========================================
  static final List<LessonSlide> _level1ProblemasVerbales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Ciudad Aplicación',
      content:
          '¡Bienvenido al Mundo 6, la metrópolis de las matemáticas!\n\nAquí no hay ecuaciones flotando en el aire; hay problemas reales que necesitan traducción y solución.',
      icon: Icons.location_city,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Traduciendo Palabras',
      content:
          'El secreto de los problemas es traducir el español a matemáticas:\n\n• "Aumentar", "Añadir", "Total" -> Sumar (+)\n• "Diferencia", "Quitar", "Quedan" -> Restar (-)\n• "Veces", "Doble", "Triple" -> Multiplicar (×)\n• "Repartir", "Mitad", "Tercio" -> Dividir (÷)',
      icon: Icons.translate,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si un problema dice "halla la diferencia entre mi edad y la tuya", ¿qué operación usarás?',
      options: ['Suma', 'Resta', 'Multiplicación', 'División'],
      correctAnswerIndex: 1,
      feedback: 'La palabra "diferencia" siempre hace referencia a una resta.',
      conceptTag: 'traduccion_verbal',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Identificando Datos',
      content:
          'A veces los problemas te dan información que NO necesitas para confundirte.\n\nEjemplo: "Si Juan tiene 10 manzanas, su perro tiene 3 años, y se come 2 manzanas. ¿Cuántas le quedan?"\n¡La edad del perro no importa! Solo te concentras en: 10 manzanas - 2 manzanas = 8.',
      icon: Icons.troubleshoot,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'María tiene \$20, compra un libro de \$5 y el autobús tarda 10 minutos. ¿Cuánto dinero le queda?',
      options: ['\$15', '\$5', '\$10', '\$35'],
      correctAnswerIndex: 0,
      feedback:
          'El tiempo del bus es información innecesaria. Solo restas: 20 - 5 = \$15.',
      conceptTag: 'problemas_verbales',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Traducción',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: '¿Qué operación representa la frase "el triple de un número"?',
      options: [
        'Multiplicación por 3',
        'Suma de 3',
        'División entre 3',
        'Elevar al cubo',
      ],
      correctAnswerIndex: 0,
      feedback: 'La palabra "triple" significa multiplicar por 3.',
      conceptTag: 'traduccion_verbal',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Tienes 15 caramelos y los repartes por igual entre 3 amigos. ¿Qué operación usas?',
      options: ['Suma', 'División', 'Resta', 'Multiplicación'],
      correctAnswerIndex: 1,
      feedback:
          'La palabra "repartir por igual" indica una división (15 ÷ 3 = 5).',
      conceptTag: 'problemas_verbales',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Traduce: "La mitad de un número disminuido en 5".',
      options: ['x/2 - 5', '2x - 5', '5 - x/2', 'x - 5'],
      correctAnswerIndex: 0,
      feedback:
          '"La mitad" es dividir entre 2, y "disminuido" es restar: x/2 - 5.',
      conceptTag: 'traduccion_verbal',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Si Ana compró 4 libretas a \$3 cada una, ¿cuánto pagó en total?',
      options: ['\$12', '\$7', '\$1', '\$43'],
      correctAnswerIndex: 0,
      feedback: 'Debes multiplicar la cantidad por el precio: 4 × 3 = \$12.',
      conceptTag: 'problemas_verbales',
    ),
  ];

  // ==========================================
  // NIVEL 2: MODELAMIENTO ARITMÉTICO (1)
  // Tags: "modelamiento_basico", "modelamiento_avanzado"
  // ==========================================
  static final List<LessonSlide> _level2Modelamiento = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Modelamiento Aritmético',
      content:
          'Una vez que sabes traducir palabras, ¡es hora de construir ecuaciones! El "Modelamiento" es representar la vida real con números y letras (X).',
      icon: Icons.architecture,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Modelos Básicos',
      content:
          'Si un problema dice: "Pensé en un número, le sumé 5 y el resultado fue 12".\n\n1. "Un número" = X\n2. "Le sumé 5" = + 5\n3. "Fue 12" = 12\nModelo: X + 5 = 12.',
      icon: Icons.edit_note,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Modela: "Un número misterioso disminuido en 4 es igual a 10".',
      options: ['X - 4 = 10', '4 - X = 10', 'X + 4 = 10', '10 - 4 = X'],
      correctAnswerIndex: 0,
      feedback:
          'El número es X, disminuido es restar 4, y el resultado es 10: X - 4 = 10.',
      conceptTag: 'modelamiento_basico',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Modelos Avanzados',
      content:
          'A veces hay más pasos. "El doble de mi edad, aumentada en 1 es 15".\n\n1. "El doble de mi edad" = 2X\n2. "Aumentada en 1" = + 1\n3. "Es 15" = 15\nModelo: 2X + 1 = 15.',
      icon: Icons.psychology,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Modela: "La mitad del dinero de Luis, menos \$2 es igual a \$6".',
      options: ['(X/2) - 2 = 6', '2X - 2 = 6', 'X - 2/2 = 6', '(X-2)/2 = 6'],
      correctAnswerIndex: 0,
      feedback:
          'La mitad de Luis es X/2. Le restas 2, y lo igualas a 6: (X/2) - 2 = 6.',
      conceptTag: 'modelamiento_avanzado',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Modelamiento',
      content: 'Resuelve estos 4 ejercicios para completar el nivel.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Modela: "Un número incrementado en 8 resulta en 20".',
      options: ['X + 8 = 20', '8 + 20 = X', 'X - 8 = 20', '8X = 20'],
      correctAnswerIndex: 0,
      feedback: 'Incrementar es sumar: X + 8 = 20.',
      conceptTag: 'modelamiento_basico',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: 'Modela: "El triple de un número menos 5 equivale a 25".',
      options: ['3X - 5 = 25', 'X - 15 = 25', '3(X - 5) = 25', '5 - 3X = 25'],
      correctAnswerIndex: 0,
      feedback: 'El triple es 3X, menos 5, igual a 25: 3X - 5 = 25.',
      conceptTag: 'modelamiento_avanzado',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'Modela: "Cinco veces un número es igual a 40".',
      options: ['5X = 40', 'X + 5 = 40', 'X/5 = 40', '40X = 5'],
      correctAnswerIndex: 0,
      feedback: '"Cinco veces" es una multiplicación directa: 5X = 40.',
      conceptTag: 'modelamiento_basico',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Modela: "La suma de un número con su número consecutivo es 15".',
      options: ['X + (X+1) = 15', 'X + Y = 15', '2X = 15', 'X + 1 = 15'],
      correctAnswerIndex: 0,
      feedback:
          'Si tu número es X, el consecutivo (el siguiente) es X+1. Por tanto: X + (X+1) = 15.',
      conceptTag: 'modelamiento_avanzado',
    ),
  ];

  // ==========================================
  // NIVEL 3: ESTIMACIÓN (2)
  // Tags: "estimacion_cantidades", "estimacion_operaciones"
  // ==========================================
  static final List<LessonSlide> _level3Estimacion = [
    LessonSlide(
      type: SlideType.intro,
      title: 'El Arte de Estimar',
      content:
          'En el mundo real no siempre necesitas el valor exacto. Si vas al supermercado, te basta con calcular "más o menos" para saber si te alcanza el dinero.',
      icon: Icons.calculate_outlined,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Estimación de Cantidades',
      content:
          'Para estimar rápido, redondea los números al entero o a la decena más cercana antes de sumar.\n\nEjemplo: Tienes un producto de \$19 y otro de \$31.\n19 está cerca de 20.\n31 está cerca de 30.\nTotal estimado: 20 + 30 = \$50.',
      icon: Icons.local_grocery_store,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si hay 103 dulces en una bolsa y 98 en otra, ¿cuántos hay aproximadamente?',
      options: ['200', '150', '250', '190'],
      correctAnswerIndex: 0,
      feedback:
          '103 está cerca de 100, y 98 está cerca de 100. Sumando ambos, hay aprox. 200.',
      conceptTag: 'estimacion_cantidades',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Estimar Operaciones',
      content:
          'Al multiplicar o dividir números feos, el redondeo te salva.\n\nEjemplo: Estimar 9 × 11.\n9 está muy cerca de 10.\n11 está muy cerca de 10.\n10 × 10 = 100. ¡El resultado real (99) es casi idéntico a tu estimación!',
      icon: Icons.query_stats,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Estima mentalmente el resultado de 19 × 5:',
      options: ['100', '90', '50', '200'],
      correctAnswerIndex: 0,
      feedback:
          '19 está casi en 20. Si multiplicas 20 x 5 obtienes 100 rápidamente.',
      conceptTag: 'estimacion_operaciones',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Estimación',
      content: 'Calcula rápido y aproximado en estos 4 ejercicios.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content: 'Para sumar mentalmente 48 + 51, ¿cuál es la mejor estimación?',
      options: [
        '50 + 50 = 100',
        '40 + 50 = 90',
        '40 + 60 = 100',
        '45 + 55 = 100',
      ],
      correctAnswerIndex: 0,
      feedback:
          'Ambos números están a solo 1 o 2 unidades del 50, por lo que 50+50 es la mejor ruta.',
      conceptTag: 'estimacion_cantidades',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content: '¿Cuál es la estimación más rápida para la división 98 ÷ 11?',
      options: [
        '100 ÷ 10 = 10',
        '90 ÷ 10 = 9',
        '100 ÷ 11 = 9',
        '98 ÷ 10 = 9.8',
      ],
      correctAnswerIndex: 0,
      feedback:
          'Al redondear el 98 a 100 y el 11 a 10, puedes dividir 100÷10=10 mentalmente.',
      conceptTag: 'estimacion_operaciones',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'Quieres comprar 3 camisetas que cuestan \$19.50 cada una. ¿Cuánto dinero deberías llevar aprox?',
      options: ['\$60', '\$50', '\$40', '\$100'],
      correctAnswerIndex: 0,
      feedback: '19.50 es casi 20. Tres camisetas a \$20 serían \$60.',
      conceptTag: 'estimacion_cantidades',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content: 'Estima rápidamente 102 × 1.9:',
      options: ['200', '100', '300', '150'],
      correctAnswerIndex: 0,
      feedback: '102 es casi 100. 1.9 es casi 2. Multiplicando 100 x 2 = 200.',
      conceptTag: 'estimacion_operaciones',
    ),
  ];

  // ==========================================
  // NIVEL 4: FINANZAS PERSONALES (3)
  // Tags: "ahorro_presupuesto", "interes_simple"
  // ==========================================
  static final List<LessonSlide> _level4Finanzas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Finanzas Personales',
      content:
          'El dinero no crece en los árboles, pero si aprendes a calcular presupuestos y entender los intereses, crecerá en tus cuentas bancarias.',
      icon: Icons.savings,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Presupuesto',
      content:
          'Un presupuesto es un plan para tu dinero. La regla de oro es sencilla:\n\nINGRESOS (Lo que ganas) - GASTOS (Lo que compras) = AHORRO (Lo que guardas).\n\nSi gastas más de lo que ingresas, ¡entras en deudas!',
      icon: Icons.account_balance_wallet,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si ganas \$100 a la semana y gastas \$60 en salidas, ¿cuál es tu ahorro semanal?',
      options: ['\$40', '\$60', '\$100', '\$160'],
      correctAnswerIndex: 0,
      feedback:
          'Ingresos (100) menos Gastos (60) te deja con un Ahorro de \$40.',
      conceptTag: 'ahorro_presupuesto',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Interés Simple',
      content:
          'Es el premio que te da el banco por guardar tu dinero ahí.\n\nFórmula: Interés = Capital × Tasa × Tiempo.\nSi guardas \$100 (Capital) con una tasa del 10% anual por 1 año:\nI = 100 × 0.10 × 1 = \$10.\n¡Ganaste \$10 extra sin hacer nada!',
      icon: Icons.trending_up,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si ahorras \$200 al 5% anual durante 1 año, ¿cuánto dinero en intereses ganas?',
      options: ['\$10', '\$20', '\$5', '\$205'],
      correctAnswerIndex: 0,
      feedback: 'El 5% de 200 es 10. (200 × 0.05 × 1 = \$10).',
      conceptTag: 'interes_simple',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario Financiero',
      content: 'Demuestra que eres un maestro del dinero.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'Tienes un presupuesto de \$200. Gastas \$50 en juegos y \$50 en ropa. ¿Qué te queda de ahorro?',
      options: ['\$100', '\$50', '\$0', '\$150'],
      correctAnswerIndex: 0,
      feedback:
          'Tus gastos totales son \$100. Al restarlos de tu presupuesto de \$200, te quedan \$100.',
      conceptTag: 'ahorro_presupuesto',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Conceptualmente, ¿qué significa que un banco te ofrezca una tasa de interés del 5% anual?',
      options: [
        'Que por cada \$100 que guardes 1 año, te regalarán \$5',
        'Que te cobrarán \$5',
        'Que te multiplicarán el dinero por 5',
        'Que debes esperar 5 años',
      ],
      correctAnswerIndex: 0,
      feedback:
          'La tasa de interés es un porcentaje. 5% significa ganar 5 dólares por cada 100 invertidos al año.',
      conceptTag: 'interes_simple',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'Si logras ahorrar \$50 cada mes, ¿cuánto dinero tendrás en medio año (6 meses)?',
      options: ['\$300', '\$600', '\$250', '\$150'],
      correctAnswerIndex: 0,
      feedback:
          'Multiplicas tu ahorro mensual por los meses: \$50 × 6 = \$300.',
      conceptTag: 'ahorro_presupuesto',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Si tienes \$1000 en el banco al 10% anual, ¿cuánto interés ganarás al pasar 2 años?',
      options: ['\$200', '\$100', '\$1000', '\$1200'],
      correctAnswerIndex: 0,
      feedback: 'I = 1000 × 0.10 × 2 = \$200 en intereses totales.',
      conceptTag: 'interes_simple',
    ),
  ];

  // ==========================================
  // NIVEL 5: SISTEMA DE MEDIDAS (4)
  // Tags: "conversion_longitud", "conversion_peso_volumen"
  // ==========================================
  static final List<LessonSlide> _level5Medidas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'El Sistema de Medidas',
      content:
          'En el mundo real necesitamos medir distancias, pesar alimentos y embotellar líquidos. Todo está estandarizado en base a multiplicaciones y divisiones por 10, 100 y 1000.',
      icon: Icons.straighten,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Longitud y Distancia',
      content:
          'La base es el metro (m).\n\nPara distancias grandes usamos el kilómetro (km). "Kilo" significa mil, así que 1 km = 1000 metros.\n\nPara cosas pequeñas usamos el centímetro (cm). "Centi" significa cien, así que 1 m = 100 cm.',
      icon: Icons.map,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: '¿A cuántos metros equivale caminar 2 kilómetros?',
      options: ['2000 m', '200 m', '20 m', '2 m'],
      correctAnswerIndex: 0,
      feedback:
          'Como 1 km son 1000 metros, multiplicas 2 x 1000 = 2000 metros.',
      conceptTag: 'conversion_longitud',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Peso y Volumen',
      content:
          'La regla de los miles se repite aquí.\n\nEn peso: 1 Kilogramo (kg) equivale a 1000 gramos (g).\nEn líquidos: 1 Litro (L) equivale a 1000 mililitros (ml).',
      icon: Icons.scale,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content: 'Si compras medio kilo de carne (0.5 kg), ¿cuántos gramos son?',
      options: ['500 g', '50 g', '5 g', '1000 g'],
      correctAnswerIndex: 0,
      feedback: 'La mitad de 1000 gramos es exactamente 500 gramos.',
      conceptTag: 'conversion_peso_volumen',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario de Medidas',
      content: 'Convierte las unidades con éxito en estos 4 ejercicios.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'Si tu regla mide 500 centímetros, ¿cuántos metros de largo tiene?',
      options: ['5 m', '50 m', '0.5 m', '5000 m'],
      correctAnswerIndex: 0,
      feedback:
          'Como cada 100 cm forman 1 metro, divides 500 ÷ 100 = 5 metros.',
      conceptTag: 'conversion_longitud',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Tienes una botella de agua de 3 Litros. ¿A cuántos mililitros (ml) equivale?',
      options: ['3000 ml', '300 ml', '30 ml', '3300 ml'],
      correctAnswerIndex: 0,
      feedback:
          '1 Litro son 1000 ml, por lo tanto multiplicas 3 x 1000 = 3000 ml.',
      conceptTag: 'conversion_peso_volumen',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content: 'La carrera fue de 1.5 km. ¿Cuántos metros corriste en total?',
      options: ['1500 m', '150 m', '15 m', '1005 m'],
      correctAnswerIndex: 0,
      feedback:
          'Multiplicas por 1000 (moviendo el punto decimal 3 veces a la derecha): 1500 metros.',
      conceptTag: 'conversion_longitud',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'En la balanza pusiste 2000 gramos de fruta. ¿Cuántos kilos llevas?',
      options: ['2 kg', '20 kg', '0.2 kg', '200 kg'],
      correctAnswerIndex: 0,
      feedback:
          'Para pasar de gramos a kilos, divides entre 1000. 2000 ÷ 1000 = 2 kg.',
      conceptTag: 'conversion_peso_volumen',
    ),
  ];

  // ==========================================
  // NIVEL 6: MATEMÁTICAS EN RECETAS (5)
  // Tags: "ajuste_recetas", "proporcion_recetas"
  // ==========================================
  static final List<LessonSlide> _level6Recetas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Laboratorio Culinario',
      content:
          '¡El último desafío! La cocina es pura matemática: ajuste de porciones, tiempos y mezcla de proporciones precisas.',
      icon: Icons.restaurant,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Ajustando las Porciones',
      content:
          'Si una receta es para 4 personas y tú tienes 8 invitados, ¿qué haces?\n\n¡Multiplicas todos los ingredientes por 2! Es pura proporcionalidad directa. Si pedía 1 taza de harina, ahora serán 2 tazas.',
      icon: Icons.local_dining,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Una receta para 4 personas pide 2 huevos. Si la haces para 8 personas, ¿cuántos huevos usarás?',
      options: ['4 huevos', '8 huevos', '2 huevos', '6 huevos'],
      correctAnswerIndex: 0,
      feedback:
          '8 personas es el doble de 4, por lo que multiplicas 2 huevos × 2 = 4 huevos.',
      conceptTag: 'ajuste_recetas',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Proporción de Ingredientes',
      content:
          'Algunas recetas mantienen "razones" mágicas. Por ejemplo, la vinagreta perfecta tiene una proporción de 1:3 (1 cucharada de vinagre por cada 3 de aceite).\n\nSi quieres hacer mucha vinagreta y echas 2 de vinagre, ¡debes echar 6 de aceite para no arruinar el sabor!',
      icon: Icons.blender,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Práctica Rápida',
      content:
          'Si usas 1 taza de azúcar por 2 tazas de harina (proporción 1:2). Para 3 tazas de azúcar, ¿cuánta harina usas?',
      options: ['6 tazas', '3 tazas', '5 tazas', '4 tazas'],
      correctAnswerIndex: 0,
      feedback:
          'Como la proporción dicta que la harina siempre es el doble del azúcar: 3 × 2 = 6 tazas.',
      conceptTag: 'proporcion_recetas',
    ),
    // --- CUESTIONARIO FINAL ---
    LessonSlide(
      type: SlideType.quizSummary,
      title: 'Cuestionario Culinario',
      content: 'Aplica la proporcionalidad en estas recetas finales.',
      icon: Icons.workspace_premium,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 1',
      content:
          'Una receta para 2 personas usa 100 ml de leche. ¿Cuánta leche usarás si cocinas solo para ti (1 persona)?',
      options: ['50 ml', '100 ml', '200 ml', '25 ml'],
      correctAnswerIndex: 0,
      feedback: 'Debes dividir la receta a la mitad: 100 ÷ 2 = 50 ml.',
      conceptTag: 'ajuste_recetas',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 2',
      content:
          'Si la proporción de limonada exige 4 limones por cada 1 litro de agua, ¿cuántos limones necesitas para 2 litros?',
      options: ['8 limones', '4 limones', '6 limones', '12 limones'],
      correctAnswerIndex: 0,
      feedback:
          'El doble de agua requiere el doble de limones: 4 × 2 = 8 limones.',
      conceptTag: 'proporcion_recetas',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 3',
      content:
          'Si para 1 pastel necesitas exactamente media taza (1/2) de chocolate, para hacer 4 pasteles necesitarás:',
      options: [
        '2 tazas enteras',
        '4 tazas enteras',
        '1 taza entera',
        '1/2 taza',
      ],
      correctAnswerIndex: 0,
      feedback:
          'Multiplicas la fracción por entero: (1/2) × 4 = 4/2, lo que equivale a 2 tazas enteras.',
      conceptTag: 'ajuste_recetas',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Pregunta 4',
      content:
          'Para hacer arroz, la regla de oro es 1 taza de arroz por 2 de agua (1:2). Si echas 3 tazas de arroz, ¿cuántas de agua van?',
      options: [
        '6 tazas de agua',
        '3 tazas de agua',
        '5 tazas de agua',
        '4 tazas de agua',
      ],
      correctAnswerIndex: 0,
      feedback: 'El agua debe ser el doble del arroz. 3 × 2 = 6 tazas.',
      conceptTag: 'proporcion_recetas',
    ),
    LessonSlide(
      type: SlideType.quizSummary,
      title: '¡Mundo Completado!',
      content:
          '¡Felicidades! Has conquistado la Ciudad Aplicación y con ella, el último mundo matemático.',
      icon: Icons.stars,
    ),
  ];
}
