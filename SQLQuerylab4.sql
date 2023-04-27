create database sales
create table customer(
first_name varchar(30),
last_name varchar(30),
)
create table Employee(
first_name varchar(30),
last_name varchar(30),
)
--lab4 
--Part 1: 
--1.Display the common last names between the in tables Customer and table employee.
select c.last_name clast ,e.last_name elast from
customer c  inner join Employee e
on c.last_name = e.last_name

--2.	Display the common first names between the in tables Customer
--and table employee in addition to the additional first names in customer.
select c.first_name cfirst , e.first_name efirst from
customer c  left outer join Employee e
on c.first_name = e.first_name

--3.	Display all the last names in customers and employee.
select c.last_name clast ,e.last_name elast from
customer c  full outer join Employee e
on c.last_name = e.last_name

--4.	Display the last name exist in employee and not in customer
select c.last_name   from
customer c 
except
select e.last_name   from
Employee e 

--5.Display all the first names in customers and employee even with duplicates.
select c.first_name   from
customer c 
union all
select e.first_name   from
Employee e 

--6.Display  the first initial and last name of the customer like 'S. JONES'

select left(e.first_name,1) +'.   '+ e.last_name as Name
from customer e 

--Part2:
--1.	Solve question no. 4 from the (lab 3) using Union set operator. 

--4.	Display (Using Union Function)
--a.	 The name and the gender of the dependence that's gender is Female and depending on Female Employee.
--b.	 And the male dependence that depends on Male Employee.
use company
select d.Dependent_name , d.Sex ,e.Fname
from Dependent d, Employee e
where  d.ESSN=e.SSN and d.Sex='F'  and e.Sex='F'
Union
select d.Dependent_name , d.Sex ,e.Fname
from Dependent d, Employee e
where  d.ESSN=e.SSN and d.Sex='M'  and e.Sex='M'



--2.Create SQL views for questions 7 & 8 & 15 from the (lab 3).
--7. display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
create view view1 as
select * from Employee e
where e.Dno=30 and Salary between 1000 and 2000
--8.Retrieve the names of all employees in department 10 who works more than
--or equal10 hours per week on "AL Rabwah" project.
create view view2 as
select * from Employee e , Works_for w ,Project p
where p.Dnum=10 and  w.Hours >=10 and p.Pname ='AL Rabwah'
and e.SSN=w.ESSN and w.Pno =p.Pnumber
--15. For each department-- if its average salary is less than the average salary of all 
--employees-- display its number, name and number of its employees.
create view view3 as
SELECT d.DNum,d.Dname, count(e.SSN) count,AVG(Salary) avg
FROM Department d , Employee e 
where d.DNum=e.Dno 
group by d.DNum ,d.Dname
HAVING AVG(Salary)<(SELECT AVG(e.Salary) FROM Employee e )

--3.	Create a SQL user-defined function that take the department id as an input and
--return the average salary of this department. 
alter function dept_Fun(@id int ) returns int 
as
begin
return (select AVG(e.Salary) from Employee e
where e.Dno=@id)
end

select [dbo].[dept_Fun](30)

--4.Create a SQL user-defined function that take the Project id as an input and 
--return how many employees are working within this Project. 
create function pro_Fun(@id int ) returns int 
as
begin
return (select count(w.ESSN) from Works_for w
where w.Pno=@id)
end
select [dbo].[pro_Fun](300)

--Part3:
--1.Using Excel sheet , execute question No. 1,2,5 from lab3

--1.	Return the current version of SQL Server
select @@VERSION as version
--2.Returns the name of the local server that is running SQL Server.
SELECT @@SERVERNAME 
--3.	Returns the number of rows affected by the last statement. 
SELECT * from Employee
SELECT @@ROWCOUNT 

--4.Print a following message to the user ('No. of row affected = 20').

SELECT * from Employee
SELECT CONCAT('No. o`f row affected = ' , @@ROWCOUNT )  as res