select * from  countries 
select * from  department
select * from  employee
select * from  location
select * from  manager
select * from  Region

--2,3,9,14,15 
--1,2,9,10,11,13,14 




-- 15.Write a query to display the first name of all employees who are managers.
--Display the records sorted in ascending order based on first name.(Q5)

select first_name from employee where id in ( 
select employee_id  from manager) order by first_name


--3.Write a query to display the first name of the managers of Accounts department.
--Display the records sorted in ascending order based on manager name.(Q7).

select first_name from employee where department_id in (select id from department where name='Accounts')
order by first_name


select count(*) IT_Employees  from employee where department_id =(select id from department where name='IT')



-- Group by 

Select * from employee;


Select department_id, count(id) as EmployeesInEachDept
from employee group by department_id


Select country_id, Count(state) from location 
group by country_id;

Select department_id, max(salary) from employee group by 
department_id;

select count(*) count,d.name from employee e join department d on e.department_id=d.id
group by d.name ;


--7.Write a query to display the department name and the number of managers in the department.
--Display the records sorted in ascending order based on department name. 
--Give an alias to the number of managers as manager_count.(Q15).

select d.name,count(employee_id)  count from department d join manager m 
on m.department_id=d.id group by d.name 

Select department_id, count(employee_id) from manager  group by department_id

