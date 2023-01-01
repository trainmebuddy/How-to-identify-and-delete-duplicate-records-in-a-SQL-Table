USE [master]
GO
/****** Object:  Database [TrainingDB]    Script Date: 1/1/2023 3:53:32 PM ******/
CREATE DATABASE [TrainingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrainingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TrainingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TrainingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TrainingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TrainingDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrainingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrainingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrainingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrainingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrainingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrainingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrainingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrainingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrainingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrainingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrainingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrainingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrainingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrainingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrainingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrainingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrainingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrainingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrainingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrainingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrainingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrainingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrainingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrainingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TrainingDB] SET  MULTI_USER 
GO
ALTER DATABASE [TrainingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrainingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrainingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrainingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrainingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TrainingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrainingDB', N'ON'
GO
ALTER DATABASE [TrainingDB] SET QUERY_STORE = OFF
GO
USE [TrainingDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/1/2023 3:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[State] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_bkp_WithDuplicate]    Script Date: 1/1/2023 3:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_bkp_WithDuplicate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[State] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer1]    Script Date: 1/1/2023 3:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer1](
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[State] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (1, N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (2, N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (3, N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (4, N'Hussain', N'Razaq', N'hussain@hotmail.com', N'New York')
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (5, N'Jonas', N'Walker', N'jonas1@gmail.com', N'New York')
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (6, N'Pamelia', N'Newman', N'jakson1@yahoo.com', N'California')
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (7, N'Pamelia', N'Newman', N'jakson1@yahoo.com', N'California')
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (8, N'Sudha', N'Sharma', N'sudha@hotmail.com', N'California')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_bkp_WithDuplicate] ON 
GO
INSERT [dbo].[Customer_bkp_WithDuplicate] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (1, N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer_bkp_WithDuplicate] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (2, N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer_bkp_WithDuplicate] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (3, N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer_bkp_WithDuplicate] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (4, N'Hussain', N'Razaq', N'hussain@hotmail.com', N'New York')
GO
INSERT [dbo].[Customer_bkp_WithDuplicate] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (5, N'Jonas', N'Walker', N'jonas1@gmail.com', N'New York')
GO
INSERT [dbo].[Customer_bkp_WithDuplicate] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (6, N'Pamelia', N'Newman', N'jakson1@yahoo.com', N'California')
GO
INSERT [dbo].[Customer_bkp_WithDuplicate] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (7, N'Pamelia', N'Newman', N'jakson1@yahoo.com', N'California')
GO
INSERT [dbo].[Customer_bkp_WithDuplicate] ([ID], [FirstName], [LastName], [Email], [State]) VALUES (8, N'Sudha', N'Sharma', N'sudha@hotmail.com', N'California')
GO
SET IDENTITY_INSERT [dbo].[Customer_bkp_WithDuplicate] OFF
GO
INSERT [dbo].[Customer1] ([FirstName], [LastName], [Email], [State]) VALUES (N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer1] ([FirstName], [LastName], [Email], [State]) VALUES (N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer1] ([FirstName], [LastName], [Email], [State]) VALUES (N'Harish', N'Rao', N'harish.rao@gmail.com', N'California')
GO
INSERT [dbo].[Customer1] ([FirstName], [LastName], [Email], [State]) VALUES (N'Hussain', N'Razaq', N'hussain@hotmail.com', N'New York')
GO
INSERT [dbo].[Customer1] ([FirstName], [LastName], [Email], [State]) VALUES (N'Jonas', N'Walker', N'jonas1@gmail.com', N'New York')
GO
INSERT [dbo].[Customer1] ([FirstName], [LastName], [Email], [State]) VALUES (N'Pamelia', N'Newman', N'jakson1@yahoo.com', N'California')
GO
INSERT [dbo].[Customer1] ([FirstName], [LastName], [Email], [State]) VALUES (N'Pamelia', N'Newman', N'jakson1@yahoo.com', N'California')
GO
INSERT [dbo].[Customer1] ([FirstName], [LastName], [Email], [State]) VALUES (N'Sudha', N'Sharma', N'sudha@hotmail.com', N'California')
GO
USE [master]
GO
ALTER DATABASE [TrainingDB] SET  READ_WRITE 
GO
