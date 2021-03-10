/*
    무결성 제약조건(constraints)
    : DB에 들어 있는 데이터의 정확성(일관성)을 보장하도록
      하기 위한 제약조건을 의미함.
      즉, 부정확한 자료가 DB에 저장되는 것을 방지하도록
      하는 조건을 말한다. 
    not null : 널값이 입력되지 못하게 하는 조건
    unique : 중복된 값이 입력되지 못하는 하는 조건
             (null 값을 허용할 수 있다. 중복만 X)
    primary key(기본키) : not null + unique
                        (유일성을 보장하는 키)
    foreign key(외래키) : 다른 테이블의 필드(컬럼)를
                        참조해서 무결성을 검사하는 조건
    check : 주어진 값만 허용하는 제약조건
            (예를 들어, 성별: 남, 여 중에 하나만 허용)
            
    참조 무결성(integrity)이란?
    : 외래키 값은 참조 릴레이션(테이블)의 기본키 값과 일치해야 한다는 규정
    즉, 테이블은 참조할 수 없는 외래키 값을 가질 수 없다.
    
    자식테이블(employees)의 부서아이디는 외래키
    부모테이블(departments)의 부서아이디는 기본키(참조키)
    
    외래키는 반드시 참조키 중의 하나여야 한다.
    참조키에 없는 외래키는 있을 수 없다. 
    
*/

-- not null 제약조건
create table null_test(
    col_1 varchar2(20) not null,
    col_2 varchar2(20) null,
    col_3 varchar2(20)          -- null써도되고, 안써도되고
);

insert into null_test(col_1, col_2)
values('aa','bb');  -- col_3은 null값 허용이라서 가능

select * from null_test;

insert into null_test(col_2, col_3)
values('cc','dd');  -- col_1은 null값 허용이 안되서 오류

-- unique 제약조건
create table unique_test(
    col_1 varchar2(20) unique not null, 
    col_2 varchar2(20) unique,
    col_3 varchar2(20) not null,
    col_4 varchar2(20) not null,
    
    --아웃라인 방식
    -- constraint 제약조건명 제약조건
    constraint c_unique unique(col_3, col_4)
);

insert into unique_test
values('aa','bb','cc','dd');

insert into unique_test
values('aa','bb','cc','dd');  -- 4개 컬럼 다 unique 제약조건때문에 중복된 값 못 넣음.

insert into unique_test
values('aa1','bb1','cc1','dd1'); -- 가능

insert into unique_test
values('aa2','','cc2','dd2'); -- 가능. 
-- 1,3,4번째 컬럼은 not null 제약조건도 있지만
-- 2번째 컬럼은 unique 제약조건만 있어서 null 값 가능

update unique_test
set col_1 = 'aa'
where col_2 = 'bb1'; -- col_1컬럼에 aa값이 이미 있기 때문에 무결성제약조건 위배

select * from unique_test;

-- c_unique 제약조건을 삭제하세요. (제약조건명이 쓰이는 곳)
alter table unique_test
drop constraint c_unique;

-- col_3, col_4 컬럼에 unique 제약조건이 사라진 상태
insert into unique_test
values('aa3','bb3','cc2','dd2'); -- 오류없이 값이 들어간다.

-- 제약조건 추가
alter table unique_test
add constraint c_unique unique(col_3, col_4);
-- 중복된 데이터를 위에서 넣는 바람에 오류남.

-- 현재 중복된 레코드 2개 삭제하기
select * from unique_test;
delete from unique_test where col_3='cc2';
-- 조건에 따라서 여러개의 레코드가 한번에 삭제될 수 있다.

-- 중복된 값 지웠으니까 다시 제약조건 추가
alter table unique_test
add constraint c_unique unique(col_3, col_4);

--레코드 추가
insert into unique_test
values('aa2','','cc2','dd2');
-- null은 중복의 대상이 아님
insert into unique_test
values('aa3','','cc3','dd3');

insert into unique_test
values('aa4','','cc4','dd4');

insert into unique_test
values('aa5','','cc4','dd5');
-- 삽입 가능함.
/*
왜? col_3와 col_4를 묶어서 unique 조건을 줬기 때문에
묶어서만 같지 않으면 들어가는 것.
보통 어떨때 이런 방식을 쓰느냐
지역번호같은 거에 사용
032)ooo-oooo
032)xxx-xxxx
지역번호는 같지만 뒷부분이 다르면 2개 묶어서 보면 다른 걸로 취급이 된다.
*/
select * from unique_test;
