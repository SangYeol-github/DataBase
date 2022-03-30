-- Q1. EMP 테이블을 사용하여 다음과 같이 사원 이름(ENAME)이 S로 끝나는 사원 데이터를 모두 출력하는
-- SQL문을 작성해보세요.
SELECT * FROM EMP
WHERE ENAME LIKE '%S';

-- Q2. EMP 테이블을 사용하여 30번부서(DEPTNO)에서 근무하고 있는 사우너 중에 직책(JOB)이
-- SALESMAN인 사원의 사원 번호, 이름, 직책, 급여, 부서 번호를 출력하는 SQL문을 작성해 보세요.
SELECT * FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- Q3. EMP 테이블을 사용하여 20번, 30번 부서에 근무하고 있는 사원 중 급여(SAL)가 2000 초과인
-- 사원을 다음 두 가지 방식의 SELECT문을 사용하여 사원 번호, 이름, 급여, 부서번호를 출력하는
-- SQL문을 작성해 보세요.
-- 집합 연산자를 사용하지 않은 방식
-- 집합 연산자를 사용한 방식

-- 집합 연산자를 사용하지 않은 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30)
AND SAL > 2000;

-- 집합 연산자를 사용한 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20
AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND SAL > 2000;

-- Q4. 이번에는 NOT BETWEEN AND B 연산자를 쓰지 않고, 급여(SAL) 열 값이 2000이하 3000 이상
-- 범위 이외의 값을 가진 데이터만 출력하도록 SQL문을 작성해보세요.

SELECT * FROM EMP
WHERE SAL <2000
OR SAL >3000;

