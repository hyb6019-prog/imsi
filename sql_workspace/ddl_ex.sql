create table runningman(
    no          number          primary key,
    id          varchar2(20)    unique,
    pass        varchar2(20)    not null,
    name        varchar2(20)    not null,
    nickname    varchar2(20)    unique,
    gender      char(1),
    tel         varchar2(20)    default '010-0000-0000',
    address     varchar2(90)    
);
drop table runningman;
update runningman set gender='M' where no=1;
select * from RUNNINGMAN;

insert into 
    runningman(no,id,pass,name,nickname,gender,tel,address)
    values(1,'muhan','1234','���缮','��������','M','010-4958-2333','�б���');
insert into 
    runningman(no,id,pass,name,nickname,gender,tel,address)
    values(2,'bignose','4444','������','������','M','010-0000-0000','����');
insert into 
    runningman(no,id,pass,name,nickname,gender,tel,address)
    values(3,'tiger','6658','������','�Ȳ�','M','010-6674-8986','�Ⱦ�');
insert into 
    runningman(no,id,pass,name,nickname,gender,tel,address)
    values(4,'haha','5356','����','�źм�Ź','M','010-8997-1122','��������');
insert into 
    runningman(no,id,pass,name,nickname,gender,tel,address)
    values(5,'ace','5555','����ȿ','õ����','F','010-0000-0000','�����');
insert into 
    runningman(no,id,pass,name,nickname,gender,tel,address)
    values(6,'girrafe','6658','�̱���','�߱�ģ��','M','010-2378-9991','������');
insert into 
    runningman(no,id,pass,name,nickname,gender,tel,address)
    values(7,'ssapssap','5356','�缼��','��������','M','010-1215-7777','����õ');
insert into 
    runningman(no,id,pass,name,nickname,gender,tel,address)
    values(8,'doli','5555','���ҹ�','���θ�','F','010-0000-0000','�ϻ�');
    
update runningman set pass = 9999 where nickname = '�߱�ģ��';

update runningman set tel = '����' where tel in ('010-0000-0000');

delete from runningman where name = '���缮';

commit;


















