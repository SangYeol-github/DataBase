-- �ǽ� 16-17 �⺻ LOOP ����ϱ�
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
        EXIT WHEN V_NUM > 4;
    END LOOP;
END;
/

-- �ǽ� 16-18 WHILE LOOP ����ϱ�
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/

-- �ǽ� 16-19 WHILE LOOP ����ϱ�
BEGIN
    FOR I IN 0..4 LOOP
         DBMS_OUTPUT.PUT_LINE('���� I�� �� : ' || I);
    END LOOP;
END;
/

-- �ǽ� 16-20 FOR LOOP ����ϱ�
BEGIN
    FOR I IN REVERSE 0..4 LOOP
         DBMS_OUTPUT.PUT_LINE('���� I�� �� : ' || I);
    END LOOP;
END;
/

-- �ǽ� 16-21 FOR LOOP �ȿ� CONTINUE�� ����ϱ�
BEGIN
    FOR I IN 0..4 LOOP
         CONTINUE WHEN MOD(I, 2) = 1;
         DBMS_OUTPUT.PUT_LINE('���� I�� �� : ' || I);
    END LOOP;
END;
/