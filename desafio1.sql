DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artists (
    artist_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(50) NOT NULL,
    PRIMARY KEY (artist_id)
)  ENGINE=INNODB;

CREATE TABLE albuns (
    album_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artist_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB;

CREATE TABLE musics (
    music_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    music VARCHAR(100) NOT NULL,
    album_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (music_id),
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
)  ENGINE=INNODB;

CREATE TABLE plans (
    plan_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    plan VARCHAR(50) NOT NULL,
    plan_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (plan_id)
)  ENGINE=INNODB;

CREATE TABLE users (
    user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    age SMALLINT UNSIGNED NOT NULL,
    plan_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (plan_id)
        REFERENCES plans (plan_id)
)  ENGINE=INNODB;

CREATE TABLE followed_artists (
    user_id SMALLINT UNSIGNED NOT NULL,
    artist_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
)  ENGINE=INNODB;

CREATE TABLE reprodution_history (
    user_id SMALLINT UNSIGNED NOT NULL,
    music_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, music_id),
    FOREIGN KEY (music_id)
        REFERENCES musics (music_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
)  ENGINE=INNODB;

INSERT INTO `artists` (artist_id, artist)
VALUES ('1','Walter Phoenix'),
('2','Peter Strong'),
('3','Lance Day'),
('4','Freedie Shannon');

INSERT INTO `albuns` (album_id, album, artist_id)
VALUES ('1','Envious','1'),
('2','Exuberant','1'),
('3','Hallowed Steam','2'),
('4','Incandescent','3'),
('5','Temporary Culture','4');

INSERT INTO `musics` (music_id, music, album_id)
VALUES ('1','Soul For Us','1'),
('2','Reflections Of Magic','1'),
('3','Dance With Her Own','1'),
('4','Troubles Of My Inner Fire','2'),
('5','Time Fireworks','2'),
('6','Magic Circus','3'),
('7','Honey,  So Do I','3'),
('8',"Sweetie, Let's Go Wild",'3'),
('9','She Knows','3'),
('10','Fantasy For Me','4'),
('11','Celebration Of More','4'),
('12','Rock His Everything','4'),
('13','Home Forever','4'),
('14','Diamond Power','4'),
('15',"Honey, Let's Be Silly",'4'),
('16','Thang Of Thunder','5'),
('17','Words Of Her Life','5'),
('18','Without My Streets','5');

INSERT INTO `plans` (plan_id, plan, plan_price)
VALUES ('1','gratuito','0.00'),
('2','familiar','7.99'),
('3','universit??rio','5.99');

INSERT INTO `users` (user_id, user_name, age, plan_id)
VALUES ('1','Thati','23','1'),
('2','Cintia','35','2'),
('3','Bill','20','3'),
('4','Roger','45','1');

INSERT INTO `followed_artists` (user_id, artist_id)
VALUES ('1','1'),
('1','4'),
('1','3'),
('2','1'),
('2','3'),
('3','2'),
('3','1'),
('4','4');

INSERT INTO `reprodution_history` (user_id, music_id)
VALUES ('1','1'),
('1','6'),
('1','14'),
('1','16'),
('2','13'),
('2','17'),
('2','2'),
('2','15'),
('3','4'),
('3','16'),
('3','6'),
('4','3'),
('4','18'),
('4','11');
