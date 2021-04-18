USE [master]
GO
/****** Object:  Database [CourierManagementSystemDatabase]    Script Date: 18-Apr-21 6:13:16 PM ******/
CREATE DATABASE [CourierManagementSystemDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourierManagementSystemDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\CourierManagementSystemDatabase.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CourierManagementSystemDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\CourierManagementSystemDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourierManagementSystemDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CourierManagementSystemDatabase]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 18-Apr-21 6:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[AdminUserName] [varchar](10) NOT NULL,
	[AdminPassWord] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_ADMIN] UNIQUE NONCLUSTERED 
(
	[AdminUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 18-Apr-21 6:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CustomerNID] [varchar](16) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DELIVERYMAN]    Script Date: 18-Apr-21 6:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DELIVERYMAN](
	[DeliveryManID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Address] [varchar](40) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[DeliverymanPassWord] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryManID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_DELIVERYMAN] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 18-Apr-21 6:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORDERS](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerNID] [varchar](16) NULL,
	[ReceiverNID] [varchar](16) NULL,
	[DeliveryManID] [int] NULL,
	[PackageID] [int] NULL,
	[PaymentID] [int] NULL,
	[VehicleID] [int] NULL,
	[Date] [date] NOT NULL,
	[Status] [varchar](12) NULL DEFAULT ('PENDING'),
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PACKAGE]    Script Date: 18-Apr-21 6:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PACKAGE](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NULL,
	[Weight] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAYMENT]    Script Date: 18-Apr-21 6:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAYMENT](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerNID] [varchar](16) NULL,
	[Type] [varchar](10) NOT NULL,
	[Amount] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RECEIVER]    Script Date: 18-Apr-21 6:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RECEIVER](
	[ReceiverNID] [varchar](16) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceiverNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VEHICLE]    Script Date: 18-Apr-21 6:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VEHICLE](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](10) NULL DEFAULT ('Pick-up'),
	[LicenseNo] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LicenseNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([CustomerNID])
REFERENCES [dbo].[CUSTOMER] ([CustomerNID])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([DeliveryManID])
REFERENCES [dbo].[DELIVERYMAN] ([DeliveryManID])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([PackageID])
REFERENCES [dbo].[PACKAGE] ([PackageID])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PAYMENT] ([PaymentID])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([ReceiverNID])
REFERENCES [dbo].[RECEIVER] ([ReceiverNID])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([VehicleID])
REFERENCES [dbo].[VEHICLE] ([VehicleID])
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD FOREIGN KEY([CustomerNID])
REFERENCES [dbo].[CUSTOMER] ([CustomerNID])
GO
ALTER TABLE [dbo].[PACKAGE]  WITH CHECK ADD CHECK  (([Weight]>(0)))
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD CHECK  (([Type]='bkash' OR [Type]='credit' OR [Type]='cash'))
GO
USE [master]
GO
ALTER DATABASE [CourierManagementSystemDatabase] SET  READ_WRITE 
GO
