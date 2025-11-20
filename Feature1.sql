USE mangomusic;

SELECT u.subscription_type, COUNT(DISTINCT u.user_id) AS total_users,
COUNT(ap.play_id) AS total_players,
ROUND(COUNT(ap.play_id) * 1.0 / COUNT(DISTINCT u.user_id), 
2) AS avg_plays_per_user
FROM users AS u
JOIN album_plays AS ap
  ON u.user_id = ap.user_id
GROUP BY u.subscription_type
ORDER BY u.subscription_type;   