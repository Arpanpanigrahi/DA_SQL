use Practise;

select * from table_2

1st- union
2nd- select table
3d- aggregate
4th- join 2nd & 3rd
--Company wise state_code share
-- state_code wise company share
-- year wise state_code market share


--Company wise state_code share
with abc as
(
select * from table_1
union
select * from table_2
)
select a.*,b.total_qty,(a.qty*100/b.total_qty) as MS from abc as a
left join
(
select company,sum(qty) as total_qty
from abc 
group by company 
)as b
on a.company = b.company


-- state_code wise company share
with abc as
(
select * from table_1
union
select * from table_2
)
select a.*,b.total_qty,(a.qty*100/b.total_qty) as MS from abc as a
left join
(
select state_code,sum(qty) as total_qty
from abc 
group by state_code 
)as b
on a.state_code = b.state_code


-- year wise state_code market share
with abc as
(
select * from table_1
union
select * from table_2
)
select a.*,b.total_qty,(a.qty*100/b.total_qty) as MS from abc as a
left join
(
select Year,sum(qty) as total_qty
from abc 
group by Year 
)as b
on a.Year = b.Year
