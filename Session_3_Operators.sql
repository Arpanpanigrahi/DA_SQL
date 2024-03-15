--Filter in SQL
SELECT * FROM EMPLOYEE;

--FOR FILTER WE USE WHERE FUNCTION
SELECT FULL_NAME, JOB_TITLE, HIRE_DATE FROM EMPLOYEE 
WHERE DEPARTMENT='IT';

--FOR MULTIPLE VALUES WE HAVE TO USE IN OPERATOR
SELECT ANNUAL_SALARY FROM EMPLOYEE
WHERE GENDER IN('MALE','FEMALE');

--FOR CHANGING COLUMN_NAME OF A TABLE WE HAVE TO USE AS OPERATOR
SELECT FULL_NAME,JOB_TITLE AS JOB_DESIGNATION FROM EMPLOYEE;

--OPERATORS IN SQL:
--1. ARITHMATIC OPERATOR : +,-<*,/
SELECT FULL_NAME, DEPARTMENT, GENDER, AGE, (AGE+5) AS NEW_AGE FROM Employee;

select full_name, department, gender, eeid, (eeid+100) as new_eeid from employee;

--SELECT FULL_NAME, DEPARTMENT, GENDER, AGE, BONUS, (BONUS+15) AS NEW_BONUS FROM Employee;

--2. LOGICAL OPERATOR : IN, AND, OR, NOT IN
select Department from Employee where Country = 'Brazil';

select eeid, full_name, gender, age from Employee where gender in('Male','Female');

select eeid, full_name, gender, age from Employee where gender = 'Male' and age = 40;

select eeid, full_name, gender, age from Employee where gender = 'Male' or age = 40;

select eeid, full_name, gender, age from Employee where gender != 'Male' and age <> 40;

--3. SPECIAL OPERATOR : LIKE, BETWEEN AND
select * from employee where age between 40 and 60;

select full_name from employee where full_name like 'A%';

select full_name from Employee where Full_Name like '%L';

--4. COMPARISION OPERATOR : >, <, >=, <=, =, <>, !
select * from Employee where age <=30;

select * from employee where gender='Male';

select eeid, full_name, gender, age from Employee where gender <> 'Female';

select eeid, full_name, gender, age from Employee where age!=35;

