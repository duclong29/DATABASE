CREATE DATABASE Lab11
GO
USE Lab11
CREATE VIEW ProductList_01
AS
SELECT ProductID, Name FROM AdventureWorks2019.Production.Product
GO
SELECT * FROM ProductList_01
GO
-- bai 2
CREATE VIEW SalesOrderDetail_02
AS
SELECT pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
od.UnitPrice*od.OrderQty AS [Total Price]
FROM AdventureWorks2019.Sales.SalesOrderDetail od
JOIN AdventureWorks2019.Production.Product pr
ON od.ProductID = pr.ProductID
GO
SELECT * FROM SalesOrderDetail
GO
--bai 3
-- tao khung nhin lay ra thong tin co ban trong bang Person.Contact
USE AdventureWorks2019
GO
CREATE VIEW V_Contact_Info As
SELECT FirstName, MiddleName, LastName
FROM Person.Person
GO
-- tao khung nhin lay ra thong tin ve nhan vien
CREATE VIEW V_Employee_Contact_01 AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID ;
GO
--xem mot khung nhin
SELECT * FROM V_Employee_Contact_01
GO
-- thay doi khung nhin V_Employee_Contact_01 bang viet them cot Birthdate
ALTER VIEW V_Employee_Contact_01 AS 
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate, e.Birthdate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName LIKE '%B%';
GO
-- xoa mot khung nhin
DROP VIEW V_Contact_info
GO
--xem dinh nghia khung nhin V_Employee_Contact_01
EXECUTE sp_helptext 'V_Employee_Contact_01'
GO
--xem cac thanh phan ma khung nhin phu thuoc
EXECUTE sp_depends 'V_Employee_Contact_01'
GO
--tao khung nhin an ma dinh nghia bi an (khong xem duoc dinh nghia khung nhin)
CREATE VIEW OrderRejects_01
WITH ENCRYPTION
AS
SELECT PurchaseOrderID, ReceivedQty, RejectedQty,
RejectedQty / ReceivedQty AS RejectRatio, DueDate
FROM Purchasing.PurchaseOrderDetail
WHERE RejectedQty / ReceivedQty > 0
AND DueDate > CONVERT(DATETIME,'20000629',101) ;
--khong xem duoc dinh nghia khung nhin V_Contact_info
sp_helptext 'OrderRejects'
GO
-- thay doi khung nhin them tuy chon CHECK OPTION
ALTER VIEW V_EMployee_Contact_01 AS 
SELECT p.FirstName, p.LastName, e.BusinessENTITYID, e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName LIKE 'A%'
WITH CHECK OPTION
GO
SELECT * FROM V_EMployee_Contact_01
GO
--cap nhat duoc khung nhin khi FirstName bat dau bang ki tu 'A'
UPDATE V_EMployee_Contact_01 SET FirstName = 'Atest' WHERE LastName = 'Amy'
GO
--khong cap nhat duoc khung nhin khi FirstName bat dau bang ki tu khac A
UPDATE V_EMployee_Contact_01 SET FirstName = 'BCD' WHERE LastName = 'Atest'
GO
--phai xoa khung nhin truoc
DROP VIEW V_EMployee_Contact_01
GO
-- tao khung nhin co gian do
CREATE VIEW V_Contact_Info WITH SCHEMABINDING AS
SELECT FirstName, MiddleName, LastName,EmailAddress
FROM Person.Contact 
GO
--khong the truy van duoc khkung nhin co ten la V_Contact_Info
SELECT * FROM V_Contact_Info
GO
--tao chi muc duy nhat tren cot EmailAddress tren khung nhin V_Contact_Info
CREATE UNIQUE CLUSTERED INDEX IX_Contact_Email
ON V_Contact_Info(EmailAddress)
GO
--thuc hien doi ten khug nhin
exec sp_rename V_Contact_Info, V_Contact_Infomation
--truy van khung nhin 
SELECT * FROM V_Contact_Infomation
--kjong the them ban ghi van khung nhin
--vico cot khong cho phep null trong bang contact
INSERT INTO V_Contact_Infomation values (0
--khoong the coa ban ghi cua khung nhin V_Contact_Infomation
DELETE FROM V_Contact_Infomation WHERE LastName = 'Gilert' and FirstName = 'Guy'
GO