create table production(
productId int,
name nvarchar(234),
descrrption varchar(242),
unit varchar(247),
price int,
qly int
)
go
drop table production
go
insert into production(productId,name,descrrption,unit,price,qly) values (1,'Máy Tính T450','Máy nhập cũ','piece',$1000,10)
insert into production(productId,name,descrrption,unit,price,qly) values (2,'Điện Thoại Nokia5670','Điện Thoại Đang Hot','piece',$200,20)
insert into production(productId,name,descrrption,unit,price,qly) values (3,'Máy In SamSung 450','Máy Đang Loại Bình','piece',$400,10)
go
select * from production
go

create table The_firm(
firmId int,
name varchar(2434),
code int,
address varchar(434),
tel int
)
go
drop table The_firm
go
insert into The_firm(name,code,address,tel) values ('Asus',123,'USA',983232)
insert into The_firm(name,code,address,tel) values ('lsus',123,'USA',983232)
insert into The_firm(name,code,address,tel) values ('Bsus',123,'USA',983232)
insert into The_firm(name,code,address,tel) values ('Dsus',123,'USA',983232)
go
select * from The_firm
go

create table information_ok(
name varchar(924),
code int,
address varchar(244),
tel int
)
go
insert into information_ok(name,code,address,tel) values ('Arus',123,'USA',0343619450)
go
select * from information_ok
go

create table orderdetails(
productId int,
price int,
qly int
)
go
insert into orderdetails(price,qly) values ($1000,10)
insert into orderdetails(price,qly) values ($400,200)
go
select * from orderdetails
go

--bài 2
create table production()
create table The_firm()
create table orderdetails()
create table information()

insert into production() values ()
insert into The_firm() values()
insert into orderdetails() values()
insert into information()

select * from production
select * from The_firm
select * from orderdetails

--bài 3
insert into production() values ()
insert into The_firm() values()
insert into orderdetails() values()
insert into information() values()

--bài 4
--A hiển thị các hãng sản xuất
select name from The_firm
go
--B hiển thị tất cả các sản phẩm
select name from production
go

--bài 5
--A liệt kê danh sách hãng theo thứ tự ngược lại alphabet
select * from The_firm 
order by name desc
go
-- liệt kê danh sách hãng theo thứ tự alphabet
select * from The_firm 
order by name 
go

--B liệt kê danh sách theo thứ tự giá giảm dần
select * from production
order by price desc
go
--C Hiển thị thông tin của hảng Arsu
select * from The_firm
where name = 'Asus'
go
--D liệt kê danh sách sản phẩm nhỏ hơn 11
select * from production
where qly < 11
go
--E liệt kê danh sách sản phẩm Arus
select name from production 
go

--bài 6
--A số hãng sản phẩm mà cửa hàng có 
select code from The_firm
go
--B số mặt hàng mà cửa hàng bán
select name from production
go
--C tổng số loại sản phẩm của mỗi hãng có trong cửa hàng
select sum(productId) from production
go

--D tổng số đầu sản phẩm của toàn cửa hàng
select sum(productId) from production
where productId <= 1
go

--bài 7
---A viết câu lệnh thay đổi giá từng mặt hàng là dương (>0)
update production set price = $3000
where productID = 2
select * from production 
go
--B viết câu lệnh thay đổi điện thoại bắt đầu bằng 0
update The_firm set tel = 0
select * from The_firm
go
--C viết các câu lệnh để xác định khoá ngoại và khoá chính của các bảng
create table production(
productId int primary key,
name varchar(355),
descrrption varchar(242),
unit varchar(247),
price int,
qly int
) 