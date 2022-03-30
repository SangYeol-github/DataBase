-- 실습 4-9 열에 연산식을 사용하여 출력하기
SELECT ENAME, SAL, SAL*12+COMM, COMM
FROM EMP;

-- 실습 4-10 곱하기를 사용하지 않고 사원의 연간 총 수입 출력하기
SELECT ENAME, SAL, SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+COMM, COMM
FROM EMP;

-- 실습 4-11 별칭을 사용하여 사우너의 연간 총 수입 출력하기
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;