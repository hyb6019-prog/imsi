/*
select * --��ȸ�ϰ� ���� �÷�
from ���̺��̸�;
*/
--employee ���̺��� ��� �÷��� ��ȸ
select * from EMPLOYEE;
select emp_name, email, phone --��ȸ�ϰ� ���� �÷��� �Է�
from employee;

select *
from employee
where emp_name = '�����';  --where ���� ����

select *                --�������3
from employee           --�������1
where dept_code= 'D9';  --�������2

--======�ǽ� ����==========
-- 1. JOB���̺��� JOB_NAME�� ������ ��µǵ��� �Ͻÿ�.
select JOB_NAME
from JOB;

-- 2. DEPARTMENT���̺��� ���� ��ü�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
select *
from department;

-- 3. EMPLOYEE ���̺��� �̸�(EMP_NAME),�̸���(EMAIL),��ȭ��ȣ(PHONE),�����(HIRE_DATE)�� ����Ͻÿ�.
select * from employee;
select emp_name, email, phone, hire_date
from employee;

-- 4. EMPLOYEE ���̺��� �����(HIRE_DATE) �̸�(EMP_NAME),����(SALARY)�� ����Ͻÿ�.
select * from employee;
select EMP_NAME, SALARY, HIRE_DATE
from employee;

-- 5. EMPLOYEE ���̺��� ����(SALARY)�� 2,500,000���̻��� ����� EMP_NAME �� SAL_LEVEL�� ����Ͻÿ�
select * from employee;
select emp_name, sal_level
from employee
where salary >= 2500000;

--select �� ������� ����
select emp_name, salary*12 from employee; --�������� 12���ϱ�(����)

--select ��� �÷��� ��Ī ����
select emp_name as �̸�, salary as "����(��)", salary*12 sal -- (Ư������) ������ ����ǥ ���� ���� / as�� ��������
from employee;

select *from employee;
select emp_name, salary, salary + salary*bonus "���ʽ����� �޿�" --null���� �ִ� ���� ����� null�θ� ��µ�
from employee;

select emp_name, salary||'��','��' --|| or�����ڸ� ���̸� ���� �پ ��µ� /'��'�� ���� ���� �÷������� ������� 
from employee;

--distinct : ��ȸ ������� �ߺ��� row�� ����
select DISTINCT emp_name, job_code from employee; --emp_name�� ���� ������� �ߺ����� ���Ű� �ȵ�(�̸��� �ߺ��� ���� �����Ƿ�)



-- 2.������ ------------------------------------------------------------------------------------------------------

-- ��������
-- �μ��ڵ�(dept_code)�� D6�̰� �޿�(salary)�� 2,00,000���� ���̹޴� ������ �̸�, �μ��ڵ�, �޿� ��ȸ
select emp_name, dept_code, salary
from employee
where dept_code='D6' and salary > 2000000; -- and������
select emp_name, dept_code, salary
from employee
where dept_code='D6' or salary > 2000000; --or������

-- between and -> ���Ϸ��� ���� ������ ������ ���ԵǸ� true�� �����ϴ� ������
-- �޿��� 3500000 ~ 6000000�� ������ �̸�, �޿�
select emp_name, salary
from employee
where salary >= 3500000 and salary <= 6000000;

select emp_name, salary
from employee
where salary BETWEEN 3500000 and 6000000; --between�� ����ϸ� ���ϴ� ��������(�̻�, ����)

-- like : ���Ϸ��� ���� ������ ���ϰ� ��ġ�ϸ� true�� �����ϴ� ������
-- ���ϵ�ī�� : �ƹ��ų� ��ü�ؼ� ��� �� �� �ִ� ����
--  _ : �ƹ��ų� �ѱ��ڸ� ��ü
--  % : 0���� �̻� ��ü
-- ���� '��'���� ������ �̸��� �޿� ��ȸ
select emp_name, salary
from employee
where emp_name like '��__'; -- '=' ��� like / ������ �����ϴ� 3���ڸ� �˻� ����

select emp_name, salary
from employee
where emp_name like '��%'; -- __��� %��� / �� �ڿ� ����ڰ� �ְ� ������� �˻� ����

-- �̸��� �� '_'���� ���ڰ� 3�ڸ��� ������ �̸�, �̸����� ��ȸ
select emp_name, email
from employee
where email like '___#_%' escape '#'; -- #�ڿ� �ִ� _���ڴ� like Ư������ �ƴ�

-- not like
select emp_name, salary
from employee
where emp_name not like '��%'; --�� ���� �������� �ʴ� �̸� �˻�

--=====�ǽ�=====
-- 1. EMPLOYE ���̺��� �̸� ���� ������ ������ ����� �̸��� ����Ͻÿ�
select * from employee;
select emp_name
from employee
where emp_name like '__��';
-- 2. EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ�� ����Ͻÿ�.
select * from employee;
select emp_name , phone
from EMPLOYEE
where phone not like '010%';
-- 3. EMPLOYEE ���̺��� �����ּ��� 's'�� ���鼭, DEPT_CODE�� D9 �Ǵ� D6�̰�, ������ 270�����̻��� ����� ��ü ������ ����Ͻÿ�.
select * from employee;
select *
from employee
-- and�� or �� and�� ���� ����ǹǷ� ()�� ���� ���ǰ� ǥ��
where email like '%s%' and (dept_code = 'D9' or dept_code = 'D6') and salary >= 2700000; 

-- ���ʽ��� �����ʴ� ������ �̸�, �޿�, ���ʽ� 
select emp_name, salary, bonus
from employee
where bonus is not null; -- null���� ����Ϸ��� '=' ��� is null / is not null
-- �μ��� ���� ������ �̸�, �μ��ڵ�, �޿�
select emp_name, dept_code, salary
from employee
where dept_code is null;

-- in (or �����ڸ� ������ ��ߵɶ�) : �ϳ��� �÷��� �������� ��ġ�ϴ��� ���Ҷ� ����ϴ� ������(or�� ����� ����)
-- �μ��ڵ尡 D6�̰ų� D9�̰ų� D8�� ������ �̸�, �޿�, �μ��ڵ�
select emp_name, salary, dept_code
from employee
where dept_code in ('D6','D9','D8'); -- in�� ���� or�� �ϳ��� �۵��ϰ� �ؼ� �����۾��� �켱���� �����ϱ� ������

select emp_name, salary, dept_code
from employee
where dept_code not in ('D6','D9','D8'); -- ���� != �� not in �ϳ��� ����

-- dual ���̺�: ����Ŭ���� �����ϴ� �׽�Ʈ�� ���̺�(������ ���� x)
-- sysdate : ����ð��� ����Ŭ�� dateŸ������ �������� ��ɾ�
select emp_name, salary, '��', sysdate from employee;
select sysdate from dual; -- ���ó�¥
select sysdate, sysdate + 3, sysdate -3, sysdate + 0.25 from dual; -- sysdate + 1 �Ϸ� �� / - �� ���� / 0.25�� 6�ð�

select (sysdate+1) - sysdate
from dual;

select emp_name, hire_date, sysdate - hire_date from employee;

-- ������ 5000���� �̻��� ������ �̸�,�޿�
select emp_name, salary
from employee
where salary*12 >= 50000000; -- where ������ ���� ����