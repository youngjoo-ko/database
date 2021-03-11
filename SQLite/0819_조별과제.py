

import sqlite3

conn = sqlite3.connect('./db_resource/student_project.db', isolation_level=None)
cur = conn.cursor()
cur.execute('create table if not exists student_info(학번 integer primary key, 이름 text, 전화번호 text, 주소 text)')
cur.execute('create table if not exists student(학번 integer, 운영체제 integer not null check (운영체제>=0 and 운영체제<=100) , \
    컴퓨터비전 integer not null check (컴퓨터비전>=0 and 컴퓨터비전<=100) , \
    데이터베이스 integer not null check (데이터베이스>=0 and 데이터베이스<=100), \
    FOREIGN KEY(학번) REFERENCES student_info(학번))')



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


def menu_1():
    print()
    print()
    print('<입력정보>')
    s_number = int(input('학번 입력: '))
    s_name = input('이름 입력: ')
    s_p_number = input('전화번호 입력(010-xxxx-xxxx): ')
    s_adr = input('주소 입력(도시만 입력 > 인천):')
    s_info = [s_number, s_name, s_p_number, s_adr]
    cur.execute("insert into student_info(학번, 이름, 전화번호, 주소) values(?,?,?,?)", s_info)
    


def menu_2():
    print()
    print()
    print("""
----------------------------------------------------
학번     이름     전화번호      주소    성적입력 여부
----------------------------------------------------
    """) 
    for row in cur.execute('select * from student_info').fetchall():
        i = 0
        while i < 4:
            print(row[i], end='\t')
            i += 1

        c=[]
        chkcur = cur.execute('select 학번 from student').fetchall()
        for chk in chkcur:
            c.append(chk[0])
        if row[0] in c:
           print('입력완료')
        else:
            print('미입력')
    print('전체 학생수: ', conn.execute('select count(*) from student_info').fetchone()[0], '명')

    
        # for idx, cc in c:
        # print(list(chkcur[0]))
        # # for fet in chkcur.fetchall():
        #     if cc[idx] is in:
        #         print('미입력')
        #     else:
        #         print('입력완료')

       
        

def menu_3():
    print("""
--------------------------------
        학생 성적 입력
--------------------------------
    """)
    s_number = int(input('학번 검색: '))
    chk_number = cur.execute('select 학번 from student_info where 학번=?', (s_number,)).fetchone()
    if chk_number == None:
        print('존재하지 않는 학생입니다')
    else:
        for row in cur.execute('select * from student_info where 학번=?', (s_number,)).fetchall():
            # print(row)
            i = 0
            while i < 4:
                print(row[i], end='\t')
                i += 1
            try:
                chkcur = cur.execute('select 학번 from student where 학번=?', (s_number,)).fetchall()[0][0]
                # print(chkcur)
                if chkcur == s_number:
                    print('입력완료')
            except IndexError:
                print('미입력')
                os = int(input('운영체제:'))
                cv = int(input('컴퓨터비전:'))
                db = int(input('데이터베이스:'))
                s_score = [s_number, os, cv, db]
                cur.execute("insert into student(학번, 운영체제, 컴퓨터비전, 데이터베이스) values(?,?,?,?)", s_score)

                print('성적 입력 성공!!!')



def menu_4():
    print("""
---------------------------------------------------------------
학번   이름   운영체제 컴퓨터비전 데이터베이스 총점   평균
---------------------------------------------------------------
    """)
    # cur.execute('create view IF NOT EXISTS v_score(학번, 이름, 운영체제, 컴퓨터비전, 데이터베이스)\
    #     as select i.학번, i.이름, s.운영체제, s.컴퓨터비전, s.데이터베이스\
    #     from student_info i, student s where i.학번 = s.학번')
    s_list = cur.execute('select * from v_score').fetchall()
    # print(s_list)
    for li in s_list:
        list(li)
        i = 0
        while i < 5:
            print(li[i], end='\t')
            i += 1
        sum_score = sum(li[2:5])
        print(sum_score, end='\t')
        avg_score = sum_score / 3
        print(format(avg_score, '.2f'))
        print()
    print('전체 학생수: ', conn.execute('select count(*) from student_info').fetchone()[0], '명')

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


# # menu_1()
# menu_2()
# # menu_3()
# # menu_4()
