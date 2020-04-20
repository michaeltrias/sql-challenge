
--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no AS "employee number", employees.last_name, employees.first_name, employees.gender, salaries.salary
  FROM employees
 INNER JOIN salaries on employees.emp_no = salaries.emp_no;
	   
--List employees who were hired in 1986.

SELECT employees.first_name,employees.last_name, employees.hire_date
  FROM employees
 WHERE hire_date between '1986-01-01' and '1986-12-31'

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
  FROM dept_manager
 INNER JOIN employees on dept_manager.emp_no = employees.emp_no
 INNER JOIN departments on dept_manager.dept_no = departments.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
  FROM employees
  JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
  JOIN departments ON dept_emp.dept_no = departments.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * 
  FROM employees
 WHERE first_name = 'Hercules' and last_name LIKE 'B%';



--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--revisit

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
  FROM employees
 INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
 INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
 WHERE departments.dept_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
  FROM employees
 INNER JOIN dept_emp  ON dept_emp.emp_no = employees.emp_no
  JOIN departments on departments.dept_no = dept_emp.dept_no
 WHERE dept_name in ('Sales', 'Development');
	

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name,
	count (employees.last_name)
	from employees
	group by employees.last_name
	order by count(employees.last_name);
	

