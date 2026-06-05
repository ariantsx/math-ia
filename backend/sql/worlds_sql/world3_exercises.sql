-- Limpiamos SOLAMENTE el Mundo 3 por si hay datos basura previos
DELETE FROM exercises WHERE world_id = 'w3';

INSERT INTO exercises (world_id, level_index, base_difficulty, concept_tag, question_text, options, correct_answer_index, feedback) 
VALUES
    -- ================== NIVEL 0: Razones ==================
    ('w3', 0, 3, 'concepto_razon', 'En una receta, por cada 2 tazas de agua usas 1 taza de arroz. ¿Cuál es la razón de agua a arroz?', '["1:2", "2:1", "2:3", "3:1"]', 1, 'Primero mencionamos el agua (2) y luego el arroz (1). La razón es 2:1.'),
    ('w3', 0, 5, 'concepto_razon', 'En un estacionamiento hay 12 autos rojos y 4 azules. ¿Cuál es la razón de autos azules a rojos?', '["4:12", "12:4", "3:1", "1:4"]', 0, 'La pregunta pide primero los azules (4) y luego los rojos (12). Es 4:12.'),
    ('w3', 0, 4, 'razones_equivalentes', 'Simplifica la razón 10:20 a su forma más pequeña.', '["5:10", "2:4", "1:2", "1:1"]', 2, 'Si divides ambos lados entre 10, obtienes 1:2.'),
    ('w3', 0, 8, 'razones_equivalentes', '¡Reto! La razón de perros a gatos es 3:5. Si hay 15 gatos, ¿cuántos perros hay?', '["9", "10", "12", "5"]', 0, 'El 5 de los gatos se multiplicó por 3 para llegar a 15. Hacemos lo mismo con los perros: 3 x 3 = 9.'),

    -- ================== NIVEL 1: Prop. Directa ==================
    ('w3', 1, 4, 'proporcion_directa', 'Si 2 kilos de manzanas cuestan $4, ¿cuánto costarán 6 kilos?', '["$6", "$8", "$10", "$12"]', 3, 'Es directa: más kilos, más pagas. 1 kilo cuesta $2. Así que 6 kilos cuestan 6 x $2 = $12.'),
    ('w3', 1, 6, 'proporcion_directa', 'Un coche recorre 150 km en 2 horas a velocidad constante. ¿Cuántos km recorrerá en 4 horas?', '["200 km", "300 km", "250 km", "400 km"]', 1, 'Si el tiempo se duplica (de 2 a 4 hrs), la distancia también se duplica. 150 x 2 = 300.'),
    ('w3', 1, 9, 'proporcion_directa', '¡Reto! Una fábrica produce 50 juguetes en 30 minutos. ¿Cuántos producirá en 2 horas?', '["100", "150", "200", "250"]', 2, '2 horas son 120 minutos. 120 min es 4 veces 30 minutos. Multiplicamos juguetes por 4: 50 x 4 = 200.'),

    -- ================== NIVEL 2: Prop. Inversa ==================
    ('w3', 2, 4, 'proporcion_inversa', 'Un grupo de 4 pintores termina una casa en 6 días. Si solo trabajan 2 pintores, ¿cuánto tardarán?', '["3 días", "12 días", "8 días", "2 días"]', 1, 'Es inversa: Menos pintores, MÁS tiempo. Si la cantidad de pintores baja a la mitad, los días se duplican. 6 x 2 = 12.'),
    ('w3', 2, 6, 'proporcion_inversa', 'Viajando a 100 km/h llegas en 2 horas. Si viajas a 50 km/h, ¿en cuánto tiempo llegarás?', '["1 hora", "3 horas", "4 horas", "5 horas"]', 2, 'Es inversa: A menor velocidad, mayor tiempo. Como la velocidad bajó a la mitad, el tiempo se duplica a 4 horas.'),
    ('w3', 2, 9, 'proporcion_inversa', '¡Reto! 3 bombas de agua llenan una piscina en 4 horas. Si se encienden 6 bombas en total, ¿cuánto tardan?', '["2 horas", "8 horas", "1 hora", "3 horas"]', 0, 'Al duplicar la fuerza (de 3 a 6 bombas), el tiempo que necesitan se reduce a la mitad. 4 / 2 = 2 horas.'),

    -- ================== NIVEL 3: Regla de Tres Simple ==================
    ('w3', 3, 5, 'regla_tres_directa', 'Aplica Regla de Tres Directa: 5 dulces cuestan $15. ¿Cuánto cuestan 8 dulces?', '["$20", "$24", "$30", "$18"]', 1, 'Cruzado: 8 x 15 = 120. Divides: 120 / 5 = 24.'),
    ('w3', 3, 7, 'regla_tres_directa', 'Si 15 litros de agua pesan 15 kg. ¿Cuánto pesarán 45 litros?', '["30 kg", "45 kg", "60 kg", "15 kg"]', 1, 'Es relación 1 a 1. 45 x 15 / 15 = 45.'),
    ('w3', 3, 6, 'regla_tres_inversa', 'Aplica Regla de Tres Inversa: 10 obreros tardan 4 días. ¿Cuánto tardarán 5 obreros?', '["2 días", "8 días", "10 días", "6 días"]', 1, 'Multiplicamos recto: 10 x 4 = 40. Dividimos por el solo: 40 / 5 = 8 días.'),
    ('w3', 3, 8, 'regla_tres_inversa', '5 grifos vacían un tanque en 6 horas. ¿Cuántos grifos se necesitan para vaciarlo en 2 horas?', '["10 grifos", "15 grifos", "20 grifos", "12 grifos"]', 1, 'Recto: 5 x 6 = 30. Dividimos entre 2 hrs: 30 / 2 = 15 grifos.'),

    -- ================== NIVEL 4: Regla de Tres Compuesta ==================
    ('w3', 4, 7, 'regla_tres_compuesta', 'Si 3 personas construyen 5 muros en 2 días, ¿cuántos días tardarán 6 personas en hacer 10 muros?', '["2 días", "4 días", "1 día", "3 días"]', 0, 'Tienen el doble de trabajo (10 muros), pero también el doble de personas (6). Se compensa perfectamente, tardan los mismos 2 días.'),
    ('w3', 4, 8, 'regla_tres_compuesta', '4 impresoras imprimen 100 libros en 2 horas. ¿Cuántas horas tardarán 2 impresoras en imprimir 50 libros?', '["1 hora", "4 horas", "2 horas", "3 horas"]', 2, 'Tienen la mitad de trabajo (50 libros), pero también la mitad de máquinas. Tardan exactamente lo mismo: 2 horas.'),
    ('w3', 4, 10, 'regla_tres_compuesta', '¡Jefe del Oasis! 5 máquinas producen 5,000 botellas en 10 horas. ¿Cuántas máquinas se necesitan para hacer 10,000 botellas en 5 horas?', '["10", "15", "20", "25"]', 2, 'Para hacer el doble de botellas en la mitad de tiempo, necesitas 4 veces la fuerza. 5 x 4 = 20 máquinas.'),

    -- ================== NIVEL 5: Escalas ==================
    ('w3', 5, 4, 'escalas_mapas', 'En un mapa con escala 1:100, mides una casa de 3 cm. ¿Cuánto mide en la realidad?', '["3 metros (300 cm)", "30 cm", "1 metro", "100 cm"]', 0, '1 cm es 100 cm reales. 3 cm x 100 = 300 cm, que equivale a 3 metros.'),
    ('w3', 5, 5, 'escalas_mapas', 'Una escala de 1:1,000 indica que 1 cm del mapa representa:', '["1 metro", "10 metros", "100 metros", "1000 metros"]', 1, '1 cm representa 1000 cm. Como cada metro tiene 100 cm, 1000 cm equivalen a 10 metros.'),
    ('w3', 5, 9, 'escalas_mapas', '¡El Explorador! Si la distancia real entre dos ciudades es 50 km, y en el mapa están a 5 cm. ¿Cuál es la escala?', '["1:1,000,000", "1:10,000", "1:100,000", "1:500,000"]', 0, '50 km son 5,000,000 cm. 5,000,000 / 5 = 1,000,000. Escala 1:1,000,000.');