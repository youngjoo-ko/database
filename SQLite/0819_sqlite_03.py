


import sqlite3
conn = sqlite3.connect('./db_resource/database.db')
cur = conn.cursor()


# 테이블 데이터 수정 1 (튜플 형태로)
# cur.execute('update users set username = ? where id = ?', ('cho', 3))
# conn.commit()

# 테이블 데이터 수정 2 (딕셔너리 형태로)
# cur.execute('update users set username =:name where id =:id', {'name': 'kim' , 'id' : 5})
# conn.commit()

# 테이블 데이터 수정 3 (포맷 형식으로)
# cur.execute('update users set username = "%s" where id ="%s"' %('hong', 4))
# cur.execute(f"update users set username = '{'yang'}' where id ={4}")
# conn.commit()

# 테이블 데이터 삭제 
# 2번 레코드 삭제
# cur.execute("delete from users where id = ?", (2,))
# conn.commit()

# 5번 레코드 삭제(딕셔너리 형식으로 지우기)
# cur.execute("delete from users where id =:id", {'id' : 5})
# conn.commit()

# 4번 레코드 삭제(포맷 형식)
# cur.execute("delete from users where id ='%d'" %4)
# conn.commit()

# [문제1] 데이터 확인
# cur.execute('select * from users')
# print(cur.fetchall())

# [문제2] 남은 데이터 모두 삭제하고 삭제한 행 수 출력
print(conn.execute('delete from users').rowcount, '행')
conn.commit()