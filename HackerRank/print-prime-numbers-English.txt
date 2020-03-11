select '2&3&5&7&11&13&17&19&23&29&31&37&41&43&47&53&59&61&67&71&73&79&83&89&97&101&103&107&109&113&127&131&
137&139&149&151&157&163&167&173&179&181&191&193&197&199&211&223&227&229&233&239&241&251&257&263&269&271&277&
281&283&293&307&311&313&317&331&337&347&349&353&359&367&373&379&383&389&397&401&409&419&421&431&433&439&443&449
&457&461&463&467&479&487&491&499&503&509&521&523&541&547&557&563&569&571&577&587&593&599&601&607&613&617&619&631
&641&643&647&653&659&661&673&677&683&691&701&709&719&727&733&739&743&751&757&761&769&773&787&797&809&811&821&823&827
&829&839&853&857&859&863&877&881&883&887&907&911&919&929&937&941&947&953&967&971&977&983&991&997';


select listagg (num, '&') within group (order by num) from ( select n1.num num, sum(case when mod(n1.num,n2.num) = 0 then 1 else 0 end) as cnt from (select rownum num from dual connect by level <= 1000) n1, (select rownum num from dual connect by level <= 1000) n2 
where n1.num<>1 and n2.num<>1 and n1.num>=n2.num group by n1.num) a where cnt = 1;

with numSel as (
    select level num from dual connect by level <= 1000
),
primes as (
    select a.num p
      from numSel a, numSel b
     where b.num <= a.num
     group by a.num
    having count(case a.num/b.num when trunc(a.num/b.num) then 'Y' end) = 2
)
select listagg(p, '&') within group (order by p)
  from primes
;

select
       LTRIM(MAX(SYS_CONNECT_BY_PATH(n,'&'))
       KEEP (DENSE_RANK LAST ORDER BY curr),'&')
from
(select na.n,
 ROW_NUMBER() OVER (ORDER BY na.n) AS curr
 from 
(select rownum+1 n from dual connect by level <= 999) na
where
na.n not in 
(select distinct(a.n) from (select rownum n from dual connect by level <= 1000) a, (select rownum n from dual connect by level <= 1000) b where b.n<a.n and b.n>1 and mod(a.n, b.n)=0) 
order by na.n)
CONNECT BY PRIOR curr = curr -1
START WITH curr = 1;

select ltrim(m,'&')
from
(
select 
SYS_CONNECT_BY_PATH(a,'&') as m,level as lvl, max(level) over () as max_lvl
from 
(
 select 
row_number() over (order by a desc)+1 as z,
 row_number () over ( order by a desc ) as y,
a
from  
(
(select a 
from 
(select a,min (rem) as rem
from
(select a.r as a,b.r, mod(a.r,b.r) as rem
from
(select rownum r from dual connect by rownum<=1000) a
left outer join
(select rownum r from dual connect by rownum<=1000) b
on
a.r>=b.r
where 
a.r != b.r
and 
b.r !=1 )
group by 
a)
where rem!=0
)
union
select 2 as a from dual)
)
connect by PRIOR y=z   
)
where lvl=max_lvl; 

select 2||'&'||listagg(st,'&') within group(order by st) from (
select  st from (
select st,n,mod(st,n)as m from
(select level+1 st    from dual connect by 1=1 and level<1000)a ,
(select level+1 n    from dual connect by 1=1 and level<1000)b where n<=st and n!=st) where m!=0
minus
select  st from (
select st,n,mod(st,n)as m from
(select level+1 st    from dual connect by 1=1 and level<1000)a ,
(select level+1 n    from dual connect by 1=1 and level<1000)b where n<=st and n!=st) where m=0);

select LISTAGG(primeno, '&') WITHIN GROUP (ORDER BY primeno)  from
(
select l as primeno
from (select level l from dual connect by level <= 1000),
(select level m from dual connect by level <= 1000)
where m<=l
group by l
having count(case l/m when trunc(l/m) then 'Y' end) = 2
order by l);

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
SELECT SUBSTR(SYS_CONNECT_BY_PATH(prime, '&'), 2) p
FROM (
  SELECT
  prime,
  ROW_NUMBER() OVER (ORDER BY prime) r,
  COUNT(*) OVER () r1
  FROM
    (SELECT ROWNUM prime FROM DUAL CONNECT BY ROWNUM <= 1000),
    (SELECT ROWNUM primecheck FROM DUAL CONNECT BY ROWNUM <= 1000)
  WHERE primecheck <= prime
  GROUP BY prime
  HAVING COUNT(
    CASE
      WHEN prime / primecheck = TRUNC(prime / primecheck)
        THEN 1
      END
  ) = 2
  ORDER BY prime
)
WHERE r = r1
START WITH r = 1
CONNECT BY r = PRIOR r + 1;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

declare @table table(number int,prime bit)

declare @i int
set @i = 2
while @i <= 1000
begin
    insert into @table
    select @i,1
    set @i = @i + 1
end

--sieve of eratosthenes
declare @n int
set @n = 2
while @n <= sqrt(1000)
begin
    
    declare @m int
    set @m = @n * 2

    while @m<=1000
    begin
    update @table 
    set prime=0
    where number=@m

    set @m = @m + @n
    end

    set @n = @n + 1
end

declare @primes varchar(8000) 
set @primes = '2&3'
declare @j int
set @j = 5
while @j <=1000
begin
    declare @b bit
    select @b=prime from @table where number=@j
    if 1 = @b
    begin
        set @primes = @primes + '&' + cast(@j as varchar(4))
    end
    set @j = @j + 1;
end

select @primes