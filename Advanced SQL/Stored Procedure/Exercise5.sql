-- Create Database
CREATE DATABASE OfficeDB;
GO

-- Use Database
USE OfficeDB;
GO

-- Create Employees Table
CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE
);
GO

-- Insert Sample Data
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
VALUES
('Rahul','Sharma',1,35000,'2022-01-15'),
('Priya','Reddy',2,45000,'2021-03-20'),
('Amit','Kumar',1,40000,'2023-02-10'),
('Sneha','Patel',3,50000,'2020-11-05'),
('Kiran','Singh',2,38000,'2024-01-18'),
('Anjali','Verma',2,42000,'2023-07-12');
GO

-- Create Stored Procedure to Return Total Employees in a Department
CREATE PROCEDURE sp_CountEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- Execute the Stored Procedure
EXEC sp_CountEmployeesByDepartment 2;
GO

-- Display All Employees
SELECT * FROM Employees;
GO