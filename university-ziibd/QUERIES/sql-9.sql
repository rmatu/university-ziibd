--====2====

DESCRIBE my_employee

--====3====

INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895)

--====4====

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860)

--====5====

SELECT *
FROM my_employee

--====6====

INSERT INTO my_employee
VALUES (&p_id, '&p_last_name', '&p_first_name', '&p_userid', &p_salary)

--===9======

COMMIT

--====10====

UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

--====11====

UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

--====12====

SELECT *
FROm my_employee

--====13====

DELETE
FROM my_employee
WHERE last_name = 'Dancs';

--====14====

SELECT * FROM my_employee

--====15====

COMMIT

--====16====

INSERT INTO my_employee
VALUES (&p_id, '&p_last_name', '&p_first_name', '&p_userid', &p_salary)

--====17====


SELECT * FROM my_employee

--====18====

SAVEPOINT zapis;


--====19====

DELETE
FROM my_employee;

--====20====

SELECT * FROM my_employee

--====21====

ROLLBACK TO zapis;

--====21===

SELECT * FROM my_employee

--====22====

COMMIT

--===23====

SET ECHO OFF
SET VERIFY OFF
INSERT INTO my_employee
VALUES(&p_id, '&&p_last_name', '&&p_first_name',
            lower(substr('&p_first_name', 1, 1) ||
            substr('&p_last_name', 1, 7)), &p_salary);
SET VERIF ON
SET ECHO ON
UNDEFINE p_first_name
UNDEFINE p_last_name;
    