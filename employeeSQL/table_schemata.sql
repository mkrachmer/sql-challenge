--sql-challenge

-- delete table if exists before creating new ones
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

-- create titles table and import csv
CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
	);
SELECT * FROM titles;

-- create employees table and import csv
CREATE TABLE employees (
	emp_num INTEGER PRIMARY KEY NOT NULL,          
	emp_title_id VARCHAR(30) NOT NULL,                 
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	);
SELECT * FROM employees;

-- create salaries table and import csv
CREATE TABLE salaries (
	emp_num INTEGER PRIMARY KEY NOT NULL,                 
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_num) REFERENCES employees(emp_num)
	);
SELECT * FROM salaries;

-- create departments table and import csv
CREATE TABLE departments (
	dept_num VARCHAR(12) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
	);
SELECT * FROM departments;

-- create dept_manager table and import csv
CREATE TABLE dept_manager (
	dept_num VARCHAR(12) NOT NULL,
	emp_num INTEGER NOT NULL,
	FOREIGN KEY (dept_num) REFERENCES departments(dept_num),
	FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
	CONSTRAINT dept_emp_mgr_pkey PRIMARY KEY (dept_num, emp_num)
	);
SELECT * FROM dept_manager;

-- create dept_emp table and import csv
CREATE TABLE dept_emp (
	emp_num INTEGER NOT NULL,
	dept_num VARCHAR(12) NOT NULL,
	FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
	FOREIGN KEY (dept_num) REFERENCES departments(dept_num),
	CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_num, dept_num)
	);
SELECT * FROM dept_emp;

