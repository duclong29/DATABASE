CREATE TABLE Customer(
CustomerID INT identity primary key,
CustomerName varchar(50),
Address varchar(100),
Phone varchar(12)
)
GO
DROP TABLE Customer
GO
INSERT INTO Customer(Customername,Address,Phone) VALUES ('chu duc long','tu xa','0343619450')
INSERT INTO Customer(Customername,Address,Phone) VALUES ('chu duc anh','lam thao','0343619450')
INSERT INTO Customer(Customername,Address,Phone) VALUES ('chu duc hung','tu xa','0343619450')
INSERT INTO Customer(Customername,Address,Phone) VALUES ('chu duc vo','phu tho','0343619450')
INSERT INTO Customer(Customername,Address,Phone) VALUES ('chu duc song','tu xa','0343619450')
GO
SELECT * FROM Customer
GO
--bang Book
CREATE TABLE Book(
BookCode int primary key,
Category varchar(50),
Author varchar(50),
Publisher varchar(50),
Title varchar(100),
Price int,
InStore int
)
GO
DROP TABLE Book
GO
INSERT INTO Book(BookCode,Category,Author,Publisher,Title,Price,InStore) VALUES (11,'English','thoc','van','oc',$4000,2)
INSERT INTO Book(BookCode,Category,Author,Publisher,Title,Price,InStore) VALUES (35,'literature','tuyen','thoi','cho',$7000,4)
INSERT INTO Book(BookCode,Category,Author,Publisher,Title,Price,InStore) VALUES (14,'history','nghech','hop','long',$1800,7)
INSERT INTO Book(BookCode,Category,Author,Publisher,Title,Price,InStore) VALUES (61,'reason','trang','oc','cho',$1200,3)
INSERT INTO Book(BookCode,Category,Author,Publisher,Title,Price,InStore) VALUES (41,'born','long','li','lom',$1400,9)
GO
SELECT * FROM Book
GO
--bang BookSold
CREATE TABLE BookSold(
BookSoldID int primary key,
CustomerID int identity,
BookCode int,
Date datetime,
Price int,
Amount int,
 constraint ok foreign key (CustomerID) references customer(CustomerID),
 constraint oh foreign key (BookCode) references Book(BookCode)
)
go
DROP TABLE BookSold
GO
INSERT INTO BookSold(BookSoldID,BookCode,Date,Price,Amount) VALUES (123,11,'2000/06/29',$3255,6)
INSERT INTO BookSold(BookSoldID,BookCode,Date,Price,Amount) VALUES (124,35,'2000/06/29',$355,9)
INSERT INTO BookSold(BookSoldID,BookCode,Date,Price,Amount) VALUES (125,14,'2000/06/29',$36555,6)
INSERT INTO BookSold(BookSoldID,BookCode,Date,Price,Amount) VALUES (126,61,'2000/06/29',$3245,8)
INSERT INTO BookSold(BookSoldID,BookCode,Date,Price,Amount) VALUES (127,41,'2000/06/29',$325465,1)
GO
SELECT * FROM BookSold
GO

--1 chèn ít nhất 5 bản ghi vào bảng Books,5 bản ghi vào bảng Customer và 10 bản ghi vào BookSold 



--2 tạo một khung chứa danh sách các khách hàng (customerID,customerName,Address)kèm theo số lượng đã được bán của mỗi cuốn sách
CREATE VIEW Books AS
SELECT BookCode,Title,Price
FROM Book
GO
SELECT * FROM Books
GO

--3 Tạo một khung nhìn chứa danh sách các khánh hàng(customerID,customerName,Address) kèm theo số lượng các cuốn sách mà khách hàng đó đã mua

CREATE VIEW Customer AS
SELECT CustometID,CustomerName, Address 
FROM customer_ok
GO
SELECT * FROM CUST
GO
--4 Tạo một khung nhìn chứa danh sách các khách hàng(customerID,customerName,Address)đã mua vào tháng trước kèm theo tên các cuốn sách mà khách hàng đã nua


--5 Tạo một khung nhìn chứa danh sách các khách hàng kèm theo tổng tiền mà mỗi khách hàng đã chi cho việc mua sách
