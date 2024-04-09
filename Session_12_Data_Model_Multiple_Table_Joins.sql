use Practise

SELECT * FROM cust
SELECT * FROM prod
SELECT * FROM staff
SELECT * FROM store
SELECT * FROM supplier
SELECT * FROM txn

with ABC as
(
SELECT A.ORDER_ID,
A.ORDER_DT,
A.CUST_ID,
B.CUST_NAME,
B.DOB,
B.MOBILE,
A.PROD_ID,
C.PROD_NAME,
C.CATEGORY,
C.PRICE,
C.INVENTORY,
C.SUPPLIER_ID,
F.SUPPLIER_NAME,
F.LOCATION as supplier_location,
F.CONTACT,
A.QTY,
A.STORE_ID,
D.STORE_NAME,
D.LOCATION as store_location,
E.STAFF_ID,
E.STAFF_NAME,
E.DESIGNATION,
E.YOE
FROM txn AS A
LEFT JOIN cust as b
on a.CUST_ID=b.CUST_ID
left join prod as c
on a.PROD_ID=c.PROD_ID
left join store as d
on a.STORE_ID=d.STORE_ID
left join staff as e
on a.STAFF_ID=e.STAFF_ID
left join supplier as f
on c.SUPPLIER_ID=f.SUPPLIER_ID
)
--select supplier_location, sum(qty) as total_qty, min(qty) as min_qty, max(qty) as max_qty, avg(qty) as avg_qty, min(order_dt) as min_date, max(order_dt) as max_date
--from abc
--group by supplier_location

select store_location, sum(qty) as total_qty, min(qty) as min_qty, max(qty) as max_qty, avg(qty) as avg_qty, min(order_dt) as min_date, max(order_dt) as max_date
from abc
group by store_location

