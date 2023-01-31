use inventory_management; 


alter table users add constraint df_category default 'admin' for category;

select * from users; 

insert into users(username,password,Fullname,isActive) values ('anand','456','anand kumar',0);


alter table [transaction] add constraint df_check1 check ( transactiontype  in ('inward' ,'outward'));  
select * from [Transaction];

insert into [Transaction] values('2023-01-31',3,'abcd',40,4);

select * from [product master] 

select * from [product master] where AvailableQty=500 or AvailableQty=1000

select * from [product master] where AvailableQty in (500,1000)

select * from [product master] where AvailableQty!=500 and AvailableQty!=1000


select * from [product master] where AvailableQty not in (500,1000)



select * from users 


select * from users where username like 'm%';


select * from users where username like '_u%'; 


select * from users where username like '%a%';


Select * from [product master]; 

Select Max(AvailableQTY) as Max_Qty from [product master]; 

Select Min(Availableqty) as Min_Qty  from [product master]; 

Select Sum(AvailableQty) as TotalSum from [product master]; 

Select Count(*) as TotalCount from [product master]; 

Select Count(AvailableQTY) as TotalCount from [product master]; 

Select Avg(AvailableQTY)as AVG  from [product master];




Use Employee_DB;



--1.Write a query to display the id, entire street address and the first word of the
--street address of all entries in the location table. Give an alias to the first word as 'first_word'.
--Display the records sorted in ascending order based on first_word.(Q10)

select id,street_address,SUBSTRING(street_address,1,1) as 'first_word' from location order by 'first_word'

select id,street_address,LEFT(street_address,1) as 'first_word' from location order by 'first_word'

--2.Write a query to display the names of all states belonging to the country Canada.
--Display the records sorted in ascending order based on state name.(Q 2).

select state from location where country_id in(select id from Countries where name='canada') order by state; 



 
select * from Countries
select * from Region 

--9.Write a query to display the names of all countries belonging to region Europe. 
--Display the records sorted in ascending order based on country name.(Q1)

select name from countries where region_id in(select id from region where name='Europe') 



--10.Write a query to display the id,entire street 
--address and the last word of the street address of all entries in the location table.
--Give an alias to the last word as 'last_word'.
--Display the records sorted in ascending order based on last_word.(Q9

select id,street_address,right(street_address,1)  'last_word' from location order by 'last_word'


--11.Write a query to display the first name and salary for all employees. 
--Format the salary to be 10 characters long, left-padded with the $ symbol. 
--Display the records sorted in ascending order based on first name.(Q11).

--select first_name,salary from employee order by first_name; 

select first_name,(REPLICATE('$', 5) + LEFT(salary, 10)) salary  from employee order by first_name; 


--13.Write a query to display the first name and the last 5 characters of phone numbers of all employees.
--Display the records sorted in ascending order based on first name.
--Give an alias to the last 5 characters of phone number as phone_number(Q8).

select first_name,right(phone_number,5) as phone_number from employee order by first_name



--14.Write a query to display the first name of the managers of HR department.
--Display the records sorted in ascending order based on manager name(Q6)

select first_name from employee where department_id in(select id from department where name ='HR'); 


--Display the emloyee details whose age is > 25. 
 


 SELECT * FROM employee WHERE DATEDIFF(YEAR, date_of_birth, GETDATE())>25


