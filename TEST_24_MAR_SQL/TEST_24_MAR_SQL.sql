create database TEST_SQL3

use TEST_SQL3

--Q1. CREATE A NEW TABLE MED_SELECT_V6 AND ADD THE FOLLOWING COLUMNS AS

--  AGE_BUCKET	
--	LESS THAN 30
--	30 TO 50
--	51 TO 70
--	70

select * from med_select_v6

select *,
case when age < 30 then 'Young_Age'
when (age >= 30 and age <= 50) then 'Mid_Age'
when (age >=51 and age <= 70) then 'Old_Age'
when age > 70 then 'Senior_Citizen'
end as Age_Bucket
from med_select_v6
	
--	SPENT_BUCKET	
--	LESS THAN 300
--	301 TO 500
--	501 TO 700
--	701 TO 1000
--	1000+

select *,
case when spent_amount < 300 then 'Low'
when (spent_amount >= 310 and spent_amount <= 500) then 'Average'
when (spent_amount >= 501 and spent_amount <= 700) then 'Mid'
when (spent_amount >= 701 and spent_amount <= 1000) then 'High'
when spent_amount > 1000 then 'Extreme_High'
end as Spent_Bucket
from med_select_v6

--	CUSTOMER_SEGMENT	
--	IF AGE BETWEEN 30 AND 70 AND GENDER=FEMALE AND SPENT_AMOUNT >=300	PREMIER
--	IF AGE BETWEEN 30 AND 70 AND GENDER=MALE AND SPENT_AMOUNT >=300	PREMIER
--	ELSE 	NON-PREMIER

select *,
case 
when (age >= 30 and age <= 70) and gender = 'Female' and spent_amount >= 300 then 'Premier'
when (age >= 30 and age <= 70) and gender = 'Male' and spent_amount >= 300 then 'Premier'
ELSE 	'NON-PREMIER'
end as Customer_Bucket
from med_select_v6

--ANS

With Khalifa as
(
select *,
case when age < 30 then 'Young_Age'
when (age >= 30 and age <= 50) then 'Mid_Age'
when (age >=51 and age <= 70) then 'Old_Age'
when age > 70 then 'Senior_Citizen'
end as Age_Bucket,

case when spent_amount < 300 then 'Low'
when (spent_amount >= 310 and spent_amount <= 500) then 'Average'
when (spent_amount >= 501 and spent_amount <= 700) then 'Mid'
when (spent_amount >= 701 and spent_amount <= 1000) then 'High'
when spent_amount > 1000 then 'Extreme_High'
end as Spent_Bucket,

case when (age >= 30 and age <= 70) and gender = 'Female' and spent_amount >= 300 then 'Premier'
when (age >= 30 and age <= 70) and gender = 'Male' and spent_amount >= 300 then 'Premier'
else 'Non_Premier'
end as Customer_Bucket

from med_select_v6
)

select * from Khalifa;


--Q2.	STATE_CODE wise Spent amount having total sales 300000.

With Khalifa as
(
select *,
case when age < 30 then 'Young_Age'
when (age >= 30 and age <= 50) then 'Mid_Age'
when (age >=51 and age <= 70) then 'Old_Age'
when age > 70 then 'Senior_Citizen'
end as Age_Bucket,

case when spent_amount < 300 then 'Low'
when (spent_amount >= 310 and spent_amount <= 500) then 'Average'
when (spent_amount >= 501 and spent_amount <= 700) then 'Mid'
when (spent_amount >= 701 and spent_amount <= 1000) then 'High'
when spent_amount > 1000 then 'Extreme_High'
end as Spent_Bucket,

case when (age >= 30 and age <= 70) and gender = 'Female' and spent_amount >= 300 then 'Premier'
when (age >= 30 and age <= 70) and gender = 'Male' and spent_amount >= 300 then 'Premier'
else 'Non_Premier'
end as Customer_Bucket

from med_select_v6
)

select state_code, sum(spent_amount) as total_sales
from Khalifa
group by state_code
having SUM(spent_amount) > 300000;



--Q3.	AGE_BUCKET wise total_spent where gender is male

With Khalifa as
(
select *,
case when age < 30 then 'Young_Age'
when (age >= 30 and age <= 50) then 'Mid_Age'
when (age >=51 and age <= 70) then 'Old_Age'
when age > 70 then 'Senior_Citizen'
end as Age_Bucket,

case when spent_amount < 300 then 'Low'
when (spent_amount >= 310 and spent_amount <= 500) then 'Average'
when (spent_amount >= 501 and spent_amount <= 700) then 'Mid'
when (spent_amount >= 701 and spent_amount <= 1000) then 'High'
when spent_amount > 1000 then 'Extreme_High'
end as Spent_Bucket,

case when (age >= 30 and age <= 70) and gender = 'Female' and spent_amount >= 300 then 'Premier'
when (age >= 30 and age <= 70) and gender = 'Male' and spent_amount >= 300 then 'Premier'
else 'Non_Premier'
end as Customer_Bucket

from med_select_v6
)
select age_bucket, sum(spent_amount) as total_sales
from Khalifa
where gender = 'male'
group by age_bucket


--Q4.	CUSTOMER_SEGMENT wise total_visits

With Khalifa as
(
select *,
case when age < 30 then 'Young_Age'
when (age >= 30 and age <= 50) then 'Mid_Age'
when (age >=51 and age <= 70) then 'Old_Age'
when age > 70 then 'Senior_Citizen'
end as Age_Bucket,

case when spent_amount < 300 then 'Low'
when (spent_amount >= 310 and spent_amount <= 500) then 'Average'
when (spent_amount >= 501 and spent_amount <= 700) then 'Mid'
when (spent_amount >= 701 and spent_amount <= 1000) then 'High'
when spent_amount > 1000 then 'Extreme_High'
end as Spent_Bucket,

case when (age >= 30 and age <= 70) and gender = 'Female' and spent_amount >= 300 then 'Premier'
when (age >= 30 and age <= 70) and gender = 'Male' and spent_amount >= 300 then 'Premier'
else 'Non_Premier'
end as Customer_Bucket

from med_select_v6
)

--select * from med_select_v6

select Customer_Bucket, sum(no_of_trips) as total_visits
from khalifa
group by Customer_Bucket


--Q5.	FROM TABLE MED_SELECT_V6 GET STATE_CODE (QLD AND VIC) AND COMPANY WISE SUM OF SPENT_AMOUNT >= 20000

SELECT STATE_CODE, COMPANY, SUM(spent_amount) AS Total_Spent
FROM MED_SELECT_V6
WHERE STATE_CODE IN ('QLD', 'VIC') --AND sum(spent_amount) >= 20000
GROUP BY STATE_CODE, COMPANY
HAVING SUM(spent_amount) >= 20000;
