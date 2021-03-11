

import sqlite3
import os

conn = sqlite3.connect('./db_resource/test.db', isolation_level=None)
cur = conn.cursor()
cur.execute('create table if not exists student_info(학번 integer primary key, 이름 text, 전화번호 text, 주소 text, 성적입력여부 text)')
cur.execute('create table if not exists student(학번 integer primary key, 운영체제 integer check (운영체제>=0 and 운영체제<=100) , \
    컴퓨터비전 integer check (컴퓨터비전>=0 and 컴퓨터비전<=100) , \
    데이터베이스 integer check (데이터베이스>=0 and 데이터베이스<=100), \
    FOREIGN KEY(학번) REFERENCES student_info(학번))')

def clear():
    os.system('cls')

def menu_1():
    print()
    print()
    print('<입력정보>')
    s_number = int(input('학번 입력(4자리 숫자): '))
    s_name = input('이름 입력: ')
    s_p_number = input('전화번호 입력(010-xxxx-xxxx): ')
    s_adr = input('주소 입력(도시만 입력 > 인천):')
    s_info = [s_number, s_name, s_p_number, s_adr,'미입력']
    cur.execute("insert into student_info(학번, 이름, 전화번호, 주소,성적입력여부) values(?,?,?,?,?)", s_info)
    cur.execute("INSERT INTO student VALUES(?, ?, ?, ?)", (s_number,None,None,None))
    print()
    print('학생 정보 입력 성공!')


def menu_2():
    print()
    print()
    # cur.execute("CREATE VIEW if not exists stu_join(학번, 이름, 전화번호, 주소, 성적입력여부)\
    # AS\
    # SELECT info.학번, info.이름, info.전화번호, info.주소, stu.운영체제\
    # FROM student stu, student_info info\
    # WHERE info.학번 = stu.학번")
    # rows = cur.execute("SELECT 학번, 이름, 전화번호, 주소, CASE when 성적입력여부 is Null THEN '미입력' ELSE '입력완료' END FROM stu_join").fetchall()

    print("""
----------------------------------------------------
학번     이름     전화번호      주소    성적입력 여부
----------------------------------------------------
    """) 
    
    rows = cur.execute("select * from student_info").fetchall()
    # print(rows)
    for row in rows:
        print(f'{row[0]}\t{row[1]}\t{row[2]}\t{row[3]}\t{row[4]}')
    s_cnt = len(conn.execute('select * from student_info').fetchall())
    print()
    print('전체 학생수: ', s_cnt, '명')

    

def menu_3():
    print("""
--------------------------------
        학생 성적 입력
--------------------------------
    """)
    s_number = int(input('학번 검색: '))
    chk_number = cur.execute(f'select 학번 from student_info where 학번={s_number}')
    # print(chk_number)
    if chk_number == None:
        print('존재하지 않는 학생입니다')
    else:
        for row in cur.execute(f'select * from student_info where 학번={s_number}'):
            print(f'{row[0]}\t{row[1]}\t{row[2]}\t{row[3]}\t{row[4]}')
            if row[4] == '미입력':
                os = int(input('운영체제:'))
                cv = int(input('컴퓨터비전:'))
                db = int(input('데이터베이스:'))
                # s_score = [s_number, os, cv, db]
                cur.execute(f"update student set 운영체제={os}, 컴퓨터비전={cv}, 데이터베이스={db} where 학번=?", (s_number,))
                cur.execute("update student_info set 성적입력여부='입력완료' where 학번=?", (s_number,))

                print('성적 입력 성공!!!')



def menu_4():
    print("""
----------------------------------------------------------------------
학번   이름   운영체제 컴퓨터비전   데이터베이스       총점     평균
-----------------------------------------------------------------------
    """)
    cur.execute('create view IF NOT EXISTS v_score(학번, 이름, 운영체제, 컴퓨터비전, 데이터베이스, 총점, 평균)\
        as select i.학번, i.이름, s.운영체제, s.컴퓨터비전, s.데이터베이스,(s.운영체제 + s.컴퓨터비전 + s.데이터베이스),\
        round(avg(s.운영체제 + s.컴퓨터비전 + s.데이터베이스),2) from student_info i, student s where i.학번 = s.학번')
    rows = cur.execute('select * from v_score')
    # print(s_list)
    for row in rows:
         print(f'{row[0]}  {row[1]}\t{row[2]}\t {row[3]}\t\t{row[4]}\t\t{row[5]}   \t{row[6]}')

        # # 방법 1
        # sum_score = sum(li[2:5])
        # avg_score = round(sum_score/3,2)
    s_cnt = len(conn.execute('select * from student_info').fetchall())
        # print(f'{li[0]}  {li[1]}\t{li[2]}\t {li[3]}\t\t{li[4]}\t  {sum_score}\t  {avg_score}')
    print()
    print('전체 학생수: ', s_cnt , '명')

        # # 방법2
        # sum_score = sum(li[2:5])
        # avg_score = round(sum_score/3,2)
        # i = 0
        # while i < 5:
        #     print(li[i], end='\t')
        #     i += 1
        # print(f'{sum_score}  {avg_score}')
    #     print()
    # print('전체 학생수: ', s_cnt , '명')



option = '''
------------------------------------
     학사관리 시스템
------------------------------------
1. 학생 정보 입력
2. 학생 정보 출력
3. 학생 성적 입력
4. 학생 성적 출력
x. 프로그램 종료
------------------------------------
'''



def run():
    while True:
        print()
        print()
        print(option)
        a = input('메뉴 선택: ')
        if a == '1':
            menu_1()
        elif a == '2':
            menu_2()
        elif a == '3':
            menu_3()
        elif a == '4':
            menu_4()
        elif a == 'x':
            print()
            print("---------------프로그램이 종료되었습니다---------------")
            break
        else:
            print()
            print("!!!입력오류!!! 1~4까지 숫자를 입력하세요")


if __name__ == '__main__':
    clear()
    run()

# # menu_1()
# menu_2()
# # menu_3()
# # menu_4()
