-- Seed: gravity_opinion
-- Client testimonials. profile_picture is resolved via subquery from the
-- PROFILE_PICTURES images inserted in 01_images.sql (ordered by created_at).
-- Run 01_images.sql first.

WITH profile_pics AS (
   SELECT id, ROW_NUMBER() OVER (ORDER BY created_at) AS rn
   FROM gravity_image
   WHERE category = 'PROFILE_PICTURES'
)
INSERT INTO gravity_opinion (profile_picture, name, text, created_at)
SELECT p.id, v.name, v.text, NOW()
FROM (VALUES
   (1, 'Camila Rodriguez',  '¡Una experiencia que no olvidaré jamás! Nunca pensé que sentiría la sensación de volar sin subirme a un avión. El instructor fue increíblemente paciente y profesional. Volví a casa con una sonrisa enorme.'),
   (2, 'Andres Morales',    'Llevé a mis hijos de 8 y 11 años y fue el mejor plan familiar que hemos tenido en Bogotá. Los instructores les explicaron todo con mucha paciencia y los niños quedaron felices pidiendo volver el próximo fin de semana.'),
   (3, 'Valentina Ospina',  'Compré el Vuelo Premium y cada peso valió la pena. Los 5 minutos dentro del túnel se sienten como si el tiempo se detuviera. Ya estoy planeando mi próxima visita para probar las maniobras avanzadas.'),
   (4, 'Felipe Gutierrez',  'Lo contratamos para un evento corporativo y fue un éxito total. Todo el equipo de Gravity fue muy organizado, puntuales y el ambiente es de primera. Definitivamente lo recomendaré para futuros team buildings.'),
   (5, 'Isabella Vargas',   'Vine por el cumpleaños de mi mejor amiga y terminamos reservando para todas. El túnel de viento es espectacular, las instalaciones muy limpias y el equipo de seguridad da mucha confianza. ¡Gravity es un must en Bogotá!')
) AS v(rn, name, text)
JOIN profile_pics p ON p.rn = v.rn;
