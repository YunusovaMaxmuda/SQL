SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;
SELECT AVG(Price) AS AvgPrice_Electronics
FROM Products
WHERE Category = 'Electronics';
SELECT *
FROM Customers
WHERE City LIKE 'L%';
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';

SELECT *
FROM Customers
WHERE Country LIKE '%A';
SELECT MAX(Price) AS HighestPrice
FROM Products;
SELECT 
    ProductName,
    StockQuantity,
    CASE 
        WHEN StockQuantity < 30 THEN 'Low Stock'
        ELSE 'Sufficient'
    END AS StockStatus
FROM Products;
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;
SELECT 
    MIN(Quantity) AS MinQuantity,
    MAX(Quantity) AS MaxQuantity
FROM Orders;
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE YEAR(o.OrderDate) = 2023 
  AND MONTH(o.OrderDate) = 1
  AND o.CustomerID NOT IN (
        SELECT DISTINCT CustomerID
        FROM Invoices
        WHERE YEAR(InvoiceDate) = 2023 
          AND MONTH(InvoiceDate) = 1
    );
    SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
SELECT 
    YEAR(OrderDate) AS OrderYear,
    AVG(TotalAmount) AS AvgOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
SELECT 
    ProductName,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        ELSE 'High'
    END AS PriceGroup
FROM Products;
SELECT *
INTO Population_Each_Year
FROM (
    SELECT District_Name, Population, Year
    FROM City_Population
) AS src
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS pvt;
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';
SELECT *
INTO Population_Each_City
FROM (
    SELECT Year, District_Name, Population
    FROM City_Population
) AS src
PIVOT (
    SUM(Population)
    FOR District_Name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS pvt;

SELECT TOP 3 CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;
SELECT District_Name, '2012' AS Year, [2012] AS Population FROM Population_Each_Year
UNION ALL
SELECT District_Name, '2013' AS Year, [2013] AS Population FROM Population_Each_Year;
SELECT 
    p.ProductName,
    COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TimesSold DESC;
SELECT 'Bektemir' AS District_Name, Year, [Bektemir] AS Population FROM Population_Each_City
UNION ALL
SELECT 'Chilonzor', Year, [Chilonzor] FROM Population_Each_City
UNION ALL
SELECT 'Yakkasaroy', Year, [Yakkasaroy] FROM Population_Each_City;





























