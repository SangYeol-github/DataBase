-- �ǽ� 19-1 �������� �����ϱ�
CREATE OR REPLACE PROCEDURE PRO_NOPARAM
IS
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- �ǽ� 19-2 ������ ���ν��� �����ϱ�
SET SERVEROUTPUT ON;
EXECUTE pro_noparam;

-- �ǽ� 19-3 �͸� ��Ͽ��� ���ν��� �����ϱ�
BEGIN
    PRO_NOPARAM;
END;
/

-- �ǽ� 19-4 USER_SOURCE�� ���� ���ν��� Ȯ���ϱ�(���)
SELECT * FROM USER_SOURCE
WHERE NAME = 'PRO_NOPARAM';

-- �ǽ� 19-5 USER_SOURCE�� ���� ���ν��� Ȯ���ϱ�(SQL*PLUS)
SELECT TEXT
    FROM USER_SOURCE
WHERE NAME = 'PRO_NOPARM';

-- �ǽ� 19-6 ���ν��� �����ϱ�
DROP PROCEDURE PRO_NOPARAM;

-- �ǽ� 19-7 ���ν����� �Ķ���� �����ϱ�
CREATE OR REPLACE PROCEDURE PRO_PARAM_IN
(
    PARAM1 IN NUMBER,
    PARAM2 NUMBER,
    PARAM3 NUMBER := 3,
    PARAM4 NUMBER DEFAULT 4
)
IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('PARAM1 : ' || PARAM1);
    DBMS_OUTPUT.PUT_LINE('PARAM2 : ' || PARAM2);
    DBMS_OUTPUT.PUT_LINE('PARAM3 : ' || PARAM3);
    DBMS_OUTPUT.PUT_LINE('PARAM4 : ' || PARAM4);
END;
/

-- �ǽ� 19-8 �Ķ���͸� �Է��Ͽ� ���ν��� ����ϱ�
EXECUTE PRO_PARAM_IN(1, 2, 9, 8);

-- �ǽ� 19-9 �⺻���� ������ �Ķ���� �Է��� �����ϰ� ���ν��� ����ϱ�
EXECUTE PRO_PARAM_IN(1, 2);

-- �ǽ� 19-10 ���࿡ �ʿ��� �������� ���� �Ķ���͸� �Է��Ͽ� ���ν��� �����ϱ�
EXECUTE PRO_PARAM_IN(1);

-- �ǽ� 19-11 �Ķ���� �̸��� Ȱ���Ͽ� ���ν����� �� �Է��ϱ�
EXECUTE PRO_PARAM_IN(PARAM1 => 10, PARAM2 => 20);

-- �ǽ� 19-12 OUT ��� �Ķ���� �����ϱ�
CREATE OR REPLACE PROCEDURE PRO_PARAM_OUT
(
    IN_EMPNO IN EMP.EMPNO%TYPE,
    OUT_ENAME OUT EMP.ENAME%TYPE,
    OUT_SAL OUT EMP.SAL%TYPE
)
IS

BEGIN
    SELECT ENAME, SAL INTO OUT_ENAME, OUT_SAL
        FROM EMP
     WHERE EMPNO = IN_EMPNO;
END PRO_PARAM_OUT;
/

-- �ǽ� 19-13 OUT ��� �Ķ���� ����ϱ�
DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    PRO_PARAM_OUT(7788, V_ENAME, V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || V_SAL);
END;
/

-- �ǽ� 19-14 IN OUT ��� �Ķ���� �����ϱ�
CREATE OR REPLACE PROCEDURE PRO_PARAM_INOUT
(
    INOUT_NO IN OUT NUMBER
)
IS

BEGIN
    INOUT_NO := INOUT_NO * 2;
END PRO_PARAM_INOUT;
/

-- �ǽ� 19-15 IN OUT ��� �Ķ���� ����ϱ�
DECLARE
    NO NUMBER;
BEGIN
    NO := 5;
    PRO_PARAM_INOUT(NO);
    DBMS_OUTPUT.PUT_LINE('NO : ' || NO);
END;
/

-- 1�� ����. ������ �Ķ���͸� ���� ���ν����� ���� ���� �� �����Դϴ�. ���信 �˸��� ������ ������ ������.
-- 1. IN      (1) ȣ���� �� ���� �Է¹��� �� ���� ��� ���� ��ȯ�մϴ�.
-- 2. OUT     (2) �������� ������ �⺻������ ���ν����� ȣ���� �� ���� �Է¹޽��ϴ�.
-- 3. IN OUT  (3) ȣ���� �� ���� ��ȯ�մϴ�.
-- 1. -> (2)
-- 2. -> (3)
-- 3. -> (1)

-- �ǽ� 19-16 ������ �� ������ �߻��ϴ� ���ν��� �˾ƺ���
CREATE OR REPLACE PROCEDURE PRO_ERR
IS
    ERR_NO NUMBER;
BEGIN
    ERR_NO = 100;
    DBMS_OUTPUT.PUT_LINE('ERR_NO : ' || ERR_NO);
END PRO_ERR;
/

-- �ǽ� 19-17 SHOW ERRORS�� ���� Ȯ��
SHOW ERRORS;

-- �ǽ� 19-18 USER_ERRORS�� ���� Ȯ���ϱ�
SELECT * FROM USER_ERRORS
WHERE NAME = 'PRO_ERR';