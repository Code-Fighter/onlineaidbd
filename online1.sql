USE [master]
GO
/****** Object:  Database [onlineaidbd]    Script Date: 5/24/2015 3:14:07 AM ******/
CREATE DATABASE [onlineaidbd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlineaidbd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\onlineaidbd.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'onlineaidbd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\onlineaidbd_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [onlineaidbd] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlineaidbd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlineaidbd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlineaidbd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlineaidbd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlineaidbd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlineaidbd] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlineaidbd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlineaidbd] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [onlineaidbd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlineaidbd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlineaidbd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlineaidbd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlineaidbd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlineaidbd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlineaidbd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlineaidbd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlineaidbd] SET  DISABLE_BROKER 
GO
ALTER DATABASE [onlineaidbd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlineaidbd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlineaidbd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlineaidbd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlineaidbd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlineaidbd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlineaidbd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlineaidbd] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [onlineaidbd] SET  MULTI_USER 
GO
ALTER DATABASE [onlineaidbd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlineaidbd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlineaidbd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlineaidbd] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [onlineaidbd]
GO
/****** Object:  Table [dbo].[BalanceTable]    Script Date: 5/24/2015 3:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BalanceTable](
	[BalanceId] [int] NULL,
	[BalanceAmount] [varchar](50) NULL,
	[StudentId] [int] NULL,
	[DepositDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CostTable]    Script Date: 5/24/2015 3:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CostTable](
	[CostId] [int] NULL,
	[CostPurpose] [varchar](50) NULL,
	[CostDate] [date] NULL,
	[CostBy] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/24/2015 3:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] NOT NULL,
	[CourseCode] [varchar](50) NULL,
	[CourseTitle] [varchar](150) NULL,
	[CourseDuration] [varchar](50) NULL,
	[RoutineId] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoutineTable]    Script Date: 5/24/2015 3:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoutineTable](
	[RoutineId] [int] NULL,
	[StartDate] [smalldatetime] NULL,
	[Schedule1] [datetime] NULL,
	[Schedule2] [datetime] NULL,
	[Schedule3] [datetime] NULL,
	[Schedule4] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentTable]    Script Date: 5/24/2015 3:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentTable](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StName] [varchar](50) NULL,
	[StMobile] [varchar](50) NULL,
	[StEmail] [varchar](50) NULL,
	[StAddress] [varchar](250) NULL,
	[StEducation] [varchar](50) NULL,
	[CourseId] [int] NULL,
	[BalanceId] [int] NULL,
 CONSTRAINT [PK_StudentTable] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/24/2015 3:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] NULL,
	[TecherName] [varchar](50) NULL,
	[TeacherDesignation] [varchar](50) NULL,
	[CourseId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 5/24/2015 3:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserId] [int] NOT NULL,
	[FullName] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[UserEmail] [varchar](50) NULL,
	[UserMobile] [varchar](50) NULL,
	[ActiveStatus] [bit] NULL,
	[Admin] [bit] NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [onlineaidbd] SET  READ_WRITE 
GO
