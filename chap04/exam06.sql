-- 실습 4-12 EMP 테이블의 모든 열을 급여 기준으로 오름차순 정렬하기
SELECT * FROM EMP
ORDER BY SAL;

-- 1분 복습. 실습 4-12를 참고하여 다음 SQL문의 결과가 사원 번호 기준으로 오름차순이 되도록 코드를 채워보세요.
SELECT * FROM EMP ORDER BY EMPNO;

-- 실습 4-13 EMP 테이블의 모든 열을 급여 기준으로 내림차순 정렬하기
SELECT * FROM EMP
ORDER BY SAL DESC;

-- 1분 복습. 실습 4-13를 참고하여 다음 SQL문의 결과가 사원 번호 기준으로 내름차순이 되도록 코드를 채워보세요.
SELECT * FROM EMP ORDER BY EMPNO DESC;

-- 실습 4-14 EMP 테이블의 전체 열을 부서 번호(오름차순)와 급여(내림차순)로 정렬하기
SELECT * FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;
