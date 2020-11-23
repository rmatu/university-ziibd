#TRUE, FALSE, TRUE,

--====4====

SELECT ROUND(MAX(salary),0) MAXIMUM,
    ROUND(MIN(salary), 0) MINIMUM,
    ROUND(SUM(salary), 0) SUM,
    ROUND(AVG(salary), 0) AVERAGE
FROM employees

--====5=====

SELECT job_id, ROUND(MAX(salary),0) MAXIMUM,
    ROUND(MIN(salary), 0) MINIMUM,
    ROUND(SUM(salary), 0) SUM,
    ROUND(AVG(salary), 0) AVERAGE
FROM employees
GROUP BY job_id;

--====6====

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id

--====6.1====

SELECT job_id, COUNT(*)
FROM employees
WHERE job_id = '&job_title'
GROUP BY job_id

--====7====

SELECT COUNT(DISTINCT manager_id) "Number of Managers"
FROM employees


--====8====

SELECT MAX(salary) - MIN(salary) DIFFERENCE
FROM employees

--====9=====

SELECT  manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC

--====10=====

SELECT COUNT(*) total,
	SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1995,1,0)) "1995",
    SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1996,1,0)) "1996",
    SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1997,1,0)) "1997",
    SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1998,1,0)) "1998"
FROM employees


--====11=====

SELECT job_id,
    SUM(DECODE(department_id, 20, salary)) "Dept 20",
    SUM(DECODE(department_id, 50, salary)) "Dept 50",
    SUM(DECODE(department_id, 80, salary)) "Dept 80",
    SUM(DECODE(department_id, 90, salary)) "Dept 90",
    SUM(salary) "Ttotal"
FROM employees
GROUP BY job_id
