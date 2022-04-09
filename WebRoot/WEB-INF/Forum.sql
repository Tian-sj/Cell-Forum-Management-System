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
	audits varchar(10) default '�����' not null
);

create table Visible_message(
	V_id int primary key auto_increment,
	Title varchar(50) not null,
	Content varchar(1000) not null,
	Posted_by_username varchar(16),
	publish_date datetime not null,
	zhiwei varchar(10) not null
);
insert into Visible_message(V_id,Title,Content,Posted_by_username,publish_date,zhiwei) values('1','���������','�����������ʣ��¶ȸߴ�36�ȣ���������','aaa','2021-06-20 17:05','ҵ��');
insert into Visible_message(V_id,Title,Content,Posted_by_username,publish_date,zhiwei) values('2','�Է�����','��Ҫ���ʣ��Ҽ���','bbb','2021-06-23 17:11','ҵ��');

create table _reply(
	R_id int primary key auto_increment,
	V_id int not null,
	Reply_by_username varchar(16),
	Reply_content varchar(1000),
	Reply_audit char(10)
);
