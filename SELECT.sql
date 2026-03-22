
-- ЗАДАНИЕ 2
SELECT name, duration 
FROM tracks 
ORDER BY duration DESC 
LIMIT 1;

SELECT name 
FROM tracks 
WHERE duration >= 210;

SELECT name 
FROM collection 
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name 
FROM artists 
WHERE name NOT LIKE '% %';

SELECT name
FROM tracks
WHERE 
    name ILIKE 'my'
    OR name ILIKE 'my %'
    OR name ILIKE '% my'
    OR name ILIKE '% my %'   
    OR name ILIKE 'мой'
    OR name ILIKE 'мой %'
    OR name ILIKE '% мой'
    OR name ILIKE '% мой %';

-- ЗАДАНИЕ 3
SELECT 
    g.name AS genre,
    COUNT(DISTINCT ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artist_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.name
ORDER BY artist_count DESC;

SELECT COUNT(*) AS track_count_2019_2020
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT 
    a.name AS album_name,
    ROUND(AVG(t.duration)::numeric, 1) AS avg_duration_sec
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.name
ORDER BY avg_duration_sec DESC;

SELECT DISTINCT ar.name
FROM artists ar
WHERE ar.artist_id NOT IN (
    SELECT aa.artist_id 
    FROM album_artists aa
    JOIN albums a ON aa.album_id = a.album_id
    WHERE a.release_year = 2020
);

SELECT DISTINCT c.name AS collection_name
FROM collection c
JOIN collection_tracks ct ON c.collection_id = ct.collection_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN album_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.name IN ('Eminem', 'Rihanna');

-- ЗАДАНИЕ 4
SELECT DISTINCT a.name AS album_name
FROM albums a
JOIN album_artists aa ON a.album_id = aa.album_id
JOIN artist_genres ag ON aa.artist_id = ag.artist_id
GROUP BY a.name
HAVING COUNT(DISTINCT ag.genre_id) > 1;

SELECT t.name AS track_name
FROM tracks t
LEFT JOIN collection_tracks ct ON t.track_id = ct.track_id
WHERE ct.collection_id IS NULL;

SELECT DISTINCT ar.name
FROM artists ar
JOIN album_artists aa ON ar.artist_id = aa.artist_id
JOIN albums a ON aa.album_id = a.album_id
JOIN tracks t ON a.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

SELECT a.name
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.name
HAVING COUNT(t.track_id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(track_id) AS track_count
        FROM tracks
        GROUP BY album_id
    ) AS sub
);