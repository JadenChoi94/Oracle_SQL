--6장 데이터 정의어

CREATE TABLE TEST1(
U_ID VARCHAR2(10),
U_DATE DATE);

DESC TEST1;

CREATE TABLE T_STUDENT
AS
SELECT * FROM STUDENT
WHERE STU_DEPT='기계';

SELECT * FROM T_STUDENT;

ALTER TABLE T_STUDENT
ADD (ARMY CHAR(1)); --열추가
DESC T_STUDENT;

ALTER TABLE T_STUDENT
MODIFY (ARMY NUMBER); --자료형 바꾸기
DESC T_STUDENT;

ALTER TABLE T_STUDENT
RENAME COLUMN ARMY TO TOMMY; --열이름 바꾸기

ALTER TABLE T_STUDENT
DROP (TOMMY); --열 삭제
DESC T_STUDENT;

RENAME T_STUDENT TO KK;
DESC KK; --테이블 이름 변경

TRUNCATE TABLE KK; --테이블내의 데이터 삭제, DELETE 와는 다르게 복구 안됨
SELECT * FROM KK;

DROP TABLE KK; -- 테이블삭제! 

--제약조건(CONSTRAINT)
--UNIQUE KEY
CREATE TABLE T_STUDENT(
STU_NO CHAR(9),
STU_NAME VARCHAR(12)
    CONSTRAINT U2_STU_NAME UNIQUE,
STU_DEPT VARCHAR2(20)
    CONSTRAINT N_STU_DEPT NOT NULL,
STU_GRADE NUMBER(1),
STU_CLASS CHAR(1),
STU_GENDER CHAR(1),
STU_HEIGHT NUMBER (5,2),
STU_WEIGHT NUMBER (5,2));

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='T_STUDENT';

SELECT * FROM T_STUDENT;

--PRIMARY KEY
DROP TABLE T_STUDENT;

CREATE TABLE T_STUDENT(
STU_NO CHAR(9),
STU_NAME VARCHAR(12)
    CONSTRAINT N_STU_NAME UNIQUE,
STU_DEPT VARCHAR2(20)
    CONSTRAINT N_STU_DEPT NOT NULL,
STU_GRADE NUMBER(1),
STU_CLASS CHAR(1),
STU_GENDER CHAR(1),
STU_HEIGHT NUMBER (5,2),
STU_WEIGHT NUMBER (5,2),
    CONSTRAINT P_STU_NO PRIMARY KEY(STU_NO));


CREATE TABLE T_ENROL(
SUB_NO CHAR(3),
STU_NO CHAR(9),
ENR_GRADE NUMBER(3),
CONSTRAINT P_ENOL PRIMARY KEY(SUB_NO, STU_NO));

--FOREIGN KEY
DROP TABLE T_ENROL;

CREATE TABLE T_ENROL(
SUB_NO CHAR(3),
STU_NO NUMBER(9),
ENR_GRADE NUMBER(3),
    CONSTRAINT ENR_SUB_NO_FK1 FOREIGN KEY(SUB_NO) REFERENCES SUBJECT(SUB_NO),
    CONSTRAINT ENR_STU_NO_FK1 FOREIGN KEY(STU_NO) REFERENCES STUDENT(STU_NO),
    CONSTRAINT ENR_PK1 PRIMARY KEY(SUB_NO, STU_NO));

DROP TABLE T_STUDENT;
--CHECK
CREATE TABLE T_STUDENT(
STU_NO CHAR(9),
STU_NAME VARCHAR2(12)
    CONSTRAINT U2_STU_NAME UNIQUE,
STU_DEPT VARCHAR2(20)
    CONSTRAINT N2_STU_DEPT NOT NULL,
STU_GRADE NUMBER(1),
STU_CLASS CHAR(1),
STU_GENDER CHAR(1)
    CONSTRAINT C2_STU_GENDER CHECK (STU_GENDER IN ('M','F')),
STU_HEIGHT NUMBER(5,2),
STU_WEIGHT NUMBER (5,2),
    CONSTRAINT P2_STU_NO PRIMARY KEY(STU_NO));
    
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='T_STUDENT';

--제약 조건의 확인
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='T_STUDENT';

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='T_ENROL';

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='T_ENROL';
--제약조건의 삭제
ALTER TABLE T_ENROL
DROP CONSTRAINT P_ENOL CASCADE;

--제약조건의 활성화, 비활성화
ALTER TABLE T_STUDENT
DISABLE CONSTRAINT N2_STU_DEPT;

ALTER TABLE T_STUDENT
ENABLE CONSTRAINT N2_STU_DEPT;

--VIEW
CREATE OR REPLACE VIEW V_STUDENT1
AS SELECT * FROM STUDENT WHERE STU_DEPT='컴퓨터정보';

CREATE OR REPLACE VIEW V_ENROL1
AS SELECT SUB_NAME, A.SUB_NO, STU_NO, ENR_GRADE
FROM ENROL A, SUBJECT B
WHERE A.SUB_NO = B.SUB_NO;

SELECT * FROM V_ENROL1;

SELECT STU_NO, STU_NAME, A.STU_DEPT, STU_HEIGHT
FROM STUDENT A, (SELECT STU_DEPT, AVG(STU_HEIGHT) AS AVG_HEIGHT FROM STUDENT GROUP BY STU_DEPT) B
WHERE A.STU_DEPT = B.STU_DEPT
AND A.STU_HEIGHT > B.AVG_HEIGHT;

--TOP-N 질의
SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM(SELECT STU_NO, STU_NAME, STU_HEIGHT FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL ORDER BY STU_HEIGHT DESC)
WHERE ROWNUM <=5;

--인덱스
CREATE INDEX I_STU_NAME ON STUDENT(STU_NAME);
CREATE INDEX I_STU_NO_NAME ON STUDENT(STU_NO, STU_NAME);

CREATE UNIQUE INDEX I_STU_NAME ON STUDENT(STU_NAME);

CREATE INDEX I_STU_WEIGHT ON STUDENT(STU_WEIGHT-5);

SELECT * FROM USER_INDEXES
WHERE TABLE_NAME = 'STUDENT';

DROP INDEX I_EMP_ENAME;

--시퀀스
CREATE SEQUENCE SEQ1
INCREMENT BY 2
START WITH 1000
MAXVALUE 10000;

SELECT SEQ1.NEXTVAL FROM DUAL;
RUN
SELECT SEQ1.NEXTVAL FROM DUAL;