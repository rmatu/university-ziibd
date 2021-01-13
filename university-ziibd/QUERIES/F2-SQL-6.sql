--=== ZESTAW 5 ===
--=== 1 ===
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

--=== 2 ===
SELECT TZ_OFFSET('US/Pacific-New') from dual;

SELECT TZ_OFFSET('Singapore') from dual;

SELECT TZ_OFFSET('Egypt') from dual;

ALTER SESSION SET TIME_ZONE = '-7:00';

SELECT CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP FROM dual;

ALTER SESSION SET TIME_ZONE = '+8:00';

SELECT CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP FROM dual;

--=== 3 ===
SELECT DBTIMEZONE, SESSIONTIMEZONE FROM dual;

--=== 4 ===
SELECT last_name, EXTRACT(YEAR FROM hire_date)
FROM employees
WHERE department_id = 80;

--=== 5 ===
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';

--=== 6 ===
SELECT * FROM sample_dates;
ALTER TABLE sample_dates MODIFY date_col TIMESTAMP;
SELECT * FROM sample_dates;
ALTER TABLE sample_dates MODIFY date_col TIMESTAMP WITH TIME ZONE;

--=== 7 ===
SELECT e.last_name
    (CASE extract(year from e.hire_date)
    WHEN 1998 THEN 'Needs Review'
    ELSE 'not this year!'
    END ) AS "Review "
FROM employees e
ORDER BY e.hire_date;

--=== 8 ===
SELECT e.last_name, hire_date, sysdate,
    (CASE
     WHEN (sysdate -TO_YMINTERVAL('15-0'))>=
        hire_date THEN '15 years of service'
    WHEN (sysdate -TO_YMINTERVAL('10-0'))>=
        hire_date THEN '10 years of service'
    WHEN (sysdate -TO_YMINTERVAL('5-0'))>=
        hire_date THEN '5 years of service'
        ELSE 'maybe next year!'
        END) AS "Awards"
FROM employees e;


--==ZESTAW 6 ===
--=== 1 ===
SELECT last_name, department_id, salary
FROm employees
WHERE (salary, department_id) IN
      (SELECT salary, department_id
       FROM employees
       WHERE commission_pct IS NOT NULL);
       
--=== 2 ===
SELECT e.last_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND (salary, NVL(commission_pct, 0)) IN
        (SELECT salary, NVL(commission_pct,0)
        FROM employees e, departments d
        WHERE e.department_id = d.department_id
        AND d.location_id = 1700);

--=== 3 ===
SELECT last_name, hire_date, salary
FROm employees
WHERE (salary, NVL(commission_pct, 0)) IN
        (SELECT salary, NVL(commission_pct, 0)
         FROM employees
         WHERE last_name = 'Kochhar')
AND last_name != 'Kochhar';
        
--=== 4 ===
SELECT last_name, job_id, salary
FROM employees
WHERE salary > ALL
    (SELECT salary
     FROM employees
WHERE job_id = 'SA_MAN')
ORDER BY salary DESC;

--=== 5 ===
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN (SELECT department_id 
                        FROM departments
                        WHERE location_id IN
                        (SELECT location_id
                         FROM locations
                         WHERE city LIKE 'T%'));

--=== 6 ===
SELECT e.last_name ename, e.salary salary,
        e.department_id deptno, AVG(a.salary) dept_avg
FROM employees e, employees a
WHERE e.department_id = a.department_id
AND e.salary > (SELECT AVG(salary)
        FROM employees
        WHERE department_id = e.department_id)
GROUP BY e.last_name, e.salary, e.department_id
ORDER BY AVG(a.salary);

--=== 7a ===
SELECT outer.last_name
FROM employees outer
WHERE NOT EXISTS (SELECT 'X'
                  FROM employees inner
                  WHERE inner.manager_id = 
                  outer.employee_id);

--=== 7b ===
SELECT outer.last_name
FROM employees outer
WHERE outer.employee_id
NOT IN (SELECT inner.manager_id
        FROM employees inner);
              
--=== 8 ===
SELECT last_name
FROm employees outer
WHERE outer.salary < (SELECT AVG(inner.salary)
                      FROM employees inner
                      WHERE inner.department_id
                        = outer.department_id);
                        
--=== 9 ===
SELECT last_name
FROM employees outer
WHERE EXISTS (SELECT 'X'
              FROM employees inner
              WHERE inner.department_id = 
                outer.department_id
              AND inner.hire_date > outer.hire_date
              AND inner.salary > outer.salary);
              
--=== 10 ===
SELECT employee_id, last_name,
    (SELECT department_name
     FROM departments d
     WHERE e.department_id = 
        d.department_id) department
FROM employees e
ORDER BY department;

--=== 11 ===
WITH
summary AS (
    SELECT d.department_name, SUM(e.salary) AS dept_total
    FROM employees e, departments d
    WHERE e.department_id = d.department_id
    GROUP BY d.department_name)
SELECT department_name, dept_total
FROM summary
WHERE dept_total > ( SELECT SUM(dept_total) * 1/8
                     FROM summary )
ORDER BY dept_total DESC;