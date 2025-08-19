select * from employee;

select * from department;

--====== JOIN ===============================


-- �����̺��� ���Ϸ��� �÷��� �̸��� �ٸ����
-- ��������� �̸�(employee - emp_name), �μ��ڵ�(employee - dept_code / department - dept_id), �μ���(department - dept_title)�� ��ȸ
-- -> ��ȸ�ϰ� ���� ������ ������ ���̺� �����ϴ� ��� ��ȸ�� ������ �ؾ���
-- �ѹ��� ��ȸ�ϴ� ��� -> JOIN

-- ANSI ǥ�� ����
select emp_name, dept_code, dept_title
from employee 
join department on (dept_code = dept_id);

-- ORACLE ���� ����
select emp_name, dept_code, dept_title
from employee, department
where dept_code = dept_id;

select * from employee;
select * from job;

-- �����̺��� ���Ϸ��� �÷��� �̸��� �������
-- ��� ������ �̸�(employee - emp_name), �����ڵ�(employee - job_code / job - job_code) ,���޸�(job - job_name)�� ��ȸ
-- ANSI ǥ�� ����
select emp_name, e.job_code, job_name
from employee e
JOIN job j on (e.job_code = j.job_code);

select emp_name, job_code, job_name
from employee
join job using (job_code);

--ORACLE
select emp_name, e.job_code, job_name
from employee e, job j
where e.job_code = j.job_code;


-------------------------------------------------------------------------
select * from employee;
select * from department;


select distinct dept_code from employee;
select * from department;


select emp_name, job_code, job_name
from employee 
join job using (job_code);



/*


select          6
from            1
[join]          2
[where]         3
[group by]      4       -- �׷� ������(�÷�) ����
[having]        5
[order by]      7


*/











-- INNER JOIN : �⺻������ JOIN�ϸ� INNER JOIN -> �������ǿ� �������� �ʴ� ���� ���ο��� ����
select emp_name, dept_code, dept_title
from employee 
join department on (dept_code = dept_id);

-- OUTER JOIN : �������ǿ� �������� �ʴ� �൵ ���ο� ���Խ�ų ��(LEFT/RIGHT/FULL)
select emp_name, dept_code, dept_title 
from employee 
left join department on (dept_code = dept_id);    --left join

select emp_name, dept_id, dept_title 
from employee 
right join department on (dept_code = dept_id);    --right join

select emp_name, dept_id, dept_title 
from employee 
full join department on (dept_code = dept_id);    --full join

-- CROSS JOIN
select emp_name, dept_id, dept_title 
from employee 
cross join department;  --������ ������ ��

-- SELF JOIN
-- ������ �ٿ��� ���
select * from employee;

select e1.emp_name, e1.salary, e1.manager_id, nvl(e2.emp_name,'�����ȵ�') as �Ŵ����̸�
from employee e1
left join employee e2 on (e1.manager_id = e2.emp_id);

-- ���� ����
-- ���� ������ �߿�
select emp_name, dept_title, national_code, job_name
from employee
left join department on (dept_code = dept_id)  --left�� �ɸ� �����ε� ���� �ɾ���� ��
left join location on (location_id = local_code)
join job using(job_code);


--====�ǽ�====--
select * from DEPARTMENT;
select * from EMPLOYEE;
select * from JOB;
select * from LOCATION;
select * from NATIONAL;
select * from sal_grade;

-- 1. �ֹι�ȣ�� 1970��� ���̸鼭 ������ �����̰�, ���� ������ ��������
-- �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�Ͻÿ�.
select emp_name, emp_no, dept_title, job_name
from employee
join department on (dept_code = dept_id)
join job using (job_code)
--where (substr(emp_no,1,2) between 70 and 79) and substr(emp_name,1,1) = '��'; 
where emp_name like '��%'and emp_no like '7%-2%';

-- 2. �̸��� '��'�ڰ� ���� �������� ���, �����, �μ����� ��ȸ�Ͻÿ�.
select emp_id, emp_name, dept_title
from employee
join department on (dept_code = dept_id)
where emp_name like '%��%';

-- 3. �ؿܿ����ο� �ٹ��ϴ� �����, ���޸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�.
select emp_name, job_name, dept_code, dept_title
from employee
join job using (job_code)
join department on (dept_code = dept_id)
--where dept_code in ('D5','D6','D7');  -- ��°��� ������ �ι� ����ؾ� �Ǵ� ����
where dept_title like '�ؿܿ���%';


--4. ���ʽ�����Ʈ�� �޴� �������� �����, ���ʽ�����Ʈ, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
select emp_name, bonus, dept_title, local_name
from employee
left join department on (dept_code = dept_id)
left join LOCATION on (location_id = local_code)
where bonus is not null;


-- 5. �μ��ڵ尡 D2�� �������� �����, ���޸�, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
select emp_name, job_name, dept_title, local_name
from employee
join department on (dept_code = dept_id)
join LOCATION on (location_id = local_code)
join job using (job_code)
where dept_code = 'D2';

-- 6. �ѱ�(ko)�� �Ϻ�(jp)�� �ٹ��ϴ� �������� �����, �μ���, ������, �������� ��ȸ�Ͻÿ�.
select emp_name, dept_title, local_name, national_name
from employee
left join department on (dept_code = dept_id)
left join LOCATION on (location_id = local_code)
left join NATIONAL using (national_code)
where national_name in ('�ѱ�','�Ϻ�');


--7. ���� �μ��� �ٹ��ϴ� �������� �����, �μ���, �����̸��� ��ȸ�Ͻÿ�. (self join ���)
select e1.emp_name, d.dept_title, e1.dept_code
from employee e1
left join employee e2 on (e1.dept_code = e2.dept_code)
left join department d on (e1.dept_code = d.dept_id);

select e1.emp_name, dept_title, e2.emp_name
from employee e1
join department  on (e1.dept_code = dept_id)
join employee e2 on (e1.dept_code = e2.dept_code)
where e2.emp_name not in e1.emp_name
order by e1.emp_name
;



-- 8. ���ʽ�����Ʈ�� ���� ������ �߿���
-- ������ ����� ����� �������� �����, ���޸�, �޿��� ��ȸ. ��, join�� in ����� ��
select emp_name, job_name, salary
from employee
left join job using (job_code)
where job_name in ('����','���') and bonus is null; 

------------------------------------------------------------------------------
--======= SET OPERATOR ============== 2 select ��� ���� ��ġ�� ��

-- union (������) : �� ��ȸ����� ��ġ��, �ߺ������� ����, ù��° �÷����� ���� / �ٸ� �÷��� ���ƾ� ��
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'          -- �����ݷ� �ϳ��� ����
union       
select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;

-- union all (������) : �� ��ȸ����� ��ġ��, �ߺ������� ����, ���� x
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'          -- �����ݷ� �ϳ��� ����
union  all     
select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;



-- intersect (������) : �� select ������� �ߺ��� �����͸� ����
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'          -- �����ݷ� �ϳ��� ����
intersect     
select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;


-- minus (������) : �� select ������� ���� �ۼ��� ������� ���߿� �ۼ��� ��� �� �ߺ����� ������ �����͸� ����
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'          -- �����ݷ� �ϳ��� ����
minus    
select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;






----------- SUBQUARY ----------------------------------------
--�� ������ ��� �޿����� �޿��� ���� �޴� �������� �̸�, �μ��ڵ�, �޿��� ��ȸ
-- �� ������ ��ձ޿�
select avg(salary) from employee;

select
    emp_name, dept_code, salary
from employee
where salary > (select avg(salary) from employee); --�������� ������ �¾ƾߵ�

select
    emp_name, dept_code, salary
from employee
where salary > (select avg(salary) from employee);

-- ���� �� �������� : ���������� ���� ����� 1�� 1���� ��������
-- ������ ������ ������ �̸��� ��ȸ

select manager_id from employee where emp_name='������';

select emp_name from employee where emp_id = 214;

select emp_name 
from employee
where emp_id = (select manager_id from employee where emp_name='������');

--������ �������� �ǽ�����-----
--1. �����ؿ� �޿��� ���� ������� �˻��ؼ�, �����ȣ,����̸�, �޿��� ����ϼ���. 
--   ��, �����ش� ��� �Ǹ� �ȵ�
select salary from employee where emp_name = '������';

select 
    emp_id, emp_name, salary 
from employee 
where salary = (select salary from employee where emp_name = '������') and emp_name != '������';

--2. employee ���̺��� �⺻�޿��� ���� ���� ����� ���� ���� ����� ������ ���, �����, �⺻�޿��� ��Ÿ������.
select max(salary) from employee;
select min(salary) from employee;

select 
    emp_id, emp_name, salary
from employee
where salary in ((select max(salary) from employee) , (select min(salary) from employee));

-- 3. D1, D2�μ��� �ٹ��ϴ� ����� �߿���
-- �޿��� D5 �μ� �������� '��տ���' ���� ���� ����鸸
-- �μ���ȣ, �����ȣ, �����, ������ ��Ÿ������.
select avg(salary) from employee where dept_code = 'D5';

select 
    dept_code, emp_id, emp_name, salary
from employee
where dept_code in ('D1','D2') and salary > (select avg(salary) from employee where dept_code = 'D5');


-- ���� �� �������� : �������� ���� ����� N�� 1��
-- �� �μ� �� �޿��� ���� ���� �޴� ������ �̸�, �����ڵ�, �μ��ڵ�, �޿�
-- in, not in ���
select salary from employee;
select max(salary) from employee group by dept_code;

select 
    emp_name, job_code, dept_code, salary
from employee
where salary in (select max(salary) from employee group by dept_code);

-- in / not in
select 
    emp_name, salary
from employee
where salary in (6000000, 2000000);
-- -> where salary = 6000000 or salary = 2000000

-- any
select 
    emp_name, salary
from employee
where salary < any(6000000, 2000000);
-- -> where salary < 6000000 or salary < 2000000    -- ������ ���� �ִ밪���� ������ 
--where salary > any(6000000, 2000000);
-- -> where salary > 6000000 or salary > 2000000    -- ������ ���� �ּҰ����� ũ�� 
-- all
select 
    emp_name, salary
from employee
-- where salary < all(600000, 200000);
-- -> where salary < 6000000 and salary < 2000000       -- ������ �� �� �ּҰ����� ������
where salary > all(6000000, 2000000);                   -- ������ ���� �ִ밪���� ũ��
-- -> where salary > 6000000 and 2000000;



-- ��ȣ ���� �������� : ���������� ���������� ���� ������ �ִ� ��������
-- ��� ����� ���, �̸�, �����ڹ�ȣ, �������̸�
select 
    emp_id, 
    emp_name, 
    manager_id, 
    nvl((select emp_name from employee e2 where emp_id=e1.manager_id) , '������ ����') �������̸�
from employee e1
order by 1;

select emp_name from employee where emp_id=�Ŵ�����ȣ;


-- join �̿��� ���
select
    e1.emp_id, e1.emp_name, e1.manager_id, nvl(e2.emp_name, '�����ھ���') �������̸�
from employee e1
left join employee e2 on (e1.manager_id = e2.emp_id)
order by 1
;


-- �ڽ��� ���� �μ��� ��ձ޿����� �޿��� ���� �޴� ������ �̸�, �μ��ڵ�, �޿�
select
    emp_name, dept_code, salary
from employee e1
where salary > (select avg(salary) from employee e2 where e2.dept_code = e1.dept_code);

select dept_code, floor(avg(salary)) ��ձ޿� from employee group by dept_code; --�μ��� ��ձ޿�


-- �ζ��� �� (from ������ ����ϴ� ��������)
select emp_name, dept_code
from (select emp_name, dept_code, job_code from employee);


select emp_name, dept_code, job_code from employee;

-- TOP N �м� : ex) ȸ�翡�� �޿��� ���� ������� 5�� ���
select emp_name, salary from employee order by salary desc;
select emp_name, salary from employee where salary >= 3700000;      --�ų� ���ڸ� ��������� �Ǵ� ��

select emp_name, salary from employee order by salary desc;
select rownum, emp_name, salary                                     -- rownum ��ȸ�� ����� ������� �ε�����ȣ�� �ٿ���
from (select emp_name, salary from employee order by salary desc)
where rownum < 6;

--- DML ---------------------------------------------------------------------
-- INSERT ------------

















