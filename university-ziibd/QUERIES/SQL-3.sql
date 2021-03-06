
--====1====

SELECT sysdate "DATE"
FROM dual;

--====2=====

SELECT employee_id, last_name, salary,
ROUND(salary * 1.115, 0) "New Salary"
FROM employees

--====4=====

SELECT employee_id, last_name, salary,
ROUND(salary * 1.115, 0) "New Salary",
ROUND(salary * 1.115, 0) - salary "Increase"
FROM employees


--=====5=====

SELECT INITCAP(last_name), LENGTH(last_name)
FROM employees
WHERE last_name LIKE 'J%'
OR last_name LIKE 'M%'
OR last_name LIKE 'A%'
ORDER BY last_name

--====5.1=====

SELECT INITCAP(last_name), LENGTH(last_name)
FROM employees
WHERE last_name LIKE UPPER('&first_letter%' )
ORDER BY last_name


--===5.2====

SELECT last_name, ROUND(MONTHS_BETWEEN(
       SYSDATE, hire_date)) MONTHS_WORKED
FROM employees
ORDER BY months_worked;

--====6=====

SELECT last_name, ROUND(MONTHS_BETWEEN(
       SYSDATE, hire_date)) MONTHS_WORKED
FROM employees
ORDER BY months_worked;

--====7====

SELECT last_name, LPAD(salary, 15, '$') SALARY
FROM employees;


--====8=====

SELECT last_name, trunc((SYSDATE-hire_date)/7) AS TENURE
FROM employees
WHERE department_id = 90
ORDER BY TENURE DESC
