-- �ǽ� 19-31 EMP_TRG ���̺� �����ϱ�
CREATE TABLE EMP_TRG
    AS SELECT * FROM EMP;
    
-- �ǽ� 19-32 DML ���� ���� ������ Ʈ���� �����ϱ�
CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
BEFORE
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('��', '��') THEN
        IF INSERTING THEN
            RAISE_APPLICATION_ERROR(-20000, '�ָ� ������� �߰� �Ұ�');
        ELSIF UPDATING THEN
            RAISE_APPLICATION_ERROR(-20001, '�ָ� ������� �߰� �Ұ�');
        ELSIF DELETING THEN
            RAISE_APPLICATION_ERROR(-20002, '�ָ� ������� �߰� �Ұ�');
        ELSE
            RAISE_APPLICATION_ERROR(-20003, '�ָ� ������� �߰� �Ұ�');
        END IF;
    END IF;
END;
/

-- �ǽ� 19-33 ���� ��¥�� EMP_TRG���̺� UPDATE�ϱ�
UPDATE EMP_TRG SET SAL = 3500 WHERE EMPNO = 7788;

-- �ǽ� 19-34 �ָ� ��¥�� EMP_TRG���̺� UPDATE�ϱ�
UPDATE EMP_TRG SET SAL = 3500 WHERE EMPNO = 7788;

-- �ǽ� 19-35 EMP_TRG_LOG ���̺� �����ϱ�
CREATE TABLE EMP_TRG_LOG(
    TABLENAME VARCHAR2(10),  -- DML�� ����� ���̺� �̸�
    DML_TYPE VARCHAR2(10),   -- DML ���ɾ� ����
    EMPNO NUMBER(4),         -- DML ����� �� �����ȣ
    USER_NAME VARCHAR2(30),  -- DML�� ������ USER �̸�
    CHANGE_DATE DATE         -- DML�� ����� ��¥
);

-- �ǽ� 19-36 DML ���� �� ������ Ʈ���� �����ϱ�
CREATE OR REPLACE TRIGGER TRG_EMP_LOG
AFTER
INSERT OR UPDATE OR DELETE ON EMP_TRG
FOR EACH ROW

BEGIN

    IF INSERTING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'INSERT', :NEW.EMPNO,
                SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
                
    ELSIF UPDATING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'UPDATE', :OLD.EMPNO,
                SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
                
    ELSIF DELETING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'DELETE', :NEW.EMPNO,
                SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
   END IF;
END;
/

-- �ǽ� 19-37 EMP_TRG ���̺��� INSERT �����ϱ�
INSERT INTO EMP_TRG
VALUES(9999, 'TESTEMP', 'CLERK', 7788, TO_DATE('2018-03-03', 'YYYY-MM-DD'), 1200, NULL, 20);

-- �ǽ� 19-38 EMP_TRG ���̺��� INSERT �����ϱ�(COMMIT�ϱ�)
COMMIT;

-- �ǽ� 19-39 EMP_TRG ���̺��� INSERT Ȯ���ϱ�
SELECT * FROM EMP_TRG;

-- �ǽ� 19-40 EMP_TRG_LOG ���̺��� INSERT ��� Ȯ���ϱ�
SELECT
    * FROM emp_trg_log;
    
-- �ǽ� 19-41 EMP_TRG ���̺��� UPDATE �����ϱ�
UPDATE EMP_TRG
SET SAL = 1300
WHERE MGR = 7788;

-- �ǽ� 19-41 EMP_TRG ���̺��� INSERT �����ϱ�(COMMIT�ϱ�)
COMMIT;

-- �ǽ� 19-42 USER_TRIGGERS�� Ʈ���� ���� ��ȸ�ϱ�
SELECT TRIGGER_NAME, TRIGGER_TYPE, TRIGGERING_EVENT, TABLE_NAME, STATUS FROM USER_TRIGGERS;