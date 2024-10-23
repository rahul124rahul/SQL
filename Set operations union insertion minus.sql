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


	-- Set operations

-- union , insertion , minus
	
	create table Dept1
	(empid int primary key, name varchar(23) , role varchar(23));

	create table Dept2
	(empid int primary key, name varchar(23) , role varchar(23));

	insert into Dept1 values
	(1,'A','Engineer'),
	(2,'B','salesman'),
	(3,'C','manager'),
	(4,'D','salesman'),
	(5,'E','Engineer');
	
	insert into Dept2 values
	(3,'C','manager'),
	(6,'F','marketing'),
	(7,'G','salesman');

	select * from Dept1;
	select * from Dept2;


	-- Union
	select * from Dept1
	union
	select * from Dept2
	order by empid;

	-- inserction
	select Dept1.* from Dept1
	inner join Dept2
	using(empid);

	-- minus
	select Dept1.* from Dept1
	left join Dept2 using(empid)
	where Dept2.empid is NULL;