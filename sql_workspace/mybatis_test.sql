CREATE TABLE QNA(
    QNA_NO      NUMBER PRIMARY KEY,
    QNA_TITLE   VARCHAR2(1000) NOT NULL,
    QNA_CONTENT VARCHAR2(2000) NOT NULL,
    QNA_WRITER  VARCHAR2(30)   NOT NULL,
    IS_ANSWER   CHAR(1)        DEFAULT 'N' CHECK(IS_ANSWER IN ('Y','N'))
);
CREATE SEQUENCE QNA_SEQ;
    INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,'spring이란..?','스프링은 뭘까요??어렵네요','student1','N');
    INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,'mybatis는....?','마이바티스는 스프링보단 조금,,나을지도?','student1','Y');
    INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,'mybatis동적쿼리 질문입니다.','이건 어디에 쓰는거죠??','student2','N');
    INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL,'오늘 점심메뉴 추천좀,,','제목그대로 점심메뉴추천좀해주세요','student2','Y');

COMMIT;

select * from qna;
select * from qna where qna_title like '%qna_title%';