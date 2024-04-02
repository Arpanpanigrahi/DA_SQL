use Practise;

select * from sql_join
select * from sql_join2

--City_category wise total sales
with abc as
(
select a.Product, a.City, a.Sales, b.City_category
from SQL_JOIN as a
left join SQL_JOIN2 as b
on a.Product = b.Product and a.City = b.City
)
select city_category, sum(sales) as total_sales
from abc
group by city_category


--City_category wise total sales where city not equal to Bangalore
with abc as
(
select a.Product, a.City, a.Sales, b.City_category
from SQL_JOIN as a
left join SQL_JOIN2 as b
on a.Product = b.Product and a.City = b.City
--where city != 'Bangalore'
)
select city_category, sum(sales) as total_sales
from abc
where city != 'Bangalore'
group by city_category


--City_category, product wise total sales where sales > 5000.
with abc as
(
select a.Product, a.City, a.Sales, b.City_category
from SQL_JOIN as a
left join SQL_JOIN2 as b
on a.Product = b.Product and a.City = b.City
)
select city_category, product, sum(sales) as total_sales
from abc
group by city_category, product
having sum(sales)>5000


--city_category,product wise total sales

with abc as
(
select a.product,a.city,a.sales,b.city_category
from sql_join as a
left join sql_join2 as b
on a.product=b.product and a.city=b.city
)
select city_category,product,sum(sales) as total_sales
from abc
group by city_category,product
having sum(sales) >5000
-----------------------------------------------------------

with abc as (
    select a.product, a.city, a.sales, b.city_category
    from sql_join as a
    left join sql_join2 AS b
    on a.product = b.product and a.city = b.city
),
abc2 as (
    select city_category, product, sum(sales) as total_sales
    from abc
    group by city_category, product
),
abc3 as (
    select *, 1 as SI_NO 
    from abc2
),
abc4 as (
    select avg(total_sales) as average_sales, 1 as SI_NO
    from abc2
)
--select * from abc3;

--select * from abc4;

--select * 
--from abc3 
--left join abc4 
--on abc3.SI_NO = abc4.SI_NO;

select abc3.*, abc4.average_sales,
case
when abc3.total_sales > abc4.average_sales then 'Above Average' else 'Below Average'
end as sales_status
from abc3
left join abc4 
on abc3.SI_NO = abc4.SI_NO;

