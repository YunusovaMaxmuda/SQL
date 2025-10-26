SELECT ProductName, SupplierName
FROM Products
CROSS JOIN Suppliers;
SELECT DepartmentName, Name AS EmployeeName
FROM Departments
CROSS JOIN Employees;

SELECT S.SupplierName, P.ProductName
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID;

SELECT C.FirstName + ' ' + C.LastName AS CustomerName, O.OrderID
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID;


SELECT S.Name AS StudentName, C.CourseName
FROM Students S
CROSS JOIN Courses C;
SELECT P.ProductName, O.OrderID
FROM Products P
JOIN Orders O ON P.ProductID = O.ProductID;

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;


SELECT S.Name AS StudentName, E.CourseID
FROM Students S
JOIN Enrollments E ON S.StudentID = E.Student
  
SELECT O.OrderID, P.PaymentID, P.Amount
FROM Orders O
JOIN Payments P ON O.OrderID = P.OrderID;

SELECT O.OrderID, P.ProductName, P.Price
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
WHERE P.Price > 100;
SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
CROSS JOIN Departments D
WHERE E.DepartmentID <> D.DepartmentID;


SELECT O.OrderID, P.ProductName, O.Quantity, P.StockQuantity
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
WHERE O.Quantity > P.StockQuantity;

SELECT C.FirstName + ' ' + C.LastName AS CustomerName, O.ProductID
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.TotalAmount >= 500;

SELECT S.Name AS StudentName, C.CourseName
FROM Enrollments E
JOIN Students S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;


SELECT P.ProductName, S.SupplierName
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE S.SupplierName LIKE '%Tech%';

SELECT O.OrderID, O.TotalAmount, P.Amount
FROM Orders O
JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.Amount < O.TotalAmount;

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

SELECT P.ProductName, C.CategoryName
FROM Products P
JOIN Categories C ON P.Category = C.CategoryID
WHERE C.CategoryName IN ('Electronics', 'Furniture');

SELECT O.OrderID, C.FirstName + ' ' + C.LastName AS CustomerName, C.Country
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.Country = 'USA';

SELECT O.OrderID, C.FirstName + ' ' + C.LastName AS CustomerName, O.TotalAmount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.Country = 'Germany' AND O.TotalAmount > 100;

SELECT E1.Name AS Employee1, E2.Name AS Employee2
FROM Employees E1
JOIN Employees E2 ON E1.EmployeeID < E2.EmployeeID
WHERE E1.DepartmentID <> E2.DepartmentID;

SELECT P.PaymentID, O.OrderID, O.Quantity, PR.ProductName, PR.Price, P.Amount
FROM Payments P
JOIN Orders O ON P.OrderID = O.OrderID
JOIN Products PR ON O.ProductID = PR.ProductID
WHERE P.Amount <> (O.Quantity * PR.Price);

SELECT S.StudentID, S.Name
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.StudentID IS NULL;

SELECT M.Name AS ManagerName, E.Name AS EmployeeName, 
       M.Salary AS ManagerSalary, E.Salary AS EmployeeSalary
FROM Employees E
JOIN Employees M ON E.ManagerID = M.EmployeeID
WHERE M.Salary <= E.Salary;

SELECT C.FirstName + ' ' + C.LastName AS CustomerName, O.OrderID
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.OrderID IS NULL;

















