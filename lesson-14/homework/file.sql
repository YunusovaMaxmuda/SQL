
SELECT 
    Id,
    LTRIM(RTRIM(LEFT(Name, CHARINDEX(',', Name) - 1))) AS Name,
    LTRIM(RTRIM(SUBSTRING(Name, CHARINDEX(',', Name) + 1, LEN(Name)))) AS Surname
FROM TestMultipleColumns;


SELECT *
FROM TestPercent
WHERE Strs LIKE '%[%]%';



SELECT 
    Id,
    PARSENAME(REPLACE(Vals, '.', '.'), 2) AS Part1,
    PARSENAME(REPLACE(Vals, '.', '.'), 1) AS Part2
FROM Splitter;





SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;



SELECT 
    texts,
    LEN(texts) - LEN(REPLACE(texts, ' ', '')) AS SpaceCount
FROM CountSpaces;



SELECT e.Name AS Employee, e.Salary AS EmpSalary, m.Name AS Manager, m.Salary AS ManagerSalary
FROM Employee e
JOIN Employee m ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;



SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 15;



SELECT w1.Id, w1.RecordDate, w1.Temperature
FROM weather w1
JOIN weather w2 
    ON DATEADD(DAY, -1, w1.RecordDate) = w2.RecordDate
WHERE w1.Temperature > w2.Temperature;



SELECT 
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;



SELECT 
    TRIM(value) AS third_fruit
FROM fruits
CROSS APPLY STRING_SPLIT(fruit_list, ',')
WHERE ordinal = 3;  -- SQL Server 2022+ supports 'ordinal' column



SELECT 
    LTRIM(RTRIM(PARSENAME(REPLACE(fruit_list, ',', '.'), 2))) AS third_item
FROM fruits;



SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    CASE 
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 5 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 20 THEN 'Senior'
        ELSE 'Veteran'
    END AS EmploymentStage
FROM Employees;



SELECT 
    Id,
    LEFT(VALS, PATINDEX('%[^0-9]%', VALS + 'X') - 1) AS IntegerValue
FROM GetIntegers
WHERE VALS IS NOT NULL AND VALS LIKE '[0-9]%';



SELECT 
    Id,
    STUFF(Vals, 1, 1, SUBSTRING(Vals, CHARINDEX(',', Vals) + 1, 1)) AS Swapped
FROM MultipleVals;



DECLARE @str VARCHAR(100) = 'sdgfhsdgfhs@121313131';

WITH Numbers AS (
    SELECT TOP (LEN(@str)) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
)
SELECT SUBSTRING(@str, n, 1) AS Character
FROM Numbers;



SELECT 
    player_id,
    device_id
FROM Activity a
WHERE event_date = (
    SELECT MIN(event_date) 
    FROM Activity 
    WHERE player_id = a.player_id
);



DECLARE @s VARCHAR(100) = 'rtcfvty34redt';

SELECT 
    @s AS Original,
    LEFT(@s, PATINDEX('%[0-9]%', @s + 'X') - 1) AS CharsBeforeNumber,
    SUBSTRING(@s, PATINDEX('%[0-9]%', @s + 'X'), LEN(@s)) AS NumbersAndAfter;
