--====1====

SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries

--=====2======

SELECT last_name, department_id, department_name
FROM employees
JOIN departments
USING (department_id)

--=====3======

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e 
JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)
WHERE l.city = 'Toronto'

--=====4======

SELECT e.last_name "Employee", e.employee_id "EMP#",
m.last_name "Manager", m.employee_id "Mgr#"
FROM employees e
JOIN employees m
ON (e.manager_id = m.employee_id)

--=====5======

SELECT e.last_name "Employee", e.employee_id "EMP#",
m.last_name "Manager", m.employee_id "Mgr#"
FROM employees e
LEFT OUTER JOIN employees m
ON (e.manager_id = m.employee_id)

--=====6======

SELECT e.department_id "DEPARTMENT", e.last_name "EMPLOYEE", c.last_name "COLLEAGUE"
FROM employees e 
JOIN employees c
ON (e.department_id = c.department_id)
WHERE e.employee_id <> c.employee_id

--=====7======

SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
JOIN job_grades j
on (e.salary BETWEEN j.lowest_sal and j.highest_sal);

--=====8======

SELECT e.last_name, e.hire_date
FROM employees e
JOIN employees d
ON (d.last_name = 'Davies')
WHERE d.hire_date < e.hire_date;

--=====9======

SELECT e.last_name, e.hire_date, m.last_name, m.hire_date
FROM employees e 
JOIN employees m
ON (e.manager_id = m.employee_id)
WHERE e.hire_date < m.hire_date;


