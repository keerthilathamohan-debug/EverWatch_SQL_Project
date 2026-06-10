CREATE DATABASE everwatch;
USE everwatch;
SHOW TABLES;
-- 1 
CREATE TABLE users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(150) NOT NULL,
email VARCHAR(200) UNIQUE NOT NULL,
password_hash VARCHAR(250),
phone_number VARCHAR(20) NOT NULL,
country VARCHAR(30),
created_at DATE,
account_status ENUM('ACTIVE', 'EXPIRED', 'CANCELLED'));

DROP TABLE users;
DROP TABLE watch_history;
DROP TABLE reviews;
DROP TABLE user_subscription;

SELECT * FROM users;
INSERT INTO users(full_name, email, password_hash, phone_number, country, created_at, account_status)
VALUES ('Shanu S', 'shanu123@gmail.com', 'pass_001', '+91 8541254776', 'INDIA', '2026-01-01', 'EXPIRED'),
('Keisha S', 'keishu20@gmail.com', 'pass_002', '+91 9854231678', 'INDIA', '2026-03-05', 'ACTIVE'),
('Keerthi Latha', 'keets03@gmail.com', 'pass_003', '+91 9876543210', 'INDIA', '2026-01-10', 'EXPIRED'),
('Jiyan S', 'jiyan27@gmail.com', 'pass_004', '+91 8765321496', 'INDIA', '2026-04-01', 'ACTIVE'),
('Hema Latha', 'hema11@gmail.com', 'pass_005', '+91 8978455612', 'INDIA', '2026-02-10', 'CANCELLED'),
('Lenin Prabhu', 'lenin05@gmail.com', 'pass_006', '+91 8874526193', 'INDIA', '2026-03-01', 'ACTIVE'),
('Daisy Rani', 'daisy61@gmail.com', 'pass_007', '+91 9784561235', 'INDIA', '2026-03-05', 'ACTIVE'),
('Mohan S', 'mohan59@gmail.com', 'pass_008', '+91 8684957125', 'INDIA', '2026-03-12', 'ACTIVE'),
('Deepa Selvam', 'deepa29@gmail.com', 'pass_009', '+91 9965412357', 'INDIA', '2026-04-01', 'ACTIVE'),
('Sherley Mary', 'sherley85@gmail.com', 'pass_010', '+91 8694512439', 'INDIA', '2026-04-08', 'CANCELLED'),
('Aarthi Prem', 'aarthi12@gmail.com', 'pass_011', '+91 8784512659', 'INDIA', '2026-04-15', 'ACTIVE'),
('Aanand Vijay', 'vijayaanand@gmail.com', 'pass_012', '+91 8879461328', 'INDIA', '2026-04-20', 'ACTIVE'),
('Savitha Vetri', 'savi11@gmail.com', 'pass_013', '+91 9695949781', 'INDIA', '2026-05-01', 'ACTIVE'),
('Hamlin Kiran', 'hami94@gmail.com', 'pass_014', '+91 7895641520', 'INDIA', '2026-05-03', 'ACTIVE'),
('Hulldah Jayaseeli', 'hulldah60@gmail.com', 'pass_015', '+91 9988004522', 'INDIA', '2026-05-05', 'ACTIVE');
UPDATE users
SET country = 'USA'
WHERE user_id = 2;
UPDATE users
SET country = 'UK'
WHERE user_id = 4;
SELECT * FROM users;
-- 2
CREATE TABLE content(
content_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(300) NOT NULL,
director VARCHAR(150) NOT NULL,
content_type ENUM('Movie', 'TV_Show') NOT NULL,
description TEXT,
release_year INT,
duration INT,
language VARCHAR(100));
DROP table content;
INSERT INTO content(title, director, content_type, description, release_year, duration, language)
VALUES ('Avengers End Game', 'Anthony Russo', 'Movie', 'Super Heeroes unite to defeat Thanos', 2019, 181, 'English'),
('Master', 'Lokesh Kanagaraj', 'Movie', 'Professor confronts gangster', 2021, 179, 'Tamil'),
('9 Hours', 'Niranjan Kaushik', 'TV_show', 'Crime thriller happening during a bank robbery', 2022, 40, 'Telugu'),
('Baahubali The Beginning', 'S S Rajamouli','Movie', 'Epic tale of kingdoms and betrayal', 2015, 159, 'Telugu'),
('Premam', 'Alphonse Puthren', 'Movie', 'Romantic journey across three stages of life', 2015, 157, 'Malayalam'),
('Vikram', 'Lokesh Kanagaraj', 'Movie', 'Black-ops squad investigates drug mafia network', 2022, 175, 'Tamil'),
('Vilangu', 'Prashanth Pandiraj', 'TV_Show', 'Police investigate serial crime cases', 2022, 42, 'Tamil'),
('Drishyam', 'Jeethu Joseph', 'Movie', 'A man protects his family using smart planning', 2013, 160, 'Malayalam'),
('Stranger Things', 'The Duffer Brothers', 'TV_Show', 'Kids face supernatural forces in Hawkins', 2016, 50, 'English'),
('Dangal', 'Nitesh Tiwari', 'MOVIE', 'Wrestler trains daughters to become champions', 2016, 161, 'Hindi'),
('3 Idiots', 'Rajkumar Hirani', 'MOVIE', 'Three engineering students navigate life and friendship', 2009, 170, 'Hindi'),
('The Platform', 'Galder Gaztelu-Urrutia', 'MOVIE', 'Prisoners struggle for survival in a vertical prison system', 2019, 94, 'Spanish'),
('Money Heist', 'Alex Pina', 'TV_SHOW', 'Criminal masterminds execute the biggest bank robbery in Spain', 2017, 50, 'Spanish'),
('Mirage', 'Orial Paulo', 'MOVIE', 'A mysterious time connection changes a woman’s life', 2018, 128, 'Spanish'),
('Society of the Snow', 'J A Bayona', 'MOVIE', 'Survivors of a plane crash fight to stay alive in the Andes', 2023, 144, 'Spanish'),
('Inception', 'Christopher Noolan', 'MOVIE', 'A thief who steals information by entering dreams', 2010, 148, 'English');

INSERT INTO content(title, director, content_type, description, release_year, duration, language)
VALUES ('Avatar 3', 'James Cameron', 'Movie', 'Upcoming science fiction movie', 2026, 190, 'English'),
('Spider-Man Beyond', 'Jon Watts', 'Movie', 'Upcoming Marvel superhero movie', 2026, 175, 'English'),
('Kalki Part 2', 'Nag Ashwin', 'Movie', 'Upcoming Indian sci-fi action movie', 2026, 185, 'Telugu'),
('Frozen 3', 'Jennifer Lee', 'Movie', 'Upcoming animated fantasy movie', 2026, 120, 'English');
UPDATE content
SET release_year = 2027
WHERE content_id = 17;
UPDATE content
SET release_year = 2027
WHERE content_id = 18;
UPDATE content
SET release_year = 2027
WHERE content_id = 19;
UPDATE content
SET release_year = 2027
WHERE content_id = 20;

SELECT * FROM content;
-- 3
CREATE TABLE category(
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL);

INSERT INTO category(category_name)
VALUES ('Action'),
('Drama'),
('Comedy'),
('Romance'),
('Thriller'),
('Crime'),
('Horror'),
('Sci-Fi'),
('Adventure'),
('Biography');

SELECT * FROM category;
-- 4
CREATE TABLE content_category(
content_id INT,
category_id INT,
PRIMARY KEY(content_id, category_id),
FOREIGN KEY (content_id) REFERENCES content(content_id),
FOREIGN KEY (category_id) REFERENCES category(category_id)
);
DROP TABLE content_category;
INSERT INTO Content_Category (content_id, category_id)
VALUES
(1, 1), -- Avengers Endgame  Action
(2, 1), -- Master  Action
(2, 2), -- Master  Drama
(3, 5), -- 9 Hours  Thriller
(3, 6), -- 9 Hours Crime
(4, 1), -- Baahubali  Action
(4, 9), -- Baahubali  Adventure
(5, 4), -- Premam  Romance
(6, 1), -- Vikram  Action
(6, 6), -- Vikram  Crime
(7, 6), -- Vilangu  Crime
(8, 5), -- Drishyam  Thriller
(9, 8), -- Stranger Things Sci-Fi
(10, 2), -- Dangal Drama
(11, 3), -- 3 Idiots  Comedy
(12, 5), -- Platform Thriller
(12, 8), -- platform Sci-Fi
(13, 6), -- Money Heist Crime
(13, 5), -- Money Heist Thriller
(14, 8), -- Mirage Sci-Fi
(14, 2), -- Mirage Drama
(15, 9), -- Society of the snow Adventure
(15, 10), -- Society of the snow Biography
(16, 1), -- Inception Action
(16, 5), -- Inception Thriller
(16, 6); -- Inception Crime
SELECT * FROM content_category;
INSERT INTO Content_Category (content_id, category_id)
VALUES
(17, 8), -- Avatar Sci Fi 
(17, 9), -- Avatar Adventure
(18, 1), -- Spiderman Action
(19, 8), -- Kalki Sci Fi
(19, 1), -- Kalki Action
(20, 2), -- Frozen Drama
(20, 9); -- Frozen Adventure

SELECT c.title, cat.category_name
FROM Content c
JOIN Content_Category cc ON c.content_id = cc.content_id
JOIN Category cat ON cc.category_id = cat.category_id;
-- 5
CREATE TABLE watch_history (
watch_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
content_id INT,
watched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
progress_percentage DECIMAl(5,2) DEFAULT 0,
completed BOOLEAN DEFAULT FALSE,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (content_id) REFERENCES content(content_id));

SELECT * FROM watch_history;

INSERT INTO watch_history(user_id, content_id, watched_at, progress_percentage, completed)
VALUES (1, 1, '2026-01-09 10:15:00', 100.00, TRUE),
(2, 2, '2026-03-05 11:20:00', 45.50, FALSE),
(3, 3, '2026-01-11 12:05:00', 78.25, FALSE),
(4, 1, '2026-04-01 13:10:00', 100.00, TRUE),
(5, 4, '2026-02-11 14:00:00', 25.00, FALSE),
(6, 5, '2026-03-02 15:30:00', 90.75, FALSE),
(7, 2, '2026-03-05 16:45:00', 100.00, TRUE),
(8, 9, '2026-03-13 17:20:00', 60.00, FALSE),
(9, 6, '2026-04-02 18:10:00', 100.00, TRUE),
(10, 7, '2026-04-08 19:00:00', 35.80, FALSE),
(11, 8, '2026-04-15 09:25:00', 100.00, TRUE),
(12, 2, '2026-04-20 10:40:00', 50.50, FALSE),
(13, 3, '2026-05-02 11:55:00', 88.90, FALSE),
(14, 4, '2026-05-03 12:30:00', 100.00, TRUE),
(15, 5, '2026-05-06 13:15:00', 70.00, FALSE),
(3, 12, '2026-02-01 16:00:00', 100.00, TRUE),
(9, 13, '2026-04-02 12:16:45', 100.00, TRUE),
(7, 14, '2026-03-28 10:33:14', 45.00, FALSE),
(1, 15, '2026-01-02 20:30:54', 100.00, TRUE),
(10, 16, '2026-04-30 22:12:00', 73.00, FALSE),
(15, 12, '2026-05-10 13:21:56', 76.00, FALSE),
(8, 13, '2026-04-28 19:21:12', 100.00, TRUE),
(4, 14, '2026-02-25 11:18:26', 80.00, FALSE),
(2, 15, '2026-02-01 10:14:39', 100.00, TRUE),
(6, 16, '2026-05-10 10:54:10', 100.00, TRUE),
(5, 12, '2026-03-03 16:42:13', 100.00, TRUE),
(11, 13, '2026-05-12 21:17:39', 100.00, TRUE),
(12, 14, '2026-04-29 17:50:26', 100.00, TRUE),
(14, 15, '2026-05-01 15:56:49', 100.00, TRUE),
(13, 16, '2026-05-08 11:30:52', 100.00, TRUE);
-- 6
CREATE TABLE reviews(
review_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
content_id INT,
rating INT CHECK (rating BETWEEN 1 AND 5),
review_text TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (content_id) REFERENCES content(content_id));
TRUNCATE TABLE reviews;
INSERT INTO reviews(user_id, content_id, rating, review_text, created_at)
VALUES (1, 1, 5, 'Excellent movie with great visuals and story.', '2026-01-10 13:00:00'),
(2, 2, 4, 'Very entertaining and worth watching.', '2026-01-07 12:30:00'),
(3, 3, 3, 'Interesting but slightly slow.', '2026-02-10 14:10:00'),
(4, 1, 5, 'Loved the full movie experience.', '2026-02-12 16:15:00'),
(5, 4, 4, 'Not very engaging content.', '2026-03-03 15:05:00'),
(6, 5, 4, 'Very good storyline and action scenes.', '2026-05-11 18:35:00'),
(7, 2, 5, 'Amazing series and worth binge watching.', '2026-04-02 19:30:00'),
(8, 9, 3, 'Average content but watchable.', '2026-05-28 19:20:00'),
(9, 6, 5, 'Fantastic performance by actors.', '2026-05-30 21:15:00'),
(10, 7, 2, 'Could not finish due to weak plot.', '2026-05-05 19:45:00'),
(11, 8, 5, 'One of the best movies watched recently.', '2026-05-27 11:30:00'),
(12, 2, 3, 'Good entertainment overall.', '2026-06-14 11:45:00'),
(13, 3, 4, 'Very interesting climax and visuals.', '2026-05-18 14:00:00'),
(14, 4, 5, 'Excellent content and storytelling.', '2026-05-03 02:00:00'),
(15, 5, 4, 'Emotional and engaging scenes.', '2026-05-08 15:00:00'),
(3, 12, 5, 'Very intense and thought-provoking survival concept.', '2026-02-01 17:52:30'),
(9, 13, 5, 'One of the best heist series ever made.', '2026-04-03 20:45:15'),
(7, 14, 3, 'Good concept but slightly confusing.', '2026-03-31 12:25:14'),
(1, 15, 5, 'Very powerful and heartbreaking.', '2026-01-03 18:39:00'),
(10, 16, 4, 'Complex but amazing film.', '2026-05-01 14:00:00'),
(15, 12, 4, 'Dark and disturbing but brilliant execution.', '2026-05-13 16:00:00'),
(8, 13, 5, 'Highly addictive storyline.', '2026-05-15 11:00:15'),
(4, 14, 4, 'Interesting time-travel mystery.', '2026-02-26 15:15:00'),
(2, 15, 5, 'Very powerful and heartbreaking.', '2026-02-03 10:50:00'),
(6, 16, 5, 'Christopher Nolan masterpiece', '2026-05-13 20:37:00'),
(5, 12, 5, 'Unique storytelling and strong message.', '2026-03-03 22:15:20'),
(11, 13, 5, 'Highly addictive storyline.', '2026-05-13 13:30:00'),
(12, 5, 5, 'One of the best Malayalam romantic movies ever made.', '2026-04-30 09:25:00'),
(14, 8, 5, 'Brilliant screenplay with unexpected twists.', '2026-05-10 23:49:00'),
(13, 11, 5, 'Excellent performances and unforgettable comedy.', '2026-05-08 17:50:00');

SELECT * FROM reviews;

-- 7 
CREATE TABLE subscription_plans(
plan_id INT AUTO_INCREMENT PRIMARY KEY,
plan_name VARCHAR(100),
price DECIMAL(10,2),
duration_days INT,
max_devices INT);
SELECT * FROM subscription_plans;
SELECT * FROM users;
INSERT INTO subscription_plans(plan_name, price, duration_days, max_devices)
VALUES ('Basic', 199, 30, 2),
('Standard', 499, 30, 4),
('Premium', 699, 30, 6);

-- 8
CREATE TABLE user_subscription(
subscription_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
plan_id INT,
start_date DATE,
end_date DATE,
account_status ENUM('ACTIVE', 'CANCELLED', 'EXPIRED'),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id));

SELECT * FROM user_subscription;
INSERT INTO user_subscription( user_id, plan_id, start_date, end_date, account_status)
VALUES (1, 1, '2026-01-01', '2026-01-31', 'EXPIRED'),
(2, 2, '2026-03-05', '2026-06-05', 'ACTIVE'),
(3, 3, '2026-01-10', '2026-04-10', 'EXPIRED'),
(4, 1, '2026-04-01', '2026-07-01', 'ACTIVE'),
(5, 2, '2026-02-10', '2026-03-10', 'CANCELLED'),
(6, 3, '2026-03-01', '2026-06-01', 'ACTIVE'),
(7, 1, '2026-03-05', '2026-06-05', 'ACTIVE'),
(8, 2, '2026-03-12', '2026-06-12', 'ACTIVE'),
(9, 3, '2026-04-01', '2026-07-21', 'ACTIVE'),
(10, 1, '2026-04-08', '2026-05-08', 'CANCELLED'),
(11, 2, '2026-04-15', '2026-07-15', 'ACTIVE'),
(12, 3, '2026-04-20', '2026-07-20', 'ACTIVE'),
(13, 1, '2026-05-01', '2026-05-31', 'ACTIVE'),
(14, 2, '2026-05-03', '2026-06-03', 'ACTIVE'),
(15, 3, '2026-05-05', '2026-08-05', 'ACTIVE');


-- 9
CREATE TABLE watchlist (
watchlist_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
content_id INT,
added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (content_id) REFERENCES content(content_id));

INSERT INTO watchlist(user_id, content_id, added_at)
VALUES (7, 18, '2026-05-12 12:20:01'),
(8, 20, '2026-05-14 19:46:14'),
(13, 17, '2026-05-20 10:54:12'),
(2, 19, '2026-05-02 21:15:30'),
(4, 17, '2026-05-02 18:25:36'),
(6, 18, '2026-05-01 23:45:16'),
(9, 20, '2026-04-25 13:14:28'),
(12, 19, '2026-04-30 22:53:19');

INSERT INTO watchlist(user_id, content_id, added_at)
VALUES (2, 18, '2026-05-12 12:20:01'),
(2, 20, '2026-05-14 19:46:14'),
(2, 17, '2026-05-04 10:54:12'),
(2, 19, '2026-05-02 21:15:30'),
(2, 16, '2026-05-02 18:25:36');


SELECT * FROM watchlist;

-- 10
CREATE TABLE content_region(
content_id INT,
country VARCHAR(50),
PRIMARY KEY (content_id, country),
FOREIGN KEY (content_id) REFERENCES content(content_id));

INSERT INTO content_region(content_id, country)
VALUES (1, 'INDIA'),
(1, 'USA'),
(2, 'INDIA'),
(2, 'UK'),
(3, 'INDIA'),
(4, 'INDIA'),
(4, 'UK'),
(5, 'INDIA'),
(6, 'INDIA'), 
(7, 'INDIA'),
(8, 'INDIA'),
(9, 'INDIA'),
(10, 'INDIA'),
(10, 'USA'),
(11, 'INDIA'),
(12, 'SPAIN'),
(13, 'SPAIN'),
(14, 'SPAIN'),
(15, 'SPAIN'),
(15, 'USA'),
(16, 'USA'),
(17, 'USA'),
(18, 'USA'),
(18, 'INDIA'),
(19, 'INDIA'),
(19, 'UK'),
(20, 'USA'),
(20, 'INDIA');

SELECT * FROM content_region;

-- 11
CREATE TABLE payments (
payment_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
plan_id INT NOT NULL,
amount DECIMAL(10,2) NOT NULL,
payment_status VARCHAR(20) NOT NULL,  -- SUCCESS / FAILED / PENDING
payment_method VARCHAR(50),
transaction_id VARCHAR(100),
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
);
INSERT INTO payments (user_id, plan_id, amount, payment_status, payment_method, transaction_id, payment_date)
VALUES (1, 1, 199, 'SUCCESS', 'UPI', 'TXN1230', '2026-01-01 13:21:00'),
(2, 2, 499, 'SUCCESS', 'UPI', 'TXN1231', '2026-03-05 08:30:15'),
(3, 3, 699, 'SUCCESS', 'UPI', 'TXN1232', '2026-01-10 06:45:23'),
(4, 1, 199, 'SUCCESS', 'UPI', 'TXN1233', '2026-04-01 10:28:17'),
(5, 2, 499, 'SUCCESS', 'UPI', 'TXN1234', '2026-02-10 20:45:31'),
(6, 3, 699, 'SUCCESS', 'UPI', 'TXN1235', '2026-03-01 14:20:26'),
(7, 1, 199, 'SUCCESS', 'UPI', 'TXN1236', '2026-03-05 11:29:45'),
(8, 2, 499, 'SUCCESS', 'UPI', 'TXN1237', '2026-03-12 18:49:16'),
(9, 3, 699, 'SUCCESS', 'UPI', 'TXN1238', '2026-04-01 13:17:20'),
(10, 1, 199, 'SUCCESS', 'UPI', 'TXN1239', '2026-04-08 16:32:48'),
(11, 2, 499, 'SUCCESS', 'UPI', 'TXN1240', '2026-04-15 07:59:26'),
(12, 3, 699, 'SUCCESS', 'UPI', 'TXN1241', '2026-04-20 08:18:29'),
(13, 1, 199, 'SUCCESS', 'UPI', 'TXN1242', '2026-05-01 09:38:17'),
(14, 2, 499, 'SUCCESS', 'UPI', 'TXN1243', '2026-05-03 11:58:16'),
(15, 3, 699, 'SUCCESS', 'UPI', 'TXN1244', '2026-05-05 15:20:30');

SELECT * FROM payments;

-- 12
CREATE TABLE user_sessions (
session_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
login_time TIMESTAMP,
logout_time TIMESTAMP
);
ALTER TABLE user_sessions
ADD is_active BOOLEAN DEFAULT TRUE;
SELECT * FROM user_subscription;
SELECT * FROM payments;
SELECT * FROM user_sessions;
INSERT INTO user_sessions (user_id, login_time, logout_time, is_active)
VALUES(1, '2026-01-01 13:21:01', '2026-01-31 11:59:59', FALSE),
(2, '2026-03-05 8:30:16', NULL, TRUE),
(3, '2026-01-10 06:45:25', '2026-04-10 23:59:59', FALSE),
(4, '2026-04-01 10:28:19', NULL, TRUE),
(5, '2026-02-10 20:45:33', '2026-03-10 23:59:59', FALSE),
(6, '2026-03-01 14:20:30', NULL, TRUE),
(7, '2026-03-05 11:29:45', NULL, TRUE),
(8, '2026-03-12 18:49:20', NULL, TRUE),
(9, '2026-04-01 13:17:25', NULL, TRUE),
(10, '2026-04-08 16:32:56', '2026-05-08 23:59:59', FALSE),
(11, '2026-04-15 07:59:30', NULL, TRUE),
(12, '2026-04-20 08:18:24', NULL, TRUE),
(13, '2026-05-01 09:38:27', NULL, TRUE),
(14, '2026-05-03 11:59:24', NULL, TRUE),
(15, '2026-05-05 15:30:48', NULL, TRUE);

-- 13
CREATE TABLE content_creators (
creator_id INT AUTO_INCREMENT PRIMARY KEY,
creator_name VARCHAR(100),
is_verified BOOLEAN DEFAULT FALSE
);

INSERT INTO content_creators (creator_name, is_verified)
VALUES
('Marvel Studios', TRUE),
('Sun Pictures', TRUE),
('Disney+ Hotstar Originals', TRUE),
('Arka Media Works', TRUE),
('Anwar Rasheed Entertainment', TRUE),
('Raaj Kamal Films International', TRUE),
('SonyLIV Originals', TRUE),
('Aashirvad Cinemas', TRUE),
('Netflix Originals', TRUE),
('Aamir Khan Productions', TRUE),
('Vinod Chopra Films', TRUE),
('Basque Films', TRUE),
('Vancouver Media', TRUE),
('Atresmedia Cine', TRUE),
('Netflix Spain', TRUE),
('Syncopy', TRUE),
('20th Century Studios', TRUE),
('Sony Pictures', TRUE),
('Vyjayanthi Movies', TRUE),
('Walt Disney Animation Studios', TRUE);

SELECT * FROM content_creators;

-- 14
CREATE TABLE notifications (
notification_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
message VARCHAR(255),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- FOR TRIGGER
ALTER TABLE content
ADD creator_id INT;
UPDATE content
SET creator_id = 1
WHERE content_id = 1;
UPDATE content
SET creator_id = 2
WHERE content_id = 2;
UPDATE content
SET creator_id = 3
WHERE content_id = 3;
UPDATE content
SET creator_id = 4
WHERE content_id = 4;
UPDATE content
SET creator_id = 5
WHERE content_id = 5;
UPDATE content
SET creator_id = 6
WHERE content_id = 6;
UPDATE content
SET creator_id = 7
WHERE content_id = 7;
UPDATE content
SET creator_id = 8
WHERE content_id = 8;
UPDATE content
SET creator_id = 9
WHERE content_id = 9;
UPDATE content
SET creator_id = 10
WHERE content_id = 10;
UPDATE content
SET creator_id = 11
WHERE content_id = 11;
UPDATE content
SET creator_id = 12
WHERE content_id = 12;
UPDATE content
SET creator_id = 13
WHERE content_id = 13;
UPDATE content
SET creator_id = 14
WHERE content_id = 14;
UPDATE content
SET creator_id = 15
WHERE content_id = 15;
UPDATE content
SET creator_id = 16
WHERE content_id = 16;
UPDATE content
SET creator_id = 17
WHERE content_id = 17;
UPDATE content
SET creator_id = 18
WHERE content_id = 18;
UPDATE content
SET creator_id = 19
WHERE content_id = 19;
UPDATE content
SET creator_id = 201
WHERE content_id = 20;
SELECT * FROM content;
SELECT * FROM content_creators;
-- to view
CREATE VIEW monthly_revenue_view AS
SELECT 
    DATE_FORMAT(NOW(), '%Y-%m') AS month,
    SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'SUCCESS';
-- TO CHECK VIEW
DESC monthly_revenue_view;
SELECT * FROM monthly_revenue_view;