-- 실습 10-22 EMP 테이블을 복사해서 EMP_TEMP2 테이블 만들기
CREATE TABLE EMP_TEMP2
    AS SELECT * FROM EMP;
    
SELECT * FROM EMP_TEMP2;

-- 실습 10-23 WHERE절을 사용하여 데이터 일부분만 삭제하기
DELETE FROM EMP_TEMP2
WHERE JOB = 'MANAGER';

SELECT * FROM EMP_TEMP2;

-- 실습 10-24 WHERE절에 서브쿼리를 사용하여 데이터 일부만 삭제하기
DELETE FROM EMP_TEMP2
    WHERE EMPNO IN (SELECT E.EMPNO
                        FROM EMP_TEMP2 E, SALGRADE S
                        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                        AND S.GRADE = 3
                        AND DEPTNO = 30);
                        
-- 1분 복습. EMP_TEMP 테이블에서 급여가 3000 이상인 사원을 삭제하는 다음 코드를 채워 보세요.
DELETE FROM EMP_TEMP
WHERE SAL>=3000;

-- 실습 10-25 테이블에 있는 전체 데이터 삭제하기
DELETE FROM EMP_TEMP2;

SELECT * FROM EMP_TEMP2;
