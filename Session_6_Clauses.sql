select *
from vrinda

--channel wise quantity sold
--total row_count
select count(*) as row_count
from vrinda
--total column count
select count(*) as column_count from INFORMATION_SCHEMA.columns where table_name='vrinda'
--total_customer_id
select count(cust_id) as cust_count from vrinda
--total_ distinct_customer_id
select count(distinct gender) as dis_gen_count from vrinda

select * from vrinda

--channel level & gender level total qty sold
select channel,gender,sum(qty) as total_qty
from vrinda
group by channel,gender
order by channel

select * from vrinda


--category,shipcity wise total sales
select category,ship_city,sum(amount) as total_sales
from vrinda
group by category , ship_city
order by 1 asc,3 desc

select * from vrinda
--category,shipcity wise count of customer
select category,ship_city,count(distinct cust_id) as count_of_dis_cust
from vrinda
group by category,ship_city

--coopy to another table
select * into vrinda1 from vrinda
 select * from vrinda1

--copy selected column from vrinda to another table 
select order_id,cust_id,age,gender,status
into vrinda2 from vrinda

select * from vrinda
--total_sales qty * sales
select *,(qty*amount) as sales
from vrinda

select * from vrinda
























