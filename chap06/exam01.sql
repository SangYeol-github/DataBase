-- 실습 6-1 UPPER, LOWER, INITCAP 함수 사용하기
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- 실습 6-2 UPPER 함수로 문자열 비교하기(사원 이름이 SCOTT인 데이터 찾기)
SELECT * FROM EMP
WHERE UPPER(ENAME) = UPPER('scott');

-- 실습 6-3 UPPER 함수로 문자열 비교하기(사원 이름에 SCOTT 단어를 포함한 데이터 찾기)
SELECT * FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%scott%');

-- 1분 복습. 사원 이름이 대문자로 출력되도록 코드를 채워보세요.
SELECT UPPER(ENAME)
FROM EMP;

-- 실습 6-4 선택한 열의 문자열 길이 구하기
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- 실습 6-5 사원 이름의 길이가 5이상인 행 출력하기
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

-- 실습 6-6 LENGTH 함수와 LENGTHB 함수 비교하기
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL;

-- 1분 복습. 직책 이름이 6글자 이상인 데이터만 출력되도록 코드를 채워 보세요.
SELECT * FROM EMP
WHERE LENGTH(JOB) >= 6;

-- 실습 6-7 SUBSTR 함수를 사용하는 예
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

-- 1분 복습 SUBSTR 함수를 사용하여 EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력되도록
-- 코드를 채워보세요
SELECT SUBSTR(ENAME,3)
FROM EMP;

-- 실습 6-8 SUBSTR 함수 안에 다른 함수(LENGTH) 함께 사용하기
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB),2),
    SUBSTR(JOB, -3)
FROM EMP;

-- 실습 6-9 INSTR 함수로 문자열 데이터에서 특정 문자열 찾기
SELECT  INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
        INSTR('HELLO, ORACLE!', 'L',5) AS INSTR_2,
        INSTR('HELLO, ORACLE!', 'L',2,2) AS INSTR_3
FROM DUAL;

-- 실습 6-10 INSTR 함수로 사원 이름에 문자 S가 있는 행 구하기
SELECT * FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

-- 실습 6-11 LIKE 연산자로 사원 이름에 문자 S가 있는 행 구하기
SELECT * FROM EMP
WHERE ENAME LIKE '%S%';

-- 실습 6-12 REPLACE 함수로 문자열 안에 있는 특정 문자 바꾸기
SELECT '010-1234-5678' AS REPLACE_BEFORE,
        REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
        REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

-- 실습 6-13 LAPD, RPAD 함수 사용하여 출력하기
SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS LPAD_1,
    RPAD('Oracle', 10, '*') AS RPAD_1,
    LPAD('Oracle', 10) AS LPAD_2,
    RPAD('Oracle', 10) AS RPAD_2
FROM DUAL;

-- 실습 6-14 RPAD 함수를 사용하여 개인정보 뒷자리 * 표시로 출력하기
SELECT 
RPAD('971225-', 14, '*') AS RPAD_JMNO,
RPAD('010-1234-', 13, '*') AS RPAD_PHONE
FROM DUAL;

-- 실습 6-15 두 열 사이에 콜론(:) 넣고 연결하기
SELECT CONCAT(EMPNO, ENAME),
        CONCAT(EMPNO, CONCAT(' : ', ENAME))
FROM EMP
WHERE ENAME = 'SCOTT';

-- 실습 6-16 TRIM 함수로 공백 제거하여 추출하기
SELECT  '[' || TRIM(' _ _Oracle_ _ ') || ']' AS TRIM,
        '[' || TRIM(LEADING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_LEADING,
        '[' || TRIM(TRAILING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_TRAILING,
        '[' || TRIM(BOTH FROM ' _ _Oracle_ _ ') || ']' AS TRIM_BOTH
FROM DUAL;

-- 실습 6-17 TRIM 함수로 삭제할 문자_삭제 후 출력하기
SELECT  '[' || TRIM('_' FROM '_ _Oracle_ _') || ']' AS TRIM,
        '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_LEADING,
        '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING,
        '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH
FROM DUAL;

-- 실습 6-18 TRIM, LTRIM, RTRIM 사용하여 문자열 추출하기
SELECT  '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
        '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
        '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2,
        '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
        '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM_2
FROM DUAL;
    
    