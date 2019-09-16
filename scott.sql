SELECT TABLE_NAME
FROM USER_TABLES;

CREATE TABLE STUDENT(
STU_NO CHAR(9),
STU_NAME VARCHAR2(12),
STU_DEPT VARCHAR2(20),
STU_GRADE NUMBER(1),
STU_CLASS CHAR(1),
STU_GENDER CHAR(1),
STU_HEIGHT NUMBER(5, 2),
STU_WEIGHT NUMBER(5, 2),
CONSTRAINT P_STU_NO PRIMARY KEY (STU_NO));
DESC STUDENT;

CREATE TABLE SUBJECT(
SUB_NO CHAR(3),
SUB_NAME VARCHAR2(30),
SUB_PROF VARCHAR2(12),
SUB_GRADE NUMBER(1),
SUB_DEPT VARCHAR(20),
CONSTRAINT P_SUB_NO PRIMARY KEY(SUB_NO));

CREATE TABLE ENROL(
SUB_NO CHAR(3),
STU_NO CHAR(9),
ENR_GRADE NUMBER(3),
CONSTRAINT P_COURSE PRIMARY KEY(SUB_NO,STU_NO));

insert into STUDENT values(20153075, '옥한빛', '기계', '1', 'C', 'M', 177, 80);
insert into STUDENT values(20153088, '이태연', '기계', '1', 'C', 'F', 162, 50);
insert into STUDENT values(20143054, '유가인', '기계', '2', 'F', 'C', 154, 47);
insert into STUDENT values(20152088, '조민우', '전기전자', '1', 'C', 'M', 188, 90);
insert into STUDENT values(20142021, '심수정', '전기전자', '2', 'A', 'F', 168, 45);
insert into STUDENT values(20132003, '박희철', '전기전자', '3', 'B', 'M', null, 63);
insert into STUDENT values(20151062, '김인중', '컴퓨터정보', '1', 'B', 'M', 166, 67);
insert into STUDENT values(20141007, '진현무', '컴퓨터정보', '2', 'A', 'M', 174, 64);
insert into STUDENT values(20131001, '김종헌', '컴퓨터정보', '3', 'C', 'M', null, 72);
insert into STUDENT values(20131025, '옥성우', '컴퓨터정보', '3', 'A', 'F', 172, 63);


INSERT INTO SUBJECT VALUES('111','데이터베이스','이재영','2','컴퓨터정보');
INSERT INTO SUBJECT VALUES('110','자동제어','정순정','2','전기전자');
INSERT INTO SUBJECT VALUES('109','자동화설계','박민영','3','기계');
INSERT INTO SUBJECT VALUES('101','컴퓨터개론','강종영','3','컴퓨터정보');
INSERT INTO SUBJECT VALUES('102','기계공작법','김태영','1','기계');
INSERT INTO SUBJECT VALUES('103','기초전자실험','김유석','2','전기전자');
INSERT INTO SUBJECT VALUES('104','시스템분석설계','강석현','2','컴퓨터정보');
INSERT INTO SUBJECT VALUES('105','기계요소설계','김명성','2','기계');
INSERT INTO SUBJECT VALUES('106','전자회로실험','최영민','2','전기전자');
INSERT INTO SUBJECT VALUES('107','CAD응용실습','구봉규','2','기계');
INSERT INTO SUBJECT VALUES('108','소프트웨어공학','권민성','2','컴퓨터정보');

INSERT INTO ENROL VALUES('101','20131001',80);
INSERT INTO ENROL VALUES('104','20131001',56);
INSERT INTO ENROL VALUES('106','20132003',72);
INSERT INTO ENROL VALUES('103','20152088',45);
INSERT INTO ENROL VALUES('101','20131025',65);
INSERT INTO ENROL VALUES('104','20131025',65);
INSERT INTO ENROL VALUES('108','20151062',81);
INSERT INTO ENROL VALUES('107','20143054',41);
INSERT INTO ENROL VALUES('102','20153075',66);
INSERT INTO ENROL VALUES('105','20153075',56);
INSERT INTO ENROL VALUES('102','20153088',61);
INSERT INTO ENROL VALUES('105','20153088',78);


SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;
SELECT * FROM ENROL;

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

DROP TABLE BUY;

DESC STUDENT;

SELECT STU_NO, STU_NAME
FROM STUDENT;

SELECT STU_DEPT
FROM STUDENT;

SELECT DISTINCT STU_DEPT
FROM STUDENT;

SELECT DISTINCT STU_GRADE, STU_CLASS
FROM STUDENT;

SELECT STU_NO, SUB_NO, ENR_GRADE, ENR_GRADE+10
FROM ENROL;


SELECT STU_NO AS ID, STU_NAME AS NAME
FROM STUDENT;

SELECT STU_DEPT ||'과'|| STU_NAME ||'입니다' AS 학과성명
FROM STUDENT;

SELECT STU_DEPT ||','|| STU_NAME ||'입니다' AS 학과성명
FROM STUDENT;

SELECT STU_NAME, STU_DEPT, STU_GRADE, STU_CLASS
FROM STUDENT
WHERE STU_DEPT ='컴퓨터정보' AND STU_GRADE = 2;


SELECT *
FROM STUDENT
WHERE STU_HEIGHT BETWEEN 170 AND 180;

SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2014%';

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NAME LIKE '_수%';

SELECT STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL;

SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
ORDER BY STU_NO DESC;

SELECT STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT-5 AS TARGET
FROM STUDENT
ORDER BY STU_NAME, TARGET;

SELECT ROUND(345.689), ROUND(345.678, 0),
ROUND(345.678, 1), ROUND(345.678, 1)
FROM DUAL;

SELECT CEIL(3.1), CEIL(-3.1),FLOOR(3.1),FLOOR(-3.1),
ABS(-10), MOD(10, 3)
FROM DUAL;

SELECT LOWER('ABCDEFG')
FROM DUAL;

SELECT INITCAP('ABCDEFG')
FROM DUAL;
SELECT CONCAT(STU_NAME, STU_NO)
FROM STUDENT;

SELECT SUBSTR('ABCDEFG',2,3)
FROM DUAL;

SELECT LENGTH('ABCD')
FROM DUAL;

SELECT ENAME, INSTR(ENAME, 'A',2,1)
FROM EMP;

SELECT LPAD(ENAME, 10, '%')
FROM EMP;
SELECT RPAD(ENAME, 10, '$')
FROM EMP; 

SELECT TO_CHAR(SYSDATE+1, 'YYYY-MM-DD')
FROM DUAL;

SELECT HIREDATE
FROM EMP;

SELECT MONTHS_BETWEEN (SYSDATE, HIREDATE)
FROM EMP;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

