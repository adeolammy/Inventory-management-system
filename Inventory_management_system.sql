CREATE DATABASE Inventory_Management_System;
use inventory_management_system;

create table brands(
brand_id NUMERIC(5) PRIMARY KEY,
brand_name varchar(23)
);

CREATE table inventory_Users(
users_id varchar(20),
users_name varchar(20),
users_password varchar(20),
last_login timestamp,
users_type varchar(10)
);

create table category(
category_id INT(5),
category_name VARCHAR(20)
);

ALTER TABLE category
add category_id INT(5) PRIMARY KEY ;

ALTER TABLE inventory_users
add PRIMARY KEY(users_id) ;

CREATE table product(
product_id int PRIMARY key,
c

);


SELECT * from category;

