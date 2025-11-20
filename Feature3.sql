USE mangomusic;

SELECT ar.primary_genre AS genre, COUNT(DISTINCT al.album_id) AS total_albums,
COUNT(ap.play_id) AS total_plays, COUNT(DISTINCT ar.artist_id) AS total_artists
FROM album_plays AS ap
JOIN albums AS al
 ON ap.album_id = al.album_id
JOIN artists AS ar
 ON al.artist_id = ar.artist_id
GROUP BY ar.primary_genre
ORDER BY total_plays DESC; 

