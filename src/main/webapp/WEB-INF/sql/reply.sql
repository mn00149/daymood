use daymood;

drop table User;
drop table Board;
drop table reply;

CREATE TABLE User
(
	user_no 					int 			NOT NULL 		AUTO_INCREMENT,
	username 					varchar(30) 	NOT NULL,
	email 						varchar(30) 	NOT NULL,
	password 					varchar(20) 	NOT NULL,
	nation 						varchar(15) 	NOT NULL,
	createDate 					timestamp 		NOT NULL,
	role 						varchar(10) 	NOT NULL,
    -- user_image					varchar(300),
	PRIMARY KEY (user_no),
	UNIQUE (email)
);
alter table User add user_image varchar(300);

CREATE TABLE Board
(
	board_no 					int 			NOT NULL 		AUTO_INCREMENT,
	user_no 					int 			NOT NULL,
	username 					varchar(30) 	NOT NULL,
	nation 						varchar(10) 	NOT NULL,
	title 						varchar(50) 	NOT NULL,
	content 					varchar(10000) 	NOT NULL,
	view_cnt 					int 			NOT NULL 		default 0,
	create_date 				timestamp 		NOT NULL,
	weather_category 			varchar(10),
	recommend_category 			varchar(10),
	info_category 				varchar(10),
	PRIMARY KEY (board_no),
    FOREIGN KEY (user_no) REFERENCES User(user_no)
);

alter table Board add recommend_cnt int NOT NULL default 0;

CREATE TABLE Reply
(
	reply_no 					int 			NOT NULL 		AUTO_INCREMENT,
	user_no 					int 			NOT NULL,
	board_no 					int 			NOT NULL,
	username 					varchar(30) 	NOT NULL,
	content 					varchar(500) 	NOT NULL,
	create_date 				timestamp 		NOT NULL,
	PRIMARY KEY (reply_no),
    FOREIGN KEY (user_no) REFERENCES User (user_no)
    on delete cascade on update cascade,
    FOREIGN KEY (board_no) REFERENCES Board (board_no)
    on delete cascade
);

insert into User(user_no, username, email, password, nation, createDate, role)
values(1, 'admin', 'admin@main.com', '1234', '가봉', sysdate(), 'A');
insert into User(user_no, username, email, password, nation, createDate, role)
values(2, 'lcw2', 'bluerain@main.com', '1234', '가봉', sysdate(), 'B');
insert into User(user_no, username, email, password, nation, createDate, role)
values(3, 'lcw3', 'bluerain2@main.com', '1234', '가봉', sysdate(), 'B');

insert into Board(board_no, user_no, username, nation, title, content, create_date, weather_category, recommend_category, info_category)
values(1, 1, '가봉', 'lcw2', '제목입니다', '내용입니다', sysdate(), '날씨카테고리', '추천카테고리', '정보카테고리');
insert into Board(board_no, user_no, username, nation, title, content, create_date, weather_category, recommend_category, info_category)
values(1, 3, '가봉', 'cw', '제목입니다', '내용입니다', sysdate(), '날씨카테고리', '추천카테고리', '정보카테고리');

insert into Reply(user_no, board_no, username, content, create_date)
values(1, 1, 'admin', '댓글입니다',sysdate());
insert into Reply(user_no, board_no, username, content, create_date)
values(2, 1, 'lcw2', '댓글입니다',sysdate());
insert into Reply(user_no, board_no, username, content, create_date)
values(3, 1, 'cw', '댓글입니다',sysdate());
insert into Reply(user_no, board_no, username, content, create_date)
values(3, 1, 'cw', '댓글입니다',sysdate());

insert into Reply(user_no, board_no, username, content, create_date)
values(3, 1, 'cw', '댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다',sysdate());

select user_no, board_no, content, create_date, username
from Reply
where board_no = 1
order by reply_no DESC
limit 0, 10;

select count(*) from Reply
where board_no = 1;

update reply
set content = '새로운 의견을 올립니다.'
where reply_no = 1;
 
delete from Reply
where reply_no = 1;
delete from user
where user_no = 1;



select * from User;
select * from Board;
select * from Reply;