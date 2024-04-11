function:-
select * from vrinda

--select only 5 columns from  a table
select [index], order_id,cust_id,gender,age,[date]
into table_new
from vrinda

select * from table_new

--hardcoded columns
select *,'INDIA' as country from table_new
--add todays date
select *,getdate() as today_dt
from table_new
--Function:-
char
date
arithmatic
--char
--upper
select *,upper(gender) as gender_new
from table_new
--lower
select *,lower(gender) as gender_new
from table_new
--concat
select *,concat(cust_id,'_',gender) as concat_new
from table_new

select *,'bablu sahu' as name into table_new1 from table_new

select * from table_new1
--position of special_character
--char index
select CHARINDEX(' ',name) space_pos from table_new1

select * from table_new1
--pat index
select PATINDEX('% %',name) space_pos from table_new1

SELECT * FROM TABLE_NEW1
--FIRST NAME & LAST NAME
SELECT *,SUBSTRING(NAME,1,CHARINDEX(' ',NAME)-1) AS FISRT_NAME,
SUBSTRING(NAME,CHARINDEX(' ',NAME)+1,5) AS LAST_NAME
FROM TABLE_NEW1

SELECT * FROM TABLE_NEW1
--RENAME THE SURNAME
SELECT *,REPLACE(NAME,'sahu','biswal') as new_name from table_new1

-numeric
addition,sub,multi,division
select *,age+20 ,age-10,age*10,age/10 from table_new1

--aggregate function
sum,min,max,avg,count,distinct

select *,-1 as value into y from table_new1

select * from y

---abs
select *, abs(value) as new_value from y

--format
select *,format(profit,'N2') as new_profit from sample

ceiling
floor

select profit,CEILING(profit) as new_profit from sample
select profit,floor(profit) as new_profit from sample

--in currency format
select profit,format(profit,'C0','INR-IN') as new_profit from sample

--datetime
select *, GETDATE() as todays_date from sample
--year
select *, year(order_date) as year from sample
--month
select *, month(order_date) as month from sample
--day
select *, day(order_date) as day from sample
--year month
select order_date,year(order_date)*100+month(order_date) as ym from sample

--dateparts
select datefromparts(2010,10,10) as dt

select * from sample
--print month name
select order_date,datename(month,order_date) as month_name from sample
--convert date timstamp to date
select getdate() ,convert(date,getdate()) as dt

datediff--years days month diff
select datediff(day,order_date,getdate()) from sample

--add ,sub date
select order_date,dateadd(day,5,order_date) as new from sample
select order_date,dateadd(month,5,order_date) as new from sample
select order_date,dateadd(year,5,order_date) as new from sample

select *,cast(age as varchar) new_age from table_new1


select * from bablu2
select COALESCE(_2020_PRICE,0) FROM BABLU2 







































from table_new











