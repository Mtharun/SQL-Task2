//User Table

Create Table Users(
	userID INT Auto_Increment Primary Key,
    UserName text,
    UserEmail text,
    Batch_id Int
);

Insert into Users values(1,"Tharun","sktharun4@gmail.com",12);
Insert into Users values(2,"Balaji","Balaji@gmail.com",11);
Insert into Users values(3,"simbu","str@gmail.com",12);


//codekata table

Create table Codekata(
  userId int,
  problem_solved int,
  foreign key(userId) References Users(userId)
  );

insert into CodeKata values(1,70);
insert into CodeKata values(2,50);
insert into CodeKata values(3,20);


//companydrive table

Create table Company_Drives(
  driveId int Auto_Increament Primary key,
  userID int,
  drive_date Date,
  Company text,
  foreign key(userID)references Users(userID) 
  );

Insert into Company_Drives values(1,3,"2-1-2023","ZOHO");
Insert into Company_Drives values(2,1,"12-2-2023","GUVI");
Insert into Company_Drives values(3,2,"22-3-2023","TCS");

//Mentor Table

Create Table Mentors(
  MentorID int Auto_increment Primary key,
  MentorName text,
  MentorEmail text
  );

Insert into Mentors values(1,"Sanjay Guvi","sanjay@gmail.com");
Insert into Mentors values(2,"Sundeep Guvi","sundeep@gmail.com");
Insert into Mentors values(3,"Lazer Guvi","Lazer@gmail.com");

//Topic Table

create table topics(
  TopicID int Auto_increament Primary key,
  Topic text,
  MentorID int,
  Batch_id int,
  foreign key (MentorID) references Mentors (MentorID)
  );

Insert into Topics values(1,"HTML",1,12);
Insert into Topics values(2,"CSS",2,11);
Insert into Topics values(3,"JavaScript",3,12);


//Attendance

Create table Attendance(
  AttendanceId int Auto_Increment Primary key,
  UserID int,
  TopicID int,
  Attended Boolean,
  Foreign key (userID) references users(userID),
  Foreign Key (topicID) references topics (topicID)
  );

insert into Attendance values(1,2,3,true);
insert into Attendance values(2,3,2,false);
insert into Attendance values(3,1,1,true);

//Query table

create table Queries(
  QueryId int Auto_increment Primary key,
  userID int,
  Query text,
  MentorID int,
  Foreign key(userID) References users(userID)
  Foreign Key(MentorID) References Mentors(MentorID)
  );

Insert into Queries values(1,2,"HTML Query",2);
Insert into Queries values(2,3,"JavaScript Query",1);
Insert into Queries values(3,1,"css Query",1);

------------- Q & A -----------------------

1.List All The users, List All the mentors

 select UsersName from users;
 select MentorName from mentors;

2.Number of Company_drives attended by user

select userID , count(userID)as attended from Company_Drives group by userID; 

3.Number of Problem solved in codekata by users

select users.userID,users.UserName,users.UserEmail,CodeKata.Problem_solved
from users
Inner join CodeKata on users.UserID = CodeKata.userid;

4.Display User,mentor,codekata,Topic tables;

select * from users;
select * from mentors;
select * from CodeKata;
select * from Topics;

