create table member(
    member_no           number          primary key,
    member_userid       varchar(20)     not null,
    member_userpwd      char(20)        not null,
    member_nickname     varchar2(20)    unique not null,
    member_gender       varchar2(3)     check(member_gender in('남','여')) not null,
    member_email        varchar2(30)    not null
);
select * from member;
drop table member;
--create sequence 시퀀스이름
--start with 숫자
--increment by 숫자
--maxvalue 숫자 | momaxvalue 최대값 지정
--minvalue 숫자 | momaxvalue 최소값 지정
--cycle | nocycle (시퀀스 최대값 도달시 cycle은 기본 start with로 되돌아가고 nocycle은 에러)
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
--    values('user01','1111','유저1',20,'010-1111-1111','남자',sysdate);
insert into member(member_no,member_userid,member_userpwd,member_nickname,member_gender,member_email)
            values(member_seq.nextval,'user01','1111','유저01','남','1111@1111.com');
insert into member(member_no,member_userid,member_userpwd,member_nickname,member_gender,member_email)
            values(member_seq.nextval,'user02','2222','유저02','여','2222@2222.com');
insert into member(member_no,member_userid,member_userpwd,member_nickname,member_gender,member_email)
            values(member_seq.nextval,'user03','3333','유저03','남','3333@3333.com');
insert into member(member_no,member_userid,member_userpwd,member_nickname,member_gender,member_email)
            values(member_seq.nextval,'user04','4444','유저04','여','4444@4444.com');
            
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
            values(board_seq.nextval,'호호','크하하하하',sysdate,'유저01');
insert into board(board_no,board_title,board_content,board_writedate,board_nickname)
            values(board_seq.nextval,'후후','파파파파하',sysdate,'유저02');
insert into board(board_no,board_title,board_content,board_writedate,board_nickname)
            values(board_seq.nextval,'흐흐','타타타타하',sysdate,'유저03');
insert into board(board_no,board_title,board_content,board_writedate,board_nickname)
            values(board_seq.nextval,'헤헤','코쿄코쿄하',sysdate,'유저04');

create view member_board
as
select m.member_no 회원번호, m.member_nickname 회원닉네임, m.member_email 회원이메일, b.board_title
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






