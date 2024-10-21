-- Database: Organization

-- DROP DATABASE IF EXISTS "Organization";

CREATE DATABASE "Organization"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


	-- table creation
	CREATE TABLE Worker (
		WORKER_ID INT NOT NULL PRIMARY KEY,
		FIRST_NAME CHAR(25),
		LAST_NAME CHAR(25),
		SALARY INT,
		JOINING_DATE TIMESTAMP,
		DEPARTMENT CHAR(25)	
	);
		
	INSERT INTO Worker
		( WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
		VALUES
		(1, 'Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
	    (2, 'Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
	    (3, 'Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
	    (4, 'Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
	    (5, 'Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
	    (6, 'Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
	    (7, 'Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
	    (8, 'Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

	Select * from worker;


	CREATE TABLE Title (
	    WORKER_REF_ID INT,
	    WORKER_TITLE CHAR(25),
	    AFFECTED_FROM TIMESTAMP,
	    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker (WORKER_ID) ON DELETE CASCADE
	);
	
	INSERT INTO Title
	    (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) 
	VALUES
	    (1, 'Manager', '2016-02-20 00:00:00'),
	    (2, 'Executive', '2016-06-11 00:00:00'),
	    (8, 'Executive', '2016-06-11 00:00:00'),
	    (5, 'Manager', '2016-06-11 00:00:00'),
	    (4, 'Asst. Manager', '2016-06-11 00:00:00'),
	    (7, 'Executive', '2016-06-11 00:00:00'),
	    (6, 'Lead', '2016-06-11 00:00:00'),
	    (3, 'Lead', '2016-06-11 00:00:00');

	select * from title;


	select now();
	select 2+3-1;
	select lower('RAHUL');
	select upper('india is my country.')

	select * from worker where salary > 90000;

	select * from worker where department = 'HR';

	select * from worker where salary between 80000 and 300000;

	-- Worker working in the HR and Admin department
	select * from worker where department in ('HR','Account');
	
	select * from worker where department not in ('HR','Account');


	-- is NULL
	insert into worker
	values
	(9, 'Siya', 'Chauhan', NULL, '2011-04-14 09:00:00', 'Admin');

	select * from worker where salary is NULL;

	select * from worker where last_name like '%gh%';

	select * from worker where last_name like '_i%';
	select * from worker where first_name like '%l%';

	-- sorting
	select * from worker order by salary ;
	select * from worker where salary is not NULL order by salary desc;

	-- distinct values
	select distinct department from worker;

	-- group by function 
	select department , count(department), sum(salary) , round(avg(salary),0) , max(salary) , min(salary)
	from worker group by department
	order by count(department) desc;

	select department , count(department) from worker 
	group by department having count(department)>2;
	
	select department , count(department) from worker 
	group by department having min(salary) > 80000;


	-- reference key
	select * from worker;

	create table category
	(c_id int primary key, c_name varchar(24) , w_id int , foreign key (w_id) references worker(worker_id));

	select * from category;

	insert into category values
	(123,'First',3);
	insert into category values
	(124,'First',3);

-- following will give error
	-- insert into category values
	-- (124,'First',3);







	create table account(
		ac_no int primary key,
		name varchar(21) unique,
		balance int,
		constraint min_balance_chk check(balance>=1000)
	);

	select * from account;

	insert into account values
	(1234 , 'Rahul' , 1000);

-- following will give error
	-- insert into account values
	-- (12322 , 'Rahul' , 5000);
	
	-- but following will not
	insert into account values
	(12322 , 'rahul' , 5000);

-- following will give error
	-- insert into account values
	-- (1236 , 'SONU' , 999);

	-- but following will not
	insert into account values
	(1236 , 'SONU' , 5000);

	
	select * from account;



	-- Default keyword  => DDL constraint
	create table sample1(
		id  int primary key,
		name varchar(25) default 'Abhinav'
	);

	select * from sample1;

	insert into sample1
	values
	(123,'Rahul');
	
	insert into sample1
	values
	(124);
	
	insert into sample1
	values
	(125 ),(121);
	
	select * from sample1;