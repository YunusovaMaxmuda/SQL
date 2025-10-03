Define the following terms

Data - qayta ishlanmaguncha ma'noga ega bo'lmasligi mumkin bo'lgan xom faktlar yoki raqamlar (masalan, raqamlar, matn, tasvirlar).

Database - oson kirish va olish uchun boshqariladigan, elektron shaklda saqlanadigan ma'lumotlarning uyushgan to'plami.

relational database - ma'lumotlarni jadvallarda (satr va ustunlar) saqlaydigan va kalitlar yordamida ular orasidagi munosabatlarni aniqlaydigan ma'lumotlar bazasi turi.

Table - satrlar (yozuvlar) va ustunlar (maydonlar) dan tashkil topgan ma'lumotlar bazasidagi tuzilgan format.


Five key features of SQL Server

1.Data Management 
2.Security 

3.High Availability & Disaster Recovery 

4.Integration & Business Intelligence Tools 

5.Performance & Scalability 


Authentication modes in SQL Server

1.Windows Authentication

2.SQL Server Authentication 



Create a new database in SSMS
CREATE DATABASE SchoolDB;
GO

Create Students table
USE SchoolDB;
GO

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
GO

Differences between SQL Server, SSMS, and SQL

SQL (Structured Query Language) → 

SQL Server → Microsoft’s Relational Database Management System (RDBMS) 

SSMS (SQL Server Management Studio) → A GUI tool that helps you interact with SQL Server, run queries, and manage databases.


SQL Command Categories
Category	Full Form	Purpose	Example
DQL	Data Query Language	Retrieve data	SELECT * FROM Students;
DML	Data Manipulation Language	Modify data	INSERT, UPDATE, DELETE
DDL	Data Definition Language	Define/alter schema	CREATE TABLE, ALTER, DROP
DCL	Data Control Language	Manage permissions	GRANT, REVOKE
TCL	Transaction Control Language	Manage transactions	BEGIN TRAN, COMMIT, ROLLBACK
Insert three records into Students table
INSERT INTO Students (StudentID, Name, Age)
VALUES 
  (1, 'Alice', 21),
  (2, 'Bob', 22),
  (3, 'Charlie', 23);

Steps to restore AdventureWorksDW2022.bak

Download AdventureWorksDW2022.bak from the official Microsoft GitHub link.

Copy the file to a folder accessible by SQL Server (e.g., C:\SQLBackups\).

Open SSMS and connect to your SQL Server instance.

Right-click Databases → Restore Database…

In the Source section, select Device, then browse and add the .bak file.

In the Destination section, enter the database name (e.g., AdventureWorksDW2022).

On the Files / Options tab, check file paths and select Overwrite (WITH REPLACE) if needed.

Click OK to restore.

T-SQL alternative:

RESTORE DATABASE AdventureWorksDW2022
FROM DISK = N'C:\SQLBackups\AdventureWorksDW2022.bak'
WITH 
  MOVE 'AdventureWorksDW2022' TO 'C:\SQLData\AdventureWorksDW2022.mdf',
  MOVE 'AdventureWorksDW2022_log' TO 'C:\SQLData\AdventureWorksDW2022.ldf',
  REPLACE,
  STATS = 10;









