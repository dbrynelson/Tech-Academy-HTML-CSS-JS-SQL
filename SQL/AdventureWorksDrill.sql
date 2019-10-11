USE AdventureWorks
GO

CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

select * from HumanResources.Employee

select * from Sales.SalesPerson;
select * from Sales.SalesTerritory;
select * from Sales.Store;


CREATE PROCEDURE stopro_TerrStores @SalesID nvarchar(30), @TerID nvarchar(30)
AS
SELECT
		a1.BusinessEntityID as 'Sales Person ID:', a2.name as 'Territory:', a3.name as 'Store Name:'

		FROM Sales.SalesPerson a1
		INNER JOIN Sales.SalesTerritory a2 ON a2.TerritoryID = a1.TerritoryID
		INNER JOIN Sales.Store a3 on a3.SalesPersonID = a1.BusinessEntityID
		WHERE a1.BusinessEntityID = @SalesID
		AND a1.TerritoryID = @TerID
		GO
	;

exec stopro_TerrStores @SalesID = 280, @TerId = 1