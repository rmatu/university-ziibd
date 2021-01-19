DROP TABLE salary_changes;
CREATE TABLE salary_changes(
    ID NUMBER,
    employee_id NUMBER CONSTRAINT salary_changes_fk REFERENCES employees(employee_id),
    DOP DATE,
    old_salary NUMBER,
    new_salary NUMBER);
    
DROP SEQUENCE id_counter;
CREATE SEQUENCE id_counter INCREMENT BY 1;
    
CREATE OR REPLACE TRIGGER salary_log_changes BEFORE UPDATE ON employees
FOR EACH ROW WHEN ( NEW.salary != OLD.salary )
BEGIN
    INSERT INTO salary_changes (ID, employee_id, DOP, old_salary, new_salary) 
    VALUES (id_counter.NEXTVAL, :OLD.employee_id, SYSDATE, :OLD.salary, :NEW.salary);
END;
/

UPDATE employees SET salary = 17000 WHERE employee_id = 107;
SELECT * FROM salary_changes;