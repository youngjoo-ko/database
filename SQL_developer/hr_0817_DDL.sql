/* DDL(Data Definition Language) : 데이터 정의어
    : Create문, Alter(변경: add(추가), modify(수정), drop(삭제)), Drop문, Truncate문
*/

desc employees;

-- 테이블 생성
create table employees2(
    employee_id number(10), -- 최대 10개의 숫자
    name varchar2(20), --최대 20글자
    salary number(7,2) -- 7자리 숫자가 들어가는데 소수점 2자리 포함
);

desc employees2;

-- 똑같은 구조로 새로운 테이블을 만들 때
create table employees3
as
select * from employees2;

desc employees3;

-- 새로 만든 employees3에 새로운 속성(필드)을 추가하고 싶을 때
-- 컬럼 추가
alter table employees3 add(
    manager_id varchar2(20)
);

-- 속성을 수정하고 싶을 때
-- 컬럼 수정
alter table employees3 modify(
    manager_id varchar2(10)
);

-- 속성을 삭제할 때는 alter과 drop 함께 사용.
-- 삭제하는 거 drop 뭐를 삭제할건지 뒤에 column 붙여주면 된다. 
-- drop column 속성명
-- 컬럼 삭제
alter table employees3 drop column manager_id;

-- 테이블 구조를 완전히 삭제
drop table employees3;

desc employees2;

-- 구조는 남아있지만, 레코드(튜플)가 지워짐.
truncate table employees2;

/*
    drop은 아예 테이블을 삭제하는 것. 
    truncate는 테이블은 놔두고 그 안의 레코드들(튜플들)을 삭제하는 것.
*/

