-- Limpiamos SOLAMENTE el Mundo 5
DELETE FROM exercises WHERE world_id = 'w5';

INSERT INTO exercises (world_id, level_index, base_difficulty, concept_tag, question_text, options, correct_answer_index, feedback) 
VALUES
    -- ================== NIVEL 0: Potencias Básicas ==================
    ('w5', 0, 3, 'concepto_potencia', 'En la expresión 4³, ¿qué te indica el número 3 (el exponente)?', '["Sumar 3 veces", "Multiplicar el 4 por sí mismo 3 veces", "Multiplicar 4 x 3", "Dividir entre 3"]', 1, 'El exponente (número pequeño arriba) siempre indica la cantidad de veces que multiplicas la base por sí misma.'),
    ('w5', 0, 5, 'calcular_potencia', 'Calcula: 2⁴ (Dos a la cuarta potencia)', '["8", "16", "6", "12"]', 1, '2 x 2 = 4. Luego 4 x 2 = 8. Luego 8 x 2 = 16. ¡El resultado es 16!'),
    ('w5', 0, 6, 'calcular_potencia', 'Calcula: 5² (Cinco al cuadrado)', '["10", "20", "25", "50"]', 2, 'Cinco al cuadrado significa 5 x 5. El resultado es 25.'),
    ('w5', 0, 9, 'calcular_potencia', '¡El Ascenso Lento! Calcula: 1¹⁰⁰', '["100", "1", "0", "1000"]', 1, 'El número 1 multiplicado por sí mismo cualquier cantidad de veces siempre sigue siendo 1.'),

    -- ================== NIVEL 1: Exponentes ==================
    ('w5', 1, 4, 'exponente_cero_uno', 'Aplica la regla del cero. Calcula: 1,458º', '["0", "1458", "1", "Indefinido"]', 2, 'Cualquier número (excepto el 0) elevado a la potencia cero, siempre da como resultado 1.'),
    ('w5', 1, 4, 'exponente_cero_uno', 'Calcula: 25¹', '["25", "1", "0", "5"]', 0, 'Cualquier número elevado a la 1 es exactamente el mismo número.'),
    ('w5', 1, 5, 'potencia_base_diez', 'Escribe como número normal: 10⁴', '["40", "104", "1,000", "10,000"]', 3, 'La base 10 elevada a la 4ta potencia significa poner un 1 seguido de cuatro ceros: 10,000.'),
    ('w5', 1, 8, 'potencia_base_diez', 'Si tienes 1,000,000 (un millón), ¿cómo lo escribirías usando base 10?', '["10⁵", "10⁶", "10⁷", "10⁸"]', 1, 'Un millón tiene 6 ceros, por lo tanto se escribe como 10⁶.'),

    -- ================== NIVEL 2: Propiedades ==================
    ('w5', 2, 5, 'multiplicacion_potencias', 'Bases iguales multiplicándose. Reduce: 3² x 3⁴', '["9⁶", "3⁸", "3⁶", "9⁸"]', 2, 'Como las bases son iguales (3), la base se mantiene y los exponentes se SUMAN: 2 + 4 = 6. Queda 3⁶.'),
    ('w5', 2, 6, 'multiplicacion_potencias', 'Bases iguales dividiéndose. Reduce: 5⁶ / 5²', '["5³", "5⁴", "1³", "5⁸"]', 1, 'Al dividir bases iguales (5), los exponentes se RESTAN: 6 - 2 = 4. Queda 5⁴.'),
    ('w5', 2, 7, 'potencia_de_potencia', 'Aplica la regla de potencia de potencia. Reduce: (2³)²', '["2⁵", "2⁶", "2⁹", "4⁵"]', 1, 'Para una potencia sobre otra potencia, MULTIPLICAS los exponentes: 3 x 2 = 6. Queda 2⁶.'),
    ('w5', 2, 10, 'potencia_de_potencia', '¡El Dragón del Rayo! Reduce esto usando dos reglas: (2³ x 2⁴)²', '["2¹⁴", "2²⁴", "2⁹", "4¹⁴"]', 0, 'Paso 1 (adentro): 2³ x 2⁴ se suman y da 2⁷. Paso 2 (afuera): (2⁷)² se multiplican los exponentes 7x2 = 14. Queda 2¹⁴.'),

    -- ================== NIVEL 3: Raíz Cuadrada ==================
    ('w5', 3, 3, 'concepto_raiz_cuadrada', 'Encontrar la raíz cuadrada (√) de un número significa...', '["Dividirlo entre 2", "Encontrar qué número multiplicado por sí mismo da ese valor", "Sacarle la mitad", "Multiplicarlo por 2"]', 1, 'La raíz cuadrada es el proceso inverso al cuadrado; buscas el multiplicador original.'),
    ('w5', 3, 4, 'calcular_raiz_cuadrada', 'Encuentra la raíz cuadrada: √36', '["18", "6", "9", "12"]', 1, 'Piensa en qué número por sí mismo da 36. 6 x 6 = 36. La respuesta es 6.'),
    ('w5', 3, 6, 'calcular_raiz_cuadrada', 'Calcula: √100', '["50", "10", "25", "20"]', 1, '10 x 10 es igual a 100. La raíz cuadrada es 10.'),
    ('w5', 3, 9, 'calcular_raiz_cuadrada', '¡Reto Espejo! Si sé que 12 x 12 = 144, ¿cuál es la √144 ?', '["12", "72", "144", "24"]', 0, 'La raíz deshace la multiplicación. Si 12 al cuadrado es 144, la raíz de 144 te regresa al 12.'),

    -- ================== NIVEL 4: Raíz Cúbica ==================
    ('w5', 4, 4, 'concepto_raiz_cubica', 'Para encontrar una raíz cúbica (∛), debes buscar un número que...', '["Se multiplique por 3", "Se multiplique por sí mismo 3 veces", "Se divida entre 3", "Se sume 3 veces"]', 1, 'El índice de la raíz (3) indica cuántas veces debe repetirse la multiplicación.'),
    ('w5', 4, 6, 'calcular_raiz_cubica', 'Encuentra la raíz cúbica: ∛27', '["9", "3", "4", "6"]', 1, 'Pruébalo: 3 x 3 = 9. Y luego 9 x 3 = 27. ¡El número es el 3!'),
    ('w5', 4, 7, 'calcular_raiz_cubica', 'Calcula: ∛64', '["8", "4", "32", "16"]', 1, 'Pruébalo con el 4: 4 x 4 = 16. Y 16 x 4 = 64. La respuesta es 4.'),
    ('w5', 4, 10, 'calcular_raiz_cubica', '¡El Golem de Hielo! Calcula: ∛1,000', '["100", "50", "10", "333"]', 2, 'Busca qué número multiplicado tres veces da mil. 10 x 10 x 10 = 1,000. Respuesta: 10.'),

    -- ================== NIVEL 5: Propiedades de Raíces ==================
    ('w5', 5, 5, 'raiz_de_producto', 'Usando las propiedades, calcula: √(9 x 16)', '["12", "25", "7", "36"]', 0, 'Sepáralo: √9 x √16. Esto es 3 x 4. El resultado es 12.'),
    ('w5', 5, 7, 'raiz_de_producto', 'Simplifica y resuelve: √(25 x 4)', '["29", "100", "10", "50"]', 2, 'Sepáralo en dos raíces: √25 x √4. Esto se convierte en 5 x 2. El resultado es 10.'),
    ('w5', 5, 6, 'raiz_de_fraccion', 'Resuelve la raíz de esta fracción: √(4/9)', '["2/3", "4/3", "2/9", "8/18"]', 0, 'Aplica la raíz arriba y abajo por separado. La √4 es 2, y la √9 es 3. Queda 2/3.'),
    ('w5', 5, 9, 'raiz_de_fraccion', '¡Maestro Cristalino! Calcula: √(100/25)', '["10/5", "2", "4", "Ambas A y B"]', 3, 'Si separas da 10/5. Pero 10/5 se puede dividir exactamente, lo que da 2. (Ambas son correctas equivalencias).');