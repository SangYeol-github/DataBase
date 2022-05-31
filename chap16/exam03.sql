-- 실습 16-11 변수에 입력한 값이 홀수인지 알아보기(입력 값이 홀수일 때)
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수입니다!');
    END IF;
END;
/

-- 실습 16-12 변수에 입력된 값이 홀수인지 알아보기(입력 값이 짝수일 때)
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수입니다!');
    END IF;
END;
/

-- 실습 16-13 변수에 입력된 값이 홀수인지 짝수인지 알아보기(입력 값이 짝수일 때)
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수입니다!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('V_NUMBER는 짝수입니다!');
    END IF;
END;
/

-- 실습 16-14 입력한 점수가 어느 학점인지 출력하기(IF-THEN-ELSIF 사용)
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A학점');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B학점');
     ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C학점');
     ELSIF V_SCORE >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D학점');
     ELSE
        DBMS_OUTPUT.PUT_LINE('F학점');    
    END IF;
END;
/

-- 실습 16-15 입력 점수에 따른 학점 출력하기(단순 CASE 사용)
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A학점');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A학점');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B학점');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C학점');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D학점');
        ELSE DBMS_OUTPUT.PUT_LINE('F학점');
    END CASE;
END;
/

-- 실습 16-16 입력 점수에 따른 학점 출력하기(검색 CASE 사용)
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE 
        WHEN V_SCORE >= 90 THEN DBMS_OUTPUT.PUT_LINE('A학점');
        WHEN V_SCORE >= 80 THEN DBMS_OUTPUT.PUT_LINE('B학점');
        WHEN V_SCORE >= 70 THEN DBMS_OUTPUT.PUT_LINE('C학점');
        WHEN V_SCORE >= 60 THEN DBMS_OUTPUT.PUT_LINE('D학점');
        ELSE DBMS_OUTPUT.PUT_LINE('F학점');
    END CASE;
END;
/