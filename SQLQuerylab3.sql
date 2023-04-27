select d.DNum ,d.Dname ,  
from Department d ,Employee e
where d.DNum=e.Dnum

--2. Display the name of the departments and the name of the projects under its control.
select d.Dname , p.Pname
from Department d ,Project p
where d.DNum=p.Dnum

--Display the full data about all the dependence associated with the name of the 
--employee they depend on him/her.

select d.* , e.Fname + e.Lname
from Dependent d , Employee e 
where d.ESSN=e.SSN

select * from Dependent

--Display (Using Union Function)
--a. The name and the gender of the dependence that's gender is Female and 
--depending on Female Employee.

select d.Dependent_name , d.Sex ,e.Fname
from Dependent d, Employee e
where  d.ESSN=e.SSN and d.Sex='F'  and e.Sex='F'
Union
select d.Dependent_name , d.Sex ,e.Fname
from Dependent d, Employee e
where  d.ESSN=e.SSN and d.Sex='M'  and e.Sex='M'

--5. Display the Id, name and location of the projects in Cairo or Alex cit

SELECT P.Pnumber ,P.Pname ,P.Plocation ,p.City
FROM Project P
WHERE P.City IN('cairo' ,'Alex')

--6. Display the Projects full data of the projects with a name starts with "a" letter.
 select * from Project p 
 WHERE P.Pname LIKE 'a%'


 --7. display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select * from Employee e
where e.Dno=30 and Salary between 1000 and 2000

--8. Retrieve the names of all employees in department 10 who works more than or 
--equal10 hours per week on "AL Rabwah" project.
select * from Employee e , Works_for w ,Project p
where p.Dnum=10 and  w.Hours >=10 and p.Pname ='AL Rabwah'
and e.SSN=w.ESSN and w.Pno =p.Pnumber

--9. Find the names of the employees who directly supervised with Kamel Mohamed.
select e.Fname + ' ' +e.Lname, e.SSN,e.Superssn
from Employee e 
where e.Superssn =(select e.SSN from Employee e where e.Fname='Kamel')

--10. For each project, list the project name and the total hours per week (for all 
--employees) spent on that project.

select w.ESSN, P.Pname , W.Hours
from Project p , Works_for W 
WHERE P.Pnumber= W.Pno 

--11. Retrieve the names of all employees and the names of the projects they are 
--working on, sorted by the project name.
SELECT e.Fname ,p.Pnumber 
FROM Employee e ,Project p ,Works_for w
where w.ESSN=e.SSN and w.Pno=p.Pnumber
order by p.Pname 

--12. Display the data of the department which has the smallest employee ID over all
--employees' ID.
select  d.* , e.SSN
from Department d ,Employee e
where e.SSN=(select min(e.SSN) from Employee e )and e.Dno=d.DNum

--13. For each department, retrieve the department name and the maximum, minimum 
--and average salary of its employees.

select d.Dname, min(e.Salary) as minS ,Max(e.Salary) MAXs ,AVG(e.Salary) avgS
from Department d , Employee e
where d.DNum=e.Dno
group by d.Dname

--14. List the last name of all managers who have no dependents.
SELECT e.Lname
FROM Employee e ,Department d
WHERE e.SSN = d.MGRSSN and e.SSN not in(select dn.ESSN from Dependent dn )

--15. For each department-- if its average salary is less than the average salary of all 
--employees-- display its number, name and number of its employees.
SELECT d.DNum,d.Dname, count(e.SSN) count,AVG(Salary) avg
FROM Department d , Employee e 
where d.DNum=e.Dno 
group by d.DNum ,d.Dname
HAVING AVG(Salary)<(SELECT AVG(e.Salary) FROM Employee e )


--16. Retrieve a list of employees and the projects they are working on ordered by 
--department and within each department, ordered alphabetically by last name, first 
--name.

select e.Fname ,e.Lname ,p.Pname ,d.DNum
from Employee e, Project p , Works_for w , Department d
where p.Pnumber =w.Pno and w.ESSN=e.SSN and d.DNum=e.Dno
order by d.DNum ,e.Lname ,e.Fname

--17. For each project located in Cairo City , find the project number, the controlling 
--department name ,the department manager last name ,address and birthdate

select p.Pnumber, d.Dname , e.Lname , e.Addresss ,e.BDATE,p.City
from Project p ,Department d ,Employee e
where p.City ='Cairo' and p.Dnum =d.DNum and d.MGRSSN=e.SSN

