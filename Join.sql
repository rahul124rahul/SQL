-- joins between the two tables having same column


create table stud2
(stud_id int , name varchar(25));

insert into stud2
values
(101,'Adam'),
(102,'Bob'),
(103,'Casey');

select * from stud2;


create table course
(student_id int ,name varchar(25));

insert into course
values
(102,'English'),
(105,'Math'),
(103,'Science'),
(107,'Computer Science');

select * from course;

-- Inner join
select * from stud2
inner join course
on stud2.stud_id = course.student_id;

select stud_id,stud2.name,course.name from stud2 
inner join course
on stud2.stud_id = course.student_id;

-- we can use alias => alternet name for the following
select stud_id as id , s.name as name , c.name as subject 
from stud2 as s
inner join course as c
on s.stud_id = c.student_id;


-- Left join
select stud_id as id , s.name , c.name as subject
from stud2 as s
left join course as c
on s.stud_id = c.student_id;


-- Right join 
select * from stud2 as s
right join course as c
on s.stud_id = c.student_id;

select  c.student_id as student_id ,c.name as subject , s.name as student 
from stud2 as s
right join course as c
on s.stud_id = c.student_id;


-- Full join 

select * from stud2 as s
full join course as c
on s.stud_id = c.student_id;


-- left exclusive join
select * from stud2 as s
left join course as c
on s.stud_id = c.student_id;

select * from stud2 as s
left join course as c
on s.stud_id = c.student_id
where c.student_id is NULL;

select s.stud_id as id , s.name as student_name
from stud2 as s
left join course as c
on s.stud_id = c.student_id
where student_id is null;

-- right exclusive join
select * from stud2 as s
right join course as c
on s.stud_id = c.student_id;

select student_id , c.name as subject  from stud2 as s
right join course as c
on s.stud_id = c.student_id;

select student_id , c.name as subject  from stud2 as s
right join course as c
on s.stud_id = c.student_id
where s.stud_id is null;


-- full exclusive join
select * from stud2 as s
full join course as c
on stud_id = student_id
where stud_id is null or c.student_id is null;


-- Imp
-- self join

create table Emp
(id int , name varchar(23) , manager_id int);

insert into Emp
values
(101,'Adam',103),
(102,'Bob',104),
(103,'MV',null),
(104,'Donald',103);

select * from Emp;


select * 
from Emp as e
join Emp as m
on e.id = m.manager_id;

select e.name as Manager , m.name as Employee
from Emp as e
join Emp as m
on e.id = m.manager_id;




-- Union

select * from Emp;
select * from stud2;

-- eg 1
select name from Emp
union
select name from stud2;

select name from Emp
union all
select name from stud2;

-- eg 2
select id from Emp
union 
select stud_id from stud2; 

select id from Emp
union all
select stud_id from stud2; 

-- eg 3
select manager_id from Emp
union 
select stud_id from stud2; 

select manager_id from Emp
union all
select stud_id from stud2; 