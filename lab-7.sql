use master
create database storeTable
---to use database university
use storeTable

create table customer
(
cusl_id CHAR(6) PRIMARy KEY CHECK (cusl_id LIKE('[CS][0-9][0-9][0-9][0-9][0-9]')),
cusl_fname CHAR(15) NOT NULL,
cusl_lname VARCHAR (15),
cusl_address TEXT
)

INSERT customer
(cusl_id,cusl_fname,cusl_lname,cusl_address) VALUES
('S00003','imran','hossain','kushtia,kushtia ');

select * from customer;
delete from customer;

create table Item
(
item_id char(6) primary key check (item_id like ('[P][0-9][0-9][0-9][0-9][0-9]')),
item_name char(12),
item_catagory char(10),
item_price float check(item_price>=0),
item_qoh int check(item_qoh>=0),
item_last_sold datetime  default getdate()
)

insert Item(item_id ,item_name,item_catagory,item_price ,item_qoh ,item_last_sold)
values('P00009','infinix','phone',57.8,23,'3-2-15')
insert Item(item_id ,item_name,item_catagory,item_price ,item_qoh )
values('P00002','hp','laptop',56.8,23)

select * from Item
delete from Item;

create table transactions
(
tran_id char(10) primary key check (tran_id like '[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id char(6) foreign key references Item(item_id), 
cusl_id char(6) foreign key references customer(cusl_id) ,
tran_type char(1),
tran_quantity int check (tran_quantity>=0),
tran_date datetime default getdate()
)

insert transactions(tran_id ,item_id,cusl_id,tran_type,tran_quantity) values('T000000001','P00002','S00003','s',10);
select * from transactions;
--drop table transactions 

--trigger
CREATE TRIGGER test on Items FOR INSERT
AS
BEGIN
declare @item_id char(5),@amount char(12),@tran_type char(1)
select @item_id=item_id,@amount=tran_quantity,@tran_type=tran_type from inserted
IF(@tran_type = 's')
update Items set item_qoh=item_qoh
where item_id=@item_id
ELSE
update Items set item_qoh=@item_qoh +
@amount where item_id=@item_id
END


