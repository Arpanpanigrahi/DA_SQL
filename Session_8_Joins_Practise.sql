create database Practise;

use Practise

--Vertical Join

select * from table_1
select * from table_2

--UNION
select * from table_1
UNION
select * from table_2

--UNION ALL
select * from table_1
UNION ALL
select * from table_2

--Horizontal Join

select * from LEFT_1;
select * from RIGHT_2;

--FULL JOIN
SELECT  A.ID,A.STU_NAME,A.SUBJECT,A.MARKS,B.ID,B.LOCATION
FROM LEFT_1 AS A
FULL JOIN RIGHT_2 AS B
ON A.ID=B.ID

--INNER JOIN
SELECT A.*,B.LOCATION
FROM LEFT_1 AS A
INNER JOIN RIGHT_2 AS B
ON A.ID = B.ID

SELECT A.*,B.*
FROM LEFT_1 AS A
INNER JOIN RIGHT_2 AS B
ON A.ID = B.ID

--LEFT JOIN
SELECT A.*,B.*
FROM LEFT_1 AS A
LEFT JOIN RIGHT_2 AS B
ON A.ID = B.ID

--RIGHT JOIN
SELECT A.*,B.*
FROM LEFT_1 AS A
RIGHT JOIN RIGHT_2 AS B
ON A.ID = B.ID


--LEFT NULL
SELECT A.*,B.*
FROM LEFT_1 AS A
LEFT JOIN RIGHT_2 AS B
ON A.ID = B.ID 
WHERE B.ID IS NULL


--RIGHT NULL
SELECT A.*,B.*
FROM LEFT_1 AS A
RIGHT JOIN RIGHT_2 AS B
ON A.ID = B.ID
WHERE A.ID IS NULL