--=====1=====
CREATE TABLE dept
(id NUMBER(7) CONSTRAINT department_id_pk PRIMARY KEY,
name VARCHAR(25));

DESCRIBE dept

--=====2=====
INSERT INTO dept
SELECT department_id, department_name
FROM departments;

--=====3=====
CREATE TABLE emp
    (id NUMBER(7),
    last_name VARCHAR(25),
    first_name VARCHAR(25),
    dept_id NUMBER(7)
     CONSTRAINT emp_dept_id_FK REFERENCES dept (id)
    );
    
DESCRIBE emp

--===4====
CREATE TABLE employees2 AS
    SELECT employee_id id, first_name, last_name, salary,
    department_id dept_id
FROM employees;

--===5====

ALTER TABLE employees2 READ ONLY;

--===6====
INSERT INTO employees2
VALUES (34, 'Grant', 'Marcie', 5687, 10);

--===7====
ALTER TABLE employees2 READ WRITE;

INSERT INTO employees2
VALUES (34, 'Grant', 'Marcie', 5678, 10);

--===8====
DROP TABLE employees2;
