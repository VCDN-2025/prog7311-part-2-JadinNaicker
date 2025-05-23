USE [master]
GO
/****** Object:  Database [AgriEnergyConnectDB]    Script Date: 5/14/2025 12:02:18 PM ******/
CREATE DATABASE [AgriEnergyConnectDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AgriEnergyConnectDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AgriEnergyConnectDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AgriEnergyConnectDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AgriEnergyConnectDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AgriEnergyConnectDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AgriEnergyConnectDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AgriEnergyConnectDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET  MULTI_USER 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AgriEnergyConnectDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AgriEnergyConnectDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AgriEnergyConnectDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [AgriEnergyConnectDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AgriEnergyConnectDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/14/2025 12:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farmers]    Script Date: 5/14/2025 12:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmers](
	[FarmerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Farmers] PRIMARY KEY CLUSTERED 
(
	[FarmerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/14/2025 12:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[ProductionDate] [datetime2](7) NOT NULL,
	[FarmerId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/14/2025 12:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250512110238_InitialCreate', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250514092016_SecondCreate', N'9.0.4')
GO
SET IDENTITY_INSERT [dbo].[Farmers] ON 

INSERT [dbo].[Farmers] ([FarmerId], [Name], [Email]) VALUES (1, N'Ayush Ramkisoon', N'ayush@gmail.com')
INSERT [dbo].[Farmers] ([FarmerId], [Name], [Email]) VALUES (2, N'Jadin Naicker', N'jadin@gmail.com')
INSERT [dbo].[Farmers] ([FarmerId], [Name], [Email]) VALUES (3, N'Kian Cambell', N'kian@gmail.com')
INSERT [dbo].[Farmers] ([FarmerId], [Name], [Email]) VALUES (6, N'John Cena', N'John1@gmail.com')
INSERT [dbo].[Farmers] ([FarmerId], [Name], [Email]) VALUES (7, N'Emma Mae', N'emma@gmail.com')
INSERT [dbo].[Farmers] ([FarmerId], [Name], [Email]) VALUES (8, N'Cameron Naicker', N'camo@gmail.com')
INSERT [dbo].[Farmers] ([FarmerId], [Name], [Email]) VALUES (9, N'Ethan Pillay', N'ethan@gmail.com')
SET IDENTITY_INSERT [dbo].[Farmers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (7, N'Wind Turbine', N'Wind', CAST(N'2025-05-05T13:36:57.8200000' AS DateTime2), 1, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (8, N'Solar Panel', N'Solar', CAST(N'2025-05-09T13:36:57.8200000' AS DateTime2), 1, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (9, N'Wind Turbine', N'Wind', CAST(N'2025-05-02T13:36:57.8200000' AS DateTime2), 2, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (10, N'Solar Panel', N'Solar', CAST(N'2025-05-08T13:36:57.8200000' AS DateTime2), 2, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (12, N'Wind Turbine', N'Wind', CAST(N'2025-05-15T00:00:00.0000000' AS DateTime2), 8, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (13, N'Solar Panel', N'Solar', CAST(N'2025-05-10T00:00:00.0000000' AS DateTime2), 8, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (14, N'Fuel', N'Biogas', CAST(N'2025-05-12T00:00:00.0000000' AS DateTime2), 1, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (15, N'Wind Turbine', N'Wind', CAST(N'2025-05-06T00:00:00.0000000' AS DateTime2), 3, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Category], [ProductionDate], [FarmerId], [Description], [Price]) VALUES (16, N'Solar Panel', N'Solar', CAST(N'2025-05-22T00:00:00.0000000' AS DateTime2), 9, N'', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (1, N'ayush@gmail.com', N'12345', N'Farmer')
INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (2, N'jadin@gmail.com', N'123', N'Farmer')
INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (3, N'jose@gmail.com', N'12343', N'Employee')
INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (4, N'sajana@gmail.com', N'2501', N'Employee')
INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (5, N'kian@gmail.com', N'1234', N'Farmer')
INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (6, N'John1@gmail.com', N'7412', N'Farmer')
INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (7, N'emma@gmail.com', N'4321', N'Farmer')
INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (8, N'camo@gmail.com', N'5678', N'Farmer')
INSERT [dbo].[Users] ([UserId], [Email], [Password], [Role]) VALUES (9, N'ethan@gmail.com', N'1234', N'Farmer')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Products_FarmerId]    Script Date: 5/14/2025 12:02:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_FarmerId] ON [dbo].[Products]
(
	[FarmerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [Price]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Farmers_FarmerId] FOREIGN KEY([FarmerId])
REFERENCES [dbo].[Farmers] ([FarmerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Farmers_FarmerId]
GO
USE [master]
GO
ALTER DATABASE [AgriEnergyConnectDB] SET  READ_WRITE 
GO
