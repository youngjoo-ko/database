desc employees;
-- *은 모든 열을 의미
select * from employees;
-- 라스트 네임이 스미스인 사람의 모든 정보 확인
select * from employees where last_name='Smith';
-- 부서의 구조 확인
select * from departments;
desc departments;
-- 라스트네임이 'Ernst' 직원의 아이디와 급여 조회
select last_name, employee_id, salary, first_name from employees where last_name='Ernst';
-- 필드명을 수정할 수 있다
select employee_id as "사원 id" from employees;
-- 사원 id, 월급으로 필드명을 지정 후 조회
select employee_id  as "사원 id" from employees;
select salary as "월급" from employees;
select employee_id as "사원 id", salary as "월급" from employees;
select employee_id “사원”, salary “월급” from employees;

-- 중복제거하기  distinct
select job_id from employees;
select distinct job_id from employees;

-- 연산자(산술, 비교, 논리, 기타)
select employee_id, first_name, salary*12 from employees;

-- 필드명을 한글로 수정하여 연봉 조회
select employee_id “사원 id”, first_name “이름”, salary*12 “연봉” from employees;

-- 비교연산자 이용하여 급여가 5000이상인 직원의 이름과 급여 조회하기
select last_name, salary from employees where salary>=5000;

-- 입사날짜가 2004년 이후인 직원의 이름, 봉급, 입사날짜 조회
select frist_name, last_name, salary, hire_date from employees where hire_date>=’04/01/01’


-- 논리연산자(and, or, not)
-- 부서번호가 50이면서  job_id가 sh_clerk인 직원의 이름, job_id, 부서id 조회
select last_name,  first_name job_id, departments_id from employees where department_id=50 and job_id=’SH_CLERK’;

-- 부서아이디가 50이거나 매니저 id가 100인 직원 이름, 부서id 조회
select last_name, first_name, departments_id from employees where department_id=50 or manager_id=100’;

-- 부서 id가 50이 아닌 직원이 이름과 부서id 조회(3가지 방법이상)
select first_name, last_name, department_id from employees where not(department_id=50);

select first_name, last_name, department_id from employees where not department_id != 50;

select first_name, last_name, department_id from employees where not department_id ^= 50;

select first_name, last_name, department_id from employees where not department_id <> 50;

-- 급여가 4000~8000 사이의 직원 이름과 급여 조회
select first_name, last_name, salary from employees where salary between 4000 and 8000;
select first_name, last_name, salary from employees where salary>=4000 and salary<=8000;

-- 급여가 6500, 7700, 13000인 직원 이름과 급여 조회 
select first_name, last_name, salary from employees where salary=6500 or salary=7700 or salary=13000;
select first_name, last_name, salary from employees where salary in(6500,7700,13000);

-- first name이 D로 시작하는 사원을 조회
select first_name, last_name from employees where first_name like 'D%';

-- first name이 d로 끝나는 사원을 조회
select first_name, last_name from employees where first_name like '%d';

-- first name중 앞에서 세번째 글자가 a인 사원을 조회
select first_name, last_name from employees where first_name like '__a%';

-- 보너스가 없는 사원 조회
select first_name, last_name, commission_pct from employees where commission_pct is null;

-- 보너스 받는 사원 조회
select first_name, last_name, commission_pct from employees where commission_pct is not null;

/* 오름차순 정렬(ascending sort)생략가능 , 내림차순(descending sort) 정렬*/
select phone_number, salary from employees where salary>=9000 order by employee_id asc;


