import psycopg2
conn = psycopg2.connect(host="localhost",database="food_ordering",user="postgres",password="deepali")
cur = conn.cursor()
print('\nWELCOME TO YOUR FOOD ORDERING!')
a=input("\nEnter your username:")
cur.execute("select f_name from account_info")
row=cur.fetchall()
name=row[0][0]
print("\nHey",name,"! Here are all the queries that can be executed")
print("1. Restaurant details of your last placed order\n2. Order amount of your latest order\n3. Arrival details\n4. Your review of the latest order\n5. Your account information\n0. To exit the application")
fl = 1
while (fl == 1):        
        b=int(input("\nEnter your choice:"))        
        if b==1:
                cur.execute("select * from restaurant where rest_o_id=(select o_id from order_info where o_cust_id=(select c_id from account_info where c_username=(%s)))",[a]);
                row=cur.fetchall()
                print('Your order is placed at restaurant',row[0][0])
                print('It is located in',row[0][2])
                print('To contact your restaurant, Call ph no.',row[0][1])
        elif b==2:
                cur.execute("select * from order_summary where os_o_id=(select o_id from order_info where o_cust_id=(select c_id from account_info where c_username=(%s)))",[a]);
                row=cur.fetchall()
                print('Your order amount is', row[0][2])
        elif b==3:
                cur.execute("select * from delivery where delivery_id IN (select os_id from order_summary where os_o_id=(select o_id from order_info where o_cust_id=(select c_id from account_info where c_username=(%s))))",[a]);
                row=cur.fetchall()
                print('The estimated arrival time of your order is:',row[0][1])
                print('The delivery executive left the restaurant at:', row[0][3])
        elif b==4:
                cur.execute("select *from rating where r_cust_id=(select c_id from account_info where c_username=(%s))",[a]);
                row=cur.fetchall()
                print('You have rated your order:',row[0][2])
                print('Your remark:',row[0][1])
        elif b==5:
                cur.execute("select * from account_info where c_username=(%s)",[a]);
                row=cur.fetchall()
                print('ACCOUNT INFORMATION:')
                print('Name of the user:',row[0][3],row[0][4],row[0][5])
                print('Username:',row[0][1])
                print('Email id:',row[0][0])
                cur.execute("select c_phno from cust_ph_num where cust_id=(select c_id from account_info where c_username=(%s))",[a]);
                row=cur.fetchall()
                print('Phone number:',row[0][0])
                cur.execute("select *from  cust_address where cust_id=(select c_id from account_info where c_username=(%s))",[a]);
                row=cur.fetchall()
                print('ADDRESS:')
                print('Flat no:',row[0][2], ', Building name:',row[0][3], '\nStreet no:',row[0][1], '\nCity:',row[0][4], '\nState:',row[0][5])
        elif b==0:
                print ("Thank you",name,"!\nExiting the ONLINE ORDERING application.\n")
                fl=0
        else:
                print("Invalid choice, please enter a valid input")

cur.close()
conn.close()
