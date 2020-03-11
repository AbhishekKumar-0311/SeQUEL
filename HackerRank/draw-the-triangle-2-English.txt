select rpad('*', x,' *') from ( SELECT LEVEL x FROM DUAL CONNECT BY LEVEL <= 40 Order by Level desc ) where mod(x,2) = 0;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
SELECT     RPAD ('* ', LEVEL*2, '* ')
FROM       DUAL
CONNECT BY LEVEL <= 20 ;

select trim(rpad(' ', level*2, '* '))
  from dual
 connect by level <= 20;
 
 /*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select LPAD(' ', (level*2),'* ')  from dual  connect by level<=20;

