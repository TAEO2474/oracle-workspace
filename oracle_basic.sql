select * from employees;

SELECT *  FROM tab;

SELECT salary, salary*10  AS bonus FROM employees;

SELECT salary, salary*10  AS ���ʽ� FROM employees;

DESC employees;

SELECT salary, salary*10  AS "b o n u s" FROM employees;

SELECT last_name || '���� �޿���' || salary ||  '�Դϴ�.'  AS name FROM employees;
/*
SELECT �÷���, �÷���, �÷���
FROM ���̺��
*/

-- DISTINCT �� �ߺ����Ÿ� �� �� ����� �ִ� ��ɾ� �̴�.
SELECT DISTINCT first_name FROM employees;
SELECT DISTINCT first_name, last_name FROM employees;
/*
first_name last_name
sundar     Abel
sundar     Abel
sundar     Ande
*/


--�Է¼���
/*
SELECT column_name1, column_name2
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC(DESC);
*/

-- SELECT �ؼ����� 
/*
FROM table_name (���̺��)
WHERE column_name='value' (����)
GROUP By column_name
HAVING column_name='value'
SELECT column_name1, column_name2
ORDER BY column_name ASC(DESC);
*/

-- employees ���̺��� salary�� 3000�̸��϶���
-- first_name, salary�� ����϶�.
SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- employees���̺��� first_name�÷��� ���� 'David' �϶���
-- first_name, salary�� ����϶�.
SELECT first_name, salary
FROM employees
WHERE first_name='David';

--employees���̺��� first_name�÷��� ���� 'David' �ƴҶ���
--first_name, salary�� ����϶�. (!=), (<>) (^=)
SELECT first_name, salary
FROM employees
WHERE first_name  !=  'David';

SELECT first_name, salary
FROM employees
WHERE first_name  <>  'David';

SELECT first_name, salary
FROM employees
WHERE first_name  ^=  'David';

SELECT first_name, salary
FROM employees
WHERE NOT first_name  =  'David';
--WHERE NOT (first_name  =  'David'); �̷��� �ص� ����

--&&(and), ||(or)
--employees���̺��� salary�� 3000, 9000, 17000�϶�
--first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE  salary=3000 OR salary=9000 OR salary=17000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000, 9000, 1700);

--employees���̺��� salary�� 3000���� 5000���� �϶���
--first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <= 5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;


--employees���̺��� job_id�� 'IT_PROG'�� �ƴҶ�
--first_name, email, job_id�� ����϶�.
SELECT first_name, email, job_id
FROM employees
WHERE job_id != 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id <> 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id ^= 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE NOT (job_id = 'IT_PROG');
--WHERE NOT job_id = 'IT_PROG'; ()�־ �ǰ� �ȳ־ �ǰ�~

--employees���̺��� salary�� 3000, 9000, 17000�� �ƴҶ���
--first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary=3000 OR salary=9000 OR salary=17000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN(3000, 9000, 1700);


--employees���̺��� salary�� 3000���� 5000���� �ƴҶ���
--first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary >= 3000 AND salary <= 5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary BETWEEN 3000 AND 5000);

--employees���̺��� commission_pct�� null�϶�
--first_name, salary, commission_pct�� ����϶�.
-- ���� : null���� ã�ƿ����� (IS NULL)�� ���!

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct is NULL;

--employees���̺��� commission_pct�� null �ƴҶ�
--first_name, salary, commission_pct�� ����϶�.
-- ���� : null���� ã�ƿ����� (IS NOT NULL)�� ���!

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- employees���̺��� first_name�� 'der'�� �����̵�
-- first_name, salary, email�� ����϶�.
-- LIKE (~�Ͱ��� ��) 
-- 'der%'(der�� �����ϴ�) '%der'(der�� ������) '%der%' (der�� ���Ե�)
SELECT  first_name, salary, email
FROM employees
WHERE first_name LIKE '%der%';

-- employees���̺��� first_name�� 'der'�� ������ �ȵ�
-- first_name, salary, email�� ����϶�.
-- NOT LIKE (~�� ��������) 
SELECT first_name, salary, email
FROM employees
WHERE first_name NOT LIKE '%der%';

--employees���̺��� first_name�� ���� 'A'�� �����ϰ�
--�ι�° ���ڴ� ���� �����̸� 'exander'�� ������
--first_name, salary, email�� ����϶�.
SELECT  first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander'; -- _(�����)�� ���ǹ��� 1���� ����.

/*
 <WHERE������ ���� ������ 3���� ����>
 1 �񱳿����� : = > >= < <= != <> ^=
 2 SQL������ : BETWEEN a AND b,  IN, LIKE, IS NULL
 3 �������� : AND, OR, NOT
 
 <��īŬ �켱����>
 1 ��ȣ()
 2 NOT������
 3 �񱳿�����, SQL������
 4 AND
 5 OR
  */

 /////////////////////////////////////
////--����--
////////////////////////////////////// 
DESCRIBE employees;
-- 1) employees���̺��� �޿��� 17000������ ����� �����ȣ, �����(first_name), �޿��� ����Ͻÿ�.

SELECT employee_id, first_name, salary
FROM employees
WHERE salary <= 17000;


--2) employees���̺��� 2005�� 1�� 1�� ���Ŀ� �Ի��� ����� ����Ͻÿ�.
SELECT first_name
FROM employees
WHERE hire_date >= '2005-01-01'; --���ڵ� ���ڷ� ����


--3) employees���̺��� �޿��� 5000�̻��̰� ����(job_id)�� 'IT_PROG'�� ����� �����(first_name), �޿�, 
--   ������ ����Ͻÿ�.
SELECT  first_name, employee_id, salary
FROM employees
WHERE salary <= 5000 AND job_id = 'IT_PROG';

--4) employees���̺��� �μ���ȣ�� 10, 40, 50 �� ����� �����(first_name), �μ���ȣ, �̸���(email)�� ����Ͻÿ�.
SELECT first_name, department_id, email
FROM employees
WHERE department_id IN(10,40,50);

--5) employees���̺��� �����(first_name)�� even�� ���Ե� �����,�޿�,�Ի����� ����Ͻÿ�.
SELECT first_name, salary, hire_date
FROM employees
WHERE first_name LIKE '%even%';

--6) employees���̺��� �����(first_name)�� teve�յڿ� ���ڰ� �ϳ��� �ִ� �����,�޿�,�Ի����� ����Ͻÿ�.
SELECT first_name, salary, hire_date
FROM employees
WHERE first_name LIKE '_teve_' ; --	(�տ� ���� 1�� + teve + �ڿ� ���� 1��)

--7) employees���̺��� �޿��� 17000�����̰� Ŀ�̼��� null�� �ƴҶ��� �����(first_name), �޿�, 
--  Ŀ�̼��� ����Ͻÿ�.
SELECT first_name, salary, commission_pct
FROM employees
WHERE salary <= 17000 and commission_pct IS NOT NULL;
  
--8) 2005�⵵�� �Ի��� ����� �����(first_name),�Ի����� ����Ͻÿ�.
SELECT first_name, hire_date  --TO_CHAR(hire_date,'yyyy-MM-DD')
FROM employees
WHERE TO_CHAR(hire_date,'YYYY') = '2005';

--WHERE hire_date BETWEEN TO_DATE('2005-01-01', 'YYYY-MM-DD')
                    --AND TO_DATE('2005-12-31', 'YYYY-MM-DD');

--9) Ŀ�̼� ���� ����� ����� �����(first_name), Ŀ�̼��� ����Ͻÿ�.

SELECT first_name, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--10) ����� 206�� ����� �̸�(first_name)�� �޿��� ����Ͻÿ�.
SELECT first_name, salary
FROM employees
WHERE  employee_id = 206;

--11) �޿��� 3000�� �Ѵ� ����(job_id),�޿�(salary)�� ����Ͻÿ�.
SELECT job_id, salary
FROM employees
WHERE  salary > 3000;

--12)'ST_MAN'������ ������ ������� �����(first_name)�� ����(job_id)�� ����Ͻÿ�.
SELECT first_name, job_id
FROM employees
WHERE job_id !='ST_MAN';
--WHERE job_id <> 'ST_MAN'; (��ü����)
--WHERE job_id ^= 'ST_MAN'; (��ü����)
--WHERE job_id NOT like 'ST_MAN'; (�̷��Ե� ���� (��ҹ��� ���� ����),but �κ���ġ�˻���)

--13) ������ 'PU_CLERK' �� ��� �߿��� �޿��� 10000 �̻��� �����(first_name),����(job_id),�޿�(salary)�� ����Ͻÿ�.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id ='PU_CLERK' AND salary >=1000;

--14) commission�� �޴� �����(first_name)�� ����Ͻÿ�.
SELECT first_name
FROM employees
WHERE commission_pct IS NOT NULL;

--15) 20�� �μ��� 30�� �μ��� ���� ����� �����(fist_name), �μ��� ����Ͻÿ�.
SELECT first_name, job_id
FROM employees
WHERE department_id IN(20,30);

SELECT first_name, department_id
FROM employees
WHERE department_id = 20 OR  department_id = 30;

--16) �޿��� ���� ������� ����ϵ� �޿��� ���� ��� �����(first_name) ������� ����Ͻÿ�.
SELECT * -- ����÷�
FROM employees
ORDER BY salary DESC, first_name ASC; --ORDER BY �׸� (����)/ �޿��� ��������/ ������� ��������


--17) ������ 'MAN' ������ ����� �����(first_name), �޿�(salary), ����(job_id)�� ����Ͻÿ�.
SELECT first_name,salary, job_id
FROM employees
WHERE job_id LIKE '%MAN';


/*=========================================
���տ�����(Set Operations)
===========================================*/
/*
-�� �̻��� query����� �ϳ��� ����� �����Ѵ�.
-select�� ���� ������ ���ƾ� �Ѵ�.
  ù��° select�� 2���̸� �ι�° select�� 2������ �Ѵ�.
-Ÿ���� ��ġ�ؾ� �Ѵ�.  
 ���� ��� character�̸� character�̿��� �Ѵ�.

���տ����� ����
union(������)- �ߺ����� ���ŵ� �� query
union all(������)-�ߺ����� ���Ե� �� query��
intersect(������)-�� query�� �������� ��
minus(������)-ù��° query�� �ִ� �� �� �ι�° query�� ���� ��ǥ��

���տ����� �������
-���� �ٸ� ���̺��� ������ ������ ����� ��ȯ�ϱ� ���ؼ�
-���� ���� ���̺��� ���� �ٸ� ���Ǹ� �����Ͽ� ����� ��ġ�� ���ؼ�
*/

-- Union(������) - �ߺ��� �� ������ ���
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 40
UNION
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- Union ALL(������) - �ߺ��� �� �״�� ���
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 40
UNION ALL
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- INTERSECT (������) - �ߺ��� ���� ���
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 40
INTERSECT
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- Minus (������) -������ A - B = A���� �ְ� B���� ���� ������
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 40
MINUS
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- Minus (������,except)
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 40
MINUS
SELECT department_id,first_name, last_name 
FROM employees
WHERE department_id = 20 OR department_id = 60;


    


