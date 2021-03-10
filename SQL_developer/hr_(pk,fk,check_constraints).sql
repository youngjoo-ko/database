/*
    기본키(primary key) 테이블 생성시 기본키 만들기
*/

create table primary_test(
    student_id number(10) primary key, --인라인 방식(뒤에 바로 적어주는 것)
    name varchar2(20)
);

insert into primary_test 
values('',''); -- 에러. primary key는 null 허용X

insert into primary_test 
values(1212,''); -- 가능

insert into primary_test 
values(1212,''); -- 에러. primary key는 중복 허용X

-- [문제] primary_test2 테이블에 기본키를 아웃라인 방식으로 설정하세요
-- (컬럼: student_id, name)
create table primary_test2(
    student_id number(10),
    name varchar2(20),
    constraint student_pk primary key(student_id) -- 아웃라인 방식
    -- 아웃라인방식으로 하는 이유는, 
    -- 제약조건명, 기본키명을 만들 수 있기 때문에 나중에 컨트롤할 수가 있다. 
    -- alter를 통해서 삭제할 수도 있다.
);

select * from primary_test2;

-- 생성을 기본키 없이 하고, 나중에 기본키 추가하기
create table primary_test3(
    student_id number(10),
    name varchar2(20)
);

-- 위의 테이블에 기본키를 추가하세요.
alter table primary_test3
add constraint student_pk2 primary key(student_id);
-- add constraint 제약조건명(기본키명) primary key(필드명);
-- 제약조건명이 다른 테이블에서 쓰이고 있는 이름이면 쓸 수 없다. 중복이 안되나봄.

/* 외래키 제약조건 */
-- 인라인 방식
-- 필드명 constraint 제약조건명(외래키명) references 부모테이블(부모테이블의 참조키필드명)
create table fk_test(
    department_id constraint dept_fk
    references departments(department_id) -- 인라인 방식
    --외래키를 지정할 때는 어느 테이블의 어느 속성값을 참조 하겠다고 지정을 해줘야 한다.
    --참조하는 것이기 때문에 데이터타입이 따로 필요없다.
);

select department_id from departments;

insert into fk_test values(100); -- 가능
insert into fk_test values(300); -- 위배. 부모테이블의 참조키의 300이라는 값이 없어서
select * from fk_test;

-- 아웃라인 방식으로 fk_test2 만들기
-- constraint 제약조건명 foreign key(여기서만든필드명) references 참조테이블(참조키명)
create table fk_test2(
    department_id,
    constraint dept_fk2 
    foreign key(department_id) 
    references departments(department_id) --아웃라인방식
);

-- 테이블을 생성하고 나서 외래키 지정하기
desc departments;
create table fk_test3(
    department_id number(4)
    -- 이 때는 데이터타입을 써줘야하는데, 이때는 department_id의 데이터타입과 맞춰주는 것이 좋다.
    -- 근데 거의 이렇게 안쓰고, 인라인 아웃라인 방식만 쓰기 때문에
    -- 교수님도 여기 부분 정확히 몰랐음. 그만큼 정말 안쓰는 방식이라서 그런거 같음.
);

alter table fk_test3
add constraint dept_fk3 foreign key(department_id)
references departments(department_id);



/* check 제약 조건 */
create table check_test(
    gender varchar2(10) not null,
    constraint chk_gender check(gender in('M','F'))
);

create table check_test2(
    gender varchar2(10) not null,
    constraint chk_gender2 check(gender in('남','여'))
);

insert into check_test values('남'); -- 체크 제약조건 위배
insert into check_test values('M'); -- 제대로된 삽입
select * from check_test;

create table student(
    stu_id number(10),
    name varchar2(20),
    age number,
    birthday date,
    regDate date default sysdate
);

-- check 제약조건을 이용한 나이의 유효성 검사
alter table student
add constraint age_chk
check(round((regDate - birthday)/365) = age);
-- 365로 나눠서 1년단위로 만들어주고 소수점자리는 반올림 해줌.

select * from student;
insert into student(stu_id, name, age, birthday) values(489018,'김하영',20,'1996-01-18');
--> 체크 제약조건 위배 
insert into student(stu_id, name, age, birthday) values(489018,'김하영',25,'1996-01-18');
-- 정상적으로 삽입됨.

/*
만약에 테이블을 생성하고, 체크제약조건을 주기 전에 값을 넣어둔 경우에 
유효성 검사에 맞지 않는 값이 이미 들어가 있는 경우에는 체크 제약조건을 걸 수 없다.
*/
