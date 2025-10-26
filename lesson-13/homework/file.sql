SELECT CONCAT(EMPLOYEE_ID, '-', FIRST_NAME, ' ', LAST_NAME) AS EmployeeInfo
FROM Employees
WHERE EMPLOYEE_ID = 100;

UPDATE Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999');


SELECT 
  FIRST_NAME AS "First Name",
  LENGTH(FIRST_NAME) AS "Name Length"
FROM Employees
WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'J%' OR FIRST_NAME LIKE 'M%'
ORDER BY FIRST_NAME;

SELECT 
  MANAGER_ID,
  SUM(SALARY) AS Total_Salary
FROM Employees
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID;

SELECT 
  Year,
  GREATEST(Max1, Max2, Max3) AS HighestValue
FROM TestMax;


SELECT *
FROM cinema
WHERE MOD(id, 2) = 1 AND description <> 'boring'
ORDER BY id DESC;

SELECT *
FROM SingleOrder
ORDER BY (Id = 0), Id;

SELECT 
  COALESCE(column1, column2, column3, column4) AS FirstNonNullValue
FROM person;

SELECT 
  SUBSTRING_INDEX(FullName, ' ', 1) AS FirstName,
  SUBSTRING_INDEX(SUBSTRING_INDEX(FullName, ' ', 2), ' ', -1) AS MiddleName,
  SUBSTRING_INDEX(FullName, ' ', -1) AS LastName
FROM Students;

SELECT *
FROM Orders
WHERE CustomerID IN (
  SELECT DISTINCT CustomerID
  FROM Orders
  WHERE DeliveryState = 'California'
)
AND DeliveryState = 'Texas';

SELECT GROUP_CONCAT(ValueColumn ORDER BY ValueColumn SEPARATOR ', ') AS ConcatenatedValues
FROM DMLTable;



SELECT *
FROM Employees
WHERE (
  LENGTH(CONCAT(FIRST_NAME, LAST_NAME)) 
  - LENGTH(REPLACE(LOWER(CONCAT(FIRST_NAME, LAST_NAME)), 'a', ''))
) >= 3;

SELECT 
  DEPARTMENT_ID,
  COUNT(*) AS TotalEmployees,
  100.0 * SUM(CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) / COUNT(*) AS PctOver3Years
FROM Employees
GROUP BY DEPARTMENT_ID;

SELECT 
  StudentID,
  Marks,
  SUM(Marks) OVER (ORDER BY StudentID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeSum
FROM Students;

SELECT s1.StudentID, s1.StudentName, s1.BirthDate
FROM Students s1
JOIN Students s2
  ON s1.BirthDate = s2.BirthDate AND s1.StudentID <> s2.StudentID
ORDER BY s1.BirthDate;

SELECT 
  LEAST(PlayerA, PlayerB) AS Player1,
  GREATEST(PlayerA, PlayerB) AS Player2,
  SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY LEAST(PlayerA, PlayerB), GREATEST(PlayerA, PlayerB);
