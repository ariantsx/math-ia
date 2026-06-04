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
          'Una razón es simplemente la comparación de dos cantidades dividiéndolas.\n\nEjemplo: Si en tu salón hay 10 niños y 15 niñas, la razón de niños a niñas es de "10 a 15", que también se escribe como la fracción 10/15 o con dos puntos 10:15.',
      icon: Icons.compare_arrows,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'concepto_razon',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Razones Equivalentes',
      content:
          'Al igual que las fracciones, puedes simplificar las razones.\n\nSiguiendo el ejemplo anterior, la razón de 10:15 puede simplificarse dividiendo entre 5. ¡Queda 2:3! Significa que "Por cada 2 niños, hay 3 niñas".',
      icon: Icons.compress,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'razones_equivalentes',
    ),
  ];

  // ==========================================
  // NIVEL 2: PROPORCIONALIDAD DIRECTA (1)
  // ==========================================
  static final List<LessonSlide> _level2PropDirecta = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Creciendo Juntos',
      content:
          'A veces, si una cantidad crece, la otra también debe crecer al mismo ritmo. A esto le llamamos "Proporcionalidad Directa".',
      icon: Icons.trending_up,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Proporcionalidad Directa',
      content:
          'Ejemplo: Si 1 manzana cuesta \$2, entonces 3 manzanas costarán \$6.\n\nMientras MÁS manzanas compras, MÁS pagas. Suben al mismo tiempo y a la misma velocidad.',
      icon: Icons.shopping_cart,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'proporcion_directa',
    ),
  ];

  // ==========================================
  // NIVEL 3: PROPORCIONALIDAD INVERSA (2)
  // ==========================================
  static final List<LessonSlide> _level3PropInversa = [
    LessonSlide(
      type: SlideType.intro,
      title: 'Efecto Espejo',
      content:
          'Pero no todo sube al mismo tiempo. ¿Qué pasa si mientras una cosa Sube, la otra Baja? ¡Bienvenido a la Proporción Inversa!',
      icon: Icons.sync,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Proporcionalidad Inversa',
      content:
          'Ejemplo de construcción: Si 2 obreros tardan 10 días en hacer un muro, 4 obreros tardarán solo 5 días.\n\nMientras MÁS obreros trabajan, MENOS días se demoran. ¡Si uno se multiplica, el otro se divide!',
      icon: Icons.engineering,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'proporcion_inversa',
    ),
  ];

  // ==========================================
  // NIVEL 4: REGLA DE TRES SIMPLE (3)
  // ==========================================
  static final List<LessonSlide> _level4ReglaTresSimple = [
    LessonSlide(
      type: SlideType.intro,
      title: 'La Herramienta Mágica',
      content:
          'Ya sabes qué es directo y qué es inverso. Ahora vamos a usar una fórmula maestra para calcular cualquier cosa: La Regla de Tres.',
      icon: Icons.auto_fix_high,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Regla de Tres Directa',
      content:
          'Se usa cuando las cantidades suben o bajan juntas.\n\nSi 2 litros de pintura cubren 10 metros, ¿cuántos litros cubren 20 metros?\n1. Multiplicas cruzado: 2 x 20 = 40.\n2. Divides entre el que sobra: 40 / 10 = 4 litros.',
      icon: Icons.brush,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'regla_tres_directa',
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Regla de Tres Inversa',
      content:
          'CUIDADO: Se usa cuando uno sube y el otro baja (obreros y días).\n\nAquí NO se multiplica cruzado. Se multiplica en línea recta (los dos números que están juntos) y se divide entre el que queda solo.',
      icon: Icons.warning,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'regla_tres_inversa',
    ),
  ];

  // ==========================================
  // NIVEL 5: REGLA DE TRES COMPUESTA (4)
  // ==========================================
  static final List<LessonSlide> _level5ReglaTresCompuesta = [
    LessonSlide(
      type: SlideType.intro,
      title: 'El Caos de las Variables',
      content:
          'Llegamos a un nivel avanzado. ¿Qué pasa cuando no hay 2, sino 3 cosas que se comparan a la vez? (Ejemplo: Obreros, Días y Metros de muro).',
      icon: Icons.account_tree,
    ),
    LessonSlide(
      type: SlideType.teaching,
      title: 'Desarmando el Problema',
      content:
          'La Regla de Tres Compuesta se resuelve dividiéndola en dos reglas de tres simples.\n\nSiempre debes comparar tu variable de incógnita (la X) primero con la columna 1, y luego la incógnita con la columna 2, para ver si son directas o inversas.',
      icon: Icons.alt_route,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'regla_tres_compuesta',
    ),
  ];

  // ==========================================
  // NIVEL 6: ESCALAS (5)
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
      icon: Icons.zoom_in,
    ),
    LessonSlide(
      type: SlideType.exercise,
      title: 'Cargando IA...',
      content: 'Respaldo offline',
      options: ['A', 'B', 'C', 'D'],
      correctAnswerIndex: 0,
      conceptTag: 'escalas_mapas',
    ),
  ];
}
