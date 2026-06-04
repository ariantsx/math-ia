-- Limpiamos SOLAMENTE el Mundo 4 por si hay datos basura previos
DELETE FROM exercises WHERE world_id = 'w4';

INSERT INTO exercises (world_id, level_index, base_difficulty, concept_tag, question_text, options, correct_answer_index, feedback) 
VALUES
    -- ================== NIVEL 0: Factores ==================
    ('w4', 0, 3, 'concepto_factor', '¿Qué es un factor de un número?', '["El resultado de sumarlo", "Un número que se multiplica por otro para obtenerlo", "El doble de ese número", "El número dividido entre dos"]', 1, 'Los factores son las partes (multiplicadores) que componen a un número.'),
    ('w4', 0, 4, 'identificar_factores', '¿Cuáles son todos los factores del número 10?', '["1 y 10", "2 y 5", "1, 2, 5 y 10", "2, 5 y 10"]', 2, 'El 10 se puede obtener multiplicando 1x10 o 2x5. Así que todos sus factores son 1, 2, 5 y 10.'),
    ('w4', 0, 6, 'identificar_factores', '¿Cuál de estos números NO es un factor de 24?', '["3", "4", "5", "6"]', 2, 'No hay ningún número natural que multiplicado por 5 dé como resultado 24.'),
    ('w4', 0, 8, 'identificar_factores', '¡Reto! ¿Cuántos factores en total tiene el número 16?', '["3", "4", "5", "6"]', 2, 'Los factores son 1, 2, 4, 8, 16. En total son 5.'),

    -- ================== NIVEL 1: Múltiplos ==================
    ('w4', 1, 3, 'concepto_multiplo', '¿Cuál de estos es un múltiplo de 5?', '["1", "55", "12", "501"]', 1, 'Los múltiplos de 5 terminan en 0 o en 5. El 55 cumple esta regla (5 x 11).'),
    ('w4', 1, 5, 'identificar_multiplos', '¿Cuál es el tercer múltiplo natural de 7?', '["7", "14", "21", "28"]', 2, 'Los múltiplos de 7 son 7(x1), 14(x2), 21(x3). El tercero es 21.'),
    ('w4', 1, 8, 'identificar_multiplos', '¡Reto! ¿Cuál de estos números es múltiplo de 6 Y TAMBIÉN múltiplo de 8?', '["12", "16", "24", "42"]', 2, 'El 24 se puede obtener de 6x4 y de 8x3. Es múltiplo de ambos.'),

    -- ================== NIVEL 2: Divisibilidad ==================
    ('w4', 2, 3, 'divisibilidad_2_3_5', 'Sin hacer la división, ¿cómo sabes que 4,520 se puede dividir exactamente entre 5?', '["Porque es grande", "Porque termina en cero", "Porque suma 11", "No se puede"]', 1, 'Todo número que termine en 0 o en 5 es divisible exactamente entre 5.'),
    ('w4', 2, 5, 'divisibilidad_2_3_5', '¿Es el número 111 divisible entre 3?', '["Sí, porque 1+1+1=3", "No, porque termina en 1", "Sí, porque es impar", "No se sabe"]', 0, 'La regla del 3 dice que sumemos sus dígitos. 1+1+1=3, y el 3 está en la tabla del 3. ¡Sí se puede!'),
    ('w4', 2, 7, 'divisibilidad_avanzada', '¡Aplica dos reglas a la vez! ¿Qué número es divisible entre 2 y entre 3 al mismo tiempo?', '["15", "18", "20", "23"]', 1, 'Para el 2, debe ser par (18 y 20). Para el 3, sus dígitos deben sumar múltiplo de 3 (1+8=9). Solo el 18 cumple ambas.'),

    -- ================== NIVEL 3: Números Primos ==================
    ('w4', 3, 3, 'identificar_primos', 'Un número primo es aquel que...', '["Solo se puede dividir entre 1 y él mismo", "Es impar", "Termina en 1", "Tiene más de dos divisores"]', 0, 'Los números primos son la unidad base, no tienen más que dos divisores: el 1 y ellos mismos.'),
    ('w4', 3, 4, 'identificar_primos', '¿Cuál de estos números ES un número primo?', '["9", "15", "17", "21"]', 2, 'El 17 solo se puede conseguir multiplicando 1 x 17. Los demás se pueden romper (9=3x3, 15=3x5, 21=3x7).'),
    ('w4', 3, 6, 'primos_vs_compuestos', '¿El número 2 es primo o compuesto?', '["Compuesto", "Primo", "Ninguno", "Ambos"]', 1, 'El 2 es primo porque solo se divide entre 1 y 2. ¡Es el único número primo que es par!'),
    ('w4', 3, 8, 'primos_vs_compuestos', '¡Cuidado! ¿El número 1 es primo?', '["Sí", "No", "A veces", "Es compuesto"]', 1, 'El 1 NO es primo porque no tiene dos divisores distintos (solo tiene al 1). Tampoco es compuesto. Es un caso especial.'),

    -- ================== NIVEL 4: Descomposición ==================
    ('w4', 4, 4, 'descomposicion_prima', '¿Cuál es la descomposición en factores primos del número 10?', '["2 x 5", "1 x 10", "5 + 5", "2 x 3 x 5"]', 0, 'Debes multiplicar números primos. El 2 y el 5 son primos y 2 x 5 = 10.'),
    ('w4', 4, 6, 'descomposicion_prima', 'Encuentra la descomposición correcta para el número 20:', '["4 x 5", "2 x 10", "2 x 2 x 5", "2 x 3 x 3"]', 2, 'Recuerda que TODOS los números deben ser primos. "4 x 5" da 20, pero el 4 no es primo. La correcta es 2 x 2 x 5.'),
    ('w4', 4, 9, 'descomposicion_prima', '¡Reto Minero! Descompón el número 36 en puros factores primos.', '["6 x 6", "2 x 2 x 9", "2 x 2 x 3 x 3", "4 x 9"]', 2, '36 / 2 = 18. Luego 18 / 2 = 9. Luego 9 / 3 = 3. Y 3 / 3 = 1. Los factores son 2 x 2 x 3 x 3.'),

    -- ================== NIVEL 5: MCD ==================
    ('w4', 5, 4, 'concepto_mcd', '¿Qué significa MCD?', '["Mínimo Común Divisor", "Máximo Común Divisor", "Múltiplo Común Directo", "Mitad Con Decimales"]', 1, 'Significa Máximo Común Divisor (el número más grande que divide exactamente a varios).'),
    ('w4', 5, 6, 'calcular_mcd', 'Encuentra el MCD de 8 y 12.', '["2", "4", "8", "24"]', 1, 'Los divisores de 8 son 1,2,4,8. Los de 12 son 1,2,3,4,6,12. El mayor que se repite es el 4.'),
    ('w4', 5, 10, 'calcular_mcd', '¡Reto de Paquetes! Tienes 20 dulces rojos y 30 azules. Quieres hacer las bolsas más grandes posibles mezclándolos sin que sobre ninguno. ¿De cuántos dulces serán?', '["5", "10", "2", "60"]', 1, 'Buscamos el MCD de 20 y 30. El número más grande que divide a ambos de forma exacta es el 10.'),

    -- ================== NIVEL 6: mcm ==================
    ('w4', 6, 4, 'concepto_mcm', '¿Qué busca el mcm (Mínimo Común Múltiplo)?', '["El mayor divisor", "El número más pequeño que es múltiplo de todos", "La suma de los múltiplos", "El promedio"]', 1, 'Busca el "punto de encuentro" más bajo al contar hacia adelante saltando de múltiplo en múltiplo.'),
    ('w4', 6, 6, 'calcular_mcm', 'Encuentra el mcm de 3 y 4.', '["1", "7", "12", "24"]', 2, 'Múltiplos de 3: 3, 6, 9, 12... Múltiplos de 4: 4, 8, 12... El primer punto de encuentro es el 12.'),
    ('w4', 6, 9, 'calcular_mcm', '¡Reto de Alarma! Una alarma suena cada 4 minutos y otra cada 6 minutos. Si suenan juntas ahora, ¿en cuántos minutos volverán a sonar juntas?', '["10 minutos", "12 minutos", "24 minutos", "2 minutos"]', 1, 'Buscamos el mcm de 4 y 6. Múltiplos de 4: 4, 8, 12. Múltiplos de 6: 6, 12. ¡Se encuentran en el 12!');