-- 0801
alter table tbl_board add image varchar2(100);

select *
from   tbl_board
order by board_no;

select *
from   tbl_member;

insert into tbl_member (member_id, member_pw, member_name, responsibility)
values('guest', '1111', '±è°ü¸®', 'Admin');

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

-- »ç¿ëÀÚ Å×ÀÌºí
-- ¾ÆÀÌµð, ºñ¹Ð¹øÈ£, ÀÌ¸§, ±ÇÇÑ
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

-- ê²Œì‹œê¸?ë²ˆí˜¸, ? œëª?, ?‚´?š©, ?ž‘?„±?ž, ì¡°íšŒ?ˆ˜, ?ƒ?„±?¼?ž, ë³?ê²½ì¼?ž
create table tbl_board (
  board_no number, -- ê¸?ë²ˆí˜¸
  title    varchar2(100) not null, -- ? œëª?
  content  varchar2(1000) not null, -- ?‚´?š©
  writer   varchar2(30) not null, -- ?ž‘?„±?ž
  view_cnt number default 0, -- ì¡°íšŒ?ˆ˜
  creation_date date default sysdate, -- ?°?´?„° ?ƒ?„± ?‹œ? 
  last_update_date date default sysdate -- ?ˆ˜? •?‹œ?  ???ž¥
);
alter table tbl_board add constraint pk_board primary key(board_no);
create sequence board_seq;

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, 'ê²Œì‹œê¸? ?“±ë¡?', 'ê²Œì‹œê¸? ?“±ë¡? ?—°?Šµ?ž…?‹ˆ?‹¤', '?™ê¸¸ë™');

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '?“±ë¡? ?…Œ?Š¤?Š¸', 'HTML, CSS, Javascript ?ž…?‹ˆ?‹¤.', 'ê¹?ê¸¸ë™');

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '?Œ“ê¸??“±ë¡ë˜?‚˜?š”?', 'ê¸°ëŠ¥?„ ë§Œë“¤ê²ë‹ˆ?‹¤', 'ë°•ê¸¸?™');

select *
from tbl_board;

