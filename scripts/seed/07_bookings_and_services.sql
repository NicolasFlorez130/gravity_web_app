-- Seed: gravity_booking, gravity_service, gravity_appointment_confirmation
-- Requires: 02_packages.sql and 04_hours.sql to have been run first.
--
-- Creates ~20 bookings spread across March 1 – May 31 2026 (today Apr 16 is the midpoint).
-- Each booking has 1–3 services. Most past bookings are confirmed and attended.

DO $$
DECLARE
   -- Package IDs (resolved by name)
   _pkg_individual  UUID;
   _pkg_pareja      UUID;
   _pkg_familiar    UUID;
   _pkg_premium     UUID;
   _pkg_infantil    UUID;
   _pkg_grupal      UUID;

   -- Hour IDs (resolved by code)
   _h0900 UUID; _h0930 UUID; _h1000 UUID; _h1030 UUID;
   _h1100 UUID; _h1130 UUID; _h1200 UUID; _h1230 UUID;
   _h1300 UUID; _h1400 UUID; _h1430 UUID; _h1500 UUID;
   _h1530 UUID; _h1600 UUID; _h1630 UUID; _h1700 UUID;
   _h1800 UUID; _h1900 UUID;

   -- Reusable booking ID
   _bid UUID;
BEGIN
   -- Resolve packages
   SELECT id INTO _pkg_individual FROM gravity_package WHERE name = 'Vuelo Individual';
   SELECT id INTO _pkg_pareja    FROM gravity_package WHERE name = 'Vuelo en Pareja';
   SELECT id INTO _pkg_familiar  FROM gravity_package WHERE name = 'Vuelo Familiar';
   SELECT id INTO _pkg_premium   FROM gravity_package WHERE name = 'Vuelo Premium';
   SELECT id INTO _pkg_infantil  FROM gravity_package WHERE name = 'Vuelo Infantil';
   SELECT id INTO _pkg_grupal    FROM gravity_package WHERE name = 'Vuelo Grupal';

   -- Resolve hours
   SELECT id INTO _h0900 FROM gravity_hours WHERE code = '0900';
   SELECT id INTO _h0930 FROM gravity_hours WHERE code = '0930';
   SELECT id INTO _h1000 FROM gravity_hours WHERE code = '1000';
   SELECT id INTO _h1030 FROM gravity_hours WHERE code = '1030';
   SELECT id INTO _h1100 FROM gravity_hours WHERE code = '1100';
   SELECT id INTO _h1130 FROM gravity_hours WHERE code = '1130';
   SELECT id INTO _h1200 FROM gravity_hours WHERE code = '1200';
   SELECT id INTO _h1230 FROM gravity_hours WHERE code = '1230';
   SELECT id INTO _h1300 FROM gravity_hours WHERE code = '1300';
   SELECT id INTO _h1400 FROM gravity_hours WHERE code = '1400';
   SELECT id INTO _h1430 FROM gravity_hours WHERE code = '1430';
   SELECT id INTO _h1500 FROM gravity_hours WHERE code = '1500';
   SELECT id INTO _h1530 FROM gravity_hours WHERE code = '1530';
   SELECT id INTO _h1600 FROM gravity_hours WHERE code = '1600';
   SELECT id INTO _h1630 FROM gravity_hours WHERE code = '1630';
   SELECT id INTO _h1700 FROM gravity_hours WHERE code = '1700';
   SELECT id INTO _h1800 FROM gravity_hours WHERE code = '1800';
   SELECT id INTO _h1900 FROM gravity_hours WHERE code = '1900';

   -----------------------------------------------------------------------
   -- MARCH 2026 (past bookings — confirmed & attended)
   -----------------------------------------------------------------------

   -- Booking 1: Individual flight
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Santiago Herrera', 'santiago.herrera@gmail.com', '3104567890', 150000, 'ONLINE', NULL, '2026-03-02')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_individual, 0, '2026-03-05 09:00:00-05', true, _h0900, '2026-03-02');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260302-001', '2026-03-02');

   -- Booking 2: Pareja flight
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Laura Castillo, Diego Ramirez', 'laura.castillo@hotmail.com', '3156789012', 280000, 'ONLINE', NULL, '2026-03-06')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_pareja, 0, '2026-03-08 10:00:00-05', true, _h1000, '2026-03-06');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260306-002', '2026-03-06');

   -- Booking 3: Premium + extra minutes
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Mariana Lopez', 'mariana.lopez@outlook.com', '3209876543', 480000, 'ONLINE', NULL, '2026-03-10')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_premium, 2, '2026-03-14 14:00:00-05', true, _h1400, '2026-03-10');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260310-003', '2026-03-10');

   -- Booking 4: Familiar weekend
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Familia Cardenas', 'j.cardenas@gmail.com', '3178901234', 520000, 'ON_SITE', NULL, '2026-03-14')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_familiar, 0, '2026-03-15 11:00:00-05', true, _h1100, '2026-03-14');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, NULL, '2026-03-15');

   -- Booking 5: Grupal event
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Andres Mejia, Equipo TechCorp', 'andres.mejia@techcorp.co', '3012345678', 720000, 'ONLINE', NULL, '2026-03-18')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_grupal, 0, '2026-03-22 16:00:00-05', true, _h1600, '2026-03-18');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260318-005', '2026-03-18');

   -- Booking 6: Infantil
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Camila Torres y Sofia (hija)', 'camila.torres@yahoo.com', '3145678901', 210000, 'ONLINE', NULL, '2026-03-20')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_infantil, 0, '2026-03-24 10:30:00-05', true, _h1030, '2026-03-20');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260320-006', '2026-03-20');

   -----------------------------------------------------------------------
   -- EARLY APRIL 2026 (recent past — confirmed, some attended)
   -----------------------------------------------------------------------

   -- Booking 7: Individual, on-site payment
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Felipe Duarte', 'felipe.duarte@gmail.com', '3187654321', 150000, 'ON_SITE', NULL, '2026-04-06')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_individual, 0, '2026-04-07 09:30:00-05', true, _h0930, '2026-04-06');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, NULL, '2026-04-07');

   -- Booking 8: Pareja + extra minutes
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Natalia Rios, Carlos Peña', 'natalia.rios@gmail.com', '3001234567', 400000, 'ONLINE', NULL, '2026-04-07')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_pareja, 2, '2026-04-09 12:00:00-05', true, _h1200, '2026-04-07');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260407-008', '2026-04-07');

   -- Booking 9: Premium
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Ricardo Vargas', 'r.vargas@outlook.com', '3123456789', 340000, 'ONLINE', NULL, '2026-04-09')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_premium, 0, '2026-04-11 15:30:00-05', true, _h1530, '2026-04-09');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260409-009', '2026-04-09');

   -- Booking 10: Grupal, courtesy
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Influencer Team GravityExp', 'media@gravityexp.co', '3501234567', 0, 'COURTESY', NULL, '2026-04-10')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_grupal, 0, '2026-04-12 17:00:00-05', true, _h1700, '2026-04-10');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, NULL, '2026-04-12');

   -- Booking 11: Familiar, attended
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Familia Ospina Gonzalez', 'ospina.familia@gmail.com', '3167890123', 575000, 'ONLINE', NULL, '2026-04-12')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_familiar, 1, '2026-04-13 11:30:00-05', true, _h1130, '2026-04-12');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260412-011', '2026-04-12');

   -- Booking 12: Individual, not yet attended (yesterday)
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Julian Pineda', 'julian.pineda@live.com', '3198765432', 150000, 'LANDING', NULL, '2026-04-13')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_individual, 0, '2026-04-15 14:30:00-05', false, _h1430, '2026-04-13');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260413-012', '2026-04-13');

   -----------------------------------------------------------------------
   -- MID-APRIL 2026 (around today — mix of confirmed and pending)
   -----------------------------------------------------------------------

   -- Booking 13: Today, confirmed
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Daniela Muñoz', 'daniela.munoz@gmail.com', '3134567890', 340000, 'ONLINE', NULL, '2026-04-14')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_premium, 0, '2026-04-16 10:00:00-05', false, _h1000, '2026-04-14');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260414-013', '2026-04-14');

   -- Booking 14: Today, on-site
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Oscar Restrepo', 'oscar.restrepo@hotmail.com', '3057890123', 150000, 'ON_SITE', NULL, '2026-04-16')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_individual, 0, '2026-04-16 16:30:00-05', false, _h1630, '2026-04-16');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, NULL, '2026-04-16');

   -- Booking 15: Pending payment (no confirmation)
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Valentina Suarez', 'val.suarez@gmail.com', '3201234567', 280000, 'LANDING', NULL, '2026-04-15')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_pareja, 0, '2026-04-18 13:00:00-05', false, _h1300, '2026-04-15');
   -- No confirmation: payment pending

   -----------------------------------------------------------------------
   -- LATE APRIL 2026 (near future — confirmed)
   -----------------------------------------------------------------------

   -- Booking 16: Familiar
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Familia Rojas Martinez', 'rojas.martinez@gmail.com', '3112345678', 520000, 'ONLINE', NULL, '2026-04-16')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_familiar, 0, '2026-04-19 11:00:00-05', false, _h1100, '2026-04-16');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260416-016', '2026-04-16');

   -- Booking 17: Two services in one booking (pareja, two different days)
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Ana Maria Velez, Juan Pablo Gil', 'anamaria.velez@gmail.com', '3176543210', 560000, 'ONLINE', NULL, '2026-04-16')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_pareja, 0, '2026-04-22 12:30:00-05', false, _h1230, '2026-04-16');
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_pareja, 0, '2026-04-25 18:00:00-05', false, _h1800, '2026-04-16');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260416-017', '2026-04-16');

   -- Booking 18: Infantil, pending
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Patricia Moreno y Mateo (hijo)', 'patricia.moreno@yahoo.com', '3148901234', 210000, 'LANDING', NULL, '2026-04-16')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_infantil, 0, '2026-04-28 10:00:00-05', false, _h1000, '2026-04-16');
   -- No confirmation: payment pending

   -----------------------------------------------------------------------
   -- MAY 2026 (future bookings)
   -----------------------------------------------------------------------

   -- Booking 19: Premium + extra
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Sebastian Acosta', 'sebastian.acosta@gmail.com', '3089012345', 480000, 'ONLINE', NULL, '2026-04-16')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_premium, 2, '2026-05-03 15:00:00-05', false, _h1500, '2026-04-16');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260416-019', '2026-04-16');

   -- Booking 20: Grupal corporate event
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Equipo Marketing BancoPais', 'eventos@bancopais.co', '3015678901', 720000, 'ONLINE', NULL, '2026-04-15')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_grupal, 0, '2026-05-09 19:00:00-05', false, _h1900, '2026-04-15');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260415-020', '2026-04-15');

   -- Booking 21: Familiar, weekend
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Familia Bernal Perez', 'bernal.perez@gmail.com', '3189012345', 520000, 'ONLINE', NULL, '2026-04-16')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_familiar, 0, '2026-05-16 09:00:00-05', false, _h0900, '2026-04-16');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260416-021', '2026-04-16');

   -- Booking 22: Pareja, pending payment
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Catalina Ruiz, Esteban Florez', 'catalina.ruiz@live.com', '3126789012', 280000, 'LANDING', NULL, '2026-04-16')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_pareja, 0, '2026-05-23 14:00:00-05', false, _h1400, '2026-04-16');
   -- No confirmation: payment pending

   -- Booking 23: Individual, far future
   INSERT INTO gravity_booking (client_names, client_email, client_phone_number, total_amount, payment_method, "createdBy", created_at)
   VALUES ('Alejandro Niño', 'alejandro.nino@gmail.com', '3045678901', 215000, 'ONLINE', NULL, '2026-04-16')
   RETURNING id INTO _bid;
   INSERT INTO gravity_service (booking_id, package_id, extra_minutes, date, attended, hour_id, created_at)
   VALUES (_bid, _pkg_individual, 1, '2026-05-28 17:00:00-05', false, _h1700, '2026-04-16');
   INSERT INTO gravity_appointment_confirmation (booking_id, payment_reference, created_at)
   VALUES (_bid, 'BOLD-20260416-023', '2026-04-16');

END $$;
