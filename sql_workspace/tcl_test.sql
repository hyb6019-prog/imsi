create table user_tbl(
    user_no     number          primary key,
    user_id     varchar2(20)    unique not null,
    user_name   varchar2(30)    not null
);
-- Ʈ������� ���ؼ� �����Ǵ� �۾��� DML(insert/update/delete)�� �ش�
insert into user_tbl values(1,'user01','����1');
insert into user_tbl values(2,'user02','����2');
insert into user_tbl values(3,'user03','����3');
select * from user_tbl;

commit; --������� �۾��� ���� ����

insert into user_tbl values(4,'user04','����4');
insert into user_tbl values(5,'user05','����5');
savepoint spl; -- �ӽ� ���� ����Ʈ ����
insert into user_tbl values(6,'user06','����6');

rollback;   -- ���� �ֱٿ� commit�� �������� ���ư�(�����ͻ���)

update user_tbl set user_id='user1111' where user_no=1;
delete from user_tbl where user_no=3;

rollback; -- �ٽ� ����3������ �Էµ� ���·� ���ư�
rollback to spl; --�ӽ� ���� ����Ʈ�� ������ ���·� ���ư� , �ѹ� �ǵ��ư��� �ٽ� ��������Ʈ �����ؾ� ��� ����

--USER_TBL���� �����Ͱ� �����Ǹ� ������ ȸ�� ������ �����ϴ� ���̺�
create table del_user_tbl(
    del_user_id     varchar2(20),
    del_user_data   date
);
select * from user_tbl;
select * from del_user_tbl;
-- user04��� ȸ���� ȸ���� Ż���ϸ� -> user_tbl���� user04�� ����, del_user_tbl�� �ش絥���͸� �Է�
delete from user_tbl where user_id='user06';
insert into del_user_tbl values('user06',sysdate);
insert into del_user_tbl values('user06','adsfasdfasdf'); -- �Ϻη� �������� ���� �����...
commit; --del�� ins�� ��Ʈ�� ��� �۾� �� Ŀ���� ����� ������ �־ �ǵ����� ���� �� �� �ϳ��� �ϰ� Ŀ���ϴ� ���� �ٸ� �ϳ��� ���� �� ��������
rollback;

52
insert into user_tbl values(4,'user04','����4');



























