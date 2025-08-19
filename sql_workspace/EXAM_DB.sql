CREATE TABLE BOARD(
BOARD_NO        NUMBER          PRIMARY KEY,
BOARD_WRITER    VARCHAR2(50)    NOT NULL,
BOARD_TITLE     VARCHAR2(50)    NOT NULL,
BOARD_CONTENT   VARCHAR2(300)   NOT NULL,
READ_COUNT      NUMBER
);

CREATE SEQUENCE BOARD_SEQ;
select * from board;

INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL,'user01','ù��° �Խñ�','�̰� ù��° �Խñ��Դϴ�!!',0);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL,'user01','�ι�° �Խñ�','�ι�° �Խñ۵� ���� �ۼ��ϳ׿�^^',0);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL,'user02','�ȳ��ϼ���','�ȳ��ϼ��� ����ȸ���Դϴ�. �ߺ�Ź�帳�ϴ�!!',0);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL,'user02','�Խ��ǰ��ù���','���� �Խñ��� ���� �ۼ��ص� ���������?',0);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL,'user01','�������Դϴ�!','�������� ���� �ۼ��ϳ׿�. �ٵ� �� �����?',0);
COMMIT;