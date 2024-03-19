SELECT * FROM EMP3

select dob,stu_id,stu_name,gender,age from emp3


select 
stu_id,
stu_name,
age,
gender,
dob

--To print the column name & to know the data types
select *
from information_schema.columns  where table_name='emp3'

--to add 10 years to age column
select *,(age+10) as new_age from emp3


--for sort operation we use order by clause
select * from emp3
order by age
--by default it takes ascending order
--for descending order we ll write desc in the last (Order by always used after where clause)
select * from emp3
order by age desc

--order of excution
select * 
from emp3
where gender='male'
order by age desc
--Correct way of execution of select query
as per akash   as per arpan
1.From         1.From    
2.where        2.Where
3.select        3.Select   
4.order by       4.Order by 

select * from vrinda

-- sql aggregation
select channel,max(amount) as max_sale,min(amount) as min_sale,sum(amount) as total_sale
from vrinda
where gender <> 'women'
group by channel
order by total_sale

--Correct way of execution of select query
1.From
2.where
3.group by 
4.select
5.order by 

select channel,Gender,max(amount) as max_sale,min(amount) as min_sale,sum(amount) as total_sale
from vrinda
group by channel,Gender
order by channel,max_sale asc












