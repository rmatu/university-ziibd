SET SERVEROUTPUT ON
DECLARE
CURSOR v_cursor IS 
SELECT employee_id, last_name, first_name, job_id, salary FROM employees;
BEGIN
    FOR v_employee_id IN v_cursor LOOP
        IF v_employee_id.salary > 6000 THEN
            DBMS_OUTPUT.PUT_LINE(v_employee_id.last_name || ' brak podwyżki');
        ELSIF v_employee_id.salary <= 6000 THEN
            DBMS_OUTPUT.PUT_LINE(v_employee_id.last_name || v_employee_id.first_name ||' Sugerowana podwyżka: ' ||v_employee_id.salary*1.2);
        END IF;
    END LOOP;
END;