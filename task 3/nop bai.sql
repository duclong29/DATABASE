create table booklibary(
BookCode int primary key,
BookTitle varchar(100),
Author varchar(50),
Edition int,
BookPrice money,
Copies int,
)
go

insert into Booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values (123,'my dad','me',29,$120000,9)
insert into Booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values (321,'my mother','you',06,$160000,8)
insert into Booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values (456,'my sister','your',20,$170000,7)
insert into Booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values (654,'my wife','my husband',11,$180000,6)
go

select * from booklibary
go

--tao bang member

create table Menber(
MenberCode int primary key,
Name nvarchar(50),
Address varchar(100),
PhoneNumber int,
)
go

insert into Member(MemberCode,Name,Address,PhoneNumber) values(101,'Dodemom','Tokyo',0343619450)
insert into Member(MemberCode,Name,Address,PhoneNumber) values(102,'Batman','New York',7379784029)
insert into Member(MemberCode,Name,Address,PhoneNumber) values(103,'Captitan','seoul',6343619453)
insert into Member(MemberCode,Name,Address,PhoneNumber) values(104,'Superman','Viet Nam',4343619451)
go

select * from Member
go

--tao bang thong tin muon sach

create table issuedetails(
IssueDate datetime,
ReturnDate datetime,
BookCode int,
MemBerCode int,
constraint ml foreign key (BookCode) references booklibary(BookCode),
constraint mk foreign key (MemBerCode) references member(MemBerCode)
)
go

insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,101,202)
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,302,451)
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,150,102)
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,942,364)
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,845,597)
go

select * from issuedetails
go

--xoa bang dl
drop table issuedetails
go
drop table booklibary
go
drop table member
go

--a,
--xoa bo khoa ngoai 
Alter Table IssueDetails drop constraint ml
Alter Table IssueDetails drop constraint mk
--b,
--xoa bo khoa chinh bang Member
Alter table member drop constraint MemBerCode

--xoa bo khoa chinh bang book
Alter TABLE booklibary drop constraint book

--c,
--them rang buoc khoa chinh member
ALTER TABLE MEMBER
ADD CONSTRAINT PK_MEMBER
PRIMARY KEY (MaNV)
--them rang buoc khoa chinh book
ALTER TABLE BOOK 
ADD CONSTRAINT PK_BOOK
PRIMARY KEY (HNB)
--d,
--them rang buoc khoa ngoai cho IssueDetails
ALTER TABLE IssueDetails(
ADD CONSTRAINT FK_NOTFUN
FOREIGN KEY(ISOTAI)
REFERENCES PLEALS()
)
-e,
--them rang buoc 
ALTER TABLE SACH
ADD CONSTRAINT C_T
CHECK ('SACH' > 0)
CHECK ('SACH' < 200)
--F.
--bo sung rang buoc duy nhat cho phoneNumber

CREATE TABLE PhoneNumber 
 (  
   PhoneNuberID int NOT NULL,   
   CONSTRAINT AK_PhoneNuberID UNIQUE(PhoneNuberID)   
);   
GO  
--G
--bo sung rang buoc NOT NULL cho bookcode\
CREATE TABLE PhoneNumber 
 (  
   PhoneNuberID int NOT NULL,   
   CONSTRAINT AK_PhoneNuberID UNIQUE(PhoneNuberID)   
);   
--bo sung rang buoc MemberCode trong bảng IssueDetails
CREATE TABLE IssueDetails 
 (  
  IssueDetailsID int Member,   
   CONSTRAINT AK_IssueDetailsID UNIQUE(IssueDetailsID)   
);  
--h
-- tao khoa chinh
CREATE TABLE IssueDetails(
BookCodeID int,
MemberCodeID int,
location varchar(2),
Constraint PK_IssueDetails PRIMARY KEY(BookCodeID, MemberCodeID))
--i
--chen du lieu hop ly
INSERT INTO Cities (Location)  
VALUES ( CONVERT(Point, '12.3:46.2'));