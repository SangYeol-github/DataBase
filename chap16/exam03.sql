-- �ǽ� 16-11 ������ �Է��� ���� Ȧ������ �˾ƺ���(�Է� ���� Ȧ���� ��)
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ���Դϴ�!');
    END IF;
END;
/

-- �ǽ� 16-12 ������ �Էµ� ���� Ȧ������ �˾ƺ���(�Է� ���� ¦���� ��)
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ���Դϴ�!');
    END IF;
END;
/

-- �ǽ� 16-13 ������ �Էµ� ���� Ȧ������ ¦������ �˾ƺ���(�Է� ���� ¦���� ��)
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ���Դϴ�!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� ¦���Դϴ�!');
    END IF;
END;
/

-- �ǽ� 16-14 �Է��� ������ ��� �������� ����ϱ�(IF-THEN-ELSIF ���)
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A����');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B����');
     ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C����');
     ELSIF V_SCORE >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D����');
     ELSE
        DBMS_OUTPUT.PUT_LINE('F����');    
    END IF;
END;
/

-- �ǽ� 16-15 �Է� ������ ���� ���� ����ϱ�(�ܼ� CASE ���)
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B����');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C����');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D����');
        ELSE DBMS_OUTPUT.PUT_LINE('F����');
    END CASE;
END;
/

-- �ǽ� 16-16 �Է� ������ ���� ���� ����ϱ�(�˻� CASE ���)
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE 
        WHEN V_SCORE >= 90 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN V_SCORE >= 80 THEN DBMS_OUTPUT.PUT_LINE('B����');
        WHEN V_SCORE >= 70 THEN DBMS_OUTPUT.PUT_LINE('C����');
        WHEN V_SCORE >= 60 THEN DBMS_OUTPUT.PUT_LINE('D����');
        ELSE DBMS_OUTPUT.PUT_LINE('F����');
    END CASE;
END;
/