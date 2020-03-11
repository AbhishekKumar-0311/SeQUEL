/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

/* WITH T AS ( SELECT S.ID, S.NAME, P.PACKAGES FROM STUDENTS S, PACKAGES P WHERE S.ID=P.ID) */
WITH T AS ( SELECT F.ID, P.SALARY AS FS FROM FRIENDS F, PACKAGES P WHERE F.FRIEND_ID=P.ID)
SELECT S.NAME
FROM T, STUDENTS S, PACKAGES P
WHERE T.ID=S.ID AND S.ID=P.ID AND T.FS > P.SALARY
ORDER BY T.FS ;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select a.name from students a inner join
packages ap on a.id = ap.id 
inner join friends f
on a.id = f.id
inner join packages fp
on fp.id = f.friend_id
where fp.salary>ap.salary
order by fp.salary;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT STUDENTS.NAME
FROM STUDENTS
INNER JOIN FRIENDS ON T_FRIENDS ON FRIENDS.FRIEND_ID = BEST_FRIENDS.ID 
INNER JOIN PACKAGES ON STUDENTS.ID = PACKAGES.ID
INNER JOIN PACKAGES BEST_FRIEND_PACKAGES ON BEST_FRIENDS.ID = BEST_FRIEND_PACKAGES.ID
WHERE PACKAGES.SALARY < BEST_FRIEND_PACKAGES.SALARY
ORDER BY BEST_FRIEND_PACKAGES.SALARY ASC;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
WITH RECS AS (SELECT
  S.NAME,F.FRIEND_ID,P1.SALARY,P2.SALARY
FROM
  STUDENTS S,
  FRIENDS F,
  PACKAGES P1,
  PACKAGES P2
WHERE
  S.ID=F.ID
  AND S.ID=P1.ID
  AND F.FRIEND_ID=P2.ID
  AND P2.SALARY > P1.SALARY
ORDER BY P2.SALARY)
SELECT NAME FROM RECS;

select
    s1.name
from
friends f
left join students s1 on (s1.id = f.id)
left join students s2 on (s2.id = f.friend_id)
left join packages p1 on (p1.id = f.id)
left join packages p2 on (p2.id = f.friend_id)
where
    p1.salary < p2.salary
order by
    p2.salary asc
;



