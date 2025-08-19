create table member(
    member_no           number          primary key,
    member_userid       varchar(20)     not null,
    member_userpwd      char(20)        not null,
    member_nickname     varchar2(20)    unique not null,
    member_gender       varchar2(3)     check(member_gender in('��','��')) not null,
    member_email        varchar2(30)    not null
);
select * from member;
drop table member;
--create sequence �������̸�
--start with ����
--increment by ����
--maxvalue ���� | momaxvalue �ִ밪 ����
--minvalue ���� | momaxvalue �ּҰ� ����
--cycle | nocycle (������ �ִ밪 ���޽� cycle�� �⺻ start with�� �ǵ��ư��� nocycle�� ����)
--cache | nocache
create sequence member_seq
start with 1000
increment by 1
maxvalue 1000000
nocycle
;
drop sequence member_seq;
--insert into 
--    user_tbl_default(user_id,user_pw,user_name,user_age,user_phone,user_gender,user_date)
--    values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into member(member_no,member_userid,member_userpwd,member_nickname,member_gender,member_email)
            values(member_seq.nextval,'user01','1111','����01','��','1111@1111.com');
insert into member(member_no,member_userid,member_userpwd,member_nickname,member_gender,member_email)
            values(member_seq.nextval,'user02','2222','����02','��','2222@2222.com');
insert into member(member_no,member_userid,member_userpwd,member_nickname,member_gender,member_email)
            values(member_seq.nextval,'user03','3333','����03','��','3333@3333.com');
insert into member(member_no,member_userid,member_userpwd,member_nickname,member_gender,member_email)
            values(member_seq.nextval,'user04','4444','����04','��','4444@4444.com');
            
------

create table board(
    board_no            number          primary key,
    board_title         varchar2(20)    not null,
    board_content       varchar2(200)   not null,
    board_writedate     date            not null,
    board_nickname      varchar2(20)    not null,
    foreign key(board_nickname) references member(member_nickname)
);
--foreign key(buy_id) references shop_member(user_id)  
select * from board;
drop table board;

create sequence board_seq
start with 1
increment by 1
maxvalue 500000
nocycle
;
drop sequence board_seq;

insert into board(board_no,board_title,board_content,board_writedate,board_nickname)
            values(board_seq.nextval,'ȣȣ','ũ��������',sysdate,'����01');
insert into board(board_no,board_title,board_content,board_writedate,board_nickname)
            values(board_seq.nextval,'����','����������',sysdate,'����02');
insert into board(board_no,board_title,board_content,board_writedate,board_nickname)
            values(board_seq.nextval,'����','ŸŸŸŸ��',sysdate,'����03');
insert into board(board_no,board_title,board_content,board_writedate,board_nickname)
            values(board_seq.nextval,'����','����������',sysdate,'����04');

create view member_board
as
select m.member_no ȸ����ȣ, m.member_nickname ȸ���г���, m.member_email ȸ���̸���, b.board_title
from member m
join board b on (m.member_nickname = b.board_nickname);

select * from member_board;
create SYNONYM m for member;
create SYNONYM b for board;
drop SYNONYM b1;
select * from m;
select * from b;

----------------------------------------------------------------
select * from employee;






