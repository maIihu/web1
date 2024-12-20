USE [master]
GO
/****** Object:  Database [ShopGiay]    Script Date: 11/1/2024 4:44:23 PM ******/
CREATE DATABASE [ShopGiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopGiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopGiay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopGiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopGiay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopGiay] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopGiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopGiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopGiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopGiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopGiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopGiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopGiay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopGiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopGiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopGiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopGiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopGiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopGiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopGiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopGiay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopGiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopGiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopGiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopGiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopGiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopGiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopGiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopGiay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopGiay] SET  MULTI_USER 
GO
ALTER DATABASE [ShopGiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopGiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopGiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopGiay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopGiay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopGiay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopGiay] SET QUERY_STORE = OFF
GO
USE [ShopGiay]
GO
/****** Object:  Table [dbo].[CT_DONHANG]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DONHANG](
	[MaDonHang] [int] NOT NULL,
	[MaGiay] [int] NOT NULL,
	[GiaLucBan] [decimal](18, 0) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CT_DONHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DONHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoanKH] [varchar](50) NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[EmailKH] [varchar](30) NULL,
	[DiaChiKH] [nvarchar](100) NULL,
	[DienThoaiKH] [varchar](10) NULL,
	[NgaySinh] [datetime] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIGIAY]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIGIAY](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TrangThai] [bit] NULL,
	[GioiTinh] [bit] NULL,
 CONSTRAINT [PK_LOAIGIAY] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [varchar](50) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[CusID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[Img] [varchar](255) NULL,
	[ImgPath] [varchar](255) NULL,
	[EmpFileName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANQUYEN]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANQUYEN](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaQL] [int] NOT NULL,
	[QL_Admin] [bit] NOT NULL,
	[QL_NhaCungCap] [bit] NOT NULL,
	[QL_SanPham] [bit] NOT NULL,
	[QL_ThuongHieu] [bit] NOT NULL,
	[QL_LoaiGiay] [bit] NOT NULL,
	[QL_DonHang] [bit] NOT NULL,
	[QL_KhachHang] [bit] NOT NULL,
	[QL_YKienKhachHang] [bit] NOT NULL,
 CONSTRAINT [PK_PHANQUYEN] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUANLY]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANLY](
	[MaQL] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoanQL] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[EmailQL] [varchar](50) NULL,
	[DienThoaiQL] [varchar](10) NULL,
	[TrangThai] [bit] NULL,
	[Avatar] [nvarchar](255) NULL,
 CONSTRAINT [PK_QUANLY] PRIMARY KEY CLUSTERED 
(
	[MaQL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaGiay] [int] IDENTITY(1,1) NOT NULL,
	[TenGiay] [nvarchar](50) NOT NULL,
	[Size] [tinyint] NOT NULL,
	[AnhBia] [varchar](50) NULL,
	[GiaBan] [decimal](18, 0) NOT NULL,
	[MaThuongHieu] [int] NULL,
	[TrangThai] [bit] NULL,
	[MaNCC] [int] NULL,
	[MaLoai] [int] NULL,
	[ThoiGianBaoHanh] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NOT NULL,
	[YeuThich] [bit] NOT NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUONGHIEU]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUONGHIEU](
	[MaThuongHieu] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_THUONGHIEU] PRIMARY KEY CLUSTERED 
(
	[MaThuongHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YKIENKHACHHANG]    Script Date: 11/1/2024 4:44:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YKIENKHACHHANG](
	[MAYKIEN] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[HoTen] [varchar](50) NOT NULL,
	[NgayGui] [datetime] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BAIDANHGIA] PRIMARY KEY CLUSTERED 
(
	[MAYKIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (1, 38, CAST(2300000 AS Decimal(18, 0)), 1, CAST(2300000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (2, 27, CAST(2900000 AS Decimal(18, 0)), 1, CAST(2900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (3, 38, CAST(2300000 AS Decimal(18, 0)), 3, CAST(6900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (4, 23, CAST(2500000 AS Decimal(18, 0)), 2, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (5, 27, CAST(2900000 AS Decimal(18, 0)), 3, CAST(8700000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (6, 29, CAST(1900000 AS Decimal(18, 0)), 1, CAST(1900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (7, 31, CAST(1900000 AS Decimal(18, 0)), 4, CAST(7600000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (8, 37, CAST(1900000 AS Decimal(18, 0)), 2, CAST(3800000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (9, 38, CAST(2300000 AS Decimal(18, 0)), 3, CAST(6900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (10, 39, CAST(2400000 AS Decimal(18, 0)), 5, CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (11, 38, CAST(2300000 AS Decimal(18, 0)), 3, CAST(6900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (12, 41, CAST(3500000 AS Decimal(18, 0)), 3, CAST(10500000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (13, 42, CAST(2500000 AS Decimal(18, 0)), 4, CAST(10000000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (14, 43, CAST(2300000 AS Decimal(18, 0)), 3, CAST(6900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (15, 44, CAST(2150000 AS Decimal(18, 0)), 2, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (16, 49, CAST(1900000 AS Decimal(18, 0)), 4, CAST(7600000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (17, 52, CAST(1900000 AS Decimal(18, 0)), 4, CAST(7600000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (18, 53, CAST(1900000 AS Decimal(18, 0)), 1, CAST(1900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (19, 52, CAST(1900000 AS Decimal(18, 0)), 5, CAST(9500000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (20, 38, CAST(2300000 AS Decimal(18, 0)), 3, CAST(6900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DONHANG] ([MaDonHang], [MaGiay], [GiaLucBan], [SoLuong], [ThanhTien]) VALUES (21, 38, CAST(2300000 AS Decimal(18, 0)), 3, CAST(6900000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[DONHANG] ON 

INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (1, 1, CAST(N'2022-07-03T16:11:17.953' AS DateTime), CAST(N'2022-07-04T00:00:00.000' AS DateTime), CAST(2300000 AS Decimal(18, 0)), 2)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (2, 0, CAST(N'2022-07-03T17:12:23.973' AS DateTime), CAST(N'2022-07-19T00:00:00.000' AS DateTime), CAST(2900000 AS Decimal(18, 0)), 3)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (3, 0, CAST(N'2022-07-03T18:02:26.553' AS DateTime), CAST(N'2022-07-10T00:00:00.000' AS DateTime), CAST(6900000 AS Decimal(18, 0)), 2)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (4, 1, CAST(N'2022-06-02T18:02:26.553' AS DateTime), CAST(N'2022-06-10T00:00:00.000' AS DateTime), CAST(5000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (5, 1, CAST(N'2022-06-07T18:02:26.553' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(8700000 AS Decimal(18, 0)), 2)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (6, 1, CAST(N'2022-05-06T18:02:26.553' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(1900000 AS Decimal(18, 0)), 3)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (7, 1, CAST(N'2022-04-04T18:02:26.553' AS DateTime), CAST(N'2022-04-10T00:00:00.000' AS DateTime), CAST(7600000 AS Decimal(18, 0)), 3)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (8, 1, CAST(N'2022-04-01T18:02:26.553' AS DateTime), CAST(N'2022-04-04T00:00:00.000' AS DateTime), CAST(3800000 AS Decimal(18, 0)), 2)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (9, 0, CAST(N'2022-03-03T18:02:26.553' AS DateTime), CAST(N'2022-03-10T00:00:00.000' AS DateTime), CAST(6900000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (10, 1, CAST(N'2024-01-01T18:02:26.553' AS DateTime), CAST(N'2024-01-03T00:00:00.000' AS DateTime), CAST(12000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (11, 0, CAST(N'2024-01-02T18:02:26.553' AS DateTime), CAST(N'2024-01-04T00:00:00.000' AS DateTime), CAST(6900000 AS Decimal(18, 0)), 3)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (12, 1, CAST(N'2024-01-03T18:02:26.553' AS DateTime), CAST(N'2024-01-05T00:00:00.000' AS DateTime), CAST(10500000 AS Decimal(18, 0)), 2)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (13, 1, CAST(N'2024-01-04T18:02:26.553' AS DateTime), CAST(N'2024-01-06T00:00:00.000' AS DateTime), CAST(10000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (14, 1, CAST(N'2024-01-05T18:02:26.553' AS DateTime), CAST(N'2024-01-07T00:00:00.000' AS DateTime), CAST(6900000 AS Decimal(18, 0)), 3)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (15, 1, CAST(N'2024-02-01T18:02:26.553' AS DateTime), CAST(N'2024-02-08T00:00:00.000' AS DateTime), CAST(4300000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (16, 1, CAST(N'2024-02-02T18:02:26.553' AS DateTime), CAST(N'2024-02-09T00:00:00.000' AS DateTime), CAST(7600000 AS Decimal(18, 0)), 3)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (17, 1, CAST(N'2024-03-03T18:02:26.553' AS DateTime), CAST(N'2024-03-10T00:00:00.000' AS DateTime), CAST(7600000 AS Decimal(18, 0)), 2)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (18, 1, CAST(N'2024-04-03T18:02:26.553' AS DateTime), CAST(N'2024-04-11T00:00:00.000' AS DateTime), CAST(1900000 AS Decimal(18, 0)), 2)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (19, 1, CAST(N'2024-06-03T18:02:26.553' AS DateTime), CAST(N'2024-06-12T00:00:00.000' AS DateTime), CAST(9500000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (20, 1, CAST(N'2024-07-03T18:02:26.553' AS DateTime), CAST(N'2024-07-13T00:00:00.000' AS DateTime), CAST(6900000 AS Decimal(18, 0)), 3)
INSERT [dbo].[DONHANG] ([MaDonHang], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [TongTien], [MaKH]) VALUES (21, 1, CAST(N'2024-10-31T18:02:26.553' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), CAST(6900000 AS Decimal(18, 0)), 2)
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [TaiKhoanKH], [MatKhau], [HoTen], [EmailKH], [DiaChiKH], [DienThoaiKH], [NgaySinh], [TrangThai]) VALUES (1, N'nguyenne', N'e10adc3949ba59abbe56e057f20f883e', N'caonguyen', N'caonguyen@gmail.com', N'23k7', N'09876787', CAST(N'2022-06-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [TaiKhoanKH], [MatKhau], [HoTen], [EmailKH], [DiaChiKH], [DienThoaiKH], [NgaySinh], [TrangThai]) VALUES (2, N'huynhhao', N'e10adc3949ba59abbe56e057f20f883e', N'Huynh Gia Hao', N'huynhgiahao1902@gmail.com', N'395 Hang Da', N'0975784214', CAST(N'2001-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [TaiKhoanKH], [MatKhau], [HoTen], [EmailKH], [DiaChiKH], [DienThoaiKH], [NgaySinh], [TrangThai]) VALUES (3, N'thanhngu', N'4297f44b13955235245b2497399d7a93', N'Pham Ho Thanh', N'phamhothanh@gmail.com', N'395 Dong Da', N'0975784214', CAST(N'2001-01-05T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAIGIAY] ON 

INSERT [dbo].[LOAIGIAY] ([MaLoai], [TenLoai], [TrangThai], [GioiTinh]) VALUES (1, N'The thao Nam', 1, 1)
INSERT [dbo].[LOAIGIAY] ([MaLoai], [TenLoai], [TrangThai], [GioiTinh]) VALUES (2, N'The thao nu', 1, 0)
SET IDENTITY_INSERT [dbo].[LOAIGIAY] OFF
GO
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [TrangThai]) VALUES (1, N'Thảo Nguyên', N'Bình Dương', N'0123456789', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [TrangThai]) VALUES (2, N'Minh Khánh', N'Tp Hồ Chí Minh', N'0909258485', 1)
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
GO
SET IDENTITY_INSERT [dbo].[PHANQUYEN] ON 

INSERT [dbo].[PHANQUYEN] ([MaPQ], [MaQL], [QL_Admin], [QL_NhaCungCap], [QL_SanPham], [QL_ThuongHieu], [QL_LoaiGiay], [QL_DonHang], [QL_KhachHang], [QL_YKienKhachHang]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PHANQUYEN] OFF
GO
SET IDENTITY_INSERT [dbo].[QUANLY] ON 

INSERT [dbo].[QUANLY] ([MaQL], [TaiKhoanQL], [MatKhau], [HoTen], [EmailQL], [DienThoaiQL], [TrangThai], [Avatar]) VALUES (1, N'admin', N'123456', N'admin', N'admin@gmail.com', N'0972900999', 1, N'/images/Upload/admin.jpg')
SET IDENTITY_INSERT [dbo].[QUANLY] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (23, N'Adidas RS', 39, N'adiasx.jpg', CAST(2500000 AS Decimal(18, 0)), 3, 1, 1, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 23, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (27, N'Adidas Forum', 36, N'adidasforum.jpg', CAST(2900000 AS Decimal(18, 0)), 3, 1, 1, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 17, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (29, N'Converse 1970s Blach-Red', 41, N'converse1970sdoden.jpg', CAST(1900000 AS Decimal(18, 0)), 4, 1, 2, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 12, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (31, N'Converse 1970s Yellow', 41, N'converse1970svang.jpg', CAST(1900000 AS Decimal(18, 0)), 4, 1, 2, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 11, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (37, N'Converse 1970s Green', 43, N'converse1970sxanh.jpg', CAST(1900000 AS Decimal(18, 0)), 4, 1, 2, 2, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 16, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (38, N'Nike AirMax2090', 39, N'nike2090.jpg', CAST(2300000 AS Decimal(18, 0)), 1, 1, 1, 2, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 19, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (39, N'Nike AirMax90', 38, N'nike90.jpg', CAST(2400000 AS Decimal(18, 0)), 1, 1, 1, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 30, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (41, N'Nike AiMax270', 34, N'nike270.jpg', CAST(2600000 AS Decimal(18, 0)), 1, 1, 1, 2, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 25, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (42, N'Nike SC', 44, N'nikesc.jpg', CAST(2500000 AS Decimal(18, 0)), 1, 1, 1, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 24, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (43, N'Puma RS', 40, N'pumars.jpg', CAST(2300000 AS Decimal(18, 0)), 5, 1, 1, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 6, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (44, N'Puma Astro', 39, N'pumaastro.jpg', CAST(2150000 AS Decimal(18, 0)), 5, 1, 2, 2, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 7, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (49, N'Reebok Black', 36, N'reebokden.jpg', CAST(1900000 AS Decimal(18, 0)), 8, 1, 1, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 17, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (52, N'Vans HC', 38, N'vanshc.jpg', CAST(1900000 AS Decimal(18, 0)), 2, 1, 1, 1, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 9, 0)
INSERT [dbo].[SANPHAM] ([MaGiay], [TenGiay], [Size], [AnhBia], [GiaBan], [MaThuongHieu], [TrangThai], [MaNCC], [MaLoai], [ThoiGianBaoHanh], [NgayCapNhat], [SoLuongTon], [YeuThich]) VALUES (53, N'Vans Old School', 39, N'vansoldschool.jpg', CAST(1900000 AS Decimal(18, 0)), 2, 1, 1, 2, 12, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 18, 0)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[THUONGHIEU] ON 

INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (1, N'Nike')
INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (2, N'Vans')
INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (3, N'Adidas')
INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (4, N'Converse')
INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (5, N'Puma')
INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (6, N'Balenciaga')
INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (7, N'MLB')
INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (8, N'Reebok')
INSERT [dbo].[THUONGHIEU] ([MaThuongHieu], [TenThuongHieu]) VALUES (9, N'Puma')
SET IDENTITY_INSERT [dbo].[THUONGHIEU] OFF
GO
SET IDENTITY_INSERT [dbo].[YKIENKHACHHANG] ON 

INSERT [dbo].[YKIENKHACHHANG] ([MAYKIEN], [Email], [HoTen], [NgayGui], [NoiDung]) VALUES (3, N'nguyen@gmail.com', N'nguyen', CAST(N'2022-12-02T00:00:00.000' AS DateTime), N'fdsfsdfgdsgfsdgdfgsfd')
SET IDENTITY_INSERT [dbo].[YKIENKHACHHANG] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__7ED9643FF0F6FC75]    Script Date: 11/1/2024 4:44:24 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [UQ__KHACHHAN__7ED9643FF0F6FC75] UNIQUE NONCLUSTERED 
(
	[EmailKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__9A123AA24F4CEAA8]    Script Date: 11/1/2024 4:44:24 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [UQ__KHACHHAN__9A123AA24F4CEAA8] UNIQUE NONCLUSTERED 
(
	[TaiKhoanKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__QUANLY__7ED955FC28028B93]    Script Date: 11/1/2024 4:44:24 PM ******/
ALTER TABLE [dbo].[QUANLY] ADD  CONSTRAINT [UQ__QUANLY__7ED955FC28028B93] UNIQUE NONCLUSTERED 
(
	[EmailQL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__QUANLY__9A120A661952C614]    Script Date: 11/1/2024 4:44:24 PM ******/
ALTER TABLE [dbo].[QUANLY] ADD  CONSTRAINT [UQ__QUANLY__9A120A661952C614] UNIQUE NONCLUSTERED 
(
	[TaiKhoanQL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [DF__KHACHHANG__Trang__32E0915F]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[LOAIGIAY] ADD  CONSTRAINT [DF__LOAIGIAY__TrangT__29572725]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[NHACUNGCAP] ADD  CONSTRAINT [DF__NHACUNGCA__Trang__2C3393D0]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[QUANLY] ADD  CONSTRAINT [DF__QUANLY__TrangTha__267ABA7A]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF__SANPHAM__TrangTh__36B12243]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  DEFAULT ((0)) FOR [YeuThich]
GO
ALTER TABLE [dbo].[CT_DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CT_DONHANG] CHECK CONSTRAINT [FK_DONHANG]
GO
ALTER TABLE [dbo].[CT_DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_2] FOREIGN KEY([MaGiay])
REFERENCES [dbo].[SANPHAM] ([MaGiay])
GO
ALTER TABLE [dbo].[CT_DONHANG] CHECK CONSTRAINT [FK_SANPHAM_2]
GO
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_KHACHHANG_2] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [FK_KHACHHANG_2]
GO
ALTER TABLE [dbo].[PHANQUYEN]  WITH CHECK ADD  CONSTRAINT [FK_PHANQUYEN_QUANLY] FOREIGN KEY([MaQL])
REFERENCES [dbo].[QUANLY] ([MaQL])
GO
ALTER TABLE [dbo].[PHANQUYEN] CHECK CONSTRAINT [FK_PHANQUYEN_QUANLY]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_LOAIGIAY] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAIGIAY] ([MaLoai])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_LOAIGIAY]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_NHACUNGCAP] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_NHACUNGCAP]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FL_THUONGHIEU] FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[THUONGHIEU] ([MaThuongHieu])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FL_THUONGHIEU]
GO
ALTER TABLE [dbo].[CT_DONHANG]  WITH CHECK ADD CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[CT_DONHANG]  WITH CHECK ADD CHECK  (([ThanhTien]>=(0)))
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD CHECK  (([GiaBan]>(0)))
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD CHECK  (([ThoiGianBaoHanh]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [ShopGiay] SET  READ_WRITE 
GO
