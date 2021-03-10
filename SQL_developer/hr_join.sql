/* 1. 테이블 join : 일반적으로 내부조인 방식을 의미한다 */

select * from employees;
select * from departments;
select * from jobs;
select * from locations;

-- 2개 테이블 조인하기(두 테이블간의 동일한 필드가 존재해야 한다 : 무결성, 없으면 데이터의 심각한 문제가 있는것)
select emp.department_id, first_name, last_name, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id;

-- 3개의 테이블 조인하기(직원의 이름, 이메일, 부서 아이디, department_name, job_title 가져오기)
select employee_id, first_name, last_name, email, emp.department_id,  dep.department_name, job_title
from employees emp, departments dep, jobs 
where emp.department_id = dep.department_id and emp.job_id = jobs.job_id
order by employee_id;

-- 4개 테이블 조인(근무 위치 파악 / 직원의 이름, 이메일, 부서아이디, 부서명, 직급명, 근무위치 데이터 가져오기)
-- 보기 편하도록 사원아이디도 가져왔음
select employee_id, first_name, last_name, email, emp.department_id,  dep.department_name, job_title, lo.location_id
from employees emp, departments dep, jobs, locations lo
where emp.department_id = dep.department_id and emp.job_id = jobs.job_id and dep.location_id = lo.location_id
order by employee_id; -- 사원수 107명인데 106명만 나오는 이유는 1명의 부서아이디가 null 값이기 때문

-- 4개 테이블 조인(시애틀에서 근무하는 직원의 이름, 이메일, 부서아이디, 부서명, 직급명, 근무위치 데이터 가져오기)
select first_name, last_name, emp.email, emp.department_id,  dep.department_name, job_title, lo.location_id, lo.city
from employees emp, departments dep, jobs, locations lo
where emp.department_id = dep.department_id and emp.job_id = jobs.job_id and dep.location_id = lo.location_id and lo.city = 'Seattle';

/* 셀프 조인 : 자신의 테이블을 여러개의 테이블처럼 사용하는 것 , 한 테이블 안에 서로 다른이름의 필드값들이 동일할 때 사용 가능  */
select * from employees;
select emp1.employee_id, emp1.first_name, emp2.employee_id 상사id, emp2.first_name 상사이름
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id;


/* 2. 외부 join : left 외부조인, right 외부조인 2가지로 나뉨*/
-- 내부조인 했을때 null 값 때문에 사원수가 107명이지만 106명으로 조회됨
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id;

-- 위를 외부조인으로 바꾸면
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep -- 여기서 왼 오 
where emp.department_id = dep.department_id(+); -- 왼쪽을 기준으로 오른쪽이 늘어남 Left Outer join
--where emp.department_id(+) = dep.department_id; -- 오른쪽을 기준으로 왼쪽이 늘어남 Right Outer join
select * from departments;
select * from employees;

--[문제] 모든 사원의 employee_id와 first_name, department_name, city를 출력하시오
select emp.employee_id, emp.first_name, dep.department_name, lo.city
from employees emp, departments dep, locations lo
where emp.department_id = dep.department_id(+) and dep.location_id = lo.location_id(+);

--[문제] 모든 사원의 사원id와 firstname 그리고 상사id와 상사이름을 출력
select emp1.employee_id 사원id, emp1.first_name 사원이름, emp2.employee_id 상사id, emp2.first_name 상사이름
from employees emp1, employees  emp2
where emp1.manager_id = emp2.employee_id(+);

select * from locations;
select * from departments;
select * from employees;