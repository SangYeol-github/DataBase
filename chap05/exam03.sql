-- 실습 5-5 곱셈 산술 연산자를 사용한 예
SELECT * FROM EMP
WHERE SAL * 12 = 36000;

-- 실습 5-6 대소 비교 연산자를 사용하여 출력하기
SELECT * FROM EMP
WHERE SAL >= 3000;

-- 1분 복습. 다음 SQL문의 결과로 급여가 2500 이상이고 직업이 ANALYST인 사원 정보만 나오도록 코드를 채워 보세요.
SELECT * FROM EMP
WHERE SAL >= 2500
AND JOB = 'ANALYST';

-- 실습 5-7 문자를 대소 비교 연산자로 비교하기(비교 문자열이 문자 하나일 때)
SELECT * FROM EMP
WHERE ENAME >= 'F';

-- 실습 5-8 문자열을 대소 비교 연산자로 비교하기(비교 문자열이 문자 여러 개일 때)
SELECT * FROM EMP
WHERE ENAME <='FORZ';

-- 실습 5-9 등가 비교 연산자(!=)를 사용하여 출력하기
SELECT * FROM EMP
WHERE SAL != 3000;

-- 실습 5-10 등가 비교 연산자(<>)를 사용하여 출력하기
SELECT * FROM EMP
WHERE SAL <> 3000;

-- 실습 5-11 등가 비교 연산자 (^=)를 사용하여 출력하기
SELECT * FROM EMP
WHERE SAL ^= 3000;

-- 실습 5-12 NOT 연산자를 사용하여 출력하기
SELECT * FROM EMP
WHERE NOT SAL = 3000;

-- 실습 5-13 OR 연산자를 사용하여 여러 개 조건을 만족하는 데이터 출력하기
SELECT * FROM EMP
WHERE JOB = 'MANAGER'
OR JOB = 'SALEMAN'
OR JOB = 'CLERK';

-- 실습 5-14 IN 연산자를 사용하여 출력하기
SELECT * FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

-- 실습 5-15 등가 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT * FROM EMP
WHERE JOB != 'MANAGER'
AND JOB <> 'SALESMAN'
AND JOB ^= 'CLERK';

-- 실습 5-16 IN 연산자와 논리 부정 연산자를 사용하여 출력하기
SELECT * FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- 1분 복습. IN 연산자를 사용하여 다음 SQL문의 결과로 부서 번호가 10, 20번인 사원 정보만 나오도록 코드를 채워 보세요.
SELECT * FROM EMP
WHERE DEPTNO IN (10, 20);

-- 실습 5-17 대소 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT * FROM EMP
WHERE SAL >= 2000
AND SAL <=3000;