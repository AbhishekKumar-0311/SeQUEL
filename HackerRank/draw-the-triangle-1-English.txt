/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT   RPAD ('* ', (21-LEVEL)*2, '* ')
FROM DUAL
CONNECT BY LEVEL < 21;

with sel as (
select 20 v from dual
)
select trim(rpad(' ', (v-level+1)*2, '* '))
  from dual, sel
 connect by level <= v;
 
 /*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select decode(level, 1, '* * * * * * * * * * * * * * * * * * * *', 2, '* * * * * * * * * * * * * * * * * * *', 3, '* * * * * * * * * * * * * * * * * *', 4, '* * * * * * * * * * * * * * * * *', 5, '* * * * * * * * * * * * * * * *', 6, '* * * * * * * * * * * * * * *', 7, '* * * * * * * * * * * * * *', 8, '* * * * * * * * * * * * *', 9, '* * * * * * * * * * * *', 10, '* * * * * * * * * * *', 11, '* * * * * * * * * *', 12, '* * * * * * * * *', 13, '* * * * * * * *', 14, '* * * * * * *', 15, '* * * * * *', 16, '* * * * *', 17, '* * * *', 18, '* * *', 19, '* *', 20, '*') from dual connect by level <= 20;


/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select rpad('* ', rownum * 2, '* ') from dual CONNECT BY LEVEL <= 20 order by 1 desc;

select LPAD('*', 41-level*2, '* ')
from dual
connect by level <= 20;

select st from (
select sys_connect_by_path(st,' ') st ,level as lvl from (
select '*' as st from dual) connect by st = st and  level<=20) order by lvl desc ;

select * from (select trim(replace(rpad(' ',lvl+1,'*'),'*','* ')) as op from (select level as lvl from dual connect by level <=20)A)B order by length(op) desc;

SELECT  REPLACE(RPAD('*', 20 - LEVEL + 1, '*'), '*', '* ')
   FROM dual
CONNECT BY LEVEL <= 20;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select rpad( '* ', level*2, '* ' )
from dual
connect by level <= 20
order by rowid desc;

