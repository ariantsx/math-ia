-- Limpiamos SOLAMENTE el Mundo 2 para no afectar tu progreso en el Mundo 1
DELETE FROM exercises WHERE world_id = 'w2';

INSERT INTO exercises (world_id, level_index, base_difficulty, concept_tag, question_text, options, correct_answer_index, feedback) 
VALUES
    -- ================== NIVEL 0: Equivalencia ==================
    ('w2', 0, 3, 'fracciones_equivalentes', '¿Cuál de estas fracciones representa la MISMA cantidad que 1/2?', '["2/3", "4/8", "3/5", "1/4"]', 1, '4 es la mitad de 8. Si multiplicas 1/2 por 4 arriba y abajo, obtienes 4/8.'),
    ('w2', 0, 5, 'fracciones_equivalentes', 'Cortas una pizza en 6 pedazos y te comes 2 (2/6). ¿Qué fracción equivalente es?', '["1/3", "1/2", "1/4", "3/6"]', 0, 'Si agrupas los pedazos y simplificas dividiendo entre 2, obtienes 1/3.'),
    ('w2', 0, 4, 'amplificacion', 'Si amplificas 2/5 multiplicando por 3 (arriba y abajo), ¿qué obtienes?', '["6/15", "5/8", "2/15", "6/5"]', 0, '2x3=6 y 5x3=15. Resultado: 6/15.'),
    ('w2', 0, 8, 'amplificacion', '¡Reto Épico! ¿Por qué número se amplificó 3/7 para convertirse en 21/49?', '["Por 3", "Por 9", "Por 7", "Por 6"]', 2, '3x7=21 y 7x7=49. La fracción se multiplicó por 7.'),

    -- ================== NIVEL 1: Simplificación ==================
    ('w2', 1, 3, 'simplificacion_basica', 'Simplifica 5/10 dividiendo ambos números entre 5:', '["1/5", "2/5", "1/2", "5/2"]', 2, '5/5=1 y 10/5=2. Queda 1/2.'),
    ('w2', 1, 6, 'simplificacion_basica', 'Reduce a su mínima expresión: 12/16', '["6/8", "3/4", "1/4", "4/3"]', 1, 'Ambos se pueden dividir entre 4. 12/4=3 y 16/4=4. Resultado: 3/4.'),
    ('w2', 1, 5, 'fraccion_irreducible', '¿Cuál de estas fracciones ya es IRREDUCIBLE? (No se puede achicar más)', '["4/6", "10/12", "5/7", "8/10"]', 2, 'El 5 y el 7 no tienen ningún divisor en común.'),
    ('w2', 1, 9, 'fraccion_irreducible', '¡Reto! Encuentra la fracción irreducible de 45/60', '["9/12", "15/20", "3/4", "4/5"]', 2, 'Dividiendo entre 15 arriba y abajo directo (o entre 5 y luego entre 3) se obtiene 3/4.'),

    -- ================== NIVEL 2: Suma/Resta Heterogénea ==================
    ('w2', 2, 5, 'comun_denominador', 'Para sumar 1/4 + 1/3, debes hallar un común denominador. ¿Qué número va abajo?', '["7", "12", "4", "3"]', 1, 'El mínimo común múltiplo (mcm) entre 4 y 3 es 12.'),
    ('w2', 2, 7, 'comun_denominador', 'Queremos sumar 1/5 + 1/2. Si convertimos 1/2 a "décimos" multiplicando por 5, ¿cómo queda?', '["1/10", "5/10", "4/10", "2/10"]', 1, '1x5=5 y 2x5=10. Queda 5/10.'),
    ('w2', 2, 6, 'suma_fracciones_heterogeneas', '¡A sumar! Calcula: 1/2 + 1/4', '["2/6", "3/4", "1/6", "2/4"]', 1, '1/2 es equivalente a 2/4. Sumas: 2/4 + 1/4 = 3/4.'),
    ('w2', 2, 10, 'suma_fracciones_heterogeneas', '¡El Dragón Fraccionario! Calcula: 3/4 - 1/3', '["5/12", "2/1", "2/12", "1/12"]', 0, 'Común denominador 12. Amplificamos: 3/4 = 9/12. 1/3 = 4/12. Restamos: 9/12 - 4/12 = 5/12.'),

    -- ================== NIVEL 3: Mult/Div ==================
    ('w2', 3, 4, 'multiplicacion_fracciones', 'Multiplica de forma directa: 2/3 x 4/5', '["6/8", "8/15", "10/12", "15/8"]', 1, 'Multiplicamos arriba: 2x4=8. Abajo: 3x5=15. Resultado: 8/15.'),
    ('w2', 3, 6, 'multiplicacion_fracciones', 'Resuelve: 1/2 x 1/2', '["1/4", "2/4", "1", "1/2"]', 0, '1x1=1 y 2x2=4. El resultado es 1/4.'),
    ('w2', 3, 5, 'division_fracciones', 'Divide usando el método cruzado (rebote): 1/3 ÷ 1/2', '["1/6", "2/3", "3/2", "6/1"]', 1, 'Arriba: 1x2=2. Abajo: 3x1=3. Resultado: 2/3.'),
    ('w2', 3, 9, 'division_fracciones', '¡Reto! Divide: 3/4 ÷ 5/2', '["15/8", "6/20", "8/15", "3/8"]', 1, 'Arriba: 3x2=6. Abajo: 4x5=20. Resultado 6/20 (se puede simplificar a 3/10).'),

    -- ================== NIVEL 4: Conversión Decimal ==================
    ('w2', 4, 3, 'fraccion_a_decimal', 'Convierte la fracción 1/2 a un número decimal.', '["0.12", "0.2", "0.50", "1.2"]', 2, 'Si divides 1 entre 2 obtienes 0.50.'),
    ('w2', 4, 5, 'fraccion_a_decimal', '¿Qué número decimal representa 3/4?', '["3.4", "0.75", "0.25", "0.34"]', 1, 'Tres dividido entre cuatro da 0.75.'),
    ('w2', 4, 4, 'decimal_a_fraccion', '¿Cómo escribirías el decimal 0.25 en forma de fracción?', '["25/10", "1/25", "25/100", "2.5/100"]', 2, 'Como tiene dos números después del punto, se escribe 25 y abajo un 100.'),
    ('w2', 4, 8, 'decimal_a_fraccion', 'Convierte el decimal 0.2 a fracción y redúcela.', '["1/5", "2/100", "1/2", "2/5"]', 0, '0.2 es 2/10. Si simplificas sacando mitad a ambos, te queda 1/5.'),

    -- ================== NIVEL 5: Operaciones Decimales ==================
    ('w2', 5, 4, 'suma_decimales', 'Calcula alineando los puntos: 1.5 + 2.3', '["3.8", "3.08", "4.8", "2.8"]', 0, '1.5 + 2.3 = 3.8. El punto se queda en la misma línea.'),
    ('w2', 5, 6, 'suma_decimales', 'Suma: 4.2 + 1.25', '["5.27", "5.45", "4.32", "6.25"]', 1, 'Alinea los puntos imaginando un 0 (4.20 + 1.25). Resultado: 5.45.'),
    ('w2', 5, 5, 'multiplicacion_decimales', 'Multiplica: 0.3 x 0.2', '["0.6", "0.06", "6.0", "0.5"]', 1, '3x2=6. Hay 2 decimales en total, así que el punto se mueve 2 veces a la izquierda: 0.06.'),
    ('w2', 5, 8, 'multiplicacion_decimales', '¡Reto! Calcula: 1.5 x 2.0', '["3.5", "0.3", "3.0", "30.0"]', 2, '15x20=300. Movemos el punto 2 lugares: 3.00, que es lo mismo que 3.0.'),

    -- ================== NIVEL 6: Redondeo ==================
    ('w2', 6, 3, 'redondeo_enteros', 'Redondea 47 a la decena más cercana.', '["40", "45", "50", "47.0"]', 2, 'El 7 es mayor a 5, por lo tanto el número sube al siguiente escalón: 50.'),
    ('w2', 6, 4, 'redondeo_enteros', 'Redondea 83 al número más cercano terminado en cero.', '["80", "90", "85", "83"]', 0, 'El 3 es menor que 5, por lo tanto el 8 se queda igual. Resultado: 80.'),
    ('w2', 6, 5, 'redondeo_decimales', 'Redondea 3.14 a un solo decimal.', '["3.2", "3.1", "3.15", "3.0"]', 1, 'El segundo decimal es 4, como no llega al 5, el primer decimal (1) se queda igual. 3.1.'),
    ('w2', 6, 9, 'redondeo_decimales', '¡Reto! Redondea 9.99 a un solo decimal.', '["9.9", "10.0", "9.0", "10.1"]', 1, 'El segundo 9 hace que el primero suba a 10, lo que suma 1 entero. Queda 10.0.'),

    -- ================== NIVEL 7: Porcentajes ==================
    ('w2', 7, 3, 'concepto_porcentaje', '¿Cómo se escribe el 50% en forma decimal para poder multiplicar?', '["0.50", "0.05", "5.0", "50.0"]', 0, 'Dividimos entre 100 moviendo el punto dos lugares: 0.50.'),
    ('w2', 7, 4, 'concepto_porcentaje', '¿A qué decimal equivale el 5%?', '["0.5", "5.0", "0.05", "0.005"]', 2, 'Movemos el punto dos lugares a la izquierda rellenando con ceros. Queda 0.05.'),
    ('w2', 7, 5, 'calcular_porcentaje', '¿Cuánto es el 10% de 50?', '["10", "5", "50", "0.5"]', 1, 'Multiplicas 50 x 0.10. El resultado es 5.'),
    ('w2', 7, 8, 'calcular_porcentaje', 'Calcula el 25% de 200.', '["50", "25", "100", "75"]', 0, 'El 25% es la cuarta parte. 200 / 4 = 50. O multiplicar 200 x 0.25 = 50.'),

    -- ================== NIVEL 8: Aumentos y Descuentos ==================
    ('w2', 8, 5, 'descuento_porcentual', 'Un pantalón de $40 tiene un 10% de descuento. ¿Cuánto cuesta ahora?', '["$30", "$36", "$38", "$44"]', 1, 'El 10% de 40 es 4. Al restar el descuento: 40 - 4 = $36.'),
    ('w2', 8, 7, 'descuento_porcentual', 'Comprarás algo de $200. Te dan 50% de descuento. ¿Cuánto pagarás?', '["$100", "$150", "$50", "$0"]', 0, '50% es la mitad. Te descuentan $100, así que pagas los otros $100.'),
    ('w2', 8, 6, 'aumento_porcentual', 'Una cena cuesta $50. Debes dejar 10% extra de propina. ¿Cuál es el total?', '["$60", "$55", "$45", "$51"]', 1, 'El 10% de 50 es 5. Sumado al original: 50 + 5 = $55.'),
    ('w2', 8, 10, 'aumento_porcentual', '¡Jefe de Tienda! Un celular cuesta $100. Se le aplica un impuesto del 20%, y luego el dueño te regala un descuento de $10 sobre el total. ¿Cuánto pagas?', '["$120", "$110", "$90", "$130"]', 1, 'Aumento: 20% de 100 = 20. Sube a $120. Descuento fijo: 120 - 10 = $110.');