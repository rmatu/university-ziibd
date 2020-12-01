-- 1. Napisz polecenie, które zwraca listę wszystkich pracowników zatrudnionych w pierwszej połowie dowolnego miesiąca.

SELECT last_name, hire_date 
FROM employees
WHERE TO_CHAR(hire_date, 'DD') < 15;


-- 2. Napisz polecenie zwracające raport: liczbę pracowników, których nazwisko kończy się na literę "n".

SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%n';


-- 3. Napisz polecenie zwracające najwyższe średnie wynagrodzenie pracownika dla dowolnego departamentu.

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

    
-- 4. Przygotuj raport- miasto (city), nazwa departamentu, minimalne wynagrodzenie pracownika dla tego departamentu.

SELECT l.city, d.department_name, MIN(e.salary)
FROM locations l JOIN departments d
ON l.location_id = d.location_id
JOIN employees e
ON d.department_id = e.department_id
GROUP BY l.city, d.department_name;


-- 5. Napisz polecenie wyświetlające nazwisko pracownika z tabeli "pracownicy". Jeśli rok zatrudnienia jest równy 1995, to wyświetl informacje "Dodatek", w przeciwnym wypadku komunikat "Brak". Nadaj nazwę tej kolumnie "Uprawnienia". Uporządkuj wyprowadzone rekordy wg nazwiska.

SELECT last_name, CASE TO_CHAR(hire_date, 'YYYY')
                    WHEN '1995' THEN 'Dodatek'
                    ELSE 'Brak' END "Uprawnienia"
FROM employees
ORDER BY last_name;


SELECT last_name, DECODE(TO_CHAR(hire_date, 'YYYY'), '1995', 'Dodatek', 'Brak') "Uprawnienia"
FROM employees
ORDER BY last_name;


-- 6. Znajdź imię i nazwisko pracowników, których wynagrodzenie jest równe maksymalnemu wynagrodzeniu dla dowolnego departamentu.

SELECT first_name, last_name
FROM employees
WHERE salary IN (SELECT MAX(salary)
                 FROM employees
                 GROUP BY department_id);
-- 7. Napisz polecenie zwracające dla wszystkich pracowników następujące informacje: <Imię> <Nazwisko> <okres zatrudnienia w miesiącach>.

SELECT first_name, last_name, TRUNC(MONTHS_BETWEEN(sysdate, hire_date))
FROM employees;


-- 8. Wylicz średnie wynagrodzenie dla pracowników zatrudnionych w departamentach 'Administration' i 'Shipping' (średnia dla każdego z departamentów).

SELECT d.department_name, AVG(e.salary)
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name IN ('Administration', 'Shipping')
GROUP BY d.department_name;


-- 9. Znajdź wszystkich pracowników zatrudnionych po 10tym i przed 20tym dniem miesiąca.

SELECT last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'DD') BETWEEN 11 AND 19;


-- 10. Przygotuj raport: <imię pracownika> <nazwisko pracownika>, ale tylko tych, których menadżerowie zarabiają mniej niż 14000.

SELECT e.first_name, e.last_name
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.salary < 14000;


-- 11. Napisz polecenie zwracające pracowników, których nazwisko zaczyna się na literę K, L, M, N, W.

SELECT last_name
FROM employees
WHERE SUBSTR(last_name, 1, 1) IN ('K', 'L', 'M', 'N', 'W');


-- 12. Przygotuj raport- miasto (city), nazwa_departamentu, maksymalne wynagrodzenie pracownika dla tego departamentu.

SELECT l.city, d.department_name, MAX(e.salary)
FROM locations l JOIN departments d
ON l.location_id = d.location_id
JOIN employees e
ON d.department_id = e.department_id
GROUP BY l.city, d.department_name;