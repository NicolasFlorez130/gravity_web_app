-- Seed: gravity_package
-- Wind tunnel flight packages for Gravity (Bogotá, Colombia).
-- Prices in COP. minute_price is the cost per extra minute added at checkout.

INSERT INTO gravity_package (name, price, active, minute_price, availability, removed, users_quantity, for_children, description, created_at) VALUES

-- Solo adult, entry-level session
(
   'Vuelo Individual',
   150000,
   true,
   65000,
   'EVERY_DAY',
   false,
   1,
   false,
   'Experimenta la sensación de volar en solitario en nuestro túnel de viento. Incluye 2 minutos de vuelo libre con instructor certificado, equipo completo y sesión de entrenamiento previa. Perfecto para quienes quieren vivir la adrenalina por primera vez.',
   NOW()
),

-- Duo package, great for couples or friends
(
   'Vuelo en Pareja',
   280000,
   true,
   60000,
   'EVERY_DAY',
   false,
   2,
   false,
   '¡Comparte la emoción de volar con alguien especial! Este paquete incluye 2 minutos de vuelo para cada participante, instructor dedicado y fotos del vuelo. Ideal para parejas, amigos o compañeros de trabajo que buscan una experiencia única en Bogotá.',
   NOW()
),

-- Family package including kids
(
   'Vuelo Familiar',
   520000,
   true,
   55000,
   'WEEKEND',
   false,
   4,
   true,
   'El plan perfecto para toda la familia. Incluye 4 participantes con 2 minutos de vuelo cada uno, equipos adaptados para niños y adultos, instructor especializado en vuelo familiar y registro fotográfico del evento. Disponible fines de semana para disfrutar en familia.',
   NOW()
),

-- Premium solo experience with longer flight time
(
   'Vuelo Premium',
   340000,
   true,
   70000,
   'EVERY_DAY',
   false,
   1,
   false,
   'La experiencia de vuelo más completa para un solo participante. Incluye 5 minutos de vuelo, sesión de entrenamiento avanzado con instructor experto, video HD de tu vuelo y acceso a maniobras intermedias como el hovering y los giros controlados. Para quienes quieren llevar su vuelo al siguiente nivel.',
   NOW()
),

-- Kids-focused package (adult supervision included in count)
(
   'Vuelo Infantil',
   210000,
   true,
   58000,
   'WORK_DAYS',
   false,
   2,
   true,
   'Diseñado especialmente para los más pequeños de la casa. Incluye 1 niño y 1 adulto acompañante, 2 minutos de vuelo para el niño con instructor de apoyo constante, equipo de seguridad certificado para niños y una introducción lúdica al mundo del vuelo. Disponible de lunes a viernes.',
   NOW()
),

-- Group experience
(
   'Vuelo Grupal',
   720000,
   true,
   50000,
   'EVERY_DAY',
   false,
   6,
   false,
   'La aventura perfecta para grupos de amigos, equipos corporativos o celebraciones especiales. Incluye 6 participantes con 2 minutos de vuelo cada uno, coordinador de grupo exclusivo, descuento en minutos adicionales y zona de descanso reservada. ¡La experiencia más social del túnel de viento!',
   NOW()
),

-- Inactive / archived package (kept for history)
(
   'Vuelo Relámpago',
   90000,
   false,
   75000,
   'WORK_DAYS',
   false,
   1,
   false,
   'Paquete express de 1 minuto de vuelo para quienes tienen poco tiempo pero no quieren perderse la experiencia Gravity. Incluye equipo básico e instructor de apoyo.',
   NOW()
);
