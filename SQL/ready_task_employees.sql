1) Вывести среднюю заработную плату всех тестировщиков на проекте “ПУМЧД”.
Ответ должен содержать столбцы:
Название проекта;
Название должности;
Средняя заработная плата.

SELECT projects.project_name AS Project, titles.titel_name AS Title, ROUND(AVG(positions.salary),2) AS AVG_Salary
FROM positions
JOIN projects ON positions.project_id = projects.project_id
JOIN titles ON positions.title_id = titles.id
WHERE projects.project_name =  'ПУМЧД' AND titles.titel_name LIKE '%тестировщик%'
GROUP BY Project, Title

2) Вывести всех работников, которые работают сразу на нескольких проектах.
Ответ должен содержать следующие столбцы:
Имя и фамилия сотрудника;
Название должности.

SELECT CONCAT (employee.first_name, ' ', employee.last_name) AS FIO, titles.titel_name AS Title
FROM positions
JOIN employee ON positions.employee_id = employee.employee_id
JOIN titles ON positions.title_id = titles.id
GROUP BY FIO, Title
HAVING COUNT (positions.project_id) > 1

