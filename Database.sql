USE [master]
GO
/****** Object:  Database [QuanLiQuanCafe]    Script Date: 8/21/2022 2:56:11 PM ******/
CREATE DATABASE [QuanLiQuanCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLiQuanCafe', FILENAME = N'D:\dev\SQL Sever 2014\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLiQuanCafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLiQuanCafe_log', FILENAME = N'D:\dev\SQL Sever 2014\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLiQuanCafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 
GO
ALTER DATABASE [QuanLiQuanCafe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLiQuanCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLiQuanCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLiQuanCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLiQuanCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLiQuanCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLiQuanCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLiQuanCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLiQuanCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLiQuanCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLiQuanCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLiQuanCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLiQuanCafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLiQuanCafe] SET DELAYED_DURABILITY = DISABLED 
GO
/*ALTER DATABASE [QuanLiQuanCafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
/GO
ALTER DATABASE [QuanLiQuanCafe] SET QUERY_STORE = OFF
GO*/
USE [QuanLiQuanCafe]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[UserName] [char](10) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[UserPass] [nvarchar](1000) NULL,
	[Type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILL]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[idBILL] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NULL,
	[idTable] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBILL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILLINFOR]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILLINFOR](
	[idBILLINFOR] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NULL,
	[idBILL] [int] NULL,
	[idFOOD] [int] NULL,
	[count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBILLINFOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FOOD]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FOOD](
	[idFOOD] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[idFOODTYPE] [int] NULL,
	[FoodPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idFOOD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FOODTYPE]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FOODTYPE](
	[idFOODTYPE] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idFOODTYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TABLESTORE]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TABLESTORE](
	[idTABLE] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](10) NULL,
	[isGood] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ACCOUNT] ([UserName], [DisplayName], [UserPass], [Type]) VALUES (N'admin     ', N'admin', N'1', 1)
INSERT [dbo].[ACCOUNT] ([UserName], [DisplayName], [UserPass], [Type]) VALUES (N'staff01     ', N'Dien', N'1', 0)
INSERT [dbo].[ACCOUNT] ([UserName], [DisplayName], [UserPass], [Type]) VALUES (N'staff02     ', N'Vinh', N'1', 0)
GO
SET IDENTITY_INSERT [dbo].[FOOD] ON 

INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (1, N'Cà phê đá', 1, 30000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (2, N'Cà phê đen', 1, 30000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (3, N'Cà phê sữa', 1, 35000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (4, N'Trà sữa trân trâu', 2, 40000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (5, N'Trà sữa Vân Nam', 2, 30000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (6, N'Trà sữa việt quất', 2, 25000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (7, N'Bánh đồng xu phô mai', 3, 30000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (8, N'Trà đào', 4, 40000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (9, N'Trà vải', 4, 40000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (10, N'Trà chanh giã tay', 4, 40000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (11, N'Nước lọc', 5, 10000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (12, N'Coca', 5, 20000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (13, N'Pepsi', 5, 20000)
INSERT [dbo].[FOOD] ([idFOOD], [name], [idFOODTYPE], [FoodPrice]) VALUES (14, N'Cà phê chồn', 1, 300000)
SET IDENTITY_INSERT [dbo].[FOOD] OFF
GO
SET IDENTITY_INSERT [dbo].[FOODTYPE] ON 

INSERT [dbo].[FOODTYPE] ([idFOODTYPE], [name]) VALUES (1, N'Cafe')
INSERT [dbo].[FOODTYPE] ([idFOODTYPE], [name]) VALUES (2, N'Trà Sữa')
INSERT [dbo].[FOODTYPE] ([idFOODTYPE], [name]) VALUES (3, N'Bánh Ngọt')
INSERT [dbo].[FOODTYPE] ([idFOODTYPE], [name]) VALUES (4, N'Trà')
INSERT [dbo].[FOODTYPE] ([idFOODTYPE], [name]) VALUES (5, N'Nước Ngọt')
SET IDENTITY_INSERT [dbo].[FOODTYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[TABLESTORE] ON 

INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (1, N'Bàn 1     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (2, N'Bàn 2     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (3, N'Bàn 3     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (4, N'Bàn 4     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (5, N'Bàn 5     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (6, N'Bàn 6     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (7, N'Bàn 7     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (8, N'Bàn 8     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (9, N'Bàn 9     ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (10, N'Bàn 10    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (11, N'Bàn 11    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (12, N'Bàn 12    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (13, N'Bàn 13    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (14, N'Bàn 14    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (15, N'Bàn 15    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (16, N'Bàn 16    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (17, N'Bàn 17    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (18, N'Bàn 18    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (19, N'Bàn 19    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (20, N'Bàn 20    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (21, N'Bàn 21    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (22, N'Bàn 22    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (23, N'Bàn 23    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (24, N'Bàn 24    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (25, N'Bàn 25    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (26, N'Bàn 26    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (27, N'Bàn 27    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (28, N'Bàn 28    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (29, N'Bàn 29    ', 1)
INSERT [dbo].[TABLESTORE] ([idTABLE], [name], [isGood]) VALUES (30, N'Bàn 30    ', 1)
SET IDENTITY_INSERT [dbo].[TABLESTORE] OFF
GO
ALTER TABLE [dbo].[BILL] ADD  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[BILLINFOR] ADD  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[BILLINFOR] ADD  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TABLESTORE] ([idTABLE])
GO
ALTER TABLE [dbo].[BILLINFOR]  WITH CHECK ADD FOREIGN KEY([idBILL])
REFERENCES [dbo].[BILL] ([idBILL])
GO
ALTER TABLE [dbo].[BILLINFOR]  WITH CHECK ADD FOREIGN KEY([idFOOD])
REFERENCES [dbo].[FOOD] ([idFOOD])
GO
ALTER TABLE [dbo].[FOOD]  WITH CHECK ADD FOREIGN KEY([idFOODTYPE])
REFERENCES [dbo].[FOODTYPE] ([idFOODTYPE])
GO
/****** Object:  StoredProcedure [dbo].[PRO_GetTableFood]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PRO_GetTableFood]
AS
BEGIN
	SELECT * FROM dbo.TABLESTORE
END

GO
/****** Object:  StoredProcedure [dbo].[PRO_GetUserACCount]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[PRO_GetUserACCount]
@userDisplayName NVARCHAR(50),
@userPassWord NVARCHAR(1000)
AS
BEGIN
    SELECT * FROM dbo.ACCOUNT WHERE DisplayName = @userDisplayName AND UserPass = @userPassWord;
END

GO
/****** Object:  StoredProcedure [dbo].[PRO_GetUserByUserDisplayName]    Script Date: 8/21/2022 2:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[PRO_GetUserByUserDisplayName]
@userDisplayName NVARCHAR(50)
AS
BEGIN
	SELECT * FROM dbo.ACCOUNT
	WHERE DisplayName = @userDisplayName
END

GO
USE [master]
GO
ALTER DATABASE [QuanLiQuanCafe] SET  READ_WRITE 
GO
