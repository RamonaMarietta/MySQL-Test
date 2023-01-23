-- TABLE MOVIE
-- 1
SELECT title, runtime
FROM movie
WHERE runtime > 120;
-- 2
SELECT title
FROM movie
WHERE title LIKE '%teen%';
-- 3
SELECT DISTINCT vote_average
FROM movie;
-- 4
SELECT title, revenue as Euro, revenue * 1.11 as Pond
FROM movie;
-- TABLE movie_cast
-- 5
select mc.gender_id, count(mc.gender_id) as GenderCount
from movie_cast mc
group by mc.gender_id;
-- 5.1 movie
SELECT m.title, g.gender, COUNT(g.gender_id) as GenderCount
FROM movie_cast mc
         JOIN movie m on mc.movie_id = m.movie_id
         JOIN gender g on g.gender_id = mc.gender_id
GROUP BY m.title, g.gender, mc.gender_id
order by m.title;
-- 5.2 movie_languages
SELECT l.language_name, gender_id, COUNT(gender_id) as LanguageGender
FROM movie_cast mc
         JOIN movie_languages ml on ml.movie_id = mc.movie_id
         JOIN language l on ml.language_id = l.language_id
group by l.language_name, gender_id
order by language_name;
-- 6
select m.title, COUNT(ml.language_id) as LanguageCount
from movie m
         join movie_languages ml on m.movie_id = ml.movie_id
group by m.title, ml.language_id
having COUNT(ml.language_id) > 2
order by m.title;
-- Tabel: movie, movie_keywords, keyword.
-- 7
select distinct m.title, k.keyword_name
from movie m
         join movie_keywords mk on m.movie_id = mk.movie_id
         join keyword k on mk.keyword_id = k.keyword_id
where k.keyword_name = 'space opera'
  and m.title not like '%star%'
order by m.title;
-- Tabel: movie, genre, movie_genre
-- 8
SELECT title, genre_name
from movie m
         join movie_genres mg on m.movie_id = mg.movie_id
         join genre g on mg.genre_id = g.genre_id
WHERE genre_name = 'horror'
order by m.title;

select m.title
from movie m
         join movie_genres mg on m.movie_id = mg.movie_id
where mg.genre_id = 27;
-- 9
-- select g.genre_id, g.genre_name from genre g order by g.genre_id desc;
-- Tous les genres
select *
from genre g
order by genre_id desc;
-- Les genre_id qui ont un lien avec un movie
select distinct mg.genre_id
from movie_genres mg
order by mg.genre_id desc;

select *
from genre g
where genre_id
          not in
      (select distinct mg.genre_id
       from movie_genres mg);

-- Tabel: person, movie_cast.
-- 10
select p.person_name, count(mc.person_id) as movieCount
from movie_cast mc
         join person p on mc.person_id = p.person_id
group by p.person_name, mc.person_id
order by count(mc.person_id) desc
LIMIT 5;

-- Tabel: Movie
-- 11
select avg(m.runtime)
from movie m;

select runtime,title from movie
where  runtime > (select avg(m.runtime) from movie m where m.runtime> 90)
order by title ;

SELECT * FROM movie
WHERE runtime > (SELECT AVG(runtime) FROM movie)ORDER BY title;

CREATE TABLE message (
msg_id INT AUTO_INCREMENT,
message VARCHAR(255),
user_id INT NOT NULL,
receiver_id INT NOT NULL,PRIMARY KEY (msg_id)
);
CREATE TABLE usr (
usr_id INT,
login VARCHAR(50),
email VARCHAR(255)
);
SHOW TABLES ;

SHOW DATABASES;
-- 12
INSERT INTO usr (usr_id,login, email)
VALUES ('1','rincewind',' rincewind@discworld.org');
-- 13
INSERT INTO usr (usr_id, login, email)
VALUES ('2','Bursar',' bursar@unseen.university'),
       ('3',' archchancellor','arch@unseen.university');
-- 14
INSERT INTO message(message, user_id, receiver_id)
VALUES ('Bursar?','3','2'),
       ('Yes, Archchancellor?','2','3'),
       ('"You aren''t a member of some
secret society or somethin'', are you?"','3','2'),
       ('Me? No, Archchancellor.','2','3'),
       ('"Thenit''d be a damn good idea to take your
underpants off your head”','3','2');
-- 15
UPDATE usr
SET email = 'rincewind@unseen.university'
WHERE email = 'rincewind@discworld.org';
-- 16
DELETE FROM message
WHERE user_id = 2;

-- TRUNCATE message
















