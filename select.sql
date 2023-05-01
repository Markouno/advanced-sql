SELECT album_name, release_date FROM albums
WHERE release_date = 2018;

SELECT track_name, duration FROM tracks
ORDER BY duration DESC
LIMIT 1;

SELECT track_name FROM tracks
WHERE duration >= 210;

SELECT title FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT singer_name FROM singers
WHERE singer_name NOT LIKE '% %';

SELECT track_name FROM tracks
WHERE track_name ILIKE ANY (ARRAY['%My%', '%Мой%']);

--
--
--

-- Количество исполнителей в каждом жанре.
SELECT genre_name, COUNT(singer_id) FROM genre g
JOIN genressingers gs ON g.id = gs.genre_id
GROUP BY genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(album_id) FROM tracks
JOIN albums ON albums.id = tracks.id
WHERE release_date BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT album_name, ROUND(AVG(duration)) FROM tracks t
JOIN albums ON albums.id = t.album_id
GROUP BY album_name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT singer_name FROM singers s
JOIN colaboration c ON s.id = c.singer_id
JOIN albums a ON a.id = c.album_id 
WHERE release_date != 2020;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT title FROM collection c
JOIN collectiontracks c2 ON c.id = c2.collection_id 
JOIN tracks t ON c2.track_id = t.id 
JOIN albums a ON t.album_id = a.id 
JOIN colaboration c3 ON a.id = c3.album_id 
JOIN singers s ON c3.singer_id = s.id
WHERE singer_name = 'ASAP Rocky';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT album_name FROM albums a
JOIN colaboration c ON a.id = c.album_id
JOIN singers s ON c.singer_id = s.id
JOIN genressingers g ON  s.id = g.singer_id
GROUP BY album_name, g.singer_id
HAVING COUNT(*) > 1;

--Наименования треков, которые не входят в сборники.
SELECT track_name FROM tracks t
LEFT JOIN collectiontracks c ON t.id = c.track_id 
LEFT JOIN collection co ON c.collection_id = co.id 
WHERE c.id IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT singer_name FROM singers s 
JOIN colaboration c ON s.id = c.singer_id 
JOIN albums a ON c.album_id = a.id 
JOIN tracks t ON a.id = t.album_id
WHERE duration = (
	SELECT MIN(duration) FROM tracks
);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT album_name "Альбом" FROM albums
JOIN tracks ON albums.id = tracks.album_id
GROUP BY albums.album_name
HAVING COUNT(tracks) = (
	SELECT COUNT(id) FROM tracks 
	GROUP BY tracks.album_id
	ORDER BY 1
	LIMIT 1
);