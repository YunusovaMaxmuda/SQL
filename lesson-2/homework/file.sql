1. Create Employees table
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

2. Insert three records (different methods)

Single-row insert

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Alice', 6000.00);


Another single-row insert

INSERT INTO Employees
VALUES (2, 'Bob', 5500.00);


Multiple-row insert

INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
  (3, 'Charlie', 4800.00),
  (4, 'Diana', 7200.00);

3. Update salary
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;

4. Delete record
DELETE FROM Employees
WHERE EmpID = 2;

5. Difference between DELETE, TRUNCATE, DROP

DELETE – removes specific rows from a table (can use WHERE). Structure remains. Logged operation.

TRUNCATE – removes all rows from a table quickly, but keeps structure. No WHERE. Minimal logging.

DROP – deletes the entire table structure and its data permanently.

6. Modify Name column to VARCHAR(100)
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

7. Add Department column
ALTER TABLE Employees
ADD Department VARCHAR(50);

8. Change Salary column to FLOAT
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

9. Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

10. Remove all records but keep structure
TRUNCATE TABLE Employees;

1. Insert five records into the Departments table using INSERT INTO SELECT
-- First, create a temp table with sample data
CREATE TABLE TempDepartments (DepartmentID INT, DepartmentName VARCHAR(50));

INSERT INTO TempDepartments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Operations');

-- Now insert into Departments from TempDepartments
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT DepartmentID, DepartmentName FROM TempDepartments;

-- Drop temp table (optional cleanup)
DROP TABLE TempDepartments;

2. Update Department of all employees where Salary > 5000 to 'Management'
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

3. Remove all employees but keep the table structure intact
TRUNCATE TABLE Employees;

4. Drop the Department column from Employees table
ALTER TABLE Employees
DROP COLUMN Department;

5. Rename Employees table to StaffMembers
EXEC sp_rename 'Employees', 'StaffMembers';

6. Remove Departments table completely
DROP TABLE Departments;


1. Create Products table with 5+ columns
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Supplier VARCHAR(100)
);

2. Add CHECK constraint for Price > 0
ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);

3. Add StockQuantity column with DEFAULT 50
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

4. Rename Category to ProductCategory
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

5. Insert 5 records into Products
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Supplier)
VALUES 
(20001, 'Laptop', 'Electronics', 1200.00, 'Dell'),
(20002, 'Phone', 'Electronics', 800.00, 'Samsung'),
(20003, 'Chair', 'Furniture', 150.00, 'IKEA'),
(20004, 'Shoes', 'Apparel', 90.00, 'Nike'),
(20005, 'Book', 'Stationery', 20.00, 'Penguin');

6. Create Products_Backup using SELECT INTO
SELECT * INTO Products_Backup
FROM Products;

7. Rename Products table to Inventory
EXEC sp_rename 'Products', 'Inventory';

8. Change data type of Price from DECIMAL(10,2) to FLOAT
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

9. Add IDENTITY column ProductCode (start=1000, increment=5)
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5);
