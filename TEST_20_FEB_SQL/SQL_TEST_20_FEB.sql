--Q1. GET THIS DATA TO BE IMPORTED TO YOUR DATABASE WHICH IS TEST_SQL

create database TEST_SQL1

use TEST_SQL1

-- CALL THE TABLE NAME- MED_AUSTRALIA.
select * from MED_AUSTRALIA

--Q2. SELECT THE FOLOWWIING OUTPUT
--1.GET THE NUMBER OF RECORDS IN THE TABLE
select count(*) As Num_of_Records from MED_AUSTRALIA;

--2.GET THE NUMBER OF COLUMNS IN THE TABLE
select count(*) As Num_of_Columns
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'MED_AUSTRALIA';

--3.GET THE DISTINCT VALUES OF STATE_CODE
select count(distinct state_code)
from MED_AUSTRALIA

--4.GET COUNT OF DISTINCT VALUES OF COMPANY,STATE_CODE AND GENDER FIELDS TOGETHER 
select count(distinct company)as distinct_company_count, count(distinct state_code) as distinct_state_code_count,
count(distinct gender) as distinct_gender_count
from MED_AUSTRALIA

--select count(distinct (company, state_code, gender))
--from MED_AUSTRALIA;

--5.DESCRIBE THE TABLE BY NUMBER OF COLUMNS AND FIELD DATA TYPES
select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='MED_AUSTRALIA';

--Q3	CREATE A NEW TABLE AS MED_SELECT_V1 FROM MED_ASUTRALIA BY
--	SELCTING FIELDS LIKE
--	CUSTOMER_ID
--	COMPANY
--	GENDER
--	AGE
--	STATE_CODE
--	TOWN
--	NO_OF_TRIPS
--	SPENT_AMOUNT

select CUSTOMER_ID, COMPANY, GENDER, AGE, STATE_CODE, TOWN, NO_OF_TRIPS, SPENT_AMOUNT
into MED_SELECT_V1 from MED_AUSTRALIA;

select * from MED_SELECT_V1;

--	RENAME FIELDS AS
--	CUSTOMER_ID AS SUB_ID
--	COMPANY AS BUSINESS_HOUSE
--	STATE_CODE AS PROVINCE
--	SPENT_AMOUNT AS SPENT

select CUSTOMER_ID AS SUB_ID, COMPANY AS BUSINESS_HOUSE, STATE_CODE AS PROVINCE, SPENT_AMOUNT AS SPENT
FROM MED_SELECT_V1;


--Q4	CREATE A NEW TABLE FROM MED_SELECT_V1 TO MED_SELECT_V3
select * into MED_SELECT_V3 from MED_SELECT_V1;

select * from MED_SELECT_V3;

--	SELECT VALUES BASED ON CRITERIA AS
--	WHERE BUSINESS_HOUSE IN (APPOLO,GENO,RELGARE)
select * from MED_SELECT_V3 
WHERE Company IN ('APPOLO','GENO','RELGARE');

--	GENDER IN (FEMALE AND MALE)
select * from MED_SELECT_V3
where GENDER IN ('FEMALE','MALE');

--	STATE_CODE IN (ACT,NSW,WA,QLD)
select * from MED_SELECT_V3
where STATE_CODE IN ('ACT','NSW','WA','QLD')

--	SPENT_AMOUNT >= 500
select * from MED_SELECT_V3
where SPENT_AMOUNT >= 500

--	CARD_REG_DATE between 01/12/2006 and 31/12/2007   ????
select * from MED_AUSTRALIA
where CARD_REG_DATE between '12/01/2006' and '12/31/2007'

--Q4	CREATE A NEW TABLE FROM MED_SELECT_V1 TO MED_SELECT_V4
select * into MED_SELECT_V4 from MED_SELECT_V1;

select * from MED_SELECT_V4;

--SELECT ALL THE TOWN NAME STARTS WITH B AND GENDER=FEMALE AND AGE NETWEEN 30 AND 70
SELECT town
FROM MED_SELECT_V4
where town LIKE 'B%'
and gender = 'female'
AND age BETWEEN 30 AND 70

--Q5	CREATE A NEW TABLE FROM MED_SELECT_V1 TO MED_SELECT_V5
select * into MED_SELECT_V5 from MED_SELECT_V1;

select * from MED_SELECT_V5;

--	GET THE TABLE SORTED BY
--	STATE_CODE
--	COMPANY
--	GENDER 
--	SPENT_AMOUNT IN DESCENDING ORDER
select STATE_CODE, COMPANY, GENDER , SPENT_AMOUNT
from MED_SELECT_V5
ORDER BY state_code ASC, company ASC, gender ASC, spent_amount DESC;
--OR
SELECT *
FROM MED_SELECT_V5
ORDER BY state_code ASC, company ASC, gender ASC, spent_amount DESC;
-------------------------------------------------------------------------------------------------------------

--TASK-2
--Get Company wise total customer,total visit & total spent
select * from MED_AUSTRALIA

select company, count(distinct customer_id) as total_customers, count(*) as total_visits, sum(spent_amount) as total_spent
FROM MED_AUSTRALIA
group by Company;

--Get Company and gender wise total customer,total visit & total spent
select company, gender, count(distinct customer_id) as total_customers, count(*) as total_visits, sum(spent_amount) as total_spent
from MED_AUSTRALIA
group by Company, GENDER
order by company;

--get statecode company wise total spent
select state_code, company, sum(spent_amount) as total_spent
from MED_AUSTRALIA
group by STATE_CODE, Company
order by STATE_CODE;

--------------------------------------------------------------------------------------------------------------




