-- 실습 7-1 SUM 함수를 사용하여 급여 합계 출력하기
SELECT SUM(SAL)
FROM EMP;

-- 실습 7-2 SUM 함수를 사용하여 사원 이름과 급여 합계 출력하기
SELECT ENAME, SUM(SAL)
FROM EMP;

-- 실습 7-3 추가 수당 합계 구하기
SELECT SUM(COMM)
FROM EMP;

-- 실습 7-4 급여 합계 구하기(DISTINCT, ALL 사용)
SELECT SUM(DISTINCT SAL),
        SUM(ALL SAL),
        SUM(SAL)
FROM EMP;

-- 1분 복습. EMP 테이블의 모든 사원들에 대해서 급여와 추가 수당의 합계를 구하도록
-- 다음 SQL문의 빈칸을 채워보세요.
SELECT SUM(SAL), SUM(COMM)
FROM EMP;

-- 실습 7-5 EMP 테이블의 데이터 개수 출력하기
SELECT COUNT(*)
FROM EMP;

-- 실습 7-6 부서 번호가 30번인 직원 수 구하기
SELECT COUNT(*) FROM EMP
WHERE DEPTNO = 30;

-- 실습 7-7 COUNT 함수를 사용하기 급여 개수 구하기(DISTINCT, ALL 사용)
SELECT COUNT(DISTINCT SAL),
        COUNT(ALL SAL),
        COUNT(SAL)
FROM EMP;

-- 실습 7-8 COUNT 함수를 사용하여 추가 수당 열 개수 출력하기
SELECT COUNT(COMM)
FROM EMP;

-- 실습 7-9 COUNT 함수와 IS NOT NULL을 사용하여 추가 수당 열 개수 출력하기
SELECT COUNT(COMM)
FROM EMP
WHERE COMM IS NOT NULL;

-- 실습 7-10 부서 번호가 10번인 사원들의 최대 급여 출력하기
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

-- 실습 7-11 부서 번호가 10번인 사원들의 최소 급여 출력하기
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO = 10;

-- 실습 7-12 부서 번호가 20인 사원의 입사일 중 제일 최근 입사일 출력하기
SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

-- 실습 7-13 부서 번호가 20인 사원의 입사일 중 제일 오래된 입사일 출력하기
SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

-- 실습 7-14 부서 번호가 30인 사원들의 평균 급여 출력하기
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = 30;

-- 실습 7-15 DISTINCT로 중복을 제거한 급여 열의 평균 급여 구하기
SELECT AVG(DISTINCT SAL)
FROM EMP
WHERE DEPTNO = 30;

-- 1분 복습. 부서 번호가 30인 사원들의 평균 추가 수당을 출력하도록 다음 SQL문의 빈칸을 채워보세요.
SELECT AVG(COMM)
FROM EMP
WHERE DEPTNO = 30;