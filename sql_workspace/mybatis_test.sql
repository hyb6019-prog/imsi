CREATE TABLE QNA(
    QNA_NO      NUMBER PRIMARY KEY,
    QNA_TITLE   VARCHAR2(1000) NOT NULL,
    QNA_CONTENT VARCHAR2(2000) NOT NULL,
    QNA_WRITER  VARCHAR2(30)   NOT NULL,
    IS_ANSWER   CHAR(1)        DEFAULT 'N' CHECK(IS_ANSWER IN ('Y','N'))
);
CREATE SEQUENCE QNA_SEQ;
    INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,'spring�̶�..?','�������� �����??��Ƴ׿�','student1','N');
    INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,'mybatis��....?','���̹�Ƽ���� ���������� ����,,��������?','student1','Y');
    INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,'mybatis�������� �����Դϴ�.','�̰� ��� ���°���??','student2','N');
    INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,'���� ���ɸ޴� ��õ��,,','����״�� ���ɸ޴���õ�����ּ���','student2','Y');

COMMIT;

select * from qna;
select * from qna where qna_title like '%qna_title%';