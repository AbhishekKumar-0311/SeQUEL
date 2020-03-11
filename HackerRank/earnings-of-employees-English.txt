/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with t as (
select earnings, count(*) as cnt
from (select employee.*, months*salary as earnings
from employee)
group by earnings
    )
select t.*
from t
where  cnt= (select max(cnt) from t)
;

with t as (
select months*salary as earnings, count(*) as cnt
from employee
group by months*salary
    )
select t.*
from t
where  cnt= (select max(cnt) from t)
;


select * from (
select months * salary, count(*)
from employee
group by months * salary
order by 1 desc
) where rownum = 1;

select salary * months as m, count(name)
from employee
where salary * months = (select max(salary*months) from employee)
group by salary * months;

SELECT months*salary earnings, COUNT(employee_id) FROM Employee
 WHERE months*salary = (SELECT MAX(months*salary) FROM Employee)
GROUP BY months*salary;