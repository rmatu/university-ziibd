CREATE OR REPLACE FUNCTION avg_salary (p_department_id IN INTEGER) RETURN NUMBER AS dep_avg NUMBER;
BEGIN
SELECT AVG(salary) INTO dep_avg FROM employees WHERE department_id = p_department_id;
RETURN dep_avg;
END;
/
SELECT avg_salary(110) FROM dual;