create database inventory_management;
use inventory_management; 

create table users(userid int primary key identity(1,1) ,
username varchar(50),password varchar(25),
Fullname varchar(255),isActive bit ,category varchar(50)); 

create table [product master] (productid int primary key identity(1,1), 
productname varchar(50), AvailableQty bigint);

create table [Transaction] (transactionid int primary key identity(1,1),
transactiondate date,productid int foreign key references [product master](productid),
transactiontype varchar(5), qty int,
updatedby int foreign key references users(userid));


alter table [transaction] alter column productid int not null;  


alter table [transaction] alter column updatedby int not null; 

alter table [transaction]  alter column transactiontype varchar(7) not null; 

alter table [product master]  alter column productname varchar(50) not null; 

alter table [product master]  alter column availableQty bigint not null; 

--alter table [transaction]  drop [FK__Transacti__updat__29572725];


insert into users values('surya','123','Addada surya',1,'developer'),
('raju','6754','s raju ',1,'tester'),
('hari','9654','k hari',1,'Admin'); 

insert into users values('Mathew','789','Mathew shaw',1,'developer'); 



insert into [product master] values ('Fan',50),('Light',90),('Lamp',85);

insert into [product master] values ('Nails',70);

select * from users;

select * from [product master];

insert into [Transaction]  values('2020-12-27',3,'in',150,4);

insert into [Transaction]  values('2023-01-30',2,'out',90,3),
('2021-06-03',3,'in',30,2); 

select * from [Transaction]; 
-- Select All the Users FullName and Category. 
select fullname,category from users;

--Select ProductName where the AvailableQTY is less than 500
select productname from  [product master] where AvailableQty <500; 

--Select Transaction details which is done by User Mathew
select * from [Transaction] where updatedby=
(select userid from users where username='mathew');

--Select the transactionDate and Transaction Type from transaction table
select transactiondate,transactiontype from [Transaction];  


-- Fetch only the Inward Transaction details.
select * from [Transaction] where transactiontype='inward';

--Fetch the product details of Nails
select * from [product master] where productname='Nails';

