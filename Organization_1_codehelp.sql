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
