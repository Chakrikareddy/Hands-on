-- Create Database
CREATE DATABASE EmployeeManagementDB;
GO

-- Use Database
USE EmployeeManagementDB;
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
('Sneha','Patel',3,50000,'2020-11-05');
GO

-- Stored Procedure to Retrieve Employees by Department
CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- Stored Procedure to Insert Employee
CREATE PROCEDURE sp_InsertEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @JoinDate);
END;
GO

-- Execute Insert Stored Procedure
EXEC sp_InsertEmployee
    'Anjali',
    'Verma',
    2,
    55000,
    '2024-06-15';
GO

-- Execute Retrieve Stored Procedure
EXEC sp_GetEmployeesByDepartment 2;
GO

-- Display All Employees
SELECT * FROM Employees;
GO