SELECTSalesOrderID,CustomerID,SalesPersonID,TerritoryID,YEAR(OrderDate)
AS CurrentYear,YEAR(OrderDate) +1AS NextYear
FROMSales.SalesOrderHeader