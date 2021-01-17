SELECT SalesPersonID, YEAR (OrderDate) AS orderyear
FROM Sales.SalessOrderHeader
WHERE CustomerId = 30084
GROUP BY SalesPersonID,YEAR(OrderDate)
HAVINGCOUNT(*) > 1
ORDER BY SalesPersonID,OrderYear;