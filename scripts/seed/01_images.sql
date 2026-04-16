-- Seed: gravity_image
-- Run this script first. Opinions depend on PROFILE_PICTURES rows.

INSERT INTO gravity_image (url, category, created_at) VALUES

-- PROFILE_PICTURES (used by opinions)
('https://placekittens.com/200/200', 'PROFILE_PICTURES', NOW()),
('https://placekittens.com/201/201', 'PROFILE_PICTURES', NOW()),
('https://placekittens.com/202/202', 'PROFILE_PICTURES', NOW()),
('https://placekittens.com/203/203', 'PROFILE_PICTURES', NOW()),
('https://placekittens.com/204/204', 'PROFILE_PICTURES', NOW()),

-- GALLERY (displayed in the scrolling gallery carousel)
('https://placekittens.com/700/540', 'GALLERY', NOW()),
('https://placekittens.com/701/540', 'GALLERY', NOW()),
('https://placekittens.com/702/540', 'GALLERY', NOW()),
('https://placekittens.com/703/540', 'GALLERY', NOW()),
('https://placekittens.com/704/540', 'GALLERY', NOW()),
('https://placekittens.com/705/540', 'GALLERY', NOW()),
('https://placekittens.com/706/540', 'GALLERY', NOW()),
('https://placekittens.com/707/540', 'GALLERY', NOW()),

-- INSTAGRAM_POSTS (displayed in the IG carousel)
('https://placekittens.com/400/400', 'INSTAGRAM_POSTS', NOW()),
('https://placekittens.com/401/401', 'INSTAGRAM_POSTS', NOW()),
('https://placekittens.com/402/402', 'INSTAGRAM_POSTS', NOW()),
('https://placekittens.com/403/403', 'INSTAGRAM_POSTS', NOW()),
('https://placekittens.com/404/404', 'INSTAGRAM_POSTS', NOW()),
('https://placekittens.com/405/405', 'INSTAGRAM_POSTS', NOW());
