=======1========

SELECT last_name || ' earns '
    || TO_CHAR(salary, 'fm$99,999.00')
    || ' monthly but wants '
    || TO_CHAR(salary * 3, 'fm$99,999.00')
    || '.' "DREAM SALARIES"
FROM employees

=======2========

SELECT last_name, hire_date, 
    TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'PONIEDZIAŁEK'),
    'fmDay, "the" Ddspth "of" Month, YYYY') REVIEW
FROM employees

=======3========

SELECT last_name, hire_date, 
    TO_CHAR(hire_date, 'DAY') DAY
FROM employees
ORDER BY TO_CHAR(hire_date - 1, 'day')

=======4========

SELECT last_name,
    NVL(TO_CHAR(commission_pct), 'No Commission') COMM
FROM employees

======5=========

SELECT job_id, decode (job_id,
                       'AD_PRESS', 'A',
                       'ST_MAN', 'B',
                       'IT_PROG', 'C',
                       'SA_REP', 'D',
                       'ST_CLERK', 'E',
                       '0') GRADE                
FROM employees

======6=========

SELECT job_id, CASE job_id
                WHEN 'AD_PRESS' THEN 'A'
                WHEN 'ST_MAN' THEN 'B'
                WHEN 'IT_PROG' THEN 'C'
                WHEN 'SA_REP' THEN 'E'
                WHEN 'ST_CLERK' THEN 'E'
                ELSE '0' END GRADE                
FROM employees



