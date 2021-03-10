/*
    DML(Data Manipulation Language) : 데이터 조작어
    select문, delete문, insert문, update문
    데이터조회, 데이터삭제, 데이터삽입, 데이터수정
    
    --select 형식
    select 컬럼1, 컬럼2, ...
    from 테이블1, 테이블2, ...
    where 컬럼1=조건1, 컬럼2=조건2, ..., 조건들;
    (group by, having, order by)
    
    --insert 형식
    // 테이블의 레코드(row, tuple)을 입력하는 명령어
    insert into 테이블명(컬럼1,컬럼2,...)
    values(값1, 값2, ...);
    
    --insert문 주의할 점! 
    컬럼1=값1, 컬럼2=값2, ... 이렇게 짝지어지는 것이기 때문에
    컬럼 갯수와 값의 갯수가 동일해야함
    값을 넣을 때는 각 컬럼의 데이터타입과 일치해야 한다.
    
    --update 형식
    update 테이블명 set 수정할 컬럼1=값1, 수정할 컬럼2=값2, ...
    where 조건들;
    -> 어떤 조건일 때 값을 바꿔야하기 때문에 update에는 where절 필요
    
    --delete 형식
    // 테이블의 레코드(row, tuple)를 삭제
    delete from 테이블명
    where 조건;
    -> 막 다 지울 수 없기 때문에, delete도 where절 필요
*/

-- [문제] sample 테이블 아래 컬럼 구조로 만드세요.
-- 부서번호(depNo), 부서명(depName), 부서위치(depLoc), 부서매니저(depMgr)
create table sample(
    depNo number(20),
    depName varchar2(20),
    depLoc varchar2(20),
    depMgr varchar2(10)
);
desc sample;

-- [문제] 위의 sample 테이블에 값을 넣어보세요.
insert into sample values(100, 'IT', 'incheon', 'kim');
-- 어짜피 모든 속성값을 넣을 거면 속성명을 다 안적어주고 생략해도 된다.
select * from sample;

insert into sample(depNo, depName, depLoc, depMgr) 
values(100, '기획실','서울','홍길동'); -- varchar2 타입은 '' 이용(""은 안 됨)

/*
    오라클 데이터 타입(DataType)
    : 컬럼에 저장되는 데이터의 형식(유형)
    종류: 문자형, 숫자형, 날짜(시간), LOB(Large Object 큰데이터)
    
    --문자형 데이터
    char(n) : 고정길이 문자(max: 2000byte, default: 1byte) 
    varchar2(n) : 가변길이 문자(max: 4000byte, default: 1byte) 
    nchar(n) : 고정길이(유니코드(다국어가능))(max: 2000byte, default: 1byte) 
    nvarchar : 가변길이(유니코드(다국어가능))(max: 2000byte, default: 1byte) 
    long : 가변길이(max: 2GB, default: 1byte) 
    
    --고정길이 vs 가변길이
    char(10) <- abc를 넣으면 7이 남지만 10자리 차지
    varchar2(10) <- abc를 넣으면 7이 남고, 넣은 만큼 3자리만 차지
    
    --숫자형 데이터(대부분 number를 사용)
    number(p, s): p(전체 자리수), s(소수점 이하 자리)(max: 22btye)
                  가변 숫자(p, s를 입력하지 않으면 자동으로 조절)
    float(p) : number의 서브타입(max: 22btye) -거의쓰지않음.그냥있다정도만참고
    binary_float : 32비트 부동 소수점(max: 4btye)
    binary_double : 64비트 부동 소수점(좀더 정밀하게 나타낼 때)(max: 8btye)
    
    --날짜 데이터(일반적으로 date 타입을 많이 사용)
    date : 날짜와 시간(년/월/일/시/분/초)
    timestamp : 연/월/일/시/분/초/밀리초
    
    --LOB 타입(대용량 저장 타입)(주로 clob, blob 많이 사용)
    clob : 문자 대용량 객체를 저장할 때
    nclob : 대용량 유니코드 문자형 저장할 때
    blob : 이진 대용량 객체를 저장할 때(이미지, 동영상, 사운드..)
    bfile : 대용량 이진파일의 위치, 이름을 저장할 때
    
    
    바이너리타입의 이미지, 동영상, 사운드 같은거는 비정형 데이터
    데이터베이스에 있는 데이터들은 필드별로 정리가 되어있기 때문에 정형 데이터
    
*/

-- [문제] book 테이블을 생성하여 레코드를 입력하세요.
-- 컬럼 구조: 책코드, 책제목, 책저자, 책출간일
create table book(
    bCode number(10),
    title varchar2(50),
    writer varchar2(10),
    pubDate date
);

select * from book;

-- 모든 컬럼값을 입력할 때는 컬럼명 생략가능
insert into book values(100,'파이썬을 쉽게 활용','홍길동','2020/03/03');
--date타입 - '20200303'해도 되고, '2020-03-03'해도 되고, '2020/03/03'해도 됨.

-- 현재 테이블은 제약조건이 없기 때문에 모든 속성이 null 값이 허용된다.
-- null 값 넣기
insert into book
values(200,'java',null,'2019-11-11');

insert into book
values(202, '','','2020-08-01');

insert into book
values(300, 'c언어', '김길동', '2019-11-11');

-- [문제] 300번 코드의 책제목을 '데이터분석'으로 변경하세요.(update문 활용)
update book set title='데이터분석' where bCode=300;

-- [문제] java 책정보를 지우세요.
delete from book where title='java';

select * from book;

-- [문제] 책정보를 모두 지우세요. (delete문, truncate문 활용)
delete book; -- delete 활용
truncate table book; -- truncate 활용


select * from sample;
-- 레코드 추가
insert into sample
values(200,'영업부','인천','김상사');
insert into sample
values(300,'IT부서','부산','김길남');

commit; 

/*
오라클에서는 commit : 데이터베이스에 반영시키는 명령어
데이터를 update문을 사용해서 수정했다고 했을 때
수정한 데이터가 실제로는 데이터베이스에 반영이 안됨.
autocommit 을 해놓으면 자동으로 반영이 되는데 
보통은 false로 되어 있을 것(안정성 면에서는 자동저장 위험함)
autocommit이 아니기 때문에 commit명령을 내려야 그때 데이터베이스에 반영이 된다.

rollback
commit시점으로 돌아가는 것.
commit한 다음에 A명령을 했다고 할 때, A명령을 반영시키려면 commit
반영시키지 않으려면 rollback 
rollback을 하면 마지막으로 commit한 후의 명령들은 반영이 안됨.

commit, rollback 개념은 transaction에서 많이 사용
트랜잭션(transaction) - 여러 개의 작업 (여러개의 공정을 하나로 한다)
A라는 트랜잭션이 a-1,a-2,a-3 프로세스로 이루어져 있을때,
3개의 프로세스가 모두 끝나야지만 A트랜잭션(전체과정)이 끝날 수 있다.
a-2에서 오류가 나면 rollback 해서 다시 처음부터 해서 모두 오류가 없어야 과정이 끝날 수 있다.
예금계좌 이런걸로 예시를 많이 든다.
A계좌, B계좌 있다고 할 때
A계좌 -> B계좌로 1000만원을 입금하고, 
B계좌에는 1000만원이 들어오면 트랙잭션이 끝났다고 할 수 있다.

이 때, A계좌 -> B계좌로 1000만원을 보냈는데, 
중간에 네트워크 문제로 B계좌에서는 돈을 못 받았다.
그런데 A계좌에서는 1000만원이 나갔고, 돈이 공중으로 사라진거면 안되니까 
하나의 트랜잭션으로 묶어야 한다. 돈을 보내고 입금된거 확인하는거까지 하나의 트랜잭션
A계좌에서 돈을 보내고 B계좌에서 못받으면 다시 rollback 받았으면 commit
그런식으로 사용되고, commit과 rollback은 아주 중요한 개념이다.
*/

-- [문제] IT부서의 위치를 광주로 바꿔보세요.
update sample set deploc='광주' where depname='IT부서';

select * from sample; -- IT부서의 위치 : 광주
rollback;
select * from sample; -- IT부서의 위치 : 부산
--바뀌게 하고 싶으면 업데이트 하고 commit 해주기
update sample set deploc='광주' where depname='IT부서';
commit;

-- 레코드를 입력하는 시점의 날짜를 넣고 싶을 때(sysdate 이용)
insert into book(bcode,title,writer,pubdate)
values(201, 'C#','김C', sysdate);
select * from book;
--sysdate 회원가입할 때 자주 사용

create table itBook(
    bCode number(10),
    title varchar2(20),
    author varchar2(10),
    publisher varchar2(20),
    pubDate date default sysdate
);

insert into itBook(bcode, title, author, publisher) 
values(101,'python 기초','jh','jh출판사');

select * from itBook;

-- [문제] 아래의 구조로 member 테이블을 만들고 회원정보를 추가하세요.
-- 이름, 아이디, 비밀번호, 나이, 가입일자
create table member(
    name varchar2(20),
    id varchar2(10),
    pw varchar2(10),
    age number(3),
    joinDate date default sysdate
);

insert into member(name, id, pw, age) 
values('홍길동','hong','test1234',23);

select * from member;

/*
지금은 수동으로 값을 넣어주지만,
실제로는 웹어플리케이션에서 회원가입을 할 때 입력폼들을 작성할텐데
그 입력폼에 작성된 값을 바로 데이터베이스에 넣어주는 것이다.

웹프레임워크로 flask(파이썬기반웹프레임워크), jango 등등이 있는데
jango 프레임워크를 나중에 사용해볼텐데 처음부터 이걸 하지 않는 이유는
처음부터 사용하면 웹 로직을 정확히 이해하지 못하고 쉬운방법만 배우는 거라서
폼부터 만들고, 차근차근 데이터들을 어떻게 주고받는지, 천천히 순서대로 할 것. (flask 이용해서)
jango=spring같은 느낌
spring도 jsp를 모르면서 하는 것도 문제. jsp부터 차근차근 배우고 그 뒤에 spring 하는 것.
python을 어느정도 배워놨으니까 파이썬기반인 flask먼저 배우고 시간 남으면 jango할 것
*/

insert into member(name, id, pw, age) 
values('홍길동','hong','test1234',23);

insert into member(name, id, pw, age) 
values('','','',23);
-- 현재는 동일한 값이 들어가기도 하고, 이름에도 null이 들어가는데
-- 회원정보는 같은게 있을 수 없고, null값도 들어오면 안되기 때문에 제약조건 이용해줘야 한다.
-- 제약조건 : 데이터 무결성(데이터정확성, 데이터일관성)을 가능하게 해주는 것.