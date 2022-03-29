-- 실습 4-6 DISTINCT로 열의 중복 제거하기
SELECT DISTINCT DEPTNO FROM EMP;

-- 실습 4-7 여러 개 열을 명시하여 중복 제거하기
SELECT DISTINCT JOB, DEPTNO FROM EMP;

-- 실습 4-8 직책, 부서 번호 출력하기(ALL사용)
SELECT ALL JOB, DEPTNO FROM EMP;

