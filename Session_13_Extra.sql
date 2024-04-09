--HOW TO SWAP TWO VALUES
select * from P1

UPDATE [P1]
SET [A] = [B],
   [B] = [A]
GO


SELECT REVERSE('SQL Tutorial');


--HOW TO UPDATE NA AS 0
select * from P2

UPDATE P2
SET column1 = 0
WHERE column1 = 'NA';