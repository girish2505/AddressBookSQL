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

---------UC8------------

select FirstName,LastName from Address_Book_Table where StateName='andhra' order by FirstName;

----------UC9---------------
alter table Address_Book_Table
add AddressBookName varchar(50),
RelationType varchar(50)


update Address_Book_Table
set AddressBookName='Friend',RelationType='Friend'
where FirstName='girish' 


update Address_Book_Table
set AddressBookName='Cousin',RelationType='Family'
where ZipCode=523412;

---------UC10----
Select count(*)as CountType, RelationType  from Address_Book_Table group by RelationType;

---------UC11-----------

create table Address_Book(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(100)
)
---Insert the values in Address_Book
Insert into Address_Book values ('crazy'),('dumb');
---Retrieve the data
select * from Address_Book;
--Create Contact_Person
create table Contact_Person(
AddressBook_ID int,
ContactID int identity(1,1) primary key,
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
StateName varchar(100),
ZipCode BigInt,
PhoneNum BigInt,
EmailId varchar(200),
foreign key (AddressBook_ID) references Address_Book(AddressBookID));
--Insert the values 
Insert into Contact_Person values
(1,'eswar','yasash','nizampet','hyderabad','telangana',543215,7688876888,'eswar@gmail.com'),
(2,'madhu','varri','mg road','vijayawada',' andhra',532678,9182501714,'madhu.22@gmail.com'),
(2,'manoj','Kumar','tidel park','chennai','tamilNadu',600119,9989912345,'mm@gmail.com'),
(1,'girish','guptha','bazzar street','nellore','andhra',524406,7660094458,'v.g@gmail.com');
--Retrieve the data
select * from Contact_Person;
---Create contact_type table
create table Contact_Type
(ContactTypeID int identity(1,1) primary key,
ContactTypeName varchar(100)
)
---Insert the values in contat_type
Insert into Contact_Type values
('Family'),('Friends');
--Retrieve the data
Select * from Contact_Type;
---Create relation type table
create Table Relation_Type(
ContactType_ID int,
Contact_ID int,
foreign key (ContactType_ID) references Contact_Type(ContactTypeID),
foreign key (Contact_ID) references Contact_Person(ContactID)
)
---Insert the values in relation_type
insert into Relation_Type values
(1,1),
(2,2),
(1,3),
(1,4)

--Retrieve the data
Select * from Relation_Type;
----------UC12---------
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Address_Book 
Full JOIN Contact_Person on Address_Book.AddressBookID=Contact_Person.AddressBook_ID 
Full JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
Full JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID

--------UC13--------
----UC6---
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID and (City='Chennai' or StateName='tamilNadu')
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
----UC7----
select Count(*)As CountOfStateAndCity ,StateName,City
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
Group by StateName,City
-----UC8-----
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
INNER JOIN Relation_Type on Relation_Type.Contact_Id=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
order by(FirstName)
---	UC9----
select Count(*) as NumberOfContacts,Contact_Type.ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
Group by ContactTypeName
