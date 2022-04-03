-- 실습 9-6 IN 연산자 사용하기
SELECT * FROM EMP
WHERE DEPTNO IN (20, 30);

-- 실습 9-7 각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력하기
SELECT * FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO);
                
-- 실습 9-8 부서 번호 별로 최대 급여 출력하기
SELECT MAX(SAL) FROM EMP
GROUP BY DEPTNO;

-- 실습 9-9 ANY 연산자 사용하기
SELECT * FROM EMP
WHERE SAL = ANY(SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);
                    
-- 실습 9-10 SOME 연산자 사용하기
SELECT * FROM EMP
WHERE SAL = SOME(SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);
                    
-- 실습 9-11 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 정보 출력하기
SELECT * FROM EMP
WHERE SAL < ANY(SELECT SAL
                    FROM EMP
                    WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

-- 실습 9-12 부서 번호가 30인 사원들의 급여 출력하기
SELECT SAL FROM EMP
WHERE DEPTNO = 30;

-- 실습 9-13 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력하기
SELECT * FROM EMP
WHERE SAL > ANY(SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30);
                
-- 실습 9-14 부서 번호가 30번인 사원들의 최소 급여보다 더 적은 급여를 받는 사원 출력하기
SELECT * FROM EMP
WHERE SAL < ALL (SELECT SAL
                    FROM EMP
                    WHERE DEPTNO = 30);
                    
 -- 실습 9-15 부서 번호가 30번인 사원들의 최대 급여보다 더 적은 급여를 받는 사원 출력하기
SELECT * FROM EMP
WHERE SAL > ALL (SELECT SAL
                    FROM EMP
                    WHERE DEPTNO = 30);
                    
-- 실습 9-16 서브쿼리 결과 값이 존재하는 경우
SELECT * FROM EMP
WHERE EXISTS (SELECT DNAME
                FROM DEPT
                WHERE DEPTNO = 10);
                
 -- 실습 9-17 서브쿼리 결과 값이 존재하지 않는 경우
SELECT * FROM EMP
WHERE EXISTS (SELECT DNAME
                FROM DEPT
                WHERE DEPTNO = 50); 
                
-- 1분 복습. 서브쿼리를 이용하여 EMP 테이블의 사원 중에 10번 부서에 속한 모든 사원들보다 일찍 입사한 사원 정보를 구하도록 코드를 채워 보세요.
SELECT * FROM EMP
WHERE HIREDATE < ALL (SELECT HIREDATE
                            FROM EMP
                            WHERE DEPTNO = 10);