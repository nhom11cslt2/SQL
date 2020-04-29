
create database QLVPP;

CREATE TABLE [dbo].[tblCaLam] (
    [MaC]  NVARCHAR (50) NOT NULL,
    [TenC] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblCaLam] PRIMARY KEY CLUSTERED ([MaC] ASC)
);
CREATE TABLE [dbo].[tblChatLieu] (
    [MaCL]  NVARCHAR (50) NOT NULL,
    [TenCL] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblChatLieu] PRIMARY KEY CLUSTERED ([MaCL] ASC)
);
CREATE TABLE [dbo].[tblChiTietHoaDonBan] (
    [SoHDB]     NVARCHAR (50) NOT NULL,
    [MaVPP]     NVARCHAR (50) NOT NULL,
    [SoLuong]   FLOAT (53)    NULL,
    [DonGia]    FLOAT (53)    NULL,
    [GiamGia]   FLOAT (53)    NULL,
    [ThanhTien] FLOAT (53)    NULL,
    CONSTRAINT [PK_tblChiTietHoaDonBan] PRIMARY KEY CLUSTERED ([SoHDB] ASC, [MaVPP] ASC),
    CONSTRAINT [FK_tblChiTietHoaDonBan_tblDMVPP] FOREIGN KEY ([MaVPP]) REFERENCES [dbo].[tblDMVPP] ([MaVPP]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblChiTietHoaDonBan_tblHoaDonBan] FOREIGN KEY ([SoHDB]) REFERENCES [dbo].[tblHoaDonBan] ([SoHDB]) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE [dbo].[tblChiTietHoaDonNhap] (
    [SoHDN]     NVARCHAR (50) NOT NULL,
    [MaVPP]     NVARCHAR (50) NOT NULL,
    [SoLuong]   FLOAT (53)    NULL,
    [DonGia]    FLOAT (53)    NULL,
    [GiamGia]   FLOAT (53)    NULL,
    [ThanhTien] FLOAT (53)    NULL,
    CONSTRAINT [PK_tblChiTietHoaDonNhap] PRIMARY KEY CLUSTERED ([SoHDN] ASC, [MaVPP] ASC),
    CONSTRAINT [FK_tblChiTietHoaDonNhap_tblDMVPP] FOREIGN KEY ([MaVPP]) REFERENCES [dbo].[tblDMVPP] ([MaVPP]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblChiTietHoaDonNhap_tblHoaDonNhap] FOREIGN KEY ([SoHDN]) REFERENCES [dbo].[tblHoaDonNhap] ([SoHDN]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[tblCongDung] (
    [MaCD]  NVARCHAR (50) NOT NULL,
    [TenCD] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblCongDung] PRIMARY KEY CLUSTERED ([MaCD] ASC)
);
CREATE TABLE [dbo].[tblCongViec] (
    [MaCV]  NVARCHAR (50) NOT NULL,
    [TenCV] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblCongViec] PRIMARY KEY CLUSTERED ([MaCV] ASC)
);
CREATE TABLE [dbo].[tblDMVPP] (
    [MaVPP]    NVARCHAR (50) NOT NULL,
    [TenVPP]   NVARCHAR (50) NULL,
    [MaL]      NVARCHAR (50) NULL,
    [MaDV]     NVARCHAR (50) NULL,
    [MaCL]     NVARCHAR (50) NULL,
    [MaMau]    NVARCHAR (50) NULL,
    [MaCD]     NVARCHAR (50) NULL,
    [MaNuocSX] NVARCHAR (50) NULL,
    [SoLuong]  FLOAT (53)    NULL,
    [Anh]      NVARCHAR (50) NOT NULL,
    [DonGN]    FLOAT (53)    NULL,
    [DonGB]    FLOAT (53)    NULL,
    CONSTRAINT [PK_tblDMVPP] PRIMARY KEY CLUSTERED ([MaVPP] ASC),
    CONSTRAINT [FK_tblDMVPP_tblDonViTinh] FOREIGN KEY ([MaDV]) REFERENCES [dbo].[tblDonViTinh] ([MaDV]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblDMVPP_tblChatLieu] FOREIGN KEY ([MaCL]) REFERENCES [dbo].[tblChatLieu] ([MaCL]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblDMVPP_tblCongDung] FOREIGN KEY ([MaCD]) REFERENCES [dbo].[tblCongDung] ([MaCD]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblDMVPP_tblMau] FOREIGN KEY ([MaMau]) REFERENCES [dbo].[tblMau] ([MaMau]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblDMVPP_tblTheLoai] FOREIGN KEY ([MaL]) REFERENCES [dbo].[tblTheLoai] ([MaL]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblDMVPP_tblNuocSX] FOREIGN KEY ([MaNuocSX]) REFERENCES [dbo].[tblNuocSX] ([MaNuocSX]) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE [dbo].[tblDonViTinh] (
    [MaDV]  NVARCHAR (50) NOT NULL,
    [TenDV] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblDonViTinh] PRIMARY KEY CLUSTERED ([MaDV] ASC)
);

CREATE TABLE [dbo].[tblHoaDonBan] (
    [SoHDB]    NVARCHAR (50) NOT NULL,
    [NgayBan]  NVARCHAR (50) NULL,
    [MaKH]     NVARCHAR (50) NULL,
    [MaNV]     NVARCHAR (50) NULL,
    [TongTien] FLOAT (53)    NULL,
    CONSTRAINT [PK_tblHoaDonBan] PRIMARY KEY CLUSTERED ([SoHDB] ASC),
    CONSTRAINT [FK_tblHoaDonBan_tblKhachHang] FOREIGN KEY ([MaKH]) REFERENCES [dbo].[tblKhachHang] ([MaKH]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblHoaDonBan_tblNhanVien] FOREIGN KEY ([MaNV]) REFERENCES [dbo].[tblNhanVien] ([MaNV]) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE [dbo].[tblHoaDonNhap] (
    [SoHDN]    NVARCHAR (50) NOT NULL,
    [MaNV]     NVARCHAR (50) NULL,
    [NgayNhap] DATETIME      NULL,
    [MaNCC]    NVARCHAR (50) NULL,
    [TongTien] FLOAT (53)    NULL,
    CONSTRAINT [PK_tblHoaDonNhap] PRIMARY KEY CLUSTERED ([SoHDN] ASC),
    CONSTRAINT [FK_tblHoaDonNhap_tblNhaCungCap] FOREIGN KEY ([MaNCC]) REFERENCES [dbo].[tblNhaCungCap] ([MaNCC]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblHoaDonNhap_tblNhanVien] FOREIGN KEY ([MaNV]) REFERENCES [dbo].[tblNhanVien] ([MaNV]) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE [dbo].[tblKhachHang] (
    [MaKH]      NVARCHAR (50) NOT NULL,
    [TenKH]     NVARCHAR (50) NULL,
    [DiaChi]    NVARCHAR (50) NULL,
    [DienThoai] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblKhachHang] PRIMARY KEY CLUSTERED ([MaKH] ASC)
);
CREATE TABLE [dbo].[tblMau] (
    [MaMau]  NVARCHAR (50) NOT NULL,
    [TenMau] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblMau] PRIMARY KEY CLUSTERED ([MaMau] ASC)
);
CREATE TABLE [dbo].[tblNhaCungCap] (
    [MaNCC]     NVARCHAR (50) NOT NULL,
    [TenNCC]    NVARCHAR (50) NULL,
    [DiaChi]    NVARCHAR (50) NULL,
    [DienThoai] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblNhaCungCap] PRIMARY KEY CLUSTERED ([MaNCC] ASC)
);
CREATE TABLE [dbo].[tblNhanVien] (
    [MaNV]      NVARCHAR (50) NOT NULL,
    [TenNV]     NVARCHAR (50) NULL,
    [GioiTinh]  NVARCHAR (50) NULL,
    [NgaySinh]  DATETIME      NULL,
    [DienThoai] NVARCHAR (50) NULL,
    [DiaChi]    NVARCHAR (50) NULL,
    [MaC]       NVARCHAR (50) NULL,
    [MaCV]      NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblNhanVien] PRIMARY KEY CLUSTERED ([MaNV] ASC),
    CONSTRAINT [FK_tblNhanVien_tblCongViec] FOREIGN KEY ([MaCV]) REFERENCES [dbo].[tblCongViec] ([MaCV]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tblNhanVien_tblCaLam] FOREIGN KEY ([MaC]) REFERENCES [dbo].[tblCaLam] ([MaC]) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE [dbo].[tblNuocSX] (
    [MaNuocSX]  NVARCHAR (50) NOT NULL,
    [TenNuocSX] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblNuocSX] PRIMARY KEY CLUSTERED ([MaNuocSX] ASC)
);
CREATE TABLE [dbo].[tblTheLoai] (
    [MaL]     NVARCHAR (50) NOT NULL,
    [TenLoai] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblTheLoai] PRIMARY KEY CLUSTERED ([MaL] ASC)
);


















