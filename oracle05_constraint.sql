==========================
/*===============================
테이블 구조 정의
CREATE TABLE table_name(
  column_name datatype,
  column_name datatype
);

자료형(datatype)
varchar2 - 가변길이 문자를 저장
char - 고정길이 문자를 저장
number(m)-정수저장
number(m,n)- 실수저장
date - 날짜 저장
===============================*/
CREATE TABLE student(
  name varchar2(20), --바이트(영문,특수문자- 1byte / 한글-3byte)
  age number(3),   --자릿수
  avg number(5,2), --5는 전체자릿수, 2은 소수점 자릿수
  hire date  
);

--정상삽입
INSERT INTO student(name,age,avg,hire)
VALUES('홍길동', 30,   97.85,    sysdate);

SELECT * FROM student;


--SQL 오류: ORA-12899: value too large for column "HR"."STUDENT"."NAME" (actual: 26, maximum: 20).
------'박차고 나온 세상에' 크키초과 (20바이트까지만 가능)
INSERT INTO student(name,age,avg,hire)
VALUES('박차고 나온 세상에', 30,   97.85,    sysdate);

--QL 오류: ORA-01438: value larger than specified precision allowed for this column.
------- 나이 3000 크기초과(3자리까지만 가능-0~999)
INSERT INTO student(name,age,avg,hire)
VALUES('홍길동', 3000,   97.85,    sysdate);

--SQL 오류: ORA-01438: value larger than specified precision allowed for this column.
------  평균나이 1345.9494 크기초과(5자리까지만)-소수점은 포함하지 않느다.
INSERT INTO student(name,age,avg,hire)
VALUES('홍길동', 30,   1345.9494,    sysdate);

-- 소수점 자리는 초과하면 짤려서 저장된다.
INSERT INTO student(name,age,avg,hire)
VALUES('홍길동', 30,   345.9494,    sysdate);

SELECT * FROM student;
-- QL 오류: ORA-01438: value larger than specified precision allowed for this column
-- 소수점2자리로 무조건 계산한다. 즉, 정수자리는 3까지만 허용한다
INSERT INTO student(name,age,avg,hire)
VALUES('홍길동', 30,   2912.8,    sysdate);

SELECT * FROM student;

