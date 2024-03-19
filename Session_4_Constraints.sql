select order_id,cust_id,age from Vrinda where Gender='women' and Gender='m' ;
select * from Vrinda where Gender in ('women') ;

operator:-
1.arithmatic- +,-,*,/
2.logical-in,and,or,not in
3.special-like,between and
4.comparision->,<,>=,<=,=,<>,!=
arithmatic
select order_id ,cust_id ,gender ,age,(age+10) as newage,(age-10) as new_age_2,
(age*10) as new_age_3,(age/10) as new_age_4
from vrinda

comparision

select order_id ,cust_id ,gender ,age
from vrinda
where gender <> 'men'

logical
select order_id ,cust_id ,gender ,age
from vrinda
where gender not in ('women' , 'men') and age <> 40

select *
from vrinda
where age between 20 and  30 and gender ='women' and size='L'

select *
from vrinda
where ship_city like 'b%r'




















 --database CREATION RULE 

database name should be start with a character or underscore
followed by number or special char

example abc123
abc
1abc
_abc
abc_123
abc#@$
abc 
-----HOW TO DROP A TABLE
drop table emp3

--HOW TO CREATE A TABLE
-- FIRST CREATE HEADING
create table emp3
(stu_id varchar(5) primary key,stu_name varchar(15) null,age int null,gender varchar(10) null,dob date null);

select * from emp3
--THEN INSERT VALUES
insert into emp3 values('A1','Arpan panigrahi',27,'Male','08-11-1995');
insert into emp3 values('A2','Akash sahu',28,'Male','09-09-1992');
insert into emp3 values('A3','Anjali parhi',32,'Female','12-28-1999');
insert into emp3 values('A4','Jagrat mishra',22,'Male','03-07-2000');
insert into emp3 values('A5','Situ mallik',18,'Male','02-25-1990');
---DIFFERENCE BETWEEN UNIQUE & PRIMARY KEY
both primary & unique key are unique in nature. Howevever unique key can have 1 null value but primary key cant have null value

select * from vrinda
--HOW TO DROP A COLUMN
ALTER TABLE EMP
DROP COLUMN GENDER;
SELECT * FROM EMP
-- HOW TO ADD ANEW COLUMN
ALTER TABLE EMP
ADD GENDER VARCHAR(10);
SELECT * FROM EMP3
--drop/DELETE/TRUNCATE
DROP TABLE EMP-TABLE WILL BE DROPPED FROM DATABASE
DELETE  EMP--COLUMN NAME WILL BE THERE BUT ALL DATA WILL BE ERASED.iT CAN ERASE DATA BASED ON CRIRERIA
TRUNCATE TABLE EMP2--COLUMN NAME WILL BE THERE BUT ALL DATA WILL BE ERASED. IT CAN NOT ERASE DATA BASED ON CRITERIA.
DELETE EMP3 WHERE GENDER='FEMALE'
SELECT * FROM EMP3
TRUNCATE TABLE EMP3 WHERE GENDER='FEMALE'- THIS WILL NOT WORK

















