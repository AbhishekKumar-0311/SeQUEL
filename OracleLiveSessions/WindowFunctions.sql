-- Window Functions : https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/window-functions-usage.html

-- Create a table
create table emp as
select * from scott.emp

-- Display the table
select * from emp

-- Calculate the running total of Salary
select empno, ename, deptno, sal, sum(sal) over (partition by deptno order by sal) as sum_sal 
from emp

-- Find the Min Sal in each Department
select empno, ename, deptno, sal, min(sal) over (partition by deptno order by sal) as min_sal 
from emp

-- Find the Min Sal in each Department
select empno, ename, deptno, sal, min(sal) over (partition by deptno) as min_sal 
from emp

-- Find the Max Sal in each Department
select empno, ename, deptno, sal, max(sal) over (partition by deptno order by sal desc) as max_sal 
from emp

-- Find the Avg Sal in each Department
select empno, ename, deptno, sal, avg(sal) over (partition by deptno order by sal) as avg_sal 
from emp

-- Find the Min Sal in each Department
select empno, ename, deptno, sal, rank() over (partition by deptno order by sal desc) as rank_sal 
from emp

-- Find the Min Sal in each Department
select empno, ename, deptno, sal, dense_rank() over (partition by deptno order by sal desc) as drank_sal 
from emp

-- Find the Min Sal in each Department
select empno, ename, deptno, sal, row_number() over (partition by deptno order by sal desc) as rownum_sal 
from emp
order by deptno,sal

-- Find the Previously Joined Employee in each Department
select empno, ename, deptno, sal, lag(empno) over (partition by deptno order by empno) as prev_emp 
from emp

-- Find the Next Joined Employee in each Department
select empno, ename, deptno, sal, lead(empno) over (partition by deptno order by empno) as next_emp 
from emp

-- Find the Oldest Employee of each Department
select empno, ename, deptno, sal, first_value(ename) over (partition by deptno order by empno) as oldest_emp 
from emp

-- Find the Newest Employee of each Department
select empno, ename, deptno, sal, last_value(ename) over (partition by deptno order by empno) as newest_emp 
from emp

-- Find the 2nd Employee of each Department
select empno, ename, deptno, sal, nth_value(ename,2) over (partition by deptno order by empno) as second_emp 
from emp

-- Find the Employee with Nth Highest Salary in each Department
select empno, ename, deptno, sal, nth_value(ename,2) over (partition by deptno order by sal desc) as second_high_sal 
from emp

-- Sum of Salary in each department where employee count > 3
select deptno, sum(sal)
from emp
group by deptno
having count(empno) > 3

-- Create a table
CREATE TABLE "emp"  
   (	"EMP_ID" VARCHAR2(5 BYTE),  
	"EMP_NAME" VARCHAR2(20 BYTE),  
	"DEPT_ID" VARCHAR2(5 BYTE),  
	"EXPERTISE" VARCHAR2(50 BYTE),  
	"SALARY" NUMBER(10,2),  
	"RESULTS" VARCHAR2(10 BYTE) 
   )
   
-- Insert data values
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('5003','ABINASH','1','SCIENCE','PASS',50000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('5003','ABINASH','1','ENGLISH','PASS',50000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('5003','ABINASH','1','MATH','PASS',50000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('107','AMARESH','2','MATH','PASS',50000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('107','AMARESH','2','ENGLISH','PASS',50000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('105','JYOTI','3','MATH','FAIL',75000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('105','JYOTI','3','ENGLISH','PASS',75000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('7003','NISHAD','2','ENGLISH','FAIL',70000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('7003','NISHAD','2','MATH','PASS',70000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('6003','RAKESH','2','MATH','PASS',50556)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('6003','RAKESH','2','ENGLISH','FAIL',50556)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('104','RAVI','2','MATH','PASS',70000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('104','RAVI','2','ENGLISH','PASS',70000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('106','REDDY','2','MATH','FAIL',80000)
Insert into emp (EMP_ID,EMP_NAME,DEPT_ID,EXPERTISE,RESULTS,SALARY) values ('106','REDDY','2','ENGLISH','PASS',80000)