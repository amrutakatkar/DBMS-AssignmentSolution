create database db_ecommerce;
use db_ecommerce;

Create table if not exists supplier(
  SUPP_ID INTEGER primary key auto_increment,
  SUPP_NAME varchar(50) NOT NULL ,
  SUPP_CITY  varchar(50) NOT NULL,
  SUPP_PHONE varchar(50) NOT NULL);
  

Create table if not exists customer(
CUS_ID INTEGER primary key auto_increment, 
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL, 
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER enum('M','F'));


Create table if not exists category(CAT_ID INT primary key auto_increment , 
CAT_NAME VARCHAR(20) NOT NULL);

-- Self referencing 
Alter table category add column PARENT_CAT_ID  INT ,add foreign key(PARENT_CAT_ID) references category(CAT_ID);

Create table if not exists product(PRO_ID INT primary key auto_increment,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT,
foreign key(CAT_ID) references category(CAT_ID)) ;



Create table if not exists supplier_pricing (PRICING_ID INT primary key auto_increment,
PRO_ID INT,
SUPP_ID INT ,
SUPP_PRICE INT DEFAULT 0,
unique key(PRO_ID,SUPP_ID),
foreign key(PRO_ID) references product(PRO_ID),
foreign key(SUPP_ID) references supplier (SUPP_ID));



Create table if not exists orders(
ORD_ID INT primary key auto_increment,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT NOT NULL,
PRICING_ID INT,
unique key(CUS_ID,PRICING_ID),
foreign key(CUS_ID) references customer (CUS_ID),
foreign key(PRICING_ID) references supplier_pricing (PRICING_ID));

Create table if not exists rating(RAT_ID INT primary key,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
foreign key(ORD_ID) references orders (ORD_ID));


show create table supplier ;
select * from customer;

insert into supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) values
("Rajesh Retails","Delhi","1234567890"),
("Appario Ltd.","Mumbai", "2589631470"),
("Knome products","Banglore","9785462315"),
("Bansal Retails","Kochi", "8975463285"),
("Mittal Ltd.","Lucknow", "7898456532");

select * from supplier;

select * from customer;

insert into customer(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)values
("AAKASH","9999999999","DELHI","M"),
("AMAN","9785463215", "NOIDA","M"),
("NEHA","9999999999","MUMBAI","F"),
("MEGHA ","9994562399","KOLKATA","F"),
("PULKIT", "7895999999", "LUCKNOW","M");

select * from customer;


select * from Category;

insert into Category(CAT_NAME) values
("BOOKS"),
("GAMES"),
("GROCERIES"),
("ELECTRONICS"),
("CLOTHES");

drop table rating;
drop table orders;
drop table supplier_pricing;
drop table product;


insert into product(PRO_NAME, PRO_DESC ,CAT_ID) values
 ("GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2),
 ("TSHIRT", "SIZE-L with Black, Blue and White variations", 5),
 ("ROG", "LAPTOP Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4),
 ("OATS", "Highly Nutritious from Nestle", 3),
 ("HARRY POTTER", "Best Collection of all time by J.K Rowling", 1),
 ("MILK", "1L Toned MIlk", 3),
 ("Boat", "Earphones 1.5Meter long Dolby Atmos", 4),
 ("Jeans", "Stretchable Denim Jeans with various sizes and color", 5),
 ("Project", "IGI compatible with windows 7 and above", 2),
 ("Hoodie", "Black GUCCI for 13 yrs and above", 5),
 ("Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1),
 ("Train Your Brain", "By Shireen Stephen", 1);
 
 select * from product;
 
 select * from supplier_pricing;
 


-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.


-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2
-- 5) Display the Supplier details who can supply more than one product.
-- 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product
-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.
-- 8) Display customer name and gender whose names start or end with character 'A'.
-- 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent
-- Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service