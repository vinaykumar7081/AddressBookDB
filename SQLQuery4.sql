-----UC1-Creating AddressBook DataBase-----
Create DataBase AddressBookDb;
Use AddressBookDb;
-----UC2-Creating table in AddressBookDb------


Create Table AddressBook
(
  FirstName varchar(30),LastName varchar(15), Address varchar(50), City Varchar(25), State varchar(25), Zip int, PhoneNumber varchar(10),EmailAddress varchar(50)
);

Select *from AddressBook;

Alter Table AddressBook
Add Id int NOT NULL primary key IDENTITY(101,1) ;

----UC3-Inserting Records in the AddressBook Table----
insert into AddressBook (  FirstName ,LastName , Address , City , State , Zip , PhoneNumber ,EmailAddress 
)
values

('Ajay','Kumar','IndraNagar','Lucknow','UP',226001,'8385427243','ajay123@gmail.com'),
('Vijay','Kumar','AmeerPet','Hyderabad','Telangana',500001,'8388427243','vijay123@gmail.com'),
('Raj','Pratap','VikasNagar','Delhi','Delhi',110001,'8385227243','raj123@gmail.com'),
('Ritesh','Arya','Dadar','Mumbai','MH',400007,'8385457243','ritesh123@gmail.com'),
('Rahul','Pandey','IndraNagar','Pune','MH',400008,'8385447243','rahul123@gmail.com'),
('Raman','Mishra','Ahmedabad','Gujrat','Gujrat',380001,'8385827243','Raman123@gmail.com'

);

---UC4-Update tble AddressBook with the Help of Name-----

update AddressBook
set LastName='Dubey',Address='AwasVikash',City='Basti', State='UP' where FirstName='Rahul';

-----UC5-Deleting Parson from AddressBook Table Using Person Name-----

Delete from AddressBook where FirstName='Raman';

-----UC6-Retieve the Person Details From AddressBook Table With the Help of City of state----

select *from AddressBook where City='Lucknow';

select *from AddressBook where State='UP';

----UC7-Display yhe Size of the AddressBook with The Help of City and State-----

select Count(City) from AddressBook;

select Count(State) from AddressBook where State='UP';

----UC8-Sorting AddressBook Table city Alphabetically By Persons FirstName---

select City from AddressBook Order by FirstName;

----UC9-Adding  Two New Column in AddressBook Table Column Name Relation Type and Name

Alter  Table AddressBook 
Add FullName varchar(50),RelationType varchar(50);

Select * from AddressBook;
update AddressBook
set FullName='Ajay Kumar', RelationType='Friend' where FirstName='Rahul';

-----UC10-Dispaly the Number Count by RelatinShip type-----

select PhoneNumber   from AddressBook where RelationType='Friend';