/*=====================================================
SQL(structured query language)함수
1. 단일행함수 : 행 하나당 하나의 결과를 출력한다
              (문자함수, 숫자함수, 날짜함수, 변환함수, 일반함수)
2. 복수행함수 : 행 여러개당 하나의 결과를 출력한다
               (합계, 평균, 최대, 최소, 갯수)  
====================================================== 
--SELECT문에서는 반드시 테이블명을 명시해야 한다.
--그래서 SELECT절에 식이나 특정함수를 이용해서 결과값을 가져올때
-- 사용할 수 있는 DUAL이라는 테이블을 제공하고 있다. */

SELECT 3+1
FROM dual;

SELECT sysdate
FROM dual;

SELECT max(10)
FROM dual;

--substr 문자열의 일부분을 잘라서 가져오는 함수
SELECT substr('korea',2,3) 
FROM dual;

/*---------------------
문자함수
----------------------*/
-- 단어의 첫글자만 대문자로 변경해주는 함수
SELECT initcap('korea') 
FROM dual;

-- 모든 문잘를 대문자로 변경해주는 함수
SELECT upper('korea') 
FROM dual;

SELECT first_name, upper(first_name),
       last_name, UPPER(last_name)
FROM employees;

-- 모든 문잘를 소문자로 변경해주는 함수
SELECT lower('KOREA')
FROM dual;
SELECT first_name, lower(first_name), last_name, lower(last_name)
FROM employees;

-- employees테이블 first_name에서 대문자 구분없이
--'Ja'가 포함된 first_name, salary를 출력해라
SELECT first_name, salary
FROM employees
WHERE UPPER(first_name)LIKE UPPER('%Ja%');

-- 문자의 길이를 린턴해주는 함수
SELECT length('korea')
FROM dual; --5

SELECT length('한국')
FROM dual; --2

-- 문자의 길이를 바이트로 구해서 린턴해주느 함수
SELECT lengthb('korea')
FROM dual; --5

SELECT lengthb('한국')
FROM dual; --6 (한글의 경우 글자 1개당, 3바이트*2)

CREATE TABLE user1(
data varchar2(5) --이 컬럼은 최대 5글자의 문자열을 저장할 수 있다는 뜻 (가변 길이 문자형)
); --Table USER1이(가) 생성되었습니다.

SELECT*FROM user1;

INSERT INTO user1(data)
VALUES('south korea'); 
--오류 보고 -
--ORA-12899: value too large for column "HR"."USER1"."DATA" (actual: 11, maximum: 5)
-- 즉 글자가 5자 초과해서 오류발생
