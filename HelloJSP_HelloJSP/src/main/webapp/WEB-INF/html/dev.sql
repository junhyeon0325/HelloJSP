-- 0801
alter table tbl_board add image varchar2(100);

select *
from   tbl_board
order by board_no;

select *
from   tbl_member;

insert into tbl_member (member_id, member_pw, member_name, responsibility)
values('guest', '1111', '김관리', 'Admin');

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

-- 사용자 테이블
-- 아이디, 비밀번호, 이름, 권한
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

-- 寃뚯떆湲?踰덊샇, ?젣紐?, ?궡?슜, ?옉?꽦?옄, 議고쉶?닔, ?깮?꽦?씪?옄, 蹂?寃쎌씪?옄
create table tbl_board (
  board_no number, -- 湲?踰덊샇
  title    varchar2(100) not null, -- ?젣紐?
  content  varchar2(1000) not null, -- ?궡?슜
  writer   varchar2(30) not null, -- ?옉?꽦?옄
  view_cnt number default 0, -- 議고쉶?닔
  creation_date date default sysdate, -- ?뜲?씠?꽣 ?깮?꽦 ?떆?젏
  last_update_date date default sysdate -- ?닔?젙?떆?젏 ???옣
);
alter table tbl_board add constraint pk_board primary key(board_no);
create sequence board_seq;

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '寃뚯떆湲? ?벑濡?', '寃뚯떆湲? ?벑濡? ?뿰?뒿?엯?땲?떎', '?솉湲몃룞');

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '?벑濡? ?뀒?뒪?듃', 'HTML, CSS, Javascript ?엯?땲?떎.', '源?湲몃룞');

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '?뙎湲??벑濡앸릺?굹?슂?', '湲곕뒫?쓣 留뚮뱾寃곷땲?떎', '諛뺢만?룞');

select *
from tbl_board;

