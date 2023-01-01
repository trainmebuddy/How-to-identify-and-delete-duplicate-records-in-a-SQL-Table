--How to find duplicate in a SQL Table and delete duplicate records using SQL query 
--where a Unique Row ID or a Identity Column exists
--and where a Unique Row ID or a Identity Column does NOT

--METHOD 1: Delete rows using GROUP BY and HAVING clause where Unique Row ID or a Identity Column exists
--SELECT * into dbo.Customer_bkp_WithDuplicate FROM dbo.Customer
SELECT * FROM dbo.Customer
--Step1: Check if any duplicate data exists
SELECT FirstName, LastName, Email, State, COUNT(*) AS DuplicateCount
FROM dbo.Customer
GROUP BY FirstName, LastName, Email, State
HAVING COUNT(*) >1
--IN THIS OUTPUT WE HAVE 2 DUPLICATE ROWS FOR CUSTOMER Harish and Pamelia
--Harish is having 3 duplicate rows and Pamelia is having 2 duplicate rows

--Step2: DELETE DUPLICATE DATA
DELETE
--SELECT *
FROM dbo.Customer
WHERE ID NOT IN(
SELECT MAX(ID)
FROM dbo.Customer
GROUP BY FirstName, LastName, Email, State
)

--Step3: Verify if duplicate rows exists
SELECT * FROM dbo.Customer

SELECT FirstName, LastName, Email, State, COUNT(*) AS DuplicateCount
FROM dbo.Customer
GROUP BY FirstName, LastName, Email, State
HAVING COUNT(*) >1

/*
TRUNCATE TABLE dbo.Customer
INSERT INTO dbo.Customer
SELECT FirstName, LastName, Email, State FROM dbo.Customer_bkp_WithDuplicate
*/
SELECT * FROM dbo.Customer

--METHOD 2: DELETE ROWS USING RANK FUNCTION
--CHECK DATA
SELECT * FROM dbo.Customer

--Step1: Check if any duplicate data exists
SELECT FirstName, LastName, Email, State, COUNT(*) AS DuplicateCount
FROM dbo.Customer
GROUP BY FirstName, LastName, Email, State
HAVING COUNT(*) >1

--Step2: Rank duplicate records
SELECT *, RANK() OVER (PARTITION BY FirstName, LastName, Email, State ORDER BY ID) AS RNK
FROM dbo.Customer

--Step3: Delete duplicate records
DELETE C
--SELECT C.*, t.RNK
FROM dbo.Customer AS C
INNER JOIN
(SELECT *, RANK() OVER (PARTITION BY FirstName, LastName, Email, State ORDER BY ID) AS RNK
FROM dbo.Customer
) AS T ON C.ID = t.ID 
WHERE T.RNK >1

--Step4: Verify if duplicate rows exists
SELECT * FROM dbo.Customer

SELECT FirstName, LastName, Email, State, COUNT(*) AS DuplicateCount
FROM dbo.Customer
GROUP BY FirstName, LastName, Email, State
HAVING COUNT(*) >1

/*
TRUNCATE TABLE dbo.Customer1
INSERT INTO dbo.Customer1
SELECT FirstName, LastName, Email, State FROM dbo.Customer_bkp_WithDuplicate
*/

--METHOD 3: DELETE RECORDS USING CTE AND ROW_NUMBER where a Unique Row ID or a Identity Column NOT exists
SELECT * FROM dbo.Customer1

--Step1: Check if any duplicate data exists
SELECT FirstName, LastName, Email, State, COUNT(*) AS DuplicateCount
FROM dbo.Customer1
GROUP BY FirstName, LastName, Email, State
HAVING COUNT(*) >1

--Step2: Get row number for each row of duplicate rows
;WITH CTE (FirstName, LastName, Email, State, RN) AS (
SELECT FirstName, LastName, Email, State
,ROW_NUMBER() OVER (PARTITION BY FirstName, LastName, Email, State ORDER BY FirstName, LastName, Email, State) AS RN
FROM dbo.Customer1
)
SELECT * FROM CTE

--Step3: Delete duplicate rows
;WITH CTE (FirstName, LastName, Email, State, RN) AS (
SELECT FirstName, LastName, Email, State
,ROW_NUMBER() OVER (PARTITION BY FirstName, LastName, Email, State ORDER BY FirstName, LastName, Email, State) AS RN
FROM dbo.Customer1
)
DELETE
--SELECT * 
FROM CTE where RN>1

--Step4: Verify if duplicate rows exists
SELECT * FROM dbo.Customer1

SELECT FirstName, LastName, Email, State, COUNT(*) AS DuplicateCount
FROM dbo.Customer1
GROUP BY FirstName, LastName, Email, State
HAVING COUNT(*) >1
