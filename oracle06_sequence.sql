/*-------------------------------------------------------------
 시퀀스(sequence)
 	쉽게말해, 중복되지 않는 숫자를 자동으로 만들어주는 번호 생성기
   테이블 내의 유일한 숫자를 자동으로 생성하는 자동번호 발생이므로 시퀀스를
   기본 키로 사용하면 사용자의 부담을 줄일 수 있다.

<기본 키(primary key)란?>
테이블에서 각 행(row)을 구분하는 고유값이에요.

예를 들어 학생 테이블이 있다면, 학번은 중복되면 안 되겠죠?
→ 이때 학번을 기본 키로 설정하면, 중복 입력이 불가능합니다.
 그런데 여기서 문제는?
새로운 학생을 등록할 때마다 학번(고유번호)을 사람이 일일이 숫자를 정해서 넣는 건 귀찮고 실수도 생길 수 있어요.
그래서 등장한 것이 시퀀스(sequence) 시퀀스는 자동으로 고유번호(숫자)를 만들어주는 도구예요.

     * create sequence 시퀀스명
     * start with  n - 시퀀스 시작번호
     * increment by n  -시퀀스 증가치
     * nocache  -cache는 메모리상의 시퀀스값을 관리하게 하는데 기본값이 20이다.
              -nocache은 메모리상의 시퀀스를 관리하지 않는다.
     * nocycle  - cycle은 지정된 시퀀스값이 최대값까지 증가를 완료하면 start with
                옵션에 지정된 시작값에시 다시 시퀀스를 시작한다.
              - nocycle은  증가가 완료되면 에러를 유발한다.

     * maxvalue n;- 시퀀스가 가질수 있는 최대값을 지정한다.
              maxvalue의 기본값은 ascending일때 1027승, descending 일때 -1이다.
              
CREATE SEQUENCE 시퀀스명
START WITH n          -- 시퀀스를 n부터 시작
INCREMENT BY n        -- n씩 증가 (또는 감소 가능)
NOCACHE               -- 메모리 캐시 없이 동작 (성능↓, 안정성↑)
NOCYCLE               -- 최대값 도달 시 멈춤 (반복 X)
MAXVALUE n;           -- 시퀀스의 최대값 설정
-------------------------------------------------------------------------- */
SELECT * FROM tab;
--Table EMP03이(가) 생성되었습니다.
CREATE TABLE emp03(
    num number, name VARCHAR2(20)
    );

-- 전체 테이블 'EMP03' 검색
SELECT * FROM user_tables
WHERE table_name = 'EMP03';

-- 유저 시퀀스를 전체 검색
SELECT * FROM user_sequences;


--Sequence EMP03_NUM_SEQ이(가) 생성되었습니다.
 CREATE SEQUENCE emp03_num_seq
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 SELECT * FROM employees;
SELECT * FROM departments;

-- equence_name 컬럼의 'EMP03_NUM_SEQ' 검색
 SELECT * FROM user_sequences
 WHERE sequence_name = 'EMP03_NUM_SEQ';

 --nextval : 다음 시퀀스 검색
 SELECT emp03_num_seq.nextval FROM dual;


 --currval: 현재 시퀀스 검색- nextval을 수행한 다음 사용가능
 --nextval 없이 currval만 먼저 쓰면 오류가 납니다!
 SELECT emp03_num_seq.currval FROM dual;
 
 
 INSERT INTO emp03(num,name)
VALUES( emp03_num_seq.nextval, '홍길동');


 SELECT * FROM emp03;
SELECT emp03_num_seq.currval FROM dual;
 
  INSERT INTO emp03(num, name)
 VALUES( emp03_num_seq.nextval, '고수');


DELETE FROM emp03
WHERE num=2;

SELECT * FROM emp03;

INSERT INTO emp03(num, name)
 VALUES( emp03_num_seq.nextval, '여진구');

SELECT * FROM emp03;

-=============================================
-- 새로운 테이블 생성
 CREATE TABLE mem(
   num number,
   name varchar2(50),
   age number,
   loc varchar2(30));
   
   SELECT * FROM mem;

--Sequence MEM_NUM_SEQ이(가) 생성
CREATE SEQUENCE mem_num_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

  SELECT * FROM user_sequences;
  
--1 행 이(가) 삽입되었습니다.
INSERT INTO mem
VALUES(mem_num_seq.nextval, '고수', 30, '서울');

    SELECT * FROM mem;

 -- 저장
commit;

