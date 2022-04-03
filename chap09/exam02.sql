-- 실습 9-4 서브쿼리의 결과 값이 날짜형인 경우
SELECT * FROM EMP
WHERE HIREDATE > (SELECT HIREDATE
                    FROM EMP
                        WHERE ENAME = 'SCOTT');
                        
-- 실습 9-5 서브쿼리 안에서 함수를 사용한 경우
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 20
AND E.SAL > (SELECT AVG(SAL) FROM EMP);

-- 1분 복습. 서브쿼리를 사용하여 EMP 테이블에서 전체 사원의 평균 급여보다 작거나 같은 급여를 받고 있는
-- 20번 부서의 사원 및 부서의 정보를 구하도록 코드를 채워 보세요.
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 20
AND E.SAL <= (SELECT AVG(SAL)
                FROM EMP);