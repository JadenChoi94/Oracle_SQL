--4장 연습문제
SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;


--2번
SELECT STUDENT.STU_NO, STU_NAME, SUBJECT.SUB_NAME, SUB_GRADE
FROM STUDENT, SUBJECT
WHERE STUDENT.STU_DEPT = SUBJECT.SUB_DEPT
ORDER BY 1;

--4번
SELECT SUB_NAME, STU_NO, SUB_GRADE
FROM SUBJECT JOIN STUDENT USING(SUB_DEPT);