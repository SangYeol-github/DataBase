-- 실습 5-1 EMP 테이블의 모든 열 출력하기
SELECT * FROM EMP;

-- 실습 5-2 부서 번호가 30인 데이터만 출력하기
SELECT * FROM EMP
WHERE DEPTNO = 30;

-- 1분 복습. 다음 SQL문의 결과로 사원 번호가 7782인 사원 정보만 나오도록 코드를 채워 보세요.
SELECT * FROM EMP WHERE EMPNO = 7782;


