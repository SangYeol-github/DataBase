-- 실습 5-3 AND 연산자로 여러 개의 조건식 사용하기
SELECT * FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- 1분 복습. 실습 5-3를 참고하여 다음 SQL 문의 결과로 사원 번호가 7499이고 부서 번호가 30인
-- 사원정보만 나오도록 코드를 채워 보세요.
SELECT * FROM EMP
WHERE EMPNO = 7499
AND DEPTNO = 30;

-- 실습 5-4 OR 연산자로 여러 개의 출력 조건 사용하기
SELECT * FROM EMP
WHERE DEPTNO = 30
OR JOB = 'CLERK';

-- 1분 복습. 실습 5-3를 참고하여 다음 SQL 문의 결과로 부서 번호가 20이거나 직업이
-- SALESMAN인 사원 정보만 나오도록 코드를 채워보세요.
SELECT * FROM EMP
WHERE DEPTNO = 20
OR JOB = 'SALESMAN';


