-- 실습 8-1 FROM 절에 여러 테이블 선언하기
SELECT * FROM EMP, DEPT
ORDER BY EMPNO;

-- 실습 8-2 열 이름을 비교하는 조건식으로 조인하기
SELECT * FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;

-- 실습 8-3 테이블 이름을 별칭으로 표현하기
SELECT * FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- 1분 복습. EMP 테이블 별칭을 E로, DEPT 테이블 별칭을 D로 하여 EMP 테이블의 사원 번호와
-- DEPT 테이블의 부서 이름이 출력되도록 다음 SQP문 코드를 채워보세요.
SELECT * FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;