--=== ADDITIONAL PRACTICES 2 ===
--=== 1 ===
SELECT table_name, column_name, data_type, nullable
FROM user_tab_columns
WHERE table_name
IN ('MEMBER', 'TITLE', 'TITLE_COPY', 'RENTAL', 'RESERVATION');

--=== 2 ===
SELECT sequence_name FROM user_sequences;

--=== 3 ===
CREATE USER oraxx_carmen IDENTIFIED BY oracle;
GRANT select ON rental TO oraxx_carmen;

--=== 4 ===
ALTER TABLE title ADD(price NUMBER(6));

--=== 5 ===
CREATE TABLE CATEGORY
    ("CATEGORY_ID" NUMBER(6, 0) NOT NULL ENABLE,
     "CATEGORY_DESCRIPTION" VARCHAR2(4000 BYTE),
      CONSTRAINT "CATEGORY_PK" PRIMARY KEY ("CATEGORY_ID"));
      
--=== 6 ===
SELECT table_name FROM user_tables ORDER BY table_name;

--=== 7 ===
DROP TABLE reservation CASCADE CONSTRAINTS;

--=== 8 ===
CREATE TABLE rental_history AS SELECT * FROM rental WHERE '1' = '1';

--=== 9 ===
SELECT t.CATEGORY, t.TITLE
FROM TITLE t, RENTAL r
WHERE t.TITLe_ID = r.TITLE_ID AND
    r.BOOK_DATE > (SYSDATE - 30) AND
    ROWNUM < 10
ORDER BY CATEGORY;

--=== 10 ===
SELECT t.title, m.member_id, t.price, (t.price*6) latefee
FROM title t, member m, rental r
WHERE t.title_id = r.title_id
AND m.member_id = r.member_id
AND r.act_ret_date is null;

--=== 11 ===
SELECT member_id, last_name, first_name FROM member m
WHERE 2 <= (SELECT COUNT (*) FROM rental_history WHERE member_id =
m.member_id);

--=== 12 ===
SELECT t.title
FROM title t
JOIN (SELECT title_id, status FROM title_copy) b
ON t.title_id = b.title_id
AND b.status = 'RENTED';

--=== 13 ===
SELECT REGEXP_COUNT(phone, '99', 1, 'i') position, member_id, last_name, first_name
FROM member
WHERE REGEXP_COUNT(phone, '99', 1, 'i') > 0;

