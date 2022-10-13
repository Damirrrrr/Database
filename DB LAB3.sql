/*  №1
DDL:
It is used to create database schema and can be used to define some constraints as well.
CREATE, DROP, RENAME

DML:
It is used to add, retrieve or update the data.
UPDATE, INSERT, MERGE, DELETE
 */
 --- №2
create table customer(
    id integer,
    name varchar(50),
    timestamp timestamp,
    delivery_address text,
    primary key (id)
);
create table orders(
    code integer,
    customer_id integer,
    total_sum double precision,
    is_paid boolean,
    primary key(code),
    foreign key (customer_id) references customer
);
create table products(
    id varchar,
    name varchar,
    description text,
    price double precision,
    primary key (id)
);
create table order_items(
    order_code integer,
    product_id varchar,
    quantity integer,
    foreign key (product_id) references products,
    foreign key (order_code) references orders,
    primary key (product_id, order_code)
);
---№3
---a)
create table students(
    full_name varchar(50),
    age integer,
    birth_year date,
    gender varchar(6),
    average_grade double precision,
    info text,
    need_for_a_Dorm bool,
    additional_info text,
    primary key (full_name)
);
---b)
create table instructors(
    full_name varchar(50),
    speaking_languages text,
    work_experience integer,
    remote_lessons boolean,
    primary key (full_name)
);
--c)
create table lesson_participants(
    lesson_title varchar,
    teaching_instructor varchar(50),
    students text,
    room_number integer,
    foreign key (teaching_instructor) references instructors,
    foreign key (students) references students
);
---№4
insert into customer
values ( 77,'Damir', current_timestamp,'ST Alatau');

update customer
set delivery_address = 'ST Kok-Sai 55'
where id = 77;

delete from customer
where id = 77;