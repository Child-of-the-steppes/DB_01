INSERT INTO genres (name) VALUES 
('Rock'),
('Pop'),
('Hip-Hop'),
('Metal');

INSERT INTO artists (name) VALUES 
('Queen'),
('ABBA'),
('Eminem'),
('Rammstein'),
('Rihanna');

INSERT INTO artist_genres (artist_id, genre_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4), 
(5, 2);

INSERT INTO albums (name, release_year) VALUES 
('A Night at the Opera', 1975), 
('Arrival', 1976),
('The Marshall Mathers LP', 2000), 
('Mutter', 2001), 
('The Eminem Show', 2002), 
('Sehnsucht', 1997),
('Recovery', 2010),
('Anti', 2016);

INSERT INTO album_artists (album_id, artist_id) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 3), 
(6, 4),  
(7, 3),
(7, 5),
(8, 5);

INSERT INTO tracks (name, duration, album_id) VALUES 
('Bohemian Rhapsody', 355, 1),
('Love of My Life', 219, 1),
('You''re My Best Friend', 175, 1),  
('Dancing Queen', 231, 2), 
('Money, Money, Money', 186, 2), 
('Knowing Me, Knowing You', 240, 2), 
('Stan', 326, 3),
('Sonne', 272, 4), 
('Without Me', 290, 5), 
('Du Hast', 214, 6),
('Love The Way You Lie', 263, 7),
('Work', 219, 8), 
('Where Have You Been', 213, 8), 
('Мой трек', 103, 8),
('Лучшиймой трек', 21, 7),
('Darkness', 280, 5);

INSERT INTO collection (name, release_year) VALUES 
('Rock Legends', 2019),
('Pop Anthems', 2020),
('Hip-Hop Hits', 2018),
('My Favorites', 2022);

INSERT INTO collection_tracks (collection_id, track_id) VALUES 
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5), (2, 6),
(3, 7), (3, 9),
(4, 10), (4, 11), (4, 12);
