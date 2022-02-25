order_product
+----------+------------+-----------+
| order_id | product_id | quantity  |
+----------+------------+-----------+
| 1        | a          | 2         |
| 1        | b          | 4         |
| 2        | b          | 2         |
| 3        | c          | 5         |
| 3        | a          | 3         |
| 4        | d          | 10        |
| 4        | e          | 5         |
+----------+------------+-----------+
Write a query that returns a single row for each order_id with a column for the quantity of product 'a',
one with the quantity of product 'b', and one with the quantity for all other products
Expected Query Result Example:
+----------+-----------------+-----------------+---------------------+
| order_id | prod_a_quantity | prod_b_quantity | prod_other_quantity |
+----------+-----------------+-----------------+---------------------+
| 1        | 2               | 4               | 0                   |
| 2        | 0               | 2               | 0                   |
| 3        | 3               | 0               | 5                   |
| 4        | 0               | 0               | 15                  |
+----------+-----------------+-----------------+---------------------+

create table a as
select order_id, product_id, quantity as prod_a_quantity
from order_product
where product_id = 'a'


1 a 2
3 a 3


create table b as
select order_id, product_id, quantity as prod_b_quantity
from order_product
where product_id = 'b'

1 b 4
2 b 2


create table others as
select order_id, 'others' as product_id, sum(quantity) as prod_other_quantity
from order_product
where product_id not in ('a','b')
group by order_id

3 others 5
4 others 15

create final_table as
select order_id, prod_a_quantity, prod_b_quantity, prod_other_quantity
from a full join b full join others
on a.order_id = b.order_id and a.order_id = others.order_id


a       b         c 
1 a 2   1 b 4     3 others 5
3 a 3   2 b 2     4 others 15

