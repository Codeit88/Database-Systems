create database myDb;
use myDb;

create Table Student(
 RollNum varchar(50) Not Null,
 Name varchar(50),
 Gender varchar(50),
 Phone  varchar(50)
)

Insert into Student
Values('L211868','Dar','Male','03213850063'),
('L211867','Dar abdullah','Male','03211850065'),
('L211866','Dar ali','Male','03213850055'),
('L211865','Dar hassan','Female','03213950065')

select*from Student;

create Table Attendance(
 ClassVenue varchar(50),
 Date1 date,
 Status1 varchar(50),
 Rollno  varchar(50) Not Null
)
Insert into Attendance
Values('2','12-22-17','P','L211868'),
('1','12-22-17','A','L211867'),
('2','12-22-17','P','L211866'),
('2','12-22-17','P','L211865')

select*from Attendance;

create Table ClassVenue(
 Id varchar(50),
 Building varchar(50),
 Room_no varchar(50) Not null,
 Teacher  varchar(50)
)
Insert into ClassVenue
Values('1','Civil','3','Amina Batool'),
('2','CS','2','Abeeda Akram')

select*from ClassVenue;

create Table Teacher(
 Name varchar(50) unique,
 Department varchar(50),
 Designation varchar(50)
)

Insert into Teacher
Values('Abeeda','Computer science','Asisstant Prof'),
('Zahid','Computer science','Lecturer'),
('Kashif Zafar','Civil','Professor')

select*from Teacher;


 Drop Table Student;
 Drop Table Attendance;
 

 Drop Table Teacher;
 Drop Table ClassVenue;

Alter table Student add constraint pk_roll primary key(RollNum);
Alter table Attendance add constraint pk_rollnum primary key(Rollno);
Alter table ClassVenue add constraint pk_ven primary key(Room_no);
Alter table Teacher add constraint pk_name primary key(Name);

 
Alter Table Attendance add constraint fk_rol foreign key(Rollno) references Student(RollNum);

 alter table Attendance add constraint FK_STUDENT foreign key (Rollno) references Student
 (RollNum) on delete No Action on update Cascade;

 
alter table Student drop column Phone

alter table Student add warning_count float
--Add new row into Student table, values <L162334, Fozan Shahid, Male, 3.2 >(Invalid)
--Insert into Student 
--Values ('L116334', 'Fozan Shahid', 'Male', '3.2' )

--Add new row into ClassVenue table, values <3, CS, 5, AliInvalid )
--Insert into ClassVenue 
--Values ('3', 'CS', '5', 'Ali' )

--Update Teacher table Change “Kashif zafar” name to “Dr. Kashif Zafar(Invalid)

--UPDATE Teacher
--SET Name = 'Dr Kashif Zafar'
--WHERE Name = 'Kashif Zafar';
--Delete from Student where RollNum = 'L211866';

--Delete from Attendance
--where Rollno='L211868' and Status1='P'
Alter Table Student add constraint UNIQUE_CONSTRAINT_STUDENT_CNIC Unique (Name);
alter table Student add Constraint STUDENT_CHECK_CGPA 
check (gender ='Male' or gender='Female')
alter table Attendance add Constraint STUDENT_CHECK 
check (Status1 ='A' or Status1='P')