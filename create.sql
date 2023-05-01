CREATE TABLE IF NOT EXISTS Genre (
	id serial PRIMARY KEY,
	genre_name VARCHAR(60) NOT NULL 
);

CREATE TABLE IF NOT EXISTS Singers (
	id serial PRIMARY KEY,
	singer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresSingers (
	id SERIAL PRIMARY KEY,
	genre_id INTEGER REFERENCES Genre(id),
	singer_id INTEGER REFERENCES Singers(id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id serial PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL,
	release_date INTEGER
);

CREATE TABLE IF NOT EXISTS Colaboration (
	id SERIAL PRIMARY KEY,
	singer_id INTEGER REFERENCES Singers(id),
	album_id INTEGER REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id serial PRIMARY KEY,
	track_name VARCHAR(60) NOT NULL,
	duration INTEGER,
	album_id INTEGER REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id serial PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	release_year INTEGER
);

CREATE TABLE IF NOT EXISTS CollectionTracks (
	id SERIAL PRIMARY KEY,
	collection_id INTEGER REFERENCES Collection(id),
	track_id INTEGER REFERENCES Tracks(id)
);