Create Database UdemyCourseDb

--Introduction to the concept of Databases and Introduction to SQL Querying --
--by Rakesh Gopalakrishnan--


--==HOW TO CREATE A TABLE AND COLUMNS AND VALUES==--

Create table DAClass
(
Sr int,
Firstname varchar(50),
Roll number varchar(20),
Studentage varchar(20)
)

select Srno, Firstname, Rollno, Studentage from DAClass

insert into DAClass(Srno, Firstname, Rollno, Studentage)
values(1,'Sumit',1,20)
 
insert into DAClass(Srno, Firstname, Rollno, Studentage)
values(2,'Rakesh',2,21)



--Installed the sample data base--
--Querying start--



use AdventureWorks2022

select * from [HumanResources].[Department]

--Query 1 = SHOW ME ALL DEPARTMENT NAMES

SELECT NAME FROM [HumanResources].[Department]

--Query 2 = SHOW ME ALL GROUPS

SELECT GroupNAME FROM [HumanResources].[Department]





---==DISTINCT keyword==---
--DISTINCT keyword = Will give unique values and avoid the repititive values


--Query 3 = SHOW ME ALL DISTINCT GROUPNAME

SELECT Distinct GroupNAME FROM [HumanResources].[Department]






---==Where Clause===---
--Used when there is a condition


--Query 4 = SHOW ME ALL NAME WHO ARE A PART OF MANUFACTURING

SELECT Name,GroupNAME FROM [HumanResources].[Department]
Where GroupName like ('Manufacturing')





===SEPARATING BASED ON INTEGER===


--Query 5 = GIVE ME ALL LIST OF ALL EMPLOYEE WITH ORGLEVEL = 2

Select * from [HumanResources].[Employee] where Organizationlevel = 2


--Query 6 = GIVE ME ALL LIST OF ALL EMPLOYEE WITH ORGLEVEL = 2 OR 3

Select * from [HumanResources].[Employee] where Organizationlevel in (2,3)


--Query 7 = GIVE ME ALL LIST OF ALL EMPLOYEE WHO HAVE TITLE FACILITIES MANAGER
Select * from [HumanResources].[Employee] where Jobtitle like 'Facilities Manager'




---===WILD CARD (%) OPERATOR===---



--Query 8 = GIVE ME ALL LIST OF ALL EMPLOYEE WHO HAVE THE WORD MANAGER IN THEIR TITLE
Select * from [HumanResources].[Employee] where Jobtitle like '%Manager'
     ---%Manager--- = Means it says that
	 ---1. Anything can be before the word Manager, but nothing can be after the word Manager.




--Query 9 = GIVE ME ALL LIST OF ALL EMPLOYEE WHO HAVE THE WORD CONTROL IN THEIR TITLE
Select * from [HumanResources].[Employee] where Jobtitle like '%Control%'
     ---%Control%--- = Means it says that
	 ---1. Anything can be before the word Control and anything can be can be after the word Control.




--Query 10 = GIVE ME ALL LIST OF ALL EMPLOYEE WHO who are born after  jan 1, 1980
Select * from [HumanResources].[Employee] where birthdate > '1/1/1980'



--Query 11 = GIVE ME ALL LIST OF ALL EMPLOYEE WHO who are born between Jan 1, 1970 and Jan 1, 1980
Select * from [HumanResources].[Employee] where birthdate between '1/1/1970' AND '1/1/1980'





---===CALCULATED COLUMNS i.e. Total new columns to be introduced in the table===----


select * from [Production].[Product]
select name, listprice from [Production].[Product]

select Name, ListPrice, ListPrice + 30 as New_Price from [Production].[Product]




---===INTO CLAUSE===---
---Used to store the newly added data/columns etc and create a new table in your current running database


select Name, ListPrice, ListPrice + 30 as New_Price into [Production].[Product_2] from [Production].[Product]
select * from [Production].[Product_2]


---===CREATE A TEMPORARAY TABLE===---
--Syntax = #temptable




---===DELETE DATA===---

select * from [Production].[Product_2]
delete from [Production].[Product_2]
where name like 'Bearing Ball'



---===UPDATE DATA===---


Update [Production].[Product_2]
Set Name = 'Blade_New'
where Name like 'Blade'

select * from [Production].[Product_2]








---===Joins===---



Create table MyEmployee (EmployeeID int, FirstName Varchar(20), LastName Varchar (20))

Insert into MyEmployee values (1, 'Michael', 'Scott')
Insert into MyEmployee values (2, 'Pam', 'Beesly')
Insert into MyEmployee values (3, 'Dwight', 'Schrute')


Select * from MyEmployee



Create table MySalary (EmployeeID int, Salary float)

Insert into MySalary values (1, 10000)
Insert into MySalary values (2, 20000)
Insert into MySalary values (3, 30000)


Select * from MySalary


---To look at both tables together---


Select * from MyEmployee
Select * from MySalary



Select A. FirstName, A.LastName, B. Salary
from MyEmployee A Inner join MySalary B On A.EmployeeID = B. EmployeeID



---===Left Outer Join---===

Create table MyPhone (EmployeeID int, PhoneNumber int)

Insert Into MyPhone values (1, 123456789)
Insert Into MyPhone values (2, 123456)

Select * from MyPhone
--Use syntax 'Truncate table MyPhone' - to eradicate duplicate values and then again execute the code 

Select * from MyPhone
Select * from MyEmployee



Select A. FirstName, A.LastName, B.PhoneNumber
from MyEmployee A Left join MyPhone B On A.EmployeeID = B.EmployeeID






---===Right Outer Join---===

Create table MyParking (EmployeeID int, ParkingSpot varchar(20))

Insert Into MyParking values (1, 121)
Insert Into MyParking values (2, 122)

Select * from MyParking
Delete MyParking


Select * from MyParking
Select * from MyEmployee

Select A. ParkingNumber, B.FirstName, B.LastName
from MyParking A Right join MyEmployee B On A.EmployeeID = B.EmployeeID








---====Full Outer Join===---


Create table MyCustomer (CustomerId int, CustomerName varchar (20))

Insert Into MyCustomer values (1, 'Rakesh')
Insert Into MyCustomer values (2, 'John')

Create table MyOrder (OrderNumber int, OrderName varchar(50), CustomerId int)

Insert Into MyOrder values (1, 'SomeOrder1', 1)
Insert Into MyOrder values (2, 'SomeOrder2', 2)
Insert Into MyOrder values (3, 'SomeOrder3', 7)
Insert Into MyOrder values (4, 'SomeOrder4', 8)














----=====Date Functions---=====


---1. Get date
Select getdate ()


Select getdate () - 3




---2. Date Part
Select datepart (yyyy,getdate()) as YearNumber 
Select datepart (mm,getdate()) as MonthNumber 
Select datepart (dd,getdate()) as DayNumber 




---3. Date Add
Select dateadd (day, 4, getdate())




Select * from [Production].[WorkOrder]


Select top 10 * from [Production].[WorkOrder]
Select WorkOrderId, ProductId, Startdate, Enddate, DateDiff (day, startdate, enddate)
from [Production].[WorkOrder]


---To get to know the first day of this month---

Select DateAdd (dd, - (DatePart(Day, GetDate()) - 1), Getdate())








-----======In-Built Functions in SQL=======------


--I] Aggregate Functions 


--1. Average (Avg)
--2. Count
--3. Sum
--4. Min
--5. Max


--II] String Functions

--1. Concat
--2. Left
--3. Right
--4. Substring
--5. Lowercase
--6. Uppercase
--7. Length
--8. Trim
    --a. Left trim
	--b. Right trim