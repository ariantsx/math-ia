import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  // Configura tu URL de FastAPI
  final String _baseUrl = 'http://localhost:3000/api';

  // Datos del usuario en memoria
  int _userId = 0;
  String _name = "";
  String _email = '';

  // Variable para controlar el tiempo
  Timer? _lifeTimer;

  // NUEVO: Variable para el conteo en segundos (300 segundos = 5 minutos)
  int _secondsUntilNextLife = 300;

  // Estadísticas del jugador
  int _exp = 0;
  int _coins = 0;
  int _lives = 5;

  Map<String, dynamic> _inventory = {};
  Map<String, dynamic> _equipped = {};

  // --- LÓGICA DE NIVELES (Curva de progresión) ---
  final int _baseExp = 100; // Cuánto cuesta el Nivel 1
  final double _multiplier = 1.5; // Qué tan difícil se vuelve cada nivel

  // --- MOTOR DE IA (Reinforcement Learning) ---
  int _skillLevel = 3; // Empieza en 3 por defecto (Escala del 1 al 10)
  int get skillLevel => _skillLevel;

  // NUEVA VARIABLE: Progreso de los mundos
  Map<String, dynamic> _worldProgress = {};
  Map<String, dynamic> get worldProgress => _worldProgress;

  Map<String, dynamic> _lessonProgress = {};
  Map<String, dynamic> get lessonProgress => _lessonProgress;

  // --- NUEVO: Memoria de ejercicios de IA (Modo Repaso) ---
  Map<String, dynamic> _savedDynamicExercises = {};
  Map<String, dynamic> get savedDynamicExercises => _savedDynamicExercises;

  List<dynamic> _examHistory = [];

  // Getters para que la UI lea los datos
  int get id => _userId;
  String get name => _name;
  String get email => _email;

  // 1. Calcula en qué nivel estás basado en tu Experiencia Total
  int get level {
    int lvl = 1;
    int expNeeded = _baseExp;
    int tempExp = _exp;

    while (tempExp >= expNeeded) {
      lvl++;
      tempExp -= expNeeded;
      expNeeded = (expNeeded * _multiplier)
          .toInt(); // El próximo nivel cuesta más
    }
    return lvl;
  }

  // ==========================================
  // CONSTRUCTOR: Iniciar el temporizador al cargar el Provider
  // ==========================================
  UserProvider() {
    _startLifeTimer();
  }

  // MODIFICADO: Ahora el reloj "hace tic" cada 1 segundo
  void _startLifeTimer() {
    _lifeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_lives < 5) {
        _secondsUntilNextLife--;

        // Si el tiempo llega a cero, damos una vida y reiniciamos el reloj
        if (_secondsUntilNextLife <= 0) {
          _lives++;
          _secondsUntilNextLife = 300;
          _syncWithBackend(); // Guardamos en la base de datos
        }
        notifyListeners(); // Avisamos a la pantalla CADA SEGUNDO para que actualice el texto
      } else {
        // Si ya tiene 5 vidas, mantenemos el reloj en 5 minutos
        if (_secondsUntilNextLife != 300) {
          _secondsUntilNextLife = 300;
        }
      }
    });
  }

  @override
  void dispose() {
    // ¡Muy importante! Apagamos el temporizador si el Provider se destruye
    _lifeTimer?.cancel();
    super.dispose();
  }

  // ==========================================
  // FUNCIONES DE GAMIFICACIÓN
  // ==========================================

  void addCoins(int amount) {
    _coins += amount;
    notifyListeners();
    _syncWithBackend(); // Sincronizamos con PostgreSQL
  }

  void addExp(int amount) {
    _exp += amount;
    notifyListeners();
    _syncWithBackend(); // Sincronizamos con PostgreSQL
  }

  void deductLife() {
    if (_lives > 0) {
      _lives--;
      notifyListeners();
      _syncWithBackend(); // Sincronizamos con PostgreSQL
    }
  }

  // 2. Calcula cuánta experiencia llevas EN TU NIVEL ACTUAL
  int get currentLevelExp {
    int expNeeded = _baseExp;
    int tempExp = _exp;

    while (tempExp >= expNeeded) {
      tempExp -= expNeeded;
      expNeeded = (expNeeded * _multiplier).toInt();
    }
    return tempExp; // Es el "sobrante"
  }

  // 3. Calcula cuánta experiencia PIDE TU NIVEL ACTUAL
  int get maxLevelExp {
    int lvl = level;
    int expNeeded = _baseExp;
    for (int i = 1; i < lvl; i++) {
      expNeeded = (expNeeded * _multiplier).toInt();
    }
    return expNeeded;
  }

  int get exp => _exp;
  int get coins => _coins;
  int get lives => _lives;

  // NUEVO: Getter que formatea el tiempo a un texto bonito como "04:59"
  String get timeUntilNextLifeFormatted {
    if (_lives >= 5) return 'MÁX';
    final minutes = (_secondsUntilNextLife ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsUntilNextLife % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Map<String, dynamic> get inventory => _inventory;
  Map<String, dynamic> get equipped => _equipped;
  List<dynamic> get examHistory => _examHistory;

  // 1. CARGAR DATOS (Se llama después de un Login exitoso)
  Future<void> fetchUserData(int id) async {
    _userId = id;
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users/$_userId'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _name = data['name'];
        _email = data['email'] ?? '';
        _exp = data['exp'];
        _coins = data['coins'];
        _lives = data['lives'];
        _inventory = data['inventory'];
        _equipped = data['equipped'];
        _examHistory = data['exam_history'] ?? [];
        // Leemos el progreso al iniciar sesión
        _worldProgress = data['world_progress'] ?? {};
        _lessonProgress = data['lesson_progress'] ?? {};

        // --- NUEVO: Sincronizar el reloj del celular con el reloj del servidor ---
        _secondsUntilNextLife = data['next_life_in_seconds'] ?? 300;

        _skillLevel = data['skill_level'];

        notifyListeners(); // Actualiza todas las pantallas
      }
    } catch (e) {
      debugPrint("Error cargando usuario: $e");
    }
  }

  // 2. COMPRAR UN ITEM (Desde la Tienda)
  bool buyItem(String category, String itemId, int price) {
    if (_coins >= price) {
      _coins -= price; // Restar monedas
      List<dynamic> categoryItems = _inventory[category] ?? [];
      categoryItems.add(itemId); // Agregar al inventario
      _inventory[category] = categoryItems;

      notifyListeners();
      _syncWithBackend(); // Guardar en PostgreSQL
      return true; // Compra exitosa
    }
    return false; // No tiene dinero
  }

  // 3. EQUIPAR/DESEQUIPAR UN ITEM (Desde el Avatar)
  void toggleEquip(String category, String itemId) {
    // category en DB: "hat", "glass", "shirt"
    if (_equipped[category] == itemId) {
      _equipped[category] = null; // Se lo quita
    } else {
      _equipped[category] = itemId; // Se lo pone
    }
    notifyListeners();
    _syncWithBackend(); // Guardar en PostgreSQL
  }

  // 4. SINCRONIZAR CON FASTAPI (Fondo / Silencioso)
  Future<void> _syncWithBackend() async {
    if (_userId == 0) return;
    try {
      await http.put(
        Uri.parse('$_baseUrl/users/$_userId/sync'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'exp': _exp,
          'coins': _coins,
          'lives': _lives,
          'inventory': _inventory,
          'equipped': _equipped,
          'world_progress': _worldProgress,
          'lesson_progress': _lessonProgress,
          'skill_level': _skillLevel,
        }),
      );
    } catch (e) {
      debugPrint("Error sincronizando: $e");
    }
  }

  // --- NUEVA FUNCIÓN PARA PASAR DE NIVEL ---
  void completeLevel(String worldId, int levelIndexCompleted) {
    // Solo aumentamos el progreso si es un nivel NUEVO (para evitar que sume al repasar)
    int currentWorldProgress = _worldProgress[worldId] ?? 0;

    if (levelIndexCompleted >= currentWorldProgress) {
      _worldProgress[worldId] = levelIndexCompleted + 1;
      notifyListeners();
      _syncWithBackend(); // Guardamos silenciosamente
    }
  }

  // --- NUEVAS FUNCIONES PARA LOS EJERCICIOS ---
  List<int> getCompletedExercises(String worldId, int levelIndex) {
    final key = '${worldId}_$levelIndex';
    final progress = _lessonProgress[key];
    if (progress == null) return [];
    return List<int>.from(progress);
  }

  void markExerciseCompleted(
    String worldId,
    int levelIndex,
    int slideIndex, {
    Map<String, dynamic>? dynamicExerciseData,
  }) {
    final key = '${worldId}_$levelIndex';
    if (!_lessonProgress.containsKey(key)) {
      _lessonProgress[key] = [];
    }

    List<int> completed = List<int>.from(_lessonProgress[key]);
    if (!completed.contains(slideIndex)) {
      completed.add(slideIndex);
      _lessonProgress[key] = completed;

      // NUEVO: Guardar la "foto" del ejercicio de la IA
      if (dynamicExerciseData != null) {
        final exerciseKey = '${worldId}_${levelIndex}_$slideIndex';
        _savedDynamicExercises[exerciseKey] = dynamicExerciseData;
      }

      notifyListeners();
      _syncWithBackend(); // Guarda en PostgreSQL silenciosamente
    }
  }

  // --- NUEVO: Recuperar ejercicio para el Repaso ---
  Map<String, dynamic>? getSavedDynamicExercise(
    String worldId,
    int levelIndex,
    int slideIndex,
  ) {
    final exerciseKey = '${worldId}_${levelIndex}_$slideIndex';
    return _savedDynamicExercises[exerciseKey];
  }

  // --- REFUERZO DE IA ---
  Future<void> updateSkillLevel(bool isCorrect) async {
    if (isCorrect) {
      // Recompensa: Sube la dificultad si acertó (Máximo 10)
      if (_skillLevel < 10) {
        _skillLevel++;
      }
    } else {
      // Castigo/Ajuste: Baja la dificultad si se equivocó (Mínimo 1)
      if (_skillLevel > 1) {
        _skillLevel--;
      }
    }

    notifyListeners();
    _syncWithBackend();
  }

  // --- LIMPIEZA DE SESIÓN ---
  void clearData() {
    _userId = 0;
    _name = "";
    _email = '';
    _secondsUntilNextLife = 300;
    _exp = 0;
    _coins = 0;
    _lives = 5;

    _inventory = {};
    _equipped = {};
    _worldProgress = {};
    _lessonProgress = {};
    _savedDynamicExercises = {};
    _examHistory = [];

    _skillLevel = 3; // Reseteamos al cerrar sesión

    notifyListeners();
  }
}
