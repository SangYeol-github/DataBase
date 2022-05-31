-- 실습 16-17 기본 LOOP 사용하기
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
        EXIT WHEN V_NUM > 4;
    END LOOP;
END;
/

-- 실습 16-18 WHILE LOOP 사용하기
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/

-- 실습 16-19 WHILE LOOP 사용하기
BEGIN
    FOR I IN 0..4 LOOP
         DBMS_OUTPUT.PUT_LINE('현재 I의 값 : ' || I);
    END LOOP;
END;
/

-- 실습 16-20 FOR LOOP 사용하기
BEGIN
    FOR I IN REVERSE 0..4 LOOP
         DBMS_OUTPUT.PUT_LINE('현재 I의 값 : ' || I);
    END LOOP;
END;
/

-- 실습 16-21 FOR LOOP 안에 CONTINUE문 사용하기
BEGIN
    FOR I IN 0..4 LOOP
         CONTINUE WHEN MOD(I, 2) = 1;
         DBMS_OUTPUT.PUT_LINE('현재 I의 값 : ' || I);
    END LOOP;
END;
/