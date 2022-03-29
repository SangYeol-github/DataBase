-- 실습 4-4 EMP 테이블 전체 열 조회하기
SELECT * FROM EMP;

-- 실습 4-5 열을 쉼표로 구분하여 출력하기
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- 1분 복습. 실습 4-5를 참고하여 다음 SQL문의 결과가 사원 번호와 부서 번호만 아오도록 코드를 채워보세요.
SELECT EMPNO, DEPTNO FROM EMP;