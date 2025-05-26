select * from employees;

SELECT *  FROM tab;

SELECT salary, salary*10  AS bonus FROM employees;

SELECT salary, salary*10  AS 보너스 FROM employees;

DESC employees;

SELECT salary, salary*10  AS "b o n u s" FROM employees;

SELECT last_name || '님의 급여는' || salary ||  '입니다.'  AS name FROM employees;
/*
SELECT 컬럼명, 컬럼명, 컬럼명
FROM 테이블명
*/

-- DISTINCT 은 중복제거를 한 후 출력해 주는 명령어 이다.
SELECT DISTINCT first_name FROM employees;
SELECT DISTINCT first_name, last_name FROM employees;
/*
first_name last_name
sundar     Abel
sundar     Abel
sundar     Ande
*/


--입력순서
/*
SELECT column_name1, column_name2
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC(DESC);
*/

-- SELECT 해석순서 
/*
FROM table_name (테이블명)
WHERE column_name='value' (조건)
GROUP By column_name
HAVING column_name='value'
SELECT column_name1, column_name2
ORDER BY column_name ASC(DESC);
*/

-- employees 테이블에서 salary이 3000미만일때의
-- first_name, salary을 출력하라.
SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- employees테이블에서 first_name컬럼의 값이 'David' 일때의
-- first_name, salary을 출력하라.
SELECT first_name, salary
FROM employees
WHERE first_name='David';

--employees테이블에서 first_name컬럼의 값이 'David' 아닐때의
--first_name, salary을 출력하라. (!=), (<>) 
SELECT first_name, salary
FROM employees
WHERE first_name  !=  'David';

SELECT first_name, salary
FROM employees
WHERE first_name  <>  'David';


--&&(and), ||(or)
--employees테이블에서 salary이 3000, 9000, 17000일때
--first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE  salary=3000 OR salary=9000 OR salary=17000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000, 9000, 1700);









