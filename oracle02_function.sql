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

SELECT lengthb('����')
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

--Ư�������� ���ڸ� ������ �ִ� �Լ��̴�
-- ����Ŭ�� �ε���[1]���� ����~
--substr('����', ������ġ, ����)
SELECT substr('oracle test',2,4)
FROM dual; 

--�� �ε������ʹ� ���̳ʽ�(-)�� ����Ѵ�
SELECT substr('oracle test',-3,4)
FROM dual; 

SELECT substr('����Ŭ �׽�Ʈ',3,4)
FROM dual;   

SELECT substr('����Ŭ �׽�Ʈ',-3,4)
FROM dual;   

--Ư�������� �ε����� �����ϴ� �Լ��̴�
SELECT instr('korea','or')
FROM dual;  --or ���ڴ� [2]�ε������� �����մϴ�

SELECT instr('�ѱ��ڹ�','�ڹ�')
FROM dual; 

--�־��� ���ڿ����� �������� Ư�����ڸ� ä��� �Լ��̴�.
SELECT lpad('korea',8,'*') /*lpad('����', �ѱ���,'������ ä���� ����')*/
FROM dual; --***korea

-- �־��� ���ڿ����� ������ Ư�����ڸ� �����ϴ� �Լ��̴�.
SELECT ltrim('***korea**','*') 
FROM dual; --korea**

-- �־��� ���ڿ����� �������� Ư�����ڸ� �����ϴ� �Լ��̴�.
SELECT rtrim('***korea**','*') 
FROM dual; --***korea

-- �־��� ���ڿ����� ������ Ư�����ڸ� �����ϴ� �Լ��̴�.
SELECT trim('*'from '***korea**') 
FROM dual; --korea

-- �־��� ���ڿ����� ���� ��������
SELECT '    korea'
       ,length('   korea')
       ,ltrim('   korea')
       ,length(ltrim('   korea'))
FROM dual;

--�־��� ���ڿ����� �������� ��������
SELECT 'korea   '
       , length('korea   ')
       , rtrim('korea   ')
       , length(rtrim('korea   ')) -- ���� ���� �� ����
FROM dual;

--�־��� ���ڿ����� ������ ��������
SELECT  trim(' ' from '  korea   ' )
        , length(trim(' ' from '  korea   ' )) -- ���� ���� �� ����
FROM dual;


-- �־��� ������ �ƽ�Ű �ڵ尪�� ���ϴ� �Լ�
SELECT  ascii('A'),  ascii('a')  
FROM dual;

-- �־��� ������ �ƽ�Ű ���ڰ��� ���ϴ� �Լ�
SELECT  chr('65'), chr('97'),chr('48') 
FROM dual;

--�־��� ���ڸ� �����ϴ� �Լ�
SELECT  concat ('Hi',' TaeO')
FROM dual;

/*----------------------------
 �����Լ�
-------------------------------*/
--3.55�� �Ҽ��� 1�� �ڸ����� ���Ͻÿ�(�ݿø�)
SELECT round(3.55, 1)
FROM dual;

SELECT round(42523.55, -1) -- (-3, -2, -1, 0, �Ҽ���.,1,2,3)
FROM dual; --42520 , ���� -1�ڸ����� ���ϱ⋚���� 3�� 0���� �����ϰ� ���

SELECT round(42523.55, 0)
FROM dual;--42524

--256.78�� ������ �ø��Ѵ�.(�ø�)
SELECT ceil(256.78)
FROM dual; --257

--289.78���� �Ҽ����ϴ� ������ ������.(����)
SELECT floor(289.78)
FROM dual;--289

--2�� 3�� (�ŵ�����)
SELECT power(2,3)
FROM dual; --8

--25�� ������
SELECT sqrt(25)
FROM dual;--5

--������
SELECT mod(10,3)
FROM dual;--1


/*-------------------------------
 ��¥�Լ�
-------------------------------*/
--���� �ý��ۿ��� �������ִ� ������ ��¥ ���ϴ� �Լ�
SELECT sysdate
FROM dual;


SELECT sysdate + 1
FROM dual;

-- ù��° ������ �޿� �ι�° ���ڰ��� ���� ��¥�� ��ȯ
SELECT add_months(sysdate, 10)
FROM dual;

/*==============================================
 ��ȯ�� �Լ�
   ����                ����            ��¥
 to_number()  <-> to_char( ) <-> to_date( )
==============================================*/
--1 ����->����
--ù��° ���ڰ��� �ι�° ���ڰ��� �������� ��ȯ���ִ� �Լ�
SELECT to_char(2532, '999,999.99')
FROM dual; --   2,532.00

SELECT to_char(2532, '000,000.00')
FROM dual; -- 002,532.00

--�� ������ ��ȭ�� ǥ���� �� �� L��ȣ�� ����Ѵ�.
SELECT to_char(2532,'L999,999.99')
FROM dual; -- ��2,532.00

--2. ��¥ -> ����
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day')  /* 12�ð�  */ 
FROM dual; -- 2025-05-27 10:46:34 ȭ����

SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy')
FROM dual; -- 2025-05-27 10:46:50 ȭ

SELECT to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss day')  /* 24?��?  */ 
FROM dual;


/*===============================
to_number( )
����->����
==================================*/
SELECT '253' || '12' -- 253 �׸��� 12�� ���δ�
FROM dual;  --25312

SELECT concat('253','12')
FROM dual;  --25312

SELECT '253' + '12'
FROM dual;   --265

SELECT to_number('253') + to_number('12')
FROM dual;   --265


/*===============================
to_date()
 ����->��¥
=================================*/
SELECT to_date('2013-10-14')
FROM dual;

-- --------------------------------------
SELECT first_name,hire_date
FROM employees;

-- hire_date(�Ի���)�� �̿��ؼ� 
--'ȫ�浿���� 2003�� 1�� 3�Ͽ� �Ի��߽��ϴ�'��
--����ϴ� query�� �ۼ��Ͻÿ�.

--(����: Steven����2003��6��17�Ͽ� �Ի��߽��ϴ�.)
SELECT first_name||'����'||to_char(hire_date,'yyyy')||'��'
       ||ltrim(to_char(hire_date,'mm'),'0')||'��'
       ||ltrim(to_char(hire_date,'dd'),'0')||'�Ͽ� �Ի��߽��ϴ�.' AS "���" -- AS "���" COL �÷�(��)�� �̸�  
FROM employees;

/*====================================================================
�Ϲ��Լ� (���ֻ��)
nvl(�÷�, ��ü��) : ù��° ���ڰ��� null�̸� ��ü������ ��ü�ؼ� ����Ѵ�.
nvl2(�÷�, ��ü1, ��ü2) : �÷��� ���� null�ƴϸ� ��ü1��, null�̸� ��ü2�� ����Ѵ�. 
nullif(ǥ����1, ǥ����2 ) : ǥ����1�� ǥ����2�� ������ NULL, �ٸ��� ǥ����1�� ����Ѵ�.

--��ü��
 ���� �����̸� �ι�° ���ڰ��� ���ڸ� �����Ѵ�.
--��ü�� ���� �����̸� �ι�° ���ڰ��� ���ڸ� �����Ѵ�.
--��ü�� ���� ��¥�̸� �ι�° ���ڰ��� ��¥�� �����Ѵ�. 
=======================================================================*/
--nvl(�÷�, ��ü��) : ù��° ���ڰ��� null�̸� ��ü������ ��ü�ؼ� ����Ѵ�.
SELECT commission_pct, nvl(commission_pct,0)
FROM employees;

SELECT first_name, manager_id, nvl(to_char(manager_id),'CEO')
FROM employees; --Steven (null)	CEO

--nvl2(�÷�, ��ü1, ��ü2) : �÷��� ���� null�ƴϸ� ��ü1��, null�̸� ��ü2�� ����Ѵ�. 
SELECT commission_pct, nvl2(commission_pct,1,0)
FROM employees;


--nullif(ǥ����1, ǥ����2 ) : ǥ����1�� ǥ����2�� ������ NULL, �ٸ��� ǥ����1�� ����Ѵ�.
SELECT commission_pct, nullif(commission_pct,0.4)
FROM employees
WHERE commission_pct IN(0.4,0.3);


/*======================================================
decode(�÷�,��1, ó��1, ��2, ó��2,  �׹��� ó��)
java�� switch_case���� ��� 
======================================================*/
-- <����1>
--department_id�� 10�̸� 'ACCOUNTING', 20�̸� 'RESEARCH', 
--30�̸� 'SALES', 40�̸� 'OPERATIONS', 'OTHERS'

SELECT first_name, department_id,
        decode(department_id,10,'ACCOUNTING',
                             20,'RESERCH',
                             30,'SALES',
                             40,'OPERATION','OTHERS') AS"�μ���"
FROM employees
ORDER BY department_id ASC;
/*ORDER BY�� ����� Ư�� �� �������� �����ϰڴٴ� ���Դϴ�.
department_id ���� �������� �����ϰ� �ֽ��ϴ�.
ASC�� ��������(ascending) ������ �ǹ��մϴ�.*/

--<����2>
--������ 'PR_REP' �� ����� 5%, 'SA_MAN'�� ����� 10%, 
--'AC_MGR'�� ����� 15%, 'PU_CLERK' �� ����� 20% �� �λ� 
SELECT job_id, salary,   
       decode(job_id,'PR_REP', salary*1.05,
                     'SA_MAN', salary*1.1,
                     'AC_MGR', salary*1.15,
                     'PU_CLERK', salary*1.2,salary)AS "increased_salary"
FROM employees; 


/*================================
case when ����1 then ���1
     when ����2 then ���2
     when ����3 then ���3
     else ���n
end AS alias;
�ڹٿ��� if-else�� ����� �ǹ�
==================================*/
--<����1>
--�Ի��Ͽ��� ���� 1-3�̸� '1��б�', 4-6�̸� '2��б�', 
--             7-9�̸� '3��б�', 10-12�̸� '4��б�'�� ó���� �ϰ� 
--�����(first_name), �Ի���(hire_date), �б�� ����Ͻÿ�.
SELECT first_name,hire_date,
       case when to_char(hire_date,'mm') <= 3 then '1��б�'
            when to_char(hire_date,'mm') <= 6 then '2��б�'
            when to_char(hire_date,'mm') <= 9 then '3��б�'
            when to_char(hire_date,'mm') <= 12 then '4��б�'
        end  AS "�б�"
FROM employees; 



/*=================================================
�����Լ�(Aggregate Function), �׷��Լ�(Group Function)
===================================================*/
--max(�÷�); �ִ밪
SELECT max(salary)
FROM employees;

--min(�÷�) : �ּҰ�
SELECT min(salary)
FROM employees;

--count(�÷�) : ����
SELECT count(salary)
FROM employees;

-- ��ü ���ڵ�� ����
SELECT count(*)
FROM employees; 

--COUNT(column_name) �Լ� : �ش� �÷��� NULL�� �ƴ� ���� ���ϴ�
SELECT count(commission_pct)
FROM employees;  -- �� ������ commission_pct �÷��� NULL�� �ƴ� ���� ������ ��ȯ
/* �ݴ��, COUNT(*)�� ��ü �� ���� ���ϴ� (NULL ���� �������).*/


--sum(�÷�) : �հ�
SELECT sum(salary)
FROM employees;

--avg(�÷�) : ���
SELECT avg(salary)
FROM employees;

--�����Լ��� �ܼ��÷��� �Բ� ��� �� �� ����.(��µǴ� ���ڵ���� �ٸ��� �����̴�)
 /*"���ڵ� ��":  �����ͺ��̽� ���̺��� �ϳ��� ��(row), �� �ϳ��� ������ ����*/
--ORA-00937: not a single-group group function
--ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
SELECT first_name, count(*)
FROM employees; --����


--�׷��Լ��� �ܼ��÷��� ����ϱ� ���ؼ��� �ܼ��÷��� �׷�ȭ �ؾ� �Ѵ�.(GROUP BY)
SELECT department_id, count(*)
FROM employees 
GROUP BY department_id
ORDER BY department_id; -- �⺻������ ������������ �Ѵ�? ���ǥ�ð� ���


-- <����1>50������ �μ��� ���ؼ� null�� �ƴ� �μ����� �������� ����ϼ���
SELECT department_id, count(*)
FROM employees
WHERE department_id <= 50 AND department_id IS NOT NULL
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, count(*)  AS"������"
FROM employees
GROUP BY department_id --�Ʒ� HAVING�� ���� �׷��̴�
HAVING department_id <= 50 AND department_id IS NOT NULL
ORDER BY department_id;

-- <����2> 50������ �μ��� ���ؼ� null�� �ƴ� �μ����� �������� 5������ ��츦 ����ϼ���
SELECT department_id, count(*)   AS"������"
FROM employees
GROUP BY department_id -- ���� department_id�� ���� ����� �ϳ��� �׷����� ���´�
HAVING department_id <= 50 AND department_id IS NOT NULL AND count(*) <=5
ORDER BY department_id;


--<����3> ������(job_id) �޿��հ踦 ����Ͻÿ�.
SELECT job_id, sum(salary)
FROM employees
GROUP BY job_id;

--<����4> �μ��� �ּұ޿�, �ִ�޿��� �ּҰ��� �ִ밪�� ���� ���� ��쿡�� �μ����� ������������ ��� 
SELECT department_id,  min(salary),  max(salary), max(salary)-min(salary)
FROM employees
GROUP BY department_id 
HAVING min(salary) != max(salary)
ORDER BY  department_id;

/*------------------------------
 10 ����
------------------------------*/
--1) ��������Դ� ���(Manager)�� �ִ�. ������ employees���̺� �����ϰ� �����
--    ���� �ο찡 �ִµ� �� ���(CEO)�� manager_id�÷����� NULL�̴�. 
--    ����� ���� �����  ����ϵ� manager_id�÷��� NULL ��� CEO�� ����Ͻÿ�.
-- ���� -> nvl(�÷�, ��ü��) : ù��° ���ڰ��� null�̸� ��ü������ ��ü�ؼ� ����Ѵ�.
    SELECT  manager_id, NVL(TO_CHAR(manager_id), 'CEO') 
    FROM employees
    WHERE manager_id is null; -- ����� ���� �����  ����ϵ� manager_id�÷��� NULL ��� CEO�� ����Ͻÿ�.

--2) �����ֱٿ� �Ի��� ����� �Ի��ϰ� ��������� ����� �Ի����� ���Ͻÿ�. 
      SELECT   MIN(hire_date), MAX(hire_date)
      FROM employees;
       
 
--3) �μ����� Ŀ�̼��� �޴� ����� ���� ���Ͻÿ�.
    SELECT department_id, count(commission_pct)
    FROM employees
    GROUP BY department_id;
  

    SELECT department_id, count(*)
    FROM employees
    WHERE commission_pct IS NOT NULL -- Ŀ�̼��� 0�� �ƴ� ����
    GROUP BY department_id
    ORDER BY department_id;

   
--4) �μ��� �ִ�޿��� 10000�̻��� �μ��� ����Ͻÿ�.   
    SELECT department_id, max(salary)
    FROM employees
    GROUP BY department_id
    HAVING max (salary) >=10000
    ORDER BY max(salary);


--5) employees ���̺��� ������ 'IT_PROG'�� ������� �޿������ ���ϴ� SELECT������ ����Ͻÿ�.
    -- ������Ű��
    SELECT  job_id, AVG(salary)
    FROM employees
    GROUP BY job_id
    HAVING job_id = 'IT_PROG';
    
    -- <���� ��Ű��>
    SELECT  job_id, AVG(salary)
    FROM employees
    WHERE job_id = 'IT_PROG'
    GROUP BY job_id;

--6) employees ���̺��� ������ 'FI_ACCOUNT' �Ǵ� 'AC_ACCOUNT' �� ����� �� �ִ�޿���  ���ϴ�    SELECT������ ����Ͻÿ�.   
   
    SELECT  job_id, maX(salary)
    FROM employees
    GROUP BY job_id
    HAVING job_id IN ('FI_ACCOUNT', 'AC_ACCOUNT');

--7) employees ���̺��� 50�μ��� �ּұ޿��� ����ϴ� SELECT������ ����Ͻÿ�.
      
    SELECT  department_id, min (salary) 
    FROM employees;
    GROUP BY department_id
    --HAVING min(salary);
    
--8) employees ���̺��� �Ʒ��� ���ó�� �Ի��ο��� ����ϴ� SELECT������ ����Ͻÿ�.
--   <���:  2001		   2002		       2003
 --  	     1          7                6   >
   		   
   
    
--9) employees ���̺��� �� �μ��� �ο��� 10�� �̻��� �μ��� �μ��ڵ�,
--  �ο���,�޿��� ���� ���ϴ�  SELECT������ ����Ͻÿ�.
   
  
  
--10) employees ���̺��� �̸�(first_name)�� ����° �ڸ��� 'e'�� ������ �˻��Ͻÿ�.

   
   

