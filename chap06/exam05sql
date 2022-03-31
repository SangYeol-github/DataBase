-- 실습 6-45 NVL 함수를 사용하여 출력하기
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
        NVL(COMM, 0),
        SAL+NVL(COMM, 0)
FROM EMP;

-- 실습 6-46 NVL2 함수를 사용하여 출력하기
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
        NVL2(COMM, 'O', 'X'),
        NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
FROM EMP;

-- 실습 6-47 DECODE 함수를 사용하여 출력하기
SELECT EMPNO, ENAME, JOB, SAL,
        DECODE(JOB,
                'MANAGER', SAL*1.1,
                'SALESMAN', SAL*1.05,
                'ANALYST', SAL,
                SAL*1.03) AS UPSAL
FROM EMP;

-- 실습 6-48 CASE문을 사용하여 출력하기
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS UPSAL
FROM EMP;

-- 실습 6-49 열 값에 따라서 출력 값이 달라지는 CASE문
SELECT EMPNO, ENAME, COMM,
    CASE
    WHEN COMM IS NULL THEN '해당사항 없음'
    WHEN COMM = 0 THEN '수당없음'
    WHEN COMM > 0 THEN '수당 : ' || COMM
    END AS COMM_TEXT
FROM EMP;
