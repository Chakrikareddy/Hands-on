-- Create Database
CREATE DATABASE CompanyDB;
GO

-- Use Database
USE CompanyDB;
GO

-- Create Employee Table
CREATE TABLE Employee
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    MonthlySalary DECIMAL(10,2)
);
GO

-- Insert Sample Data
INSERT INTO Employee VALUES
(1,'Rahul',30000),
(2,'Priya',45000),
(3,'Amit',55000),
(4,'Sneha',40000),
(5,'Kiran',35000);
GO

-- Create Scalar Function
CREATE FUNCTION fn_CalculateAnnualSalary
(
    @EmployeeID INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @AnnualSalary DECIMAL(10,2);

    SELECT @AnnualSalary = MonthlySalary * 12
    FROM Employee
    WHERE EmployeeID = @EmployeeID;

    RETURN @AnnualSalary;
END;
GO

-- Execute the Function for EmployeeID = 1
SELECT dbo.fn_CalculateAnnualSalary(1) AS AnnualSalary;
GO

-- Verify Employee Data
SELECT * FROM Employee;
GO