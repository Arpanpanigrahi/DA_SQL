 --WHICH PRODUCT HAS BEEN SOLD MORE THAN THE COUNTRY WISE AVG VALUE USING SUB QUERY

SELECT * FROM
(
SELECT C.*,CASE WHEN C.QTY>C.AVG_QTY THEN 'YES' ELSE 'NO' END AS STATUS
FROM
(
SELECT A.*,B.AVG_QTY
FROM BOOK10 AS A
LEFT JOIN
(
SELECT COUNTRY,AVG(QTY) AS AVG_QTY
FROM BOOK10
GROUP BY COUNTRY
) AS B
ON A.COUNTRY=B.COUNTRY


----USING WITH CLAUSE
WITH ABC AS
(
SELECT A.*,B.AVG_QTY 
FROM BOOK10 AS A
LEFT JOIN
(
SELECT COUNTRY,AVG(QTY) AS AVG_QTY
FROM BOOK10
GROUP BY COUNTRY
) AS B
ON A.COUNTRY=B.COUNTRY
)
, ABC2 AS
(
SELECT *,CASE WHEN QTY>AVG_QTY THEN 'YES' ELSE 'NO' END AS STATUS 
FROM ABC
)
SELECT * FROM ABC2
WHERE STATUS='YES'
) C
) AS D
WHERE D.STATUS='YES'

