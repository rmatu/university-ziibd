--====1====

SELECT last_name, salary FROM employees 
WHERE salary > 12000;


--====2====

SELECT last_name FROM employees
where employee_id = 176;


--====3====

SELECT last_name, salary FROM employees 
WHERE salary < 5000 OR salary > 12000


--====4====

SELECT last_name, job_id, hire_date FROM employees
WHERE last_name LIKE 'Matos' OR last_name LIKE 'Taylor';


--====5====

SELECT last_name, department_id FROM employees
WHERE department_id LIKE '20' OR department_id LIKE '50'
ORDER BY last_name ASC;


--====6====

SELECT last_name, salary FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND (department_id LIKE 20 OR department_id LIKE 50);


--====7====

SELECT last_name, hire_date FROM employees
WHERE extract(year from hire_date) = 1994;


--====8====

SELECT last_name, job_id FROM employees 
WHERE manager_id IS NULL

--====9====

SELECT last_name, salary, commission_pct FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC  


--====10====

SELECT employee_id, last_name, salary, department_id FROM employees
WHERE salary > '&userstart';


--====11====

SELECT employee_id, last_name, salary, department_id FROM employees
WHERE manager_id = &user1
ORDER BY &user2;


--====12====

SELECT last_name FROM employees
WHERE last_name LIKE '__a%'


--====13====

SELECT last_name FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

--====14=====

SELECT last_name, job_id, salary FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 35000, 7000);

--====15=====

SELECT last_name, salary, commission_pct FROM employees
WHERE commission_pct = .20
