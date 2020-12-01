-- 1 
-- Napisz polecenie, które wypisze dzień tygodnia i liczbę osób zatrudnionych
-- w tym dniu

SELECT to_char(hire_date,'Day'), COUNT(to_char(hire_date,'Day')) FROM employees
GROUP BY to_char(hire_date,'Day');

-- 3
-- Napisz polecenie zwracajace imię, nazwisko pracownika oraz sowo TAK lub NIE
-- w zależności od faktu czy pracownik otrzymuje prowizję (commision_pct) czy nie
-- i uporzadkuj ich wedug nazwiska od A-Z

SELECT last_name, salary, nvl2(commission_pct, 'TAK', 'NIE')
FROM employees
ORDER BY last_name ASC;

-- 4
-- Wylicz średnie wynagrodzenie dla pracowników zatrudnionych w departamentach
-- 'Marketing' i 'IT' (średnia dla każdego z tych departamentow)

SELECT D.department_name, AVG(E.salary)
FROM DEPARTMENTS D JOIN EMPLOYEES E
ON (D.department_id = E.department_id)
WHERE D.department_name IN ('Marketing','IT')
GROUP BY D.department_name;

-- 5
-- Napisz polecenie wyświetlajace nazwisko, nazwę departamentu, wynagrodzenie
-- wszystkich pracowników, których wynagrodzenie jest takie same jak dowolnego 
-- pracownika z departamentu Shipping.

SELECT E.last_name, D.department_name, E.salary 
FROM DEPARTMENTS D JOIN EMPLOYEES E
ON (D.department_id = E.department_id)
WHERE E.salary IN  (SELECT E.salary
                    FROM DEPARTMENTS D JOIN EMPLOYEES E
                    ON (D.department_id = E.department_id)
                    WHERE D.department_name = 'Shipping');
                    
-- 6
-- Napisz polecenie, które wyświetli identyfikator departamentu, nazwę
-- departamentu, liczbę pracowników departamentu, ale tych które zatrudniaj
-- wiecej niż 3 pracowników.

SELECT D.department_id, D.department_name, COUNT(E.employee_id)
FROM DEPARTMENTS D JOIN EMPLOYEES E
ON (D.department_id = E.department_id)
GROUP BY D.department_id, D.department_name
HAVING COUNT(E.employee_id) > 3;

-- 7
-- Znajdź wszystkich pracowników (identyfikator, imię, nazwisko), których staż
-- pracy jest duższy niż 24 miesiace.
SELECT employee_id, first_name, last_name
FROM EMPLOYEES
WHERE TO_CHAR(MONTHS_BETWEEN(SYSDATE, hire_date))>24;