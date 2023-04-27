create database company

create table Employee (
Fname varchar(20),
Lname varchar(20),
SSN int not null primary key ,
BDATE DATETIME ,
Addresss varchar(80),
Sex varchar(1),
Salary int,
Superssn int ,
Dno int ,
)

create table Department (
Dname varchar(20),
DNum int not null primary key ,
MGRSSN int foreign key(MGRSSN) REFERENCES Employee(SSN),
MGRStartDate Datetime ,

)

Alter table Employee
ADD CONSTRAINT Dept_fk foreign key(Dno) REFERENCES Department(DNum)


create table Works_for (
ESSN int  foreign key(ESSN) REFERENCES Employee(SSN),
Pno int foreign key(Pno) REFERENCES	Project(Pnumber),
Hours int ,
CONSTRAINT PK_work PRIMARY KEY (ESSN,Pno)
)

Drop table Works_for

create table Project(
Pname varchar(20),
Pnumber int primary Key,
Plocation varchar(80),
City varchar(20),
Dnum int foreign key(Dnum) REFERENCES Department(DNum),

)

create table Dependent(
ESSN int foreign key(ESSN) REFERENCES Employee(SSN),
Dependent_name varchar(80),
Sex varchar(2),
Bdate DateTime,
)

insert into Department (Dname, DNum ,MGRStartDate)values
('DP1', 10 , '1/1/2005'),
('DP2', 20 , '1/3/2006'),
('DP3', 30 , '1/6/2005')

update Employee set Superssn=223344 where SSN =123456
insert into Employee values
('Ahmed','Ail',112233,'1/1/1965','15 Ali fahmy St.Giza','M',1300,223344,10)
('Kamel','Mohamed',223344, '1970-10-15', '38 Mohy el dienabo el Ezz St.Cairo' ,
'M', 1800, 321654, 10),
('Ahmed','Ail',112233,'1/1/1965','15 Ali fahmy St.Giza','M',1300,223344,10),
('Kamel','Mohamed',223344, '1970-10-15', '38 Mohy el dienabo el Ezz St.Cairo' ,
'M', 1800, 321654, 10),
('Hanaa', 'Sobhy', 123456, '1973-3-18' , '38 Abdel Khalik Tharwat St.Downtown.Cairo',
'F' , 800 ,223344, 10),
('Amr', 'Omran', 321654 ,'1963-9-14' ,'44 Hilopolis.Cairo', 'M', 2500, null, null),
('Noha', 'Mohamed', 968574 ,'1975-2-1', '55 Orabi St. El Mohandiseen.Cairo',
'F', 1600, 321654, 20),
('Edward', 'Hanna' ,512463 ,'1972-8-19', '18 Abaas El3akaad St. Nasr City.Cairo',
'M', 1500, 321654, 30),
('Mariam', 'Adel', 669955, '1982-6-12', '269 El-Haram st.Giza',
'F', 750, 512463, 20),
('Maged', 'Raoof', 521634, '1980-4-6', '18 Kholosist.Shobra.Cairo',
'M', 1000 ,968574 ,30)

select * from Employee

update Department 
SET MGRSSN=512463
WHERE DNum=30

INSERT into Project values
('AL Solimaniah', 100 ,'Cairo_Alex Road','Alex', 10),
('Al Rabwah', 200 ,' 6th of October City','Giza', 10),
('Al Rawdah', 300 ,'Zaied City', 'Giza', 10),
('Al Rowad', 400 ,'Cairo_Faiyom Road','Giza', 20),
('Al Rehab' ,500 ,'Nasr City', 'Cairo', 30),
('Pitcho american', 600 ,'Maady', 'Cairo', 30),
('Ebad El Rahman', 700 ,'Ring Road', 'Cairo', 20)

insert into Works_for values
(223344, 100, 10),
(223344 ,200 ,10),
(223344, 300, 10),
(112233, 100, 40),
(968574 ,400 ,15),
(968574, 700 ,15),
(968574, 300, 10),
(669955 ,400 ,20),
(223344 ,500 ,10),
(669955, 700 ,7),
(669955 ,300, 10),
(512463 ,500 ,10),
(512463 ,600, 25),
(521634 ,500 ,10),
(521634 ,600, 20),
(521634 ,300 ,6),
(521634 ,400, 4)
select * from Dependent
insert into Dependent values
--(112233 ,'Hala Saied Ali', 'F', 18/10/1970),
(223344, 'Ahmed Kamel Shawki', 'M', 27/3/1998),
(223344 ,'Mona Adel Mohamed', 'F', 25/4/1975)
--(321654 ,'Ramy Amr Omran', 'M', 26/1/1990),
--(321654 ,'Omar Amr Omran', 'M', 30/3/1993),
--(321654 ,'Sanaa Gawish', 'F', 16/5/1973),
--(512463 ,'Sara Edward', 'F', 15/9/2001),
--(512463 ,'Nora Ghaly', 'F', 22/6/1976)

--1. Insert your personal data to the employee table as a new employee in department
--number 30, SSN = 102672, Superssn = 112233.
insert into Employee values
('Hager','Mohamed',102672,'2000-7-5','15 Ali fahmy St.Giza','M',8000,112233,30)
--Insert another employee with your friend personal data as new employee in
--department number 30, SSN = 102660, but don’t enter any value for salary or
--supervisor number to him but fill all other fields with dummy data.
insert into Employee values
('Reem','Salah',102660,'2000-8-5','15 Ali fahmy St.Giza','f',null,null,30)
--3. In the department table insert new department called "DEPT IT", with id 100,
--employee with SSN = 112233 as a manager for this department. The start date for this
--manager is '1-11-2006'
insert into Department values
('DEPT IT', 100 ,112233, '1-11-2006')

--4. Do what is required if you know that: Mrs.Noha Mohamed(SSN=968574) moved to
--be the manager of the new department (id = 100), and they give you (use your SSN
--from question1) her position (Dept. 20 manager)

--a. First try to update her record in the department table
update Department
set MGRSSN =968574
where DNum=100
--b. Update your record to be department 20 manager
update Department
set MGRSSN =102672
where DNum=20
--Update your friend data (entered in question2) to be in your teamwork
--(supervised by you)
update Employee
set Superssn=102672
where SSN=102660

--Unfortunately, the company ended the contract with Mr. Kamel Mohamed
--(SSN=223344) so try to delete his data from your database in case you know that
--your friend (SSN entered in question2) will be temporarily in his position.
--Hint: (Check if Mr. Kamel has dependents, works as a department manager,
--supervises any employees or works in any projects and handle these cases).
select * from Department where MGRSSN =223344
select * from Dependent where ESSN =223344
select SSN,Superssn from Employee where Superssn =223344
select * from Works_for where ESSN =102660 

DELETE from Dependent where ESSN =223344
update  Department
set MGRSSN =102660 
where MGRSSN =223344

update  Employee
set Superssn =102660 
where SSN=223344
--where SSN in (112233,123456)

update  Works_for
set ESSN =102660 
where ESSN=223344
--where Pno in (100,200,300,500)

DELETE from Employee where SSN =223344

--6. And your salary has been upgraded by 20 percent of its last value.

update  Employee
set Salary = Salary+(Salary*20)/100
where SSN=102672

SELECT Salary FROM Employee where SSN=102672

--Try to create the following Queries:
--1. Display all the employees Data.
SELECT * FROM Employee
--2. Display the employee First name, last name, Salary and Department number.

SELECT Fname,Lname,Salary,Dno FROM Employee

--3. Display all the projects names, locations and the department which is responsible about it.
select p.Pname,p.Plocation,p.Dnum from Project as p ,Department as d
where p.Dnum =d.DNum 

--4. If you know that the company policy is to pay an annual commission for each
--employee with specific percent equals 10% of his/her annual salary. Display each
--employee full name (Full name as one column) and his annual commission as
select Fname +' '+ Lname as Fullname ,Salary*12+((Salary*12)*10)/100 as 'ANNUAL COMM' from Employee

/*5.Display the employees Id, name who earns more than 1000 LE monthly*/

select SSN ,Fname +' '+ Lname as Fullname from Employee
WHERE Salary >1000

--6. Display the employees Id, name who earns more than 10000 LE annually.
select SSN ,Fname +' '+ Lname as Fullname from Employee
WHERE Salary*12 >10000

--7. Display the names and salaries of the female employees
select Fname +' '+ Lname as Fullname , Salary from Employee
WHERE sex = 'f'
--8. Display each department id, name which managed by a manager with id equals 968574.
select DNum,Dname from Department
WHERE MGRSSN  = 968574

--9. Display the IDs, names and locations of the pojects which controlled with department 10
select Pnumber,Pname, Plocation  from Project
WHERE Dnum  = 10
