/*
SSMS 19

Sql Defination : SQL is a standard language for storing, manipulating and retrieving data in databases.
SQL stands for Structured Query Language
SQL lets you access and manipulate databases
SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standardization (ISO) in 1987

RDBMS

RDBMS stands for Relational Database Management System.
The data in RDBMS is stored in database objects called tables. A table is a collection of related data entries and it consists of columns and rows.

*/
----------------------------------------------CREATE DATBASE----------------------------------------------------------
---CREATE STATEMENT----
create database Learning_Sql

 create table user1
 (
 user_Id int  identity(1,1),
 User_Name varchar(250),
 User_city varchar(250),
 )
 
 create table user2
 (
 Id int  identity(1,1),
 Name varchar(250),
 city varchar(250),
 )

 -------SELECT STATMENT------
 --The SELECT statement is used to select data from a database.

 select * from user1
 drop table user1
 --------------------------------------INSERT VALUES INTO USER1 TABLE-----------------------------------------
 -----INSERT STATMENT--------
 insert into user1 (User_Name,User_city)
 values('deep jadav','Surat'),
 ('rahul Modi','japan'),
 ('Suraj bhai','Australia'),
 ('rahul Modi','Ahemadabad');

 insert into user2 (Name,city)
 values('deep jadav','Surat'),
 ('rahul Modi','japan'),
 ('Suraj bhai','Australia'),
 ('rahul Modi','Ahemadabad');

 select * from user2

 ---where----
 --The WHERE clause is used to filter records.
 select * from user1 where USER_ID=2

 ---ORDER BY-----------
 --reset the asending and desending recors
 select * from user1 order by USER_ID

 ----AND---------------
 --its used to contaim tow condtions
 --all condtion needs be true
 --The AND operator is used to filter records based on more than one condition
 select * from user1
 where USER_NAME like 'deep jadav' and USER_ID=1

 ---OR----------------------
 --its used to contaim tow condtions
 --any one cndtion could be true its valid 
 select * from user1
 where USER_NAME like 'deep jadav' or USER_ID=6

 ------NOT-----------
 --it will print all all citys accept than surat 
 select * from user1
 where not User_city ='surat'

 -----NUll Vlues----
 --we can create colunms nut fifnt assign the values s it would be store the null values 
 alter table user1 add user_phone int
 select * from user1

 ------UPDATE---------
 --its used to modify existing records 
 --this recrid wil modify the user name based on the id 2 
 update user1 set User_Name ='Siddarth sir' where 
 USER_ID = 2
 select * from user1

 -------DELETE-----------------

 --this will delete one ids record using where clause condtion 
 delete from user1 where USER_ID=1
 --this will be deleted all records from user 1
 delete  from user1
 select * from user1

-----------------------------------------SQL Aggregate Functions-------------------------------
/*
MIN() - returns the smallest value within the selected column
MAX() - returns the largest value within the selected column
COUNT() - returns the number of rows in a set
SUM() - returns the total sum of a numerical column
AVG() - returns the average value of a numerical column
*/
alter table user1 add User_price nvarchar(20)
insert into user1(user_price)
values(10),
(20),
(30),
(40),
(50)
select * from user1

--MIN-----

--it would be store minimum price
select min(user_price)
from user1

--MAX----
--its defines the maximum values
select MAX(user_price)
from user1

--COUNT---
--it will count all the columns that exist in to the database 

select count(*)
from user1

--SUM--
--its returns the total all numerice numbers 
SELECT SUM (USER_ID)
from user1

--AVG---
--it will retrun the avrage of numerice values 
select AVG(USER_ID)
from user1

--LIKE ----
--it used to define something special parrten like character like number using where clause condtion 
select * from user1 where USER_NAME LIKE 'deep jadav'

--IN OPERATOR--
--The IN operator allows you to specify multiple values in a WHERE clause.
-- baslcally used for the store multiple recrods on specefic codntion 
--this will retrun only retuen pne becuse on that specefic condtion i only have one values 
select * from user1
where USER_NAME IN ('deep jadav')


--BETWEEN------
--it returns the middle values from two condtion 
--The BETWEEN operator is inclusive: begin and end values are included
select * from user1 where USE3R_ID between 5 and 10

---sql ALIASES---
--it used to return the termperory name to columns to table
--here we use the u as n alias to as temprory name 
select u.user_id,u.User_Name 
From user1 as u
where User_id between 5 and 10



--------------------------------------------------------SQL JOINS -------------------------------
/*
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

*/

----INNER JOIN----
-->its used to combine rows who has same matching values 
-->it will retrun matching names from both tables 

select USER_NAME,USER_ID,Name,city from
user1 inner join user2  on USER_NAME = Name

---LEFT JOIN ----
--left join wll retuns the values from the left side and matching the values on the right side 


select USER_NAME,USER_ID,Name,city from
user1 left join user2  on USER_NAME = Name


---RIGHT JOIN ----
--right join wll retuns the values from the right side and matching the values on the left side 

select USER_NAME,USER_ID,Name,city from
user1 right join user2  on USER_NAME = Name

--FULL OUTER JOIN ----
--it retruns all matching rows and non matching rows from both table 


select USER_NAME,USER_ID,Name,city from
user1 full outer join user2  on USER_NAME = Name

-- SELF JOIN---

--it used to join with it self were find duplicate values nd comparing rows 
--still not understand usecase of self join 

--GROUP BY STATEMENT---
-->whoever rows has the same values that will generate the group of that values 
-->it widly used with agaregate function
-->if you want to use agegrgate function with multiple records it always define by the group by
-->this will be stored maximum proce on assending order 

select * from user1
SELECT MAX(User_price)as user_price
from user1 Group By user_price
Order by user_price ASC
