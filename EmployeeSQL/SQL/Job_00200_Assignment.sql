
--
-- Get Employee Number, lName, fName, Salary
--
Select 
	a.emp_no
	,a.last_name
	,a.first_name
	,a.gender
	,b.salary 
	FROM employees a
		join salaries b
			on a.emp_no = b.emp_no
	order by a.emp_no;

--
-- Find employees hired in 1986
--
Select emp_no
	,first_name
	,last_name
	,hire_date
	From employees
	where hire_date between '1986-01-01' and '1986-12-31'
	order by hire_date;

--
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name
--, first name, and start and end employment dates.
--
Select
		a.dept_no
		,a.dept_name
		,b.emp_no
		,c.last_name
		,c.first_name
		,b.from_date
		,b.to_date
	from departments a
		join dept_manager b
			on a.dept_no = b.dept_no
		join employees c
			on b.emp_no = c.emp_no;

--
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
--

SELECT 
		a.emp_no
		,a.last_name
		,a.first_name
		,c.dept_name
	FROM employees a
		join dept_emp b
			on a.emp_no = b.emp_no
		join departments c
			on b.dept_no = c.dept_no
	order by emp_no;

--
--5. List all employees whose first name is "Hercules" and last names begin with "B."
--

Select *
	FRom EMployees 
	where first_name = 'Hercules'
	and last_name like 'B%';
	
--
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--
--
Select 
	a.emp_no
	,a.last_name
	,a.first_name
	,c.dept_name
	FROM employees a
		join dept_emp b
			on a.emp_no = b.emp_no
		join departments c
			on b.dept_no = c.dept_no
			and c.dept_name = 'Sales'
	order by emp_no;

--List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.


--select dept_name from departments group by dept_name order by dept_name
Select 
	a.emp_no
	,a.last_name
	,a.first_name
	,c.dept_name
	FROM employees a
		join dept_emp b
			on a.emp_no = b.emp_no
		join departments c
			on b.dept_no = c.dept_no
	WHERE c.dept_name IN ('Sales', 'Development')
	order by emp_no;

--	
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--
Select last_name, count(*) As Name_Count
	from employees
	group by last_name
	order by count(*) desc;