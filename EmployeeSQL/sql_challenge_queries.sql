--DATA ANALYSIS
-- 1. LISTING THE EMPLOYEE NUMBER, LAST NAME, FIRST NAME, SEX, AND SALARY OF EACH EMPLOYEE
CREATE VIEW employee_info AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no;

SELECT * FROM employee_info;

--2. LISTING THE FIRST NAME, LAST NAME AND HIRE DATE FOR EMPLOYEES HIRED IN 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. LISTING THE MANAGER OF EACH DEPARTMENT, DEPT NO, DEPT NAME, EMPLOYEE#, LAST NAME, FIRST NAME
SELECT m.dept_no, m.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager AS m
JOIN departments AS d ON m.dept_no = d.dept_no
JOIN employees AS e ON m.emp_no = e.emp_no;

--4. LISTING THE DEPT#, EMPLOYEE#, LAST NAME, FIRST NAME, AND DEPT NAME FOR EACH EMPLOYEE
SELECT m.dept_no, m.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS m
JOIN departments AS d ON m.dept_no = d.dept_no
JOIN employees AS e ON m.emp_no = e.emp_no;

--5. LISTING THE FIRST NAME, LAST NAME, AND SEX FOR EACH EMPLOYEE NAMED HERCULES AND WHOSE LAST NAME BEGINS WITH 'B'
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. LISTING EMPLOYEE #, LAST NAME, AND FIRST NAME FOR EACH EMPLOYEE IN SALES DEPARTMENT
SELECT m.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS m
JOIN employees AS e ON m.emp_no = e.emp_no
JOIN departments AS d ON m.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--7.LISTING EMPLOYEE #, LAST NAME, FIRST NAME, AND DEPT NAME FOR EACH EMPLOYEE IN SALES AND DEVELOPMENT DEPARTMENTS
SELECT m.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS m
JOIN employees AS e ON m.emp_no = e.emp_no
JOIN departments AS d ON m.dept_no = d.dept_no
WHERE dept_name IN ('Sales', 'Development');

--8. LISTING THE FREQUENCY COUNTS OF ALL THE EMPLOYEE'S LAST NAMES
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;