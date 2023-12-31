USE [master]
GO
/****** Object:  Database [SonaClock]    Script Date: 7/18/2023 12:36:45 AM ******/
CREATE DATABASE [SonaClock]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SonaHotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SonaHotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SonaHotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SonaHotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SonaClock] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SonaClock].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SonaClock] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SonaClock] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SonaClock] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SonaClock] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SonaClock] SET ARITHABORT OFF 
GO
ALTER DATABASE [SonaClock] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SonaClock] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SonaClock] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SonaClock] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SonaClock] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SonaClock] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SonaClock] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SonaClock] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SonaClock] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SonaClock] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SonaClock] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SonaClock] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SonaClock] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SonaClock] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SonaClock] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SonaClock] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SonaClock] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SonaClock] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SonaClock] SET  MULTI_USER 
GO
ALTER DATABASE [SonaClock] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SonaClock] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SonaClock] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SonaClock] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SonaClock] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SonaClock] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SonaClock] SET QUERY_STORE = OFF
GO
USE [SonaClock]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/18/2023 12:36:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [char](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 7/18/2023 12:36:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[RoleId] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/18/2023 12:36:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/18/2023 12:36:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] NOT NULL,
	[OrderId] [bigint] NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/18/2023 12:36:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] NOT NULL,
	[Username] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/18/2023 12:36:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[CreateDate] [date] NULL,
	[Available] [bit] NULL,
	[CategotyId] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/18/2023 12:36:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone]) VALUES (N'cuong', N'123', N'Kim Van Cuong', N'cuongkvps25207@fpt.edu.vn', N'(+84) 123456789')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone]) VALUES (N'hung', N'456', N'Bui Hai Hung', N'hung@gmail.com', N'(+84) 878929124')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone]) VALUES (N'khanh', N'123', N'Nguyen Ngoc Khanh', N'khanh@gmail.com', N'(+84) 738421549')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone]) VALUES (N'teo', N'789', N'Nguyen Van Teo', N'andew@gmail.com', N'(+84) 878941125')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone]) VALUES (N'toan', N'123', N'Vu Van Toan', N'toan@gmail.com', N'(+84) 456789123')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone]) VALUES (N'van', N'123456', N'Nguyen Van Van', N'van@gmail.com', N'(+84) 875413048')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'102 ', N'Ð?ng h? deo tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'103 ', N'Ð?ng h? thông minh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'104 ', N'Ð?ng h? d?ng h? treo tu?ng')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'105 ', N'Ð?ng h? co')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'106 ', N'Ð?ng h? b?m gi?')
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1001, 104, 102, 12000000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1002, 105, 104, 186000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1003, 106, 106, 278000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1005, 108, 101, 10000000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1007, 110, 111, 457000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1008, 111, 108, 478000, 1)
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (104, N'khanh', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'TP HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (105, N'van', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Ha Noi')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (106, N'van', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Da Nang')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (107, N'teo', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Nha Tran')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (108, N'teo', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Hai Phong')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (109, N'khanh', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Lam Dong')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (110, N'toan', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Tay Nguyen')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (111, N'hung', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Thanh Hoa')
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (101, N'Apple Watch', N'apple.png', 12000000, CAST(N'2023-07-17' AS Date), 1, N'102 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (102, N'Tag Heurer', N'tag.png', 780000, CAST(N'2023-07-17' AS Date), 1, N'103 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (104, N'QUARTZ', N'quartz.png', 186000, CAST(N'2023-07-17' AS Date), 0, N'104 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (106, N'Kashi', N'kashi.png', 278000, CAST(N'2023-07-17' AS Date), 1, N'102 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (108, N'Stoch Match', N'stooch-match.png', 474000, CAST(N'2023-07-17' AS Date), 1, N'104 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (109, N'Movado', N'movado.png', 56000, CAST(N'2023-07-17' AS Date), 1, N'103 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (110, N'Citizen', N'citizen.png', 507000, CAST(N'2023-07-17' AS Date), 1, N'103 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (111, N'Casio', N'casio.png', 457000, CAST(N'2023-07-17' AS Date), 1, N'104 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (113, N'Micheal Kors', N'micheal.png', 842000, CAST(N'2023-07-17' AS Date), 1, N'103 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (114, N'Olympia', N'olympia.png', 615000, CAST(N'2023-07-17' AS Date), 1, N'102 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (115, N'DW', N'dw.png', 570000, CAST(N'2023-07-17' AS Date), 0, N'102 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategotyId]) VALUES (116, N'Guess', N'guess.png', 672000, CAST(N'2023-07-17' AS Date), 1, N'104 ')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'AD', N'ADMIN')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUS', N'CUSTOMER')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIR', N'DIRECTOR')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STA', N'STAFF')
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategotyId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SonaClock] SET  READ_WRITE 
GO
