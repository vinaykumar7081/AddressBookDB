-----UC1-Creating AddressBook DataBase-----
Create DataBase AddressBookDb;
Use AddressBookDb;
-----UC2-Creating table in AddressBookDb------


Create Table AddressBookService
(
   Id int NOT NULL Primary key Identity(101,1),FirstName varchar(30),LastName varchar(15), Address varchar(50), City Varchar(25), State varchar(25), Zip int, PhoneNumber varchar(10),EmailAddress varchar(50)
);

Select *from AddressBookService;


----UC3-Inserting Records in the AddressBook Table----
insert into AddressBookService (  FirstName ,LastName , Address , City , State , Zip , PhoneNumber ,EmailAddress 
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

update AddressBookService
set LastName='Dubey',Address='AwasVikash',City='Basti', State='UP' where FirstName='Rahul';

-----UC5-Deleting Parson from AddressBook Table Using Person Name-----

Delete from AddressBookService where FirstName='Raman';

-----UC6-Retieve the Person Details From AddressBook Table With the Help of City of state----

select *from AddressBookService where City='Lucknow';

select *from AddressBookService where State='UP';

----UC7-Display yhe Size of the AddressBook with The Help of City and State-----

select Count(City) from AddressBookService;

select Count(State) from AddressBookService where State='UP';

----UC8-Sorting AddressBook Table city Alphabetically By Persons FirstName---

select City from AddressBookService Order by FirstName;

----UC9-Adding  Two New Column in AddressBook Table Column Name Relation Type and Name

Alter  Table AddressBookService 
Add FullName varchar(50),RelationType varchar(50);

Select * from AddressBookService;

update AddressBookService
set FullName='Ajay Kumar', RelationType='Others' where FirstName='Vijay';

-----UC10-Dispaly the Number Count by RelatinShip type-----


select Count(*),RelationType from AddressBookService group by RelationType;

-------UC11----
Alter table  AddressBookService
Drop COLUMN  RelationType ;
Select* from AddressBookService;

Create table AddressBookType( TypeId int NOT NULL Primary Key  Identity(101,1),Type varchar(25), );

Create table AddressBookMaps(
Id int NOT NULL PRIMARY KEY IDENTITY(101,1),
MappingId int,
TypeId int ,
AddressBookId int Foreign Key  References AddressBookService(Id),
AddressBookTypeId int Foreign Key  References AddressBookType(TypeId) );

Alter  table AddressBookMaping ADD  Foreign Key (AddressBookServiceId)
References AddressBookService(Id);

Alter  table AddressBookMaping ADD  Foreign Key (TypeId)
References AddressBookType(TypeId);


Select * from AddressBookType;
Select * from AddressBookMaps;

insert into AddressBookMaps
 Values
 (101,101,101,101),
 (101,102,103,104);


insert into AddressBookType 
values
('Friend'),
('FAMILY'),
('Profession'),
('Others');

Select AddressBookService.FirstName, LastName, Address,City, State, Zip,PhoneNumber,EmailAddress,  AddressBookService.FullName, AddressBookType.Type from AddressBookService INNER JOIN 
AddressBookMaps On AddressBookService.Id=AddressBookMaps.AddressBookId
INNER JOIN AddressBookType ON AddressBookType.TypeId=AddressBookMaps.TypeId;

