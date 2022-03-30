-- Q1. 다음 문장의 빈칸을 채워 보세요.
-- SELECT문의 기본 구성 중 하나인 1. SELECT 절에는 조회할 열 또는 여러 열의 조합, 연산식을 지정합니다.
-- 그리고 2. FROM 절에는 조회할 데이터가 저장된 테이블 이름을 명시합니다. 만약 명시된 열 이름이
-- 너무 길다면 별도 이름을 지정할 수 있으며 이를 3. 별칭 이라고 합니다.

-- Q2. 오른쪽과 같은 결과가 나오도록 EMP 테이블의 JOB 열 데이터를 중복없이 출력해보세요.
SELECT DISTINCT JOB FROM EMP;

-- Q3. 다음의 모든 조건을 만족하는 SQL문을 작성해보세요.
-- 조건 1) 조회할 테이블은 EMP 테이블이며 모든 열을 출력합니다.
-- 조건 2) 출력되는 열의 별칭은 다음과 같습니다.
        -- EMPNO 열 -> EMPLOYEE_NO
        -- ENAME 열 -> EMPOYEE_NAME
        -- MGR 열 -> MANAGER
        -- SAL 열 -> SALARY
        -- COMM 열 -> COMMISSION
        -- DEPTNO 열 -> DEPARTMENT_NO
-- 조건 3) 부서 번호를 기준으로 내림차순으로 정렬하되 부서 번호가 같다면 사원 이름을 기준으로 오름차순으로 정렬합니다.
SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO
FROM EMP
ORDER BY DEPTNO DESC, ENAME;
