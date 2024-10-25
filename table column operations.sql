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


	select * from title;

-- Add a column
	alter table title 
	add age int not null default 20;
	
	select * from title;

-- raname => change name of the attribute/column
	alter table title 
	rename column age  to full_age ;
	select * from title;  

--   alter table table_name to datatype_name => change the datatype if the column/attribute
	alter table title
	alter column full_age type float;
	select * from title;

-- change the table name 
	alter table title
	rename to Tilele;
-- rename to => following will give an error
	select * from title; 

	select * from tilele; 

	alter table tilele rename to title;
	select * from title; 

-- drop column_name => Drop the column
	alter table Title 
	drop full_age;
	select * from Title;












SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'title';