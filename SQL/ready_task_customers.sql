Необходимо написать запросы, которые будут выводить следующую информацию:
1.	Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 

Select Distinct Customers.CompanyName
       from Customers JOIN Orders
       on Customers.CustomerID=Orders.CustomerID
where OrderDate not between '15.11.1996' and '18.02.1997';

2.	Вывести названия компаний поставщиков, которые находятся в México D.F.;

SELECT CompanyName
FROM Customers 
WHERE City = ‘México D.F.’;

3.	Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;

SELECT * FROM Orders
WHERE OrderDate BETWEEN ‘1996.12.12.’ AND ‘1997.02.18’;

4.	Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;

SELECT * FROM Customers
WHERE CompanyName LIKE ‘An%’;

5.	Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.

SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderDate, Orders.OrderSum
FROM Customers
JOIN Orders ON Customers.CustomerID=Orders.CustomerID
WHERE Orders.OrderSum > 17000;

6.	Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания

SELECT Customers.CompanyName, Orders.OrderSum
FROM Customers
JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CompanyName DESC;

7.	Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.

SELECT Customers.CompanyName, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID= Orders.CustomerID;

