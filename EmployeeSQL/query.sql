-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries ON
employees.emp_no = salaries.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT ('year' from hire_date) = 1986;

-- 3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT B.dept_no, C.dept_name, B.emp_no, A.last_name, A.first_name 
FROM employees A
RIGHT JOIN dept_manager B
ON A.emp_no = B.emp_no
LEFT JOIN departments C
ON B.dept_no = C.dept_no;

-- 4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT A.emp_no, A.last_name, A.first_name, C.dept_name
FROM employees A
LEFT JOIN dept_emp B
ON A.emp_no = B.emp_no
LEFT JOIN departments C
ON B.dept_no = C.dept_no;
--*PROBLEM: Same employees are lsited in multiple departments.

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

SELECT first_name, last_name, sex
  FROM employees
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

SELECT A.emp_no, A.last_name, A.first_name, C.dept_name
FROM employees A
LEFT JOIN dept_emp B
ON A.emp_no = B.emp_no
LEFT JOIN departments C
ON B.dept_no = C.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
-- 8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.