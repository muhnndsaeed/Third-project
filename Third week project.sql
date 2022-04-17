create database store;
use store;
create table countries(code int primary key,
name varchar(20) unique,
 continent_name varchar(20) unique
);

use store;
create table users (id int primary key , full_name varchar(20),
email varchar(20) unique , gender char(1) check (gender = 'F' or gender = 'M'),
date_of_birth varchar (15),
created_at datetime,
country_code int,
foreign key (country_code) references countries(code)
);

create table orders ( id int primary key , user_id int ,
status varchar (6) check (status='start' or status= 'finsh') , created_at datetime,
foreign key (user_id) references users (id)
);

create table order_products (
order_id int,
product_id int ,
quantity int default 0,
primary key ( order_id, product_id),
foreign key (order_id) references orders (id),
foreign key (product_id) references products(id)
);

create table products ( 
id int primary key , 
name varchar (10) not null,
price int default 0,
status varchar (10) check (status ='vaild' or status= 'expired'),
created_at datetime
);

insert into countries values (1,"Egypt", "Africa");

insert into users values(5,"ali ahmad","ali@ali.com","M","24",'1998-02-03 10:15:20',100);

insert into orders values (54,25,'start',9);

insert into products values(5,"ale",'8','vaild',7);

insert into order_products values ('9','4','56');

update countries set name = "Sudan"
where code=1;

delete from products where id = 5;
