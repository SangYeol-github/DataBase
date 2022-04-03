-- 실습 9-1 사원 이름이 JONES인 사원의 급여 출력하기
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

-- 실습 9-2 급여가 2975보다 높은 사원 정보 출력하기
SELECT * FROM EMP
WHERE SAL > 2975;

-- 실습 9-3 서브쿼리로 JONES의 급여보다 높은 급여를 받는 사원 정보 출력하기
SELECT * FROM EMP
WHERE SAL > ( SELECT SAL
                FROM EMP
                    WHERE ENAME = 'JONES');
                    
-- 1분 복습. 서브쿼리를 사용하여 EMP 테이블의 사원 정보 중에서 사원 이름이 ALLEN인 사원의 추가 수당보다 많은 추가 수당을 받는 사원 정보를 구하도록
-- 다음 코드를 채워보세요.
SELECT * FROM EMP
WHERE COMM > (SELECT COMM
                FROM EMP
                    WHERE ENAME = 'ALLEN');
                    