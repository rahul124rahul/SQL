create table temp1
(id int primary key,name varchar(20));

insert into temp1
(id , name)
values
(101,'Science'),
(102,'English'),
(103,'Hindi');

select * from temp1;

-- using delete command and truncate command

delete from temp1;
select * from temp1;

truncate table temp1;
select * from temp1;




-- Q. Pracice question 
-- In the student table change name to full-name.
select * from student;

alter table student
rename column name to full_name;
select * from student;

-- Delete all the students who scored less than 80
select * from stud;

alter table stud
rename column name to short_name;
select * from stud;

delete from stud
where marks<80;
select * from stud;

-- Delete the column for the grade
alter table stud
drop column grade;
select * from stud;