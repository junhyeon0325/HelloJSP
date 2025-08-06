--0806
select *
from   tbl_member
where  member_id = 'user01';

select *
from   tbl_reply;

select reply_seq.nextval from dual;

-- ����� 5���� ���.
select b.*
from  (select /*+ INDEX_DESC(r PK_REPLY) */ r.*, rownum rn
       from tbl_reply r
       where r.board_no = :bno) b
where  b.rn > (:page - 1) * 5
and    b.rn <= (:page * 5);

--0805
-- ������̺�(��۹�ȣ, �����۹�ȣ, ����, ����ۼ���, �ۼ��Ͻ�)
create table tbl_reply (
  reply_no   number,
  board_no   number not null,
  reply      varchar2(500) not null,
  replyer    varchar2(10) not null,
  reply_date date default sysdate
);
create sequence reply_seq;
alter table    tbl_reply 
add constraint pk_reply 
primary key   (reply_no);

drop table tbl_deply;

insert into tbl_reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 123, '123���� ����Դϴ�', 'user01');
insert into tbl_reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 122, '122���� ����Դϴ�', 'user01');
insert into tbl_reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 121, '121���� ����Դϴ�', 'user01');
insert into tbl_reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 120, '120���� ����Դϴ�', 'user01');

select *
from   tbl_reply;
--0804
SELECT ta.*
FROM (
    SELECT rownum rn, b.*
    FROM tbl_member b
    WHERE member_name LIKE '%user%' OR member_id LIKE '%user%'
) ta
WHERE ta.rn > (1 - 1) * 5
  AND ta.rn <= 1 * 5;
  
select ta.*
from   (
        select rownum rn, c.*
        from tbl_member c
        where member_id like '%user%'
           or member_name like '%user%'
           or member_name like '%user%' or member_id like '%user%'
       ) ta
 where ta.rn > (2 - 1) * 5
 and   ta.rn <= 2 * 5;

alter table tbl_member add constraint pk_member primary key(member_id);

-- index_name��ȸ SYS_C008408
select index_name, table_name
from user_indexes
where table_name = upper('tbl_member'); 

-- index_name��ȸ pk_board
select index_name, table_name
from user_indexes
where table_name = upper('tbl_board');

-- 0801
alter table tbl_board add image varchar2(100);

select *
from   tbl_board
order by board_no;

select *
from   tbl_member;

insert into tbl_member (member_id, member_pw, member_name, responsibility)
values('guest01', '1111', '�ϰ���', 'Admin');

-- 0731
select   member_name, b.*
from     tbl_board b
join     tbl_member m
  on     b.writer = m.member_id
order by 1;

select *
from   tbl_board;

update tbl_board
set    writer = 'user02'
where  board_no < 100;

select *
from   tbl_member;

-- ����� ���̺�
-- ���̵�, ��й�ȣ, �̸�, ����
create table tbl_member (
  member_id varchar2(100) primary key,
  member_pw varchar2(100) not null,
  member_name varchar2(50) not null,
  responsibility varchar2(10) default 'User' not null
);

alter session set "_ORACLE_SCRIPT" = true;

create user dev identified by dev;
grant connect, resource to dev;
alter user dev default tablespace users quota unlimited on users;

-- 게시�?번호, ?���?, ?��?��, ?��?��?��, 조회?��, ?��?��?��?��, �?경일?��
create table tbl_board (
  board_no number, -- �?번호
  title    varchar2(100) not null, -- ?���?
  content  varchar2(1000) not null, -- ?��?��
  writer   varchar2(30) not null, -- ?��?��?��
  view_cnt number default 0, -- 조회?��
  creation_date date default sysdate, -- ?��?��?�� ?��?�� ?��?��
  last_update_date date default sysdate -- ?��?��?��?�� ???��
);

alter table tbl_board add constraint pk_board primary key(board_no);
create sequence board_seq;

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '게시�? ?���?', '게시�? ?���? ?��?��?��?��?��', '?��길동');

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '?���? ?��?��?��', 'HTML, CSS, Javascript ?��?��?��.', '�?길동');

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '?���??��록되?��?��?', '기능?�� 만들겁니?��', '박길?��');

select *
from tbl_board;

