SELECT ganre_name, count(artist_id)  FROM genreartists  g 
JOIN genre g2 ON g.genre_id   = g2.id
GROUP BY ganre_name
ORDER BY count ASC;

SELECT count(track_name)  FROM tracks t 
JOIN albums a ON t.album_id = a.id
WHERE  date(year_of_pabl) >= '2019-01-01' AND date(year_of_pabl) <= '2020-12-31';

SELECT album_name , avg(duration)  FROM albums a 
JOIN tracks t ON a.id = t.album_id
GROUP BY album_name
ORDER BY avg ASC;

SELECT DISTINCT  artist_name  FROM artists a 
LEFT JOIN albumsartists a2 ON a.id = a2.artist_id
LEFT JOIN albums a3 ON a2.album_id = a3.id
WHERE date(year_of_pabl) < '2020-01-01' OR date(year_of_pabl) > '2020-12-31' OR  year_of_pabl IS NULL ;


SELECT DISTINCT coll_name  FROM collection c
JOIN trackcollection t ON c.id = t.collection_id
JOIN tracks t2 ON t.track_id = t2.id
JOIN albums a ON t2.album_id  = a.id
JOIN albumsartists a2 ON a.id = a2.album_id 
JOIN artists a3 ON a2.artist_id = a3.id
WHERE artist_name = 'Аквариум';

SELECT album_name FROM albums a 
JOIN albumsartists a2 ON a.id = a2.album_id
JOIN artists a3 ON a2.artist_id = a3.id
JOIN genreartists g ON a3.id = g.artist_id
GROUP BY a.album_name 
HAVING count(genre_id) > 1;

SELECT track_name  FROM tracks t 
LEFT JOIN trackcollection t2 ON t.id = t2.track_id 
WHERE collection_id IS NULL;

SELECT artist_name  FROM artists a 
JOIN albumsartists a2 ON a.id = a2.artist_id 
JOIN tracks t ON a2.album_id = t.album_id
WHERE duration = (SELECT min(duration) FROM tracks);

SELECT album_name FROM albums a 
JOIN tracks t ON a.id = t.album_id 
GROUP BY album_name
HAVING count(album_id) = (SELECT count(album_id) FROM tracks GROUP BY album_id ORDER BY count ASC LIMIT 1) ;



