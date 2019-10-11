use db_zooTest
go

/*
 * CONVERT(varchar(50),@totalHab) = This is converting the data type from Money to Strin Characters
 * char(9) = line break
 * char(13) = tab key
 */
 DECLARE @totalHab MONEY;
 DECLARE @totalNut MONEY;
 DECLARE @results MONEY;
 SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
 SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
 SET @results = (@totalHab + @totalNut)
 PRINT (
	CONVERT(varchar(50),@totalHab) + char(9) + ' - The Total Habitat Cost' + char(13) +
	CONVERT(varchar(50),@totalNut) + char(9) + char(9) + ' - The Total Nutrition Cost' + char(13) + '----------' + char(13) +
	CONVERT(varchar(50),@results)
);