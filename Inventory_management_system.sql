-- CREATE ALL THE TABLE  -- CREATE ALL THE TABLE  -- CREATE ALL THE TABLE  
-- CREATE ALL THE TABLE  -- CREATE ALL THE TABLE  -- CREATE ALL THE TABLE  

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
category_id INT references category(category_id),
brand_id INT references brands(brand_id),
store_id INT,
product_name varchar(20),
product_stock INT,
price decimal(5, 2),
added_date DATE
);

-- DROP TABLE product;

ALTER table product
add (foreign key (store_id) references stores(store_id));

CREATE TABLE stores (
store_id INT PRIMARY key,
store_name VARCHAR (20),
store_Address VARCHAR(30),
store_mobile_number INT
);

CREATE TABLE providers(
brand_id INT REFERENCES brands(brand_id),
store_d INT REFERENCES stores(store_id),
discount DECIMAL(5, 2)
);


CREATE TABLE customers_cart(
cust_cart_id int PRIMARY KEY,
name VARCHAR(20),
mobile_number INT
);

CREATE TABLE select_product(
cust_cart_id int REFERENCES customers_cart(cust_cart_id),
product_id INT REFERENCES product(product_id),
quantity INT
);

CREATE table transactions(
trans_id INT PRIMARY KEY,
total_amount DECIMAL(5, 2),
paid DECIMAL(5, 2),
dues DECIMAL(5, 2),
discount DECIMAL(5, 2),
payment_method VARCHAR(20),
cust_cart_id int REFERENCES customers_cart(cust_cart_id)
);

CREATE table invoice(
item_no INT,
product_name varchar(20),
quantity INT,
net_price DECIMAL(5, 2),
trans_id int REFERENCES transactions(trans_id)
);


-- INSERT INTO ALL THE TABLE -- INSERT INTO ALL THE TABLE -- INSERT INTO ALL THE TABLE 
-- INSERT INTO ALL THE TABLE -- INSERT INTO ALL THE TABLE -- INSERT INTO ALL THE TABLE 
 
 
 INSERT INTO BRANDS
 VALUES(2, 'Samsung'), (3, 'Nike'), (4, 'Phillip');
 
  INSERT INTO inventory_users
 VALUES('James@gmail.com', 'James','1344ghj', now()-5, 'Admin'), 
		('Maggie@gmail.com', 'Maggie','05kl4ghj', now()-8, 'Account'), 
        ('Luke@gmail.com', 'Luke','luke87j', now()-9, 'Store'),
        ('Allen@gmail.com', 'Allen','989allen_efd', now()-3, 'Sales');
 
INSERT INTO category
values 
(1, 'Electronics'),(2, 'Clothing'), (3, 'Groceries'), (4, 'Toys');

INSERT INTO stores
values 
(1, 'Kolade', '43, markel street', 98889999),
(2, 'Henvalon', '3, Allen Smith street', 44455666),
(3, 'Kolade', 'plot E2, FFD street', 234566345),
(4, 'Kolade', 'Plot 343, Bollont street', 993889999);

update stores
set store_name = 'Omoefe'
where store_id = 4;


insert into product
values (1, 1, 1, 1, 'Camon 19S', 8, 774.00, current_date()-5),
	   (2, 1, 1, 1, 'Iphone 15s', 4, 103.32, current_date()-4),
       (3, 1, 1, 1, 'Phatom A+', 10, 187.34, current_date()-2),
       (4, 2, 3, 2, 'Spark 33', 11, 574.65, current_date()-1),
       (5, 3, 4, 3, 'Nokia 7673', 28, 384.66, current_date()-4);

-- drop table product;
insert into providers
values (1, 1, 13), (2, 2, 15), (3, 3, 11), (4, 2, 19), (4, 3, 20);

insert into customers_cart 
values (1,'Shymam', 32445898), (2,'David', 44567987), (3,'Shyam', 345435425);

insert into select_product
values (1, 3, 4), (2,3,3), (3,2,1), (4, 2, 5);

insert into transactions 
values(1, 145.45, 145.45, 500.00, 350, 'card', 1),
	 (2, 570.54, 570.50, 0, 570, 'cash', 2),
     (3, 190.21, 170.80, 200.60, 190,  'cash', 3),
     (4, 900.12, 700.80, 200.80, 190,  'cash', 4);
     
SELECT * from transactions; 
