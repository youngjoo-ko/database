/*날짜 관련 함수*/

-- sysdate() ; 현재 시스템의 날짜
select sysdate from dual;


-- months_between(a,b) : a날짜 - b날짜를 구함
select months_between(sysdate, '2020/01/01') from dual;


-- last_day() : 지정한 날짜에서 해당 월의 마지막 날짜를 구함
select last_day(sysdate) from dual;
-- 부서id 50인 사원들의 근무 개월 수 파악
select first_name, months_between(sysdate, hire_date) from employees where department_id=50;
-- 아까 문자열 함수는 다른 필드랑 같이 갖고오는게 힘들었는데 이건 왜 가능이지?


-- add_monshs() : 현재 달로부터 지정한 달을 더한 날짜를 구함
select add_months(sysdate, 7) from dual;


-- next_day(기준날짜, '찾을요일') : 기준 날짜 이후에 가장 가까운 해당 요일의 날짜를 구함
-- 1~7(일~토) 으로 표시 가능
select next_day(sysdate, '일요일') "다음 일요일" from dual;
select next_day(sysdate-8, '일요일') "이전 일요일" from dual;
select next_day(sysdate, 1) "다음 일요일" from dual;


-- to_char(날짜, '날짜를 바꿔줄 문자열의 형태' )
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'yy-mm-dd') from dual;


/* to_date() : 문자를 날짜, 시간 형식으로 바꿔주는 함수*/
select to_date('20200814', 'yyyy-mm-dd') from dual; -- 이렇게 하면 형식이 안바뀜 이유는? 오라클의 환경변수 땜에


-- 오라클의 환경변수 조회
select * from v$nls_parameters; -- date format이 yy/mm/dd 로 되어있음

-- 날짜 형식을 세션된 상태(연결된 상태)에서만 적용하는 방법(alter 사용)
alter session set nls_date_format = 'yyyy-mm-dd';

select to_char(sysdate, 'hh24:mi:ss') from dual;
select to_date('20201111123022', 'yyyy-mm-dd-hh24-mi-ss') from dual;

-- case() : elseif문과 같은 역할을 하는 함수
select first_name, department_id, 
    case when department_id=20 then '마케팅부'
         when department_id=60 then '전산실'
         when department_id=90 then '전략기획실'
         else ''
         end "부서명"
from employees;
         
         

