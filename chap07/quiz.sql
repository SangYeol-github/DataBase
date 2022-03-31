-- Q1. 다음과 같은 결과가 나오도록 SQL문을 작성해보세요.
-- EMP 테이블을 이용하여 부서 번호(DEPTNO), 평균 급여(AVG_SAL), 최고 급여(MAX_SAL), 최저 급여(MIN_SAL),
-- 사원 수(CNT)를 출력합니다. 단 평균 급여를 출력할 때 소수점을 제외하고 각 부서 번호별로 출력하세요.

SELECT DEPTNO,
    TRUNC(AVG(SAL)) AS AVG_SAL,
    MAX(SAL) AS MAX_SAL,
    MIN(SAL) AS MIN_SAL,
    COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;

-- Q2. 다음과 같은 결과가 나오도록 SQL 문을 작성해보세요.
-- 같은 직책(JOB)에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하세요.
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- Q3. 다음과 같은 결과가 나오도록 SQL문을 작성해보세요.
-- 사원들의 입사 연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는지 출력하세요.
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

-- Q4. 다음과 같은 결과가 나오도록 SQL문을 작성해보세요. 추가 수당(COMM)을 받는 사원 수와
-- 받지 않는 사원수를 출력하세요.
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
        COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

-- Q5. 다음과 같은 결과가 나오도록 SQL문을 작성해보세요. 각 부서의 입사 연도별 사원 수,
-- 최고 급여, 급여 합, 평균 급여를 출력하고 각 부서별 소계와 총계를 출력하세요.
SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, COUNT(*) AS CNT,
            MAX(SAL) AS MAX_SAL,
            SUM(SAL) AS SUM_SAL,
            AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));

