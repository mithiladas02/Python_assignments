use sakila;

/*1a. Display the first and last names of all actors from the table actor.*/

select first_name,last_name from actor;

/*1b. Display the first and last name of each actor in a s
ingle column in upper case letters. Name the column Actor Name.*/

SELECT CONCAT(`first_name`,' ', `last_name`) AS 'Actor Name'  FROM actor;

/*2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe.
" What is one query would you use to obtain this information?*/

select actor_id,first_name,last_name from actor
where first_name = 'Joe';

/*2b. Find all actors whose last name contain the letters GEN:*/

select * from actor
where last_name LIKE '%GEN%';

/*2c. Find all actors whose last names contain the letters LI. 
This time, order the rows by last name and first name, in that order:*/

select * from actor
where last_name LIKE '%LI%'
order by last_name,first_name ;

/*2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:*/

select * from country
where country in ('Bangladesh','Afghanistan','China');

/*3a. You want to keep a description of each actor. You don't think you will be performing queries on a description, 
so create a column in the table actor named description and use the data type BLOB 
(Make sure to research the type BLOB, as the difference between it and VARCHAR are significant).*/

/* 3b. Very quickly you realize that entering descriptions for each actor is too much effort. Delete the description column.*/
alter table actor
add description blob ;

select * from actor ;

/*3b. Very quickly you realize that entering descriptions for each actor is too much effort. Delete the description column.*/

alter table actor
drop column description;

/*4a. List the last names of actors, as well as how many actors have that last name.*/

select last_name , count(last_name) from actor
group by last_name;

/*4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors*/

select last_name , count(last_name) from actor
group by last_name
having count(last_name)>1;

/*4c. The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record.*/

select * from actor
where first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

UPDATE actor
SET first_name = 'HARPO'
where first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

/*4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, 
if the first name of the actor is currently HARPO, change it to GROUCHO.*/

select * from actor 
where first_name = 'Harpo';

SET SQL_SAFE_UPDATES = 0;
UPDATE actor
SET first_name = 'GROUCHO'
where first_name = 'Harpo';
SET SQL_SAFE_UPDATES = 1;
/*5a. You cannot locate the schema of the address table. Which query would you use to re-create it?*/

show create table address;

describe address;

/*6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:*/

select * from staff;
select * from address;

select staff.first_name,staff.last_name,address.address
from address
inner join staff
where staff.address_id = address.address_id;


/*6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.*/

select * from staff ; 
select * from payment ; 

select staff.staff_id,staff.first_name,staff.last_name,sum(payment.amount)
from staff
inner join payment
where staff.staff_id = payment.staff_id and payment_date like '2005-08%'
group by staff.staff_id;
/*having payment_date like '2005-08%';*/

/*List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join*/

select * from film_actor;
select * from film;

select film.title , count(film_actor.actor_id) as 'Number of Actors'
from film
inner join film_actor
where film.film_id = film_actor.film_id
group by film.title;

/*How many copies of the film Hunchback Impossible exist in the inventory system?*/

select * from inventory;
select * from film;

select film.title , count(inventory.film_id) as 'Total Copy'
from film
inner join inventory
where film.film_id = inventory.film_id
and film.title = 'Hunchback Impossible';

/*6e. Using the tables payment and customer and the JOIN command, 
list the total paid by each customer. List the customers alphabetically by last name:*/

select * from payment;
select * from customer;

select customer.first_name, customer.last_name , sum(payment.amount) 'Total Amount Paid'
from customer
inner join payment
where customer.customer_id = payment.customer_id
group by customer.last_name ASC;

/*7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
Use subqueries to display the titles of movies starting with the letters K and Q whose language is English*/

select * from film ;
select * from language ;

select film. title as 'Film Title'
from film
where language_id in
( select language_id from
  language
  where language.name = 'English')
having film.title like 'K%' OR film.title LIKE 'Q%';

/* Use subqueries to display all actors who appear in the film Alone Trip.*/

select * from actor;


select first_name,last_name
from actor 
where actor_id in
(
select actor_id 
from film_actor 

where film_id IN
(
select film_id 
from film
where title = 'Alone Trip'));

/*7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
 Use joins to retrieve this information*/

SELECT cus.first_name, cus.last_name, cus.email 
FROM customer cus
JOIN address a 
ON (cus.address_id = a.address_id)
JOIN city cty
ON (cty.city_id = a.city_id)
JOIN country
ON (country.country_id = cty.country_id)
WHERE country.country= 'Canada';

/*7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
Identify all movies categorized as family films.*/

select * from film_category;
select * from category;
select * from film;

select title as 'Family Film' from 
film 
where film_id in (
 select film_id 
 from film_category
 where category_id in (
   select category_id 
   from category 
   where name = 'Family'));
   
  /* 7e. Display the most frequently rented movies in descending order.*/
  
 SELECT film.title as 'Film Name', COUNT(rental_id) AS 'Times Rented'
FROM rental 
JOIN inventory
ON (rental.inventory_id = inventory.inventory_id)
JOIN film 
ON (inventory.film_id = film.film_id)
GROUP BY film.title
ORDER BY `Times Rented` DESC;

/*7f. Write a query to display how much business, in dollars, each store brought in.*/

SELECT store.store_id, SUM(amount) AS 'Business Revenue'
FROM payment 
JOIN rental 
ON (payment.rental_id = rental.rental_id)
JOIN inventory 
ON (inventory.inventory_id = rental.inventory_id)
JOIN store 
ON (store.store_id = inventory.store_id)
GROUP BY store.store_id; 

/*7h. List the top five genres in gross revenue in descending order. 
(Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)*/

SELECT c.name AS 'Genre', SUM(p.amount) AS 'Gross Amount' 
FROM category c
JOIN film_category fc 
ON (c.category_id=fc.category_id)
JOIN inventory i 
ON (fc.film_id=i.film_id)
JOIN rental r 
ON (i.inventory_id=r.inventory_id)
JOIN payment p 
ON (r.rental_id=p.rental_id)
GROUP BY c.name 
ORDER BY Gross  
limit 5;
 
 /*Create a view of above*/
CREATE VIEW genre_revenue AS
SELECT c.name AS 'Genre', SUM(p.amount) AS 'Gross Amount' 
FROM category c
JOIN film_category fc 
ON (c.category_id=fc.category_id)
JOIN inventory i 
ON (fc.film_id=i.film_id)
JOIN rental r 
ON (i.inventory_id=r.inventory_id)
JOIN payment p 
ON (r.rental_id=p.rental_id)
GROUP BY c.name 
ORDER BY Gross  
limit 5;

select * from genre_revenue;

/*Drop the view*/

DROP VIEW genre_revenue;