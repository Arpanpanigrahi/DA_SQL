use Practise

select * from bablu2

--Display where the price is NULL
select * from bablu2
where _2020_PRICE IS NULL OR _2021_PRICE IS NULL

--To replace old_value with new_value we use COALESCE
select product,coalesce(_2020_PRICE,0) as _2020_PRICE, coalesce(_2021_PRICE,0) as _2021_PRICE
from bablu2

--To Find average price of 2020 and 2021
select avg(_2020_PRICE) as avg_2020_PRICE, avg(_2021_PRICE) as _2021_PRICE
from bablu2

--Replace Lastest Price If NULL is present then replace with its previous value
select product, _2020_PRICE, _2021_PRICE, 
CASE WHEN _2021_PRICE IS NULL THEN _2020_PRICE ELSE _2021_PRICE 
END AS LATEST_PRICE
from bablu2

--Using CTE
with CTE as
(
select *, 1 as ID from bablu2
)
--select * from cte
, cte2 as
(
select 1 as ID, avg(_2020_PRICE) as AVG_2020_PRICE, avg(_2021_PRICE) as AVG_2021_PRICE
from bablu2
)
--select * from cte2
, cte3 as
(
select A.*, B.AVG_2020_PRICE, B.AVG_2021_PRICE
from cte as a
left join cte2 as b
on a.id = b.id
)
--select * from cte3
select product, _2020_PRICE, _2021_PRICE, coalesce(_2020_PRICE, AVG_2020_PRICE) as NEW_2020,
										  coalesce(_2021_PRICE, AVG_2021_PRICE) as NEW_2021
from cte3