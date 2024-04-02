--SET-1 : 

create database Interview_Query;

use Interview_Query;

create table Employee_Detail (
EmployeeID int,
FirstName varchar(255),
LastName varchar(255),
Salary float,
JoiningDate date,
Department varchar(255),
Gender varchar(255),
);

select * from Employee_Detail;

insert into Employee_Detail(EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
values(1,'Vikas','Ahlawat',600000.00, '02-15-2013', 'IT', 'Male');

insert into Employee_Detail(EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
values(2,'Nikita','Jain',530000.00, '01-09-2014', 'HR', 'Female');

insert into Employee_Detail(EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
values(3,'Ashish','Kumar',1000000.00, '01-09-2013', 'IT', 'Male');

insert into Employee_Detail(EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
values(4,'Nikhil','Sharma',480000.00, '01-09-2014', 'HR', 'Male');

insert into Employee_Detail(EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
values(5,'Anish','Kadian',500000.00, '01-09-2014', 'Payroll', 'Male');

--Q1. WAQ to get all employee detail from "EmployeeDetail" table.
select * from Employee_Detail;

--Q2. WAQ to get only "FirstName" column from "EmployeeDetail" table.
select FirstName from Employee_Detail;

--Q3. WAQ to get FirstName in upper case as "FirstName".
select UPPER(FirstName) from Employee_Detail;

--Q4. WAQ to get FirstName in lower case as "FirstName".
select LOWER(FirstName) from Employee_Detail;

--Q5. WAQ for combine FirstName and LastName and display it as "Name" 
--(also include white space between FirstName & LastName)
select CONCAT(FirstName,' ',LastName) from Employee_Detail;

select FirstName +' '+ LastName from Employee_Detail;

--Q6. Select employee detail whose name is "Vikas".
select * from Employee_Detail
where FirstName = 'Vikas';

--Q7. Get all employee detail from EmployeeDetail table whose "FirstName" start with letter 'a'.
select * from Employee_Detail
where FirstName like 'a%';

--Q8. Get all employee detail from EmployeeDetail table whose "FirstName" contains 'k'.
select * from Employee_Detail
where FirstName like '%k%';

--Q9. Get all employee detail from EmployeeDetail table whose "FirstName" end with letter 'h'.
select * from Employee_Detail
where FirstName like '%h';

--Q10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single 
--character between 'a-p'.
select * from Employee_Detail
where FirstName like '[a-p]%';

--SET-2:

--Q11. Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single 
--character between 'a-p'.
select * from Employee_Detail
where FirstName not like '[a-p]%'; 

select * from Employee_Detail
where FirstName like '[^a-p]%';

--Q12. Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters.
--The Underscore(_) Wildcard represents any single character.
select * from Employee_Detail
where Gender like '__le';

--Q13. Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters.
select * from Employee_Detail
where FirstName like 'A____';

--Q14. Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:- "Vik%as".
select * from Employee_Detail
where FirstName like 'Vik%as';

--Q15. Get all unique "Department" from EmployeeDetail table.
select distinct(Department) from Employee_Detail;

--Q16. Get the highest "Salary" from EmployeeDetail table.
select max(salary) from Employee_Detail;

--Q17. Get the lowest "Salary" from EmployeeDetail table.
select min(salary) from Employee_Detail;

--SET-5:
--Q42. WAQ to get the department and department wise total(sum) salary from "EmployeeDetail" table.
select Department, SUM(Salary) as total_salary
from Employee_Detail
group by Department;

--Q43. WAQ to get the department and department wise total(sum) salary, display it in ascending order 
--according to salary.
select Department, SUM(salary) as total_salary
from Employee_Detail
group by Department
order by sum(salary) ASC;

--Q44. WAQ to get the department and department wise total(sum) salary, display it in descending order 
--according to salary.
select Department, SUM(salary) as total_salary
from Employee_Detail
group by Department
order by sum(salary) DESC;

--Q45. WAQ to get the department, total no. of departments, total(sum) salary with respect to department 
--from "EmployeeDetail" table.
select Department, COUNT(*) as dept_count, sum(salary) as total_salary
from Employee_Detail
group by Department;

--Q46. Get department wise average salary from "EmployeeDetail" table order by salary in ascending order.
select Department, AVG(salary) as average_salary
from Employee_Detail
group by Department
order by AVG(Salary) ASC;

--Q47. Get department wise maximum salary from "EmployeeDetail" table order by salary in ascending order.
select Department, max(salary) as maximum_salary
from Employee_Detail
group by Department
order by max(Salary) ASC;

--Q48. Get department wise minimum salary from "EmployeeDetail" table order by salary in ascending order.
select Department, min(salary) as minimum_salary
from Employee_Detail
group by Department
order by min(Salary) ASC;


--HAVING CLAUSE
create table Project_Detail (
ProjectDetailID int,
EmployeeDetailID int,
ProjectName varchar(255),
);


insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(1, 1, 'Task Track');
insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(2, 1, 'CLP');
insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(3, 1, 'Survey Management');
insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(4, 2, 'HR Management');
insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(5, 3, 'Task Track');
insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(6, 3, 'GRS');
insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(7, 3, 'DDS');
insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(8, 4, 'HR Management');
insert into Project_Detail(ProjectDetailID, EmployeeDetailID, ProjectName)
values(9, 6, 'GL Management');

select * from Project_Detail;

select * from Employee_Detail;

--Q49. WAQ to fetch Project name assign to more than one Employee.
select ProjectName, count(*) as No_of_Emp
from Project_Detail
group by ProjectName
having count(*)>1;

--SET-6:
--Q51. Get Employee name, Project name order by First Name from "EmployeeDetail" and "ProjectDetail"
--for those employee which have assigned project already.
select firstname, projectname 
from Employee_Detail as a 
inner join Project_Detail as b
on a.EmployeeID = b.EmployeeDetailID
order by FirstName

--Q52.Get Employee name, Project name order by First Name from "EmployeeDetail" and "ProjectDetail"
--for all employee even they have not assigned project.

select * from Employee_Detail;
select * from Project_Detail;

select firstname, projectname 
from Employee_Detail as a 
LEFT join Project_Detail as b
on a.EmployeeID = b.EmployeeDetailID
order by FirstName 

--Q53.Get Employee name, Project name order by First Name from "EmployeeDetail" and "ProjectDetail"
--for all employee if project is not assigned then display "No Project Assigned.
with abc as (
select employeeID, firstname, LastName, projectname --as [No Project Assigned]
from Employee_Detail as a 
LEFT join Project_Detail as b
on a.EmployeeID = b.EmployeeDetailID
--order by FirstName
)
select EmployeeID, FirstName, LastName, case when projectname IS NULL then 'No Project Assigned' else projectname end as projectname from abc

--Q54. Get all project name even if they have not matching any emplyeeid in left table 
-- order by firstname from "EmployeeDetail" and "ProjectDetail".
with abc as
(
select firstname, projectname 
from Employee_Detail as a 
Full join Project_Detail as b
on a.EmployeeID = b.EmployeeDetailID
--order by FirstName
)
select * from abc

--Q55. Get complete record (employeename, projectname) from both tables "EmployeeDetails" and
--"ProjectDetails", if no match found in any table then show NULL.
select firstname, projectname 
from Employee_Detail as a 
FULL join Project_Detail as b
on a.EmployeeID = b.EmployeeDetailID
order by FirstName

--Q56. WAQ to find out the employeename who has not assigned any project, and display 
--"No Project Assigned" (tables:- [EmployeeDetails],[ProjectDetail]).


--Q57. WAQ to find out the project name which is not assigned to any employee.
select Projectname
from Employee_Detail as a
right join Project_Detail as b
on a.EmployeeID = b.EmployeeDetailID
where FirstName IS NULL;

