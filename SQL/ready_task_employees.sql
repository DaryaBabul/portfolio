Создание базы данных и добавление значений в таблицы:

1. CREATE DATABASE employees;

2. CREATE TABLE employee
(employee_id UUID NOT NULL PRIMARY KEY,
first_name Varchar NOT NULL,
last_name Varchar NOT NULL);

3. CREATE TABLE projects
(project_id UUID NOT NULL PRIMARY KEY,
project_name Varchar NOT NULL);

4. CREATE TABLE titles
(id UUID NOT NULL PRIMARY KEY,
titel_name Varchar NOT NULL);

5. CREATE TABLE positions
(id UUID NOT NULL PRIMARY KEY,
employee_id UUID NOT NULL,
project_id UUID NOT NULL,
title_id UUID NOT NULL,
salary numeric(19, 2) NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
FOREIGN KEY (project_id) REFERENCES projects (project_id),
FOREIGN KEY (title_id) REFERENCES titles (id));

6. INSERT INTO employee VALUES ('a0eebc999c0b4ef8bb6d6bb9bd380a11', 'Darya', 'Petrova'),
('a0eebc999c0b4ef8bb6d6bb1bd380a11', 'Maria', 'Puch'),
('a0eebc999c0b4ef8bb6d6bb8bd380a11', 'Pavel', 'Sidor');

7. INSERT INTO projects VALUES ('a0eebc999c0b4ef8bb6d6bb7bd380a11', 'ППУ'),
('a0eebc999c0b4ef8bb5d6bb1bd380a11', 'ПУМЧД'),
('a0eebc999c0b4ef7bb6d6bb8bd380a11', 'ВКР');

8. INSERT INTO titles VALUES ('a0eebc999c0b3ef8bb6d6bb7bd380a11', 'тестировщик'),
('a0eebc999c0b2ef8bb5d6bb1bd380a11', 'разработчик'),
('a0eebc999c0b5ef7bb6d6bb8bd380a11', 'бизнес-аналитик');

9. INSERT INTO positions VALUES ('a0eebc999c0b1ef8bb6d6bb7bd380a11', 'a0eebc999c0b4ef8bb6d6bb9bd380a11', 'a0eebc999c0b4ef8bb6d6bb7bd380a11', 'a0eebc999c0b3ef8bb6d6bb7bd380a11', 5000),
('a0eebc999c0b2ef8bb1d6bb1bd380a11', 'a0eebc999c0b4ef8bb6d6bb1bd380a11', 'a0eebc999c0b4ef8bb5d6bb1bd380a11', 'a0eebc999c0b2ef8bb5d6bb1bd380a11', 8000),
('a0eebc999c0b5ef7bb6d2bb8bd380a11', 'a0eebc999c0b4ef8bb6d6bb8bd380a11', 'a0eebc999c0b4ef7bb6d6bb8bd380a11', 'a0eebc999c0b5ef7bb6d6bb8bd380a11', 4000), 
('a0eebc999c0b1ef8bb6d1bb7bd380a11', 'a0eebc999c0b4ef8bb6d6bb9bd380a11', 'a0eebc999c0b4ef8bb5d6bb1bd380a11', 'a0eebc999c0b3ef8bb6d6bb7bd380a11', 6000);

Задания к базе данных:

1) Вывести среднюю заработную плату всех тестировщиков на проекте “ПУМЧД”.
Ответ должен содержать столбцы:
Название проекта;
Название должности;
Средняя заработная плата.

1.SELECT projects.project_name AS Project, titles.titel_name AS Title, ROUND(AVG(positions.salary),2) AS AVG_Salary
From positions
JOIN projects ON positions.project_id = projects.project_id
JOIN titles ON positions.title_id = titles.id
WHERE projects.project_name =  'ПУМЧД' AND titles.titel_name LIKE '%тестировщик%'
GROUP BY Project, Title


2) Вывести всех работников, которые работают сразу на нескольких проектах.
Ответ должен содержать следующие столбцы:
Имя и фамилия сотрудника;
Название должности.

2. SELECT CONCAT (employee.first_name, ' ', employee.last_name) AS FIO, titles.titel_name AS Title
FROM positions
JOIN employee ON positions.employee_id = employee.employee_id
JOIN titles ON positions.title_id = titles.id
GROUP BY FIO, Title
HAVING COUNT (positions.project_id) > 1

