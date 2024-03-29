SELECT TABLE_NAME
FROM USER_TABLES;
SELECT * FROM STUDENT;
SELECT * FROM ENROL;

SELECT STUDENT.*, ENROL.*
FROM STUDENT
CROSS JOIN ENROL;

DESC STUDENT;
DESC ENROL;

SELECT STUDENT.STU_NO, STU_NAME, STU_DEPT,STU_GRADE
FROM STUDENT, ENROL
WHERE STUDENT.STU_NO=ENROL.STU_NO;

SELECT STU_NO, STU_NAME,STU_DEPT, ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL;

SELECT STU_NO, STU_NAME,STU_DEPT, ENR_GRADE
FROM STUDENT JOIN ENROL USING(STU_NO);

SELECT STUDENT.STU_NO, STU_NAME,STU_DEPT, ENR_GRADE
FROM STUDENT JOIN ENROL ON STUDENT.STU_NO=ENROL.STU_NO;

SELECT STUDENT.STU_NO, STU_NAME
FROM STUDENT, ENROL
WHERE STUDENT.STU_NO=ENROL.STU_NO
AND SUB_NO=101;

SELECT STUDENT.STU_NO, STU_NAME
FROM STUDENT, ENROL
WHERE STUDENT.STU_NO=ENROL.STU_NO
AND SUB_NO=101 OR SUB_NO=102;

SELECT STUDENT.STU_NO, STU_NAME
FROM STUDENT, ENROL
WHERE STUDENT.STU_NO=ENROL.STU_NO
AND (SUB_NO=101 OR SUB_NO=102);

SELECT STU_NO, STU_NAME
FROM STUDENT NATURAL JOIN ENROL
WHERE SUB_NO=101 OR SUB_NO=102;

SELECT STU_NO, STU_NAME
FROM STUDENT JOIN ENROL USING(STU_NO)
WHERE SUB_NO=101 OR SUB_NO=102;

SELECT STUDENT.STU_NO, STU_NAME
FROM STUDENT JOIN ENROL ON STUDENT.STU_NO = ENROL.STU_NO
WHERE SUB_NO=101 OR SUB_NO=102;

SELECT STUDENT.STU_NO, STU_NAME, SUB_NAME
FROM STUDENT, ENROL, SUBJECT
WHERE STUDENT.STU_NO=ENROL.STU_NO
AND ENROL.SUB_NO = SUBJECT.SUB_NO
AND ENROL.SUB_NO = 101;

SELECT EMPNO, ENAME, SAL, GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;

SELECT * FROM EMP;

--SELF 조인
SELECT A.EMPNO AS 사원번호, A.ENAME AS 사원이름,
B.EMPNO AS 상급자사원번호, B.ENAME AS 상급자이름
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO;

SELECT A.EMPNO AS 사원번호, A.ENAME AS 사원이름, B.EMPNO AS 상급자사원번호, B.ENAME AS 상급자이름
FROM EMP A JOIN EMP B
ON A.MGR = B.EMPNO;

--OUTER 조인
SELECT A.*, SUB_NAME
FROM ENROL A, SUBJECT B
WHERE A.SUB_NO = B.SUB_NO
ORDER BY 1;

SELECT A.*, SUB_NAME
FROM ENROL A RIGHT OUTER JOIN SUBJECT B
ON A.SUB_NO = B.SUB_NO
ORDER BY 1;

--131PAGE
SELECT A.EMPNO AS 사원번호, A.ENAME AS 상급자이름,






