insert into users(user_id, username, password, email, name)
select u.id, u.username, u.password, u.email, u.first_name
from pms.auth_user u;

insert into patents(patent_id, app_no, patent_name, patent_type, app_date, app_person, invent_person, patent_status, internal_code, patent_owner)
select p.id, p.app_no, p.name, p.type_code, p.app_date, p.app_person, p.invent_person, p.status_code, p.internal_code, p.user_id
from pms.patent_patent p;
	
insert into user_patents(user, patent)
select up.user_id, up.patent_id
from pms.patent_user_patent up;

insert into friend_requests(from_user, to_user, message, request_process_status)
select distinct f.from_user_id, f.to_user_id, f.message, f.process_status
  from pms.friend_request f;

insert into friends(user, friend)
select distinct f.user_id, f.friend_id
  from pms.friend_friend f;

insert into share_patents(patent, share_by, share_to)
select s.patent_no, s.shared_by_id, s.user_id
  from pms.patent_share s;
  
insert into fees(fee_id, deadline, fee_type, amount, fee_payment_status, patent, process_user, fee_monitor_status, fee_owner, invoice_title)
select f.id, f.end_date, f.type, f.amount, f.payment_status_id, f.patent_id, f.process_user_id, f.monitored + 1, f.owner_id, f.invoice_title
  from pms.fees_fee f;  