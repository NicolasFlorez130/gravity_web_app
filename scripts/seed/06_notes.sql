-- Seed: gravity_note
-- Internal backoffice notes.

INSERT INTO gravity_note (active_until, title, description, discarded, created_at) VALUES

(
   '2026-04-20',
   'Revision de equipos',
   'Revisar los cascos y trajes de vuelo antes del fin de semana. Reportar cualquier desgaste al coordinador de mantenimiento.',
   false,
   '2026-04-14'
),
(
   '2026-04-30',
   'Promocion dia de la madre',
   'Preparar campaña de redes sociales para el Vuelo Familiar con 15% de descuento. Coordinar con diseño para las piezas graficas antes del 25 de abril.',
   false,
   '2026-04-10'
),
(
   '2026-05-15',
   'Capacitacion instructores nuevos',
   'Dos instructores nuevos inician periodo de entrenamiento. Asignarles turnos supervisados durante las primeras dos semanas de mayo.',
   false,
   '2026-04-16'
),
(
   '2026-03-20',
   'Actualizar precios del sitio web',
   'Confirmar con administracion los nuevos precios del Vuelo Premium y Vuelo Grupal. Actualizar paquetes en el backoffice una vez aprobados.',
   true,
   '2026-03-05'
),
(
   '2026-04-05',
   'Cerrar Semana Santa',
   'Confirmar cierre del tunel durante Semana Santa (29 mar – 5 abr). Notificar a clientes con reservas existentes y ofrecer reprogramacion.',
   true,
   '2026-03-15'
),
(
   '2026-05-30',
   'Inventario de merch',
   'Hacer conteo de camisetas, gorras y llaveros de Gravity disponibles en recepcion. Solicitar reposicion si el stock baja de 20 unidades por item.',
   false,
   '2026-04-16'
);
