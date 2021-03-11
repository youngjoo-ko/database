import sqlite3
input()
con = sqlite3.connect('./db_resource/student.db', isolation_level= None)

c = con.cursor()

c.execute("CREATE TABLE IF NOT EXISTS student(sn INTEGER PRIMARY KEY, os INTEGER, cv INTERGER, db INTERGER)")
c.execute("CREATE TABLE IF NOT EXISTS studentinfo(sn INTEGER PRIMARY KEY, name TEXT, p_num 전화번호 TEXT, addr TEXT)")


class Student:
    def __init__(self, sn, os, cv, db):
        self.sn = sn
        self.os = os
        self.cv = cv
        self.db = db

class Student_info:
    def __init__(self, sn, name, p_num, addr): 
       self.sn = sn
       self.name = name
       self.p_num = p_num
       self.addr = addr


def main():
    while True:
        menu_num = menu_display()
        if menu_num == '1':
            student_info = write_studentinfo()

        elif menu_num == '2':
            print_student_info()

        elif menu_num == '3':
            student = write_student()

        elif menu_num == '4':
            print_student()
        
        elif menu_num == 'X':
            print("프로그램 종료")
            break


def print_student_info():
    stu_info = int(input('학번 검색 : ',))
    print('-------------------------------------------------------')
    print('   학번     이름       전화번호     주소    성적입력여부  ')
    print('-------------------------------------------------------')

    for row in c.execute('SELECT * FROM studentinfo WHERE sn=?',(stu_info,)):
        if stu_info:
            print(row)
            break
    else:
        print('존재하지 않는 학번입니다.')
            
    
def write_studentinfo():
    sn = input('학번 : ')
    name = input('이름 : ')
    p_num = input('전화번호 : ')
    addr = input('주소 : ')

    student_info = Student_info(sn, name, p_num, addr)
    c.execute("INSERT INTO studentinfo VALUES(?,?,?,?)",(sn, name, p_num, addr))
    print()
    print('학생 정보 입력 완료!!!')
    return student_info


def write_student():


    sn = input('학번 :')
    os = input('운영체제 :')
    cv = input('컴퓨터비전 :')
    db = input('데이터베이스 :')                                    
    student = Student(sn, os, cv, db)
    c.execute("INSERT INTO student VALUES(?,?,?,?)",(sn, os, cv, db))
    print()
    print('학생 성적 입력 완료!!!')
    return student


#check문?

def print_student():
    c.execute("CREATE VIEW p_stu(학번, 이름, 운영체제, 컴퓨터비전, 데이터베이스, 총점, 평균) \
        AS\
        SELECT stu.sn, info.name, stu.os, stu.cv, stu.db,\
        stu.os + stu.cv + stu.db,\
        (stu.os + stu.cv + stu.db)/3\
        FROM student stu, studentinfo info \
        WHERE stu.sn = info.sn")
    print('----------------------------------------------------------')
    print('    학번  |  이름  |운영체제|컴퓨터비전|데이터베이스|총점|평균| ')
    print('----------------------------------------------------------')
    for row1 in c.execute("SELECT * FROM p_stu"):
        print(row1)
    for row2 in c.execute("SELECT COUNT(*) FROM p_stu"):
        print('전체학생 수 : ',row2)
c.execute('DROP VIEW p_stu')

def menu_display():
    print('-----------------------------------------')
    print('             학사관리 시스템              ')
    print('-----------------------------------------')
    print('1. 학생 정보 입력')
    print('2. 학생 정보 출력')
    print('3. 학생 성적 입력')
    print('4. 학생 성적 출력')
    print('X. 프로그램 종료')
    print('-----------------------------------------')
    menu = input('메뉴 선택 : ')
    return menu

if __name__ == '__main__':
    main()
