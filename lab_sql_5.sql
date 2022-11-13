use sakila;
-- Drop column picture from staff.
alter table staff drop column picture;
-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff () select 3,first_name,last_name,address_id,email,store_id,True,first_name,"",now() from customer 
where first_name = 'TAMMY' and last_name = 'SANDERS';
-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
select customer_id from customer  where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- 130
select staff_id, store_id from staff where  first_name = 'Mike' and last_name = 'Hillyer';  -- 1, 1
select film_id from film where title = 'Academy Dinosaur'; -- 1
select inventory_id from inventory where film_id = 1; -- 1..8
insert into rental ()
select max(rental_id)+1,Now(), 9, 130, null, 1, Now() from rental;
select * from rental order by rental_id desc limit 1;
-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted
-- Check if there are any non-active users
select * from customer where active = 0;
-- Create a table backup table as suggested
create table deleted_users like customer;
-- Insert the non active users in the table backup table
insert into deleted_users () select * from customer where `active` = 0;
select * from deleted_users;
-- Delete the non active users from the table customer
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM customer WHERE `active` = 0; 
SET FOREIGN_KEY_CHECKS=1;

