-- Create Database
CREATE DATABASE StaffDB;
GO

-- Use Database
USE StaffDB;
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
('Kiran','Singh',2,38000,'2024-01-18');
GO

-- Create Stored Procedure
CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- Execute Stored Procedure for DepartmentID = 2
EXEC sp_GetEmployeesByDepartment 2;
GO

-- Display All Employees
SELECT * FROM Employees;
GO