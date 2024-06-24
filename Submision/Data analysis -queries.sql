--queries

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" e JOIN "Salaries" s ON e.emp_no = s.emp_no
ORDER BY e.last_name asc, s.salary desc;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT last_name,first_name,  hire_date
FROM "Employees"
WHERE hire_date >= '19860101'
  AND hire_date <= '19861201'
ORDER BY last_name asc;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name,  m.dept_no, d.dept_name
FROM  "Managers" m
	JOIN "Employees" e ON  m.emp_no = e.emp_no
	JOIN "Department" d ON m.dept_no = d.dept_no
ORDER BY e.last_name asc;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM   "Department_employee" de
	JOIN "Employees" e ON de.emp_no = e.emp_no  
	JOIN "Department" d ON de.dept_no = d.dept_no
ORDER BY e.last_name asc;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT last_name, first_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

-- List each employee in the Sales department, including their employee number, last name, and first name.


SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM   "Department_employee" de
	JOIN "Employees" e ON de.emp_no = e.emp_no  
	JOIN "Department" d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
ORDER BY e.last_name asc;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM   "Department_employee" de
	JOIN "Employees" e ON de.emp_no = e.emp_no  
	JOIN "Department" d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.last_name asc,
		d.dept_name desc;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY last_name desc;


