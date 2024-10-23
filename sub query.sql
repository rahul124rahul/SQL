-- Sub Query

create table stud_score
(rollno int , name varchar(23) , marks int);

insert into stud_score
values 
(101,'Anil',78),
(102,'Bhumika',93),
(103,'Chetan', 85),
(104,'Dhruv', 96),
(105,'Emanuel',92),
(106,'Faran',82);

select * from stud_score;

-- get names of all the students who scored more than class average

select * from stud_score
where marks > 
(select avg(marks) from stud_score);

select name , rollno , marks 
from stud_score
where marks >
(select avg(marks) from stud_score);

-- find the names of all the students with even roll numbers
select * from stud_score
where rollno%2=0;

select name , rollno from stud_score
where rollno%2=0;
-- or we can use the following way also
select name , rollno 
from stud_score
where rollno in 
	(select rollno 
	from stud_score
	where rollno%2=0);




-- adding column to the table
select * from stud_score;

alter table stud_score
add column city varchar(23);
select * from stud_score;

update stud_score
set city = case 
	when rollno = 101 then 'Pune'
	when rollno = 102 then 'Mumbai'
	when rollno = 103 then 'Mumbai'
	when rollno = 104 then 'Delhi'
	when rollno = 105 then 'Delhi'
	when rollno = 106 then 'Delhi'
end;

select * from stud_score;


-- find max marks from the students of the Delhi
-- use sub query in from 

select * 
from stud_score
where city = 'Delhi'
order by marks desc
limit 1;

select marks 
from stud_score
where city = 'Delhi'
order by marks desc
limit 1;

select max(marks) from stud_score
where city = 'Delhi';


select max(marks)
from (select * from stud_score where city = 'Delhi') as temp; -- as temp is compulsary in case of the sub query written in the from