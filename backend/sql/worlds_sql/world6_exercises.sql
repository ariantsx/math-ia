-- Limpiamos SOLAMENTE el Mundo 6
DELETE FROM exercises WHERE world_id = 'w6';

INSERT INTO exercises (world_id, level_index, base_difficulty, concept_tag, question_text, options, correct_answer_index, feedback) 
VALUES
    -- ================== NIVEL 0: Problemas Verbales ==================
    ('w6', 0, 3, 'traduccion_verbal', 'En un problema, si lees "la diferencia entre dos números", ¿qué operación debes usar?', '["Suma", "Resta", "Multiplicación", "División"]', 1, 'La palabra "diferencia" siempre se refiere al resultado de una resta.'),
    ('w6', 0, 4, 'traduccion_verbal', '¿Qué operación indica la palabra "repartir equitativamente"?', '["División", "Resta", "Suma", "Multiplicación"]', 0, 'Repartir cosas en partes iguales es la definición exacta de la división.'),
    ('w6', 0, 5, 'problemas_verbales', 'Juan tiene 15 canicas. Le regala 3 a María y luego encuentra 5 en el suelo. ¿Cuántas tiene ahora?', '["12", "17", "15", "20"]', 1, 'Primero restas (15 - 3 = 12). Luego sumas las que encontró (12 + 5 = 17).'),
    ('w6', 0, 8, 'problemas_verbales', 'Un tren lleva 120 pasajeros. En la estación bajan 40 y suben 15. ¿Cuántos pasajeros continúan?', '["95", "80", "135", "105"]', 0, '120 menos 40 que bajan quedan 80. Luego sumas 15 que suben = 95 pasajeros.'),

    -- ================== NIVEL 1: Modelamiento ==================
    ('w6', 1, 4, 'modelamiento_basico', 'Un cine cobra $10 por boleto. Si pagaste $50, ¿qué modelo matemático te ayuda a saber cuántos compraste?', '["10 + B = 50", "10 x B = 50", "50 - B = 10", "50 x 10 = B"]', 1, 'El precio ($10) multiplicado por el número de Boletos (B) da tu total ($50).'),
    ('w6', 1, 5, 'modelamiento_basico', 'Tienes 3 cajas con la misma cantidad de juguetes y en total hay 24. El modelo es "3 x J = 24". ¿Cuánto vale J?', '["8", "7", "6", "12"]', 0, 'Para despejar J, pasas el 3 dividiendo: 24 / 3 = 8. Hay 8 juguetes por caja.'),
    ('w6', 1, 7, 'modelamiento_avanzado', 'Compraste un libro de $15 y algunas revistas de $5. Pagaste $35 en total. ¿Cuántas revistas compraste?', '["3", "4", "5", "2"]', 1, 'Restamos el libro al total: 35 - 15 = 20. Esos 20 se gastaron en revistas de 5. 20 / 5 = 4 revistas.'),
    ('w6', 1, 9, 'modelamiento_avanzado', '¡Reto Urbano! Un taxi cobra $3 al subir, y $2 por cada kilómetro. Si pagaste $13, ¿cuántos km viajaste?', '["3 km", "4 km", "5 km", "6 km"]', 2, 'Total 13 menos la base 3 = 10. Esos 10 son por los km (que cuestan 2). 10 / 2 = 5 km.'),

    -- ================== NIVEL 2: Estimación ==================
    ('w6', 2, 3, 'estimacion_cantidades', 'Estimas comprar dos juegos de $19 y $32. ¿Aproximadamente cuánto dinero necesitas llevar?', '["$40", "$50", "$60", "$70"]', 1, '19 es casi 20. 32 es casi 30. 20 + 30 = 50. ¡Necesitas $50!'),
    ('w6', 2, 4, 'estimacion_cantidades', 'Si asisten 48 personas a un evento y cada mesa sienta a 10. ¿Cuántas mesas necesitas AL MENOS?', '["4", "5", "6", "4.8"]', 1, 'Con 4 mesas sientas a 40. Te faltan sillas. Debes redondear hacia arriba y pedir 5 mesas.'),
    ('w6', 2, 6, 'estimacion_operaciones', 'Sin calcular exacto, estima: 98 x 11', '["1,000", "9,000", "10,000", "100"]', 0, '98 es casi 100. 11 es casi 10. 100 x 10 es aproximadamente 1,000.'),
    ('w6', 2, 8, 'estimacion_operaciones', 'Al ojo: Si ganas $1,950 al mes y gastas $980 en renta. ¿Cuánto te sobra aprox?', '["$500", "$1,500", "$1,000", "$800"]', 2, '1,950 es casi 2,000. 980 es casi 1,000. 2,000 - 1,000 = te sobran $1,000 aprox.'),

    -- ================== NIVEL 3: Finanzas ==================
    ('w6', 3, 4, 'ahorro_presupuesto', 'Ganas $500, pagas $200 de alquiler y $100 de comida. ¿Cuánto es tu ahorro?', '["$300", "$200", "$100", "$0"]', 1, 'Tus egresos son 200 + 100 = 300. Ingresos (500) menos egresos (300) = $200 ahorrados.'),
    ('w6', 3, 5, 'ahorro_presupuesto', 'Si tienes un gasto fijo de $50 mensuales, ¿cuánto gastarás en un año entero?', '["$500", "$600", "$120", "$300"]', 1, 'El año tiene 12 meses. Multiplicas 50 x 12 = $600.'),
    ('w6', 3, 7, 'interes_simple', 'Prestas $100 a un amigo con 10% de interés. ¿Cuánto dinero extra te debe dar al pagar?', '["$1", "$5", "$10", "$20"]', 2, 'El 10% de 100 es 10. Te debe devolver tus 100 más los 10 de interés.'),
    ('w6', 3, 10, 'interes_simple', '¡Reto Financiero! El banco te da 5% anual. Si guardas $1,000 por 2 años, ¿cuánto INTERÉS ganas en total?', '["$50", "$100", "$150", "$500"]', 1, '5% de 1000 es $50 por año. Como son 2 años, ganas 50 x 2 = $100.'),

    -- ================== NIVEL 4: Medidas ==================
    ('w6', 4, 3, 'conversion_longitud', 'Si caminas 2 Kilómetros, ¿cuántos metros has caminado?', '["200", "20", "2,000", "20,000"]', 2, 'Un kilómetro son 1,000 metros. Así que 2 km son 2,000 metros.'),
    ('w6', 4, 5, 'conversion_longitud', 'La mesa mide 1.5 metros. ¿Cuántos centímetros son?', '["15 cm", "150 cm", "1,500 cm", "15000 cm"]', 1, 'Un metro tiene 100 cm. Multiplicas 1.5 x 100 = 150 centímetros.'),
    ('w6', 4, 6, 'conversion_peso_volumen', 'Compras 3 litros de refresco. ¿Cuántos mililitros (ml) tienes?', '["3,000 ml", "300 ml", "30 ml", "3 ml"]', 0, 'Un litro son 1,000 ml. Así que 3 x 1000 = 3,000 mililitros.'),
    ('w6', 4, 8, 'conversion_peso_volumen', 'Una receta pide 500 gramos de carne. Si compras 1.5 Kilogramos, ¿cuántas veces puedes hacer la receta?', '["2 veces", "3 veces", "4 veces", "5 veces"]', 1, '1.5 Kg son 1,500 gramos. Si divides 1,500 entre 500 gramos por receta, te alcanza para 3 veces.'),

    -- ================== NIVEL 5: Recetas ==================
    ('w6', 5, 4, 'proporcion_recetas', 'Para 2 personas necesitas 1 taza de leche. Si cocinarás para 6 personas, ¿cuántas tazas usas?', '["2 tazas", "3 tazas", "4 tazas", "6 tazas"]', 1, '6 personas es el triple de 2. Así que multiplicas la receta por 3. Necesitas 3 tazas.'),
    ('w6', 5, 5, 'proporcion_recetas', 'Un pastel de 4 porciones usa 2 huevos. Quieres hacer un pastel de 8 porciones. ¿Cuántos huevos usas?', '["4", "6", "8", "2"]', 0, '8 porciones es el doble. Multiplicas todo por 2. Necesitas 4 huevos.'),
    ('w6', 5, 7, 'ajuste_recetas', 'Una receta usa 1/2 taza de azúcar. Si haces el doble de la receta, ¿cuánta azúcar usas?', '["1 taza", "1/4 de taza", "2 tazas", "1.5 tazas"]', 0, 'El doble de 1/2 es 2/2, lo cual es exactamente 1 taza entera.'),
    ('w6', 5, 10, 'ajuste_recetas', '¡El Chef Matemático! Una receta para 6 personas lleva 1.5 kilos de pollo. Si solo cenarán 2 personas, ¿cuánto pollo compras?', '["0.5 kilos", "1 kilo", "0.75 kilos", "0.25 kilos"]', 0, '2 personas es la tercera parte de 6. Debes dividir 1.5 kg entre 3. El resultado es 0.5 kg (medio kilo).');