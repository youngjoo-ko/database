import sqlite3

# ==========================================================================

conn = sqlite3.connect('./resource/s_database.db', isolation_level = None)
c = conn.cursor()
c.execute("CREATE TABLE IF NOT EXISTS student(id INTEGER PRIMARY KEY, subject1 INTEGER, subject2 INTEGER, subject3 INTEGER)")
c.execute("CREATE TABLE IF NOT EXISTS student_info(id INTEGER PRIMARY KEY, name TEXT, tel TEXT, address TEXT)")

# ==========================================================================


class Student:
    def __init__(self, id, subject1, subject2, subject3):
        self.id = id
        self.subject1 = subject1
        self.subject2 = subject2
        self.subject3 = subject3



class Student_info:
    def __init__(self, id, name, tel, address):
        self.id = id
        self.name = name
        self.tel = tel
        self.address = address




def run():
    while 1:
        menu_num = menu_display()
        if menu_num == '1':
            Student_info() = set_student_info()
            
        elif menu_num == '2':
            print_student_info()
            
        elif menu_num == '3':
            Student() = set_student()

        elif menu_num == '4':
            print_student()
 
        elif menu_num == 'X':
            print("프로그램 종료")
            break



def set_student():
    c.execute("CREATE VIEW stu_join(id, name, tel, address, score)\
    AS\
    SELECT info.id, info.name, info.tel, info.address, stu.subject1\
    FROM student stu, student_info info\
    WHERE stu.id = info.id")

    id = input('학번 검색 :')

    c.execute(f"SELECT id, name, tel, address, CASE when score IS NULL THEN '미입력' ELSE '입력완료' END\
    FROM stu_join where id = {id}")
    rows = c.fetchall()
    for row in rows:
        print(row[0], row[1], row[2], row[3], row[4])
        if row[4] == '미입력':
            subject1 = input('운영체제 :')
            subject2 = input('컴퓨터비전 :')
            subject3 = input('데이터베이스 :')
            c.execute(f"UPDATE student SET subject1 = {subject1}, subject2 = {subject2}, subject3 = {subject3}\
            where id = {id}")
            print('성적입력 완료')
            break
    else:
        print('존재하지 않는 학번입니다.')
    c.execute("drop view stu_join")



def print_student():
    c.execute("CREATE VIEW stu_join(id, 이름, 운영체제, 컴퓨터비전, 데이터베이스, 총점, 평균)\
        AS SELECT stu.id, info.name, stu.subject1, stu.subject2, stu.subject3,\
            stu.subject1 + stu.subject2 + stu.subject3, (stu.subject1 + stu.subject2 + stu.subject3)/3\
                FROM student stu, student_info info\
                    WHERE stu.id = info.id ")
    
    c.execute("SELECT * FROM stu_join")
    
    rows = c.fetchall()
    print('---------------------------------------------------')
    print('  학번   이름   운영체제  컴퓨터비전 데이터베이스 총점')
    print('---------------------------------------------------')
    for row in rows:
        print(row[0], row[1], row[2], row[3], row[4], row[5], row[6])

    print('전체학생수 : ', len(list(rows)),'명')

    c.execute("drop view stu_join")

def set_student_info():
    id = input('학번 :')
    name = input('이름 :')
    tel = input('전화번호 :')
    address = input('주소 :')
    print()
    student_info = Student_info(id, name, tel, address)
    c.execute("INSERT INTO student_info VALUES(?,?,?,?)",(id, name, tel, address))
    c.execute("INSERT INTO student VALUES(?,?,?,?)",(id, None, None, None))
    print('정보입력 완료!')
    return student_info


def print_student_info():
    c.execute("CREATE VIEW stu_info_join(id, name, tel, address, score)\
    AS\
    SELECT stu.id, info.name, info.tel, info.address, stu.subject1\
    FROM student stu, student_info info\
    WHERE stu.id = info.id")

    c.execute("SELECT id, name, tel, address, CASE when score IS NULL THEN '미입력' ELSE '입력완료' END FROM stu_info_join")

    print('------------------------------------------')
    print('  학번    이름      번호    주소 입력여부 ')
    print('------------------------------------------')

    rows = c.fetchall()
    for row in rows:
        print(row[0], row[1], row[2], row[3], row[4])

    print('전체학생수 : ', len(list(rows)),'명')
    c.execute("drop view stu_info_join")  


def menu_display():
    print('-----------------------------------------')
    print('             학사관리 시스템')
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
    run()