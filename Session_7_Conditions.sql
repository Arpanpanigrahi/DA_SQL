----with clause

select * from MED_CIPLA
WITH ABC AS
(
SELECT STATE_CODE,SUM(NO_OF_TRIPS) AS TOTAL_TRIPS
FROM MED_CIPLA
GROUP BY STATE_CODE
)
SELECT * FROM ABC
WHERE TOTAL_TRIPS >10


SELECT * FROM ABC
SELECT STATE_CODE,SUM(NO_OF_TRIPS) AS TOTAL_TRIPS
FROM MED_CIPLA
GROUP BY STATE_CODE
HAVING SUM(NO_OF_TRIPS)>10

for female customer, statecode wise no of trip more than 5

select * from med_cipla
where gender='Female'

-----Having clause
select state_code,sum(no_of_trips) as total_trips
from med_cipla
where gender='Female'
group by state_code
having sum(no_of_trips)>5
order by 2 asc

--case when
select *, case when no_of_trips >=10 then 'Premier_cust'
when no_of_trips >=5 and no_of_trips <10 then 'Normal_cust'
when no_of_trips < 5 then 'avg_cust'
end as cust_bucket,
case when age>60 then 'OLD_AGE'
when (age >= 30 and age <=60) then 'MID_AGE'
when age < 30 then 'YOUNG_AGE'
end as age_bucket 
from MED_cipla





