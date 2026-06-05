-- 1. Vaciamos la tabla para eliminar los tags incorrectos
TRUNCATE TABLE exercises RESTART IDENTITY;

-- 2. Insertamos la batería perfectamente sincronizada con Flutter
INSERT INTO exercises (world_id, level_index, base_difficulty, concept_tag, question_text, options, correct_answer_index, feedback) 
VALUES
    -- ==========================================
    -- NIVEL 1: NÚMEROS NATURALES (level_index = 0)
    -- Tags en Flutter: ordinal, sucesor, antecesor, identificacion, conjunto_naturales, uso_naturales
    -- ==========================================
    ('w1', 0, 3, 'ordinal', 'Si en una carrera llegas justo después del 1er lugar, ¿qué posición ocupas?', '["3er lugar", "2do lugar", "Último", "1er lugar"]', 1, 'Llegar después del primero te convierte en el segundo (2do).'),
    ('w1', 0, 8, 'ordinal', '¡Reto! Si rebasas al competidor que va en el 4to lugar, ¿en qué posición quedas tú?', '["3er lugar", "4to lugar", "5to lugar", "1er lugar"]', 1, 'Si rebasas al cuarto, tú tomas su posición. Quedas en 4to lugar.'),
    ('w1', 0, 3, 'sucesor', '¿Cuál es el sucesor del número 999?', '["998", "100", "1000", "1001"]', 2, 'El sucesor se halla sumando 1. 999 + 1 = 1000.'),
    ('w1', 0, 5, 'sucesor', 'Si vas en el piso 5 y subes 1 piso, ¿has hallado el...?', '["Antecesor", "Sucesor", "Cero", "Decimal"]', 1, 'Sumar 1 a cualquier número natural te da como resultado su sucesor (6).'),
    ('w1', 0, 3, 'antecesor', '¿Cuál es el antecesor del número 1 en los Números Naturales?', '["El 2", "El 0", "El -1", "No tiene antecesor natural"]', 3, 'Como los números naturales empiezan en el 1, el 1 es el único que no tiene antecesor.'),
    ('w1', 0, 4, 'identificacion', 'Estás contando los alumnos de tu salón. ¿Qué número NO podrías usar jamás?', '["25", "14", "32.5", "8"]', 2, 'Para contar objetos reales usamos números naturales (sin decimales).'),
    ('w1', 0, 4, 'conjunto_naturales', '¿Cuál conjunto representa a los Números Naturales (N)?', '["-1, 0, 1, 2", "1, 2, 3, 4...", "1.5, 2.5, 3.5", "0.1, 0.2"]', 1, 'Los naturales son enteros positivos que usamos para contar, desde el 1 al infinito.'),
    ('w1', 0, 3, 'uso_naturales', 'Las edades de las personas (Ej: 15 años) se expresan siempre con números...', '["Negativos", "Naturales", "Decimales", "Imaginarios"]', 1, 'Las edades completas se cuentan en cantidades enteras y positivas.'),

    -- ==========================================
    -- NIVEL 2: NÚMEROS ENTEROS (level_index = 1)
    -- Tags en Flutter: uso_enteros, recta_numerica, valor_absoluto, temperatura, profundidad, identificacion
    -- ==========================================
    ('w1', 1, 3, 'uso_enteros', 'Estás en la planta baja (piso 0) y bajas 3 pisos. ¿En qué piso estás?', '["Piso 3", "Piso 0", "Sótano -3", "Sótano -1"]', 2, 'Al bajar del cero, entramos al territorio negativo (-3).'),
    ('w1', 1, 5, 'uso_enteros', '¿Cómo representarías matemáticamente una deuda de 50 dólares?', '["50", "0.50", "-50", "50.0"]', 2, 'Las deudas representan dinero que te falta, por lo que usan el signo negativo (-50).'),
    ('w1', 1, 4, 'recta_numerica', '¿Qué número es MAYOR en la recta numérica?', '["-20", "-2", "-50", "-100"]', 1, 'El -2 está más a la derecha (más cerca del cero) que los demás.'),
    ('w1', 1, 5, 'recta_numerica', '¿Qué es mayor: una temperatura de -15°C o de -5°C?', '["-15°C", "-5°C", "Son igual de frías", "Cero"]', 1, '-5°C está más a la derecha en la recta numérica que -15°C.'),
    ('w1', 1, 3, 'valor_absoluto', '¿Cuál es el Valor Absoluto de -15?', '["-15", "0", "15", "1"]', 2, 'El valor absoluto es una distancia y siempre es positivo (15).'),
    ('w1', 1, 4, 'valor_absoluto', 'El Valor Absoluto de -99 es:', '["-99", "99", "0", "1"]', 1, 'La distancia al cero de -99 es 99 pasos (positivo).'),
    ('w1', 1, 4, 'temperatura', 'La temperatura era de -3°C. Al mediodía subió 5 grados. ¿Cuál es la temperatura ahora?', '["-8°C", "8°C", "2°C", "-2°C"]', 2, 'Estás en -3 y caminas 5 pasos a la derecha: llegas al 2°C.'),
    ('w1', 1, 4, 'profundidad', 'Si el nivel del mar es 0, un submarino a 40 metros de profundidad es:', '["40", "0.40", "-40", "0"]', 2, 'Todo lo que está por debajo del límite 0 es negativo (-40).'),
    ('w1', 1, 4, 'identificacion', '¿Cuál de estos números es Entero (Z) pero NO Natural (N)?', '["5", "0", "14", "100"]', 1, 'El cero (0) y los negativos son enteros, pero no naturales.'),

    -- ==========================================
    -- NIVEL 3: NÚMEROS RACIONALES (level_index = 2)
    -- Tags en Flutter: concepto_fraccion, decimales, division_cero, enteros_racionales, denominador, equivalencia, equivalencia_decimal
    -- ==========================================
    ('w1', 2, 3, 'concepto_fraccion', 'Una pizza se cortó en 8 pedazos y te comiste 3. ¿Qué número representa lo que comiste?', '["8/3", "3/8", "3.8", "5/8"]', 1, 'El total va abajo (8) y lo que tomas va arriba (3). 3/8.'),
    ('w1', 2, 3, 'decimales', '¿El número decimal 0.25 es un número racional?', '["No, tiene punto", "Sí, es igual a 1/4", "Solo si es negativo", "Es entero"]', 1, '0.25 es el resultado de dividir 1/4. Todo decimal exacto es racional.'),
    ('w1', 2, 4, 'division_cero', '¿Cuál de estos NO se considera un número racional (es un error)?', '["3/4", "-0.5", "5 / 0", "0 / 5"]', 2, 'Nunca puedes dividir entre cero. 5/0 es indefinido.'),
    ('w1', 2, 4, 'enteros_racionales', 'Si quiero escribir el número -8 como fracción, ¿cómo lo hago?', '["-8/8", "8/-1", "-8/1", "No se puede"]', 2, 'Cualquier entero se vuelve fracción poniéndole un 1 como denominador.'),
    ('w1', 2, 4, 'enteros_racionales', 'La afirmación "Todo número Entero es Racional" es:', '["Verdadera", "Falsa", "A veces", "Depende"]', 0, 'Es verdadera. Todo entero se vuelve fracción agregándole un 1 abajo.'),
    ('w1', 2, 3, 'denominador', '¿Qué número va en el Denominador de una fracción?', '["Lo que tomo", "El total de partes iguales", "El Cero", "El mayor"]', 1, 'El denominador (abajo) indica en cuántas partes iguales se dividió el entero.'),
    ('w1', 2, 4, 'equivalencia', 'La fracción 2/4 es exactamente igual a:', '["1/4", "0.25", "1/2", "4/8"]', 2, 'Si simplificas (divides a la mitad arriba y abajo), 2/4 es 1/2.'),
    ('w1', 2, 4, 'equivalencia_decimal', 'Si comes la mitad de un pastel, te comiste:', '["1/3", "0.2", "2/1", "0.5"]', 3, 'La mitad es 1/2, que en decimal es 0.5.'),

    -- ==========================================
    -- NIVEL 4: SUMA Y RESTA (level_index = 3)
    -- Tags en Flutter: suma_negativos, resta_diferentes, cuenta_bancaria, doble_signo, resta_simple, signos_iguales, resta_positiva
    -- ==========================================
    ('w1', 3, 3, 'suma_negativos', 'Calcula: -5 - 2', '["-7", "3", "-3", "7"]', 0, 'Signos iguales se suman (5+2=7) y se mantiene la bandera negativa (-7).'),
    ('w1', 3, 4, 'resta_diferentes', 'Calcula: -10 + 4', '["-14", "6", "-6", "14"]', 2, 'Signos diferentes se restan (10 - 4 = 6). El mayor es negativo, así que es -6.'),
    ('w1', 3, 5, 'cuenta_bancaria', 'Tu saldo es -$15. Depositas $10. ¿Cuál es tu nuevo saldo bancario?', '["$5", "-$5", "-$25", "$25"]', 1, 'Pagas 10 de tu deuda, pero sigues debiendo 5. El saldo es -5.'),
    ('w1', 3, 4, 'doble_signo', 'Calcula: 10 - (-5)', '["5", "-5", "15", "-15"]', 2, 'El menos y menos se hacen más. 10 + 5 = 15.'),
    ('w1', 3, 5, 'doble_signo', 'Calcula: -4 - (-4)', '["-8", "8", "0", "-16"]', 2, '-(-4) se vuelve +4. Entonces, -4 + 4 se restan y da 0.'),
    ('w1', 3, 3, 'resta_simple', 'Calcula: 15 - 20', '["5", "-5", "35", "-35"]', 1, 'Tienes 15 pero gastas 20. Quedas debiendo 5 (-5).'),
    ('w1', 3, 3, 'signos_iguales', 'Calcula: -7 - 8', '["-1", "1", "-15", "15"]', 2, 'Signos iguales se suman y mantienen el signo: -15.'),
    ('w1', 3, 4, 'resta_positiva', 'Calcula: -3 + 12', '["-9", "9", "-15", "15"]', 1, 'Signos diferentes se restan. El 12 es el mayor y es positivo (9).'),

    -- ==========================================
    -- NIVEL 5: MULTIPLICACIÓN (level_index = 4)
    -- Tags en Flutter: ley_signos, ley_signos_2, triple_mult, cadena_cero
    -- ==========================================
    ('w1', 4, 3, 'ley_signos', 'Calcula: (5)(-6)', '["-30", "30", "-1", "11"]', 0, 'Más por menos es menos. 5 x 6 = 30. Resultado: -30.'),
    ('w1', 4, 3, 'ley_signos', 'Si multiplicas un positivo por un negativo, el resultado es:', '["Positivo", "Negativo", "Cero", "Depende"]', 1, 'Signos diferentes siempre dan negativo.'),
    ('w1', 4, 4, 'ley_signos_2', 'Calcula: (-4) x (-3)', '["-12", "-7", "12", "7"]', 2, 'Menos por menos da más (+). Resultado 12.'),
    ('w1', 4, 4, 'ley_signos_2', 'Calcula: (-8) x (-2)', '["-16", "16", "-10", "10"]', 1, 'Menos por menos es más (+). 8 x 2 = 16.'),
    ('w1', 4, 6, 'triple_mult', 'Calcula: (-1)(-1)(-1)', '["1", "-1", "-3", "3"]', 1, '(-1)x(-1)=+1. Luego (+1)x(-1)= -1.'),
    ('w1', 4, 6, 'triple_mult', 'Calcula: (2)(-3)(2)', '["-12", "12", "-6", "7"]', 0, '(2)x(-3) = -6. Luego (-6)x(2) = -12.'),
    ('w1', 4, 3, 'cadena_cero', '¿Cuánto es: (-99) x 0 x 5 ?', '["-99", "495", "0", "-495"]', 2, 'Si hay un cero multiplicando, todo se vuelve cero instantáneamente.'),
    ('w1', 4, 3, 'cadena_cero', 'Calcula: 0 x (-1500)', '["-1500", "1500", "0", "Indefinido"]', 2, 'Todo multiplicado por cero es cero.'),

    -- ==========================================
    -- NIVEL 6: DIVISIÓN (level_index = 5)
    -- Tags en Flutter: division_neg, division_basica, cero_dividido
    -- ==========================================
    ('w1', 5, 4, 'division_neg', 'Calcula: (-20) / (-4)', '["-5", "5", "-16", "16"]', 1, 'Menos entre menos da más (+). El resultado es 5 positivo.'),
    ('w1', 5, 4, 'division_neg', 'Calcula: -50 / -5', '["-10", "10", "-45", "45"]', 1, 'Menos entre menos da más (+). 50 / 5 = 10.'),
    ('w1', 5, 3, 'division_basica', 'Calcula: 18 / (-3)', '["6", "-6", "15", "-15"]', 1, 'Positivo entre negativo da negativo (-). 18 / 3 = 6. Resultado: -6.'),
    ('w1', 5, 3, 'division_basica', 'Calcula: (-100) / 10', '["-10", "10", "1000", "-90"]', 0, 'Negativo entre positivo da negativo. 100 / 10 = 10. Queda -10.'),
    ('w1', 5, 3, 'division_basica', 'Calcula: (-24 / 2)', '["12", "-12", "26", "-26"]', 1, 'Negativo entre positivo da negativo. La mitad de 24 es 12. (-12)'),
    ('w1', 5, 4, 'cero_dividido', '¿Qué pasaría si intentas calcular 10 / 0?', '["Da 0", "Da 10", "Da 1", "Es Indefinido (Error)"]', 3, 'Dividir entre cero es una operación matemáticamente indefinida.'),
    ('w1', 5, 4, 'cero_dividido', 'Calcula: 0 / (-8)', '["-8", "8", "0", "Indefinido"]', 2, 'Cero dividido entre CUALQUIER número siempre es 0.'),
    ('w1', 5, 4, 'cero_dividido', 'Calcula: -12 / 0', '["-12", "0", "1", "Indefinido"]', 3, '¡Nunca se puede dividir un número entre cero!'),

    -- ==========================================
    -- NIVEL 7: COMBINADAS (level_index = 6)
    -- Tags en Flutter: jerarquia_resta, jerarquia, parentesis, jerarquia_basica, jefe_final
    -- ==========================================
    ('w1', 6, 5, 'jerarquia_resta', 'Calcula el resultado de: 10 - 2 x 3', '["24", "4", "16", "15"]', 1, 'La multiplicación (2 x 3 = 6) se hace PRIMERO. Luego restas 10 - 6 = 4.'),
    ('w1', 6, 5, 'jerarquia_resta', 'Calcula: 20 / 2 + 5', '["15", "2.8", "10", "25"]', 0, 'La división tiene prioridad. Primero 20 / 2 = 10. Luego sumas 5 (15).'),
    ('w1', 6, 5, 'jerarquia', 'Calcula: 20 / 2 x 5', '["2", "10", "50", "100"]', 2, 'Tienen misma jerarquía, de izquierda a derecha: 20/2=10. Luego 10x5=50.'),
    ('w1', 6, 5, 'jerarquia', 'Calcula: 5 + 5 x 2', '["20", "15", "25", "10"]', 1, 'Primero la multiplicación: 5 x 2 = 10. Luego la suma: 5 + 10 = 15.'),
    ('w1', 6, 6, 'parentesis', 'Calcula: (10 - 2) x 3', '["24", "4", "16", "15"]', 0, 'El paréntesis se hace primero: (10 - 2) = 8. Luego 8 x 3 = 24.'),
    ('w1', 6, 6, 'parentesis', 'Calcula: (5 + 5) x 2', '["20", "15", "25", "10"]', 0, 'El paréntesis manda: (5 + 5) = 10. Luego multiplicas: 10 x 2 = 20.'),
    ('w1', 6, 7, 'jerarquia_basica', 'Calcula: 5 + (-2) x 3', '["9", "-1", "11", "1"]', 1, 'Multiplicación primero: (-2) x 3 = -6. Queda: 5 - 6 = -1.'),
    ('w1', 6, 10, 'jefe_final', 'Combinación total: -5 + (10 - 2) x 2', '["6", "11", "26", "-11"]', 1, 'Paso 1: (10 - 2) = 8. Paso 2: 8 x 2 = 16. Paso 3: -5 + 16 = 11.');