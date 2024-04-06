use Interview_Query

--Q1. Display all the records of Employees.
select * from EMP

--Q2. Display all the records of Department.
select * from DEPT

--Q3. WAQTF Name and Salary of all the employees.
select ENAME, SAL
from EMP

--Q4. Only location from department.
select LOC
from DEPT 

--Q5. WAQTD all the details of Employee MARTIN.
select *
from EMP
where ENAME = 'MARTIN'

--Q6. WAQTF details of SALESMAN.
select * 
from EMP
where JOB = 'SALESMAN'
 
--Q7. WAQTD the department information of NEW YORK location.
select * 
from DEPT
where LOC = 'NEW YORK'

--Q8. Display the location of RESEARCH department.
select LOC
from DEPT
where DNAME = 'RESEARCH'

--Q9. Display designation and hiredate of employee ALLEN.
select job, hiredate
from EMP
where ENAME = 'ALLEN'

------------------------------OPERATORS------------------------------------------------------

--Q10. WAQTD salary of all the employees with hike of 50%.
select sal + (sal * 0.5) from EMP

select sal + (sal * 50/100) from EMP

--Q11. Display annual salary of all the employees.
select sal*12 from EMP

--Q12. QTF half of the employee salaries.
select sal/12 from EMP

--Q13. QTF employee name, designation and salary with increment of 500 for all the employees.
select  ENAME, JOB, SAL+500
from EMP

--Q14. Display joining date, id and half term of the emoployee salaries who are working in dept 20.
select HIREDATE, EMPNO, SAL*6
from EMP
where DEPTNO = 20

--Q15. QTF employee name and commission with deduction of 500 for all the employees.
select ENAME, COMM-500
from EMP

--Q16. QTD the details of employee who are earning exactly 3000 as salary.
select * from emp
where SAL = 3000

--Q17. Display name and salary of employees except clerk.
select ENAME, SAL
from EMP
where job <> 'CLERK'

--Q18. QTF depatment name except for Boston location.
select DNAME
from DEPT
where LOC != 'BOSTON'

--Q19. Display annual salary of the employee who are earning atleast 1000 as commision.
select sal*12 
from emp
where COMM >= 1000

--Q20. List all the salesman in dept 30.
select * from EMP
where JOB='SALESMAN' and DEPTNO=30

--Q21. List all the salesman in dept 30 and earning salary more than 1400.
select * from EMP
where JOB='SALESMAN' and DEPTNO=30 and SAL>1400

--Q22. Display the department information of accounting dept. in NEW YORK location.
select * from DEPT
where dname='ACCOUNTING' and LOC='NEW YORK'

--Q23. Display salary of employee SMITH who is working as clerk.
select SAL from EMP
where ENAME='SMITH' and JOB='CLERK'

--Q24. QTF half of the salary along with annual commission of employees working in dept 30 and 
--joined after year 81.
select sal/2, comm*12 from emp
where DEPTNO=30 and HIREDATE>'31-dec-81'

----------------------------AGGREGATE FUNCTION-------------------------------------------------------------
--Q. Display the highest salary among all the employees.
select max(sal) from emp

--Q. Fetch the last joining date among all the employees.
select max(hiredate) from emp

--Q. QTF the highest salary among all the salesman.
select max(sal) from emp
where job='salesman'

--Q. Display the lowest salary among all the employees.
select min(sal) from emp

--Q. QTF the first joining date among the employees who are working as a Clerk.
select min(hiredate) from emp
where job = 'clerk'

--Q. Display the least commission among the employee who are working in dept 30.
select min(comm) from emp
where DEPTNO=30

--Q. Display average salary of all the employees.
select avg(sal) from emp

--Q. QTF average salary of employees working in dept 10 and 20.
select avg(sal) from emp
where DEPTNO in(10,20)

--Q. Display the total salary given to manager.
select sum(sal) from emp
where job='manager'

--Q. Display total salary given to the employees whose designation starts with 'S'.
select sum(sal) from emp
where job like 'S%'

--Q. Display number of employees present in employee table.
select count(ename) from emp

--Q. Display number of employees earning commission.
select count(comm) from emp

---------------------------------DISTINCT-----------------------------------------------------------------

--Q. WAQTF unique designations from the employee table.
select distinct job from emp

select distinct sal from emp

select distinct job, sal from emp





