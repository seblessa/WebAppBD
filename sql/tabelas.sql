CREATE DATABASE IF NOT EXISTS game;
USE game;

DROP TABLE IF EXISTS PUBLISHER,GAME,TAG,GAME_TAG,PLATFORM,PLATFORM_GAME,REVIEWS;

CREATE TABLE PUBLISHER
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    followers int not null
);

CREATE TABLE GAME
(
id INT PRIMARY KEY AUTO_INCREMENT,
publisher_id INT NOT NULL,
name VARCHAR(255) NOT NULL,
price DECIMAL(10,2) NOT NULL,
release_year  YEAR NOT NULL,
description LONGTEXT DEFAULT NULL,
FOREIGN KEY (publisher_id) REFERENCES PUBLISHER(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TAG
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(24) NOT NULL
);

CREATE TABLE GAME_TAG
(
tag_id INT NOT NULL,
game_id INT NOT NULL,
FOREIGN KEY (game_id) REFERENCES GAME(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (tag_id) REFERENCES TAG(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (game_id,tag_id)
);

CREATE TABLE PLATFORM
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) DEFAULT NULL
);

CREATE TABLE PLATFORM_GAME
(
    platform_id INT NOT NULL,
    game_id INT NOT NULL,
    PRIMARY KEY (game_id,platform_id),
    FOREIGN KEY (game_id) REFERENCES GAME (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (platform_id) REFERENCES PLATFORM (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE REVIEWS
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
game_id INT NOT NULL,
rating VARCHAR(15) NOT NULL CHECK (rating IN ('Recommended', 'Not Recommended')),
review LONGTEXT DEFAULT NULL,
FOREIGN KEY (game_id) REFERENCES GAME (id) ON DELETE CASCADE ON UPDATE CASCADE
);

