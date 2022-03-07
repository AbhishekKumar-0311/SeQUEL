

Transposing Rows data into Columnar
Q: We have CUSTOMER table having columns as Customer_Name, Merchant_name (Amazon, Flipkart, Myntra etc.) and
Transaction_value (Purchase value for each of these merchants). Write a query to Transpose this into Customer Name,
Merchant Names as individual columns and their transaction value for each of the customers

Input Schema
Customer_Name Merchant_name Transaction_value

Output Schema
Customer_Name amazon myntra flipkart

-----------------------------------------------------------------------------------------------------

select coalesce(a,b,c) as Customer_Name, amazon, myntra, flipkart

from 

(select Customer_Name a, Transaction_value  as amazon
from CUSTOMER 
where Merchant_name  = 'amazon'

full outer join

select Customer_Name b , Transaction_value  as myntra
from CUSTOMER 
where Merchant_name  = 'myntra'

full outer join

select Customer_Name c, Transaction_value  as flipkart
from CUSTOMER 
where Merchant_name  = 'flipkart') as source


-----------------------------------------------------------------------------------------------------