select * from student;

-- alter command in DDL used to change the schema

-- adding column in the table
alter table student
add column age int; 

select * from student;

-- delete column from the table
alter table student 
drop column age;

select * from student;

alter table student 
rename to stud0;

-- Following will give error
-- select * from student;
select * from stud0;

-- change the column name cityid to Cid and datatype int to tinyint

alter table stud0
rename column cityid to Cid;

alter table stud0
alter column Cid type smallint;

select * from stud0;

-- Modify columns
alter table stud0
alter column name type varchar(25);

alter table stud0
add constraint name unique(name);

select * from stud0;



-- exercise for the alter command

-- add column

alter table stud0
add column age int not null default 21;

select * from stud0;

-- modifying column
alter table stud0
alter column age type varchar(2);

select * from stud0;


-- rename column
alter table stud0
rename column age to stu_age;
select * from stud0;

-- following is important for the type changing 
alter table stud0
alter column stu_age type integer using stu_age::integer;

select * from stud0;

-- Deleting the column
alter table stud0
drop column stu_age;

select * from stud0;

-- Rename the table 
alter table stud0
rename to student;

-- Following will give an error
-- select * from stud0;
select * from student;
