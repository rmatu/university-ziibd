-- Admin bazy -> ziibd15

-- Nadanie uprawnieñ jakiemuœ u¿ytkownikowi do tabeli
GRANT SELECT, UPDATE ON employees TO ziibd1;

-- Pobranie danych od innego u¿ytkownika
SELECT * FROM ziibd15.employees;

-- Na tym etapie wlasciciel tych tabeli (ziibd15) nie widzi zmian
UPDATE ziibd15.employees
SET last_name = 'ZZZZZZZ'
WHERE employee_id = 100;

-- Teraz wlasciciel widzi zmiany 
COMMIT;

-- Usuniêcie uprawnieñ
REVOKE SELECT, UPDATE on employees FROM ziibd2;



