/*=====================================================
SQL(structured query language)�Լ�
1. �������Լ� : �� �ϳ��� �ϳ��� ����� ����Ѵ�
              (�����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�, �Ϲ��Լ�)
2. �������Լ� : �� �������� �ϳ��� ����� ����Ѵ�
               (�հ�, ���, �ִ�, �ּ�, ����)  
====================================================== 
--SELECT�������� �ݵ�� ���̺���� ����ؾ� �Ѵ�.
--�׷��� SELECT���� ���̳� Ư���Լ��� �̿��ؼ� ������� �����ö�
-- ����� �� �ִ� DUAL�̶�� ���̺��� �����ϰ� �ִ�. */

SELECT 3+1
FROM dual;

SELECT sysdate
FROM dual;

SELECT max(10)
FROM dual;

--substr ���ڿ��� �Ϻκ��� �߶� �������� �Լ�
SELECT substr('korea',2,3) 
FROM dual;

/*---------------------
�����Լ�
----------------------*/
-- �ܾ��� ù���ڸ� �빮�ڷ� �������ִ� �Լ�
SELECT initcap('korea') 
FROM dual;

-- ��� ���߸� �빮�ڷ� �������ִ� �Լ�
SELECT upper('korea') 
FROM dual;

SELECT first_name, upper(first_name),
       last_name, UPPER(last_name)
FROM employees;

-- ��� ���߸� �ҹ��ڷ� �������ִ� �Լ�
SELECT lower('KOREA')
FROM dual;
SELECT first_name, lower(first_name), last_name, lower(last_name)
FROM employees;

-- employees���̺� first_name���� �빮�� ���о���
--'Ja'�� ���Ե� first_name, salary�� ����ض�
SELECT first_name, salary
FROM employees
WHERE UPPER(first_name)LIKE UPPER('%Ja%');

-- ������ ���̸� �������ִ� �Լ�
SELECT length('korea')
FROM dual; --5

SELECT length('�ѱ�')
FROM dual; --2

-- ������ ���̸� ����Ʈ�� ���ؼ� �������ִ� �Լ�
SELECT lengthb('korea')
FROM dual; --5

SELECT lengthb('�ѱ�')
FROM dual; --6 (�ѱ��� ��� ���� 1����, 3����Ʈ*2)

CREATE TABLE user1(
data varchar2(5) --�� �÷��� �ִ� 5������ ���ڿ��� ������ �� �ִٴ� �� (���� ���� ������)
); --Table USER1��(��) �����Ǿ����ϴ�.

SELECT*FROM user1;

INSERT INTO user1(data)
VALUES('south korea'); 
--���� ���� -
--ORA-12899: value too large for column "HR"."USER1"."DATA" (actual: 11, maximum: 5)
-- �� ���ڰ� 5�� �ʰ��ؼ� �����߻�
