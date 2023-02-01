use lms_db
--1,3,4,5,6,7,8,9,10,11,12,13,14,16

select * from LMS_MEMBERS
--1.Write a query to display the member id, member name, city and membership status
--who are all having life time membership. Hint: Life time membership status is “Permanent”.
select MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS from LMS_MEMBERS where MEMBERSHIP_STATUS='permanent'

--3.Write a query to display the member id, member name who have taken the book with book code 'BL000002'.
select * from LMS_BOOK_ISSUE

select MEMBER_ID,MEMBER_NAME from LMS_MEMBERS where MEMBER_ID
=(select MEMBER_ID from LMS_BOOK_ISSUE where BOOK_CODE='BL000002');

--4.Write a query to display the book code, book title and author 
--of the books whose author name begins with 'P'.
select * from LMS_BOOK_DETAILS
select BOOK_CODE,BOOK_TITLE,AUTHOR from LMS_BOOK_DETAILS where AUTHOR like 'p%';

--5.Write a query to display the total number of Java books 
--available in library with alias name ‘NO_OF_BOOKS’.
select COUNT(*) NO_OF_BOOKS from LMS_BOOK_DETAILS where CATEGORY='JAVA';

--6.Write a query to list the category and number of books in
--each category with alias name ‘NO_OF_BOOKS’.
select CATEGORY, COUNT(*) NO_OF_BOOKS from LMS_BOOK_DETAILS group by CATEGORY;

--7.Write a query to display the number of books published
--by "Prentice Hall” with the alias name “NO_OF_BOOKS”.
select COUNT(*) NO_OF_BOOKS from LMS_BOOK_DETAILS where PUBLICATION='Prentice Hall';

--8.Write a query to display the book code, book title of the books
--which are issued on the date "1st April 2012".

select dt.BOOK_CODE,BOOK_TITLE from LMS_BOOK_DETAILS dt join LMS_BOOK_ISSUE iss 
on dt.BOOK_CODE=iss.BOOK_CODE where DATE_ISSUE='2012-04-01';

--9.Write a query to display the member id, member name, date of registration and expiry date 
--of the members whose membership expiry date is before APR 2013. 

select MEMBER_ID,MEMBER_NAME,DATE_REGISTER,DATE_EXPIRE from LMS_MEMBERS where DATE_EXPIRE<'2013-04-01';

--10.write a query to display the member id, member name, date of registration, membership status of the 
--members who registered before "March 2012" and membership status is "Temporary"
select MEMBER_ID,MEMBER_NAME,DATE_REGISTER,MEMBERSHIP_STATUS from LMS_MEMBERS 
where DATE_REGISTER<'2012-03-01' and MEMBERSHIP_STATUS='Temporary'; 

--11.Write a query to display the member id, member name who’s City is CHENNAI or DELHI.
--Hint: Display the member name in title case with alias name 'Name'.

select MEMBER_ID,MEMBER_NAME Name from LMS_MEMBERS where CITY in ('CHENNAI','DELHI');

--12Write a query to concatenate book title, author and display in the following format.
--Book_Title_is_written_by_Author
--Example: Let Us C_is_written_by_Yashavant Kanetkar
--Hint: display unique books. Use “BOOK_WRITTEN_BY” as alias name. 

select distinct BOOK_TITLE+'_is_written_by_'+AUTHOR BOOK_WRITTEN_BY from LMS_BOOK_DETAILS

--13.Write a query to display the average price of books which is belonging to ‘JAVA’ category
--with alias name  “AVERAGEPRICE”.
select AVG(price) AVERAGEPRICE from LMS_BOOK_DETAILS where CATEGORY='JAVA';

--14.Write a query to display the supplier id, supplier name and email of the suppliers 
--who are all having gmail account.

select SUPPLIER_ID,SUPPLIER_NAME,EMAIL from LMS_SUPPLIERS_DETAILS where EMAIL like '%gmail%'; 

--16. Write a query to display the supplier id, supplier name and contact.
--If phone number is null then display ‘No’else display ‘Yes’ with alias name “PHONENUMAVAILABLE”.
--Hint: Use ISNULL.

select SUPPLIER_ID,SUPPLIER_NAME,CASE WHEN CONTACT IS NOT NULL THEN 'Yes' ELSE 'No' END
'PHONENUMAVAILABLE' from LMS_SUPPLIERS_DETAILS


