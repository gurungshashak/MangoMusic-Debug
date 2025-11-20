USE mangomusic;

SELECT u.country, COUNT(DISTINCT u.user_id) AS total_users, COUNT(DISTINCT ap.play_id) AS total_plays,
ROUND(COUNT(ap.play_id) *  COUNT(DISTINCT u.user_id), 2) AS avg_plays_per_user
FROM users AS u
LEFT JOIN album_plays AS ap
 ON u.user_id = ap.user_id
GROUP BY u.country
ORDER BY total_plays DESC; 


-- 13:57:30	SELECT u.country, COUNT(DISTINCT u.User_id) AS total_users, COUNT(DISTINCT ap.play_id) AS total_plays, ROUND(COUNT(ap.play_id) * 1.0 / COUNT(DISTINCT u.user_id), 2) AS avg_plays_per_user FROM users AS u JOIN ablum_plays AS ap  ON u.user_id = ap.user_id GROUP BY u.country ORDER BY total_plays DESC LIMIT 0, 1000	Error Code: 1146. Table 'mangomusic.ablum_plays' doesn't exist	0.000 sec
-- fiex it spelled album_plays wrong :) 