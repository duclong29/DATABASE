Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@duclong29 
DinhVietHoang07
/
SQL
1
00
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
SQL/Lab 5/Bai 4.sql
@DinhVietHoang07
DinhVietHoang07 Lab 5
Latest commit 9f8531c 6 hours ago
 History
 1 contributor
51 lines (39 sloc)  700 Bytes
  

--A--
CREATE TABLE Temp(
Name_order varchar(50),
Date_order datetime
)
Go

drop table Temp
Go

SELECT *FROM Temp
go
INSERT INTO Temp (Name_Order, Date_order)
	SELECT Name_order, Date_order FROM Order_one
	go



--B--
CREATE TABLE List(
Species varchar(50)

)
Go
drop table List
Go

SELECT *FROM List
go

INSERT INTO List (Species)
	SELECT Species FROM Category_one
	go


--C--
CREATE TABLE List_order(
Code_order int,
Name_order varchar(50),
address nvarchar (199),
Number_Phone int,
Date_order datetime
)
Go

SELECT *FROM List_order
go
INSERT INTO List_order(Code_order,Name_Order,address,Number_Phone, Date_order)
	SELECT Code_order,Name_Order,address,Number_Phone, Date_order FROM  Order_one
	go
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
