import sqlite3

# db 생성(또는 이미 있는 db 파일과 연결)
conn = sqlite3.connect('./db_resource/database.db')

# 커서 생성(바인딩)
c = conn.cursor()

# 데이터 조회
users = c.execute('select * from users')

# 조회한 여러개의 행(row)을 가져오기 위한 함수들
# fetchone() : row 한줄 가져오기
# print('first: \n', c.fetchone()) 
# fetchmany() : 지정한 숫자만큼의 row들을 리스트객체로 반환함
# print('second: \n', c.fetchmany(size=3)) 
# fetchall() : 데이터베이스의 모든 row를 리스트객체로 반환
# print('all: \n', c.fetchall()) # 이전에 수행한 명령의 다음으로 커서가 놓이기 때문에 5번줄만 가져옴
# many 와 all은 결과값이 1개라도 리스트에 담아 반환한다

# 반복문 사용해서 row 확인하기 1
# rows = c.fetchall()
# for row in rows:
#     print('조회', row)

# 반복문 사용해서 row 확인하기 2 (객체를 만들지 않고도 가능, 커서의 위치 주의!)
# for row in c.fetchall():
#     print('조회' , row)

# 반복문 사용해서 row 확인하기 3 (모든 데이터 가져오는 쿼리문 바로 사용하기)
# for row in c.execute('select * from users order by id desc'):
#     print('조회' , row)

# where 패턴 1
# 튜플 객체 만들기
param1 = (2,) 
# 아이디가 2 인 데이터 가져오기
c.execute('select * from users where id = ?', param1)
print(c.fetchone())
# 테이블에 id 가 2인 데이터가 하나이므로, 위에서 하나의 row를 찾아오면 그 다음엔 결과값이 없다
print(c.fetchall()) # 빈 [] 를 돌려줌

# where 패턴 2
# 아이디가 3 인 데이터 가져오기
param2 = 3 
# 포맷 활용
# c.execute('select * from users where id = "%s"' %param2)
# 위 코드 f스트링으로 바꿀 수 있음(이 패턴에서만 적용됨)
c.execute(f'select * from users where id = {param2}')
print(c.fetchone())
print(c.fetchall()) 

# where 패턴 3
# 아이디가 4 인 데이터 가져오기
c.execute('select * from users where id =:id', {'id' :4})
print(c.fetchone())
print(c.fetchall()) 

# where 패턴 4
# 아이디가 2,5 인 데이터 가져오기
param3 = (2,5)
c.execute('select * from users where id in(?,?)', param3)
# print(c.fetchone()) # 2개 이기 때문에 사용 x
print(c.fetchall())

# where 패턴 5
# 아이디가 3,4 인 데이터 가져오기
c.execute("select * from users where id in('%d','%d')" %(3,4))
print(c.fetchall())

# where 패턴 6
# 아이디가 2,5 인 데이터 가져오기
c.execute("select * from users where id=:id1 or id=:id2", {'id1':2, 'id2':5})
print(c.fetchall())

# dump 출력(덤프 파일 만들기)
# a 서버(mysql 사용)에 있는 데이터를 b 서버(sql)로 옮기고 싶을 때 쓰는 방식
with conn:
    with open('./db_resource/dump.sql', 'w') as f:
        for line in conn.iterdump(): # conn 객체에 있는 iterdump 함수: conn 데이터를 순회하면서 명령문을 하나씩 가져옴
            f.write('%s\n' % line)
        print('dump 완성!!!')

# conn.close()

