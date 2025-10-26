
SELECT 
    E.Name AS EmployeeName,
    E.Salary,
    D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > 50000;

SELECT 
    C.FirstName,
    C.LastName,
    O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE YEAR(O.OrderDate) = 2023;



SELECT 
    E.Name AS EmployeeName,
    D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID;



SELECT 
    S.SupplierName,
    P.ProductName
FROM Suppliers S
LEFT JOIN Products P ON S.SupplierID = P.SupplierID;



SELECT 
    O.OrderID,
    O.OrderDate,
    P.PaymentDate,
    P.Amount
FROM Orders O
FULL OUTER JOIN Payments P ON O.OrderID = P.OrderID;



SELECT 
    E.Name AS EmployeeName,
    M.Name AS ManagerName
FROM Employees E
LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;



SELECT 
    S.Name AS StudentName,
    C.CourseName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON C.CourseID = E.CourseID
WHERE C.CourseName = 'Math 101';



SELECT 
    C.FirstName,
    C.LastName,
    O.Quantity
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.Quantity > 3;



SELECT 
    E.Name AS EmployeeName,
    D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Human Resources';



SELECT 
    D.DepartmentName,
    COUNT(E.EmployeeID) AS EmployeeCount
FROM Departments D
JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 5;



SELECT 
    P.ProductID,
    P.ProductName
FROM Products P
LEFT JOIN Orders O ON P.ProductID = O.ProductID
WHERE O.OrderID IS NULL;



SELECT 
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName;



SELECT 
    E.Name AS EmployeeName,
    D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;



SELECT 
    E1.Name AS Employee1,
    E2.Name AS Employee2,
    E1.ManagerID
FROM Employees E1
JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
WHERE E1.EmployeeID < E2.EmployeeID;



SELECT 
    O.OrderID,
    O.OrderDate,
    C.FirstName,
    C.LastName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE YEAR(O.OrderDate) = 2022;



SELECT 
    E.Name AS EmployeeName,
    E.Salary,
    D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sales'
  AND E.Salary > 60000;



SELECT 
    O.OrderID,
    O.OrderDate,
    P.PaymentDate,
    P.Amount
FROM Orders O
JOIN Payments P ON O.OrderID = P.OrderID;



SELECT 
    P.ProductID,
    P.ProductName
FROM Products P
LEFT JOIN Orders O ON P.ProductID = O.ProductID
WHERE O.ProductID IS NULL;



SELECT 
    E.Name AS EmployeeName,
    E.Salary
FROM Employees E
WHERE E.Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = E.DepartmentID
);



SELECT 
    O.OrderID,
    O.OrderDate
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE O.OrderDate < '2020-01-01'
  AND P.PaymentID IS NULL;



SELECT 
    P.ProductID,
    P.ProductName
FROM Products P
LEFT JOIN Categories C ON P.Category = C.CategoryID
WHERE C.CategoryID IS NULL;



SELECT 
    E1.Name AS Employee1,
    E2.Name AS Employee2,
    E1.ManagerID,
    E1.Salary
FROM Employees E1
JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
WHERE E1.EmployeeID < E2.EmployeeID
  AND E1.Salary > 60000;



SELECT 
    E.Name AS EmployeeName,
    D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName LIKE 'M%';



SELECT 
    O.OrderID AS SaleID,
    P.ProductName,
    O.TotalAmount AS SaleAmount
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
WHERE O.TotalAmount > 500;



SELECT 
    S.StudentID,
    S.Name AS StudentName
FROM Students S
WHERE S.StudentID NOT IN (
    SELECT E.StudentID
    FROM Enrollments E
    JOIN Courses C ON E.CourseID = C.CourseID
    WHERE C.CourseName = 'Math 101'
);


SELECT 
    O.OrderID,
    O.OrderDate,
    P.PaymentID
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.PaymentID IS NULL;


SELECT 
    P.ProductID,
    P.ProductName,
    C.CategoryName
FROM Products P
JOIN Categories C ON P.Category = C.CategoryID
WHERE C.CategoryName IN ('Electronics', 'Furniture');
