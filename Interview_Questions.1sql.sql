use Interview_Query

--Q1. GET DUPLICATE RECORDS FROM STATE COLUMN.
CREATE TABLE Sales (
	State VARCHAR(50),
	Sales INT
);

INSERT INTO Sales(State, Sales)
VALUES ('Karnataka',100), ('Andra Pradesh',200), ('Karnataka',300), ('Andra Pradesh',400), ('Jharkhand',500);

SELECT * FROM Sales;

--SOLUTION USING GROUP AND HAVING BY
SELECT State from Sales
GROUP BY State
HAVING COUNT(Sales)>1;
-----------------------------------------------------
--Q2. GET UNIQUE RECORDS FROM STATE COLUMN.

Select * from Sales;

--SOLUTION USING DISTINCT KEYWORD
SELECT DISTINCT State FROM Sales;

--SOLUTION USING GROUP BY CLUASE
SELECT State from Sales
GROUP BY State;
---------------------------------------------
--Q3. EMPLOYEE WITH SECOND HIGHEST SALARY.
CREATE TABLE Employee(
	id INT PRIMARY KEY,
	salary INT
);

INSERT INTO Employee(id, salary)
VALUES (1,100),(2,200),(3,300);

SELECT * FROM Employee;

--SOLUTION
SELECT MAX(salary) AS SecondHighestSalary 
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
------------------------------------------------------
--Q4. COLUMN TO ROW CONVERSION PROBLEM

CREATE TABLE States(
	state VARCHAR(100),
	district1 VARCHAR(100),
	district2 VARCHAR(100)
);

INSERT INTO States(state,district1,district2)
VALUES('Karnataka','Bengaluru Rural','Bengaluru Urban'), ('Andhra Pradesh','Anantapur','Mahbubnagar');

--DROP TABLE States
SELECT * FROM States;

--SOLUTION
SELECT state, district1 AS District_No, district2 AS District_Name
FROM States
UNION ALL
SELECT state, district2 AS District_No, district1 AS District_Name
FROM States
ORDER BY state, District_No
---------------------------------------------------------------------------
--Q5. COLUMN TO ROW CONVERSION PROBLEM --FACING ISSUES

CREATE TABLE States1(
	state VARCHAR(100),
	district VARCHAR(100)
);

INSERT INTO States1(state,district)
VALUES('Karnataka','Bengaluru Rural'),('Karnataka','Bengaluru Urban'), 
('Rajasthan','Jaisalmer'),('Rajasthan','Bikaner'),
('Andhra Pradesh','Anantapur'), ('Andhra Pradesh','Mahbubnagar');

--DROP TABLE States1
SELECT * FROM States1;

--SOLUTION
SELECT 
(CASE WHEN state='Karnataka' THEN 'Bengaluru Rural' END) AS Karnataka,
(CASE WHEN state='Karnataka' THEN 'Bengaluru Urban' END) AS Karnataka,
(CASE WHEN state='Rajasthan' THEN 'Jaisalmer' END) AS Rajasthan,
(CASE WHEN state='Rajasthan' THEN 'Bikaner' END) AS Rajasthan,
(CASE WHEN state='Andhra Pradesh' THEN 'Anantapur' END) AS Rajasthan,
(CASE WHEN state='Andhra Pradesh' THEN 'Mahbubnagar' END) AS Andhra_Pradesh
FROM
(
SELECT state, district, ROW_NUMBER() OVER(PARTITION BY state ORDER BY district) AS rn
FROM States1
) AS sub;
------------------------------------------------------------------------------------------
--Q6. WHICH WILL COME UNDER INNER, LEFT, RIGHT, FULL/OUTER, LEFT-NULL/ RIGHT-NULL JOINS.
