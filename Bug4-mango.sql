USE mangomusic;

-- REPORT 4: Monthly Active Users by Country
-- Business need: Geographic breakdown of engaged users
-- Count unique users who played at least one album per month, by country

SELECT 
    u.country,
    DATE_FORMAT(ap.played_at, '%Y-%m') as activity_month,
    COUNT(DISTINCT u.user_id) as monthly_active_users
FROM album_plays ap
JOIN users u ON ap.user_id = u.user_id
WHERE ap.played_at >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
  AND COUNT(DISTINCT u.user_id) >= 1
GROUP BY u.country, DATE_FORMAT(ap.played_at, '%Y-%m')
ORDER BY activity_month DESC, monthly_active_users DESC;
-- Since count() is a aggregate function it can't run before group 
-- the code was failing cuz when where running before group 
-- then it was count() but count() could only run after group
-- count () can't be used in WHERE but it can be in SELECT,HAVING,ORDER BY, GROUP BY



-- Fixed
-- just remove the count() function
SELECT 
    u.country,
    DATE_FORMAT(ap.played_at, '%Y-%m') as activity_month,
    COUNT(DISTINCT u.user_id) as monthly_active_users
FROM album_plays ap
JOIN users u ON ap.user_id = u.user_id
WHERE ap.played_at >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY u.country, DATE_FORMAT(ap.played_at, '%Y-%m')
ORDER BY activity_month DESC, monthly_active_users DESC;