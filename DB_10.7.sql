USE [master]
GO
/****** Object:  Database [HospitalDB]    Script Date: 10/07/2026 5:13:40 CH ******/
CREATE DATABASE [HospitalDB]
GO
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HospitalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HospitalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalDB] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HospitalDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [HospitalDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HospitalDB]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 10/07/2026 5:13:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[DoctorId] [int] NULL,
	[AppointmentDate] [date] NULL,
	[AppointmentTime] [time](7) NULL,
	[Status] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 10/07/2026 5:13:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[SpecialtyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecords]    Script Date: 10/07/2026 5:13:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecords](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NULL,
	[Diagnosis] [nvarchar](max) NULL,
	[Prescription] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/07/2026 5:13:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Image] [nvarchar](300) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialties]    Script Date: 10/07/2026 5:13:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialties](
	[SpecialtyId] [int] IDENTITY(1,1) NOT NULL,
	[SpecialtyName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecialtyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/07/2026 5:13:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Gender] [nvarchar](10) NULL,
	[BirthDate] [date] NULL,
	[Address] [nvarchar](200) NULL,
	[Role] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (1, 3, 45, CAST(N'2026-02-24' AS Date), CAST(N'10:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (2, 14, 43, CAST(N'2025-09-02' AS Date), CAST(N'08:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (3, 9, 29, CAST(N'2025-08-06' AS Date), CAST(N'14:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (4, 50, 32, CAST(N'2025-04-20' AS Date), CAST(N'10:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (5, 52, 29, CAST(N'2026-12-30' AS Date), CAST(N'12:15:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (6, 77, 43, CAST(N'2025-12-16' AS Date), CAST(N'11:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (7, 100, 47, CAST(N'2025-05-04' AS Date), CAST(N'14:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (8, 71, 11, CAST(N'2026-07-20' AS Date), CAST(N'13:45:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (9, 35, 49, CAST(N'2025-04-04' AS Date), CAST(N'10:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (10, 57, 16, CAST(N'2026-05-02' AS Date), CAST(N'08:30:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (11, 89, 21, CAST(N'2026-06-17' AS Date), CAST(N'16:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (12, 38, 46, CAST(N'2025-06-26' AS Date), CAST(N'10:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (13, 32, 10, CAST(N'2025-08-03' AS Date), CAST(N'16:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (14, 47, 35, CAST(N'2025-07-29' AS Date), CAST(N'13:15:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (15, 8, 11, CAST(N'2025-10-19' AS Date), CAST(N'13:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (16, 77, 40, CAST(N'2026-12-27' AS Date), CAST(N'14:45:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (17, 26, 39, CAST(N'2026-11-30' AS Date), CAST(N'14:45:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (18, 60, 25, CAST(N'2026-11-05' AS Date), CAST(N'15:30:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (19, 97, 12, CAST(N'2026-08-02' AS Date), CAST(N'12:15:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (20, 92, 12, CAST(N'2025-08-27' AS Date), CAST(N'15:45:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (21, 49, 23, CAST(N'2026-06-25' AS Date), CAST(N'15:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (22, 22, 30, CAST(N'2026-06-13' AS Date), CAST(N'16:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (23, 24, 45, CAST(N'2026-02-05' AS Date), CAST(N'11:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (24, 83, 27, CAST(N'2026-12-15' AS Date), CAST(N'09:15:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (25, 55, 42, CAST(N'2026-12-13' AS Date), CAST(N'08:15:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (26, 17, 42, CAST(N'2026-08-22' AS Date), CAST(N'15:30:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (27, 3, 8, CAST(N'2026-01-25' AS Date), CAST(N'14:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (28, 90, 13, CAST(N'2026-05-29' AS Date), CAST(N'15:15:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (30, 42, 18, CAST(N'2025-01-19' AS Date), CAST(N'15:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (31, 52, 37, CAST(N'2026-11-23' AS Date), CAST(N'12:30:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (32, 86, 12, CAST(N'2025-10-31' AS Date), CAST(N'16:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (33, 57, 19, CAST(N'2026-06-12' AS Date), CAST(N'08:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (34, 18, 7, CAST(N'2025-03-19' AS Date), CAST(N'16:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (35, 48, 49, CAST(N'2025-07-21' AS Date), CAST(N'14:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (36, 67, 34, CAST(N'2025-10-16' AS Date), CAST(N'08:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (37, 53, 44, CAST(N'2026-05-28' AS Date), CAST(N'08:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (38, 27, 25, CAST(N'2025-10-10' AS Date), CAST(N'13:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (39, 36, 44, CAST(N'2026-09-05' AS Date), CAST(N'10:45:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (41, 72, 38, CAST(N'2026-04-22' AS Date), CAST(N'09:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (42, 51, 19, CAST(N'2026-09-28' AS Date), CAST(N'10:30:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (43, 38, 15, CAST(N'2026-07-18' AS Date), CAST(N'10:00:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (44, 6, 41, CAST(N'2026-07-03' AS Date), CAST(N'08:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (45, 27, 44, CAST(N'2026-03-08' AS Date), CAST(N'11:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (46, 96, 13, CAST(N'2026-03-27' AS Date), CAST(N'11:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (47, 66, 4, CAST(N'2026-09-27' AS Date), CAST(N'12:15:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (48, 71, 40, CAST(N'2026-02-08' AS Date), CAST(N'14:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (49, 61, 44, CAST(N'2025-12-03' AS Date), CAST(N'11:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (50, 72, 31, CAST(N'2026-03-28' AS Date), CAST(N'12:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (51, 64, 50, CAST(N'2026-05-23' AS Date), CAST(N'10:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (52, 35, 19, CAST(N'2026-09-30' AS Date), CAST(N'09:00:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (53, 70, 20, CAST(N'2026-03-19' AS Date), CAST(N'16:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (54, 76, 38, CAST(N'2026-07-03' AS Date), CAST(N'11:45:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (55, 69, 49, CAST(N'2025-06-11' AS Date), CAST(N'16:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (56, 24, 48, CAST(N'2026-07-24' AS Date), CAST(N'13:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (58, 4, 11, CAST(N'2026-04-20' AS Date), CAST(N'14:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (59, 43, 17, CAST(N'2025-06-01' AS Date), CAST(N'12:45:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (60, 71, 16, CAST(N'2025-11-17' AS Date), CAST(N'15:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (61, 29, 29, CAST(N'2026-07-07' AS Date), CAST(N'13:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (62, 30, 31, CAST(N'2026-11-04' AS Date), CAST(N'14:45:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (63, 15, 48, CAST(N'2026-03-04' AS Date), CAST(N'10:00:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (64, 61, 33, CAST(N'2025-01-01' AS Date), CAST(N'10:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (65, 32, 30, CAST(N'2026-10-11' AS Date), CAST(N'09:00:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (66, 97, 19, CAST(N'2025-11-02' AS Date), CAST(N'12:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (68, 39, 37, CAST(N'2025-10-29' AS Date), CAST(N'16:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (69, 76, 1, CAST(N'2026-02-06' AS Date), CAST(N'16:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (70, 43, 37, CAST(N'2025-11-19' AS Date), CAST(N'09:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (71, 55, 24, CAST(N'2025-08-02' AS Date), CAST(N'10:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (72, 77, 12, CAST(N'2026-03-24' AS Date), CAST(N'08:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (73, 35, 27, CAST(N'2026-12-07' AS Date), CAST(N'10:45:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (74, 55, 35, CAST(N'2025-09-15' AS Date), CAST(N'16:00:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (75, 25, 8, CAST(N'2026-05-10' AS Date), CAST(N'11:00:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (76, 45, 17, CAST(N'2025-11-04' AS Date), CAST(N'09:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (77, 44, 7, CAST(N'2026-01-03' AS Date), CAST(N'11:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (78, 76, 33, CAST(N'2025-11-04' AS Date), CAST(N'10:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (79, 57, 17, CAST(N'2025-06-12' AS Date), CAST(N'10:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (80, 14, 20, CAST(N'2026-11-26' AS Date), CAST(N'13:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (81, 10, 33, CAST(N'2026-06-15' AS Date), CAST(N'16:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (82, 26, 21, CAST(N'2025-02-14' AS Date), CAST(N'15:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (83, 50, 18, CAST(N'2025-01-15' AS Date), CAST(N'09:00:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (84, 80, 45, CAST(N'2026-03-02' AS Date), CAST(N'15:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (85, 49, 44, CAST(N'2025-08-11' AS Date), CAST(N'08:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (86, 79, 50, CAST(N'2026-09-24' AS Date), CAST(N'13:15:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (87, 69, 15, CAST(N'2025-10-22' AS Date), CAST(N'12:00:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (88, 2, 6, CAST(N'2025-06-27' AS Date), CAST(N'12:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (89, 74, 6, CAST(N'2026-11-09' AS Date), CAST(N'16:45:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (90, 76, 31, CAST(N'2026-06-23' AS Date), CAST(N'11:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (91, 2, 22, CAST(N'2026-07-05' AS Date), CAST(N'11:15:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (92, 67, 6, CAST(N'2026-10-16' AS Date), CAST(N'11:30:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (93, 44, 23, CAST(N'2026-02-07' AS Date), CAST(N'16:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (94, 59, 9, CAST(N'2025-06-10' AS Date), CAST(N'12:45:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (95, 91, 7, CAST(N'2026-02-25' AS Date), CAST(N'10:15:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (96, 32, 30, CAST(N'2026-12-06' AS Date), CAST(N'16:00:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (97, 16, 41, CAST(N'2026-03-06' AS Date), CAST(N'09:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (98, 81, 42, CAST(N'2025-04-14' AS Date), CAST(N'16:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (99, 48, 7, CAST(N'2025-05-21' AS Date), CAST(N'08:30:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (100, 25, 47, CAST(N'2025-06-22' AS Date), CAST(N'14:45:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (101, 47, 23, CAST(N'2026-11-16' AS Date), CAST(N'12:15:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (102, 87, 24, CAST(N'2026-09-29' AS Date), CAST(N'14:15:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (103, 18, 13, CAST(N'2026-07-24' AS Date), CAST(N'15:00:00' AS Time), N'Pending')
GO
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (104, 49, 38, CAST(N'2026-01-10' AS Date), CAST(N'13:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (105, 86, 37, CAST(N'2025-08-17' AS Date), CAST(N'08:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (107, 54, 37, CAST(N'2026-03-09' AS Date), CAST(N'11:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (108, 81, 49, CAST(N'2026-03-26' AS Date), CAST(N'08:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (109, 5, 15, CAST(N'2026-12-06' AS Date), CAST(N'10:00:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (110, 20, 6, CAST(N'2025-06-22' AS Date), CAST(N'15:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (111, 67, 8, CAST(N'2025-11-01' AS Date), CAST(N'13:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (112, 80, 36, CAST(N'2025-11-04' AS Date), CAST(N'11:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (113, 79, 35, CAST(N'2025-02-02' AS Date), CAST(N'14:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (114, 66, 9, CAST(N'2025-11-28' AS Date), CAST(N'14:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (115, 79, 39, CAST(N'2025-03-06' AS Date), CAST(N'08:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (116, 96, 17, CAST(N'2026-08-28' AS Date), CAST(N'11:00:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (118, 86, 36, CAST(N'2025-04-15' AS Date), CAST(N'13:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (119, 30, 38, CAST(N'2025-05-15' AS Date), CAST(N'16:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (120, 72, 24, CAST(N'2025-12-26' AS Date), CAST(N'12:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (121, 95, 47, CAST(N'2025-12-18' AS Date), CAST(N'14:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (122, 3, 47, CAST(N'2025-03-27' AS Date), CAST(N'15:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (123, 52, 1, CAST(N'2026-08-12' AS Date), CAST(N'08:30:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (124, 9, 27, CAST(N'2025-07-06' AS Date), CAST(N'14:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (125, 40, 18, CAST(N'2025-03-31' AS Date), CAST(N'09:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (126, 20, 29, CAST(N'2026-04-15' AS Date), CAST(N'14:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (127, 44, 23, CAST(N'2026-03-12' AS Date), CAST(N'08:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (128, 96, 43, CAST(N'2026-02-08' AS Date), CAST(N'10:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (129, 84, 15, CAST(N'2025-02-12' AS Date), CAST(N'14:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (130, 25, 28, CAST(N'2025-05-08' AS Date), CAST(N'15:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (131, 100, 20, CAST(N'2025-07-28' AS Date), CAST(N'16:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (132, 33, 50, CAST(N'2025-01-29' AS Date), CAST(N'13:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (133, 2, 41, CAST(N'2026-05-05' AS Date), CAST(N'14:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (134, 12, 29, CAST(N'2026-08-24' AS Date), CAST(N'14:00:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (135, 54, 14, CAST(N'2025-02-13' AS Date), CAST(N'08:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (136, 6, 18, CAST(N'2026-06-16' AS Date), CAST(N'11:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (137, 11, 38, CAST(N'2026-05-20' AS Date), CAST(N'11:15:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (138, 36, 39, CAST(N'2025-07-12' AS Date), CAST(N'16:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (139, 20, 11, CAST(N'2026-05-04' AS Date), CAST(N'08:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (140, 47, 5, CAST(N'2025-04-17' AS Date), CAST(N'11:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (142, 43, 14, CAST(N'2025-11-13' AS Date), CAST(N'11:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (143, 88, 29, CAST(N'2025-04-25' AS Date), CAST(N'08:15:00' AS Time), N'Confirmed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (144, 87, 26, CAST(N'2025-10-06' AS Date), CAST(N'16:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (145, 72, 29, CAST(N'2026-03-01' AS Date), CAST(N'08:00:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (146, 68, 26, CAST(N'2026-03-20' AS Date), CAST(N'15:30:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (147, 9, 6, CAST(N'2026-12-05' AS Date), CAST(N'08:30:00' AS Time), N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (148, 43, 25, CAST(N'2025-08-28' AS Date), CAST(N'15:45:00' AS Time), N'Completed')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (149, 64, 41, CAST(N'2026-09-01' AS Date), CAST(N'11:45:00' AS Time), N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (151, 3, 23, CAST(N'2026-07-11' AS Date), CAST(N'08:00:00' AS Time), N'Đã hủy')
INSERT [dbo].[Appointments] ([AppointmentId], [UserId], [DoctorId], [AppointmentDate], [AppointmentTime], [Status]) VALUES (152, 3, 5, CAST(N'2026-07-11' AS Date), CAST(N'08:00:00' AS Time), N'Chờ khám')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (1, N'Nguyễn Văn A', N'0988888888', N'doctor1@gmail.com', 1)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (4, N'Dr.Test', N'8412345986', N'test1@gmail.com', 1)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (5, N'ThS. BS. Lý Mai Yến', N'0398813194', N'bacsi1@cholibi.com', 11)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (6, N'PGS. TS. BS. Bùi Phương Hân', N'0857552783', N'bacsi2@cholibi.com', 12)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (7, N'TS. BS. Phan Trúc Ly', N'0358633822', N'bacsi3@cholibi.com', 3)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (8, N'PGS. TS. BS. Trần Văn Sơn', N'0820604455', N'bacsi4@cholibi.com', 10)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (9, N'BS. Võ Diễm Trang', N'0392744483', N'bacsi5@cholibi.com', 5)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (10, N'ThS. BS. Phạm Diễm Mai', N'0904278120', N'bacsi6@cholibi.com', 11)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (11, N'TS. BS. Phạm Như Hân', N'0902657234', N'bacsi7@cholibi.com', 9)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (12, N'BS. Phạm Phương Mai', N'0795915029', N'bacsi8@cholibi.com', 5)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (13, N'ThS. BS. Hoàng Diễm Thảo', N'0717322249', N'bacsi9@cholibi.com', 9)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (14, N'PGS. TS. BS. Võ Thanh Yến', N'0730392406', N'bacsi10@cholibi.com', 6)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (15, N'ThS. BS. Bùi Diễm Ly', N'0737306599', N'bacsi11@cholibi.com', 11)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (16, N'TS. BS. Ngô Tuyết Lan', N'0783323591', N'bacsi12@cholibi.com', 7)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (17, N'BS. Trần Quang Bảo', N'0745430763', N'bacsi13@cholibi.com', 11)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (18, N'PGS. TS. BS. Vũ Phương Hà', N'0876824628', N'bacsi14@cholibi.com', 2)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (19, N'BS. Lê Thị Nhung', N'0399987671', N'bacsi15@cholibi.com', 5)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (20, N'PGS. TS. BS. Dương Xuân Hòa', N'0337249508', N'bacsi16@cholibi.com', 3)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (21, N'TS. BS. Hoàng Minh Dũng', N'0917474721', N'bacsi17@cholibi.com', 10)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (22, N'ThS. BS. Ngô Hữu Linh', N'0923946093', N'bacsi18@cholibi.com', 7)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (23, N'BS. Đặng Hữu Long', N'0892869809', N'bacsi19@cholibi.com', 12)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (24, N'PGS. TS. BS. Ngô Mai Hân', N'0397872494', N'bacsi20@cholibi.com', 6)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (25, N'TS. BS. Nguyễn Gia Hòa', N'0995674237', N'bacsi21@cholibi.com', 3)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (26, N'PGS. TS. BS. Ngô Đức Anh', N'0707571429', N'bacsi22@cholibi.com', 9)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (27, N'BS. Đỗ Thu Ly', N'0336350459', N'bacsi23@cholibi.com', 2)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (28, N'BS. Lý Tuyết Yến', N'0308640596', N'bacsi24@cholibi.com', 7)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (29, N'TS. BS. Ngô Hữu Phong', N'0954094920', N'bacsi25@cholibi.com', 10)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (30, N'PGS. TS. BS. Đặng Thu Mai', N'0365440926', N'bacsi26@cholibi.com', 5)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (31, N'TS. BS. Huỳnh Mai Ngân', N'0371767723', N'bacsi27@cholibi.com', 8)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (32, N'PGS. TS. BS. Đặng Thanh My', N'0359299734', N'bacsi28@cholibi.com', 5)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (33, N'ThS. BS. Bùi Quang Tuấn', N'0387358957', N'bacsi29@cholibi.com', 2)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (34, N'TS. BS. Bùi Tuyết Trang', N'0887106547', N'bacsi30@cholibi.com', 10)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (35, N'PGS. TS. BS. Hoàng Như Vy', N'0821108947', N'bacsi31@cholibi.com', 1)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (36, N'TS. BS. Lý Thái Anh', N'0935335896', N'bacsi32@cholibi.com', 1)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (37, N'PGS. TS. BS. Hoàng Hoàng Đạt', N'0313472212', N'bacsi33@cholibi.com', 11)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (38, N'PGS. TS. BS. Nguyễn Tuyết My', N'0821839068', N'bacsi34@cholibi.com', 4)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (39, N'TS. BS. Lý Tuyết Lan', N'0353093161', N'bacsi35@cholibi.com', 11)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (40, N'TS. BS. Lê Xuân Bảo', N'0304876447', N'bacsi36@cholibi.com', 4)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (41, N'PGS. TS. BS. Đặng Minh Đạt', N'0979460089', N'bacsi37@cholibi.com', 7)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (42, N'PGS. TS. BS. Hoàng Như Nhung', N'0753359879', N'bacsi38@cholibi.com', 3)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (43, N'TS. BS. Ngô Trúc Trang', N'0726165214', N'bacsi39@cholibi.com', 7)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (44, N'PGS. TS. BS. Dương Thị Nhung', N'0817868693', N'bacsi40@cholibi.com', 12)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (45, N'ThS. BS. Hồ Thái Linh', N'0877403633', N'bacsi41@cholibi.com', 6)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (46, N'BS. Bùi Thu Lan', N'0929637208', N'bacsi42@cholibi.com', 9)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (47, N'ThS. BS. Lý Đức Bảo', N'0328698515', N'bacsi43@cholibi.com', 11)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (48, N'TS. BS. Vũ Tuyết Ngân', N'0731184058', N'bacsi44@cholibi.com', 9)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (49, N'ThS. BS. Ngô Như Hân', N'0901734851', N'bacsi45@cholibi.com', 1)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (50, N'BS. Đỗ Quang Dũng', N'0909454874', N'bacsi46@cholibi.com', 5)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (51, N'BS. Bùi Mai Lan', N'0823505833', N'bacsi47@cholibi.com', 11)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecords] ON 

INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (1, 1, N'Rối loạn lo âu', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (2, 2, N'Suy nhược cơ thể', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (3, 3, NULL, N'Cinnarizine 25mg, Ginkgo Biloba, Nghỉ ngơi nhiều, Tránh thay đổi tư thế đột ngột.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (4, 4, NULL, N'Metformin 850mg, Tuân thủ chế độ ăn kiêng tinh bột, Tập thể dục đều đặn.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (5, 6, NULL, N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (6, 7, N'Tăng huyết áp vô căn', N'Decolgen, Bổ sung Vitamin C, Uống nhiều nước ấm.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (7, 11, N'Viêm da cơ địa', N'Thuốc bôi Fucicort, Kem dưỡng ẩm Cetaphil, Hạn chế tắm nước quá nóng.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (8, 12, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (9, 13, N'Viêm kết mạc dị ứng', N'Cinnarizine 25mg, Ginkgo Biloba, Nghỉ ngơi nhiều, Tránh thay đổi tư thế đột ngột.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (10, 15, N'Rối loạn tiền đình', N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (11, 21, NULL, N'Miorel 4mg, Tập vật lý trị liệu, Chườm ấm vùng cổ vai.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (12, 22, N'Suy nhược cơ thể', N'Omeprazole 20mg, Phosphalugel, Kiêng đồ chua cay, Hạn chế thức khuya.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (13, 23, N'Viêm da cơ địa', N'Omeprazole 20mg, Phosphalugel, Kiêng đồ chua cay, Hạn chế thức khuya.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (14, 27, N'Viêm họng cấp tính', N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (15, 30, N'Viêm họng cấp tính', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (16, 32, N'Tiểu đường tuýp 2', N'Thuốc nhỏ mắt V.Rohto, Tránh dụi mắt, Đeo kính râm khi ra đường.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (17, 33, NULL, N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (18, 34, N'Tăng huyết áp vô căn', N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (19, 35, N'Cảm cúm thông thường', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (20, 36, N'Viêm da cơ địa', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (21, 37, N'Suy nhược cơ thể', N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (22, 38, N'Suy nhược cơ thể', N'Thuốc nhỏ mắt V.Rohto, Tránh dụi mắt, Đeo kính râm khi ra đường.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (23, 41, N'Rối loạn tiền đình', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (24, 44, NULL, N'Cinnarizine 25mg, Ginkgo Biloba, Nghỉ ngơi nhiều, Tránh thay đổi tư thế đột ngột.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (25, 45, N'Đau mỏi vai gáy', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (26, 46, N'Đau mỏi vai gáy', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (27, 48, N'Viêm loét dạ dày tá tràng', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (28, 49, N'Tăng huyết áp vô căn', N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (29, 50, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (30, 51, N'Viêm da cơ địa', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (31, 53, N'Tăng huyết áp vô căn', N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (32, 55, N'Trào ngược dạ dày thực quản (GERD)', N'Magnesium B6, Cố gắng thư giãn, Tập yoga, Tránh caffeine.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (33, 58, NULL, N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (34, 60, N'Trào ngược dạ dày thực quản (GERD)', N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (35, 61, N'Viêm loét dạ dày tá tràng', N'Thuốc nhỏ mắt V.Rohto, Tránh dụi mắt, Đeo kính râm khi ra đường.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (36, 66, N'Cảm cúm thông thường', N'Magnesium B6, Cố gắng thư giãn, Tập yoga, Tránh caffeine.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (37, 69, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (38, 70, NULL, N'Thuốc nhỏ mắt V.Rohto, Tránh dụi mắt, Đeo kính râm khi ra đường.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (39, 71, N'Cảm cúm thông thường', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (40, 72, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (41, 76, N'Đau mỏi vai gáy', N'Vitamin tổng hợp Pharmaton, Ăn uống bồi dưỡng, Giảm tải công việc.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (42, 77, N'Tiểu đường tuýp 2', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (43, 78, NULL, N'Magnesium B6, Cố gắng thư giãn, Tập yoga, Tránh caffeine.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (44, 79, N'Viêm kết mạc dị ứng', N'Thuốc bôi Fucicort, Kem dưỡng ẩm Cetaphil, Hạn chế tắm nước quá nóng.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (45, 81, NULL, N'Metformin 850mg, Tuân thủ chế độ ăn kiêng tinh bột, Tập thể dục đều đặn.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (46, 82, N'Viêm họng cấp tính', N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (47, 84, N'Viêm loét dạ dày tá tràng', N'Esomeprazole 40mg, Domperidone 10mg, Kê cao gối khi ngủ.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (48, 85, NULL, N'Esomeprazole 40mg, Domperidone 10mg, Kê cao gối khi ngủ.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (49, 88, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (50, 90, N'Suy nhược cơ thể', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (51, 93, N'Rối loạn tiền đình', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (52, 97, N'Viêm da cơ địa', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (53, 98, N'Rối loạn lo âu', N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (54, 104, NULL, N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (55, 105, N'Viêm da cơ địa', N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (56, 107, NULL, N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (57, 108, NULL, N'Vitamin tổng hợp Pharmaton, Ăn uống bồi dưỡng, Giảm tải công việc.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (58, 110, N'Trào ngược dạ dày thực quản (GERD)', N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (59, 112, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (60, 113, N'Rối loạn lo âu', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (61, 115, N'Tăng huyết áp vô căn', N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (62, 118, NULL, N'Thuốc nhỏ mắt V.Rohto, Tránh dụi mắt, Đeo kính râm khi ra đường.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (63, 119, N'Viêm loét dạ dày tá tràng', N'Omeprazole 20mg, Phosphalugel, Kiêng đồ chua cay, Hạn chế thức khuya.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (64, 120, N'Rối loạn lo âu', N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (65, 121, N'Viêm họng cấp tính', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (66, 122, NULL, N'Cinnarizine 25mg, Ginkgo Biloba, Nghỉ ngơi nhiều, Tránh thay đổi tư thế đột ngột.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (67, 124, N'Suy nhược cơ thể', N'Thuốc nhỏ mắt V.Rohto, Tránh dụi mắt, Đeo kính râm khi ra đường.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (68, 125, N'Đau mỏi vai gáy', N'Vitamin tổng hợp Pharmaton, Ăn uống bồi dưỡng, Giảm tải công việc.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (69, 126, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (70, 127, N'Trào ngược dạ dày thực quản (GERD)', N'Omeprazole 20mg, Phosphalugel, Kiêng đồ chua cay, Hạn chế thức khuya.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (71, 129, NULL, N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (72, 130, N'Viêm họng cấp tính', N'Cinnarizine 25mg, Ginkgo Biloba, Nghỉ ngơi nhiều, Tránh thay đổi tư thế đột ngột.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (73, 131, N'Viêm loét dạ dày tá tràng', N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (74, 132, N'Rối loạn tiền đình', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (75, 133, N'Viêm họng cấp tính', N'Cinnarizine 25mg, Ginkgo Biloba, Nghỉ ngơi nhiều, Tránh thay đổi tư thế đột ngột.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (76, 135, NULL, N'Cinnarizine 25mg, Ginkgo Biloba, Nghỉ ngơi nhiều, Tránh thay đổi tư thế đột ngột.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (77, 136, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (78, 137, N'Viêm họng cấp tính', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (79, 138, N'Tăng huyết áp vô căn', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (80, 139, N'Trào ngược dạ dày thực quản (GERD)', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (81, 140, N'Viêm loét dạ dày tá tràng', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (82, 142, NULL, NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (83, 144, NULL, N'Thuốc nhỏ mắt V.Rohto, Tránh dụi mắt, Đeo kính râm khi ra đường.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (84, 145, NULL, N'Thuốc bôi Fucicort, Kem dưỡng ẩm Cetaphil, Hạn chế tắm nước quá nóng.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (85, 146, N'Cảm cúm thông thường', NULL, N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
INSERT [dbo].[MedicalRecords] ([RecordId], [AppointmentId], [Diagnosis], [Prescription], [Notes]) VALUES (86, 148, NULL, N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.', N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.')
SET IDENTITY_INSERT [dbo].[MedicalRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (1, N'BỆNH VIỆN ABD', N'AA', N'ABCBCBCBCBC', CAST(N'2026-06-05T12:30:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (2, N'Dấu hiệu cảnh báo sớm đột quỵ và cách sơ cứu', N'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Dấu hiệu cảnh báo sớm đột quỵ và cách sơ cứu''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2026-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (3, N'Những dấu hiệu cảnh báo bệnh tim mạch bạn không nên bỏ qua', N'news_placeholder_1.jpg', N'Đây là nội dung chi tiết của bài viết ''Những dấu hiệu cảnh báo bệnh tim mạch bạn không nên bỏ qua''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (4, N'Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày', N'news_placeholder_5.jpg', N'Đây là nội dung chi tiết của bài viết ''Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2026-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (5, N'Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng', N'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-12-23T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (6, N'Cách chăm sóc da vào mùa hanh khô', N'news_placeholder_2.jpg', N'Đây là nội dung chi tiết của bài viết ''Cách chăm sóc da vào mùa hanh khô''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2026-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (7, N'Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục', N'news_placeholder_4.jpg', N'Đây là nội dung chi tiết của bài viết ''Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2026-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (8, N'Tại sao bạn luôn cảm thấy mệt mỏi? Nguyên nhân và cách khắc phục', N'news_placeholder_4.jpg', N'Đây là nội dung chi tiết của bài viết ''Tại sao bạn luôn cảm thấy mệt mỏi? Nguyên nhân và cách khắc phục''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (9, N'Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày', N'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (10, N'Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục', N'news_placeholder_1.jpg', N'Đây là nội dung chi tiết của bài viết ''Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (11, N'Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng', N'news_placeholder_5.jpg', N'Đây là nội dung chi tiết của bài viết ''Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2026-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (12, N'Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục (Phần 5)', N'news_placeholder_4.jpg', N'Đây là nội dung chi tiết của bài viết ''Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục (Phần 5)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (13, N'Dấu hiệu cảnh báo sớm đột quỵ và cách sơ cứu (Phần 5)', N'news_placeholder_2.jpg', N'Đây là nội dung chi tiết của bài viết ''Dấu hiệu cảnh báo sớm đột quỵ và cách sơ cứu (Phần 5)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2026-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (14, N'Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày (Phần 2)', N'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày (Phần 2)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (15, N'Cách chăm sóc da vào mùa hanh khô (Phần 5)', N'news_placeholder_4.jpg', N'Đây là nội dung chi tiết của bài viết ''Cách chăm sóc da vào mùa hanh khô (Phần 5)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-08-20T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (16, N'Những sai lầm khi tự ý dùng thuốc kháng sinh (Phần 4)', N'news_placeholder_1.jpg', N'Đây là nội dung chi tiết của bài viết ''Những sai lầm khi tự ý dùng thuốc kháng sinh (Phần 4)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2026-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (17, N'Tại sao bạn luôn cảm thấy mệt mỏi? Nguyên nhân và cách khắc phục (Phần 4)', N'news_placeholder_5.jpg', N'Đây là nội dung chi tiết của bài viết ''Tại sao bạn luôn cảm thấy mệt mỏi? Nguyên nhân và cách khắc phục (Phần 4)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-04-24T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (18, N'Những dấu hiệu cảnh báo bệnh tim mạch bạn không nên bỏ qua (Phần 2)', N'news_placeholder_5.jpg', N'Đây là nội dung chi tiết của bài viết ''Những dấu hiệu cảnh báo bệnh tim mạch bạn không nên bỏ qua (Phần 2)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (19, N'Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày (Phần 2)', N'news_placeholder_2.jpg', N'Đây là nội dung chi tiết của bài viết ''Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày (Phần 2)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (20, N'Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng (Phần 4)', N'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng (Phần 4)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (21, N'Những sai lầm khi tự ý dùng thuốc kháng sinh (Phần 2)', N'news_placeholder_2.jpg', N'Đây là nội dung chi tiết của bài viết ''Những sai lầm khi tự ý dùng thuốc kháng sinh (Phần 2)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', CAST(N'2025-04-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialties] ON 

INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (1, N'Nội tổng quát')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (2, N'Tim mạch')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (3, N'Nhi khoa')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (4, N'Da liễu')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (5, N'Tai mũi họng')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (6, N'BCAS')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (7, N'TEST')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (8, N'test2')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (9, N'Tim mạch')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (10, N'Nhi khoa')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (11, N'Da liễu')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (12, N'Sản phụ khoa')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (13, N'Mắt')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (14, N'Tai mũi họng')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (15, N'Thần kinh')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (16, N'Nội tổng quát')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (17, N'Cơ xương khớp')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (18, N'Tiêu hóa')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (19, N'Nội tiết')
INSERT [dbo].[Specialties] ([SpecialtyId], [SpecialtyName]) VALUES (20, N'Tâm thần')
SET IDENTITY_INSERT [dbo].[Specialties] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (1, N'Administrator', N'admin@gmail.com', N'123456', N'0123456789', N'Nam', CAST(N'2003-01-01' AS Date), N'Hà Nội', N'Admin')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (2, N'nhc', N'abc@d.com', N'12345', N'0862897205', N'nữ', CAST(N'2005-04-12' AS Date), N'abcd', N'user')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (3, N'Quản Trị Viên', N'admin@cholibi.com', N'123456', N'0999999999', N'Male', CAST(N'1990-01-01' AS Date), N'Trụ sở chính', N'Admin')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (4, N'Ngô Thị Anh', N'benhnhan1@gmail.com', N'password123', N'0313438140', N'Female', CAST(N'1987-04-08' AS Date), N'Số 389 Cách Mạng Tháng 8, Quận 7, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (5, N'Hoàng Trúc Lan', N'benhnhan2@gmail.com', N'password123', N'0993010430', N'Female', CAST(N'1954-10-01' AS Date), N'Số 209 Lý Tự Trọng, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (6, N'Bùi Hữu Toàn', N'benhnhan3@gmail.com', N'password123', N'0322090266', N'Male', CAST(N'1969-01-08' AS Date), N'Số 457 Trần Hưng Đạo, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (7, N'Trần Đức Đạt', N'benhnhan4@gmail.com', N'password123', N'0847111255', N'Male', CAST(N'1951-02-12' AS Date), N'Số 355 Cách Mạng Tháng 8, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (8, N'Hồ Mai Linh', N'benhnhan5@gmail.com', N'password123', N'0947254881', N'Female', CAST(N'1982-03-28' AS Date), N'Số 264 Nguyễn Trãi, Quận 7, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (9, N'Hồ Thanh Phong', N'benhnhan6@gmail.com', N'password123', N'0380728326', N'Male', CAST(N'1996-12-06' AS Date), N'Số 10 Điện Biên Phủ, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (10, N'Trần Thái Đạt', N'benhnhan7@gmail.com', N'password123', N'0900123740', N'Male', CAST(N'1974-09-13' AS Date), N'Số 161 Cách Mạng Tháng 8, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (11, N'Bùi Ngọc Mai', N'benhnhan8@gmail.com', N'password123', N'0804912107', N'Female', CAST(N'1965-07-02' AS Date), N'Số 366 Điện Biên Phủ, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (12, N'Lý Như Linh', N'benhnhan9@gmail.com', N'password123', N'0886988005', N'Female', CAST(N'1950-04-19' AS Date), N'Số 145 Nguyễn Trãi, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (13, N'Phạm Gia Long', N'benhnhan10@gmail.com', N'password123', N'0318922198', N'Male', CAST(N'1953-02-13' AS Date), N'Số 9 Nguyễn Đình Chiểu, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (14, N'Huỳnh Trúc Nhung', N'benhnhan11@gmail.com', N'password123', N'0393426163', N'Female', CAST(N'1955-01-24' AS Date), N'Số 354 Điện Biên Phủ, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (15, N'Bùi Phương Ngân', N'benhnhan12@gmail.com', N'password123', N'0971207103', N'Female', CAST(N'1962-02-27' AS Date), N'Số 438 Nguyễn Trãi, Quận 7, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (16, N'Đặng Văn Dũng', N'benhnhan13@gmail.com', N'password123', N'0723754468', N'Male', CAST(N'1976-06-08' AS Date), N'Số 127 Nguyễn Văn Cừ, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (17, N'Lê Như Yến', N'benhnhan14@gmail.com', N'password123', N'0391754107', N'Female', CAST(N'1958-08-03' AS Date), N'Số 328 Nguyễn Văn Cừ, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (18, N'Hoàng Hoàng Quang', N'benhnhan15@gmail.com', N'password123', N'0904812955', N'Male', CAST(N'1993-12-02' AS Date), N'Số 288 Trần Hưng Đạo, Quận 1, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (19, N'Bùi Tuyết Yến', N'benhnhan16@gmail.com', N'password123', N'0340554783', N'Female', CAST(N'1972-12-15' AS Date), N'Số 319 Lê Lợi, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (20, N'Phạm Quang Dũng', N'benhnhan17@gmail.com', N'password123', N'0911913111', N'Male', CAST(N'1973-03-03' AS Date), N'Số 320 Nguyễn Văn Cừ, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (21, N'Nguyễn Trúc Anh', N'benhnhan18@gmail.com', N'password123', N'0716314249', N'Female', CAST(N'1998-05-01' AS Date), N'Số 320 Lê Duẩn, Quận Gò Vấp, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (22, N'Đặng Phương Trang', N'benhnhan19@gmail.com', N'password123', N'0989775883', N'Female', CAST(N'1982-07-16' AS Date), N'Số 83 Cách Mạng Tháng 8, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (23, N'Lý Trúc Ly', N'benhnhan20@gmail.com', N'password123', N'0960608249', N'Female', CAST(N'1983-07-18' AS Date), N'Số 6 Lý Tự Trọng, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (24, N'Huỳnh Gia Phong', N'benhnhan21@gmail.com', N'password123', N'0360042144', N'Male', CAST(N'1951-06-05' AS Date), N'Số 313 Nguyễn Đình Chiểu, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (25, N'Đặng Trúc Ngân', N'benhnhan22@gmail.com', N'password123', N'0838233862', N'Female', CAST(N'1950-11-06' AS Date), N'Số 220 Nguyễn Trãi, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (26, N'Hoàng Trúc Anh', N'benhnhan23@gmail.com', N'password123', N'0347133198', N'Female', CAST(N'1965-03-28' AS Date), N'Số 123 Nguyễn Trãi, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (27, N'Hồ Minh Quang', N'benhnhan24@gmail.com', N'password123', N'0365793166', N'Male', CAST(N'1956-04-03' AS Date), N'Số 106 Cách Mạng Tháng 8, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (28, N'Huỳnh Thái Hiếu', N'benhnhan25@gmail.com', N'password123', N'0994866025', N'Male', CAST(N'1958-09-13' AS Date), N'Số 295 Nguyễn Trãi, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (29, N'Trần Thanh Anh', N'benhnhan26@gmail.com', N'password123', N'0992801187', N'Male', CAST(N'1992-11-26' AS Date), N'Số 335 Lê Duẩn, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (30, N'Bùi Ngọc Yến', N'benhnhan27@gmail.com', N'password123', N'0831181650', N'Female', CAST(N'2005-03-08' AS Date), N'Số 118 Cách Mạng Tháng 8, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (31, N'Đỗ Quang Sơn', N'benhnhan28@gmail.com', N'password123', N'0963284314', N'Male', CAST(N'1950-08-19' AS Date), N'Số 449 Hai Bà Trưng, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (32, N'Trần Thanh Sơn', N'benhnhan29@gmail.com', N'password123', N'0840221371', N'Male', CAST(N'1975-08-06' AS Date), N'Số 498 Nguyễn Văn Cừ, Quận Gò Vấp, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (33, N'Lê Thanh Đạt', N'benhnhan30@gmail.com', N'password123', N'0891925701', N'Male', CAST(N'1966-04-21' AS Date), N'Số 360 Lê Duẩn, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (34, N'Huỳnh Hoàng Phong', N'benhnhan31@gmail.com', N'password123', N'0896983569', N'Male', CAST(N'1964-05-31' AS Date), N'Số 454 Cách Mạng Tháng 8, Quận 1, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (35, N'Hoàng Trúc Mai', N'benhnhan32@gmail.com', N'password123', N'0908576643', N'Female', CAST(N'1972-08-24' AS Date), N'Số 423 Lê Lợi, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (36, N'Bùi Gia Linh', N'benhnhan33@gmail.com', N'password123', N'0870212183', N'Male', CAST(N'1989-06-14' AS Date), N'Số 99 Trần Hưng Đạo, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (37, N'Trần Đức Đạt', N'benhnhan34@gmail.com', N'password123', N'0760854399', N'Male', CAST(N'1997-01-21' AS Date), N'Số 480 Lê Duẩn, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (38, N'Trần Mai Lan', N'benhnhan35@gmail.com', N'password123', N'0346843126', N'Female', CAST(N'1993-06-28' AS Date), N'Số 180 Điện Biên Phủ, Quận Gò Vấp, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (39, N'Hồ Tuyết Ly', N'benhnhan36@gmail.com', N'password123', N'0701789198', N'Female', CAST(N'1992-06-03' AS Date), N'Số 395 Nguyễn Đình Chiểu, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (40, N'Trần Xuân Đạt', N'benhnhan37@gmail.com', N'password123', N'0940643457', N'Male', CAST(N'1977-09-18' AS Date), N'Số 256 Nguyễn Đình Chiểu, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (41, N'Dương Thị Thảo', N'benhnhan38@gmail.com', N'password123', N'0991358645', N'Female', CAST(N'1989-09-03' AS Date), N'Số 206 Cách Mạng Tháng 8, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (42, N'Dương Phương Yến', N'benhnhan39@gmail.com', N'password123', N'0998973647', N'Female', CAST(N'1963-07-24' AS Date), N'Số 423 Lý Tự Trọng, Quận 7, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (43, N'Bùi Tuyết Anh', N'benhnhan40@gmail.com', N'password123', N'0968076338', N'Female', CAST(N'1977-08-13' AS Date), N'Số 159 Lý Tự Trọng, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (44, N'Dương Gia Tuấn', N'benhnhan41@gmail.com', N'password123', N'0339035979', N'Male', CAST(N'1994-11-24' AS Date), N'Số 450 Trần Hưng Đạo, Quận 1, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (45, N'Dương Thanh Nam', N'benhnhan42@gmail.com', N'password123', N'0303745970', N'Male', CAST(N'1956-07-05' AS Date), N'Số 414 Trần Hưng Đạo, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (46, N'Lê Hoàng Tuấn', N'benhnhan43@gmail.com', N'password123', N'0309987256', N'Male', CAST(N'1979-04-09' AS Date), N'Số 106 Nguyễn Văn Cừ, Quận Gò Vấp, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (47, N'Võ Phương Yến', N'benhnhan44@gmail.com', N'password123', N'0853137023', N'Female', CAST(N'1962-01-02' AS Date), N'Số 37 Lê Duẩn, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (48, N'Võ Phương Vy', N'benhnhan45@gmail.com', N'password123', N'0733276497', N'Female', CAST(N'1988-01-26' AS Date), N'Số 30 Lê Duẩn, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (49, N'Huỳnh Ngọc Thảo', N'benhnhan46@gmail.com', N'password123', N'0879201720', N'Female', CAST(N'2000-05-13' AS Date), N'Số 488 Điện Biên Phủ, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (50, N'Hồ Phương Lan', N'benhnhan47@gmail.com', N'password123', N'0391494125', N'Female', CAST(N'1989-04-18' AS Date), N'Số 175 Trần Hưng Đạo, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (51, N'Phạm Ngọc Ly', N'benhnhan48@gmail.com', N'password123', N'0372674236', N'Female', CAST(N'1955-01-16' AS Date), N'Số 53 Lê Duẩn, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (52, N'Hồ Xuân Quang', N'benhnhan49@gmail.com', N'password123', N'0797318888', N'Male', CAST(N'1962-11-26' AS Date), N'Số 353 Hai Bà Trưng, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (53, N'Phan Văn Kiên', N'benhnhan50@gmail.com', N'password123', N'0870896713', N'Male', CAST(N'1959-10-20' AS Date), N'Số 94 Nguyễn Trãi, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (54, N'Nguyễn Gia Long', N'benhnhan51@gmail.com', N'password123', N'0970357008', N'Male', CAST(N'1977-10-21' AS Date), N'Số 410 Nguyễn Đình Chiểu, Quận 7, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (55, N'Hoàng Như Trang', N'benhnhan52@gmail.com', N'password123', N'0821536452', N'Female', CAST(N'1975-07-26' AS Date), N'Số 410 Cách Mạng Tháng 8, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (56, N'Đỗ Minh Toàn', N'benhnhan53@gmail.com', N'password123', N'0339389806', N'Male', CAST(N'1972-04-09' AS Date), N'Số 429 Lý Tự Trọng, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (57, N'Đặng Thanh Vy', N'benhnhan54@gmail.com', N'password123', N'0916814675', N'Female', CAST(N'1974-10-08' AS Date), N'Số 362 Lê Lợi, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (58, N'Phan Văn Toàn', N'benhnhan55@gmail.com', N'password123', N'0714703562', N'Male', CAST(N'1963-02-15' AS Date), N'Số 315 Trần Hưng Đạo, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (59, N'Đỗ Quang Bảo', N'benhnhan56@gmail.com', N'password123', N'0370347056', N'Male', CAST(N'2000-11-09' AS Date), N'Số 343 Trần Hưng Đạo, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (60, N'Ngô Thu Yến', N'benhnhan57@gmail.com', N'password123', N'0841335060', N'Female', CAST(N'1968-01-09' AS Date), N'Số 173 Lê Duẩn, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (61, N'Võ Thanh Ly', N'benhnhan58@gmail.com', N'password123', N'0361627064', N'Female', CAST(N'2002-05-17' AS Date), N'Số 238 Nguyễn Văn Cừ, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (62, N'Đặng Thanh Phong', N'benhnhan59@gmail.com', N'password123', N'0736128021', N'Male', CAST(N'1974-12-01' AS Date), N'Số 1 Nguyễn Đình Chiểu, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (63, N'Huỳnh Hoàng Phong', N'benhnhan60@gmail.com', N'password123', N'0848599310', N'Male', CAST(N'1992-01-02' AS Date), N'Số 138 Cách Mạng Tháng 8, Quận Gò Vấp, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (64, N'Trần Thu Hân', N'benhnhan61@gmail.com', N'password123', N'0788889497', N'Female', CAST(N'1972-04-10' AS Date), N'Số 131 Nguyễn Văn Cừ, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (65, N'Võ Văn Long', N'benhnhan62@gmail.com', N'password123', N'0947120966', N'Male', CAST(N'1995-11-22' AS Date), N'Số 209 Lê Duẩn, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (66, N'Hồ Mai Vy', N'benhnhan63@gmail.com', N'password123', N'0349679034', N'Female', CAST(N'1970-04-15' AS Date), N'Số 450 Nguyễn Văn Cừ, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (67, N'Phan Thái Nam', N'benhnhan64@gmail.com', N'password123', N'0711452342', N'Male', CAST(N'2002-05-03' AS Date), N'Số 58 Cách Mạng Tháng 8, Quận Gò Vấp, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (68, N'Hồ Xuân Kiên', N'benhnhan65@gmail.com', N'password123', N'0738417658', N'Male', CAST(N'2005-06-12' AS Date), N'Số 369 Hai Bà Trưng, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (69, N'Võ Đức Hiếu', N'benhnhan66@gmail.com', N'password123', N'0758071355', N'Male', CAST(N'1983-01-13' AS Date), N'Số 38 Hai Bà Trưng, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (70, N'Hồ Hoàng Linh', N'benhnhan67@gmail.com', N'password123', N'0949812876', N'Male', CAST(N'1961-07-04' AS Date), N'Số 145 Hai Bà Trưng, Quận Gò Vấp, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (71, N'Huỳnh Gia Kiên', N'benhnhan68@gmail.com', N'password123', N'0949875857', N'Male', CAST(N'1990-11-27' AS Date), N'Số 302 Hai Bà Trưng, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (72, N'Đặng Như Thảo', N'benhnhan69@gmail.com', N'password123', N'0327192026', N'Female', CAST(N'1999-07-14' AS Date), N'Số 479 Điện Biên Phủ, Quận Gò Vấp, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (73, N'Võ Trúc Vy', N'benhnhan70@gmail.com', N'password123', N'0392934371', N'Female', CAST(N'1981-05-12' AS Date), N'Số 114 Lý Tự Trọng, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (74, N'Phan Văn Dũng', N'benhnhan71@gmail.com', N'password123', N'0833428222', N'Male', CAST(N'1985-06-25' AS Date), N'Số 257 Hai Bà Trưng, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (75, N'Lý Thị Thảo', N'benhnhan72@gmail.com', N'password123', N'0947572533', N'Female', CAST(N'1956-02-10' AS Date), N'Số 15 Nguyễn Văn Cừ, Quận 1, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (76, N'Bùi Hoàng Tài', N'benhnhan73@gmail.com', N'password123', N'0871306732', N'Male', CAST(N'1956-06-06' AS Date), N'Số 402 Nguyễn Trãi, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (77, N'Huỳnh Xuân Long', N'benhnhan74@gmail.com', N'password123', N'0773904720', N'Male', CAST(N'1974-09-14' AS Date), N'Số 13 Trần Hưng Đạo, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (78, N'Phan Như My', N'benhnhan75@gmail.com', N'password123', N'0826919337', N'Female', CAST(N'1987-06-12' AS Date), N'Số 486 Nguyễn Văn Cừ, Quận 7, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (79, N'Phạm Hoàng Long', N'benhnhan76@gmail.com', N'password123', N'0394141274', N'Male', CAST(N'1983-01-28' AS Date), N'Số 231 Lê Lợi, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (80, N'Đặng Thị Nhi', N'benhnhan77@gmail.com', N'password123', N'0942924296', N'Female', CAST(N'1978-04-15' AS Date), N'Số 411 Điện Biên Phủ, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (81, N'Võ Gia Nam', N'benhnhan78@gmail.com', N'password123', N'0321841996', N'Male', CAST(N'1970-08-26' AS Date), N'Số 397 Nguyễn Đình Chiểu, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (82, N'Dương Thanh Bảo', N'benhnhan79@gmail.com', N'password123', N'0738703129', N'Male', CAST(N'1970-03-03' AS Date), N'Số 13 Nguyễn Trãi, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (83, N'Nguyễn Tuyết Anh', N'benhnhan80@gmail.com', N'password123', N'0741237940', N'Female', CAST(N'1975-11-10' AS Date), N'Số 465 Điện Biên Phủ, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (84, N'Nguyễn Thanh Anh', N'benhnhan81@gmail.com', N'password123', N'0308855356', N'Female', CAST(N'1960-03-02' AS Date), N'Số 356 Lý Tự Trọng, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (85, N'Lý Hoàng Hiếu', N'benhnhan82@gmail.com', N'password123', N'0905829391', N'Male', CAST(N'1971-06-04' AS Date), N'Số 386 Cách Mạng Tháng 8, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (86, N'Đỗ Thị Hà', N'benhnhan83@gmail.com', N'password123', N'0383172265', N'Female', CAST(N'1956-04-25' AS Date), N'Số 309 Nguyễn Đình Chiểu, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (87, N'Hồ Gia Hiếu', N'benhnhan84@gmail.com', N'password123', N'0732785976', N'Male', CAST(N'1980-11-11' AS Date), N'Số 499 Lê Lợi, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (88, N'Nguyễn Minh Dũng', N'benhnhan85@gmail.com', N'password123', N'0949329621', N'Male', CAST(N'1961-06-18' AS Date), N'Số 77 Cách Mạng Tháng 8, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (89, N'Hồ Tuyết Hoa', N'benhnhan86@gmail.com', N'password123', N'0895926456', N'Female', CAST(N'1979-06-24' AS Date), N'Số 200 Hai Bà Trưng, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (90, N'Đặng Trúc Nhi', N'benhnhan87@gmail.com', N'password123', N'0977624755', N'Female', CAST(N'1988-02-27' AS Date), N'Số 207 Lê Duẩn, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (91, N'Huỳnh Trúc My', N'benhnhan88@gmail.com', N'password123', N'0979827928', N'Female', CAST(N'1994-04-20' AS Date), N'Số 249 Điện Biên Phủ, Quận 2, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (92, N'Huỳnh Thu Vy', N'benhnhan89@gmail.com', N'password123', N'0810404448', N'Female', CAST(N'1954-03-23' AS Date), N'Số 168 Trần Hưng Đạo, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (93, N'Phan Phương Hoa', N'benhnhan90@gmail.com', N'password123', N'0831281095', N'Female', CAST(N'1978-07-30' AS Date), N'Số 64 Nguyễn Trãi, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (94, N'Hồ Thị Nhung', N'benhnhan91@gmail.com', N'password123', N'0939159721', N'Female', CAST(N'1966-10-19' AS Date), N'Số 12 Lê Lợi, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (95, N'Hoàng Hữu Quang', N'benhnhan92@gmail.com', N'password123', N'0903951544', N'Male', CAST(N'1982-12-01' AS Date), N'Số 102 Lê Lợi, Quận Cầu Giấy, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (96, N'Hồ Thị Vy', N'benhnhan93@gmail.com', N'password123', N'0767992605', N'Female', CAST(N'1975-09-30' AS Date), N'Số 321 Điện Biên Phủ, Quận 3, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (97, N'Hồ Hữu Quang', N'benhnhan94@gmail.com', N'password123', N'0800216832', N'Male', CAST(N'2001-01-08' AS Date), N'Số 61 Lê Duẩn, Quận Đống Đa, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (98, N'Dương Tuyết Hân', N'benhnhan95@gmail.com', N'password123', N'0342129985', N'Female', CAST(N'1974-10-19' AS Date), N'Số 72 Điện Biên Phủ, Quận 5, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (99, N'Vũ Thu Ngân', N'benhnhan96@gmail.com', N'password123', N'0865640261', N'Female', CAST(N'1953-07-18' AS Date), N'Số 82 Nguyễn Đình Chiểu, Quận Đống Đa, TP.HCM', N'Patient')
GO
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (100, N'Trần Văn Tuấn', N'benhnhan97@gmail.com', N'password123', N'0966975710', N'Male', CAST(N'1983-01-15' AS Date), N'Số 395 Hai Bà Trưng, Quận 1, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (101, N'Ngô Tuyết Anh', N'benhnhan98@gmail.com', N'password123', N'0768808612', N'Female', CAST(N'1953-11-18' AS Date), N'Số 129 Cách Mạng Tháng 8, Quận Tân Bình, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (102, N'Đặng Hữu Nam', N'benhnhan99@gmail.com', N'password123', N'0926732646', N'Male', CAST(N'1968-06-06' AS Date), N'Số 354 Điện Biên Phủ, Quận 10, TP.HCM', N'Patient')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (103, N'ThS. BS. Lý Mai Yến', N'bacsi1@cholibi.com', N'bacsi1', N'0398813194', N'Nữ', CAST(N'1979-07-10' AS Date), N'', N'Doctor')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534A6ECA540]    Script Date: 10/07/2026 5:13:41 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD FOREIGN KEY([SpecialtyId])
REFERENCES [dbo].[Specialties] ([SpecialtyId])
GO
ALTER TABLE [dbo].[MedicalRecords]  WITH CHECK ADD FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([AppointmentId])
GO
USE [master]
GO
ALTER DATABASE [HospitalDB] SET  READ_WRITE 
GO
