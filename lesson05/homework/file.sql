

1. Переименовать ProductName → Name

SELECT ProductName AS Name
FROM Products;


2. Переименовать таблицу Customers → Client

SELECT *
FROM Customers AS Client;


3. UNION (Products + Products_Discounted, только ProductName)

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;


4. INTERSECT (пересечение Products и Products_Discounted по имени)

SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;


5. Уникальные имена клиентов и страны

SELECT DISTINCT FirstName, LastName, Country
FROM Customers;


6. CASE: "High"/"Low" по цене

SELECT ProductName,
       Price,
       CASE 
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;


7. IIF: "Yes"/"No" по количеству на складе

SELECT ProductName,
       StockQuantity,
       IIF(StockQuantity > 100, 'Yes', 'No') AS StockCheck
FROM Products_Discounted;

1. UNION (ещё раз, как в easy)

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;


2. EXCEPT (разница: товары, которые есть в Products, но нет в Products_Discounted)

SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;


3. IIF "Expensive"/"Affordable"

SELECT ProductName,
       Price,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceLevel
FROM Products;


4. Найти сотрудников: Age < 25 или Salary > 60000
(У тебя нет таблицы Employees в структуре, но я пишу общий вид)

SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000;


5. Update зарплаты в HR или у EmployeeID = 5

UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'HR' OR EmployeeID = 5;

1. CASE: SaleAmount → Tier

SELECT SaleID,
       SaleAmount,
       CASE 
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS SaleCategory
FROM Sales;


2. EXCEPT: ID клиентов, оформивших заказ, но не имеющих продаж

SELECT DISTINCT CustomerID FROM Orders
EXCEPT
SELECT DISTINCT CustomerID FROM Sales;


3. CASE: скидка по количеству (Orders)

SELECT CustomerID,
       Quantity,
       CASE
           WHEN Quantity = 1 THEN '3%'
           WHEN Quantity BETWEEN 2 AND 3 THEN '5%'
           ELSE '7%'
       END AS Discount
FROM Orders;
