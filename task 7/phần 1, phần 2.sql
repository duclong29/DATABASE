CREATE DATABASE Lab10
go
USE AdventureWorks2019
SELECT * INTO Lab10.dbo.WorkOrder FROM Production.WorkOrder
go

USE Lab10
SELECT * INTO WorkOrderIX FROM WorkOrder

SELECT * FROM WorkOrder
SELECT * FROM WorkOrderIX 

CREATE INDEX IX_WorkOrderID ON WorkOrderIX(WorkOrderID)
go

SELECT * FROM WorkOrder WHERE WorkOrderID = 72000
SELECT * FROM WorkOrderIX WHERE WorkOrderID = 72000


------ phần 2
CREATE DATABASE CodeLean
go

USE CodeLean
go

CREATE TABLE Classes(
ClassName char(6),
Teacher varchar(30),
TimeSlot varchar(30),
Class int,
Lab int
)
go
DROP TABLE Classes
go
insert into Classes(ClassName,Teacher,TimeSlot,Class,Lab) values ('11A4','bui huy tien','7h00',123,01)
insert into Classes(ClassName,Teacher,TimeSlot,Class,Lab) values ('12A4','bui huy tien','7h00',123,01)
insert into Classes(ClassName,Teacher,TimeSlot,Class,Lab) values ('13A4','bui huy tien','7h00',123,01)
insert into Classes(ClassName,Teacher,TimeSlot,Class,Lab) values ('14A4','bui huy tien','7h00',123,01)
insert into Classes(ClassName,Teacher,TimeSlot,Class,Lab) values ('15A4','bui huy tien','7h00',123,01)
insert into Classes(ClassName,Teacher,TimeSlot,Class,Lab) values ('16A4','bui huy tien','7h00',123,01)
go

SELECT * FROM Classes
go

--1 tạo an unique,clustered index tên MYCLUSTEREDINDEX trên trường ClassName

CREATE UNIQUE INDEX MyClusteredIndex ON Classes(ClassName)
GO
--clustered
CREATE CLUSTERED INDEX MyClustered ON Classes(ClassName)
GO
--2 tạo a nonclustered index tên TeachrIndex trên trường Teacher
CREATE NONCLUSTERED INDEX TeacherIndex ON Classes(Teacher)
GO
--3 xoá chỉ mục TeacherIndex
DROP INDEX TeacherIndex On Classes
GO
--4 xây dựng lại MyClusteredIndex với các thuộc tính FILLFACTOR
ALTER INDEX MyClusteredIndex ON Classes REBUILD WITH(FILLFACTOR=70)
GO
--5 tạo một composite index tên là ClassLabIndex trên 2 trường Class và Lab
CREATE INDEX ClassLabIndex ON Classes(Class,Lab)
GO
--6 viết câu lệnh xem toàn bộ các chỉ mục của cơ sở dữ liệu CodeLean
