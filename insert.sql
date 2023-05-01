INSERT INTO Genre (genre_name)
VALUES
	('Phonk'),
	('Hip-hop'),
	('House'),
	('Metal'),
	('K-POP');

INSERT INTO Singers (singer_name)
VALUES 
	('Ghostface'),
	('ASAP Rocky'),
	('BTS'),
	('APHEX TWIN'),
	('ASAP FERG'),
	('Dragonforce'),
	('Drake'),
	('DVRST');

INSERT INTO genressingers (genre_id, singer_id)
VALUES 
	(1, 1),
	(2, 2),
	(5, 3),
	(3, 4),
	(2, 5),
	(4, 6),
	(2, 7),
	(1, 8);

INSERT INTO genressingers (genre_id, singer_id)
VALUES
	(3, 2),
	(1, 4),
	(3, 8);

INSERT INTO Albums (album_name, release_date)
VALUES
	('Testing', 2018),
	('Ferg Forever', 2014),
	('Modular Trax', 2014),
	('High As Fuck', 2020),
	('Scorpion', 2018),
	('Circlusion', 2020),
	('Extreme power metal', 2019),
	('Be', 2020);

INSERT INTO colaboration (singer_id, album_id)
VALUES
	(1, 4),
	(2, 1),
	(3, 8),
	(4, 3),
	(5, 2),
	(6, 7),
	(7, 5),
	(8, 6);

INSERT INTO Tracks (track_name, duration, album_id)
VALUES 
	('Fukk Sleep', 193, 1),
	('My perfume', 202, 2),
	('Jungle', 185, 2),
	('Quik Easel', 56, 3),
	('Triple Six', 108, 4),
	('Breaking the Law', 156, 4),
	('Survival', 136, 5),
	('Mob ties', 205, 5),
	('Spoon', 474, 6),
	('U2',470, 6),
	('The last Dragonborn', 373, 7),
	('Razorblade Meltdown', 286, 7),
	('Strangers', 269, 7),
	('Dynamite', 199, 8),
	('Stay', 205, 8);

INSERT INTO Collection (title, release_year)
VALUES
	('Лучшие треки века', 2023),
	('Hip-hop beat', 2020),
	('Tik-tok', 2018),
	('Рок в крови', 2019),
	('PHONK BEATS', 2020),
	('Музыка для души', 2018),
	('Flex songs', 2022),
	('Top charted', 2021);

INSERT INTO collectiontracks (collection_id, track_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 14),
	(4, 11),
	(5, 5),
	(6, 3),
	(7, 7),
	(8, 15),
	(1, 4),
	(2, 6),
	(3, 8),
	(4, 12),
	(5, 10),
	(6, 9),
	(7, 13);
-- Удалил связь для выполнения 7-ой задачи
DELETE FROM collectiontracks
WHERE collectiontracks.id = 2;