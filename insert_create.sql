DROP DATABASE food_ordering;
CREATE DATABASE food_ordering;
\c food_ordering
Create Table customer(cust_id int NOT NULL, UNIQUE(cust_id), Primary key(cust_id), cust_name varchar(100) NOT NULL, cust_phno varchar(10) NOT NULL, cust_add varchar(150) NOT NULL);
Create Table account_info(c_emailid varchar(75) NOT NULL, c_username varchar(35) NOT NULL, UNIQUE(c_username), Primary key(c_username), c_password varchar(25) NOT NULL, f_name varchar(35) NOT NULL, m_name varchar(24), l_name varchar(41) NOT NULL, c_id int NOT NULL, Foreign key(c_id) references customer(cust_id));
Create Table cust_ph_num(cust_id int NOT NULL, Primary key(cust_id), Foreign key(cust_id) references customer(cust_id), c_phno varchar(10) NOT NULL);
Create Table cust_address(cust_id int NOT NULL, Primary key(cust_id), Foreign key(cust_id) references customer(cust_id), street_no int, flat_no int, building_name varchar(50), city varchar(25) NOT NULL, state varchar(25) NOT NULL);
Create Table order_info(o_id int NOT NULL, Primary key(o_id), o_date date NOT NULL, o_time time NOT NULL, o_cust_id int NOT NULL, Foreign key(o_cust_id) references customer(cust_id));
Create Table restaurant(r_name varchar(50) NOT NULL, r_ph_no varchar(10), r_addr varchar(100), rest_o_id int NOT NULL, Primary key(rest_o_id), Foreign key(rest_o_id) references order_info(o_id));
Create Table menu_type(type_id int NOT NULL, Primary key(type_id), type_name varchar(25) NOT NULL, type_description varchar(150));
Create Table menu(item_name varchar(50) NOT NULL, item_quantity int NOT NULL, item_id int NOT NULL, Primary key(item_id), item_price int NOT NULL, item_type_id int NOT NULL, Foreign key(item_type_id) references menu_type(type_id));
Create Table order_summary(os_id int NOT NULL, Primary key(os_id), os_o_id int NOT NULL, Foreign key(os_o_id) references order_info(o_id), os_amount int NOT NULL);
Create Table delivery(delivery_adrr varchar(100) NOT NULL, arrival_time time, delivery_id int NOT NULL, Primary key(delivery_id), departure_time time NOT NULL);
Create Table rating(r_o_id int NOT NULL, Foreign key(r_o_id) references order_info(o_id), r_remarks varchar(100),  r_score int, r_id int NOT NULL, Primary key(r_id), r_cust_id int NOT NULL, Foreign key(r_cust_id) references customer(cust_id));
create table payment(pay_id int NOT NULL,Primary key(pay_id),pay_type varchar(15) NOT NULL,pay_o_id int NOT NULL,Foreign key(pay_o_id) references order_info(o_id),pay_os_amount int NOT NULL,pay_verification varchar(3) NOT NULL);


INSERT into customer values(001, 'deepali', '9373276325', 'bangalore');
INSERT into customer values(002, 'neha', '2234567890', 'bangalore');
INSERT into customer values(003, 'lasya', '2334567890', 'bangalore');
INSERT into customer values(004, 'arya', '2344567890', 'kannur');
INSERT into customer values(005, 'preethi', '2345567890', 'noida');
INSERT into customer values(006, 'zyan', '2346567890', 'bangalore');
INSERT into customer values(007, 'akshay', '3346567890', 'ameerpet');


INSERT into account_info values('deepali@email.com', 'deepali26', 'mypassword', 'deepali', 'suraj', 'attavar', 001);
INSERT into account_info values('neha@email.com', 'neha09', 'password123', 'neha', '', 'beru', 002);
INSERT into account_info values('lasya@email.com', 'lasya2k01', 'pass123', 'dhanawada', 'lasya', 'priya', 003);
INSERT into account_info values('arya@email.com', 'arya55', 'pswd55', 'arya', '', 'shetty', 004);
INSERT into account_info values('preethi10@email.com', 'preet01', 'preet001', 'preethi', 'nayak', '', 005);
INSERT into account_info values('zyan10@email.com', 'zy1234', 'zyan6', 'zyan', 'louis', '', 006);
INSERT into account_info values('akshay@email.com', 'akki123', 'sai', 'akshay', 'raj', '', 007);


INSERT into cust_ph_num values(001, '9373276325');
INSERT into cust_ph_num values(002, '9274283981');
INSERT into cust_ph_num values(003, '6983468963');
INSERT into cust_ph_num values(004, '6362177660');
INSERT into cust_ph_num values(005, '9391748809');
INSERT into cust_ph_num values(006, '8939331109');
INSERT into cust_ph_num values(007, '9974531005');


INSERT into cust_address values(001, 24, 1603, 'cadenza', 'bangalore', 'karnataka');
INSERT into cust_address values(002,3,209, 'duo enclave', 'bangalore', 'karnataka');
INSERT into cust_address values(003,3,1101, 'SNN', 'bangalore', 'karnataka');
INSERT into cust_address values(004,6,10, 'supernova', 'kannur', 'kerala');
INSERT into cust_address values(005,2,2211, 'panorama', 'noida', 'delhi');
INSERT into cust_address values(006,18,1261, 'brigade', 'bangalore', 'karnataka');
INSERT into cust_address values(007,3,676, 'ss serinity', 'ameerpet', 'hyderabad');


INSERT into order_info values(010, '13-10-2021', '16:51:30', 001);
INSERT into order_info values(011, '3-10-2021', '13:11:30', 002);
INSERT into order_info values(012, '3-10-2021', '14:52:06', 003);
INSERT into order_info values(002, '5-10-2021', '5:29:11', 004);
INSERT into order_info values(021, '6-10-2021', '9:32:01', 005);
INSERT into order_info values(019, '7-10-2021', '8:19:20', 006);
INSERT into order_info values(033, '8-10-2021', '15:44:58', 007);


INSERT into restaurant values('cafe azzure', '12345', 'hsr layout', 010);
INSERT into restaurant values('46 ounces', '9876543210', 'ec city', 011);
INSERT into restaurant values('chin lungs', '9789388323', 'koramangala', 012);
INSERT into restaurant values('mcdonalds', '9281086502', 'hsr layout', 002);
INSERT into restaurant values('mod', '8398592564', 'hsr layout', 021);
INSERT into restaurant values('truffles', '8385893469', 'kormanagala', 019);
INSERT into restaurant values('hightide', '9237523623', 'bannerghatta', 033);


INSERT into menu_type values(123, 'food menu', 'multi cuisine');
INSERT into menu_type values(303, 'food menu', 'multi cuisine');
INSERT into menu_type values(100, 'drinks menu', 'multi cuisine');
INSERT into menu_type values(335, 'food menu', 'multi cuisine');
INSERT into menu_type values(012, 'food menu', 'italian');
INSERT into menu_type values(660, 'food menu', 'multi cuisine');
INSERT into menu_type values(111, 'drinks menu', 'multi cuisine');


INSERT into order_summary values(987, 010, 999);
INSERT into order_summary values(142, 011, 1587);
INSERT into order_summary values(822, 012, 599);
INSERT into order_summary values(421, 002, 2845);
INSERT into order_summary values(209, 021, 895);
INSERT into order_summary values(974, 019, 3390);
INSERT into order_summary values(233, 033, 1278);


INSERT into delivery values('bangalore', '18:00:00', 987, '17:10:23');
INSERT into delivery values('bangalore', '15:34:00', 142, '14:19:44');
INSERT into delivery values('bangalore', '15:45:00', 822, '15:20:14');
INSERT into delivery values('bangalore', '6:00:50', 421, '5:45:22');
INSERT into delivery values('noida', '10:33:50', 209, '10:08:42');
INSERT into delivery values('kannur', '9:05:13', 974, '8:35:52');
INSERT into delivery values('ameerpet', '16:26:53', 233, '15:55:55');


INSERT into rating values(010, 'good', 4, 456, 001);
INSERT into rating values(011, 'very good', 5, 743, 002);
INSERT into rating values(012, 'average',3,976, 003);
INSERT into rating values(002, 'good',4,457, 004);
INSERT into rating values(021, 'not good',2,176, 005);
INSERT into rating values(019, 'very good',5,386, 006);
INSERT into rating values(033, 'very good',5,655, 007);


INSERT into menu values('chicken BBQ pizza',1,111,305,123);
INSERT into menu values('peri peri fries',2,121,155,303);
INSERT into menu values('cold coffee',4,131,115,100);
INSERT into menu values('chocolate donuts',1,141,200,335);
INSERT into menu values('panner noodles',2,212,150,012);
INSERT into menu values('chicken wings',5,422,300,660);
INSERT into menu values('virgin mojito',3,243,199,111);


INSERT into payment values(234,'upi',010,999,'yes');
INSERT into payment values(431,'cod',011,1587,'yes');
INSERT into payment values(942,'credit card',012,599,'no');
INSERT into payment values(382,'cod',002,2845,'yes');
INSERT into payment values(432,'upi',021,895,'yes');
INSERT into payment values(933,'credit card',019,3390,'yes');
INSERT into payment values(294,'upi',033,1278,'no');



