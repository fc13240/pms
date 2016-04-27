insert into users(user_id, username, name, password, email, phone, join_date, enabled)
select u.id, u.username, u.first_name, u.password, u.email, null, u.date_joined, u.is_active
  from solotut.auth_user u;

insert into patents(patent_id, app_no, patent_name, patent_type, app_date, app_person, invent_person, patent_status, internal_code, patent_owner)
select p.id, p.app_no, p.name, 
	case p.s_type when '发明专利' then 1 when '外观设计' then 3 else 2 end type,
	p.app_date, p.app_person, p.invent_person, p.status_code, p.internal_code, p.user_id
  from solotut.patent_patent p;
	
insert into user_patents(user, patent)
select up.user_id, up.patent_id
from solotut.patent_user_patent up;

insert into friend_requests(from_user, to_user, message, request_process_status)
select distinct f.from_user_id, f.to_user_id, f.message, f.process_status
  from solotut.friend_request f
  where f.from_user_id in (select id from solotut.auth_user)
   and f.to_user_id in (select id from solotut.auth_user);

insert into friends(user, friend)
select distinct f.user_id, f.friend_id
  from solotut.friend_friend f
 where f.user_id in (select id from solotut.auth_user)
   and f.friend_id in (select id from solotut.auth_user);

insert into share_patents(patent, share_by, share_to)
select s.patent_no, s.shared_by_id, s.user_id
  from solotut.patent_share s
on duplicate key update share_by = shared_by_id;  
  
insert into fees(fee_id, deadline, fee_type, amount, fee_payment_status, patent, process_user, fee_monitor_status, fee_owner, invoice_title)
select f.id, f.end_date, f.type, f.amount, f.payment_status_id, f.patent_id, f.process_user_id, f.monitored + 1, f.owner_id, f.invoice_title
  from solotut.fees_fee f
on duplicate key update patent = patent_id;   
  
insert into notices(notice_id, notice_sequence, dispatch_sequence, time_limit, dispatch_date, notice_name, notice_code,
	zip_bid, dmh_flag, archive_no, zipfile_name, patent, process_status, process_user, notice_type, paper_apply_type)
select n.id, n.notice_id, n.fawen_sequence, n.time_limit, n.fawen_date, n.notice_name, n.notice_code,
	n.zip_bid, n.dmh_flag, n.anjuan_no, n.zipfile_name, n.patent_id, n.process_status, n.process_user_id, n.type_code, 
	case when n.paper_apply_type_id is null then 1 else n.paper_apply_type_id end paper_apply_type_id
  from solotut.notice_notice n 
 where n.patent_id in (select id from solotut.patent_patent)
on duplicate key update paper_apply_type = paper_apply_type_id;

insert into group_members(username, group_id) select username, 1 from users;
