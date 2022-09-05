create table employee(emp_id number(10)not null , emp_fname varchar2(20)not null ,emp_lname varchar2(20) not null,emp_number varchar2(20) not null, CONSTRAINT emp_pk PRIMARY KEY (emp_id));
ALTER TABLE employee
ADD CONSTRAINT UC_employeenum UNIQUE (emp_number); 
desc services;
drop table employee;
create table customer(c_id number(10) not null, c_fname varchar2(20)not null, c_lname varchar2(20) not null, age number(10) not null , address varchar2(30) not null ,CONSTRAINT customer_pk PRIMARY KEY (c_id));

create table bill(bill_id number (10) not null, c_id number(10) not null, quantity number(10) not null, bill_amount number(10) not null, CONSTRAINT bill_pk PRIMARY KEY (bill_id));

create table services(s_id number (10) not null, emp_id number(10) not null, service_name varchar2(20) not null , price number(10) not null, CONSTRAINT service_pk PRIMARY KEY (s_id));
desc service;
drop table service;
create table transactions(t_id number(10) not null , c_id number(10) not null,s_id number (10) not null,bill_id number (10) not null , CONSTRAINT transaction_pk PRIMARY KEY (t_id));

create table delivery(d_id number(10) not null,emp_id number(10) not null,c_id number(10) not null, status varchar2(20)not null, CONSTRAINT delivery_pk PRIMARY KEY (d_id));

create table supplylist(sup_id number(10) not null, supplier varchar2(20) not null, supply_item varchar2(20) not null, CONSTRAINT supply_pk PRIMARY KEY (sup_id));

create table inventory(in_id number(10) not null, sup_id number(10) not null, item varchar2(20) not null , item_quantity number(7) not null, CONSTRAINT inventory_pk PRIMARY KEY (in_id));

create table payment(pay_id number(10) not null , c_id number(10) not null, payment_status varchar2(20) not null, CONSTRAINT payment_pk PRIMARY KEY (pay_id));

create table unregistered_customer(un_id number(10) not null, u_fname varchar2(20)not null, u_lname varchar2(20) not null, age number(10) not null , address varchar2(30) not null ,CONSTRAINT unregistered_customer_pk PRIMARY KEY (un_id));

create table modeofpayment(mode_id number(6) not null, paidby varchar2(20) not null, CONSTRAINT mode_pk PRIMARY KEY (mode_id));

ALTER TABLE clothes 
ADD date_ date ;



ALTER TABLE bill
ADD CONSTRAINT fk_customer
  FOREIGN KEY (c_id)
  REFERENCES customer(c_id);
  
ALTER TABLE transactions
ADD CONSTRAINT services_fk
  FOREIGN KEY (s_id)
  REFERENCES services(s_id);
  
ALTER TABLE inventory
 ADD CONSTRAINT fk_supplier
  FOREIGN KEY (sup_id)
  REFERENCES supplylist(sup_id);
  
  Alter Table payment ADD CONSTRAINT FK_PAYMENTcust FOREIGN KEY (c_id) references customer;
  
  alter table payment add mode_id number(6) ;
  ALTER TABLE payment
ADD CONSTRAINT fk_modeofpayment
  FOREIGN KEY (mode_id)
  REFERENCES modeofpayment(mode_id);
  
  select * from payment;
  insert into payment(pay_id,c_id,payment_status)values(6,6,'Pending');
  
  insert into customer(c_id,c_fname,c_lname,age,address) values (7,'Mahesh','jayal',19,'mapusa');
  select * from customer order by c_id;
  insert into employee(emp_id,emp_fname,emp_lname,emp_number) values (4,'Rach','Naik',989765353);
  insert into services(s_id,emp_id,service_name,price)values(3,3,'Ironing',80);
  
  insert into modeofpayment(mode_id,paidby)values(3,'E-wallet');
  select * from modeofpayment;
  select * from payment;
  update payment set mode_id=1 where pay_id=4;
  
  select * from clothes order by cl_id;
  desc clothes;
  
  UPDATE clothes
SET date_ = '24/08/2021'
WHERE Cl_id = 7;
  /* 1st Report */
  select emp_fname,service_name from employee inner join  services on employee.emp_id= services.emp_id;
select * from supplylist;
insert into supplylist(sup_id,supplier,supply_item)values(3,'bini','fabric_freshner');
  
  desc inventory;
  insert into inventory(in_id,sup_id,item,item_quantity)values(3,3,'fabric_freshner',20);
  
  
    /* 2nd Report */
  select item,supplier from inventory inner join supplylist on inventory.sup_id=supplylist.sup_id;
  
    select * from  customer order by c_id;
  
  
create table clothes(cl_id number(10) not null, c_id number(10) not null,s_id number (10) not null, clothtype varchar2(20) not null, cloth_quantity varchar2(20) not null , CONSTRAINT cloth_pk PRIMARY KEY (cl_id));
  
  
 ALTER TABLE clothes
ADD CONSTRAINT fk_customers
  FOREIGN KEY (c_id)
  REFERENCES customer(c_id); 
  
  ALTER TABLE clothes
ADD CONSTRAINT servicesfk
  FOREIGN KEY (s_id)
  REFERENCES services(s_id);
  
  select * from customer order by c_id;
  select * from services order by s_id;
  select * from clothes order by cl_id;
  insert into clothes(cl_id,c_id,s_id,clothtype,cloth_quantity,date_)values(7,6,3,'bedsheets',1);
  
  select * from employee order by emp_id;
  
    /* 3rd Report */
  select c_fname,service_name,clothtype from clothes
  inner join  customer on clothes.c_id=customer.c_id
  inner join services on clothes.s_id=services.s_id;
  
  select * from  bill;
  insert into bill(bill_id,c_id,quantity,bill_amount)values(5,4,5,1000);
  select * from customer;
  
  
    /* 4th Report */
  select c_fname, quantity, bill_amount from customer
   left join bill on customer.c_id = bill.c_id ;
   select * from payment;
   select * from customer order by c_id;
   select * from clothes order by cl_id;
  
  desc delivery;
  
  insert into delivery ( d_id,emp_id,c_id, status)values(4,4,4,'pending');
  select * from delivery;
  
  
  /* 5th Report */
   select c_fname , status from delivery
    inner join customer on customer.c_id=delivery.c_id where status='pending'; 
  
  select * from transactions order by t_id;
  desc transactions;
  insert into transactions(t_id,c_id,s_id,bill_id) values(5,4,2,5);
  
    /* 6th Report */
    select c_fname,service_name,bill_amount from transactions
    inner join customer on customer.c_id=transactions.c_id
    inner join services on services.s_id=transactions.s_id
    inner join bill on bill.bill_id = transactions.bill_id where c_id=1 ;
     
      /* 7th Report */
  select count(s_id) as No_of_service, s_id from clothes group by s_id;
   
      
          insert into customer(c_id,c_fname,c_lname,age,address) values (7,'Mahesh','jayal',19,'mapusa');
            insert into customer(c_id,c_fname,c_lname,age,address) values (8,'ajit','negi',26,'panjim');
        
        select * from unregistered_customer order by un_id;
        
        delete from customer where c_id=7;
        delete from customer where c_id=8;
     /* 8th Report */  
 create or replace trigger t_del
    before delete on customer
    for each row
    begin
      insert into unregistered_customer values(:OLD.c_id, :OLD.c_fname, :OLD.c_lname, :OLD.age, :OLD.address);
   end t_del;
   /

          
          /* 9th Report */
          select c_fname,date_ from clothes
          inner join customer on customer.c_id=clothes.c_id where date_  between '21-08-21' and '25-08-21';
          
          select * from clothes order by cl_id;
          
          
          
            /* 10th Report */
SELECT
    c_fname,
    age,
    CASE WHEN age <= 20 THEN 'young'
         WHEN age >=21   THEN 'adult'
         END AS age_group
FROM customer
ORDER BY
    age;
              
           
              
              /* 11th Report */
              
 DECLARE
    empfname employee.emp_fname%TYPE;
    employeeid employee.emp_id%TYPE := &emp_id;
BEGIN
    -- get the employee
    SELECT emp_fname INTO empfname
    FROM employee
    WHERE emp_id = employeeid;
    
    -- show the employee name   
    dbms_output.put_line('employee name is ' || empfname);
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Employee ' || employeeid ||  ' does not exist');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('The database returns more than one employee');    
END;
/
              
             
               
                /* 12th Report */
                
                
                 SELECT c_fname,bill_amount
                 FROM bill
                INNER JOIN customer ON customer.c_id = bill.c_id
                 WHERE bill_amount =
                (SELECT max(bill_amount) FROM bill);
                
                select c_fname,bill from bill;
                
                
                  /* 13th Report */
                  select * from services order by s_id;
 DECLARE 
 totalrows number(2);
BEGIN
 UPDATE services
 SET price = price + 10;
 IF sql%notfound THEN
 dbms_output.put_line('no services selected');
 ELSIF sql%found THEN
 totalrows := sql%rowcount;
 dbms_output.put_line( totalrows || ' services selected ');
 END IF; 
END;
/
                    /* 14th Report */
DECLARE
 c_id customer.c_id%type;
 c_name customer.c_fname%type;
 c_addr customer.address%type;
 CURSOR c_customers is
 SELECT c_id, c_fname, address FROM customer order by c_id;
BEGIN
 OPEN c_customers;
 LOOP
 FETCH c_customers into c_id, c_name, c_addr;
 EXIT WHEN c_customers%notfound;
 dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);
 END LOOP;
 CLOSE c_customers;
END;
/

 /* 15th Report */                  
DECLARE
 empfname employee.emp_fname%type;
 c_name customer.c_fname%type;
 d_status delivery.status%type;
 CURSOR d_delivery is
 SELECT emp_fname, c_fname, status FROM delivery 
 inner join customer on customer.c_id=delivery.c_id
 inner join employee on employee.emp_id = delivery.emp_id;
BEGIN
 OPEN d_delivery;
 LOOP
 FETCH d_delivery into empfname, c_name, d_status;
 EXIT WHEN d_delivery%notfound;
 dbms_output.put_line(empfname || ' ' || c_name || ' ' || d_status);
 END LOOP;
 CLOSE d_delivery;
END;
/
set serverout on;
                      
 select table_name, constraint_name, constraint_type from user_constraints 
where table_name like 'INV%' and constraint_type in ('P', 'C', 'R','U');

 select table_name, constraint_name, constraint_type from user_constraints 
where table_name like 'TRANSACTIONS%' and constraint_type in ('P', 'C', 'R','U');

 select table_name, constraint_name, constraint_type from user_constraints 
where table_name like 'DELIVERY%' and constraint_type in ('P', 'C', 'R','U');

 select table_name, constraint_name, constraint_type from user_constraints 
where table_name like 'SERVICES%' and constraint_type in ('P', 'C', 'R','U');

 select table_name, constraint_name, constraint_type from user_constraints 
where table_name like 'CLOTHES%' and constraint_type in ('P', 'C', 'R','U');

 select table_name, constraint_name, constraint_type from user_constraints 
where table_name like 'BILL%' and constraint_type in ('P', 'C', 'R','U');

 select table_name, constraint_name, constraint_type from user_constraints 
where table_name like 'PAYMENT%' and constraint_type in ('P', 'C', 'R','U');

select * from unregistered_customer order by un_id;

select * from customer order by c_id;
select * from clothes order by cl_id;
select * from services order by s_id;
select * from bill order by bill_id;
select * from payment order by pay_id;

CREATE SEQUENCE clothes_seq
  MINVALUE 1
  START WITH 8
  INCREMENT BY 1
  CACHE 20;
  
  CREATE SEQUENCE bill_seq
  MINVALUE 1
  START WITH 6
  INCREMENT BY 1
  CACHE 20;
