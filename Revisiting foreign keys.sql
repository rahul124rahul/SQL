select * from stud;

delete from stud 
where name = 'Faran';
select * from stud;


-- Revisiting foreign keys

create table department(
	id  int primary key,
	name varchar(50)
);

insert into department
(id , name)
values
(101,'Science'),
(102,'English'),
(103,'Hindi');

select * from department;
-- drop table courses;
create table teacher 
(id int primary key, name varchar(50),
dept_id int, 
foreign key (dept_id) references department(id) 
on delete cascade
on update cascade);

insert into teacher 
(id , name , dept_id)
values
(101,'Adam',101),
(102,'Bob',103),
(103,'Casey',102),
(104,'Donald',102);

select * from teacher;
-- drop table teacher;

-- lets us check use of on delete cascade and on update cascade
update department
set id = 234 
where id = 102;

select * from department;
-- Here change is reflected in the teacher table
select * from teacher;


delete from department
where name = 'Hindi';

select * from department;
-- Here change is reflected in the teacher table
select * from teacher;