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


	CREATE TABLE Customer (
	id integer PRIMARY KEY, cname varchar(225), Address varchar(225), 
	Gender char(2), City varchar(225), Pincode integer
	);

	select * from Customer;
I

	INSERT INTO Customer
	VALUES 
	(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002), 
	(1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001), 
	(245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003), 
	(210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002), 
	(500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);

	insert into Customer 
	(id,cname)
	values
	(121 , 'Rahul'),
	(212 , 'Sonu');
		
	select * from Customer;


	-- Updating the values 
	update Customer 
	set gender = 'M'
	where id = 212;

	-- updating the multiple rows
	update Customer 
	set pincode = pincode+5;
	
	select * from Customer;

	
	-- Deleting the row from the table by using the delete command
	delete from Customer where id = 121;

	-- Following command will delete all the data from the table 
	delete from Customer;
	select * from Customer;





	-- on delete cascade

	CREATE TABLE Order_details (
		Order_id integer PRIMARY KEY, delivery_date DATE, cust_id INT,
		FOREIGN KEY(cust_id) references Customer(id) on delete cascade
	);
	
	INSERT INTO Order_details
	VALUES (3, '2019-03-11', 1);
	
	-- on delete set NULL
	
	INSERT INTO Customer VALUES (1, 'Ram Kumar3', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);
	select * from Customer;
	
	CREATE TABLE Order_details (
		Order_id integer PRIMARY KEY, delivery_date DATE, cust_id INT,
		FOREIGN KEY(cust_id) references Customer(id) on delete set NULL
	);
	
	INSERT INTO Order_details
	VALUES (3, '2019-03-11', 1);

	select * from order_details;
	drop table order_details;
	
	DELETE FROm Customer WHERE id = 1;




	-- Replace 
	-- replacemnet in the given row
	INSERT INTO customer (id, cname, city)
		VALUES (121, 'RAHUL', 'PUNE')
		ON CONFLICT (id)
		DO UPDATE SET
		cname = EXCLUDED.cname,
		city = EXCLUDED.city;

	-- Adding up new row
	INSERT INTO customer (id, cname, city)
		VALUES (1111, 'Son', 'Latur')
		ON CONFLICT (id)
		DO UPDATE SET
		cname = EXCLUDED.cname,
		city = EXCLUDED.city;

-- following will give error
	-- replace into customer 
	-- set id = 212, name = 'Lala',city='Lala Land';
	select * from Customer;