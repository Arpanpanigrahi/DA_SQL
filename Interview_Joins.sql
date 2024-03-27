--Total Number of Rows When we do 
--1. Left Join
--2. Right Join
--3. Inner Join
--4. Full Outer Join
use Interview_Query

select * from Table_1_Id_1;

select * from Table_2_Id_2;

--LEFT JOIN
select * from Table_1_Id_1;

select A.*, B.*
From Table_1_Id_1 AS A
LEFT JOIN Table_2_Id_2 AS B
ON A.column1 = B.column1;

select A.*, B.*
From Table_1_Id_1 AS A
RIGHT JOIN Table_2_Id_2 AS B
ON A.column1 = B.column1;

