-- Create Database
CREATE DATABASE ShoppingDB;
GO

-- Use Database
USE ShoppingDB;
GO

-- Create Table
CREATE TABLE Items
(
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(50),
    ItemCategory VARCHAR(30),
    ItemPrice DECIMAL(10,2)
);
GO

-- Insert Data
INSERT INTO Items VALUES
(1,'Apple iPhone','Mobiles',75000),
(2,'Samsung Galaxy','Mobiles',65000),
(3,'OnePlus','Mobiles',65000),
(4,'Realme','Mobiles',25000),

(5,'Leather Wallet','Accessories',1800),
(6,'Hand Bag','Accessories',2500),
(7,'Travel Bag','Accessories',2500),
(8,'Belt','Accessories',900),

(9,'Study Table','Home',9000),
(10,'Office Chair','Home',6000),
(11,'Sofa Set','Home',30000),
(12,'King Size Bed','Home',30000);
GO

-- Display Data
SELECT * FROM Items;
GO

-- ROW_NUMBER()
SELECT
    ItemID,
    ItemName,
    ItemCategory,
    ItemPrice,
    ROW_NUMBER() OVER(
        PARTITION BY ItemCategory
        ORDER BY ItemPrice DESC
    ) AS Row_Number
FROM Items;
GO

-- RANK()
SELECT
    ItemID,
    ItemName,
    ItemCategory,
    ItemPrice,
    RANK() OVER(
        PARTITION BY ItemCategory
        ORDER BY ItemPrice DESC
    ) AS Rank_Number
FROM Items;
GO

-- DENSE_RANK()
SELECT
    ItemID,
    ItemName,
    ItemCategory,
    ItemPrice,
    DENSE_RANK() OVER(
        PARTITION BY ItemCategory
        ORDER BY ItemPrice DESC
    ) AS Dense_Rank
FROM Items;
GO

-- Top 3 Most Expensive Items in Each Category
SELECT *
FROM
(
    SELECT
        ItemID,
        ItemName,
        ItemCategory,
        ItemPrice,
        ROW_NUMBER() OVER(
            PARTITION BY ItemCategory
            ORDER BY ItemPrice DESC
        ) AS Row_Number
    FROM Items
) AS RankedItems
WHERE Row_Number <= 3;
GO