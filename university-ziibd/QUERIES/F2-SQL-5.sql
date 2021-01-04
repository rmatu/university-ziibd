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
