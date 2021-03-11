BEGIN TRANSACTION;
CREATE TABLE users(id integer primary key, username text, email text, tel text, website text, reg_date text);
INSERT INTO "users" VALUES(1,'choi','eee00@google.com','010-8968-0022','www.choi.com','2020-08-18 17:25:00');
INSERT INTO "users" VALUES(2,'lee','test@google.com','010-7978-2222','www.lee.com','2020-08-18 17:25:00');
INSERT INTO "users" VALUES(3,'joo','ara@google.com','010-8888-1010','www.joo.com','2020-08-18 17:25:00');
INSERT INTO "users" VALUES(4,'ko','didi@google.com','010-4558-2222','www.ko.com','2020-08-18 17:25:00');
INSERT INTO "users" VALUES(5,'kang','ooyy@google.com','010-5560-2622','www.kang.com','2020-08-18 17:25:00');
COMMIT;
