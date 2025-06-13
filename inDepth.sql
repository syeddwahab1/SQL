-- Simulate creating Booking.com databse 
CREATE DATABASE booking_company ;
USE booking_company ; -- to set the database as default or current 
SELECT DATABASE(); 
CREATE TABLE guests (
id INT NOT NULL AUTO_INCREMENT, -- not null so this id should never be null ,and auto increment for new records being added
name VARCHAR(255) NOT NULL, -- name should also have a value.
email VARCHAR(255),
reservation_date DATE , -- YYYY-MM-DD format
country_code CHAR (3),
PRIMARY KEY (id)  -- unique and primary key through which we will connect to other tables
);

INSERT INTO guests (name,email,reservation_date,country_code) -- adding data in db
VALUE ('John','johnd@email','2025-02-11','pak'); -- defining values
SELECT * FROM guests; -- show all data of guests 

INSERT INTO guests (name,email,reservation_date,country_code) -- adding dummydata
VALUES 
('John','johnd@email','2025-02-11','pak'),
('alex','alex@email','2025-02-12','usa'),
('dave','dave@email','2025-01-13','ger'),
('cody','cody@email','2025-03-14','uae') ;
SELECT * FROM guests;
SELECT * FROM guests LIMIT 2; -- limiting the resul
t to 2 to get first 2 entries 
SELECT name, email FROM guests; -- for displaying specific columns 
SELECT id AS 'guest_id' ,name AS 'guest_name' FROM guests; -- assigning aliases to column name ,it wont change column name 

 -- Retreiving data in ascending or descending order 
SELECT * FROM guests ORDER BY name; -- by default its in ascending order 
SELECT * FROM guests ORDER BY name ASC; -- ascending order same as above 
SELECT * FROM guests ORDER BY name DESC; -- for descending order  

CREATE TABLE reservations (
id INT NOT NULL AUTO_INCREMENT,
room_number INT NOT NULL,
room_type VARCHAR(255) NOT NULL,
guest_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (guest_id) REFERENCES guests(id) -- foreign key referencing to guests table and using its values 
);
ALTER TABLE reservations 
RENAME COLUMN room_type TO roomType; -- renaming columns 

ALTER TABLE reservations 
RENAME COLUMN roomType TO room_type ;

INSERT INTO reservations (room_number,room_type,guest_id)
VALUES 
(01,'smoking',1),
(014,'nonsmoking',2),
(056,'smoking',3),
(011,'smoking',4),
(034,'nonsmoking',5);
 
 SELECT * FROM reservations;
 SELECT DISTINCT room_type FROM reservations; -- to deal with double values use distinct to retreive unique values 
 
 -- updating a column 
 UPDATE reservations 
 SET room_type= 'smoking'
 WHERE id=2;

SELECT * FROM reservations ;

TRUNCATE TABLE reservations; -- completely wipes off the table 
 
 -- Searching by letters in database 
 SELECT * FROM guests 
 WHERE name LIKE "a%"; -- looks up first letter 
 
 SELECT * FROM guests 
 WHERE name LIKE "%a%"; -- looks up in between words also
 
 -- AND/OR operators 
 
 SELECT * FROM guests 
 WHERE name LIKE "%a%" OR country_code='pak'; -- runs on either condition being fulfilled 
 
 SELECT * FROM guests 
 WHERE name LIKE "%a%" AND country_code='ger'; -- runs on both conditions being fulfilled 
 
 SELECT * FROM reservations
 WHERE room_number <21 ; -- <>operators
 
 SELECT * FROM reservations
 WHERE room_number BETWEEN 14 AND 21 ; -- within a range 
 
 -- Connecting (joining) tables
 SELECT * FROM guests;
 SELECT * FROM reservations;
  
SELECT * FROM reservations -- left side of the join i.e the start of the joined table 
JOIN guests ON guest_id= reservations.guest_id; -- connecting both tables usin primary key of guests table with common val in reservations 

-- Left Join
 SELECT * FROM guests
 LEFT JOIN reservations ON guests.id = reservations.guest_id;
 
 SELECT * FROM reservations 
 RIGHT JOIN guests ON guests.id = reservations.guest_id;
 
 -- Inner Join : returns records that have matching values in both tables
SELECT * FROM reservations
INNER JOIN guests ON guests.id = reservations.guest_id;

CREATE DATABASE football_team;

USE football_team;

CREATE TABLE players (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
joining_date DATE NULL,
PRIMARY KEY (id)
);

CREATE TABLE coaches (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
joining_date DATE NULL,
player_id INT NOT NULL, 
PRIMARY KEY (id),
FOREIGN KEY (player_id) REFERENCES players(id)
);

INSERT INTO players (name, joining_date)
VALUES ('ronaldo', '1993-02-15'),
('rivaldo', '1993-04-11'),
('carlos', '1991-01-15'),('romario', '1994-01-01');

SELECT * FROM players;

INSERT INTO coaches (name, joining_date, player_id)
VALUES ('C. Pasconi', '1990-01-15', 2),
('C. Roni', '1989-06-03', 4),
('C. Pasconi', '1990-01-15', 3),('C. Mino', '1988-04-01', 1);

SELECT * FROM coaches;

-- UNION statement
SELECT id, name, joining_date FROM players
UNION
SELECT id, name, joining_date FROM coaches;

-- Aggregate methods
-- COUNT(), MAX(), MIN(), SUM(), AVG()
SELECT AVG (joining_date) FROM coaches;

-- GROUP BY Statement
SELECT DATABASE();
SELECT name FROM players WHERE id = 1;
SELECT name, COUNT(joining_date) FROM players GROUP BY joining_date;

USE booking_company;

SELECT name, country_code, COUNT(id) FROM guests
GROUP BY id
ORDER BY name DESC;
 
 
 



