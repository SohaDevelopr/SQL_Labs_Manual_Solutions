/* Lab 2 */

Create Table Student_Lab2 (
student_no int unique,
student_name varchar(225) not null,
student_address varchar(225)
)

Alter Table Student_Lab2 Add student_gender varchar(10)
Alter Table Student_Lab2 Alter Column student_address char(100)
Alter Table Student_Lab2 Add Constraint cons Default 'f' For student_gender

/* Lab 3 */

Create Table Employee_Lab3 (
e_name varchar(225),
e_no int unique,
salary int Check (salary > 1500),
e_gender varchar(10)
)

Create Table Departmant_Lab3 ( 
d_no int ,
d_name varchar(255),
manager varchar(20)
)

Alter Table Departmant_Lab3 Alter Column  d_no int Not Null 
Alter Table Employee_Lab3 Add Constraint con1 Default 'Female' For e_gender
Select * From Employee_Lab3
Alter Table Employee_Lab3 Drop Constraint con1
Select * From Employee_Lab3
Delete From Employee_Lab3 Where e_gender = 'male'


/* Lab 4 */

Create Table Lab4_Employee (
e_no int Not Null Primary Key,
e_name varchar(30),
salary int ,
phone varchar(10)
)

Create Table Lab4_Departmant ( 
d_no int Not Null Primary Key ,
d_name varchar(30),
manager_no int
)

Insert Into Lab4_Employee Values 
(1456,'Ahmad', 4000, '0555558888'),
(1457,'Khaled',4500,'0555553333'),
(1458,'Ahmad',3000,'0555554444'),
(1459,'Mohamed',6000,'0555555777')
select * from Lab4_Employee

Insert Into Lab4_Departmant Values
(1,'CS',1457),
(2,'IS',1459)
select * from Lab4_Departmant

select * from Lab4_Employee Order By salary asc
select e_name,salary from Lab4_Employee where e_name = 'Ahmad'


/* Lab 5 */

Create Table Employee_Lab5 (
e_no int Not Null Primary Key,
e_name varchar(30),
salary int ,
phone varchar(10)
)

Insert Into Employee_Lab5 Values 
(1456,'Ahmad', 4000, '0555558888'),
(1457,'Khaled',4500,null),
(1458,'Ahmad',3000,'0555554444'),
(1459,'Mohamed',6000,'0555555777')
select * from Employee_Lab5
select * from Employee_Lab5 where e_name = 'Ahmad' and salary = 4000
select e_name,salary+2000 from Employee_Lab5 where e_name like '%d' 
select e_no,e_name from Employee_Lab5 where e_name like '%ma%' 
select * from Employee_Lab5 where (e_name between 'khaled' and 'Mohamed') and phone is null 


/* Lab 6 */

Create Table Departmant_Lab6 ( 
d_no int Not Null Primary Key ,
d_name varchar(30),
manager_no int
)

Create Table Employee_Lab6 (
e_no int Not Null Primary Key,
e_name varchar(30),
salary int ,
phone varchar(10),
d_no int Foreign Key References Departmant_Lab6 (d_no)
)


Insert Into Departmant_Lab6 Values
(1,'CS',1457),
(2,'IS',1459),
(3,'SE',1444),
(4,'CS',1433),
(5,'CS',1411)
select * from Departmant_Lab6


Insert Into Employee_Lab6 Values 
(1456,'Ahmad', 4000, '0555558888',1),
(1457,'Khaled',4500,'0555553333',2),
(1458,'Ahmad',3000,'0555554444',3),
(1459,'Mohamed',6000,'0555555777',4)
select * from Employee_Lab6

select distinct e_name,salary from Employee_Lab6 order by salary desc
Alter Table Employee_Lab6 Drop Column salary
select * from Employee_Lab6

select d_no from Employee_Lab6
union all
select d_no from Departmant_Lab6

select d_no from Employee_Lab6
intersect
select d_no from Departmant_Lab6

select d_no from Departmant_Lab6
except
select d_no from Employee_Lab6


select E.d_no from Employee_Lab6 As E 
intersect
select D.d_no from Departmant_Lab6 As D


/* Lab 7 */

Create Table Std_grades_Lab7(
id int,
first_name varchar(30),
last_name varchar(30),
mark int 
)

insert into Std_grades_Lab7 values
(0615,'Amera','majed',98),
(0513,'Wafa','ahmad',56),
(0713,'Abeer','salem',96),
(0533,'ohood','ahmad',86)

select * from Std_grades_Lab7 where mark > (select avg(mark) from Std_grades_Lab7)
select count(*) as 'Count' from Std_grades_Lab7
create view v as select id , mark from Std_grades_Lab7 
select * from v where mark >= 95
select first_name , last_name , mark from Std_grades_Lab7 where mark = (select min(mark) from Std_grades_Lab7)


/* Lab 8 */

Create Table Departmant_Lab8 ( 
d_no int Not Null Primary Key ,
d_name varchar(30),
manager_no int
)

Create Table Employee_Lab8 (
e_no int Not Null Primary Key,
e_name varchar(30),
salary int ,
phone varchar(10),
d_no int Foreign Key References Departmant_Lab8 (d_no)
)



Insert Into Departmant_Lab8 Values
(1,'CS',1457),
(2,'IS',1459),
(3,'SE',1444),
(4,'CS',1433),
(5,'CS',1411)
select * from Departmant_Lab8


Insert Into Employee_Lab8 Values 
(1456,'Ahmad', 4000, '0555558888',1),
(1457,'Khaled',4500,'0555553333',2),
(1458,'Ahmad',3000,'0555554444',3),
(1459,'Mohamed',6000,'0555555777',4),
(1460,'Noor',5000,'0555553334',2),
(1461,'waleed',7000,'0555553222',null)
select * from Employee_Lab8

select e_name , Employee_Lab8.d_no , d_name from Departmant_Lab8 
inner join Employee_Lab8 on Departmant_Lab8.d_no = Employee_Lab8.d_no

select e_name , Employee_Lab8.d_no , d_name from Departmant_Lab8 
left join Employee_Lab8 on Departmant_Lab8.d_no = Employee_Lab8.d_no

select e_name , Employee_Lab8.d_no , d_name from Departmant_Lab8 
right join Employee_Lab8 on Departmant_Lab8.d_no = Employee_Lab8.d_no

select Employee_Lab8.d_no,e_name,d_name from Departmant_Lab8 inner join Employee_Lab8 on d_name = 'CS' and Departmant_Lab8.d_no = Employee_Lab8.d_no
select Employee_Lab8.* from Departmant_Lab8 inner join Employee_Lab8 
on Employee_Lab8.e_no = (select manager_no from Departmant_Lab8 where d_no = (select e_name from Employee_Lab8 where e_name = 'Noor'))


/* Lab 9 */

Create Table Departmant_Lab9 ( 
d_no int Not Null Primary Key ,
d_name varchar(30),
manager_no int
)

Create Table Employee_Lab9 (
e_no int Not Null Primary Key,
e_name varchar(30),
salary int ,
phone varchar(10),
d_no int Foreign Key References Departmant_Lab9 (d_no)
)


Insert Into Departmant_Lab9 Values
(1,'CS',1457),
(2,'IS',1459),
(3,'SE',1444),
(4,'CS',1433),
(5,'CS',1411)
select * from Departmant_Lab9


Insert Into Employee_Lab9 Values 
(1456,'Ahmad', 4000, '0555558888',1),
(1457,'Khaled',4500,'0555553333',2),
(1458,'Ahmad',3000,'0555554444',3),
(1459,'Mohamed',6000,'0555555777',4),
(1460,'Noor',5000,'0555553334',2)
select * from Employee_Lab9

select min(salary) As 'less salary of each department' from Employee_Lab9 
select e_name,d_no,salary from Employee_Lab9 where salary in (select min(salary) As 'less salary of each department' from Employee_Lab9 group by d_no)
select salary from Employee_Lab9 where d_no = 4 --4500,5000
select e_name,d_no,salary from Employee_Lab9 where salary <any (select salary from Employee_Lab9 where d_no = 4) and d_no <> 4
select d_no,avg(salary) As 'avg salary to all d_no' from Employee_Lab9 group by d_no
SELECT e_name, d_no, salary FROM Employee_Lab9 
WHERE salary  <all  (SELECT AVG(salary) AS 'AVRAGE SALARY TO ALL DNO' FROM Employee_Lab9 group by d_no)


select d_no,sum(salary) As 'sum of salaries for each department ' from Employee_Lab9 group by d_no having sum(salary) > 6000 
select min(salary) As 'less salary of dep 2' from Employee_Lab9 where d_no = 2 
select d_no,e_name,salary from Employee_Lab9 where salary > (select min(salary) As 'less salary of dep 2' from Employee_Lab9 where d_no = 2) and d_no <> 2 
select d_no,avg(salary) As 'Salary AVG' from Employee_Lab9 group by d_no having avg(salary) > 3000 

select e_name,d_no,salary from Employee_Lab9 where salary >all (select avg(salary) As 'salary avg for dep 4' from Employee_Lab9 where d_no = 4) and d_no <> 4 
