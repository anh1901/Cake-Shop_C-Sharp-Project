USE [master]
GO
/****** Object:  Database [CakeShop]    Script Date: 11/11/2020 4:35:35 PM ******/
CREATE DATABASE [CakeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CakeShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CakeShop.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CakeShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CakeShop_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CakeShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CakeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CakeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CakeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CakeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CakeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CakeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CakeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CakeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CakeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CakeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CakeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CakeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CakeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CakeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CakeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CakeShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CakeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CakeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CakeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CakeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CakeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CakeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CakeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CakeShop] SET RECOVERY FULL 
GO
ALTER DATABASE [CakeShop] SET  MULTI_USER 
GO
ALTER DATABASE [CakeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CakeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CakeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CakeShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CakeShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CakeShop', N'ON'
GO
USE [CakeShop]
GO
/****** Object:  Table [dbo].[cakes]    Script Date: 11/11/2020 4:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cakes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cake_name] [nvarchar](255) NOT NULL,
	[cake_description] [nvarchar](max) NOT NULL,
	[cake_price] [int] NOT NULL,
	[cake_quantity] [int] NOT NULL,
	[cake_image] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order_details]    Script Date: 11/11/2020 4:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[cake_id] [int] NULL,
	[cake_name] [nvarchar](255) NOT NULL,
	[cake_price] [int] NOT NULL,
	[cake_quantity] [int] NOT NULL,
	[cake_image] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/11/2020 4:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[username] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/11/2020 4:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](10) NOT NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cakes] ON 

INSERT [dbo].[cakes] ([id], [cake_name], [cake_description], [cake_price], [cake_quantity], [cake_image]) VALUES (1, N'Test Cake', N'Just a test', 10, 88, N'4-2-birthday-cake-png-file.png')
INSERT [dbo].[cakes] ([id], [cake_name], [cake_description], [cake_price], [cake_quantity], [cake_image]) VALUES (6, N'Test52', N'Deels', 23, 9, N'trang-vang-hong-ngoc-an-phu-vang-440x440.png')
INSERT [dbo].[cakes] ([id], [cake_name], [cake_description], [cake_price], [cake_quantity], [cake_image]) VALUES (8, N'Test36', N'sa', 21, 44, N'me-den-hat-dua.jpg')
INSERT [dbo].[cakes] ([id], [cake_name], [cake_description], [cake_price], [cake_quantity], [cake_image]) VALUES (9, N'test43', N'Asf', 20, 96, N'hop-trang-vang-hong-ngoc-an-thinh-do-440x440.png')
INSERT [dbo].[cakes] ([id], [cake_name], [cake_description], [cake_price], [cake_quantity], [cake_image]) VALUES (10, N'Test76', N'An', 20, 49, N'gà-quay-xốt-x.o-440x440.png')
SET IDENTITY_INSERT [dbo].[cakes] OFF
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [cake_name], [cake_price], [cake_quantity], [cake_image]) VALUES (1, 8, 1, N'Test Cake', 10, 1, N'4-2-birthday-cake-png-file.png')
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [cake_name], [cake_price], [cake_quantity], [cake_image]) VALUES (2, 9, 8, N'Test36', 21, 1, N'me-den-hat-dua.jpg')
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [cake_name], [cake_price], [cake_quantity], [cake_image]) VALUES (3, 9, 8, N'test43', 20, 1, N'hop-trang-vang-hong-ngoc-an-thinh-do-440x440.png9')
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [cake_name], [cake_price], [cake_quantity], [cake_image]) VALUES (4, 10, 1, N'Test Cake', 10, 2, N'4-2-birthday-cake-png-file.png')
SET IDENTITY_INSERT [dbo].[order_details] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [user_id], [username], [address], [phone]) VALUES (8, 3, N'Anh', N'ABC St', N'093536647')
INSERT [dbo].[orders] ([id], [user_id], [username], [address], [phone]) VALUES (9, 3, N'Anh', N'ABC St', N'0903364526')
INSERT [dbo].[orders] ([id], [user_id], [username], [address], [phone]) VALUES (10, 3, N'Anh', N'ABC St', N'0903364526')
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [role], [address], [phone]) VALUES (1, N'Admin', N'Admin', N'admin', N'ABC', N'0903364528')
INSERT [dbo].[users] ([id], [username], [password], [role], [address], [phone]) VALUES (2, N'User', N'User', N'user', N'ABC', N'0903364528')
INSERT [dbo].[users] ([id], [username], [password], [role], [address], [phone]) VALUES (3, N'Anh', N'123456', N'user', N'ABC St', N'0903364526')
SET IDENTITY_INSERT [dbo].[users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__users__F3DBC5721D13DAA3]    Script Date: 11/11/2020 4:35:35 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([cake_id])
REFERENCES [dbo].[cakes] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
USE [master]
GO
ALTER DATABASE [CakeShop] SET  READ_WRITE 
GO
