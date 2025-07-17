create database firstdb

use firstdb;

create table cust_1(
c_id int identity(1,1) primary key,
f_name nvarchar(50),
l_name nvarchar(50),
email nvarchar(100),
p_number nvarchar(50),
createdat datetime default getdate()

);
