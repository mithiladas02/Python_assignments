create database ankit;
use ankit;

create table instructor(ins_id INTEGER PRIMARY KEY NOT NULL, 
   lastname VARCHAR(15) NOT NULL, 
   firstname VARCHAR(15) NOT NULL, 
   city VARCHAR(15), 
   country CHAR(2)
  )
;

----insert table

INSERT INTO INSTRUCTOR
  (ins_id, lastname, firstname, city, country)
  VALUES 
  (1, 'Ahuja', 'Rav', 'Toronto', 'CA')
;

--Insert the two rows for Raul and Hima
INSERT INTO INSTRUCTOR
  VALUES
  (2, 'Chong', 'Raul', 'Toronto', 'CA'),
  (3, 'Vasudevan', 'Hima', 'Chicago', 'US')
;

--3. Select all rows in the table
SELECT * FROM INSTRUCTOR;




--3b. Select firstname, lastname and country where city is Toronto

select firstname, lastname,country from instructor
where city="Toronto";

--4. Change the city for Rav to Markham
UPDATE INSTRUCTOR SET city='Markham' where ins_id=1;

--5. Delete the row for Raul Chong
delete from instructor where ins_id=2;

--5b. Retrieve all rows from the table
SELECT * FROM INSTRUCTOR; 

select * from employess;
select * from jobs;
select * from jobshistory;
select * from location;
select * from departments;

create table PETSALE (
	ID INTEGER PRIMARY KEY NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE
	);
    
    Insert saple data into PETSALE table
insert into PETSALE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;

select * from petsale;

select SUM(SALEPRICE) from PETSALE;
select SUM(SALEPRICE) AS SUM_OF_SALEPRICE from PETSALE;
select MAX(QUANTITY) from PETSALE;
select AVG(SALEPRICE) from PETSALE;
select AVG( SALEPRICE / QUANTITY ) from PETSALE where ANIMAL = 'Dog';
select ROUND(SALEPRICE) from PETSALE;
select LENGTH(ANIMAL) from PETSALE;
select UCASE(ANIMAL) from PETSALE;
select DISTINCT(UCASE(ANIMAL)) from PETSALE;
select * from PETSALE where LCASE(ANIMAL) = 'cat';
select DAY(SALEDATE) from PETSALE where ANIMAL = 'Cat';
select COUNT(*) from PETSALE where MONTH(SALEDATE)='06';
select (SALEDATE + 3 DAYS) from PETSALE;
select (CURRENT DATE - SALEDATE) from PETSALE;

employess

