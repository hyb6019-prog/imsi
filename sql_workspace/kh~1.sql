select * from employee;

select * from department;

--====== JOIN ===============================


-- 두테이블에서 비교하려는 컬럼의 이름이 다른경우
-- 모든직원의 이름(employee - emp_name), 부서코드(employee - dept_code / department - dept_id), 부서명(department - dept_title)을 조회
-- -> 조회하고 싶은 정보가 여러개 테이블에 존재하는 경우 조회를 여러번 해야함
-- 한번에 조회하는 방법 -> JOIN

-- ANSI 표준 구문
select emp_name, dept_code, dept_title
from employee 
join department on (dept_code = dept_id);

-- ORACLE 전용 구문
select emp_name, dept_code, dept_title
from employee, department
where dept_code = dept_id;

select * from employee;
select * from job;

-- 두테이블에서 비교하려는 컬럼의 이름이 같은경우
-- 모든 직원의 이름(employee - emp_name), 직급코드(employee - job_code / job - job_code) ,직급명(job - job_name)을 조회
-- ANSI 표준 구문
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
[group by]      4       -- 그룹 기준점(컬럼) 생성
[having]        5
[order by]      7


*/











-- INNER JOIN : 기본적으로 JOIN하면 INNER JOIN -> 조인조건에 만족하지 않는 행은 조인에서 제외
select emp_name, dept_code, dept_title
from employee 
join department on (dept_code = dept_id);

-- OUTER JOIN : 조인조건에 만족하지 않는 행도 조인에 포함시킬 때(LEFT/RIGHT/FULL)
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
cross join department;  --조건이 빠져야 됨

-- SELF JOIN
-- 별명을 붙여서 사용
select * from employee;

select e1.emp_name, e1.salary, e1.manager_id, nvl(e2.emp_name,'관리안됨') as 매니저이름
from employee e1
left join employee e2 on (e1.manager_id = e2.emp_id);

-- 다중 조인
-- 조인 순서가 중요
select emp_name, dept_title, national_code, job_name
from employee
left join department on (dept_code = dept_id)  --left를 걸면 밑으로도 같이 걸어줘야 됨
left join location on (location_id = local_code)
join job using(job_code);


--====실습====--
select * from DEPARTMENT;
select * from EMPLOYEE;
select * from JOB;
select * from LOCATION;
select * from NATIONAL;
select * from sal_grade;

-- 1. 주민번호가 1970년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의
-- 사원명, 주민번호, 부서명, 직급명을 조회하시오.
select emp_name, emp_no, dept_title, job_name
from employee
join department on (dept_code = dept_id)
join job using (job_code)
--where (substr(emp_no,1,2) between 70 and 79) and substr(emp_name,1,1) = '전'; 
where emp_name like '전%'and emp_no like '7%-2%';

-- 2. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.
select emp_id, emp_name, dept_title
from employee
join department on (dept_code = dept_id)
where emp_name like '%형%';

-- 3. 해외영업부에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.
select emp_name, job_name, dept_code, dept_title
from employee
join job using (job_code)
join department on (dept_code = dept_id)
--where dept_code in ('D5','D6','D7');  -- 출력값은 같지만 두번 출력해야 되는 오류
where dept_title like '해외영업%';


--4. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
select emp_name, bonus, dept_title, local_name
from employee
left join department on (dept_code = dept_id)
left join LOCATION on (location_id = local_code)
where bonus is not null;


-- 5. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.
select emp_name, job_name, dept_title, local_name
from employee
join department on (dept_code = dept_id)
join LOCATION on (location_id = local_code)
join job using (job_code)
where dept_code = 'D2';

-- 6. 한국(ko)과 일본(jp)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을 조회하시오.
select emp_name, dept_title, local_name, national_name
from employee
left join department on (dept_code = dept_id)
left join LOCATION on (location_id = local_code)
left join NATIONAL using (national_code)
where national_name in ('한국','일본');


--7. 같은 부서에 근무하는 직원들의 사원명, 부서명, 동료이름을 조회하시오. (self join 사용)
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



-- 8. 보너스포인트가 없는 직원들 중에서
-- 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회. 단, join과 in 사용할 것
select emp_name, job_name, salary
from employee
left join job using (job_code)
where job_name in ('차장','사원') and bonus is null; 

------------------------------------------------------------------------------
--======= SET OPERATOR ============== 2 select 결과 행을 합치는 것

-- union (합집합) : 두 조회결과를 합치고, 중복데이터 제거, 첫번째 컬럼으로 정렬 / 다만 컬럼이 같아야 됨
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'          -- 세미콜론 하나를 지움
union       
select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;

-- union all (합집합) : 두 조회결과를 합치고, 중복데이터 유지, 정렬 x
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'          -- 세미콜론 하나를 지움
union  all     
select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;



-- intersect (교집합) : 두 select 결과에서 중복된 데이터만 추출
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'          -- 세미콜론 하나를 지움
intersect     
select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;


-- minus (차집합) : 두 select 결과에서 먼저 작성된 결과에서 나중에 작성된 결과 중 중복값을 제거한 데이터만 추출
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'          -- 세미콜론 하나를 지움
minus    
select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;






----------- SUBQUARY ----------------------------------------
--전 직원의 평균 급여보다 급여를 많이 받는 직원들의 이름, 부서코드, 급여를 조회
-- 전 직원의 평균급여
select avg(salary) from employee;

select
    emp_name, dept_code, salary
from employee
where salary > (select avg(salary) from employee); --데이터의 갯수가 맞아야됨

select
    emp_name, dept_code, salary
from employee
where salary > (select avg(salary) from employee);

-- 단일 행 서브쿼리 : 서브쿼리의 수행 결과가 1행 1열인 서브쿼리
-- 전지연 직원의 관리자 이름을 조회

select manager_id from employee where emp_name='전지연';

select emp_name from employee where emp_id = 214;

select emp_name 
from employee
where emp_id = (select manager_id from employee where emp_name='전지연');

--단일행 서브쿼리 실습예제-----
--1. 윤은해와 급여가 같은 사원들을 검색해서, 사원번호,사원이름, 급여를 출력하세요. 
--   단, 윤은해는 출력 되면 안됨
select salary from employee where emp_name = '윤은해';

select 
    emp_id, emp_name, salary 
from employee 
where salary = (select salary from employee where emp_name = '윤은해') and emp_name != '윤은해';

--2. employee 테이블에서 기본급여가 제일 많은 사람과 제일 적은 사람의 정보를 사번, 사원명, 기본급여를 나타내세요.
select max(salary) from employee;
select min(salary) from employee;

select 
    emp_id, emp_name, salary
from employee
where salary in ((select max(salary) from employee) , (select min(salary) from employee));

-- 3. D1, D2부서에 근무하는 사원들 중에서
-- 급여가 D5 부서 직원들의 '평균월급' 보다 많은 사람들만
-- 부서번호, 사원번호, 사원명, 월급을 나타내세요.
select avg(salary) from employee where dept_code = 'D5';

select 
    dept_code, emp_id, emp_name, salary
from employee
where dept_code in ('D1','D2') and salary > (select avg(salary) from employee where dept_code = 'D5');


-- 다중 행 서브쿼리 : 서브쿼리 수행 결과가 N행 1열
-- 각 부서 별 급여를 가장 많이 받는 직원의 이름, 직급코드, 부서코드, 급여
-- in, not in 사용
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
-- -> where salary < 6000000 or salary < 2000000    -- 여러개 값중 최대값보다 작으면 
--where salary > any(6000000, 2000000);
-- -> where salary > 6000000 or salary > 2000000    -- 여러개 값중 최소값보다 크면 
-- all
select 
    emp_name, salary
from employee
-- where salary < all(600000, 200000);
-- -> where salary < 6000000 and salary < 2000000       -- 여러개 값 중 최소값보다 작으면
where salary > all(6000000, 2000000);                   -- 여러개 값중 최대값보다 크면
-- -> where salary > 6000000 and 2000000;



-- 상호 연관 서브쿼리 : 메인쿼리와 서브쿼리가 서로 영향을 주는 서브쿼리
-- 모든 사원의 사번, 이름, 관리자번호, 관리자이름
select 
    emp_id, 
    emp_name, 
    manager_id, 
    nvl((select emp_name from employee e2 where emp_id=e1.manager_id) , '관리자 없음') 관리자이름
from employee e1
order by 1;

select emp_name from employee where emp_id=매니저번호;


-- join 이용한 방식
select
    e1.emp_id, e1.emp_name, e1.manager_id, nvl(e2.emp_name, '관리자없음') 관리자이름
from employee e1
left join employee e2 on (e1.manager_id = e2.emp_id)
order by 1
;


-- 자신이 속한 부서의 평균급여보다 급여를 많이 받는 직원의 이름, 부서코드, 급여
select
    emp_name, dept_code, salary
from employee e1
where salary > (select avg(salary) from employee e2 where e2.dept_code = e1.dept_code);

select dept_code, floor(avg(salary)) 평균급여 from employee group by dept_code; --부서별 평균급여


-- 인라인 뷰 (from 절에서 사용하는 서브쿼리)
select emp_name, dept_code
from (select emp_name, dept_code, job_code from employee);


select emp_name, dept_code, job_code from employee;

-- TOP N 분석 : ex) 회사에서 급여가 가장 높은사람 5명 출력
select emp_name, salary from employee order by salary desc;
select emp_name, salary from employee where salary >= 3700000;      --매년 숫자를 수정해줘야 되는 식

select emp_name, salary from employee order by salary desc;
select rownum, emp_name, salary                                     -- rownum 조회된 결과에 순서대로 인덱스번호를 붙여줌
from (select emp_name, salary from employee order by salary desc)
where rownum < 6;

--- DML ---------------------------------------------------------------------
-- INSERT ------------

















