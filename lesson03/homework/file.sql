Define and explain the purpose of BULK INSERT in SQL Server

BULK INSERT is a command used to quickly load large amounts of data from an external file (such as .csv, .txt, or .dat) into a SQL Server table.

It’s much faster than inserting row by row.

Useful for ETL (Extract, Transform, Load) operations.
Example:

BULK INSERT Products
FROM 'C:\Data\products.csv'
WITH (
    FIELDTERMINATOR = ',',  -- columns separated by commas
    ROWTERMINATOR = '\n',   -- new line for each row
    FIRSTROW = 2            -- skip header row
);

2. List four file formats that can be imported into SQL Server

CSV (Comma-Separated Values)

TXT (Text files with delimiters)

Excel files (.xls, .xlsx)

XML / JSON files

3. Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

4. Insert three records into Products
INSERT INTO Products (ProductID, ProductName, Price) 
VALUES (1, 'Laptop', 1200.50);

INSERT INTO Products (ProductID, ProductName, Price) 
VALUES (2, 'Phone', 800.00);

INSERT INTO Products (ProductID, ProductName, Price) 
VALUES (3, 'Headphones', 150.75);

5. Difference between NULL and NOT NULL

NULL: A column can store no value (unknown / missing data).

NOT NULL: A column must always have a value, cannot be left blank.

ProductName VARCHAR(50) NOT NULL   -- must always contain a name
Price DECIMAL(10,2) NULL           -- can allow missing value

6. Add UNIQUE constraint to ProductName
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

7. Write a comment in SQL query
-- This query selects all products with price greater than 500
SELECT * FROM Products
WHERE Price > 500;

8. Add CategoryID column to Products
ALTER TABLE Products
ADD CategoryID INT;

9. Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

10. Purpose of IDENTITY column in SQL Server

The IDENTITY property automatically generates sequential numeric values for a column (usually primary key).

Removes need for manual INSERT of IDs.

You can define start value and increment.

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1001,1) PRIMARY KEY, -- starts at 1001, increments by 1
    Name VARCHAR(50) NOT NULL
);

1. Use BULK INSERT to import data from a text file into Products
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',   -- Columns separated by commas
    ROWTERMINATOR = '\n',    -- Each row on new line
    FIRSTROW = 2             -- Skip header row if present
);

2. Create a FOREIGN KEY in Products table referencing Categories
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

3. Differences between PRIMARY KEY and UNIQUE KEY

PRIMARY KEY

Ensures uniqueness of values.

Cannot contain NULL values.

Only one primary key per table.

UNIQUE KEY

Also ensures uniqueness.

Can contain one NULL value.

A table can have multiple unique keys.

4. Add a CHECK constraint ensuring Price > 0
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

5. Modify Products table to add Stock column
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

6. Use ISNULL to replace NULL values in Price with 0
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

7. Purpose of FOREIGN KEY in SQL Server

A foreign key ensures referential integrity between two tables.

It prevents inserting values in the child table that do not exist in the parent table.

Example: Products.CategoryID must exist in Categories.CategoryID.

1. Create Customers table with CHECK constraint (Age >= 18)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18)
);

2. Create a table with IDENTITY column (start=100, increment=10)
CREATE TABLE InvoiceNumbers (
    InvoiceID INT IDENTITY(100, 10) PRIMARY KEY,
    Description VARCHAR(100)
);

3. Create a composite PRIMARY KEY in OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)  -- Composite key
);

4. Explain COALESCE vs ISNULL

ISNULL(expression, replacement) → replaces NULL with the given replacement. Works only with 2 arguments.

COALESCE(expr1, expr2, expr3, …) → returns the first non-NULL value from the list of arguments. Supports multiple values.


SELECT ISNULL(NULL, 'Default');        -- returns 'Default'
SELECT COALESCE(NULL, NULL, 'Hello');  -- returns 'Hello'

5. Create Employees table with PRIMARY KEY and UNIQUE KEY
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

6. Create FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

















