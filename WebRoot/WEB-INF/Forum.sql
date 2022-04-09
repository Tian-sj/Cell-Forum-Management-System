drop database Forum;
create database Forum;
use Forum;

create table Manager(
	username varchar(16) primary key,
	password varchar(16) not null
);
insert into Manager values('tianshiji','123456');

create table Property(
	username varchar(16) primary key,
	password varchar(16) not null
);
insert into Property values('abc','123');
insert into Property values('bcd','123');

create table Owners(
	username varchar(16) primary key,
	password varchar(16) not null
);
insert into Owners values('aaa','123');
insert into Owners values('bbb','123');

create table With_audit_message(
	W_id int primary key auto_increment,
	Title varchar(50) not null,
	Content varchar(1000) not null,
	Posted_by_username varchar(16),
	publish_date datetime not null,
	Posted_by_user varchar(20),
	audits varchar(10) default '待审核' not null
);

create table Visible_message(
	V_id int primary key auto_increment,
	Title varchar(50) not null,
	Content varchar(1000) not null,
	Posted_by_username varchar(16),
	publish_date datetime not null,
	zhiwei varchar(10) not null
);
insert into Visible_message(V_id,Title,Content,Posted_by_username,publish_date,zhiwei) values('1','今天的天气','今天天气晴朗：温度高达36度，热死我了','aaa','2021-06-20 17:05','业主');
insert into Visible_message(V_id,Title,Content,Posted_by_username,publish_date,zhiwei) values('2','吃饭了吗都','我要减肥，我减肥','bbb','2021-06-23 17:11','业主');

create table _reply(
	R_id int primary key auto_increment,
	V_id int not null,
	Reply_by_username varchar(16),
	Reply_content varchar(1000),
	Reply_audit char(10)
);
