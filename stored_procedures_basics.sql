use master
go
drop  database ATM
go 
Create database ATM
go 
use ATM
go
create Table UserType(
userTypeID int primary key,
[name] varchar(20) not null
)
go
create table [User](
[userId] int primary key,
[name] varchar(20) not null,
[userType] int foreign key references UserType(UserTypeID),
[phoneNum] varchar(15) not null,
[city] varchar(20) not null
)
go

create table CardType(
[cardTypeID] int primary key,
[name] varchar(15),
[description] varchar(40) null
)
go
create Table [Card](
cardNum Varchar(20) primary key,
cardTypeID int foreign key references  CardType([cardTypeID]),
PIN varchar(4) not null,
[expireDate] date not null,
balance float not null
)
go


Create table UserCard(
userID int foreign key references [User]([userId]),
cardNum varchar(20) foreign key references [Card](cardNum),
primary key(cardNum)
)
go
create table TransactionType(
transTypeID int primary key,
typeName varchar(20) not null,
[description] varchar (40) null
)
go
create table [Transaction](
transId int primary key,
transDate date not null,
cardNum varchar(20) foreign key references [Card](cardNum),
amount int not null,
transType int foreign key references TransactionType(transTypeID)
)




GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (1, N'Silver')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (2, N'Gold')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (3, N'Bronze')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (4, N'Common')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (1, N'Ali', 2, N'03036067000', N'Narowal')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (2, N'Ahmed', 1, N'03036047000', N'Lahore')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (3, N'Aqeel', 3, N'03036063000', N'Karachi')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (4, N'Usman', 4, N'03036062000', N'Sialkot')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (5, N'Hafeez', 2, N'03036061000', N'Lahore')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (3, N'Gift', N'Enjoy')
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1324327436569', 3, N'1770', CAST(N'2022-07-01' AS Date), 43025.31)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325423336', 3, N'0234', CAST(N'2020-03-02' AS Date), 14425.62)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325436566', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325666456', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2343243253436', 2, N'0034', CAST(N'2020-09-02' AS Date), 34025.12)
GO

INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1324327436569')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'2343243253436')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'2324325423336')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (3, N'2324325436566')
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (1, N'Withdraw', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (2, N'Deposit', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (3, N'ScheduledDeposit', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (4, N'Failed', NULL)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (1, CAST(N'2017-02-02' AS Date), N'1324327436569', 500, 1)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (2, CAST(N'2018-02-03' AS Date), N'2343243253436', 3000, 3)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (3, CAST(N'2017-05-06' AS Date), N'2324325436566', 2500, 2)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (4, CAST(N'2016-09-09' AS Date), N'2324325436566', 2000, 1)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (5, CAST(N'2015-02-10' AS Date), N'2324325423336', 6000, 4)
GO

--///////////////////////////////////////////////////////1/////////////////////////////////////////////////////////////


create procedure atms
as begin
Select * from UserType
Select * from [User]
Select * from UserCard
Select * from [Card]
Select * from CardType
Select * from [Transaction]
Select * from TransactionType
end

execute atms
--///////////////////////////////////////8/////////////////////////////////////////////////////

Create alter Procedure newam 
@CardNo Varchar(20),
@pin varchar(4),
@amount int
As
Begin
	Declare @valid int
	Exec [Login] @CardNo, @pin, @valid OutPut
	If @valid = 1
	Begin

		Declare @amo int, @id int, @typedata int
		
		Select @amo = balance From [Card]  
		Where cardNum = @CardNo AND PIN = @pin
		
		Select @id = max(transId) From [Transaction] 
		Set @id = @id + 1;

		if @amo >= @amount AND @amount > 9 
		Begin
			set @typedata = 1;
		End

		Else
		Begin
			set @typedata = 4;
		End
			
		Insert into [Transaction] 
		Values (@id, GETDATE(), @CardNo, @amount, @typedata);
	End

	Else
	Begin
		Print 'ERROR';
	End
End



--/////////////////////////////////////////7////////////////////////////////////////////////////

create procedure update_pin
@old_pin varchar(4),@pin varchar(4),@status int
as begin
If LEN(@pin) = 4
	Begin
		If Exists (Select cardNum From [Card]  where PIN = @pin)
			Begin
				Update [Card] set Pin = @pin
				where PIN = @pin
				Print 'Updated the Pin!!'
			End
		Else
			Begin
				Print 'ERROR';
			End
	End

	Else
		Begin
			print 'ERROR: Invalid New Pin!!'
		End
End


--/////////////////////////////////////////6////////////////////////////////////////////////////


create procedure status1 
@Cardnum varchar(10),@pin varchar(4),@status float output
as begin
set @status=0;
select @Cardnum=CardNum from UserCard
select @pin=PIN from [Card]
if(@Cardnum is not NULL and @pin is not NULL)
set @status=1;
end
declare @stat int
exec status1 '411516','4443',@stat output
select @stat as stat


--/////////////////////////////////////////////////5/////////////////////////////////////////////////

create procedure no_cards1 
@name varchar(10),@id int,@no_cards float output
as begin
select @no_cards = count(s.userid) from [User] as u inner join UserCard as s on u.userid=s.userid and @name=u.name;
end
declare @counter1 int
exec no_cards1 'Ali',1,@counter1 output
select @counter1 as min_balance


--/////////////////////////////////////////////////4//////////////////////////////////////////////////
create procedure min_bal1 
@balance_out float output
as begin
select @balance_out = Min(balance) from Card 
end
declare @minbal float
exec min_bal1 @minbal output
select @minbal as min_balance

--///////////////////////////////////////////2/////////////////////////////////////////////////////////
create procedure disp_name @name varchar(10)
as begin
select*from [User] WHERE name=@name;
end
execute disp_name Ali

--/////////////////////////////////////////3//////////////////////////////////////////////////////////
create procedure card_details @card_num varchar(20)
as begin
select u.name,u.phoneNum,u.city from [User] as u inner join UserCard as s on u.userid=s.userid and s.cardNum=@card_num;
end
execute card_details 2324325423336