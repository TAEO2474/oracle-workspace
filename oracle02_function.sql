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

SELECT lengthb('수박')
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

--특정범위의 문자를 추출해 주는 함수이다
-- 오라클은 인덱스[1]부터 시작~
--substr('문자', 시작위치, 객수)
SELECT substr('oracle test',2,4)
FROM dual; 

--뒤 인덱스부터는 마이너스(-)를 사용한다
SELECT substr('oracle test',-3,4)
FROM dual; 

SELECT substr('오라클 테스트',3,4)
FROM dual;   

SELECT substr('오라클 테스트',-3,4)
FROM dual;   

--특정문자의 인덱스를 추출하는 함수이다
SELECT instr('korea','or')
FROM dual;  --or 문자는 [2]인데스부터 시작합니다

SELECT instr('한국자바','자바')
FROM dual; 

--주어진 문자열에서 왼쪽으로 특정문자를 채우는 함수이다.
SELECT lpad('korea',8,'*') /*lpad('문자', 총길이,'여백을 채원줄 문자')*/
FROM dual; --***korea

-- 주어진 문자열에서 왼쪽의 특정문자를 삭제하는 함수이다.
SELECT ltrim('***korea**','*') 
FROM dual; --korea**

-- 주어진 문자열에서 오른쪽의 특정문자를 삭제하는 함수이다.
SELECT rtrim('***korea**','*') 
FROM dual; --***korea

-- 주어진 문자열에서 양쪽의 특정문자를 삭제하는 함수이다.
SELECT trim('*'from '***korea**') 
FROM dual; --korea

-- 주어진 문자열에서 왼쪽 공백제거
SELECT '    korea'
       ,length('   korea')
       ,ltrim('   korea')
       ,length(ltrim('   korea'))
FROM dual;

--주어진 문자열에서 오른쪽의 공백제거
SELECT 'korea   '
       , length('korea   ')
       , rtrim('korea   ')
       , length(rtrim('korea   ')) -- 공백 제거 후 길이
FROM dual;

--주어진 문자열에서 양쪽의 공백제거
SELECT  trim(' ' from '  korea   ' )
        , length(trim(' ' from '  korea   ' )) -- 공백 제거 후 길이
FROM dual;


-- 주어진 문자의 아스키 코드값을 구하는 함수
SELECT  ascii('A'),  ascii('a')  
FROM dual;

-- 주어진 문자의 아스키 문자값을 구하는 함수
SELECT  chr('65'), chr('97'),chr('48') 
FROM dual;

--주어진 문자를 연결하는 함수
SELECT  concat ('Hi',' TaeO')
FROM dual;

/*----------------------------
 숫자함수
-------------------------------*/
--3.55을 소수점 1의 자리까지 구하시오(반올림)
SELECT round(3.55, 1)
FROM dual;

SELECT round(42523.55, -1) -- (-3, -2, -1, 0, 소수점.,1,2,3)
FROM dual; --42520 , 현재 -1자리까지 구하기떄문에 3은 0으로 변경하고 출력

SELECT round(42523.55, 0)
FROM dual;--42524

--256.78을 무조건 올림한다.(올림)
SELECT ceil(256.78)
FROM dual; --257

--289.78에서 소수이하는 무조건 버린다.(버림)
SELECT floor(289.78)
FROM dual;--289

--2의 3승 (거듭제곱)
SELECT power(2,3)
FROM dual; --8

--25의 제곱근
SELECT sqrt(25)
FROM dual;--5

--나머지
SELECT mod(10,3)
FROM dual;--1


/*-------------------------------
 날짜함수
-------------------------------*/
--현재 시스템에서 제공해주는 오늘의 날짜 구하는 함수
SELECT sysdate
FROM dual;


SELECT sysdate + 1
FROM dual;

-- 첫번째 인자의 달에 두번째 인자값을 더한 날짜를 반환
SELECT add_months(sysdate, 10)
FROM dual;

/*==============================================
 변환형 함수
   숫자                문자            날짜
 to_number()  <-> to_char( ) <-> to_date( )
==============================================*/
--1 숫자->문자
--첫번째 인자값을 두번째 인자값의 형식으로 변환해주는 함수
SELECT to_char(2532, '999,999.99')
FROM dual; --   2,532.00

SELECT to_char(2532, '000,000.00')
FROM dual; -- 002,532.00

--각 나라의 통화를 표현해 줄 때 L기호를 사용한다.
SELECT to_char(2532,'L999,999.99')
FROM dual; -- ￦2,532.00

--2. 날짜 -> 문자
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day')  /* 12시간  */ 
FROM dual; -- 2025-05-27 10:46:34 화요일

SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy')
FROM dual; -- 2025-05-27 10:46:50 화

SELECT to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss day')  /* 24?ð?  */ 
FROM dual;


/*===============================
to_number( )
문자->숫자
==================================*/
SELECT '253' || '12' -- 253 그리고 12를 붙인다
FROM dual;  --25312

SELECT concat('253','12')
FROM dual;  --25312

SELECT '253' + '12'
FROM dual;   --265

SELECT to_number('253') + to_number('12')
FROM dual;   --265


/*===============================
to_date()
 문자->날짜
=================================*/
SELECT to_date('2013-10-14')
FROM dual;

-- --------------------------------------
SELECT first_name,hire_date
FROM employees;

-- hire_date(입사일)을 이용해서 
--'홍길동님은 2003년 1월 3일에 입사했습니다'로
--출력하는 query를 작성하시오.

--(예시: Steven님은2003년6월17일에 입사했습니다.)
SELECT first_name||'님은'||to_char(hire_date,'yyyy')||'년'
       ||ltrim(to_char(hire_date,'mm'),'0')||'월'
       ||ltrim(to_char(hire_date,'dd'),'0')||'일에 입사했습니다.' AS "결과" -- AS "결과" COL 컬럼(열)의 이름  
FROM employees;

/*====================================================================
일반함수 (자주사용)
nvl(컬럼, 대체값) : 첫번째 인자값이 null이면 대체값으로 대체해서 출력한다.
nvl2(컬럼, 대체1, 대체2) : 컬럼의 값이 null아니면 대체1로, null이면 대체2로 출력한다. 
nullif(표현식1, 표현식2 ) : 표현식1과 표현식2가 같으면 NULL, 다르면 표현식1로 출력한다.

--대체할
 값이 숫자이면 두번째 인자값에 숫자를 지정한다.
--대체할 값이 문자이면 두번째 인자값에 문자를 지정한다.
--대체할 값이 날짜이면 두번째 인자값에 날짜를 지정한다. 
=======================================================================*/
--nvl(컬럼, 대체값) : 첫번째 인자값이 null이면 대체값으로 대체해서 출력한다.
SELECT commission_pct, nvl(commission_pct,0)
FROM employees;

SELECT first_name, manager_id, nvl(to_char(manager_id),'CEO')
FROM employees; --Steven (null)	CEO

--nvl2(컬럼, 대체1, 대체2) : 컬럼의 값이 null아니면 대체1로, null이면 대체2로 출력한다. 
SELECT commission_pct, nvl2(commission_pct,1,0)
FROM employees;


--nullif(표현식1, 표현식2 ) : 표현식1과 표현식2가 같으면 NULL, 다르면 표현식1로 출력한다.
SELECT commission_pct, nullif(commission_pct,0.4)
FROM employees
WHERE commission_pct IN(0.4,0.3);


/*======================================================
decode(컬럼,값1, 처리1, 값2, 처리2,  그밖의 처리)
java의 switch_case문과 비슷 
======================================================*/
-- <문제1>
--department_id이 10이면 'ACCOUNTING', 20이면 'RESEARCH', 
--30이면 'SALES', 40이면 'OPERATIONS', 'OTHERS'

SELECT first_name, department_id,
        decode(department_id,10,'ACCOUNTING',
                             20,'RESERCH',
                             30,'SALES',
                             40,'OPERATION','OTHERS') AS"부서명"
FROM employees
ORDER BY department_id ASC;
/*ORDER BY는 결과를 특정 열 기준으로 정렬하겠다는 뜻입니다.
department_id 열을 기준으로 정렬하고 있습니다.
ASC는 오름차순(ascending) 정렬을 의미합니다.*/

--<문제2>
--직급이 'PR_REP' 인 사원은 5%, 'SA_MAN'인 사원은 10%, 
--'AC_MGR'인 사원은 15%, 'PU_CLERK' 인 사원은 20% 를 인상 
SELECT job_id, salary,   
       decode(job_id,'PR_REP', salary*1.05,
                     'SA_MAN', salary*1.1,
                     'AC_MGR', salary*1.15,
                     'PU_CLERK', salary*1.2,salary)AS "increased_salary"
FROM employees; 


/*================================
case when 조건1 then 결과1
     when 조건2 then 결과2
     when 조건3 then 결과3
     else 결과n
end AS alias;
자바에서 if-else와 비슷한 의미
==================================*/
--<문제1>
--입사일에서 월이 1-3이면 '1사분기', 4-6이면 '2사분기', 
--             7-9이면 '3사분기', 10-12이면 '4사분기'로 처리를 하고 
--사원명(first_name), 입사일(hire_date), 분기로 출력하시오.
SELECT first_name,hire_date,
       case when to_char(hire_date,'mm') <= 3 then '1사분기'
            when to_char(hire_date,'mm') <= 6 then '2사분기'
            when to_char(hire_date,'mm') <= 9 then '3사분기'
            when to_char(hire_date,'mm') <= 12 then '4사분기'
        end  AS "분기"
FROM employees; 



/*=================================================
집계함수(Aggregate Function), 그룹함수(Group Function)
===================================================*/
--max(컬럼); 최대값
SELECT max(salary)
FROM employees;

--min(컬럼) : 최소값
SELECT min(salary)
FROM employees;

--count(컬럼) : 개수
SELECT count(salary)
FROM employees;

-- 전체 레코드수 린턴
SELECT count(*)
FROM employees; 

--COUNT(column_name) 함수 : 해당 컬럼이 NULL이 아닌 값만 셉니다
SELECT count(commission_pct)
FROM employees;  -- 이 쿼리는 commission_pct 컬럼이 NULL이 아닌 행의 개수를 반환
/* 반대로, COUNT(*)는 전체 행 수를 셉니다 (NULL 여부 상관없음).*/


--sum(컬럼) : 합계
SELECT sum(salary)
FROM employees;

--avg(컬럼) : 평균
SELECT avg(salary)
FROM employees;

--집계함수와 단순컬럼은 함께 사용 할 수 없다.(출력되는 레코드수가 다르기 때문이다)
 /*"레코드 수":  데이터베이스 테이블에서 하나의 행(row), 즉 하나의 데이터 단위*/
--ORA-00937: not a single-group group function
--ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
SELECT first_name, count(*)
FROM employees; --오류


--그룹함수와 단순컬럼을 사용하기 위해서는 단순컬럼을 그룹화 해야 한다.(GROUP BY)
SELECT department_id, count(*)
FROM employees 
GROUP BY department_id
ORDER BY department_id; -- 기본적으로 오름차순으로 한다? 어센팅표시가 없어도


-- <문제1>50이하인 부서에 대해서 null이 아닌 부서별의 직원수를 출력하세요
SELECT department_id, count(*)
FROM employees
WHERE department_id <= 50 AND department_id IS NOT NULL
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, count(*)  AS"직원수"
FROM employees
GROUP BY department_id --아래 HAVING에 대한 그룹이다
HAVING department_id <= 50 AND department_id IS NOT NULL
ORDER BY department_id;

-- <문제2> 50이하인 부서에 대해서 null이 아닌 부서별의 직원수가 5인하인 경우를 출력하세요
SELECT department_id, count(*)   AS"직원수"
FROM employees
GROUP BY department_id -- 같은 department_id를 가진 행들을 하나의 그룹으로 묶는다
HAVING department_id <= 50 AND department_id IS NOT NULL AND count(*) <=5
ORDER BY department_id;


--<문제3> 업무별(job_id) 급여합계를 출력하시오.
SELECT job_id, sum(salary)
FROM employees
GROUP BY job_id;

--<문제4> 부서별 최소급여, 최대급여를 최소값과 최대값이 같지 않은 경우에만 부서별로 오름차순으로 출력 
SELECT department_id,  min(salary),  max(salary), max(salary)-min(salary)
FROM employees
GROUP BY department_id 
HAVING min(salary) != max(salary)
ORDER BY  department_id;

/*------------------------------
 10 문제
------------------------------*/
--1) 모든사원에게는 상관(Manager)이 있다. 하지만 employees테이블에 유일하게 상관이
--    없는 로우가 있는데 그 사원(CEO)의 manager_id컬럼값이 NULL이다. 
--    상관이 없는 사원을  출력하되 manager_id컬럼값 NULL 대신 CEO로 출력하시오.
-- 참고 -> nvl(컬럼, 대체값) : 첫번째 인자값이 null이면 대체값으로 대체해서 출력한다.
    SELECT  manager_id, NVL(TO_CHAR(manager_id), 'CEO') 
    FROM employees
    WHERE manager_id is null; -- 상관이 없는 사원을  출력하되 manager_id컬럼값 NULL 대신 CEO로 출력하시오.

--2) 가장최근에 입사한 사원의 입사일과 가장오래된 사원의 입사일을 구하시오. 
      SELECT   MIN(hire_date), MAX(hire_date)
      FROM employees;
       
 
--3) 부서별로 커미션을 받는 사원의 수를 구하시오.
    SELECT department_id, count(commission_pct)
    FROM employees
    GROUP BY department_id;
  

    SELECT department_id, count(*)
    FROM employees
    WHERE commission_pct IS NOT NULL -- 커미션이 0이 아닌 직원
    GROUP BY department_id
    ORDER BY department_id;

   
--4) 부서별 최대급여가 10000이상인 부서만 출력하시오.   
    SELECT department_id, max(salary)
    FROM employees
    GROUP BY department_id
    HAVING max (salary) >=10000
    ORDER BY max(salary);


--5) employees 테이블에서 직종이 'IT_PROG'인 사원들의 급여평균을 구하는 SELECT문장을 기술하시오.
    -- 순서지키기
    SELECT  job_id, AVG(salary)
    FROM employees
    GROUP BY job_id
    HAVING job_id = 'IT_PROG';
    
    -- <순서 지키기>
    SELECT  job_id, AVG(salary)
    FROM employees
    WHERE job_id = 'IT_PROG'
    GROUP BY job_id;

--6) employees 테이블에서 직종이 'FI_ACCOUNT' 또는 'AC_ACCOUNT' 인 사원들 중 최대급여를  구하는    SELECT문장을 기술하시오.   
   
   -- 두부서의 최대급여 출력
    SELECT  job_id, maX(salary)
    FROM employees
    GROUP BY job_id
    HAVING job_id IN ('FI_ACCOUNT', 'AC_ACCOUNT');
    
 
    -- 두부서 중에 누가 최대 급여 를 받는가?
    SELECT  max(salary)
    FROM employees
    --   WHERE job_id ='FI_ACCOUNT' OR job_id = 'AC_ACCOUNT';
    WHERE job_id IN('FI_ACCOUNT' , 'AC_ACCOUNT');  
    


--7) employees 테이블에서 50부서의 최소급여를 출력하는 SELECT문장을 기술하시오.
      
    SELECT  min (salary) 
    FROM employees;
    WHERE department_id =50;
    
    --
    SELECT  department_id, min(salary) 
    FROM employees
    GROUP BY  department_id
    HAVING department_id =50;
    
    
--8) employees 테이블에서 아래의 결과처럼 입사인원을 출력하는 SELECT문장을 기술하시오.
--   <출력:  2001		   2002		       2003
 --  	     1          7                6   >
                                     
    SELECT sum( decode(to_char(hire_date,'yyyy'), '2001',1,0))  AS "2001",
                  sum( decode(to_char(hire_date,'yyyy'), '2002',1,0))  AS "2002",
                 sum( decode(to_char(hire_date,'yyyy'), '2003',1,0))  AS "2003"
     FROM employees;
    
--9) employees 테이블에서 각 부서별 인원이 10명 이상인 부서의 부서코드,
--  인원수,급여의 합을 구하는  SELECT문장을 기술하시오.
   
  SELECT department_id, count(*), sum(salary)
  FROM employees
  GROUP BY  department_id 
  HAVING  count(*) >=10 
  ORDER BY department_id;
  
  
--10) employees 테이블에서 이름(first_name)의 세번째 자리가 'e'인 직원을 검색하시오.

  SELECT first_name, instr(first_name, 'e')
  FROM employees
 WHERE instr(first_name, 'e') =3;
 
  SELECT first_name, instr(first_name, 'e',3,1)
  FROM employees
 WHERE  instr(first_name, 'e',3,1) =3;
 
 SELECT first_name
  FROM employees
 WHERE  substr (first_nam,3,1) ='e';
   
   
   

