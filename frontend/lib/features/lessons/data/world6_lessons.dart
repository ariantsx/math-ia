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
  // ==========================================
  static final List<LessonSlide> _level1ProblemasVerbales = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Ciudad Aplicación',
      content:
          '¡Bienvenido al Mundo 6, la metrópolis de las matemáticas! Aquí no hay ecuaciones flotando en el aire; hay problemas reales que necesitan solución.',
      icon: Icons.location_city,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Traduciendo Letras a Números',
      content:
          'El secreto de los problemas verbales es encontrar las palabras clave:\n\n- "Total", "Más", "Juntar": Suma (+)\n- "Diferencia", "Quedan", "Perder": Resta (-)\n- "Veces", "Por cada": Multiplicación (x)\n- "Repartir", "Mitad", "Cada uno": División (÷)',
      icon: Icons.translate,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'traduccion_verbal',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'problemas_verbales',
    ),
  ];

  // ==========================================
  // NIVEL 2: MODELAMIENTO ARITMÉTICO (1)
  // ==========================================
  static final List<LessonSlide> _level2Modelamiento = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Los Arquitectos',
      content:
          'Para construir un edificio, primero haces un plano. En matemáticas, para resolver un problema grande, primero haces un "Modelo".',
      icon: Icons.architecture,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Creando Ecuaciones',
      content:
          'Modelar es crear una ecuación que represente la situación.\n\nEjemplo: "Tienes \$50 y compras boletos de \$5. ¿Cuántos compraste?"\nModelo: 5 x Boletos = 50. ¡El modelo nos dice que debemos dividir!',
      icon: Icons.design_services,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'modelamiento_basico',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'modelamiento_avanzado',
    ),
  ];

  // ==========================================
  // NIVEL 3: ESTIMACIÓN (2)
  // ==========================================
  static final List<LessonSlide> _level3Estimacion = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Cálculos Rápidos',
      content:
          'En la calle no siempre tienes una calculadora. A veces, un resultado aproximado "al ojo" es mejor que uno exacto que tarda mucho.',
      icon: Icons.visibility,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Arte de Estimar',
      content:
          'Usa el redondeo inteligente. \n\nEjemplo: Si compras algo de \$19 y algo de \$31. No sumes exacto. Piensa: "\$19 es casi 20, \$31 es casi 30. Me gastaré unos \$50".\n¡Es rápido y muy útil en el supermercado!',
      icon: Icons.shopping_cart,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'estimacion_cantidades',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'estimacion_operaciones',
    ),
  ];

  // ==========================================
  // NIVEL 4: FINANZAS PERSONALES (3)
  // ==========================================
  static final List<LessonSlide> _level4Finanzas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Tu Propio Banco',
      content:
          'Las matemáticas más importantes son las que cuidan tu billetera. ¡Aprende a administrar tus ganancias!',
      icon: Icons.account_balance_wallet,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Ingresos vs Egresos',
      content:
          'Ingreso es el dinero que ENTRA (+). Egreso es el dinero que SALE (-).\n\nPara no ir a la quiebra, tus ingresos siempre deben ser mayores que tus egresos. Lo que sobra se llama "Ahorro".',
      icon: Icons.savings,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'ahorro_presupuesto',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Interés Simple',
      content:
          'Si guardas dinero en el banco, te pagan un "Interés". Es dinero extra que ganas solo por no gastarlo.\n\nFórmula rápida: Interés = Dinero x Porcentaje x Tiempo.',
      icon: Icons.trending_up,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'interes_simple',
    ),
  ];

  // ==========================================
  // NIVEL 5: SISTEMA DE MEDIDAS (4)
  // ==========================================
  static final List<LessonSlide> _level5Medidas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Midiendo el Mundo',
      content:
          'Distancias, pesos y líquidos. Todo en el mundo tiene un tamaño y necesitamos un sistema para ponernos de acuerdo.',
      icon: Icons.straighten,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'El Sistema Métrico',
      content:
          'El secreto del sistema métrico (Kilos, Litros, Metros) es que funciona con base 10.\n\n- 1 Kilómetro = 1,000 metros.\n- 1 Litro = 1,000 mililitros.\n- 1 Kilogramo = 1,000 gramos.',
      icon: Icons.scale,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'conversion_longitud',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'conversion_peso_volumen',
    ),
  ];

  // ==========================================
  // NIVEL 6: MATEMÁTICAS EN RECETAS (5)
  // ==========================================
  static final List<LessonSlide> _level6Recetas = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Laboratorio Culinario',
      content:
          'El último desafío. La cocina es pura matemática: fracciones, tiempos, temperaturas y escalas.',
      icon: Icons.restaurant,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Ajustando las Porciones',
      content:
          'Si una receta es para 4 personas y tú tienes 8 invitados, ¿qué haces?\n\n¡Multiplicas todo por 2! Es pura proporcionalidad directa aplicada. Si pide 1/2 taza de harina, ahora serán 2/2 (1 taza entera).',
      icon: Icons.local_dining,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'proporcion_recetas',
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'ajuste_recetas',
    ),
  ];
}
