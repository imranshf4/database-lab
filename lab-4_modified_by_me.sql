use university

--select * from instructor;

select dept_name,avg(salary)as avg_salary
from instructor
group by dept_name;

select dept_name,avg(salary)as avg_salary
from instructor
group by dept_name
having avg(salary)>75000

select*from instructor order by salary desc;
select*from instructor order by name asc;

--view is a virtual table which is consist of one or more table

create view faculty as
select ID,name,dept_name
from instructor

--to see virtual faculty table the query will be as follow
select * from faculty;

--Indexes are used to retrieve data from the database more quickly than otherwise.
-- The users cannot see the indexes, they are just used to speed up searches/queries.

CREATE INDEX dept_index
ON instructor (dept_name);



CREATE PROCEDURE instruct_proc
AS
BEGIN
select name as authors_name from instructor where ID='10121'
END
EXEC instruct_proc
select*from instructor 