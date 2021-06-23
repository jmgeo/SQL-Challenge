--Data Analysis

--From the ReadMe: 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

--Join the salary table to the employees table on the emp_no key
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--From the ReadMe: 2. List first name, last name, and hire date for employees who were hired in 1986.

--Select the emp_no, first_name, last_name, and hire_date from employees table for all date values for the full year of 1986, 
--which is dates greater than 12/31/1985 and less than 1/1/1987
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

--From the ReadMe: 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--Join departments and dept_manager on dept_no. Then join employees to dept_manager on emp_no to add first and last names.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
LEFT JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
LEFT JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--From the ReadMe: 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--Join dept_emp to departments on dept_no to add dept_names. Then join employees to dept_emp on emp_no to get first and last names

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no
LEFT JOIN employees ON
dept_emp.emp_no = employees.emp_no;

--From the ReadMe: 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--Select first and last name and sex from employees where first name is Hercules and last names start with B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%'

--From the ReadMe: 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
--Select first and last name and sex from employees. Join with dept_emp on emp_no. Then join with departments on dept_no to get Sales.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--From the ReadME: 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--Same code as above, same operations, except just need to replace 'Sales' with 'Sales' and an OR for 'Development'.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR
	departments.dept_name = 'Development';
	
--From the ReadMe: 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--Create a column and add to it the count of groups of last name. Use Group By on last_name from employees. Order using DESC.
SELECT last_name, count(*)
AS "Frequency_Count_Of_Employee_Last_Names"
FROM employees
GROUP BY last_name
ORDER BY "Frequency_Count_Of_Employee_Last_Names" DESC;