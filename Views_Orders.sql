create database w1
use w1


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[ItemNo] [int] NOT NULL,
	[Name] [varchar](10) NULL,
	[Price] [int] NULL,
	[Quantity in Store] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (100, N'A', 1000, 100)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (200, N'B', 2000, 50)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (300, N'C', 3000, 60)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (400, N'D', 6000, 400)
/****** Object:  Table [dbo].[Courses]    Script Date: 02/17/2017 13:04:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerNo] [varchar](2) NOT NULL,
	[Name] [varchar](30) NULL,
	[City] [varchar](3) NULL,
	[Phone] [varchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C1', N'AHMED ALI', N'LHR', N'111111')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C2', N'ALI', N'LHR', N'222222')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C3', N'AYESHA', N'LHR', N'333333')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C4', N'BILAL', N'KHI', N'444444')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C5', N'SADAF', N'KHI', N'555555')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C6', N'FARAH', N'ISL', NULL)
/****** Object:  Table [dbo].[Order]    Script Date: 02/17/2017 13:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderNo] [int] NOT NULL,
	[CustomerNo] [varchar](2) NULL,
	[Date] [date] NULL,
	[Total_Items_Ordered] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (1, N'C1', CAST(0x7F360B00 AS Date), 30)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (2, N'C3', CAST(0x2A3C0B00 AS Date), 5)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (3, N'C3', CAST(0x493C0B00 AS Date), 20)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (4, N'C4', CAST(0x4A3C0B00 AS Date), 15)
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 02/17/2017 13:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC,
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (1, 200, 20)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (1, 400, 10)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (2, 200, 5)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (3, 200, 60)

GO
/****** Object:  ForeignKey [FK__OrderDeta__ItemN__4316F928]    Script Date: 02/03/2017 13:55:38 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ItemNo])
REFERENCES [dbo].[Items] ([ItemNo])
GO
/****** Object:  ForeignKey [FK__OrderDeta__Order__4222D4EF]    Script Date: 02/03/2017 13:55:38 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderNo])
REFERENCES [dbo].[Order] ([OrderNo])
GO

select*from OrderDetails
select*from [Order]
select*from Items
select*from Customers


--///////////////////////////////////////////////////////////////////////////////////////////////////////

create view StarCustomer as
select C1.Name from Customers as C1 inner join
(select C.CustomerNo as c0 from [Order] as C inner join
(select O.OrderNo as p0,I.Name as p1,I.Price*O.Quantity as p2 from Items as I inner join OrderDetails as O on I.ItemNo=O.ItemNo) as j1 
on C.OrderNo=j1.p0 where j1.p2>2000 group by c.CustomerNo) as j2 ON C1.CustomerNo=j2.c0
 
 select*from StarCustomer

--////////////////////////////////////////////////////////////////////////////////////////////////////////


create view Name2 as
select I.name,O.OrderNo from Items as I inner join OrderDetails as O on I.ItemNo=O.ItemNo where O.Quantity>20 
select*from Name2


--////////////////////////////////////////////////////////////////////////////////////////////////////////

create view Name as
select I.name from Items as I inner join OrderDetails as O on I.ItemNo=O.ItemNo 
select*from Name

--/////////////////////////////////////////////////////////////////////////////////////////////////////