select *
from   tbl_member;

-- »ç¿ëÀÚ Å×ÀÌºí
-- ¾ÆÀÌµğ, ºñ¹Ğ¹øÈ£, ÀÌ¸§, ±ÇÇÑ
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

-- ê²Œì‹œê¸?ë²ˆí˜¸, ? œëª?, ?‚´?š©, ?‘?„±?, ì¡°íšŒ?ˆ˜, ?ƒ?„±?¼?, ë³?ê²½ì¼?
create table tbl_board (
  board_no number, -- ê¸?ë²ˆí˜¸
  title    varchar2(100) not null, -- ? œëª?
  content  varchar2(1000) not null, -- ?‚´?š©
  writer   varchar2(30) not null, -- ?‘?„±?
  view_cnt number default 0, -- ì¡°íšŒ?ˆ˜
  creation_date date default sysdate, -- ?°?´?„° ?ƒ?„± ?‹œ? 
  last_update_date date default sysdate -- ?ˆ˜? •?‹œ?  ???¥
);
alter table tbl_board add constraint pk_board primary key(board_no);
create sequence board_seq;

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, 'ê²Œì‹œê¸? ?“±ë¡?', 'ê²Œì‹œê¸? ?“±ë¡? ?—°?Šµ?…?‹ˆ?‹¤', '?™ê¸¸ë™');

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '?“±ë¡? ?…Œ?Š¤?Š¸', 'HTML, CSS, Javascript ?…?‹ˆ?‹¤.', 'ê¹?ê¸¸ë™');

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, '?Œ“ê¸??“±ë¡ë˜?‚˜?š”?', 'ê¸°ëŠ¥?„ ë§Œë“¤ê²ë‹ˆ?‹¤', 'ë°•ê¸¸?™');

select *
from tbl_board;

