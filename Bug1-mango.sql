USE mangomusic;

-- REPORT 1: Daily Active Users Report
-- Business need: Track platform engagement day-by-day
-- Shows unique users who played at least one album each day for the past 30 days

SELECT 
    DATE(played_at) as activity_date,
    COUNT(*) as daily_active_users
FROM album_plays
WHERE played_at >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY DATE(played_at)
ORDER BY activity_date DESC;
-- here count was counting every row in the album_plays 
-- it was like duplicateing plays 
-- so like it was counting plays not peoepl? i am assuming 


-- fixed 
-- only couting the unique users
SELECT 
    DATE(played_at) as activity_date,
    COUNT(DISTINCT user_id) as daily_active_users
FROM album_plays
WHERE played_at >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY DATE(played_at)
ORDER BY activity_date DESC;


