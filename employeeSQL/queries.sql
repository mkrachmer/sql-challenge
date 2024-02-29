--sql-challenge

--DATA ANALYSIS
--List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW employee_data AS
SELECT employees.emp_num, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_num = salaries.emp_num;

SELECT * FROM employee_data;

--List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW employees_hired_1986 AS
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

SELECT * FROM employees_hired_1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW manager_data AS
SELECT dept_manager.dept_num, departments.dept_name, dept_manager.emp_num, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_num = departments.dept_num
INNER JOIN employees ON
dept_manager.emp_num = employees.emp_num;

SELECT * FROM manager_data;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW employee_depts AS
SELECT employees.emp_num, employees.last_name, employees.first_name, departments.dept_num, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_num = dept_emp.emp_num
INNER JOIN departments ON
dept_emp.dept_num = departments.dept_num;

SELECT * FROM employee_depts;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW hercules AS
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT * FROM hercules;

--DROP VIEW IF EXISTS hercules;

--List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW sales_employees AS
SELECT employees.emp_num, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_num = dept_emp.emp_num
INNER JOIN departments ON
dept_emp.dept_num = departments.dept_num
WHERE departments.dept_name = 'Sales';

SELECT * FROM sales_employees;

--DROP VIEW IF EXISTS sales_employees;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_dev_employees AS
SELECT employees.emp_num, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_num = dept_emp.emp_num
INNER JOIN departments ON
dept_emp.dept_num = departments.dept_num
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

SELECT * FROM sales_dev_employees;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW last_name_counts AS
SELECT employees.last_name, count(emp_num) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;

SELECT * FROM last_name_counts;


