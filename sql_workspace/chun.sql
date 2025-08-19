select * from user_tables;
--1.
select * from TB_DEPARTMENT;
select department_name "학과 명", category 계열
from TB_DEPARTMENT;

--2.'가나다라'||'abcd'||1234 from dual; / select concat('가나다라','abcd') from dual;
select department_name||'의 정원은 '||capacity||'명 입니다.'
from TB_DEPARTMENT;

--3.
select * from TB_STUDENT;
select student_name
from TB_STUDENT
where student_no in ('A513079','A513090','A513091','A513110','A513119')
order by 1 desc;

--4
select * from TB_DEPARTMENT;
select department_name, category
from TB_DEPARTMENT
where capacity between 20 and 30;

--5.
select * from TB_PROFESSOR where PROFESSOR_NAME = '임해정';
select professor_name 
from TB_PROFESSOR
where DEPARTMENT_NO is null;

--6.
select * from TB_CLASS;
select class_no from TB_CLASS
where PREATTENDING_CLASS_NO is not null;

--7.
select DISTINCT category from TB_DEPARTMENT;


----------------------------------------------------------------
--1.
select * from TB_STUDENT;
select student_no, student_name, entrance_date
from TB_STUDENT
where DEPARTMENT_NO =  '002'
order by ENTRANCE_DATE;

--2.
select * from TB_PROFESSOR;
select professor_name, professor_ssn
from TB_PROFESSOR
where PROFESSOR_NAME not like '___';

--3. extract(year from sysdate) - (1900 + substr(emp_no,1,2))+1 나이
select * from TB_PROFESSOR;
select professor_name, extract(year from sysdate) - (1900+substr(professor_ssn, 1, 2)) 나이
from TB_PROFESSOR
where instr(professor_ssn, '-1', 1) != 0
order by 나이;

--4. 
select * from TB_PROFESSOR;
select substr(professor_name, 2,2) 이름
from TB_PROFESSOR;

--5.  ---
--select 
--    extract(year from sysdate) - (1900 + substr(emp_no,1,2))+1 나이,
--    extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,2),'rr'))+1 나이,
--    to_char(to_date(substr(emp_no,1,2),'rr'),'yyyy-mm-dd hh24:mi:ss')
--from employee;
select * from TB_STUDENT;
select student_no, student_name, extract(year from entrance_date)+1 - to_char(to_date(substr(student_ssn,1,2),'rr')-1, 'yyyy') 나이
from TB_STUDENT
where extract(year from entrance_date)+1 - to_char(to_date(substr(student_ssn,1,2),'rr'), 'yyyy') > 20;


--6.select to_char(sysdate, 'yyyy/month/dd/day') from dual;
select to_char(to_date('20201225','yyyymmdd'),'day') 요일
from dual;

--7.
select * from TB_STUDENT;
select student_no, student_name
from TB_STUDENT
where student_no not like 'A%';

--8.
select * from TB_STUDENT;
select student_no, student_name, student_ssn, ENTRANCE_DATE, ABSENCE_YN
from TB_STUDENT
where ABSENCE_YN = 'N' and to_char(ENTRANCE_DATE, 'yy') = 02 and STUDENT_ADDRESS like '%전주%';

--9.
select * from TB_STUDENT;
select * from TB_GRADE;
select round(avg(point), 1)
from TB_GRADE
where student_no = 'A517178';

--10.
select *from TB_STUDENT;
select department_no, count(department_no)
from TB_STUDENT
group by DEPARTMENT_NO
order by department_no;

--11.
select coach_professor_no from TB_STUDENT order by COACH_PROFESSOR_NO;
select count(*)
from TB_STUDENT
where COACH_PROFESSOR_NO is null;

--12.
select *from TB_STUDENT;
select * from TB_GRADE;
select rpad(term_no,4,'#') 년도, round(avg(point), 1) "년도 별 평점"
from TB_GRADE
where STUDENT_NO = 'A112113'
group by term_no;

--13.
select *from TB_STUDENT;
select * from TB_DEPARTMENT;

select s.department_no, nvl(count(department_no), 0)
from TB_STUDENT s
left join TB_DEPARTMENT d on (s.department_no = d.department_no) and s.ABSENCE_YN = 'Y'
group by s.DEPARTMENT_NO
order by s.department_no;


/*
 * 목표: '모든' 학과에 대해 휴학생 수를 계산한다. (휴학생이 없으면 0으로 표시)
 */
SELECT
    d.department_name,  -- 학과 이름
    -- 아래 COUNT 안의 CASE문이 핵심입니다.
    COUNT(CASE WHEN s.ABSENCE_YN = 'Y' THEN 1 END) AS "휴학생 수"
    /*
     * CASE WHEN s.ABSENCE_YN = 'Y' THEN 1 END
     * -> 만약 학생이 휴학생('Y')이면, 숫자 1을 부여한다.
     * -> 재학생이면? 아무것도 부여하지 않는다(NULL).
     * COUNT() 함수는 NULL이 아닌 값의 개수만 세므로,
     * 결국 휴학생의 수만 정확히 세게 됩니다.
     */
FROM
    TB_DEPARTMENT d   -- ★★★ 이번엔 학과 테이블을 주인공(왼쪽)으로 놓습니다.
LEFT JOIN
    TB_STUDENT s ON (d.department_no = s.department_no)
GROUP BY
    d.department_name
ORDER BY
    d.department_name;










