----------UC1--------------

create database AddressBookSystem

use AddressBookSystem;
 
 -------------UC2------------------

create table Address_Book_Table
(
FirstName varchar(50) not null,
LastName varchar(20),
Address varchar(100),
City varchar(50),
StateName varchar(55),
ZipCode int,
Phonenum bigint,
EmailId varchar(100)
);

----------UC3-----------

Insert into Address_Book_Table values('girish','guptha','bazzar street','nellore','andhra',524406,7660094458,'v.g@gmail.com'),
('manoj','Kumar','tidel park','chennai','tamilNadu',600119,9989912345,'mm@gmail.com');
Insert into Address_Book_Table values('chandu','kanth','nandhalur','kadapa','andhra',523412,9848022338,'ck@gmail.com');

-------------UC4--------------

update Address_Book_Table set Phonenum=9989999899 where Address='tidel park';

update Address_Book_Table set EmailId='c.k@gmail.com' where FirstName='chandu';

select * from Address_Book_Table;

--------UC5---------

delete from Address_Book_Table where FirstName='manoj' and LastName='kumar';

---------UC6-------------

Select FirstName,LastName from Address_Book_Table where City='nellore' or StateName='andhra';

Select FirstName,LastName from Address_Book_Table where City='kadapa';

-----------UC7------------
Select Count(*) As Count,StateName,City from Address_Book_Table group by StateName,City;