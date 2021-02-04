---Bảng Categories
CREATE TABLE Categories(
CateID char(6) PRIMARY KEY,
CateName nvarchar(100) not null,
Description nvarchar(200)
)
GO
INSERT INTO Categories(CateID,CateName,Description) VALUES (123,'RAM','information')
INSERT INTO Categories(CateID,CateName,Description) VALUES (124,'CPU','information')
INSERT INTO Categories(CateID,CateName,Description) VALUES (125,'HDD','information')
INSERT INTO Categories(CateID,CateName,Description) VALUES (126,'RAM','information')
INSERT INTO Categories(CateID,CateName,Description) VALUES (127,'CPU','information')
GO
SELECT * FROM Categories
GO
--- Bảng Parts
CREATE TABLE Parts(
PartID int IDENTITY PRIMARY KEY,
PartName nvarchar(100) not null,
CateID char(6),
Description nvarchar(1000),
Price money not null default'0',
Quantity int default'0',
Warranty int default'1',
Photo nvarchar(200) Default'photo/nophoto.png',
CONSTRAINT CL FOREIGN KEY(CateID) REFERENCES Categories(CateID)
)
GO
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
VALUES ('mahine',123,'Detiled',$100,29,06,'ig')
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
VALUES ('mhine',124,'Detailed',$10,00,97,'img')
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
VALUES ('macne',125,'Detaied',$70,28,05,'im')
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
VALUES ('mahine',126,'Dtailed',$200,29,20,'rimg')
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
VALUES ('achine',127,'etailed',$30,27,04,'iog')
GO
SELECT * FROM Parts
GO
-- 4 list all part in the store with price > 100$
SELECT * FROM Parts
WHERE Price >$100;
GO
-- 5 list all part of the category 'CPU'
SELECT * FROM Categories
WHERE CateName='CPU'
GO
--6 Create a view_part contains the following information(partID,PartNAme,CateName,Price,Quantity) from table parts and Category
CREATE VIEW v_Parts AS
SELECT PartID, PartName,CateName,Price, Quantity
FROM Parts, Categories
GO

SELECT * FROM v_Parts
GO

--7 Create a view_TopParts about 5 parts with the most expensive price
CREATE VIEW v_TopPartsID AS
SELECT TOP(5) Price
FROM Parts
WHERE Price > 0
ORDER BY Price ASC
Go

SELECT Price FROM Parts
GO