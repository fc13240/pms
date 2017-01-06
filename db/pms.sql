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
	patent_name varchar(200), 
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
	deadline date not null comment '缂磋垂鎴鏃�', 
	fee_type varchar(80) not null comment '璐圭敤绉嶇被',
	amount int not null, 
	fee_payment_status int default 1 comment '缂磋垂鐘舵��', 
	patent bigint not null,
	process_user int comment '澶勭悊鐢ㄦ埛', 
	fee_monitor_status int default 1 comment '鐩戞帶鐘舵��', 
	fee_owner int comment '鎷ユ湁浜�', 
	invoice_title varchar(200) comment '鍙戠エ鎶ご',
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
	request_process_status int default 1 not null comment '澶勭悊鐘舵��',
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

alter table orders add column pay_time timestamp;

create table if not exists order_items (
	item_id bigint primary key auto_increment,
	order_id bigint not null,
	fee_id bigint not null,
	UNIQUE KEY uk_order_items_order_fee (order_id, fee_id),
	constraint fk_order_items_order foreign key(order_id) references orders(order_id) on delete cascade,
	constraint fk_order_items_fee foreign key(fee_id) references fees(fee_id)
);

create table fee_types (
	type_id int primary key auto_increment,
	patent_type int not null,
	type_code varchar(30) not null,
	type_text varchar(100) not null,
	constraint fk_fee_type_patent foreign key idx_fk_fee_type_patent (patent_type) references patent_types(patent_type_id) on delete cascade 
);
	
INSERT INTO friend_request_process_status (friend_request_process_status_id, friend_request_process_status_desc)
VALUES
	(1, '鏈鐞�'),
	(2, '閫氳繃楠岃瘉'),
	(3, '鎷掔粷璇锋眰');

INSERT INTO fee_monitor_status (fee_monitor_status_id, fee_monitor_status_desc)
VALUES
	(1, '鏈姞鍏�'),
	(2, '宸插姞鍏�');

INSERT INTO fee_payment_status (fee_payment_status_id, fee_payment_status_desc)
VALUES
	(1, '搴旂即璐�'),
	(2, '宸叉敮浠�'),
	(3, '宸蹭氦灞�'),
	(4, '寰呮敮浠�'),
	(5, '缂磋垂鎴愬姛');
	
INSERT INTO notice_paper_apply_types (notice_paper_apply_type_id, notice_paper_apply_type_desc)
VALUES
	(1, '鏈敵璇�'),
	(2, '鐢宠绾镐欢'),
	(3, '澶勭悊涓�'),
	(4, '宸插彂閫�'),
	(5, '鏃犵焊浠�');
	
INSERT INTO notice_process_status (notice_process_status_id, notice_process_status_desc)
VALUES
	(1, '鏈鐞�'),
	(2, '宸插鐞�'),
	(3, '宸叉斁寮�'),
	(4, '澶勭悊涓�');

INSERT INTO notice_types (notice_type_id, notice_type_desc)
VALUES
	(1, '鏂版鍙楃悊'),
	(2, '缂磋垂閫氱煡'),
	(3, '琛ユ瀹℃煡'),
	(4, '涓撳埄鎺堟潈'),
	(5, '鏉冨埄涓уけ'),
	(6, '鎵嬬画鍚堟牸'),
	(7, '鍏朵粬'),
	(8, '椹冲洖鍐冲畾');

INSERT INTO patent_status (patent_status_id, patent_status_desc)
VALUES
	(1, '绛夊緟鐢宠璐�'),
	(2, '寰呯瓟澶�'),
	(3, '绛夊勾鐧诲嵃璐�'),
	(4, '寰呮仮澶�'),
	(5, '澶辨晥'),
	(6, '涓撳埄鏉冪淮鎸�'),
	(7, '鍏朵粬');

INSERT INTO patent_types (patent_type_id, patent_type_desc)
VALUES
	(1, '鍙戞槑'),
	(2, '瀹炵敤鏂板瀷'),
	(3, '澶栬璁捐');	
	

INSERT INTO order_status
VALUES
	(1, '寰呮敮浠�'),
	(2, '宸叉敮浠�'),
	(3, '宸插彇娑�'),
	(4, '宸茬即璐�');
	
INSERT INTO payment_methods
VALUES
	(1, '鏀粯瀹�'),
	(2, '閾惰仈鍗�');
	
INSERT INTO groups
VALUES
	(1, 'USER'),
	(2, 'ORDER');
	
INSERT INTO group_authorities
VALUES
	(1, 'ROLE_USER'),
	(2, 'ROLE_ORDER');
	
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405356', '鍙戞槑涓撳埄绗�17骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083325332', '鏉冨埄瑕佹眰闄勫姞璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083205320', '鍙戞槑涓撳埄鐧昏鍗板埛璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405358', '鍙戞槑涓撳埄绗�19骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405354', '鍙戞槑涓撳埄绗�15骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405352', '鍙戞槑涓撳埄绗�13骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405341', '鍙戞槑涓撳埄绗�2骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083335333', '璇存槑涔﹂檮鍔犺垂');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405346', '鍙戞槑涓撳埄绗�7骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405348', '鍙戞槑涓撳埄绗�9骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872082105210', '鍙戞槑涓撳埄鐢宠璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405344', '鍙戞槑涓撳埄绗�5骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872082405240', '鍙戞槑涓撳埄澶嶅璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405349', '鍙戞槑涓撳埄绗�10骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405342', '鍙戞槑涓撳埄绗�3骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872082505250', '鍙樻洿璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405355', '鍙戞槑涓撳埄绗�16骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405357', '鍙戞槑涓撳埄绗�18骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872082305230', '鍙戞槑涓撳埄鐢宠瀹℃煡璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405359', '鍙戞槑涓撳埄绗�20骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '20761581515151', '鍗拌姳绋�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405353', '鍙戞槑涓撳埄绗�14骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405340', '鍙戞槑涓撳埄绗�1骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405351', '鍙戞槑涓撳埄绗�12骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083315331', '寤堕暱璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872082115211', '鍙戞槑涓撳埄鏂囧嵃璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083400001', '骞磋垂璐瑰噺');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872082705270', '鎭㈠鏉冨埄璇锋眰璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405347', '鍙戞槑涓撳埄绗�8骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872082605260', '浼樺厛鏉冭姹傝垂');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083525381', '鍙戞槑涓撳埄骞磋垂婊炵撼閲�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405345', '鍙戞槑涓撳埄绗�6骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405343', '鍙戞槑涓撳埄绗�4骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872083405350', '鍙戞槑涓撳埄绗�11骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(1, '40872082905290', '鍙戞槑涓撳埄鏉冩棤鏁堝鍛婅姹傝垂');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415365', '瀹炵敤鏂板瀷涓撳埄绗�6骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083325332', '鏉冨埄瑕佹眰闄勫姞璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415363', '瀹炵敤鏂板瀷涓撳埄绗�4骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415367', '瀹炵敤鏂板瀷涓撳埄绗�8骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872082325232', '瀹炵敤鏂板瀷涓撳埄鏉冭瘎浠锋姤鍛婅姹傝垂');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872082415241', '瀹炵敤鏂板瀷涓撳埄澶嶅璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415361', '瀹炵敤鏂板瀷涓撳埄绗�2骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083335333', '璇存槑涔﹂檮鍔犺垂');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415369', '瀹炵敤鏂板瀷涓撳埄绗�10骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872082315231', '瀹炵敤鏂板瀷妫�绱㈣垂');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872082505250', '鍙樻洿璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083535382', '瀹炵敤鏂板瀷涓撳埄骞磋垂婊炵撼閲�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415364', '瀹炵敤鏂板瀷涓撳埄绗�5骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415362', '瀹炵敤鏂板瀷涓撳埄绗�3骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415368', '瀹炵敤鏂板瀷涓撳埄绗�9骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '20761581515151', '鍗拌姳绋�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415366', '瀹炵敤鏂板瀷涓撳埄绗�7骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083315331', '寤堕暱璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083400001', '骞磋垂璐瑰噺');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872082135213', '瀹炵敤鏂板瀷涓撳埄鐢宠璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083415360', '瀹炵敤鏂板瀷涓撳埄绗�1骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872082705270', '鎭㈠鏉冨埄璇锋眰璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872082605260', '浼樺厛鏉冭姹傝垂');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872083225322', '瀹炵敤鏂板瀷涓撳埄鐧昏鍗板埛璐�');
insert into fee_types(patent_type, type_code, type_text) values(2, '40872082915291', '瀹炵敤鏂板瀷涓撳埄鏉冩棤鏁堝鍛婅姹傝垂');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083325332', '鏉冨埄瑕佹眰闄勫姞璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425378', '澶栬璁捐涓撳埄绗�9骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '20761581515151', '鍗拌姳绋�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872082925292', '澶栬璁捐涓撳埄鏉冩棤鏁堝鍛婅姹傝垂');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425379', '澶栬璁捐涓撳埄绗�10骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083315331', '寤堕暱璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425374', '澶栬璁捐涓撳埄绗�5骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083400001', '骞磋垂璐瑰噺');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425375', '澶栬璁捐涓撳埄绗�6骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425377', '澶栬璁捐涓撳埄绗�8骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425371', '澶栬璁捐涓撳埄绗�2骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425376', '澶栬璁捐涓撳埄绗�7骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425370', '澶栬璁捐涓撳埄绗�1骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872082145214', '澶栬璁捐涓撳埄鐢宠璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425372', '澶栬璁捐涓撳埄绗�3骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083425373', '澶栬璁捐涓撳埄绗�4骞村勾璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872082425242', '澶栬璁捐涓撳埄澶嶅璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872082705270', '鎭㈠鏉冨埄璇锋眰璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083335333', '璇存槑涔﹂檮鍔犺垂');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872082605260', '浼樺厛鏉冭姹傝垂');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872082325233', '澶栬璁捐涓撳埄鏉冭瘎浠锋姤鍛婅姹傝垂');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872082505250', '鍙樻洿璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083235323', '澶栬璁捐涓撳埄鐧昏鍗板埛璐�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083545383', '澶栬璁捐涓撳埄骞磋垂婊炵撼閲�');
insert into fee_types(patent_type, type_code, type_text) values(3, '40872083545383', '澶栬璁捐涓撳埄骞磋垂婊炵撼閲�');

ALTER TABLE orders ADD invoice VARCHAR(100) NULL;
ALTER TABLE orders ADD express_fee INT ;
ALTER TABLE orders ADD service_fee INT ;
ALTER TABLE orders ADD invoice_fee INT;

ALTER TABLE patents ADD COLUMN patent_status_text VARCHAR(150);	
ALTER TABLE orders DROP COLUMN courier;
ALTER TABLE orders DROP COLUMN courier_phone;

CREATE TABLE if not exists patent_office_accounts (
  account_id int(11) NOT NULL AUTO_INCREMENT,
  user int(11) NOT NULL COMMENT '鐢ㄦ埛id',
  name varchar(200) DEFAULT NULL COMMENT '鐢靛瓙鐢ㄦ埛鍚�',
  username varchar(100) NOT NULL COMMENT '鐢靛瓙浠ｇ爜',
  password varchar(100) NOT NULL COMMENT '鐢靛瓙鐧诲綍瀵嗙爜',
  patent_update_time datetime DEFAULT NULL COMMENT '涓撳埄鏇存柊鏃堕棿',
  PRIMARY KEY (account_id),
  CONSTRAINT fk_patent_office_account_users FOREIGN KEY (user) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE patents ADD COLUMN publish_date DATE;
ALTER TABLE patents ADD COLUMN publish_no VARCHAR(30);
ALTER TABLE patents ADD COLUMN proxy_org VARCHAR(100);

ALTER TABLE users ADD COLUMN visible_password VARCHAR(100);


INSERT INTO groups VALUES(3, 'TRADER');
INSERT INTO group_authorities VALUES (3, 'ROLE_TRADER');

ALTER TABLE user_patents ADD COLUMN trash_status INT  DEFAULT 1;
ALTER TABLE patents ADD COLUMN transaction_status VARCHAR(10);

alter table friends add column remark_name varchar(50);

ALTER TABLE patents ADD COLUMN  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿';

ALTER TABLE contact_addresses DROP FOREIGN KEY  fk_contact_addresses_street; 

ALTER TABLE contact_addresses DROP COLUMN street; 


CREATE TABLE IF NOT EXISTS patent_remarks (
	remark_id INT AUTO_INCREMENT PRIMARY KEY  ,
	create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
	content  VARCHAR(1000),
	patent_id BIGINT NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT fk_patent_remarks_patent_id FOREIGN KEY idx_fk_patent_remarks_patent_id (patent_id) REFERENCES patents(patent_id) , 
	CONSTRAINT fk_patent_remarks_user_id FOREIGN KEY idx_fk_patent_remarks_user_id (user_id) REFERENCES users(user_id) 
);

CREATE TABLE  IF NOT EXISTS patent_documents (
  patent_doc_id bigint(20) NOT NULL AUTO_INCREMENT,
  app_no varchar(30) DEFAULT NULL,
  user_id int(11) DEFAULT NULL,
  patent_type int(11) NOT NULL COMMENT '涓撳埄绫诲瀷',
  create_time date DEFAULT NULL COMMENT '涓撳埄鍒涘缓鏃堕棿',
  last_update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '涓撳埄鏇存柊鏃堕棿',
  patent_name varchar(1000) DEFAULT NULL COMMENT '涓撳埄鍚嶇О',
  manual mediumtext COMMENT '璇存槑涔�',
  right_claim mediumtext COMMENT '鏉冨埄瑕佹眰',
  abstract_desc mediumtext COMMENT '鎽樿',
  abstract_img varchar(200) DEFAULT NULL COMMENT '鎽樿闄勫浘',
  patent_doc_attachment_file varchar(200) DEFAULT NULL COMMENT '涓婁紶闄勪欢淇濆瓨鍦板潃',
  patent_doc_status int NOT NULL COMMENT '鏂囨。鐘舵��',
  patent_doc_url VARCHAR(200) default null COMMENT '鏂囨。淇濆瓨鍦板潃',
  contact_id int COMMENT '鑱旂郴浜虹紪鍙�',
  price BIGINT DEFAULT NULL COMMENT '鏂囨。浠锋牸',
  attachment_url VARCHAR(100) COMMENT '璇锋眰涔︿笂浼犳枃浠跺湴鍧�';
  other_information VARCHAR(1000) COMMENT '鍏朵粬淇℃伅';
  patent_doc_proxy_status int NOT NULL COMMENT '浠ｇ悊鐘舵��',
  attachment_url VARCHAR(100) COMMENT '璇锋眰涔︿笂浼犳枃浠跺湴鍧�';
  other_information VARCHAR(1000) COMMENT '鍏朵粬淇℃伅';
  PRIMARY KEY (patent_doc_id),
  KEY fk_patent_documents_patent_type (patent_type),
  KEY fk_patent_documents_doc_owner_id (user_id),
  CONSTRAINT fk_patent_documents_doc_owner_id FOREIGN KEY (user_id) REFERENCES users (user_id),
  CONSTRAINT fk_patent_documents_patent_type FOREIGN KEY (patent_type) REFERENCES patent_types (patent_type_id),
  constraint fk_patent_documents_status foreign key idx_fk_patent_doc_status (patent_doc_status) references patent_doc_status(patent_doc_status_id),
   constraint fk_patent_documents_proxy_status foreign key idx_fk_patent_doc_proxy_status (patent_doc_proxy_status) references patent_doc_proxy_status(patent_doc_proxy_status_id)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS patent_doc_section_types(
	patent_doc_section_id INT PRIMARY KEY,
	patent_doc_section_desc VARCHAR(10) NOT NULL COMMENT '涓撳埄涓婚'
	
);

INSERT INTO patent_doc_section_types VALUES(1,'璇存槑涔�');
INSERT INTO patent_doc_section_types VALUES(2,'鏉冨埄瑕佹眰');
INSERT INTO patent_doc_section_types VALUES(3,'鎽樿');

CREATE TABLE IF NOT EXISTS patent_document_templates(
	template_id INT AUTO_INCREMENT PRIMARY KEY,
	content mediumtext NULL COMMENT '涓撳埄妯″潡閮ㄥ垎',
	template_title VARCHAR(400) NOT NULL COMMENT '妯℃澘璇存槑',
	patent_type INT NOT NULL COMMENT '涓撳埄绫诲瀷',
	patent_doc_section INT NOT NULL COMMENT '涓撳埄涓婚',
	create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
	last_update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT'鏈�杩戜慨鏀规椂闂�',
	creator_id INT NOT NULL COMMENT '鍒涘缓鑰�',
	CONSTRAINT fk_patent_document_template_patent_type FOREIGN KEY ids_fk_patent_name_template_patent_type(patent_type) REFERENCES patent_types(patent_type_id),
	CONSTRAINT fk_patent_document_template_creator_id FOREIGN KEY ids_fk_patent_name_template_creator_id(creator_id) REFERENCES users(user_id),
	CONSTRAINT fk_patent_document_template_patent_doc_section FOREIGN KEY ids_fk_patent_document_template_doc_section(patent_doc_section) REFERENCES patent_doc_section_types(patent_doc_section_id)
	
);


CREATE TABLE IF NOT EXISTS patent_attachment (
  attachment_id BIGINT NOT NULL AUTO_INCREMENT,
  attachment_url VARCHAR(200) DEFAULT NULL,
  patent_doc_id BIGINT,
  caption VARCHAR(200) NOT NULL COMMENT '璇存槑',
  seq_no int NOT NULL COMMENT '鍥剧墖搴忓垪鍙�',
  PRIMARY KEY (attachment_id),
  CONSTRAINT fk_patent_documents_doc_id FOREIGN KEY idx_fk_patent_documents_doc_id(patent_doc_id) REFERENCES patent_documents(patent_doc_id) on delete cascade
);




INSERT INTO groups
VALUES
	(4, 'PROXY_ORG'),	
	(5, 'CUSTOMER_SUPPORT'),
	(6, 'TECH'),
	(7, 'PROCESS');

INSERT INTO group_authorities
VALUES
	(4, 'ROLE_PROXY_ORG'),	
	(5, 'ROLE_CUSTOMER_SUPPORT'),
	(6, 'ROLE_TECH'),
	(7, 'ROLE_PROCESS');
	
INSERT INTO group_members(username,group_id) VALUES('test',4);

CREATE TABLE IF NOT EXISTS customer_supports (
	id INT NOT NULL AUTO_INCREMENT UNIQUE,
	user_id INT NOT NULL,
	proxy_org_id INT NOT NULL,
	remark_name VARCHAR(30) ,
	PRIMARY KEY (user_id,proxy_org_id),	
	CONSTRAINT fk_customer_supports_user_id FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tech_person (
	id INT NOT NULL AUTO_INCREMENT UNIQUE,
	user_id INT NOT NULL,
	proxy_org_id INT NOT NULL,
	remark_name VARCHAR(30) ,
	PRIMARY KEY(user_id,proxy_org_id),	
	CONSTRAINT fk_tech_person_user_id FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS process_person (
	id INT NOT NULL AUTO_INCREMENT UNIQUE,
	user_id INT NOT NULL,
	proxy_org_id INT NOT NULL,
	remark_name VARCHAR(30) ,
	PRIMARY KEY(user_id,proxy_org_id),	
	CONSTRAINT fk_process_person_user_id FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS common_app_person (
  app_person_id BIGINT NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(20) NOT NULL  COMMENT'鐢宠浜哄鍚�',
  id_number  VARCHAR(50) NOT NULL  COMMENT '璇佷欢鍙风爜',
  postcode_address VARCHAR(200) NOT NULL  COMMENT '閭紪鍙婂湴鍧�',
  other_information VARCHAR(50) DEFAULT NULL COMMENT '鍏朵粬淇℃伅',
  user_id INT(11)  NOT NULL,
  proxy_file  VARCHAR(200) DEFAULT NULL COMMENT '涓婁紶濮旀墭涔︿繚瀛樺湴鍧�',
  transaction_identity_id  VARCHAR(50) DEFAULT NULL COMMENT '澶囨璇佷欢鍙�',
  fee_reduce_transaction_status  VARCHAR(20) DEFAULT '鏈妗�' NOT NULL  COMMENT '璐瑰噺澶囨',
  transaction_year  VARCHAR(20) DEFAULT NULL COMMENT '澶囨骞村害',
  app_person_attachment_file  VARCHAR(200) DEFAULT NULL COMMENT '涓婁紶闄勪欢淇濆瓨鍦板潃',
  PRIMARY KEY(app_person_id),
  KEY fk_common_app_person_owner_id (user_id),
  CONSTRAINT fk_common_app_person_owner_id FOREIGN KEY(user_id) REFERENCES users (user_id) ON   DELETE   CASCADE   ON   UPDATE   CASCADE 
);

CREATE TABLE IF NOT EXISTS common_inventor (
  inventor_id BIGINT NOT NULL AUTO_INCREMENT,
  inventor_name VARCHAR(20) NOT NULL COMMENT'鍙戞槑濮撳悕',
  inventor_id_number  VARCHAR(20) DEFAULT NULL COMMENT '璇佷欢鍙风爜',
  inventor_nationality VARCHAR(20) DEFAULT NULL COMMENT '鍙戞槑浜哄浗绫�',
  inventor_mobile varchar(40) DEFAULT NULL COMMENT '鐢佃瘽鍙风爜',
  inventor_email VARCHAR(40) DEFAULT NULL COMMENT '閭' ,
  inventor_other_information VARCHAR(50) DEFAULT NULL COMMENT '鍏朵粬淇℃伅',
  inventor_attachment_file  VARCHAR(200) DEFAULT NULL COMMENT '涓婁紶闄勪欢淇濆瓨鍦板潃',
  user_id INT(11)  NOT NULL ,
  PRIMARY KEY(inventor_id),
  KEY fk_common_inventor_owner_id (user_id),
  CONSTRAINT fk_common_inventor_owner_id FOREIGN KEY(user_id) REFERENCES users (user_id) 
  
);	

CREATE TABLE IF NOT EXISTS user_inventor(
  USER INT(11) NOT NULL DEFAULT '0',
  inventor BIGINT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (user,inventor),
  KEY fk_user_inventor (inventor),
  CONSTRAINT fk_share_inventor FOREIGN KEY (inventor) REFERENCES common_inventor (inventor_id) ON DELETE CASCADE,
  CONSTRAINT fk_user_inventor_user FOREIGN KEY (USER) REFERENCES users (user_id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS user_app_person (
  USER INT(11) NOT NULL DEFAULT '0',
  app_person BIGINT(20) NOT NULL DEFAULT '0',
  trash_status INT(11) DEFAULT '1',
  PRIMARY KEY (user,app_person),
  KEY fk_user_app_person (app_person),
  CONSTRAINT fk_share_app_person_person FOREIGN KEY (app_person) REFERENCES common_app_person (app_person_id) ON DELETE CASCADE,
  CONSTRAINT fk_user_app_person_user FOREIGN KEY (USER) REFERENCES users (user_id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;



 CREATE TABLE IF NOT EXISTS patent_doc_app_person(
	person_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	patent_doc_id BIGINT NOT NULL COMMENT '鏂囨。缂栧彿',
	NAME VARCHAR(20) NOT  NULL COMMENT '鐢宠浜哄鍚�',
	id_number VARCHAR(20) NOT NULL COMMENT '鐢宠浜鸿韩浠借瘉缂栧彿',
	postcode_address VARCHAR(300) NOT  NULL COMMENT'閭紪鍦板潃',
	other_information VARCHAR(50) COMMENT'鍏朵粬淇℃伅',
	transaction_identity  VARCHAR(50) DEFAULT NULL COMMENT '澶囨璇佷欢鍙�',
	fee_reduce_transaction_status  VARCHAR(20) DEFAULT '鏈妗�' COMMENT '璐瑰噺澶囨',
  	transaction_year  VARCHAR(20) DEFAULT NULL COMMENT '澶囨骞村害',
	user_id INT NOT NULL COMMENT'鍒涘缓鑰呯紪鍙�',
	CONSTRAINT fk_patent_doc_app_person_doc_id FOREIGN KEY idx_fk_patent_doc_app_person_doc_id(patent_doc_id) REFERENCES patent_documents(patent_doc_id) ON   DELETE   CASCADE

)ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS proxy_org (
	org_id INT PRIMARY KEY  AUTO_INCREMENT ,
	org_user_id INT NOT NULL,
	remark_name VARCHAR(30) ,
	parent_org_id INT ,
	UNIQUE(org_user_id,parent_org_id),	
	CONSTRAINT fk_proxy_org_parent_org_id FOREIGN KEY(parent_org_id) REFERENCES proxy_org(org_id), 
    CONSTRAINT fk_proxy_org_org_user_id FOREIGN KEY(org_user_id) REFERENCES users(user_id) ON DELETE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO proxy_org(org_user_id) VALUES (2);


CREATE TABLE IF NOT EXISTS notice_remarks (
	remark_id INT AUTO_INCREMENT PRIMARY KEY  ,
	create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
	content  VARCHAR(1000),
	notice_id BIGINT NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT fk_notice_remarks_notice_id FOREIGN KEY(notice_id) REFERENCES notices(notice_id) , 
	CONSTRAINT fk_notice_remarks_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)	
);

CREATE TABLE IF NOT EXISTS patent_doc_status (
	patent_doc_status_id INT AUTO_INCREMENT PRIMARY KEY,
	patent_doc_status_desc VARCHAR(10) NOT NULL UNIQUE
);

INSERT INTO patent_doc_status (patent_doc_status_id, patent_doc_status_desc)
VALUES
	(1, '鑽夌'),
	(2, '绔嬫鍒嗛厤'),
	(3, '宸插垎閰�'),
	(4, '涓撳鎾板啓'),
	(5, '寰呯‘璁�'),
	(6, '寰呬慨鏀�'),
	(7, '瀹氱'),
	(8, '鎾板啓瀹屾垚'),
	(9, '寰呬氦灞�'),
	(10, '宸蹭氦灞�');

CREATE TABLE IF NOT EXISTS user_patent_docs (
	user_id INT,
	patent_doc BIGINT,
	CONSTRAINT pk_user_patent_docs PRIMARY KEY (user_id, patent_doc),
	CONSTRAINT fk_user_patent_doc_user FOREIGN KEY idx_fk_user_patent_doc_user (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
	CONSTRAINT fk_user_patent_docs_patent_docs FOREIGN KEY idx_fk_user_patent_docs_patent_docs (patent_doc) REFERENCES patent_documents(patent_doc_id) ON DELETE CASCADE
);
CREATE TABLE patent_doc_inventor(
     inventor_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     patent_doc_id BIGINT NOT NULL COMMENT '鏂囨。缂栧彿',
     inventor_name VARCHAR(200) NOT NULL COMMENT '鍙戞槑浜哄鍚�',
     inventor_number VARCHAR(20) NOT NULL COMMENT '鐪佷唤璇佺紪鍙�',
     inventor_nationality VARCHAR(100) NOT NULL COMMENT '鍥界睄',
     inventor_mobile INT  NOT NULL COMMENT '鑱旂郴鐢佃瘽',
     inventor_email VARCHAR(100) NOT NULL COMMENT '閭',
     inventor_other_information VARCHAR(50) COMMENT '鍏朵粬淇℃伅',
     user_id INT COMMENT '鍒涘缓鑰�',
     CONSTRAINT fk_patent_doc_inventor_patent_doc_id FOREIGN KEY idx_patent_doc_inventor_patent_doc_id(patent_doc_id) REFERENCES patent_documents(patent_doc_id) ON DELETE CASCADE,
     CONSTRAINT fk_patent_doc_inventor_user_id FOREIGN KEY idx_patent_doc_inventor_user_id(user_id) REFERENCES users(user_id) ON DELETE CASCADE
     

)ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE common_inventor MODIFY  inventor_mobile VARCHAR(40) ;
ALTER TABLE common_inventor MODIFY  inventor_email VARCHAR(40) ;

ALTER TABLE common_app_person MODIFY COLUMN id_number VARCHAR(20) NOT NULL ;
ALTER TABLE common_app_person MODIFY COLUMN NAME VARCHAR(20) NOT NULL;
ALTER TABLE common_app_person MODIFY COLUMN postcode_address VARCHAR(50) NOT NULL;
ALTER TABLE common_app_person MODIFY COLUMN fee_reduce_transaction_status VARCHAR(20) DEFAULT '鏈妗�' NOT NULL;

ALTER TABLE common_inventor MODIFY COLUMN inventor_name VARCHAR(20) NOT NULL;

create table if not exists patent_doc_orders (
	order_id bigint primary key auto_increment,
	order_status int not null default 0,
	last_update_time timestamp default current_timestamp on update current_timestamp not null,
	amount int not null,
	user int not null,
	create_time timestamp not null,
	pay_time timestamp ,
	payment_method int,
	constraint fk_patent_doc_orders_user foreign key(user) references users(user_id),
	constraint fk_patent_doc_orders_payment_method foreign key(payment_method) references payment_methods(payment_method_id)
) auto_increment=333333;

CREATE TABLE IF NOT EXISTS patent_doc_order_items (
	item_id BIGINT PRIMARY KEY AUTO_INCREMENT,
	order_id BIGINT NOT NULL,
	patent_doc_id BIGINT NOT NULL,
	UNIQUE KEY uk_order_items_order_fee (order_id, patent_doc_id),
	CONSTRAINT fk_patent_doc_order_items_order FOREIGN KEY(order_id) REFERENCES patent_doc_orders(order_id) ON DELETE CASCADE,
	CONSTRAINT fk_patent_doc_order_items_patent_documents FOREIGN KEY(patent_doc_id) REFERENCES patent_documents(patent_doc_id)
);

CREATE TABLE IF NOT EXISTS patent_doc_workflow_action(
	action_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	action_type_desc VARCHAR(30) DEFAULT NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS patent_doc_workflow_history(
	history_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	patent_doc_id BIGINT NOT NULL COMMENT '鏂囨。缂栧彿',
	user_id INT NOT NULL COMMENT '鍒涘缓鑰�',
	user_name VARCHAR(50) ,
	ACTION INT NOT NULL COMMENT'鎿嶄綔',
	action_time TIMESTAMP NOT NULL COMMENT '鎿嶄綔鍒涘缓鏃堕棿',
	CONSTRAINT fk_patent_doc_workflow_history_user_id FOREIGN KEY idx_patent_doc_workflow_history_user_id(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
	CONSTRAINT fk_patent_doc_workflow_history_patent_doc_id FOREIGN KEY idx_patent_doc_workflow_history_patent_doc_id(patent_doc_id) REFERENCES
	patent_documents(patent_doc_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_patent_doc_workflow_history_action FOREIGN KEY idx_patent_doc_workflow_history_action(ACTION) REFERENCES
	 patent_doc_workflow_action (action_id) ON DELETE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS patent_doc_workflow_target (
	history BIGINT NOT NULL  COMMENT '鍘嗗彶璁板綍',
	target INT NOT NULL COMMENT '鎿嶄綔鐩爣瀵硅薄',
	user_name VARCHAR(50) COMMENT '濮撳悕',
	patent_doc BIGINT NOT NULL COMMENT '鏂囨。',
	PRIMARY KEY (history,target,patent_doc),
	KEY fk_target_patent_doc_patent_doc(patent_doc),
	CONSTRAINT fk_patent_doc_workflow_target_patent_doc FOREIGN KEY (patent_doc) REFERENCES patent_documents (patent_doc_id) ON DELETE CASCADE,
	CONSTRAINT fk_patent_doc_workflow_target_target FOREIGN KEY (target) REFERENCES users (user_id) ON DELETE CASCADE,
	CONSTRAINT fk_patent_doc_workflow_target_history FOREIGN KEY (history) REFERENCES patent_doc_workflow_history(history_id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

insert into groups (id,group_name) values (8,'PLATFORM');
insert into group_authorities (group_id,authority) values (8,'ROLE_PLATFORM');


INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(1,'濮旀墭缁欏钩鍙拌处鎴�');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(2,'鍒嗛厤缁欎唬鐞嗘満鏋�');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(3,'鍒嗛厤缁欏鏈嶄汉鍛�');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(4,'鍒嗛厤缁欐妧鏈憳');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(5,'缃负寰呬慨鏀�');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(6,'淇濆瓨鎴栦慨鏀�');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(7,'瀹氱');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(8,'鍒朵綔鏍囧噯鏂囦欢');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(9,'纭');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(10,'浜ゅ眬');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(11,'鍒嗛厤缁欐祦绋嬩汉鍛�');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(12,'鍒犻櫎');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(13,'缃负寰呯‘璁�');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc)VALUES(14,'缃负寰呬氦灞�');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc) VALUES(15,'鎷掔粷濮旀墭');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc) VALUES(16,'涓婁紶浜ゅ眬鏂囦欢');
INSERT INTO patent_doc_workflow_action(action_id,action_type_desc) VALUES(18,'涓婁紶瀹氱鏂囦欢');
REPLACE INTO patent_doc_workflow_action(action_id,action_type_desc) VALUES(17,'鍒嗕韩缁欏ソ鍙�');


CREATE TABLE share_patent_docs (
  patent_doc BIGINT(20) NOT NULL DEFAULT '0',
  share_by INT(11) NOT NULL DEFAULT '0',
  share_to INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (patent_doc,share_by,share_to),
  KEY fk_share_patent_docs_share_by (share_by),
  KEY fk_share_patent_docs_share_to (share_to),
  CONSTRAINT fk_share_patent_docs_patent FOREIGN KEY (patent_doc) REFERENCES patent_documents (patent_doc_id) ON DELETE CASCADE,
  CONSTRAINT fk_share_patent_docs_share_by FOREIGN KEY (share_by) REFERENCES users (user_id) ON DELETE CASCADE,
  CONSTRAINT fk_share_patent_docs_share_to FOREIGN KEY (share_to) REFERENCES users (user_id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS patent_doc_proxy_status (
	patent_doc_proxy_status_id INT AUTO_INCREMENT PRIMARY KEY,
	patent_doc_proxy_status_desc VARCHAR(10) NOT NULL UNIQUE
);

INSERT INTO patent_doc_proxy_status (patent_doc_proxy_status_id, patent_doc_proxy_status_desc)
VALUES
	(1, '鏈鎵�'),
	(2, '宸叉敮浠�'),
	(3, '宸插鎵�'),
	(4, '宸插彇娑�');
	
ALTER TABLE patent_documents ADD COLUMN internal_code VARCHAR(100) COMMENT '鍐呴儴缂栫爜';

ALTER TABLE patent_doc_order_items ADD COLUMN apply_fee INT NOT NULL DEFAULT 0 COMMENT '鐢宠璐�';
ALTER TABLE patent_doc_order_items ADD COLUMN print_fee INT NOT NULL DEFAULT 0 COMMENT '鎵撳嵃璐�';
ALTER TABLE patent_doc_order_items ADD COLUMN check_fee INT NOT NULL DEFAULT 0 COMMENT '瀹℃煡璐�';
ALTER TABLE patent_doc_order_items ADD COLUMN service_fee INT NOT NULL DEFAULT 0 COMMENT '鏈嶅姟璐�';

ALTER TABLE patent_documents ADD COLUMN invoice_pic VARCHAR(200) DEFAULT NULL COMMENT '缂磋垂鍙戠エ鍑瘉';
INSERT INTO payment_methods VALUES(3, '缂磋垂鍑瘉鏀粯');

ALTER TABLE patent_doc_app_person ADD COLUMN proxy_file VARCHAR(200) COMMENT '濮旀墭涔︽枃浠跺湴鍧�';
ALTER TABLE patent_doc_app_person ADD COLUMN app_person_attachment_file VARCHAR(200) COMMENT '闄勪欢瀛樻斁鍦板潃';
ALTER TABLE patent_doc_inventor ADD COLUMN inventor_attachment_file VARCHAR(200) COMMENT '闄勪欢瀛樻斁鍦板潃';s

alter table patent_documents add column app_date date comment '鐢宠鏃�';
UPDATE fee_payment_status SET fee_payment_status_desc='璁㈠崟瀹屾垚' WHERE fee_payment_status_id=5;
UPDATE order_status SET status_description='璁㈠崟瀹屾垚' WHERE order_status_id=3;

ALTER TABLE patent_documents ADD COLUMN patent_doc_status_text VARCHAR(150) COMMENT '妗堜欢鐘舵�佹弿杩�';

INSERT INTO patent_doc_status(patent_doc_status_id,patent_doc_status_desc)
VALUES(20,'绛夊緟鐢宠璐�'),
(21,'寰呯瓟澶�'),
(22,'绛夊勾鐧诲嵃璐�'),
(23,'寰呮仮澶�'),
(24,'澶辨晥'),
(25,'涓撳埄鏉冪淮鎸�'),
(26,'鍏朵粬');

ALTER TABLE common_inventor add COLUMN create_time  TIMESTAMP;
ALTER TABLE common_app_person add COLUMN create_time TIMESTAMP;


CREATE TABLE IF NOT EXISTS notice_read (
	notice_id BIGINT NOT NULL,
	user_id INT NOT NULL,
	PRIMARY KEY (notice_id,user_id)
);

CREATE TABLE if not exists user_fees (
  user INT(11) NOT NULL DEFAULT '0',
  fee BIGINT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (user,fee),
  KEY fk_user_fee_fee (fee),
  CONSTRAINT fk_user_fee_fee FOREIGN KEY (fee) REFERENCES fees (fee_id) ON DELETE CASCADE,
  CONSTRAINT fk_user_fee_user FOREIGN KEY (user) REFERENCES users (user_id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;


ALTER TABLE common_app_person MODIFY COLUMN other_information VARCHAR(1000);
ALTER TABLE patent_doc_app_person COLUMN other_information VARCHAR(1000);
ALTER TABLE users ADD COLUMN qq varchar(20);
ALTER TABLE users ADD COLUMN weChat VARCHAR(150);
ALTER TABLE users ADD COLUMN avatar_url VARCHAR(500);

alter table patent_doc_app_person modify column name varchar(200);


ALTER TABLE common_app_person MODIFY NAME VARCHAR(200);
ALTER TABLE common_inventor MODIFY inventor_name VARCHAR(200);

create table if not exists express_status(
	express_status_id int primary key auto_increment,
	express_status_desc varchar(30)
);

CREATE TABLE express (
  express_id bigint(20) NOT NULL AUTO_INCREMENT,
  sender int(11) NOT NULL,
  receiver int(11) NOT NULL,
  express_remark varchar(1000),
  province int(11) NOT NULL,
  city bigint(20) NOT NULL,
  district bigint(20) NOT NULL,
  detail_address varchar(100) NOT NULL,
  express_company varchar(100) NOT NULL,
  express_no varchar(50),
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  send_time date,
  sign_time datetime,
  express_status int(11) NOT NULL DEFAULT '1',
  phone varchar(20) DEFAULT NULL COMMENT '鑱旂郴鐢佃瘽鎴栨墜鏈哄彿鐮�',
  contact_person varchar(200) NOT NULL,
  PRIMARY KEY (express_id),
  KEY fk_express_sender (sender),
  KEY fk_express_receiver (receiver),
  KEY fk_express_province (province),
  KEY fk_express_city (city),
  KEY fk_express_district (district),
  KEY fk_express_express_status (express_status),
  CONSTRAINT fk_express_city FOREIGN KEY (city) REFERENCES cities (id),
  CONSTRAINT fk_express_district FOREIGN KEY (district) REFERENCES districts (id),
  CONSTRAINT fk_express_express_status FOREIGN KEY (express_status) REFERENCES express_status (express_status_id),
  CONSTRAINT fk_express_province FOREIGN KEY (province) REFERENCES provinces (id),
  CONSTRAINT fk_express_receiver FOREIGN KEY (receiver) REFERENCES users (user_id),
  CONSTRAINT fk_express_sender FOREIGN KEY (sender) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO express_status(express_status_id,express_status_desc) VALUES (1,'鑽夌');
INSERT INTO express_status(express_status_id,express_status_desc) VALUES (2,'寰呯鏀�');
INSERT INTO express_status(express_status_id,express_status_desc) VALUES (3,'宸茬鏀�');

ALTER TABLE common_app_person ADD COLUMN phone VARCHAR(30) COMMENT '鑱旂郴浜烘墜鏈哄彿鐮�';
ALTER TABLE common_app_person ADD COLUMN is_fee_reduce int DEFAULT '1' COMMENT '鏄惁涓鸿垂鍑忓妗堢姸鎬�';
alter table patent_doc_app_person modify column id_number varchar(50);


CREATE  TABLE if not exists news_type (
type_id  int NOT NULL AUTO_INCREMENT COMMENT 'id' ,
type_name  varchar(50) NOT NULL COMMENT '鏍忕洰鍚�' ,
PRIMARY KEY (type_id)
)
;

CREATE TABLE IF NOT EXISTS article_type (
type_id  INT NOT NULL AUTO_INCREMENT ,
type_name  VARCHAR(50) NOT NULL COMMENT '鏍忕洰鍚�' ,
PRIMARY KEY (type_id)
)
;
CREATE TABLE if not exists news (
id  int NOT NULL AUTO_INCREMENT ,
news_type  int COMMENT '鏍忕洰id' ,
user_id  int NOT NULL COMMENT '鍙戞枃浜�' ,
keywords  varchar(120) NULL COMMENT '鍏抽敭瀛�' ,
author  varchar(30) NULL COMMENT '浣滆��' ,
title  varchar(50) COMMENT '鏍囬' ,
create_time  timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿' ,
publish_time  datetime COMMENT '鍙戞枃鏃堕棿' ,
update_time  datetime COMMENT '鏇存柊鏃堕棿' ,
source  varchar(100) NULL COMMENT '鏉ユ簮' ,
content  text COMMENT '鍐呭' ,
abstract varchar(100) NULL COMMENT '鎽樿' ,
small_img_url varchar(200) comment '缂╃暐鍥惧湴鍧�',
check_status INT COMMENT '鍙戝竷鐘舵��',
PRIMARY KEY (id),
FOREIGN KEY (news_type) REFERENCES news_type (type_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (user_id) REFERENCES   users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
)
;
CREATE TABLE IF NOT EXISTS article (
id  INT NOT NULL AUTO_INCREMENT ,
article_type  INT COMMENT '鏍忕洰id' ,
user_id  INT NOT NULL COMMENT '鍙戞枃浜�' ,
keywords  VARCHAR(120) COMMENT '鍏抽敭瀛�' ,
author  VARCHAR(30) COMMENT '浣滆��' ,
title  VARCHAR(50) COMMENT '鏍囬' ,
create_time  DATETIME  COMMENT '鍒涘缓鏃堕棿' ,
publish_time  DATETIME COMMENT '鍙戝竷鏃堕棿' ,
update_time  TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿' ,
source  VARCHAR(100) COMMENT '鏉ユ簮' ,
abstract  VARCHAR(100) COMMENT '鎽樿' ,
content  TEXT COMMENT '鍐呭' ,
check_status  TINYINT DEFAULT 0 COMMENT '0 鏈鏍�  1  瀹℃牳  2瀹℃牳涓嶉�氳繃' ,
up_vote  INT DEFAULT 0 ,
down_vote  INT DEFAULT 0 ,
small_img_url varchar(200) comment '缂╃暐鍥惧湴鍧�',
PRIMARY KEY (id),
FOREIGN KEY (article_type) REFERENCES article_type (type_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (user_id) REFERENCES   users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
)
;


CREATE TABLE IF NOT EXISTS news_imgs (
img_id BIGINT NOT NULL AUTO_INCREMENT,
img_url VARCHAR(200) DEFAULT NULL,
news_id INT,
caption VARCHAR(200) NOT NULL COMMENT '鍥剧墖璇存槑',
PRIMARY KEY (img_id),
CONSTRAINT fk_news_id FOREIGN KEY idx_fk_news_id(news_id) REFERENCES news(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS article_imgs (
img_id BIGINT NOT NULL AUTO_INCREMENT,
img_url VARCHAR(200),
article_id INT,
caption VARCHAR(200) COMMENT '鍥剧墖璇存槑',
PRIMARY KEY (img_id),
CONSTRAINT fk_article_id FOREIGN KEY idx_fk_article_id(article_id) REFERENCES article(id) ON DELETE CASCADE
);

INSERT INTO groups(group_name) VALUES('NEWS');
INSERT INTO group_authorities(group_id,authority) VALUES(9,'ROLE_NEWS');

CREATE TABLE IF NOT EXISTS article_comments (
	comment_id INT AUTO_INCREMENT PRIMARY KEY  ,
	create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
	content  VARCHAR(1000),
	article_id INT NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT fk_article_comments_article_id FOREIGN KEY (article_id) REFERENCES article(id)  ON DELETE CASCADE, 
	CONSTRAINT fk_article_comments_user_id FOREIGN KEY (user_id)  REFERENCES users(user_id) ON DELETE CASCADE 
);

alter table news add column up_vote  INT DEFAULT 0 comment '璧�';
alter table news add column down_vote  INT DEFAULT 0 comment '韪�';

CREATE TABLE IF NOT EXISTS news_comments (
	comment_id INT AUTO_INCREMENT PRIMARY KEY  ,
	create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
	content  VARCHAR(1000),
	news_id INT NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT fk_news_comments_news_id FOREIGN KEY (news_id) REFERENCES news(id)  ON DELETE CASCADE, 
	CONSTRAINT fk_news_comments_user_id FOREIGN KEY (user_id)  REFERENCES users(user_id) ON DELETE CASCADE 
);

ALTER TABLE sell_patent_goods ADD COLUMN recommend_status TINYINT DEFAULT 0 COMMENT '0鏈帹鑽�  1宸叉帹鑽�';
ALTER TABLE users MODIFY username VARCHAR(60);

CREATE TABLE brand_category (
	category_id  int NOT NULL AUTO_INCREMENT ,
	category_name  varchar(100) NOT NULL ,
	PRIMARY KEY (category_id)
)
;
CREATE TABLE brands (
	id  int NULL AUTO_INCREMENT,
	user  int NOT NULL,
	address  varchar(100) NULL,
	check_status  tinyint NOT NULL DEFAULT 1 COMMENT '1瀹℃牳閫氳繃  2瀹℃牳鏈�氳繃  3鏈鏍�',
	sell_status  tinyint NOT NULL DEFAULT 1 COMMENT '1鍑哄敭涓� 2 涓嬫灦',
	is_recommend  tinyint DEFAULT 1 COMMENT '1涓嶆帹鑽� 2 鎺ㄨ崘',
	category_id  int NOT  NULL ,
	brand_no  varchar(100) NOT NULL,
	name  varchar(100) NOT NULL,
	combination_type  varchar(500) NULL,
	similar_no  varchar(300) NULL,
	scope  varchar(500) NULL,
	transaction_mode  tinyint NULL DEFAULT 1 COMMENT '1 鍑哄敭  2杞',
	price  int NOT NULL,
	app_person  varchar(100) NULL,
	app_date  datetime NULL,
	publish_date  datetime NULL,
	start_date  datetime NULL,
	end_date  datetime NULL,
	originality  varchar(500) NULL,
	case_status VARCHAR(10),
	PRIMARY KEY (id),
	UNIQUE KEY idx_unique_brand_no (brand_no),
	constraint fk_brands_users foreign key(user) references users(user_id),
	constraint fk_brands_category foreign key(category_id) references brand_category(category_id) 
);
CREATE TABLE wechat_orders (
	id  INT  NOT NULL AUTO_INCREMENT ,
	wechat_order_id VARCHAR(100) NULL ,
	wechat_name  VARCHAR(100) NULL ,
	brand_id   VARCHAR(100) NULL ,
	total_fee   INT,
	pay_time  DATETIME NULL ,
	PRIMARY KEY (id)
);

insert into brand_category (category_id,category_name)values
(15,'音乐器材'),(22,'绳网袋篷'),(23,'纺织纱线'),
(26,'花边配饰'),(36,'金融物管'),(34,'烟草烟具'),(37,'建筑修理'),(45,'社会服务');

CREATE TABLE user_brands(
	  user INT(11) NOT NULL DEFAULT '0',
	  brand INT(20) NOT NULL DEFAULT '0',
	  trash_status INT(11) DEFAULT '1',
	  PRIMARY KEY (user,brand),
	  KEY fk_user_brand_brand (brand),
	  CONSTRAINT fk_user_brand_brand FOREIGN KEY (brand) REFERENCES brands (id) ON DELETE CASCADE,
	  CONSTRAINT fk_user_brand_user FOREIGN KEY (user) REFERENCES users (user_id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

alter table brands add column image_url varchar(200) default null;

ALTER TABLE sell_patent_goods ADD COLUMN transferor VARCHAR(60) NOT NULL;

ALTER TABLE sell_patent_goods ADD COLUMN patent_image_url VARCHAR(300);

INSERT INTO sell_first_column(patent_first_column_id,patent_first_column_name)VALUES
(1,'日常生活领域'),(2,'农林渔牧/食品'),(3,'医疗/保健/美容'),(4,'机电/能源/环保'),(5,'化工/冶金/纺织'),(6,'建筑/交通/通讯');


UPDATE patents SET transaction_status=1 WHERE transaction_status IS NULL;
UPDATE patents SET transaction_status=2 WHERE transaction_status='出售中';
UPDATE patents SET transaction_status=3 WHERE transaction_status='已出售';
ALTER TABLE patents MODIFY COLUMN transaction_status INT DEFAULT 0 COMMENT '0 待发布,1 待交易，2 已预订, 3 已付款待变更,4 已变更待合格、5 交易成功';

ALTER TABLE sell_patent_goods ADD COLUMN description VARCHAR(300) COMMENT '说明描述';
ALTER TABLE sell_patent_goods MODIFY COLUMN STATUS INT DEFAULT 0 COMMENT '0 待发布,1 待交易，2 已预订, 3 已付款待变更,4 已变更待合格、5 交易成功';

UPDATE patents SET transaction_status=0 WHERE transaction_status=1;
UPDATE sell_patent_goods SET STATUS=0 WHERE STATUS=1;

ALTER TABLE user_patents ADD COLUMN annual_fee_monitor_status INT DEFAULT 0 COMMENT '0 表示不监控 1 表示处于监控状态';

insert into groups (group_name) values ("BATCH_PAPER");
insert into group_authorities(group_id,authority) values (10,"ROLE_BATCH_PAPER");

ALTER TABLE notices ADD COLUMN star_target_monitor_status INT DEFAULT 0 COMMENT '0 表示不监控 1 表示处于监控状态';
ALTER TABLE user_patents ADD COLUMN patent_remark varchar(300) COMMENT '通知书备注';

INSERT INTO news_type (type_id, type_name)
VALUES
	(1, '今日热点'),
	(2, '科技前沿'),
	(3, '漫画西游'),
	(4, '爆笑西游'),
	(5, '创意生活'),
	(6, '创意产品'),
	(7, '创意设计'),
	(8, '创业者说'),
	(9, '创业新闻'),
	(10, '创业政策'),
	(11, '专利新闻'),
	(12, '专利学习'),
	(13, '商标资讯'),
	(14, '商标学习');
	
	
CREATE TABLE brand_legal_status (
	legal_status_id  INT NOT NULL AUTO_INCREMENT ,
	legal_status_name  VARCHAR(100) NOT NULL ,
	PRIMARY KEY (legal_status_id)
);

INSERT INTO brand_legal_status (legal_status_id,legal_status_name)VALUES
(1,'新注册'),(2,'审核中'),(3,'初审公告'),
(4,'核准注册'),(5,'商标驳回'),(6,'驳回复审'),(7,'异议撤销'),(8,'已无效');

CREATE TABLE brand_management (
  id INT(11) NOT NULL AUTO_INCREMENT,
  user INT(11) NOT NULL,
  legal_status INT(11) NOT NULL,
  category_id INT(11) NOT NULL,
  app_no VARCHAR(100)  NULL,
  brand_no VARCHAR(100)  NULL,
  name VARCHAR(100) NOT NULL,
  similar_no VARCHAR(300) DEFAULT NULL COMMENT '类似群号',
  scope VARCHAR(500) DEFAULT NULL,
  transaction_status INT(11) DEFAULT '0' COMMENT '0 待发布,1 待交易，2 已预订, 3 已付款待变更,4 已变更待合格、5 交易成功',
  transaction_mode TINYINT(4) DEFAULT '1' COMMENT '1 出售  2转让',
  price INT(11) NOT NULL,
  app_person VARCHAR(100) DEFAULT NULL,
  app_date date DEFAULT NULL,
  publish_date date DEFAULT NULL,
  originality VARCHAR(500) DEFAULT NULL,
  case_status VARCHAR(10) DEFAULT NULL,
  image_url VARCHAR(200) DEFAULT NULL,
  proxy_file VARCHAR(200) DEFAULT NULL COMMENT '上传委托书保存地址',
  business_license VARCHAR(200) DEFAULT NULL COMMENT '上传企业营业执照保存地址',
  entity_license VARCHAR(200) DEFAULT NULL COMMENT '上传事业单位营业执照保存地址',
  individual_license VARCHAR(200) DEFAULT NULL COMMENT '上传个体工商营业执照保存地址',
  identity_card VARCHAR(200) DEFAULT NULL COMMENT '上传身份证保存地址',
  application VARCHAR(200) DEFAULT NULL COMMENT '上传申请书保存地址',
  create_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (id),
  KEY fk_brand_management_users (user),
  KEY fk_brand_management_category (category_id),
  KEY fk_brand_management_legal_status (legal_status),
  CONSTRAINT fk_brand_management_category FOREIGN KEY (category_id) REFERENCES brand_category (category_id),
  CONSTRAINT fk_brand_management_legal_status FOREIGN KEY (legal_status) REFERENCES brand_legal_status (legal_status_id),
  CONSTRAINT fk_brand_management_users FOREIGN KEY (user) REFERENCES users (user_id)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE user_brand_management (
  user INT(11) NOT NULL DEFAULT '0',
  brand INT(20) NOT NULL DEFAULT '0',
  trash_status INT(11) DEFAULT '1',
  PRIMARY KEY (user,brand),
  KEY fk_user_brand_management (brand),
  CONSTRAINT fk_user_brand_management_brand FOREIGN KEY (brand) REFERENCES brand_management (id) ON DELETE CASCADE,
  CONSTRAINT fk_user_brand_management_user FOREIGN KEY (user) REFERENCES users (user_id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS brand_notice_types (
	notice_type_id INT AUTO_INCREMENT PRIMARY KEY, 
	notice_type_desc VARCHAR(30)
);

INSERT INTO brand_notice_types (notice_type_id, notice_type_desc)
VALUES
	(1, '受理书'),
	(2, '补正通知'),
	(3, '初审公告'),
	(4, '商标证书'),
	(5, '驳回通知'),
	(6, '其他通知');
	
CREATE TABLE IF NOT EXISTS brand_management_notices (
	notice_id     BIGINT AUTO_INCREMENT PRIMARY KEY, 
	brand         INT(11) NOT NULL,
	dispatch_date DATE,
	notice_name   VARCHAR(100), 
	notice_type   INT, 
	notice_sequence VARCHAR(30), 
	dispatch_sequence VARCHAR(30), 
	time_limit INT,
	notice_code VARCHAR(30), 
	zip_bid VARCHAR(30),
	dmh_flag VARCHAR(10), 
	archive_no VARCHAR(30), 
	zipfile_name VARCHAR(100),
	process_status INT DEFAULT 1 NOT NULL, 
	process_user INT,
	paper_apply_type INT DEFAULT 1 NOT NULL,
	star_target_monitor_status INT DEFAULT 0 COMMENT '0 表示不监控 1 表示处于监控状态',
	UNIQUE KEY uk_brand_management_notices_brand_notice_sequence (brand, notice_sequence),
		
	CONSTRAINT fk_brand_management_notices_brand FOREIGN KEY idx_fk_brand_management_notices_brand (brand) REFERENCES brand_management(id) ON DELETE CASCADE,
	CONSTRAINT fk_brand_management_notices_process_status FOREIGN KEY idx_fk_brand_management_notices_process_status (process_status) REFERENCES notice_process_status(notice_process_status_id),
	CONSTRAINT fk_brand_management_notices_process_user FOREIGN KEY idx_fk_brand_management_notices_process_user (process_user) REFERENCES users(user_id),
	CONSTRAINT fk_brand_management_notices_notice_type FOREIGN KEY idx_fk_brand_management_notices_type (notice_type) REFERENCES brand_notice_types(notice_type_id),
	CONSTRAINT fk_brand_management_notices_paper_apply_type FOREIGN KEY idx_fk_brand_management_notices_paper_apply_type (paper_apply_type) REFERENCES notice_paper_apply_types(notice_paper_apply_type_id)
);

CREATE TABLE IF NOT EXISTS brand_notice_read (
	notice_id BIGINT NOT NULL,
	user_id INT NOT NULL,
	PRIMARY KEY (notice_id,user_id)
);
