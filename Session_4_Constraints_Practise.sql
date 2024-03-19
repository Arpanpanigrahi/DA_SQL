--HOW TO CREATE A TABLE
CREATE TABLE EMP
(emp_id varchar(5) , emp_name varchar(15), age int, gender varchar(10) ,dob date);

--HOW TO SEE A TABLE
SELECT * FROM EMP;

--WHICH DATABASE TO USE
USE arpandb;

--HOW TO DELETE A TABLE FROM DATABASE
DROP TABLE EMP;

--HOW TO INSERT DATA IN A TABLE
insert into emp values('A1','Arpan panigrahi',27,'Male','08-11-1995');
insert into emp values('A2','Akash sahu',28,'Male','09-09-1992');
insert into emp values('A3','Anjali parhi',32,'Female','12-28-1999');
insert into emp values('A4','Jagrat mishra',22,'Male','03-07-2000');
insert into emp values('A5','Situ mallik',18,'Male','02-25-1990');

----------------------------------------------------------------------------------------------
CREATE TABLE EMP1
(emp_id varchar(5) NOT NULL, emp_name varchar(15) NULL, age int NULL, gender varchar(10) NULL, dob date NULL);

select * from emp1;

insert into EMP1 values('CSE','Arpan panigrahi',27,'Male','08-11-1995');
insert into emp1 values('EEE','Akash sahu',28,'Male','09-09-1992');
insert into emp1 values('ECE','Anjali parhi',32,'Female','12-28-1999');
insert into emp1 values('EIE','Jagrat mishra',22,'Male','03-07-2000');
insert into emp1 values('IT','Situ mallik',18,'Male','02-25-1990');


