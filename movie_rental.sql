create database movie_rentalDb;
use movie_rentalDb;
create table movies (
movie_id int primary key,
title varchar(30),
genre varchar(20),
release_year year);
INSERT INTO movies(movie_id, title, genre, release_year) VALUES
(1, "Yeh Jawaani Hai Deewani", "Rom-Com", 2013),
(2, "Stree 2", "Horror-Comedy", 2024),
(3, "Inception", "Sci-Fi", 2010),
(4, "The Godfather", "Crime-Drama", 1972),
(5, "Dangal", "Sports-Drama", 2016),
(6, "Avengers: Endgame", "Action", 2019),
(7, "Frozen II", "Animation", 2019);
update movies set release_year=2011 where movie_id=3;
delete from movies where movie_id=7;

create table customers(
customer_id int primary key,
name varchar(30),
membership_date date);
insert into customers(customer_id,name,membership_date)values
(8,"aman","2024-12-09"),
(9,"rahul","2024-12-23"),
(10, "Sneha", "2023-11-15"),
(11, "Priya", "2024-01-05"),
(12, "Vikram", "2024-07-19"),
(13, "Anjali", "2023-10-10"),
(14, "Rohan", "2023-12-31");
update customers set membership_date="2024-11-23" where customer_id=9;
delete from customers where customer_id=14;


create table rentals(
rental_id int primary key,
movie_id int,
customer_id int,
rental_date date,
return_date date,
foreign key (movie_id) references movies(movie_id),
foreign key (customer_id) references customers(customer_id)
);
INSERT INTO rentals(rental_id, movie_id, customer_id, rental_date, return_date) VALUES
(1, 1, 9, "2024-12-13", "2024-12-24"),
(2, 2, 9, "2024-11-10", "2024-11-20"),
(3, 2, 12, "2024-10-01", "2024-10-11"),
(4, 4, 10, "2024-09-15", "2024-09-25"),
(5, 5, 11, "2024-08-20", "2024-08-30"),
(6, 3, 10, "2024-07-05", "2024-07-15");
select * from movies;
select * from customers;
select * from rentals;
select * from movies where release_year>2010;
select * from customers where year(membership_date)=2023;
select * from rentals inner join customers on rentals.customer_id=customers.customer_id where customers.customer_id=9;
select genre,count(*) as countMovies from movies group by genre;
select customers.customer_id,count(*) from rentals inner join customers on rentals.customer_id=customers.customer_id group by customers.customer_id;
select *,movies.title,customers.name from rentals inner join movies inner join customers
on rentals.movie_id=movies.movie_id and rentals.customer_id=customers.customer_id;
select movies.title,customers.name from rentals inner join movies inner join customers
on rentals.movie_id=movies.movie_id and rentals.customer_id=customers.customer_id where customers.customer_id=10;
select movies.title,count(movies.movie_id) from rentals inner join movies inner join customers
on rentals.movie_id=movies.movie_id and rentals.customer_id=customers.customer_id group by movies.movie_id;
select customers.name,count(customers.customer_id) from rentals inner join movies inner join customers
on rentals.movie_id=movies.movie_id and rentals.customer_id=customers.customer_id group by customers.customer_id;



