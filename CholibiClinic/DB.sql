-- =========================================
-- 1. XÓA DATABASE CŨ (NẾU CÓ) ĐỂ LÀM LẠI TỪ ĐẦU
-- =========================================
USE [master];
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'HospitalDB')
BEGIN
    -- Đóng tất cả các kết nối đang mở tới database này
    ALTER DATABASE [HospitalDB] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [HospitalDB];
END
GO

-- =========================================
-- 2. TẠO SCHEMA (CẤU TRÚC BẢNG) TỪ FILE DB CŨ
-- =========================================
USE [master]
GO
/****** Object:  Database [HospitalDB]    Script Date: 25/06/2026 3:21:24 CH ******/
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
/****** Object:  Table [dbo].[Appointments]    Script Date: 25/06/2026 3:21:25 CH ******/
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
/****** Object:  Table [dbo].[Doctors]    Script Date: 25/06/2026 3:21:25 CH ******/
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
/****** Object:  Table [dbo].[MedicalRecords]    Script Date: 25/06/2026 3:21:25 CH ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 25/06/2026 3:21:25 CH ******/
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
/****** Object:  Table [dbo].[Specialties]    Script Date: 25/06/2026 3:21:25 CH ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 25/06/2026 3:21:25 CH ******/
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
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (1, N'Nguyễn Văn A', N'0988888888', N'doctor1@gmail.com', 1)
INSERT [dbo].[Doctors] ([DoctorId], [DoctorName], [Phone], [Email], [SpecialtyId]) VALUES (4, N'Dr.Test', N'8412345986', N'test1@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Title], [Image], [Content], [CreatedDate]) VALUES (1, N'BỆNH VIỆN ABD', N'AA', N'ABCBCBCBCBC', CAST(N'2026-06-05T12:30:00.000' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[Specialties] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (1, N'Administrator', N'admin@gmail.com', N'123456', N'0123456789', N'Nam', CAST(N'2003-01-01' AS Date), N'Hà Nội', N'Admin')
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [Gender], [BirthDate], [Address], [Role]) VALUES (2, N'nhc', N'abc@d.com', N'12345', N'0862897205', N'nữ', CAST(N'2005-04-12' AS Date), N'abcd', N'user')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534333855C6]    Script Date: 25/06/2026 3:21:25 CH ******/
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

GO

-- =========================================
-- 3. THÊM DỮ LIỆU MẪU (MOCK DATA)
-- =========================================
USE [HospitalDB];
GO

-- Thêm dữ liệu bảng Specialties
INSERT INTO Specialties (SpecialtyName) VALUES (N'Tim mạch');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Nhi khoa');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Da liễu');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Sản phụ khoa');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Mắt');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Tai mũi họng');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Thần kinh');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Nội tổng quát');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Cơ xương khớp');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Tiêu hóa');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Nội tiết');
INSERT INTO Specialties (SpecialtyName) VALUES (N'Tâm thần');
GO

-- Thêm dữ liệu bảng Users (Bệnh nhân và Admin)
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Quản Trị Viên', 'admin@cholibi.com', '123456', '0999999999', 'Male', '1990-01-01', N'Trụ sở chính', 'Admin');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Ngô Thị Anh', 'benhnhan1@gmail.com', 'password123', '0313438140', 'Female', '1987-04-08', N'Số 389 Cách Mạng Tháng 8, Quận 7, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hoàng Trúc Lan', 'benhnhan2@gmail.com', 'password123', '0993010430', 'Female', '1954-10-01', N'Số 209 Lý Tự Trọng, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Bùi Hữu Toàn', 'benhnhan3@gmail.com', 'password123', '0322090266', 'Male', '1969-01-08', N'Số 457 Trần Hưng Đạo, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Đức Đạt', 'benhnhan4@gmail.com', 'password123', '0847111255', 'Male', '1951-02-12', N'Số 355 Cách Mạng Tháng 8, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Mai Linh', 'benhnhan5@gmail.com', 'password123', '0947254881', 'Female', '1982-03-28', N'Số 264 Nguyễn Trãi, Quận 7, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Thanh Phong', 'benhnhan6@gmail.com', 'password123', '0380728326', 'Male', '1996-12-06', N'Số 10 Điện Biên Phủ, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Thái Đạt', 'benhnhan7@gmail.com', 'password123', '0900123740', 'Male', '1974-09-13', N'Số 161 Cách Mạng Tháng 8, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Bùi Ngọc Mai', 'benhnhan8@gmail.com', 'password123', '0804912107', 'Female', '1965-07-02', N'Số 366 Điện Biên Phủ, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Lý Như Linh', 'benhnhan9@gmail.com', 'password123', '0886988005', 'Female', '1950-04-19', N'Số 145 Nguyễn Trãi, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phạm Gia Long', 'benhnhan10@gmail.com', 'password123', '0318922198', 'Male', '1953-02-13', N'Số 9 Nguyễn Đình Chiểu, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Trúc Nhung', 'benhnhan11@gmail.com', 'password123', '0393426163', 'Female', '1955-01-24', N'Số 354 Điện Biên Phủ, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Bùi Phương Ngân', 'benhnhan12@gmail.com', 'password123', '0971207103', 'Female', '1962-02-27', N'Số 438 Nguyễn Trãi, Quận 7, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Văn Dũng', 'benhnhan13@gmail.com', 'password123', '0723754468', 'Male', '1976-06-08', N'Số 127 Nguyễn Văn Cừ, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Lê Như Yến', 'benhnhan14@gmail.com', 'password123', '0391754107', 'Female', '1958-08-03', N'Số 328 Nguyễn Văn Cừ, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hoàng Hoàng Quang', 'benhnhan15@gmail.com', 'password123', '0904812955', 'Male', '1993-12-02', N'Số 288 Trần Hưng Đạo, Quận 1, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Bùi Tuyết Yến', 'benhnhan16@gmail.com', 'password123', '0340554783', 'Female', '1972-12-15', N'Số 319 Lê Lợi, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phạm Quang Dũng', 'benhnhan17@gmail.com', 'password123', '0911913111', 'Male', '1973-03-03', N'Số 320 Nguyễn Văn Cừ, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Nguyễn Trúc Anh', 'benhnhan18@gmail.com', 'password123', '0716314249', 'Female', '1998-05-01', N'Số 320 Lê Duẩn, Quận Gò Vấp, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Phương Trang', 'benhnhan19@gmail.com', 'password123', '0989775883', 'Female', '1982-07-16', N'Số 83 Cách Mạng Tháng 8, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Lý Trúc Ly', 'benhnhan20@gmail.com', 'password123', '0960608249', 'Female', '1983-07-18', N'Số 6 Lý Tự Trọng, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Gia Phong', 'benhnhan21@gmail.com', 'password123', '0360042144', 'Male', '1951-06-05', N'Số 313 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Trúc Ngân', 'benhnhan22@gmail.com', 'password123', '0838233862', 'Female', '1950-11-06', N'Số 220 Nguyễn Trãi, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hoàng Trúc Anh', 'benhnhan23@gmail.com', 'password123', '0347133198', 'Female', '1965-03-28', N'Số 123 Nguyễn Trãi, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Minh Quang', 'benhnhan24@gmail.com', 'password123', '0365793166', 'Male', '1956-04-03', N'Số 106 Cách Mạng Tháng 8, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Thái Hiếu', 'benhnhan25@gmail.com', 'password123', '0994866025', 'Male', '1958-09-13', N'Số 295 Nguyễn Trãi, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Thanh Anh', 'benhnhan26@gmail.com', 'password123', '0992801187', 'Male', '1992-11-26', N'Số 335 Lê Duẩn, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Bùi Ngọc Yến', 'benhnhan27@gmail.com', 'password123', '0831181650', 'Female', '2005-03-08', N'Số 118 Cách Mạng Tháng 8, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đỗ Quang Sơn', 'benhnhan28@gmail.com', 'password123', '0963284314', 'Male', '1950-08-19', N'Số 449 Hai Bà Trưng, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Thanh Sơn', 'benhnhan29@gmail.com', 'password123', '0840221371', 'Male', '1975-08-06', N'Số 498 Nguyễn Văn Cừ, Quận Gò Vấp, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Lê Thanh Đạt', 'benhnhan30@gmail.com', 'password123', '0891925701', 'Male', '1966-04-21', N'Số 360 Lê Duẩn, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Hoàng Phong', 'benhnhan31@gmail.com', 'password123', '0896983569', 'Male', '1964-05-31', N'Số 454 Cách Mạng Tháng 8, Quận 1, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hoàng Trúc Mai', 'benhnhan32@gmail.com', 'password123', '0908576643', 'Female', '1972-08-24', N'Số 423 Lê Lợi, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Bùi Gia Linh', 'benhnhan33@gmail.com', 'password123', '0870212183', 'Male', '1989-06-14', N'Số 99 Trần Hưng Đạo, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Đức Đạt', 'benhnhan34@gmail.com', 'password123', '0760854399', 'Male', '1997-01-21', N'Số 480 Lê Duẩn, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Mai Lan', 'benhnhan35@gmail.com', 'password123', '0346843126', 'Female', '1993-06-28', N'Số 180 Điện Biên Phủ, Quận Gò Vấp, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Tuyết Ly', 'benhnhan36@gmail.com', 'password123', '0701789198', 'Female', '1992-06-03', N'Số 395 Nguyễn Đình Chiểu, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Xuân Đạt', 'benhnhan37@gmail.com', 'password123', '0940643457', 'Male', '1977-09-18', N'Số 256 Nguyễn Đình Chiểu, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Dương Thị Thảo', 'benhnhan38@gmail.com', 'password123', '0991358645', 'Female', '1989-09-03', N'Số 206 Cách Mạng Tháng 8, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Dương Phương Yến', 'benhnhan39@gmail.com', 'password123', '0998973647', 'Female', '1963-07-24', N'Số 423 Lý Tự Trọng, Quận 7, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Bùi Tuyết Anh', 'benhnhan40@gmail.com', 'password123', '0968076338', 'Female', '1977-08-13', N'Số 159 Lý Tự Trọng, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Dương Gia Tuấn', 'benhnhan41@gmail.com', 'password123', '0339035979', 'Male', '1994-11-24', N'Số 450 Trần Hưng Đạo, Quận 1, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Dương Thanh Nam', 'benhnhan42@gmail.com', 'password123', '0303745970', 'Male', '1956-07-05', N'Số 414 Trần Hưng Đạo, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Lê Hoàng Tuấn', 'benhnhan43@gmail.com', 'password123', '0309987256', 'Male', '1979-04-09', N'Số 106 Nguyễn Văn Cừ, Quận Gò Vấp, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Võ Phương Yến', 'benhnhan44@gmail.com', 'password123', '0853137023', 'Female', '1962-01-02', N'Số 37 Lê Duẩn, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Võ Phương Vy', 'benhnhan45@gmail.com', 'password123', '0733276497', 'Female', '1988-01-26', N'Số 30 Lê Duẩn, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Ngọc Thảo', 'benhnhan46@gmail.com', 'password123', '0879201720', 'Female', '2000-05-13', N'Số 488 Điện Biên Phủ, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Phương Lan', 'benhnhan47@gmail.com', 'password123', '0391494125', 'Female', '1989-04-18', N'Số 175 Trần Hưng Đạo, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phạm Ngọc Ly', 'benhnhan48@gmail.com', 'password123', '0372674236', 'Female', '1955-01-16', N'Số 53 Lê Duẩn, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Xuân Quang', 'benhnhan49@gmail.com', 'password123', '0797318888', 'Male', '1962-11-26', N'Số 353 Hai Bà Trưng, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phan Văn Kiên', 'benhnhan50@gmail.com', 'password123', '0870896713', 'Male', '1959-10-20', N'Số 94 Nguyễn Trãi, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Nguyễn Gia Long', 'benhnhan51@gmail.com', 'password123', '0970357008', 'Male', '1977-10-21', N'Số 410 Nguyễn Đình Chiểu, Quận 7, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hoàng Như Trang', 'benhnhan52@gmail.com', 'password123', '0821536452', 'Female', '1975-07-26', N'Số 410 Cách Mạng Tháng 8, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đỗ Minh Toàn', 'benhnhan53@gmail.com', 'password123', '0339389806', 'Male', '1972-04-09', N'Số 429 Lý Tự Trọng, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Thanh Vy', 'benhnhan54@gmail.com', 'password123', '0916814675', 'Female', '1974-10-08', N'Số 362 Lê Lợi, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phan Văn Toàn', 'benhnhan55@gmail.com', 'password123', '0714703562', 'Male', '1963-02-15', N'Số 315 Trần Hưng Đạo, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đỗ Quang Bảo', 'benhnhan56@gmail.com', 'password123', '0370347056', 'Male', '2000-11-09', N'Số 343 Trần Hưng Đạo, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Ngô Thu Yến', 'benhnhan57@gmail.com', 'password123', '0841335060', 'Female', '1968-01-09', N'Số 173 Lê Duẩn, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Võ Thanh Ly', 'benhnhan58@gmail.com', 'password123', '0361627064', 'Female', '2002-05-17', N'Số 238 Nguyễn Văn Cừ, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Thanh Phong', 'benhnhan59@gmail.com', 'password123', '0736128021', 'Male', '1974-12-01', N'Số 1 Nguyễn Đình Chiểu, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Hoàng Phong', 'benhnhan60@gmail.com', 'password123', '0848599310', 'Male', '1992-01-02', N'Số 138 Cách Mạng Tháng 8, Quận Gò Vấp, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Thu Hân', 'benhnhan61@gmail.com', 'password123', '0788889497', 'Female', '1972-04-10', N'Số 131 Nguyễn Văn Cừ, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Võ Văn Long', 'benhnhan62@gmail.com', 'password123', '0947120966', 'Male', '1995-11-22', N'Số 209 Lê Duẩn, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Mai Vy', 'benhnhan63@gmail.com', 'password123', '0349679034', 'Female', '1970-04-15', N'Số 450 Nguyễn Văn Cừ, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phan Thái Nam', 'benhnhan64@gmail.com', 'password123', '0711452342', 'Male', '2002-05-03', N'Số 58 Cách Mạng Tháng 8, Quận Gò Vấp, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Xuân Kiên', 'benhnhan65@gmail.com', 'password123', '0738417658', 'Male', '2005-06-12', N'Số 369 Hai Bà Trưng, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Võ Đức Hiếu', 'benhnhan66@gmail.com', 'password123', '0758071355', 'Male', '1983-01-13', N'Số 38 Hai Bà Trưng, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Hoàng Linh', 'benhnhan67@gmail.com', 'password123', '0949812876', 'Male', '1961-07-04', N'Số 145 Hai Bà Trưng, Quận Gò Vấp, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Gia Kiên', 'benhnhan68@gmail.com', 'password123', '0949875857', 'Male', '1990-11-27', N'Số 302 Hai Bà Trưng, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Như Thảo', 'benhnhan69@gmail.com', 'password123', '0327192026', 'Female', '1999-07-14', N'Số 479 Điện Biên Phủ, Quận Gò Vấp, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Võ Trúc Vy', 'benhnhan70@gmail.com', 'password123', '0392934371', 'Female', '1981-05-12', N'Số 114 Lý Tự Trọng, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phan Văn Dũng', 'benhnhan71@gmail.com', 'password123', '0833428222', 'Male', '1985-06-25', N'Số 257 Hai Bà Trưng, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Lý Thị Thảo', 'benhnhan72@gmail.com', 'password123', '0947572533', 'Female', '1956-02-10', N'Số 15 Nguyễn Văn Cừ, Quận 1, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Bùi Hoàng Tài', 'benhnhan73@gmail.com', 'password123', '0871306732', 'Male', '1956-06-06', N'Số 402 Nguyễn Trãi, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Xuân Long', 'benhnhan74@gmail.com', 'password123', '0773904720', 'Male', '1974-09-14', N'Số 13 Trần Hưng Đạo, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phan Như My', 'benhnhan75@gmail.com', 'password123', '0826919337', 'Female', '1987-06-12', N'Số 486 Nguyễn Văn Cừ, Quận 7, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phạm Hoàng Long', 'benhnhan76@gmail.com', 'password123', '0394141274', 'Male', '1983-01-28', N'Số 231 Lê Lợi, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Thị Nhi', 'benhnhan77@gmail.com', 'password123', '0942924296', 'Female', '1978-04-15', N'Số 411 Điện Biên Phủ, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Võ Gia Nam', 'benhnhan78@gmail.com', 'password123', '0321841996', 'Male', '1970-08-26', N'Số 397 Nguyễn Đình Chiểu, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Dương Thanh Bảo', 'benhnhan79@gmail.com', 'password123', '0738703129', 'Male', '1970-03-03', N'Số 13 Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Nguyễn Tuyết Anh', 'benhnhan80@gmail.com', 'password123', '0741237940', 'Female', '1975-11-10', N'Số 465 Điện Biên Phủ, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Nguyễn Thanh Anh', 'benhnhan81@gmail.com', 'password123', '0308855356', 'Female', '1960-03-02', N'Số 356 Lý Tự Trọng, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Lý Hoàng Hiếu', 'benhnhan82@gmail.com', 'password123', '0905829391', 'Male', '1971-06-04', N'Số 386 Cách Mạng Tháng 8, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đỗ Thị Hà', 'benhnhan83@gmail.com', 'password123', '0383172265', 'Female', '1956-04-25', N'Số 309 Nguyễn Đình Chiểu, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Gia Hiếu', 'benhnhan84@gmail.com', 'password123', '0732785976', 'Male', '1980-11-11', N'Số 499 Lê Lợi, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Nguyễn Minh Dũng', 'benhnhan85@gmail.com', 'password123', '0949329621', 'Male', '1961-06-18', N'Số 77 Cách Mạng Tháng 8, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Tuyết Hoa', 'benhnhan86@gmail.com', 'password123', '0895926456', 'Female', '1979-06-24', N'Số 200 Hai Bà Trưng, Quận 10, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Trúc Nhi', 'benhnhan87@gmail.com', 'password123', '0977624755', 'Female', '1988-02-27', N'Số 207 Lê Duẩn, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Trúc My', 'benhnhan88@gmail.com', 'password123', '0979827928', 'Female', '1994-04-20', N'Số 249 Điện Biên Phủ, Quận 2, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Huỳnh Thu Vy', 'benhnhan89@gmail.com', 'password123', '0810404448', 'Female', '1954-03-23', N'Số 168 Trần Hưng Đạo, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Phan Phương Hoa', 'benhnhan90@gmail.com', 'password123', '0831281095', 'Female', '1978-07-30', N'Số 64 Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Thị Nhung', 'benhnhan91@gmail.com', 'password123', '0939159721', 'Female', '1966-10-19', N'Số 12 Lê Lợi, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hoàng Hữu Quang', 'benhnhan92@gmail.com', 'password123', '0903951544', 'Male', '1982-12-01', N'Số 102 Lê Lợi, Quận Cầu Giấy, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Thị Vy', 'benhnhan93@gmail.com', 'password123', '0767992605', 'Female', '1975-09-30', N'Số 321 Điện Biên Phủ, Quận 3, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Hồ Hữu Quang', 'benhnhan94@gmail.com', 'password123', '0800216832', 'Male', '2001-01-08', N'Số 61 Lê Duẩn, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Dương Tuyết Hân', 'benhnhan95@gmail.com', 'password123', '0342129985', 'Female', '1974-10-19', N'Số 72 Điện Biên Phủ, Quận 5, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Vũ Thu Ngân', 'benhnhan96@gmail.com', 'password123', '0865640261', 'Female', '1953-07-18', N'Số 82 Nguyễn Đình Chiểu, Quận Đống Đa, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Trần Văn Tuấn', 'benhnhan97@gmail.com', 'password123', '0966975710', 'Male', '1983-01-15', N'Số 395 Hai Bà Trưng, Quận 1, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Ngô Tuyết Anh', 'benhnhan98@gmail.com', 'password123', '0768808612', 'Female', '1953-11-18', N'Số 129 Cách Mạng Tháng 8, Quận Tân Bình, TP.HCM', 'Patient');
INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role) VALUES (N'Đặng Hữu Nam', 'benhnhan99@gmail.com', 'password123', '0926732646', 'Male', '1968-06-06', N'Số 354 Điện Biên Phủ, Quận 10, TP.HCM', 'Patient');
GO

-- Thêm dữ liệu bảng Doctors
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Lý Mai Yến', '0398813194', 'bacsi1@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Bùi Phương Hân', '0857552783', 'bacsi2@cholibi.com', 12);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Phan Trúc Ly', '0358633822', 'bacsi3@cholibi.com', 3);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Trần Văn Sơn', '0820604455', 'bacsi4@cholibi.com', 10);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Võ Diễm Trang', '0392744483', 'bacsi5@cholibi.com', 5);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Phạm Diễm Mai', '0904278120', 'bacsi6@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Phạm Như Hân', '0902657234', 'bacsi7@cholibi.com', 9);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Phạm Phương Mai', '0795915029', 'bacsi8@cholibi.com', 5);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Hoàng Diễm Thảo', '0717322249', 'bacsi9@cholibi.com', 9);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Võ Thanh Yến', '0730392406', 'bacsi10@cholibi.com', 6);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Bùi Diễm Ly', '0737306599', 'bacsi11@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Ngô Tuyết Lan', '0783323591', 'bacsi12@cholibi.com', 7);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Trần Quang Bảo', '0745430763', 'bacsi13@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Vũ Phương Hà', '0876824628', 'bacsi14@cholibi.com', 2);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Lê Thị Nhung', '0399987671', 'bacsi15@cholibi.com', 5);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Dương Xuân Hòa', '0337249508', 'bacsi16@cholibi.com', 3);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Hoàng Minh Dũng', '0917474721', 'bacsi17@cholibi.com', 10);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Ngô Hữu Linh', '0923946093', 'bacsi18@cholibi.com', 7);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Đặng Hữu Long', '0892869809', 'bacsi19@cholibi.com', 12);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Ngô Mai Hân', '0397872494', 'bacsi20@cholibi.com', 6);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Nguyễn Gia Hòa', '0995674237', 'bacsi21@cholibi.com', 3);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Ngô Đức Anh', '0707571429', 'bacsi22@cholibi.com', 9);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Đỗ Thu Ly', '0336350459', 'bacsi23@cholibi.com', 2);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Lý Tuyết Yến', '0308640596', 'bacsi24@cholibi.com', 7);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Ngô Hữu Phong', '0954094920', 'bacsi25@cholibi.com', 10);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Đặng Thu Mai', '0365440926', 'bacsi26@cholibi.com', 5);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Huỳnh Mai Ngân', '0371767723', 'bacsi27@cholibi.com', 8);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Đặng Thanh My', '0359299734', 'bacsi28@cholibi.com', 5);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Bùi Quang Tuấn', '0387358957', 'bacsi29@cholibi.com', 2);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Bùi Tuyết Trang', '0887106547', 'bacsi30@cholibi.com', 10);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Hoàng Như Vy', '0821108947', 'bacsi31@cholibi.com', 1);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Lý Thái Anh', '0935335896', 'bacsi32@cholibi.com', 1);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Hoàng Hoàng Đạt', '0313472212', 'bacsi33@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Nguyễn Tuyết My', '0821839068', 'bacsi34@cholibi.com', 4);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Lý Tuyết Lan', '0353093161', 'bacsi35@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Lê Xuân Bảo', '0304876447', 'bacsi36@cholibi.com', 4);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Đặng Minh Đạt', '0979460089', 'bacsi37@cholibi.com', 7);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Hoàng Như Nhung', '0753359879', 'bacsi38@cholibi.com', 3);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Ngô Trúc Trang', '0726165214', 'bacsi39@cholibi.com', 7);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'PGS. TS. BS. Dương Thị Nhung', '0817868693', 'bacsi40@cholibi.com', 12);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Hồ Thái Linh', '0877403633', 'bacsi41@cholibi.com', 6);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Bùi Thu Lan', '0929637208', 'bacsi42@cholibi.com', 9);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Lý Đức Bảo', '0328698515', 'bacsi43@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'TS. BS. Vũ Tuyết Ngân', '0731184058', 'bacsi44@cholibi.com', 9);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Ngô Như Hân', '0901734851', 'bacsi45@cholibi.com', 1);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Đỗ Quang Dũng', '0909454874', 'bacsi46@cholibi.com', 5);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Bùi Mai Lan', '0823505833', 'bacsi47@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Huỳnh Thanh Mai', '0377474784', 'bacsi48@cholibi.com', 10);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'ThS. BS. Hồ Trúc Hân', '0730507847', 'bacsi49@cholibi.com', 11);
INSERT INTO Doctors (DoctorName, Phone, Email, SpecialtyId) VALUES (N'BS. Hồ Thu Hoa', '0776867855', 'bacsi50@cholibi.com', 7);
GO

-- Thêm dữ liệu bảng Appointments
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (3, 45, '2026-02-24', '10:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (14, 43, '2025-09-02', '08:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (9, 29, '2025-08-06', '14:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (50, 32, '2025-04-20', '10:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (52, 29, '2026-12-30', '12:15:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (77, 43, '2025-12-16', '11:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (100, 47, '2025-05-04', '14:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (71, 11, '2026-07-20', '13:45:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (35, 49, '2025-04-04', '10:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (57, 16, '2026-05-02', '08:30:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (89, 21, '2026-06-17', '16:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (38, 46, '2025-06-26', '10:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (32, 10, '2025-08-03', '16:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (47, 35, '2025-07-29', '13:15:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (8, 11, '2025-10-19', '13:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (77, 40, '2026-12-27', '14:45:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (26, 39, '2026-11-30', '14:45:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (60, 25, '2026-11-05', '15:30:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (97, 12, '2026-08-02', '12:15:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (92, 12, '2025-08-27', '15:45:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (49, 23, '2026-06-25', '15:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (22, 30, '2026-06-13', '16:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (24, 45, '2026-02-05', '11:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (83, 27, '2026-12-15', '09:15:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (55, 42, '2026-12-13', '08:15:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (17, 42, '2026-08-22', '15:30:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (3, 8, '2026-01-25', '14:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (90, 13, '2026-05-29', '15:15:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (41, 2, '2026-07-20', '09:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (42, 18, '2025-01-19', '15:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (52, 37, '2026-11-23', '12:30:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (86, 12, '2025-10-31', '16:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (57, 19, '2026-06-12', '08:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (18, 7, '2025-03-19', '16:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (48, 49, '2025-07-21', '14:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (67, 34, '2025-10-16', '08:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (53, 44, '2026-05-28', '08:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (27, 25, '2025-10-10', '13:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (36, 44, '2026-09-05', '10:45:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (67, 2, '2025-01-04', '08:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (72, 38, '2026-04-22', '09:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (51, 19, '2026-09-28', '10:30:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (38, 15, '2026-07-18', '10:00:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (6, 41, '2026-07-03', '08:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (27, 44, '2026-03-08', '11:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (96, 13, '2026-03-27', '11:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (66, 4, '2026-09-27', '12:15:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (71, 40, '2026-02-08', '14:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (61, 44, '2025-12-03', '11:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (72, 31, '2026-03-28', '12:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (64, 50, '2026-05-23', '10:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (35, 19, '2026-09-30', '09:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (70, 20, '2026-03-19', '16:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (76, 38, '2026-07-03', '11:45:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (69, 49, '2025-06-11', '16:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (24, 48, '2026-07-24', '13:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (73, 3, '2025-12-30', '14:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (4, 11, '2026-04-20', '14:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (43, 17, '2025-06-01', '12:45:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (71, 16, '2025-11-17', '15:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (29, 29, '2026-07-07', '13:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (30, 31, '2026-11-04', '14:45:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (15, 48, '2026-03-04', '10:00:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (61, 33, '2025-01-01', '10:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (32, 30, '2026-10-11', '09:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (97, 19, '2025-11-02', '12:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (100, 2, '2025-12-14', '14:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (39, 37, '2025-10-29', '16:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (76, 1, '2026-02-06', '16:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (43, 37, '2025-11-19', '09:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (55, 24, '2025-08-02', '10:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (77, 12, '2026-03-24', '08:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (35, 27, '2026-12-07', '10:45:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (55, 35, '2025-09-15', '16:00:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (25, 8, '2026-05-10', '11:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (45, 17, '2025-11-04', '09:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (44, 7, '2026-01-03', '11:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (76, 33, '2025-11-04', '10:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (57, 17, '2025-06-12', '10:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (14, 20, '2026-11-26', '13:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (10, 33, '2026-06-15', '16:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (26, 21, '2025-02-14', '15:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (50, 18, '2025-01-15', '09:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (80, 45, '2026-03-02', '15:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (49, 44, '2025-08-11', '08:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (79, 50, '2026-09-24', '13:15:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (69, 15, '2025-10-22', '12:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (2, 6, '2025-06-27', '12:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (74, 6, '2026-11-09', '16:45:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (76, 31, '2026-06-23', '11:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (2, 22, '2026-07-05', '11:15:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (67, 6, '2026-10-16', '11:30:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (44, 23, '2026-02-07', '16:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (59, 9, '2025-06-10', '12:45:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (91, 7, '2026-02-25', '10:15:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (32, 30, '2026-12-06', '16:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (16, 41, '2026-03-06', '09:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (81, 42, '2025-04-14', '16:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (48, 7, '2025-05-21', '08:30:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (25, 47, '2025-06-22', '14:45:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (47, 23, '2026-11-16', '12:15:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (87, 24, '2026-09-29', '14:15:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (18, 13, '2026-07-24', '15:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (49, 38, '2026-01-10', '13:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (86, 37, '2025-08-17', '08:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (68, 3, '2026-01-29', '14:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (54, 37, '2026-03-09', '11:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (81, 49, '2026-03-26', '08:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (5, 15, '2026-12-06', '10:00:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (20, 6, '2025-06-22', '15:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (67, 8, '2025-11-01', '13:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (80, 36, '2025-11-04', '11:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (79, 35, '2025-02-02', '14:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (66, 9, '2025-11-28', '14:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (79, 39, '2025-03-06', '08:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (96, 17, '2026-08-28', '11:00:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (85, 2, '2025-12-22', '16:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (86, 36, '2025-04-15', '13:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (30, 38, '2025-05-15', '16:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (72, 24, '2025-12-26', '12:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (95, 47, '2025-12-18', '14:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (3, 47, '2025-03-27', '15:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (52, 1, '2026-08-12', '08:30:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (9, 27, '2025-07-06', '14:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (40, 18, '2025-03-31', '09:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (20, 29, '2026-04-15', '14:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (44, 23, '2026-03-12', '08:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (96, 43, '2026-02-08', '10:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (84, 15, '2025-02-12', '14:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (25, 28, '2025-05-08', '15:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (100, 20, '2025-07-28', '16:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (33, 50, '2025-01-29', '13:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (2, 41, '2026-05-05', '14:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (12, 29, '2026-08-24', '14:00:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (54, 14, '2025-02-13', '08:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (6, 18, '2026-06-16', '11:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (11, 38, '2026-05-20', '11:15:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (36, 39, '2025-07-12', '16:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (20, 11, '2026-05-04', '08:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (47, 5, '2025-04-17', '11:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (82, 3, '2025-03-01', '14:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (43, 14, '2025-11-13', '11:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (88, 29, '2025-04-25', '08:15:00', 'Confirmed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (87, 26, '2025-10-06', '16:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (72, 29, '2026-03-01', '08:00:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (68, 26, '2026-03-20', '15:30:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (9, 6, '2026-12-05', '08:30:00', 'Cancelled');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (43, 25, '2025-08-28', '15:45:00', 'Completed');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (64, 41, '2026-09-01', '11:45:00', 'Pending');
INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES (10, 3, '2026-09-09', '13:30:00', 'Confirmed');
GO

-- Thêm dữ liệu bảng MedicalRecords
INSERT INTO MedicalRecords (AppointmentId, Diagnosis, Prescription, Notes)
SELECT AppointmentId, 
  CASE ABS(CHECKSUM(NEWID())) % 12 
    WHEN 0 THEN N'Viêm họng cấp tính'
    WHEN 1 THEN N'Viêm loét dạ dày tá tràng'
    WHEN 2 THEN N'Tăng huyết áp vô căn'
    WHEN 3 THEN N'Rối loạn tiền đình'
    WHEN 4 THEN N'Viêm kết mạc dị ứng'
    WHEN 5 THEN N'Đau mỏi vai gáy'
    WHEN 6 THEN N'Trào ngược dạ dày thực quản (GERD)'
    WHEN 7 THEN N'Suy nhược cơ thể'
    WHEN 8 THEN N'Viêm da cơ địa'
    WHEN 9 THEN N'Rối loạn lo âu'
    WHEN 10 THEN N'Cảm cúm thông thường'
    WHEN 11 THEN N'Tiểu đường tuýp 2'
  END,
  CASE ABS(CHECKSUM(NEWID())) % 12 
    WHEN 0 THEN N'Kháng sinh Amoxicillin 500mg, Paracetamol 500mg, Súc miệng nước muối sinh lý.'
    WHEN 1 THEN N'Omeprazole 20mg, Phosphalugel, Kiêng đồ chua cay, Hạn chế thức khuya.'
    WHEN 2 THEN N'Amlodipine 5mg, Theo dõi huyết áp hàng ngày, Ăn nhạt.'
    WHEN 3 THEN N'Cinnarizine 25mg, Ginkgo Biloba, Nghỉ ngơi nhiều, Tránh thay đổi tư thế đột ngột.'
    WHEN 4 THEN N'Thuốc nhỏ mắt V.Rohto, Tránh dụi mắt, Đeo kính râm khi ra đường.'
    WHEN 5 THEN N'Miorel 4mg, Tập vật lý trị liệu, Chườm ấm vùng cổ vai.'
    WHEN 6 THEN N'Esomeprazole 40mg, Domperidone 10mg, Kê cao gối khi ngủ.'
    WHEN 7 THEN N'Vitamin tổng hợp Pharmaton, Ăn uống bồi dưỡng, Giảm tải công việc.'
    WHEN 8 THEN N'Thuốc bôi Fucicort, Kem dưỡng ẩm Cetaphil, Hạn chế tắm nước quá nóng.'
    WHEN 9 THEN N'Magnesium B6, Cố gắng thư giãn, Tập yoga, Tránh caffeine.'
    WHEN 10 THEN N'Decolgen, Bổ sung Vitamin C, Uống nhiều nước ấm.'
    WHEN 11 THEN N'Metformin 850mg, Tuân thủ chế độ ăn kiêng tinh bột, Tập thể dục đều đặn.'
  END,
  N'Bệnh nhân tái khám sau 7 ngày hoặc khi có triệu chứng bất thường.'
FROM Appointments WHERE Status = 'Completed';
GO

-- Thêm dữ liệu bảng News
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Dấu hiệu cảnh báo sớm đột quỵ và cách sơ cứu', 'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Dấu hiệu cảnh báo sớm đột quỵ và cách sơ cứu''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2026-06-03 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Những dấu hiệu cảnh báo bệnh tim mạch bạn không nên bỏ qua', 'news_placeholder_1.jpg', N'Đây là nội dung chi tiết của bài viết ''Những dấu hiệu cảnh báo bệnh tim mạch bạn không nên bỏ qua''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-12-08 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày', 'news_placeholder_5.jpg', N'Đây là nội dung chi tiết của bài viết ''Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2026-04-01 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng', 'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-12-23 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Cách chăm sóc da vào mùa hanh khô', 'news_placeholder_2.jpg', N'Đây là nội dung chi tiết của bài viết ''Cách chăm sóc da vào mùa hanh khô''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2026-06-30 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục', 'news_placeholder_4.jpg', N'Đây là nội dung chi tiết của bài viết ''Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2026-07-04 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Tại sao bạn luôn cảm thấy mệt mỏi? Nguyên nhân và cách khắc phục', 'news_placeholder_4.jpg', N'Đây là nội dung chi tiết của bài viết ''Tại sao bạn luôn cảm thấy mệt mỏi? Nguyên nhân và cách khắc phục''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-04-01 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày', 'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-02-10 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục', 'news_placeholder_1.jpg', N'Đây là nội dung chi tiết của bài viết ''Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-03-11 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng', 'news_placeholder_5.jpg', N'Đây là nội dung chi tiết của bài viết ''Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2026-02-21 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục (Phần 5)', 'news_placeholder_4.jpg', N'Đây là nội dung chi tiết của bài viết ''Bảo vệ mắt đúng cách khi làm việc với máy tính liên tục (Phần 5)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-03-22 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Dấu hiệu cảnh báo sớm đột quỵ và cách sơ cứu (Phần 5)', 'news_placeholder_2.jpg', N'Đây là nội dung chi tiết của bài viết ''Dấu hiệu cảnh báo sớm đột quỵ và cách sơ cứu (Phần 5)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2026-05-16 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày (Phần 2)', 'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày (Phần 2)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-04-28 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Cách chăm sóc da vào mùa hanh khô (Phần 5)', 'news_placeholder_4.jpg', N'Đây là nội dung chi tiết của bài viết ''Cách chăm sóc da vào mùa hanh khô (Phần 5)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-08-20 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Những sai lầm khi tự ý dùng thuốc kháng sinh (Phần 4)', 'news_placeholder_1.jpg', N'Đây là nội dung chi tiết của bài viết ''Những sai lầm khi tự ý dùng thuốc kháng sinh (Phần 4)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2026-06-26 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Tại sao bạn luôn cảm thấy mệt mỏi? Nguyên nhân và cách khắc phục (Phần 4)', 'news_placeholder_5.jpg', N'Đây là nội dung chi tiết của bài viết ''Tại sao bạn luôn cảm thấy mệt mỏi? Nguyên nhân và cách khắc phục (Phần 4)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-04-24 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Những dấu hiệu cảnh báo bệnh tim mạch bạn không nên bỏ qua (Phần 2)', 'news_placeholder_5.jpg', N'Đây là nội dung chi tiết của bài viết ''Những dấu hiệu cảnh báo bệnh tim mạch bạn không nên bỏ qua (Phần 2)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-01-19 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày (Phần 2)', 'news_placeholder_2.jpg', N'Đây là nội dung chi tiết của bài viết ''Chế độ dinh dưỡng hợp lý cho người bệnh đau dạ dày (Phần 2)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-07-17 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng (Phần 4)', 'news_placeholder_3.jpg', N'Đây là nội dung chi tiết của bài viết ''Lợi ích của việc khám sức khỏe định kỳ mỗi 6 tháng (Phần 4)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-11-28 00:00:00');
INSERT INTO News (Title, Image, Content, CreatedDate) VALUES (N'Những sai lầm khi tự ý dùng thuốc kháng sinh (Phần 2)', 'news_placeholder_2.jpg', N'Đây là nội dung chi tiết của bài viết ''Những sai lầm khi tự ý dùng thuốc kháng sinh (Phần 2)''. Nội dung này cung cấp các thông tin y tế hữu ích cho cộng đồng, giúp mọi người nâng cao nhận thức về việc bảo vệ sức khỏe và phòng tránh bệnh tật.', '2025-04-27 00:00:00');
GO

