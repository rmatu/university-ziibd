CREATE OR REPLACE PROCEDURE procedura_1 (p_employee_id IN employees.employee_id%TYPE, p_pointer IN NUMBER, p_salary OUT NUMBER) AS v_updated_salary INTEGER;
BEGIN

SELECT salary INTO p_salary FROM employees WHERE employee_id = p_employee_id;
p_salary := p_salary * p_pointer;   
EXCEPTION WHEN OTHERS THEN ROLLBACK;
END procedura_1;
/
set serveroutput on;

DECLARE
p_salary NUMBER;
BEGIN

procedura_1(101,2,p_salary);
DBMS_OUTPUT.PUT_LINE(p_salary);
END;