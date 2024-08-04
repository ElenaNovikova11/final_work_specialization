CREATE DATABASE Animal;
USE Animal;

  
-- Класс собаки
CREATE TABLE dogs (
	name VARCHAR(50) COMMENT 'Имя животного',
	type_an VARCHAR(50) DEFAULT 'dogs',
    teams VARCHAR(150) COMMENT 'Команды',
    date_birth DATE
    );
 
 -- Заполнение таблицы dogs
 INSERT INTO dogs (name, type_an, teams, date_birth) VALUES 
('Лайка', DEFAULT, 'Бегать', '2024-07-01'),
('Хвостик', DEFAULT, 'Прыгать', '2023-07-15'),
('Лапка', DEFAULT, 'Голос', '2022-10-01'),
('Жмурка', DEFAULT, 'Бегать', '2024-04-15'),
('Пальма', DEFAULT, 'Сидеть', '2021-07-01');
    
-- Класс кошки
CREATE TABLE Cats (
	name VARCHAR(50) COMMENT 'Имя животного',
	type_an VARCHAR(50) DEFAULT 'cats',
    teams VARCHAR(150) COMMENT 'Команды',
    date_birth DATE
    );
 
 -- Заполнение таблицы cats
 INSERT INTO cats (name, type_an, teams, date_birth) VALUES 
('Пушинка', DEFAULT, 'Мяукать', '2020-08-01'),
('Мурка', DEFAULT, 'Спать', '2024-07-25'),
('Кесси', DEFAULT, 'Бегать', '2023-10-11'),
('Буся', DEFAULT, 'Бегать', '2023-04-25'),
('Апельсинка', DEFAULT, 'Мяукать', '2021-07-30');

-- Класс хомяки
CREATE TABLE hamsters (
	name VARCHAR(50) COMMENT 'Имя животного',
	type_an VARCHAR(50) DEFAULT 'hamsters',
    teams VARCHAR(150) COMMENT 'Команды',
    date_birth DATE
    );
   
 -- Заполнение таблицы hamsters
 INSERT INTO hamsters (name, type_an, teams, date_birth) VALUES 
('Вася', DEFAULT, 'Кусать', '2020-12-12'),
('Петя', DEFAULT, 'Спать', '2024-10-25'),
('Гриша', DEFAULT, 'Бегать', '2020-10-11'),
('Зубик', DEFAULT, 'Есть', '2024-04-08'),
('Бублик', DEFAULT, 'Кусать', '2021-12-30');
   
-- Класс лошади
CREATE TABLE horses (
	name VARCHAR(50) COMMENT 'Имя животного',
	type_an VARCHAR(50) DEFAULT 'horses',
    teams VARCHAR(150) COMMENT 'Команды',
    date_birth DATE
    );
   
 -- Заполнение таблицы horses
 INSERT INTO horses (name, type_an, teams, date_birth) VALUES 
('Аполон', DEFAULT, 'Бегать', '2019-10-12'),
('Клеопатра', DEFAULT, 'Скакать', '2018-10-25'),
('Гайка', DEFAULT, 'Бегать', '2017-12-11'),
('Кнопка', DEFAULT, 'Есть', '2024-04-08'),
('Ласточка', DEFAULT, 'Кусать', '2022-12-30');
   
-- Класс верблюды
CREATE TABLE сamels (
	name VARCHAR(50) COMMENT 'Имя животного',
	type_an VARCHAR(50) DEFAULT 'camels',
    teams VARCHAR(150) COMMENT 'Команды',
    date_birth DATE
    );
 
  -- Заполнение таблицы сamels
 INSERT INTO сamels (name, type_an, teams, date_birth) VALUES 
('Гарик', DEFAULT, 'Бегать', '2023-10-12'),
('Грустик', DEFAULT, 'Плевать', '2020-10-25'),
('Хвостик', DEFAULT, 'Бегать', '2016-12-11'),
('Горбик', DEFAULT, 'Есть', '2024-04-08'),
('Джин', DEFAULT, 'Кусать', '2023-12-30');
    
-- Класс ослы
CREATE TABLE donkeys (
	name VARCHAR(50) COMMENT 'Имя животного',
	type_an VARCHAR(50) DEFAULT 'donkeys',
    teams VARCHAR(150) COMMENT 'Команды',
    date_birth DATE
    );
   
   -- Заполнение таблицы donkeys
 INSERT INTO donkeys (name, type_an, teams, date_birth) VALUES 
('Сердце', DEFAULT, 'Катать', '2023-10-02'),
('Биби', DEFAULT, 'Катать', '2022-10-25'),
('Кукла', DEFAULT, 'Бегать', '2016-12-11'),
('Красивый', DEFAULT, 'Катать', '2024-04-08'),
('Ласка', DEFAULT, 'Бегать', '2023-12-30');  

-- Удаление таблицы верблюды
DROP TABLE сamels;


-- объединить собаки, кошки, хомяки в таблицу Pets
-- Класс "Домашний животные", содержащие в себе собак, кошек, хомяков
CREATE TABLE Pets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) COMMENT 'Имя животного',
	type_an VARCHAR(50) COMMENT 'Тип животного',
	teams VARCHAR(150) COMMENT 'Команды',
    date_birth DATE
     )
    SELECT * FROM dogs
   	UNION
  	SELECT * FROM cats
 	UNION 
	SELECT * FROM hamsters;
  
-- Класс "Вьючные животные", содержащие в себе лошадей, ослов,  верблюдов нет, уехали на зимовку
CREATE TABLE Pack_animals (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) COMMENT 'Имя животного',
	type_an VARCHAR(50) COMMENT 'Тип животного',
	teams VARCHAR(150) COMMENT 'Команды',
    date_birth DATE
     )
    SELECT * FROM horses
   	UNION
   	SELECT * FROM donkeys;

-- Родительский класс "Друзья человека", содержащие в себе домашние и вьючные животные
CREATE TABLE Human_Friends 
    SELECT * FROM pets
   	UNION
  	SELECT * FROM pack_animals;
   
-- Создать новую таблицу “молодые животные” в которую попадут все
-- животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
-- до месяца подсчитать возраст животных в новой таблице 

CREATE TABLE young_animals -- (id, name, type_an, date_birth, age )
	SELECT name, type_an, date_birth,
	concat(CAST(TIMESTAMPDIFF(YEAR, date_birth, now()) as char), ' лет', 
	CAST(mod(TIMESTAMPDIFF(MONTH, date_birth, now()), 12) as char), ' мес.') as age
	FROM pets
   WHERE TIMESTAMPDIFF(YEAR, date_birth, curdate()) BETWEEN 1 AND 2
   UNION ALL
   SELECT name, type_an, date_birth,
   concat(CAST(TIMESTAMPDIFF(YEAR, date_birth, now()) as char), ' лет', 
   CAST(mod(TIMESTAMPDIFF(MONTH, date_birth, now()), 12) as char), ' мес.') as age
   FROM pack_animals 
   WHERE TIMESTAMPDIFF(YEAR, date_birth, curdate()) BETWEEN 1 AND 2; 
  
-- объединить все таблицы в одну  
CREATE TABLE allTable (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
	SELECT name, type_an, date_birth, 'cats' AS "Исходная таблица"
	FROM cats 
	UNION 
	SELECT name, type_an, date_birth,'dogs' AS "Исходная таблица"
	FROM dogs 
	UNION
	SELECT name, type_an, date_birth, 'hamsters' AS "Исходная таблица"
	FROM hamsters 
	UNION 
	SELECT name, type_an, date_birth, 'horses' AS "Исходная таблица"
	FROM horses 
	UNION 
	SELECT name, type_an, date_birth, 'donkeys' AS "Исходная таблица"
	FROM donkeys;

  
  





