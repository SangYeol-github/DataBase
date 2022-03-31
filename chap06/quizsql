-- Q1. 다음과 같은 결과가 나오도록 SQL문을 작성해보세요.
-- EMPNO 열에는 EMP 테이블에서 사원 이름(ENAME)이 다섯 글자 이상이며 여섯 글자 미만인 사원 정보를 출력합니다.
-- MASKING_EMPNO 열에는 사원번호(EMPNO) 앞 두 자리 외 뒷자리를 * 기호로 출력합니다.
-- 그리고 MASKING_ENAME 열에는 사원 이름의 첫 글자만 보여 주고 나머지 글자 수만큼 * 기호로 출력하세요.

SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1,2), 4, '*') AS MASKING_EMPNO,
        ENAME, RPAD(SUBSTR(ENAME, 1,1), LENGTH(ENAME), '*') AS MASKING_EMPNO
FROM EMP;

-- Q2. 다음과 같은 결과가 나오도록 SQL문을 작성해보세요.
-- EMP 테이블에서 사원들의 월 평균 근무일 수는 21.5일입니다. 하루 근무 시간을 8시간으로 보았을때
-- 사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)을 계산하여 결과를 출력합니다.
-- 단 하루 급여는 소수점 세 번째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림하세요.
SELECT EMPNO, ENAME, SAL,
        TRUNC(SAL/21.5,2) AS DAY_PAY, 
        ROUND(SAL/21.5/8, 1) AS TIME_PAY
FROM EMP;

-- Q3. 오른쪽과 같은 결과가 나오도록 SQL문을 작성해 보세요.
-- EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 됩니다.
-- 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 오른쪽과 같이 출력해주세요.
-- 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하세요.
SELECT EMPNO, ENAME, HIREDATE, 
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'),'YYYY-MM-DD') AS R_JOB,
    NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

-- Q4. 오른쪽과 같은 결과가 나오도록 SQL문을 작성해보세요.
-- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은
-- 조건을 기준으로 변환해서 CHG_MGR 열에 출력하세요.
-- 직속 상관의 사원번호가 존재하지 않을 경우 : 0000
-- 직속 상관의 사원번호 앞 두 자리가 75 일 경우 : 5555
-- 직속 상관의 사원번호 앞 두 자리가 76 일 경우 : 6666
-- 직속 상관의 사원번호 앞 두 자리가 77 일 경우 : 7777
-- 직속 상관의 사원번호 앞 두 자리가 78 일 경우 : 8888
-- 그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원 번호 그대로 출력

SELECT EMPNO, ENAME, MGR,
        CASE
            WHEN MGR IS NULL THEN '0000'
            WHEN SUBSTR(MGR, 1,2) = '75' THEN '5555'
            WHEN SUBSTR(MGR, 1,2) = '76' THEN '6666'
            WHEN SUBSTR(MGR, 1,2) = '77' THEN '7777'
            WHEN SUBSTR(MGR, 1,2) = '78' THEN '8888'
            ELSE TO_CHAR(MGR)
        END AS CHG_MGR
FROM EMP;        
