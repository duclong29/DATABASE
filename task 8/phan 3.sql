CREATE TABLE Class(
ClassCode varchar(10) primary key,
HeadTeacher varchar(30),
Room varchar(30),
TimeSlot char,
CloseDate datetime
)
GO
DROP TABLE Class
GO
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) 
VALUES ('T100','bui huy tien','12A4','L','2000/06/29')
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) 
VALUES ('T101','bui huy tien','12A4','L','2000/06/29')
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) 
VALUES ('T102','bui huy tien','12A4','L','2000/06/29')
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) 
VALUES ('T103','bui huy tien','12A4','L','2000/06/29')
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) 
VALUES ('T104','bui huy tien','12A4','L','2000/06/29')
GO
SELECT * FROM Class
GO

--Bảng Student
CREATE TABLE Student(
RollNo varchar(10) primary key,
ClassCode varchar(10),
FullName varchar(24),
Male bit,
BirthDate datetime,
Address varchar(30),
Provice char(2),
Email varchar(30)
 constraint cl foreign key (ClassCode) references Class(ClassCode)
)
GO
DROP TABLE Student
GO
INSERT INTO Student(RollNo,ClassCode,FullName,Male,BirthDate,Address,Provice,Email) VALUES
(123,'T100','chu duc long',1,'2000/06/29','lam thao','PT','chuduclong29062000@gmail.com')
INSERT INTO Student(RollNo,ClassCode,FullName,Male,BirthDate,Address,Provice,Email) VALUES
(124,'T101','phan thu trang',0,'2000/06/29','lam thao','PT','chuduclong29062000@gmail.com')
INSERT INTO Student(RollNo,ClassCode,FullName,Male,BirthDate,Address,Provice,Email) VALUES
(125,'T102','chu duc long',1,'2000/06/29','lam thao','PT','chuduclong29062000@gmail.com')
INSERT INTO Student(RollNo,ClassCode,FullName,Male,BirthDate,Address,Provice,Email) VALUES
(126,'T103','nguyen lan anh',0,'2000/06/29','lam thao','PT','chuduclong29062000@gmail.com')
INSERT INTO Student(RollNo,ClassCode,FullName,Male,BirthDate,Address,Provice,Email) VALUES
(127,'T104','chu duc long',1,'2000/06/29','lam thao','PT','chuduclong29062000@gmail.com')
GO
SELECT * FROM Student
GO
--Bảng Subject
CREATE TABLE Subject_01(
SubjectCode varchar(24) primary key,
SubjectName varchar(424),
WMark bit,
PMark bit,
WTest_per int,
PTest_per int
)
GO
DROP TABLE Subject_01
GO
INSERT INTO Subject_01(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES 
('EPC','math',1,1,2,3)
INSERT INTO Subject_01(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES 
('PC','Engish',1,1,2,3)
INSERT INTO Subject_01(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES 
('EP','math',1,1,2,3)
INSERT INTO Subject_01(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES 
('EC','math',1,1,2,3)
INSERT INTO Subject_01(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES 
('CF','math',1,1,2,3)
GO
SELECT * FROM Subject_01
GO
--Bảng Mark 
CREATE TABLE Mark(
RollNo varchar(10),
SubjectCode varchar(24),
WMark FLOAT,
PMark FLOAT,
Mark FLOAT,
CONSTRAINT PH FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
CONSTRAINT PT FOREIGN KEY (SubjectCode) REFERENCES Subject_01(SubjectCode)
)
GO
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,Mark) VALUES ('123','EPC',23.5,35,2428)
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,Mark) VALUES ('124','PC',23.5,35,2428)
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,Mark) VALUES ('125','EP',23.5,35,2428)
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,Mark) VALUES ('126','EC',23.5,35,2428)
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,Mark) VALUES ('126','CF',23.5,35,2428)
GO
SELECT * FROM Mark
GO

--1 chèn ít nhất 5 bản ghi cho từng bảng ở trên
CREATE VIEW HS AS
SELECT FullName, SubjectName
FROM Student,Subject_01
GO
SELECT * FROM HS
GO
--tạo một khung nhìn chưa danh sách sinh viên đã bị trượt ít nhất một môn
CREATE VIEW HST AS
SELECT FullName, SubjectName
FROM Student, Subject_01
GO
SELECT * FROM HST
GO
--3 tạo một khung nhìn chứa danhn sách tất cả các sinh viên đang học ơ TimeSlot E
CREATE VIEW SVDH AS
SELECT FullName,TimeSlot = 'G'
FROM Student,Class
GO
SELECT * FROM SVDH
GO
-- 4 tạo 