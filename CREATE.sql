CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL CHECK (TRIM(name) <> '') UNIQUE
);

CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL CHECK (TRIM(name) <> '')
);

CREATE TABLE artist_genres (
    artist_genres_id SERIAL PRIMARY KEY,
    artist_id INTEGER NOT NULL REFERENCES artists(artist_id) ON DELETE CASCADE,
    genre_id  INTEGER NOT NULL REFERENCES genres(genre_id) ON DELETE CASCADE,
    UNIQUE(artist_id, genre_id)
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL CHECK (TRIM(name) <> ''),
    release_year SMALLINT NOT NULL 
        CHECK (release_year >= 1800 
           AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE) + 1)
);

CREATE TABLE album_artists (
    album_artists_id SERIAL PRIMARY KEY,
    album_id  INTEGER NOT NULL REFERENCES albums(album_id) ON DELETE CASCADE,
    artist_id INTEGER NOT NULL REFERENCES artists(artist_id) ON DELETE CASCADE,
    UNIQUE(album_id, artist_id)
);

CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL CHECK (TRIM(name) <> ''),
    duration INTEGER NOT NULL 
        CHECK (duration >= 15 AND duration <= 3600),
    album_id INTEGER NOT NULL REFERENCES albums(album_id) ON DELETE CASCADE
);

CREATE TABLE collection (
    collection_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL CHECK (TRIM(name) <> ''),
    release_year SMALLINT NOT NULL 
        CHECK (release_year >= 1800 
           AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE) + 1)
);

CREATE TABLE collection_tracks (
    collection_tracks_id SERIAL PRIMARY KEY,
    collection_id INTEGER NOT NULL REFERENCES collection(collection_id) ON DELETE CASCADE,
    track_id      INTEGER NOT NULL REFERENCES tracks(track_id) ON DELETE CASCADE,
    UNIQUE(collection_id, track_id)
);