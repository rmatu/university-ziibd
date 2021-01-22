ZWRÓĆ 4 PRACOWNIKÓW Z NAJWYŻSZYMI ZAROBKAMI

SELECT last_name, salary
FROM employees2 e
WHERE 4 > (SELECT COUNT(*)
           FROM employees2
           WHERE e.salary < salary)
		   
	
2.1	
SELECT AVG(salary) as srednia, TO_CHAR(hire_date, 'DAY')
FROM employees
GROUP BY TO_CHAR(hire_date, 'DAY')
ORDER BY srednia;

2.2
SELECT TO_CHAR(hire_date, 'D'), TO_CHAR(hire_date, 'DAY'), avg(salary)
FROM employees 
WHERE TO_CHAR(hire_date, 'D') IN (1,2,3,4,5,6,7)
GROUP BY TO_CHAR(hire_date, 'D'), TO_CHAR(hire_date, 'DAY')
ORDER BY TO_CHAR(hire_date, 'D');

3.
SELECT e.last_name, d.department_name,  e.salary
FROM employees e JOIN departments d 
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE (e.salary, e.commission_pct) in (select ee.salary, ee.commission_pct
                    from employees ee
                    join departments dd on ee.department_id = dd.department_id
                    join locations ll on dd.location_id = ll.location_id
                    where ll.city = 'Oxford');