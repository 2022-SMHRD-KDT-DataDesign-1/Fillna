drop table board;

-- Board 게시판 테이블 생성
create table board (
	idx int not null auto_increment,
	memID varchar(20) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);

insert into board(title, content, writer)
values ('화요일 일기', '정보처리기사 시험 사라졋으면 좋겠다', '고');

insert into board(title, content, writer)
values ('어쩔티비', '저쩔티비', '고운');

insert into board(title, content, writer)
values ('안녕하새우', '는 영어로 hi shrimp', '고운짱짱맨');

insert into board(title, content, writer)
values ('구운감자', '이제 좀 질린다', '고운감자');

insert into board(title, content, writer)
values ('똥', '오늘 똥 안쌈', '고운티비');

select * from board;



-- 회원 테이블 생성
create table member(
	memIdx int not null,
	memID varchar(20) not null,
	memPassword varchar(68) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(50),
	memProfile varchar(50),
	primary key(memID)
);

select * from member;

insert into member(memID, memPassword, memName, memAge, memGender, memEmail) 
values('admin', '1234', '관리자', 20, '남자', 'admin@gmail.com');

delete from member;

-- 권한 테이블 생성티비
create table auth(
   no int not null auto_increment,
   memID varchar(50) not null,
   auth varchar(50) not null,
   primary key(no),
   constraint fk_member_auth foreign key(memID)
   references member(memID)
);

drop table member;

select * from auth;

select IFNULL(MAX(memIdx)+1, 1) from member;

select * from member left join auth on member.memID = auth.memID;