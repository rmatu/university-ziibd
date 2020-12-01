-- 1
-- Napisz polecenie zwracające pracowników, których nazwisko zaczyna się na literę 
-- K,L,M,N,W
SELECT last_name
FROM employees
WHERE SUBSTR(last_name, 1, 1) IN ('K', 'L', 'M', 'N', 'W');

-- 2
-- Napisz polecenie wyświetlające nazwisko imie i wynagrodzenie wszystkich pracowników,
-- których wynagrodzenie jest takie same jak dowolnego pracownika w lokalizacji "London"

select last_name, first_name, salary
from employees
where salary in (select e.salary
                 from employees e join departments d
                 on e.department_id = d.department_id
                 join locations l
                 on d.location_id = l.location_id
                 where l.city = 'Oxford');

-- 3
-- Znajdz wszystkich pracownikow zatrudnionych po 10tym i przed 20tym dniem
-- miesiaca
                 
SELECT last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'DD') BETWEEN 11 AND 19;


-- 4
-- Przygotuj raport - miasto (city), nazwa_departamentu, maksymalne
-- wynagrodzenie pracowników dla tego departamentu

SELECT l.city, d.department_name, MAX(e.salary)
FROM locations l JOIN departments d
ON l.location_id = d.location_id
JOIN employees e
ON d.department_id = e.department_id
GROUP BY l.city, d.department_name;

-- 5 
-- Przygotuj raport imie_pracownika i nazwisko_pracownika, ale tylko tych,
-- których menadżerowie zarabiaja mniej niż 14000

SELECT e.first_name, e.last_name
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.salary < 14000;

-- 6
-- Napisz polecenie, które wyświetli identyfikator departmentu, nazwę
-- departamentu, liczbę pracowników departamentu, ale tych które zatrudniaja
-- mniej niż 4 pracowników

SELECT d.department_id, d.department_name, COUNT(e.department_id)
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.department_id) < 4
