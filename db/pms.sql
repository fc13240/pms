create database if not exists patentdb default character set utf8 default collate utf8_general_ci;

use patentdb;

create table if not exists users (
	user_id int auto_increment primary key, 
	username varchar(30) not null unique, 
	name varchar(30),
	password varchar(128) not null,
	email varchar(254), 
	phone varchar(30),
	join_date timestamp,
	enabled boolean not null default true
);

create table if not exists authorities (
	username varchar(50) not null,
	authority varchar(50) not null,
	constraint fk_authorities_users foreign key(username) references users(username)
);
create unique index ix_auth_username on authorities (username,authority);

create table if not exists groups (
	id bigint primary key auto_increment ,
	group_name varchar(50) not null
);

create table if not exists group_authorities (
	group_id bigint not null,
	authority varchar(50) not null,
	constraint fk_group_authorities_group foreign key(group_id) references groups(id)
);

create table if not exists group_members (
	id bigint primary key auto_increment,
	username varchar(50) not null,
	group_id bigint not null,
	constraint fk_group_members_group foreign key(group_id) references groups(id)
);

create table if not exists persistent_logins (
	username varchar(64) not null,
	series varchar(64) primary key,
	token varchar(64) not null,
	last_used timestamp not null
);

CREATE TABLE if not exists acl_sid (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	principal BOOLEAN NOT NULL,
	sid VARCHAR(100) NOT NULL,
	UNIQUE KEY unique_acl_sid (sid, principal)
);

CREATE TABLE if not exists acl_class (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	class VARCHAR(100) NOT NULL,
	UNIQUE KEY uk_acl_class (class)
);

CREATE TABLE if not exists acl_object_identity (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	object_id_class BIGINT UNSIGNED NOT NULL,
	object_id_identity BIGINT NOT NULL,
	parent_object BIGINT UNSIGNED,
	owner_sid BIGINT UNSIGNED,
	entries_inheriting BOOLEAN NOT NULL,
	UNIQUE KEY uk_acl_object_identity (object_id_class, object_id_identity),
	CONSTRAINT fk_acl_object_identity_parent FOREIGN KEY (parent_object) REFERENCES acl_object_identity
	(id),
	CONSTRAINT fk_acl_object_identity_class FOREIGN KEY (object_id_class) REFERENCES acl_class (id),
	CONSTRAINT fk_acl_object_identity_owner FOREIGN KEY (owner_sid) REFERENCES acl_sid (id)
);

CREATE TABLE if not exists acl_entry (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	acl_object_identity BIGINT UNSIGNED NOT NULL,
	ace_order INTEGER NOT NULL,
	sid BIGINT UNSIGNED NOT NULL,
	mask INTEGER UNSIGNED NOT NULL,
	granting BOOLEAN NOT NULL,
	audit_success BOOLEAN NOT NULL,
	audit_failure BOOLEAN NOT NULL,
	UNIQUE KEY unique_acl_entry (acl_object_identity, ace_order),
	CONSTRAINT fk_acl_entry_object FOREIGN KEY (acl_object_identity) REFERENCES acl_object_identity (id),
	CONSTRAINT fk_acl_entry_acl FOREIGN KEY (sid) REFERENCES acl_sid (id)
);

create table if not exists patent_types (
	patent_type_id int auto_increment primary key,
	patent_type_desc char(12) not null unique
);
	
create table if not exists patent_status (
	patent_status_id int auto_increment primary key,
	patent_status_desc varchar(50) not null unique
);

create table if not exists patents (
	patent_id bigint auto_increment primary key,
	app_no varchar(30) not null , 
	patent_name varchar(100), 
	patent_type int,
	app_date date, 
	app_person varchar(100), 
	invent_person varchar(100),
	patent_status int, 
	internal_code varchar(100), 
	patent_owner int,
	constraint unique_patents_no_owner unique idx_unique_patents_no_owner (patent_owner, app_no),
	constraint fk_patent_owner foreign key idx_fk_patent_owner (patent_owner) references users(user_id) on delete cascade,
	constraint fk_patent_patent_type foreign key idx_fk_patent_patent_type (patent_type) references patent_types(patent_type_id),
	constraint fk_patent_status foreign key idx_fk_patent_status (patent_status) references patent_status(patent_status_id)
);

create table if not exists share_patents (
	patent bigint,
	share_by int,
	share_to int,
	constraint pk_share_patents primary key (patent, share_by, share_to),
	constraint fk_share_patents_patent foreign key idx_fk_share_patents_patent (patent) references patents(patent_id) on delete cascade,
	constraint fk_share_patents_share_by foreign key idx_fk_share_patents_share_by (share_by) references users(user_id) on delete cascade,
	constraint fk_share_patents_share_to foreign key idx_fk_share_patents_share_to (share_to) references users(user_id) on delete cascade
);

create table if not exists user_patents (
	user int,
	patent bigint,
	constraint pk_user_patents primary key (user, patent),
	constraint fk_user_patent_user foreign key idx_fk_user_patent_user (user) references users(user_id) on delete cascade,
	constraint fk_user_patent_patent foreign key idx_fk_user_patent_patent (patent) references patents(patent_id) on delete cascade
);

create table if not exists fee_payment_status (
	fee_payment_status_id int auto_increment primary key,
	fee_payment_status_desc varchar(10) not null unique
);

create table if not exists fee_monitor_status (
	fee_monitor_status_id int auto_increment primary key,
	fee_monitor_status_desc varchar(10) not null unique
);

create table if not exists fees (
	fee_id bigint auto_increment primary key,
	deadline date not null comment '缴费截止日', 
	fee_type varchar(80) not null comment '费用种类',
	amount int not null, 
	fee_payment_status int default 1 comment '缴费状态', 
	patent bigint not null,
	process_user int comment '处理用户', 
	fee_monitor_status int default 1 comment '监控状态', 
	fee_owner int comment '拥有人', 
	invoice_title varchar(200) comment '发票抬头',
	UNIQUE KEY uk_fees_patent_fee (patent, fee_type, deadline, fee_owner),
	constraint fk_fee_owner foreign key idx_fk_fee_owner (fee_owner) references users(user_id) on delete cascade,
	constraint fk_fee_payment_status foreign key idx_fk_fee_payment_status (fee_payment_status) references fee_payment_status(fee_payment_status_id),
	constraint fk_fee_process_user foreign key idx_fk_fee_process_user (process_user) references users(user_id),
	constraint fk_fee_monitor_status foreign key idx_fk_fee_monitor_status (fee_monitor_status) references fee_monitor_status(fee_monitor_status_id),
	constraint fk_fee_patent foreign key idx_fk_fee_patent (patent) references patents(patent_id) on delete cascade
);

create table if not exists friends (
	user int,
	friend int,
	constraint pk_friends primary key (user, friend),
	constraint fk_friends_user foreign key(user) references users(user_id),
	constraint fk_friends_friend foreign key(friend) references users(user_id)
);

create table if not exists friend_request_process_status (
	friend_request_process_status_id int auto_increment primary key,
	friend_request_process_status_desc varchar(12) not null unique
);
	
create table if not exists friend_requests (
	from_user int, 
	to_user int, 
	message varchar(100),
	request_process_status int default 1 not null comment '处理状态',
	constraint pk_friend_requests primary key (from_user, to_user, request_process_status),
	constraint fk_friend_request_from_user foreign key idx_fk_friend_request_from_user (from_user) references users(user_id) on delete cascade,
	constraint fk_friend_request_to_user foreign key idx_fk_friend_request_to_user (to_user) references users(user_id) on delete cascade,
	constraint fk_friend_request_process_status foreign key idx_fk_friend_request_process_status (request_process_status) references friend_request_process_status(friend_request_process_status_id)
);

create table if not exists notice_process_status (
	notice_process_status_id int auto_increment primary key, 
	notice_process_status_desc varchar(10)
);
	
create table if not exists notice_types (
	notice_type_id int auto_increment primary key, 
	notice_type_desc varchar(30)
);

create table if not exists notice_paper_apply_types (
	notice_paper_apply_type_id int auto_increment primary key, 
	notice_paper_apply_type_desc varchar(12)
);

create table if not exists notices (
	notice_id bigint auto_increment primary key, 
	notice_sequence varchar(30), 
	dispatch_sequence varchar(30), 
	time_limit int,
	dispatch_date date, 
	notice_name varchar(100), 
	notice_code varchar(30), 
	zip_bid varchar(30),
	dmh_flag varchar(10), 
	archive_no varchar(30), 
	zipfile_name varchar(100),
	patent bigint not null, 
	process_status int default 1 not null, 
	process_user int,
	notice_type int, 
	paper_apply_type int default 1 not null,
	UNIQUE KEY uk_notices_patent_notice_sequence (patent, notice_sequence),
	constraint fk_notice_patent foreign key idx_fk_notice_patent (patent) references patents(patent_id) on delete cascade,
	constraint fk_notice_process_status foreign key idx_fk_notice_process_status (process_status) references notice_process_status(notice_process_status_id),
	constraint fk_notice_process_user foreign key idx_fk_notice_process_user (process_user) references users(user_id),
	constraint fk_notice_type foreign key idx_fk_notice_type (notice_type) references notice_types(notice_type_id),
	constraint fk_notice_paper_apply_type foreign key idx_fk_notice_paper_apply_type (paper_apply_type) references notice_paper_apply_types(notice_paper_apply_type_id)
);

create table if not exists provinces (
	id int primary key,
	name varchar(30) not null unique
);

create table if not exists cities (
	id bigint primary key,
	name varchar(30) not null,
	province int not null,
	constraint fk_cities_province foreign key(province) references provinces(id)
);

create table if not exists districts (
	id bigint primary key,
	name varchar(30) not null,
	city bigint not null,
	constraint fk_districts_city foreign key(city) references cities(id)
);

create table if not exists streets (
	id bigint primary key,
	name varchar(50) not null,
	district bigint not null,
	constraint fk_streets_district foreign key(district) references districts(id)
);

create table if not exists contact_addresses (
	id int primary key auto_increment,
	receiver varchar(50) not null,
	province int not null,
	city bigint not null,
	district bigint not null,
  	street bigint not null,
  	detail_address varchar(100) not null,
  	phone varchar(20),
  	mobile varchar(20),
 	email varchar(50),
 	user int not null,
 	is_default boolean not null default 0,
	constraint fk_contact_addresses_province foreign key(province) references provinces(id),
	constraint fk_contact_addresses_city foreign key(city) references cities(id),
	constraint fk_contact_addresses_district foreign key(district) references districts(id),
	constraint fk_contact_addresses_street foreign key(street) references streets(id),
	constraint fk_contact_addresses_user foreign key(user) references users(user_id)
);

create table if not exists order_status (
	order_status_id int primary key auto_increment,
	status_description varchar(20) not null unique
);

create table if not exists payment_methods (
	payment_method_id int primary key auto_increment,
	payment_method varchar(30) not null unique
);

create table if not exists orders (
	order_id bigint primary key auto_increment,
	order_status int not null default 1,
	post_address int,
	last_update_time timestamp default current_timestamp on update current_timestamp not null,
	amount int not null,
	user int not null,
	process_user int,
	received boolean default 0,
	express_company varchar(100),
	express_no varchar(100),
	send_time date,
	courier varchar(20),
	courier_phone varchar(30),
	create_time timestamp not null,
	payment_method int,
	constraint fk_orders_order_status foreign key(order_status) references order_status(order_status_id),
	constraint fk_orders_user foreign key(user) references users(user_id),
	constraint fk_orders_process_user foreign key(process_user) references users(user_id),
	constraint fk_orders_payment_method foreign key(payment_method) references payment_methods(payment_method_id)
) auto_increment=123412341234;

create table if not exists order_items (
	item_id bigint primary key auto_increment,
	order_id bigint not null,
	fee_id bigint not null,
	UNIQUE KEY uk_order_items_order_fee (order_id, fee_id),
	constraint fk_order_items_order foreign key(order_id) references orders(order_id) on delete cascade,
	constraint fk_order_items_fee foreign key(fee_id) references fees(fee_id)
);

	
INSERT INTO friend_request_process_status (friend_request_process_status_id, friend_request_process_status_desc)
VALUES
	(1, '未处理'),
	(2, '通过验证'),
	(3, '拒绝请求');

INSERT INTO fee_monitor_status (fee_monitor_status_id, fee_monitor_status_desc)
VALUES
	(1, '未加入'),
	(2, '已加入');

INSERT INTO fee_payment_status (fee_payment_status_id, fee_payment_status_desc)
VALUES
	(1, '未缴'),
	(2, '已支付'),
	(3, '已缴');
	
INSERT INTO notice_paper_apply_types (notice_paper_apply_type_id, notice_paper_apply_type_desc)
VALUES
	(1, '未申请'),
	(2, '申请纸件'),
	(3, '处理中'),
	(4, '已发送'),
	(5, '无纸件');
	
INSERT INTO notice_process_status (notice_process_status_id, notice_process_status_desc)
VALUES
	(1, '未处理'),
	(2, '已处理'),
	(3, '已放弃'),
	(4, '处理中');

INSERT INTO notice_types (notice_type_id, notice_type_desc)
VALUES
	(1, '新案受理'),
	(2, '费用相关'),
	(3, '补正审查'),
	(4, '授权登记'),
	(5, '权利丧失'),
	(6, '手续合格'),
	(7, '其他');

INSERT INTO patent_status (patent_status_id, patent_status_desc)
VALUES
	(1, '等待申请费'),
	(2, '待答复'),
	(3, '等年登印费'),
	(4, '待恢复'),
	(5, '失效'),
	(6, '专利权维持'),
	(7, '其他');

INSERT INTO patent_types (patent_type_id, patent_type_desc)
VALUES
	(1, '发明'),
	(2, '实用新型'),
	(3, '外观设计');	
	

INSERT INTO order_status
VALUES
	(1, '待支付'),
	(2, '已支付'),
	(3, '已取消'),
	(4, '已缴费');
	
INSERT INTO payment_methods
VALUES
	(1, '支付宝'),
	(2, '银联卡');
	
INSERT INTO groups
VALUES
	(1, 'USER'),
	(2, 'ORDER');
	
INSERT INTO group_authorities
VALUES
	(1, 'ROLE_USER'),
	(2, 'ROLE_ORDER');
	