CREATE OR REPLACE FUNCTION pay_verify()
returns trigger as $$
DECLARE status varchar(10);
BEGIN
select pay_verification into status from payment where pay_id=NEW.pay_id;
RAISE NOTICE 'Payment Status (%)',status;
return new; 
END;
$$
language plpgsql;

create trigger verifying after insert on payment for each row execute procedure pay_verify();

insert into payment values(678,'cod',010,1000,'yes');



CREATE OR REPLACE FUNCTION changing()
returns trigger as $$
DECLARE new_username varchar(35);
BEGIN
select c_username into new_username from account_info where c_id=NEW.c_id;
RAISE EXCEPTION 'CANNOT CHANGE USERNAME'; 	
return new;
END;
$$
language plpgsql;

create trigger cannotchange before update on account_info for each row execute procedure changing();

update account_info set c_username='d.eepali' where c_username='deepali26';



CREATE OR REPLACE FUNCTION ratings()
returns trigger as $$
DECLARE ratingscore int;
BEGIN
select r_score into ratingscore from rating where r_id=NEW.r_id;
if ratingscore>5 THEN RAISE EXCEPTION 'CANNOT RATE ABOVE 5';
END IF;
return new;
END;
$$
language plpgsql;

create trigger exceed after insert on rating for each row execute procedure ratings();

insert into rating values(010, 'amazing', 7, 124, 001);





CREATE OR REPLACE FUNCTION change_pass()
returns trigger as $$
DECLARE newpassword varchar(30); 
BEGIN
select c_password into newpassword from account_info where c_password=NEW.c_password;
RAISE NOTICE 'PASSWORD CHANGED';
return new; 
END;
$$
language plpgsql;

create trigger change after update on account_info for each row execute procedure change_pass();

update account_info SET c_password='newpassword' where c_username='deepali26';





CREATE OR REPLACE FUNCTION customers_in_city(city varchar(20))
returns void as $$
DECLARE 
c1 cursor for select cust_name from customer where cust_add=city;
r1 record;
BEGIN 
open c1;
fetch first from c1 into r1;
RAISE NOTICE 'Customer name: %', r1;
close c1;
END;
$$
language plpgsql;

select customer_in_city('bangalore');



CREATE OR REPLACE FUNCTION first_order()
returns void as $$
DECLARE 
c2 cursor for select * from order_info order by o_date, o_time;
r2 record;
BEGIN 
open c2;
fetch first from c2 into r2;
RAISE NOTICE 'First order date: %', r2.o_date;
RAISE NOTICE 'First order time: %', r2.o_time;
close c2;
END;
$$
language plpgsql;

select first_order();