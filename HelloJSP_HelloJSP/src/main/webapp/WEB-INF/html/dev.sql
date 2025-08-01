-- 0801
alter table tbl_board add image varchar2(100);

select *
from   tbl_board
order by board_no;

select *
from   tbl_member;

insert into tbl_member (member_id, member_pw, member_name, responsibility)
values('guest', '1111', '�����', 'Admin');

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

