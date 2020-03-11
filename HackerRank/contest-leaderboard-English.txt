/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with t as
(
select tin.hacker_id,name,sum(mxs) as smxs
from hackers h, (select hacker_id, challenge_id, max(score) as mxs
 from submissions
 group by hacker_id, challenge_id) tin
where h.hacker_id = tin.hacker_id
group by tin.hacker_id,name
having sum(mxs) != 0
    )
select hacker_id,name,smxs
from t
order by smxs desc, hacker_id;

select * from 
(select hackers.hacker_id, name, sum(subs.maxscore) as totalscore from hackers INNER JOIN 
(select hacker_id, challenge_id, max(score) as maxscore from submissions
group by hacker_id, challenge_id) subs
on hackers.hacker_id=subs.hacker_id
group by hackers.hacker_id, hackers.name) data 
where data.totalscore > 0
order by data.totalscore desc, hacker_id;

with a as (
select
    s.hacker_id, s.challenge_id, max(s.score) as score
from
    submissions s
group by
    s.hacker_id, s.challenge_id
)
select
h.hacker_id, h.name, sum(a.score)
from
hackers h
join a on (a.hacker_id = h.hacker_id)
group by
h.hacker_id, h.name
having sum(a.score) > 0
order by
3 desc, 1 asc
;

with t as (select distinct h.hacker_id hid ,h.name name,challenge_id, max(s.score) over (partition by h.hacker_id,s.challenge_id) score from hackers h , submissions s where h.hacker_id = s.hacker_id order by h.hacker_id)
select t.hid,t.name,sum(score)
from t
group by t.hid,t.name
having sum(score) > 0
order by sum(score) desc,t.hid;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select a.hacker_id,b.name,a.mscore from 
(select hacker_id,sum(max_score) as mscore from (select hacker_id,challenge_id,max(score) as max_score from submissions group by hacker_id,challenge_id) group by hacker_id order by mscore desc,hacker_id) a,
(select hacker_id,name from hackers) b
where a.hacker_id = b.hacker_id  and a.mscore <> 0 ;