--CREATE A DATABASE
create database apdb1;

--WHICH DATABASE TO USE
use apdb1;

--CREATE A NEW TABLE
create table employee (
ID int,
EmpName varchar(255),
City varchar(255),
Salary int
);

--DELETE A TABLE FROM DATABASE
drop table employee;

--INSERT RECORDS
insert into employee(ID, EmpName, City, Salary)
values(1,'Arpan','BLR',7000);

--SELECT Statement
select * from employee;

insert into employee(ID, EmpName, City, Salary)
values(2,'Arpit','JP Nagar',8000);

insert into employee(ID, EmpName, City, Salary)
values(3,'Ananya','HYD',5000);

insert into employee(ID, EmpName, City, Salary)
values(4,'Subhasmita','BLS',3000);

insert into employee(ID, EmpName, City, Salary)
values(5,'Mia','UAE',9000);

insert into employee(ID, EmpName, City, Salary)
values(6,'John','USA',1000);

insert into employee(ID, EmpName, City, Salary)
values(7,'SRK','USA',6000);

--SELECT Statement for getting specific columns
Select ID, EmpName from employee;

--DISTINCT Statement
select * from employee;

select distinct city from employee;

--WHERE Clause
select empName
from employee
where Salary=8000;

select *
from employee
where Salary=8000;

select *
from employee
where EmpName='Arpan';

select *
from employee
where Salary >= 7000;

--ORDER BY Clause
select * from employee;

select * from employee
order by Salary;

select * from employee
order by salary DESC;

select * from employee
order by City, Salary;

--AND Operator
select * from employee
where City='BLR' and Salary=7000;

select * from employee
where City='USA' and Salary<6000;

--OR Operator
select * from employee
where EmpName='Arpan' or EmpName='Arpit';

select * from employee
where EmpName='Arpan' or EmpName='Steve';

--NOT Operator
select * from employee
where salary <> 8000;

select * from employee
where salary != 8000;

select * from employee
where not salary = 8000;

--IN Operator
--Set multiple values.
--Shorthand: Multiple OR Conditions in SQL.
select * from employee
where City in('BLR','HYD','BLS');

select * from employee
where EmpName in('Arpan','Ananya','Mia');

select * from employee
where EmpName not in('Arpan','Ananya','Mia');

--BETWEEN Operator
--Select in a range i.e. BETWEEN
--Values: Numbers like 1,2,3
--		  Text: Tom, Jack
--		  Dates: 2024-03-18, 2021-07-16

select * from employee
where Salary between 7000 and 9000; 

select * from employee
where Salary not between 7000 and 9000; 

select * from employee
where EmpName between 'Arpan' and 'John'
order by EmpName;

--LIKE Operator
--Specified pattern
-- % (percentage) : zero, one or multiple characters
-- _ (underscore) : one or single character

select * from employee
where City like 'B%';

select * from employee
where EmpName like '%A';

select * from employee
where EmpName like '_r%';

select * from employee
where EmpName not like 'A%';

--MAX() Function
select * from employee

select max(salary) as Result
from employee;

--MIN() Function
select min(salary) as Result
from employee;

--SUM() Function
select sum(salary) as Result
from employee;

select sum(salary)
from employee
where salary >= 7000;

--AVG() Function
select avg(salary)
from employee;

select avg(salary)
from employee
where salary > 6000;

--COUNT() Function
select count(empName)
from employee;

select count(empName)
from employee
where salary > 7000;

select count(*)
from employee;

--NOT NULL Constraint
use apdb1;

create table employee1(
ID int NOT NULL,
EmpName varchar(255) NOT NULL,
City varchar(255),
Salary int
)

insert into employee1(ID, EmpName, City, Salary)
values(1,'Arpan','BLR',7000);

insert into employee1(ID, EmpName, City, Salary)
values(2,'Arpit','JP Nagar',8000);

insert into employee1(ID, EmpName, City, Salary)
values(3,'Ananya','HYD',5000);

insert into employee1(ID, EmpName, City, Salary)
values(4,'Subhasmita','BLS',3000);

insert into employee1(ID, EmpName, City, Salary)
values(5,'Mia','UAE',9000);

insert into employee1(ID, EmpName, City, Salary)
values(6,'John','USA',1000);

insert into employee1(ID, EmpName, City, Salary)
values(7,'SRK','USA',6000);

select * from employee1;

--UNIQUE Constraint
-- Cannot insert duplicate values.

create table employee2(
ID int NOT NULL UNIQUE,
EmpName varchar(255) NOT NULL,
City varchar(255),
Salary int
) 

SELECT * FROM employee2;

insert into employee2(ID, EmpName, City, Salary)
values(1,'Arpan','BLR',7000);

insert into employee2(ID, EmpName, City, Salary)
values(2,'Arpit','JP Nagar',8000);

insert into employee2(ID, EmpName, City, Salary)
values(3,'Ananya','HYD',5000);

insert into employee2(ID, EmpName, City, Salary)
values(4,'Subhasmita','BLS',3000);

insert into employee2(ID, EmpName, City, Salary)
values(5,'Mia','UAE',9000);

insert into employee2(ID, EmpName, City, Salary)
values(6,'John','USA',1000);

insert into employee2(ID, EmpName, City, Salary)
values(7,'SRK','USA',6000);

--insert into employee2(ID, EmpName, City, Salary) values(7,'KRK','SA',4000);

--PRIMARY KEY Constraints
create table employee3(
ID int NOT NULL PRIMARY KEY,
EmpName varchar(255) NOT NULL,
City varchar(255),
Salary int
) 

SELECT * FROM employee3;

insert into employee3(ID, EmpName, City, Salary)
values(1,'Arpan','BLR',7000);

insert into employee3(ID, EmpName, City, Salary)
values(2,'Arpit','JP Nagar',8000);

insert into employee3(ID, EmpName, City, Salary)
values(3,'Ananya','HYD',5000);

--FOREIGN KEY Constraint
--  A FK is a field in one table referring to the PK in another table.
-- Child Table: The table with the FK
-- Parent Table (referenced) : The table with the PK.

-- CHECK Constraint
use apdb1;

create table employee4 (
	ID int NOT NULL Primary Key,
	EmpName varchar(255) NOT NULL,
	City varchar(255),
	Salary int CHECK (Salary < 10000)
)

insert into employee4(ID, EmpName, City, Salary)
values(1,'Tom','ABC',7000);

insert into employee4(ID, EmpName, City, Salary)
values(2,'Emma','PQR',8000);

insert into employee4(ID, EmpName, City, Salary)
values(3,'Will','QUY',1100);

select * from employee4;

insert into employee4(ID, EmpName, City, Salary)
values(4,'Jack','XYZ',11000);

--ASC Command
select * from employee;

select * from employee
order by Salary ASC;

select * from employee
order by EmpName ASC;

--DESC Command
select * from employee;

select * from employee
order by Salary DESC;

select * from employee
order by EmpName DESC;

--ALTER TABLE
select * from employee;

alter table employee
add Age int;

alter table employee
drop column Age;

--UPDATE Statement
--Used to modify existing records.

select * from employee;

update employee
set Salary = 9500
where ID = 1;

update employee
set EmpName = 'KRK', City = 'JKL'
where ID = 6;

--SQL ALIAS
-- Used to give temporary name to column of a table

select * from employee;

select EmpName As My_Result
from employee;





