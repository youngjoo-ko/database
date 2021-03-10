/* 문자열 함수*/
-- concat(str1, str2) : 두 문자열 합쳐주는 함수
select concat('Hello', 'bye'), concat('good', 'night') from dual;
select concat('Hello', 'bye'), 'good' || 'night' from dual; -- concat 대신 버티컬라인 2개로 대체 가능

-- initcap(str) 첫 글자를 대문자로 바꿔주는 함수
select initcap('good morning') from dual; -- 중간에 구분자가 /,\,| 있으면,이후 나오는 단어의 첫글자도 대문자로 표현함
select initcap('good/morning hello') from dual;
select initcap('good|morning hello') from dual;

-- lower(), upper() 함수
select lower('GOOD'), upper('good') from dual;

-- LPAD(), RPAD() 함수 : 왼쪽에 padding, 오른쪽에 padding 값을 주는 함수
select lpad('good', 6, '+') lpad1, lpad('good', 12, '$') lpad2 from dual; -- 영문은 1바이트씩 계산됨
select rpad('홍길동', 9, '+') rpad1 from dual; -- 한글은 2바이트씩 계산됨

-- ltrim(), rtrim() 함수 : 왼쪽/오른쪽에서 부터 문자 지워주는 함수
-- 중간 문자만 지울 수 없음
-- 문자열에 중복된 문자는 모두 지워줌
select ltrim('goodbye', 'g'), ltrim('goodbye', 'o'), ltrim('goodbye', 'go') from dual;
select rtrim('goodbye', 'e'), rtrim('goodbye', 'odbye') from dual;

-- trim() : 공백제거
select length('  good  ') from dual; -- 문자열 길이 구하기
select trim('  good  ') from dual;

-- substr() 함수 : 문자 가져오는 함수
-- 8번째 문자부터 4개 가져옴(1부터 시작함)
select substr('good morning john', 8, 4) from dual; 
-- 8번째 문자부터 모두 가져옴
select substr('good morning john', 8) from dual; 
-- 뒤에서부터 4글자 가져옴
select substr('good morning john', -4) from dual; 
-- 뒤에서 4번째 글자에서 2글자 가져옴
select substr('good morning john', -4, 2) from dual; 
-- 아무것도 가져오지 않음
select substr('good morning john', -4, 0) from dual; 



-- replace() 함수 : 문자 또는 문자열 교 체
-- replace(교체하고 싶은 문자열, 교체될 문자 지정, 교체할 문자열)
select replace('good morning', 'morning', 'evening') from dual;


-- instr() : 문자열의 위치값을 찾는 함수???????
-- instr(대상 문자열, 찾을 글자, 시작 위치, 몇번째)
-- 문자열의 1번째부터 시작해서 문자 ‘o’를 찾아라
select instr('good morning john', 'o', 1) from dual;
/* 1번째자리에서 즉, 'g'에서부터 'o'를 찾아나갈거다.
    근데 2번째자리에 'o'가 있기 때문에 바로 2를 검색해 오는 것.
    
    옵션에 1이 아니라 4였다면,
    4 즉, 'd'에서부터 'o'를 찾아 나가는 것.
    그래서 'd' 뒤에 있는 'morning'에 'o'가 있기 때문에 
    그 'o'의 자리값을 검색해온다. =7
    이 때, 검색시작위치가 4번째인것 뿐이지, 문자열의 위치값은 'd'에서부터 시작하는게 X
    
    그래서 4번째 'o'가 있는 'john'에 있는 'o'를 찾아오고 싶은거면
    세번째 'o'자리 = 7이니까 8 이상을 옵션값으로 넣어줘야 4번째 'o'를 찾을 수 있다.
    
    근데 이렇게하면 너무 힘드니까 
    instr('good morning john','o',1,4) 이것을 이용
    문자열에서 'o'를 찾을 건데, 1번째='g'에서 검색을 시작해서 4번째 'o'가 있는
    위치값을 바로 반환해준다.
    */
    

select instr('good morning john', 'o', 1, 4) from dual;
-- 세번째 ‘n’의 위치값
select instr('good morning john', 'n', 1, 3) from dual;


-- nvl() : null 값을 다른 데이터로 변경하는 함수
select first_name, nvl(commission_pct, 0) commission from employees;


