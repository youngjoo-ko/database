import sqlite3
import datetime

# 날짜 생성하기
now = datetime.datetime.now()
print('현재시간: ' , now)

# 위 결과는 보기 어려우니까 보기쉬운 문자열 형식으로 포맷해보자
now2 = now.strftime('%Y-%m-%d %H:%M:%S')
print('현재시간: ', now2) # 시:분:초는 대문자로 해야함


# SQLITE3 버전확인
print('sqllite versoin: ', sqlite3.version)

# DB 생성 & atuo commit 설정(자동으로 데이터베이스에 영구저장을 설정, 학습하기 편하도록)
# conn = sqlite3.connect('db가 생성될 위치', ''), conn은 db에 연결되어 있는 객체
conn = sqlite3.connect('./SQLite/db_resource/database.db', isolation_level = None)
# isolation_level = None 을 넣어주면 자동 커밋 설정 완료

# cursor 생성(연결, 바인딩) : db 파일 객체에 데이터를 저장할 수 있도록 커서를 놔주는 것
c = conn.cursor() 
print('type: ', type(c))

# 테이블 생성
# data type : text, numeric, integer, real(실수), blob

# 커서의 함수 execute() : 괄호안의 쿼리문을 디비엔진(sqlite)으로 날려주어 명령을 수행하게 함
c.execute("CREATE TABLE IF NOT EXISTS users(id integer primary key, username text, email text, tel text, website text, reg_date text)")
    

# 데이터 삽입(튜플)
# c.execute("insert into users values(1, 'kim', 'test3@naver.com','010-2222-2333','www.test.com', ?)", (now2,))

# executemany를 이용한 삽입(리스트)
user_list = (
    (1, 'choi', 'eee00@google.com', '010-8968-0022', 'www.choi.com', now2),
    (2, 'lee', 'test@google.com', '010-7978-2222', 'www.lee.com', now2),
    (3, 'joo', 'ara@google.com', '010-8888-1010', 'www.joo.com', now2),
    (4, 'ko', 'didi@google.com', '010-4558-2222', 'www.ko.com', now2),
    (5, 'kang', 'ooyy@google.com', '010-5560-2622', 'www.kang.com', now2),
)

c.executemany("insert into users(id, username, email, tel, website, reg_date) values(?,?,?,?,?,?)", user_list)

# 테이블 전체 데이터 삭제
# conn.execute('delete from users')

# 삭제한 레코드의 개수를 확인하는 함수
# print('users db delete: ', conn.execute('delete from users').rowcount, '행')


# commit : isolation_level = None 일 경우 자동 커밋
# 자동 커밋 설정 안한 경우에는 conn.commit() 명령으로 DB에 저장해줘야 함
# 롤백 명령어 사용 : conn.rollback()

# 접속 해제하기
conn.close()
