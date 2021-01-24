create table product(
sst int identity,
name varchar(100),
description varchar(500),
unit varchar(340),
price money
)
go

insert into product(name,description,unit,price) values ('May Tinh T450','new','piece',$1000)
insert into product(name,description,unit,price) values ('Dien thoai Nokia5670','hot','piece',$400)
insert into product(name,description,unit,price) values ('May in samsung 450','Nomar','piece',$100)
go

select * from product
go

--bang Category
create table category(
sst int identity,
species varchar(20)
)
go
 insert into category (species) values ('May Tinh'),('Dien Thoai'),('May In')
 go

 select * from category
 go

 --bang Order
 create table The_order(
 sst int identity,
 code_orders int,
 name_order varchar(340),
 address varchar(332),
 number_phone int,
 data_order datetime
 )
 go
 insert into The_order(code_orders,name_order,address,number_phone,data_order)
 values (123,'chu duc long','ta xa',0343619450,'2000/06/29')
  insert into The_order(code_orders,name_order,address,number_phone,data_order)
 values (124,'nguyen van tuyen','cao thuong',0379784029,'2020/05/28')
 go

 select * from The_order
 go

--bang orderDatails
create table orderDatailes(
sst int identity,
description varchar(133)
)
go
drop table orderDatailes
go

insert into orderDatailes(description) values ('may tinh T450'),('dien thoai hot'),('may in 450')
go

select * from orderDatailes
go

--bang Custumer
create table custumer(
stt int identity,
orderer varchar(243),
address varchar(242),
number_phone int
)
go

insert into custumer(orderer,address,number_phone) values ('chu duc long','lam thao',0432324)
insert into custumer(orderer,address,number_phone) values ('chu duc long','lam thao',0432324)
insert into custumer(orderer,address,number_phone) values ('chu duc long','lam thao',0432324)
go
 
select * from custumer
go
