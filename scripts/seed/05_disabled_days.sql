-- Seed: gravity_disabled_day
-- Blocked dates within the demo range (March–May 2026).

INSERT INTO gravity_disabled_day (date, created_at) VALUES
-- Semana Santa 2026 (March 29 – April 5)
('2026-03-29', NOW()),
('2026-03-30', NOW()),
('2026-03-31', NOW()),
('2026-04-01', NOW()),
('2026-04-02', NOW()),
('2026-04-03', NOW()),
('2026-04-04', NOW()),
('2026-04-05', NOW()),

-- Maintenance day
('2026-05-11', NOW()),

-- Colombian holiday: Dia del Trabajo
('2026-05-01', NOW());
