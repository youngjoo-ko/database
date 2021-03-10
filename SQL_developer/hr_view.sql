/*
    뷰(view)
    : 몰리적으로 존재하지 않는 가상의 테이블
    : 하나 이상의 테이블을 조회하는 select문의 결과값들을 저장한 객체
    
    용도
    : 편리성(select문의 복잡함을 해소하기 위해 사용)
    : 보안성(테이블의 특정 열을 노출하고 싶지 않을 때 사용)
    
    형식
    : create view 뷰이름(컬럼1, 컬럼2, ..)
      as select문
      
*/


CREATE VIEW v_emp(emp_id, first_name, job_id, hire_date, dept_id)
AS 
SELECT employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'ST_CLERK'; 

select * from v_emp;

-- 수정해야 할 때 일반적으로 많이 사용되는 방식(해당 뷰가 존재하면 REPLACE, 존재하지 않으면 CREATE)
CREATE OR REPLACE VIEW v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
AS 
SELECT employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'SH_CLERK'; 

select * from v_emp2;
DESC v_emp2;

-- 아래 코드 수행 결과 emp_id가 not null에서 null 허용으로 바뀜
CREATE OR REPLACE VIEW v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
AS 
SELECT nvl(employee_id, null), nvl(first_name, null), job_id, hire_date, department_id
from employees
where job_id = 'SH_CLERK'; 

desc employees; -- 원래 테이블의 null 형태는 바뀌지 않음

-- 이름 바꾸기
update v_emp2 set first_name = 'Kim' where first_name = 'Kelly';
select * from v_emp2; -- view의 row 수정됨
select * from employees; -- 테이블의 row도 수정됨


update v_emp2 set first_name = 'Kelly' where first_name = 'Kim'; -- 다시 안바뀜????

-- 보너스 합한 연봉 구하기
select employee_id, first_name, (salary*12 + (salary*nvl(commission_pct, 0))) 연봉
from employees;

-- 위를 view로 바꾸기
create view v_emp_sal(emp_id, first_name, annual_sal)
as 
select employee_id, first_name, (salary*12 + (salary*nvl(commission_pct, 0))) 연봉
from employees;

-- view를 수정할 수 없게 설정하기
create view v_emp_sal_readonly(emp_id, first_name, annual_sal)
as 
select employee_id, first_name, (salary*12 + (salary*nvl(commission_pct, 0))) 연봉
from employees
with read only; -- 읽기만 가능

-- 테이블 조인을 이용한 뷰 만들기
create view v_join(사번, 이름, 부서번호, 부서명, 입사일)
as
select emp.employee_id, emp.first_name||''||emp.last_name, -- 성, 이름 합침
emp.department_id, dept.department_name, emp.hire_date
from employees emp, departments dept
where emp.department_id = dept.department_id;

select * from v_join order by 사번;

--10년전 입사자중 연봉 100000이상 받는 사원의 아이디와 이름, 부서아이디, 입사일 조회(부서아이디는 50, 직책은 ST_CLERK)하는 view 만들기
create or replace view v_sample -- 뷰의 필드명을 따로 지정하지 않으면 select 해온 필드명 그대로 생성된다
as
select employee_id, first_name, last_name, department_id, hire_date
from employees
where (salary*12 + (salary*nvl(commission_pct, 0))) >= 40000
and department_id = 50 and job_id = 'ST_CLERK'
and hire_date < sysdate-(365*10); 

select * from v_sample;
