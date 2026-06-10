USE everwatch;
SELECT * FROM users;
-- 1
SELECT *
FROM content c
JOIN content_category cg ON c.content_id = cg.content_id
JOIN category ct ON ct.category_id = cg.category_id
WHERE category_name = 'Action';

-- 2
SELECT u.full_name, sp.plan_name
FROM users u
JOIN user_subscription us ON u.user_id = us.user_id
JOIN subscription_plans sp ON us.plan_id = sp.plan_id;

-- 3
SELECT c.title, COUNT(*) AS views
FROM watch_history wh
JOIN content c ON wh.content_id = c.content_id
WHERE wh.watched_at >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY c.title
ORDER BY views DESC
LIMIT 1;

-- 4
SELECT *
FROM content
WHERE director = 'Christopher Noolan';

-- 5
SELECT c.title, wh.watched_at, u.full_name
FROM watch_history wh
JOIN content c ON wh.content_id = c.content_id
JOIN users u ON wh.user_id = u.user_id
WHERE u.user_id = 7;

-- 6
SELECT u.user_id, u.full_name, COUNT(r.rating) AS total_movies_rated, AVG(r.rating) AS average_rating
FROM reviews r
JOIN users u ON u.user_id = r.user_id
GROUP BY u.user_id, u.full_name
HAVING COUNT(r.rating) >= 5;

-- 7
SELECT u.user_id, u.full_name, SUM(c.duration) / 60 AS total_hours_watched
FROM watch_history wh
JOIN users u ON wh.user_id = u.user_id
JOIN content c ON wh.content_id = c.content_id
WHERE wh.watched_at >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY u.user_id, u.full_name
HAVING SUM(c.duration) > 1200;

-- 8
SELECT content_id, title, release_year, content_type
FROM content
WHERE release_year > YEAR(CURDATE())
AND content_type = 'Movie'
ORDER BY release_year;

-- 9
SELECT * FROM content
WHERE content_type = 'Movie'
AND  language IN ('English', 'Spanish');


-- 10
SELECT c.content_id, c.title, COUNT(r.user_id) AS low_rating_users
FROM reviews r
JOIN content c ON r.content_id = c.content_id
WHERE r.rating < 3
AND c.content_type = 'Movie'
GROUP BY c.content_id, c.title
HAVING COUNT(r.user_id) > 10;

-- 11
SELECT u.user_id, u.full_name, sp.plan_name, us.end_date AS renewal_date
FROM user_subscription us
JOIN users u ON us.user_id = u.user_id
JOIN subscription_plans sp ON us.plan_id = sp.plan_id
WHERE us.account_status = 'ACTIVE';


-- 12
SELECT u.user_id, u.full_name, COUNT(wl.content_id) AS total_watchlist_movies
FROM watchlist wl
JOIN users u ON wl.user_id = u.user_id
LEFT JOIN watch_history wh 
ON wl.user_id = wh.user_id
AND wl.content_id = wh.content_id
JOIN content c 
ON wl.content_id = c.content_id
WHERE c.content_type = 'Movie'
AND wh.content_id IS NULL
GROUP BY u.user_id, u.full_name
HAVING COUNT(wl.content_id) >= 5;

-- 13
SELECT c.director, AVG(r.rating) AS average_rating
FROM reviews r
JOIN content c ON r.content_id = c.content_id
WHERE c.content_type = 'Movie'
GROUP BY c.director
ORDER BY average_rating DESC
LIMIT 5;


-- 14
SELECT plan_id, DATE_FORMAT(end_date, '%Y-%m') AS cancellation_month,
COUNT(*) AS total_cancellations
FROM user_subscription
WHERE account_status = 'CANCELLED'
AND end_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY plan_id, DATE_FORMAT(end_date, '%Y-%m')
ORDER BY cancellation_month;

-- 15
SELECT u.user_id, u.full_name,
COUNT(wh.content_id) AS incomplete_movies
FROM watch_history wh
JOIN users u ON wh.user_id = u.user_id
JOIN content c ON wh.content_id = c.content_id
WHERE c.content_type = 'Movie'
AND wh.completed = FALSE
GROUP BY u.user_id, u.full_name
HAVING COUNT(wh.content_id) >= 3;   -- show 2

-- 16
SELECT DATE_FORMAT(us.start_date, '%Y-%m') AS subscription_month,
SUM(sp.price) AS total_revenue
FROM user_subscription us
JOIN subscription_plans sp
ON us.plan_id = sp.plan_id
WHERE YEAR(us.start_date) = YEAR(CURDATE())
AND us.start_date <= CURDATE()
AND us.account_status = 'ACTIVE'
GROUP BY DATE_FORMAT(us.start_date, '%Y-%m')
ORDER BY subscription_month; -- upto today date only for active connections

-- 17
DELIMITER //
CREATE TRIGGER revoke_access_after_cancellation
BEFORE UPDATE ON user_subscription
FOR EACH ROW
BEGIN
IF NEW.account_status = 'CANCELLED' THEN
SET NEW.end_date = CURDATE();
END IF;
END //
DELIMITER ;

-- TO CHECK       
UPDATE user_subscription
SET account_status = 'CANCELLED'
WHERE user_id = 1;
SELECT user_id, account_status, end_date
FROM user_subscription
WHERE user_id = 1;
-- 18
DELIMITER //
CREATE TRIGGER block_geo_restricted_view
BEFORE INSERT ON watch_history
FOR EACH ROW
BEGIN
IF NOT EXISTS (
SELECT 1
FROM users u
JOIN content_region cr ON cr.country = u.country
WHERE u.user_id = NEW.user_id
AND cr.content_id = NEW.content_id
) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Content not available in your region';
END IF;
END //
DELIMITER ;

-- TO CHECK
INSERT INTO watch_history(user_id, content_id)
VALUES (1, 15);

-- 19

DELIMITER //
CREATE TRIGGER check_movie_details
BEFORE INSERT ON content
FOR EACH ROW
BEGIN
IF NEW.release_year IS NULL THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Release year is required';
END IF;
IF NEW.director IS NULL THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Director is required';
END IF;
END //
DELIMITER ;

-- TO check 
INSERT INTO content(title, director)
VALUES ('Avataar', 'James Cameron');  

-- for genre

DELIMITER //
CREATE TRIGGER check_genre_details
BEFORE INSERT ON category
FOR EACH ROW
BEGIN
IF NEW.category_name IS NULL THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Genre is required';
END IF;
END //
DELIMITER ;
-- To check 
INSERT INTO category(category_id)
VALUES (11);

-- 20
START TRANSACTION;
INSERT INTO payments(user_id, plan_id, amount, payment_status)
VALUES(1, 2, 599, 'SUCCESS');  -- wrong data
SAVEPOINT payment_done;
UPDATE user_subscription
SET account_status = 'ACTIVE',
start_date = CURDATE(),
end_date = DATE_ADD(CURDATE(), INTERVAL 1 MONTH)
WHERE user_id = 1
AND plan_id = 2;
ROLLBACK TO payment_done;
COMMIT;
-- TO CHECK
SELECT * FROM user_subscription
WHERE user_id = 1;


-- 21
SELECT user_id, COUNT(*) AS active_sessions
FROM user_sessions
WHERE logout_time IS NULL
GROUP BY user_id
HAVING COUNT(*) > 1;

-- 22
DELIMITER //
CREATE TRIGGER restrict_content_upload
BEFORE INSERT ON content
FOR EACH ROW
BEGIN
IF NOT EXISTS (
SELECT 1
FROM content_creators
WHERE creator_id = NEW.creator_id
AND is_verified = TRUE
) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Only verified creators can upload content';
END IF;
END //
DELIMITER ;
-- to check
INSERT INTO content(title, creator_id, release_year, director)
VALUES ('Ko', 22, 2013, 'K V Anand');
SELECT * FROM content_creators;

-- 23
SET GLOBAL event_scheduler = ON;
DELIMITER //
CREATE EVENT subscription_expiry_notification
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
INSERT INTO notifications (user_id, message)
SELECT user_id,
'Your subscription will expire within 3 days'
FROM user_subscription
WHERE end_date = DATE_ADD(CURDATE(), INTERVAL 3 DAY)
AND account_status = 'ACTIVE';
END //
DELIMITER ;
-- to check
INSERT INTO notifications (user_id, message)
VALUES
(5, 'Your subscription will expire within 3 days'); 
 SELECT * FROM notifications;
 

-- 24

DELIMITER //
CREATE PROCEDURE RecommendMovies(IN p_user_id INT)
BEGIN
SELECT DISTINCT c2.title
FROM reviews r
JOIN content_category cc1
ON r.content_id = cc1.content_id
JOIN content_category cc2
ON cc1.category_id = cc2.category_id
JOIN content c2
ON cc2.content_id = c2.content_id
WHERE r.user_id = p_user_id
AND r.rating >= 4
AND c2.content_id NOT IN (
SELECT content_id
FROM watch_history
WHERE user_id = p_user_id
);
END //
DELIMITER ;
-- to check
CALL REcommendMovies(9);

-- 25
DELIMITER //
CREATE EVENT generate_monthly_report
ON SCHEDULE EVERY 1 MINUTE
STARTS '2026-05-13 00:00:00'
DO
BEGIN
INSERT INTO monthly_reports
(report_month, total_views, active_users, most_watched_genre, total_revenue)
SELECT
DATE_FORMAT(NOW(), '%Y-%m'),
-- total views
(SELECT COUNT(*) FROM watch_history),
-- active users
(SELECT COUNT(DISTINCT user_id) FROM watch_history),
-- most watched category
(SELECT c.category_name
FROM watch_history wh
JOIN content_category cc ON wh.content_id = cc.content_id
JOIN category c ON cc.category_id = c.category_id
GROUP BY c.category_name
ORDER BY COUNT(*) DESC
LIMIT 1),
-- total revenue
(SELECT IFNULL(SUM(amount),0)
FROM payments
WHERE payment_status = 'SUCCESS');
END //
DELIMITER ;
-- to check 
SELECT * FROM monthly_reports;
DROP EVENT generate_monthly_report;
SHOW EVENTS;
SHOW TRIGGERS;
SHOW VARIABLES LIKE 'event_scheduler';