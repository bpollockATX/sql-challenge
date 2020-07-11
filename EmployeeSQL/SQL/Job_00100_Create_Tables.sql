Drop table if exists departments cascade;
drop table if exists dept_emp cascade;
drop table if exists dept_manager cascade;
drop table if exists employees cascade;
drop table if exists salaries cascade;
drop table if exists titles cascade;

--
-- Create departments table
--
Create Table departments
(
	dept_no varchar(10) Primary Key 
	,dept_name varchar(100)
);
Select * from departments limit 100;

--
-- Create employees table
--

Create table employees
(
	emp_no			INT primary key
	,birth_date		date
	,first_name		varchar(100)
	,last_name		varchar(100)
	,gender			char(1)
	,hire_date		date
);
Select * From employees;
--
-- Create Dept_Emp table
--
Create Table dept_emp
(
	emp_no		INT 
	,dept_no	varchar(10)
	,from_date	date
	,to_date	date
	,foreign key (dept_no) references departments(dept_no)
	,foreign key (emp_no) references employees(emp_no)
);
select * FROM dept_emp;

--
-- Create Dept_Manager table
--

Create table dept_manager
(
	
	--id serial primary key
	dept_no		varchar(10)
	,emp_no		INT
	,from_date	date
	,to_date	date
	,foreign key (dept_no) references departments(dept_no)
	,foreign key (emp_no) references employees(emp_no)
	
);

alter table dept_manager add id serial primary key;
Select * from dept_manager;



--
-- Create Salaries table
--
Create table salaries
(
	--ID serial primary key	
	emp_no		INT
	,salary		INT
	,from_date	date
	,to_date	date
	,foreign key (emp_no) references employees(emp_no) 
);
alter table salaries add id serial primary key;

Select * from salaries;

--
-- Create titles table 
--
Create table titles
(
	--,ID serial primary key
	emp_no		int 
	,title		varchar(100)
	,from_date	date
	,to_date	date
	,foreign key (emp_no) references employees(emp_no) 
);
alter table titles add ID serial primary key
Select * from titles;