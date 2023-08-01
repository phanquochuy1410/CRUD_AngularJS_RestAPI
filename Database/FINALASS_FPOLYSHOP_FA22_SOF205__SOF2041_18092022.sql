CREATE DATABASE FINALASS_FPOLYSHOP_FA22_SOF205__SOF2041;
GO
USE FINALASS_FPOLYSHOP_FA22_SOF205__SOF2041
GO
-- ChucVu
CREATE TABLE ChucVu(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(50) DEFAULT NULL
)
GO
-- CuaHang
CREATE TABLE CuaHang(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(50) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
ThanhPho NVARCHAR(50) DEFAULT NULL,
QuocGia NVARCHAR(50) DEFAULT NULL
)
GO
-- NhanVien
CREATE TABLE NhanVien(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30) DEFAULT NULL,
TenDem NVARCHAR(30) DEFAULT NULL,
Ho NVARCHAR(30) DEFAULT NULL,
GioiTinh NVARCHAR(10) DEFAULT NULL,
NgaySinh DATE DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
MatKhau VARCHAR(MAX) DEFAULT NULL,
IdCH UNIQUEIDENTIFIER,
IdCV UNIQUEIDENTIFIER,
IdGuiBC UNIQUEIDENTIFIER,
TrangThai INT DEFAULT 0
)
GO
insert into NhanVien(Ten) values ('thang')
delete from NhanVien
-- KhachHang
CREATE TABLE KhachHang(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30),
TenDem NVARCHAR(30) DEFAULT NULL,
Ho NVARCHAR(30) DEFAULT NULL,
NgaySinh DATE DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
ThanhPho NVARCHAR(50) DEFAULT NULL,
QuocGia NVARCHAR(50) DEFAULT NULL,
MatKhau VARCHAR(MAX) DEFAULT NULL
)
GO
insert into HoaDon(Ma) values('GH')
--HoaDon
CREATE TABLE HoaDon(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
IdNV UNIQUEIDENTIFIER,
Ma VARCHAR(20) UNIQUE,
NgayTao DATE DEFAULT NULL,
NgayThanhToan DATE DEFAULT NULL,
NgayShip DATE DEFAULT NULL,
NgayNhan DATE DEFAULT NULL,
TinhTrang INT DEFAULT 0,
TenNguoiNhan NVARCHAR(50) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
)
GO
insert into HoaDon(NgayTao) values('2-7-2022')
select * from HoaDon
delete from HoaDon
insert into GioHang(Ma) values('GH')
delete from GioHang
select * from GioHang

CREATE TABLE GioHang(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
IdNV UNIQUEIDENTIFIER,
Ma VARCHAR(20) UNIQUE,
NgayTao DATE DEFAULT NULL,
NgayThanhToan DATE DEFAULT NULL,
TenNguoiNhan NVARCHAR(50) DEFAULT NULL,
DiaChi NVARCHAR(100) DEFAULT NULL,
Sdt VARCHAR(30) DEFAULT NULL,
TinhTrang INT DEFAULT 0
)
GO
-- SanPham
CREATE TABLE SanPham(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30)
)
GO
-- NSX
CREATE TABLE NSX(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30)
)
GO
-- MauSac
CREATE TABLE MauSac(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30)
)
GO


-- DongSP
CREATE TABLE DongSP(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma VARCHAR(20) UNIQUE,
Ten NVARCHAR(30)
)
GO
-- ChiTietSP
CREATE TABLE ChiTietSP(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdSP UNIQUEIDENTIFIER,
IdNsx UNIQUEIDENTIFIER,
IdMauSac UNIQUEIDENTIFIER,
IdDongSP UNIQUEIDENTIFIER,
NamBH INT DEFAULT NULL,
MoTa NVARCHAR(50) DEFAULT NULL,
SoLuongTon INT,
GiaNhap DECIMAL(20,0) DEFAULT 0,
GiaBan DECIMAL(20,0) DEFAULT 0,
)

GO
-- HoaDonChiTiet
CREATE TABLE HoaDonChiTiet(
IdHoaDon UNIQUEIDENTIFIER,
IdChiTietSP UNIQUEIDENTIFIER,
SoLuong INT,
DonGia DECIMAL(20,0) DEFAULT 0,
CONSTRAINT PK_HoaDonCT PRIMARY KEY (IdHoaDon,IdChiTietSP),
CONSTRAINT FK1 FOREIGN KEY(IdHoaDon) REFERENCES HoaDon(Id),
CONSTRAINT FK2 FOREIGN KEY(IdChiTietSP) REFERENCES ChiTietSP(Id),
)
GO
CREATE TABLE GioHangChiTiet(
IdGioHang UNIQUEIDENTIFIER,
IdChiTietSP UNIQUEIDENTIFIER,
SoLuong INT,
DonGia DECIMAL(20,0) DEFAULT 0,
DonGiaKhiGiam DECIMAL(20,0) DEFAULT 0,
CONSTRAINT PK_GioHangCT PRIMARY KEY (IdGioHang,IdChiTietSP),
CONSTRAINT FK1_IdGioHang FOREIGN KEY(IdGioHang) REFERENCES GioHang(Id),
CONSTRAINT FK2_IdChiTietSP FOREIGN KEY(IdChiTietSP) REFERENCES ChiTietSP(Id),
)
GO
insert into GioHangChiTiet(SoLuong) values(1)
--TẠO QUAN HỆ GIỮA CÁC BẢNG
--NhanVien - CuaHang
ALTER TABLE NhanVien ADD FOREIGN KEY (IdCH) REFERENCES CuaHang(Id)
--NhanVien - ChucVu
ALTER TABLE NhanVien ADD FOREIGN KEY (IdCV) REFERENCES ChucVu(Id)
--NhanVien - GuiBaoCao
ALTER TABLE NhanVien ADD FOREIGN KEY (IdGuiBC) REFERENCES NhanVien(Id)
-- HoaDon - KhachHang
ALTER TABLE HoaDon ADD FOREIGN KEY (IdKH) REFERENCES KhachHang(Id)
-- GioHang - KhachHang
ALTER TABLE GioHang ADD FOREIGN KEY (IdKH) REFERENCES KhachHang(Id)
-- HoaDon - NhanVien
ALTER TABLE HoaDon ADD FOREIGN KEY (IdNV) REFERENCES NhanVien(Id)
-- ChiTietSP - SanPham
ALTER TABLE ChiTietSP ADD FOREIGN KEY(IdSP) REFERENCES SanPham(Id)
-- ChiTietSP - NSX
ALTER TABLE ChiTietSP ADD FOREIGN KEY(IdNsx) REFERENCES Nsx(Id)
-- ChiTietSP - MauSac
ALTER TABLE ChiTietSP ADD FOREIGN KEY(IdMauSac) REFERENCES MauSac(Id)
-- ChiTietSP - DongSP
ALTER TABLE ChiTietSP ADD FOREIGN KEY(IdDongSP) REFERENCES DongSP(Id)


insert into MauSac(Ma,Ten) values ('ms1','trang'),('ms2','den'),('ms3','do');
delete from MauSac
select * from MauSac
update MauSac set Ten='vang' where Ma='ms1'
insert into SanPham(Ma,Ten) values ('sp1','ao'),('sp2','quan'),('sp3','giay');
delete from SanPham
select * from SanPham

insert into NSX(Ma,Ten) values ('nsx1','ngay1'),('nsx2','ngay2'),('nsx3','ngay3');
delete from NSX where id='711BCA83-9EDD-4DD7-A1CC-8EB7D195BB5C'
select * from NSX

insert into DongSP(Ma,Ten) values ('dsp1','A'),('dsp2','B'),('dsp3','C');
delete from DongSP
select * from DongSP


insert into ChiTietSP(IdSP,
IdNsx,
IdMauSac,
IdDongSP,
NamBH,
MoTa,
SoLuongTon,
GiaNhap,
GiaBan) values ('B9F92294-8C7F-449E-B30E-3B82564AF06F','85BE0B79-84B2-4C52-A693-7215E1CB8F23',
'C5A4DB3E-12E9-41CA-82E2-B540756FD7D0','A24844F9-8AED-4F61-B0F1-5DFF8EFED893'
,2,'san pham rat dep',5,1000,2000);

delete from ChiTietSP
select * from ChiTietSP
update  ChiTietSP set IdNsx=null where IdNsx='711BCA83-9EDD-4DD7-A1CC-8EB7D195BB5C'
update ChiTietSP set  IdNsx='A2EE89AA-AEF6-4650-A7E6-E5C8DFDE5ABF' where MoTa='1'
select a.Ma,a.Ten,c.Ma,c.Ten,d.Ma,d.Ten,e.Ma,e.Ten,b.NamBH,b.MoTa,b.SoLuongTon,b.GiaNhap,b.GiaBan from
SanPham a  LEFT JOIN ChiTietSP b on a.Id=b.IdSP
                         LEFT JOIN MauSac c on b.IdMauSac=c.Id
						 LEFT JOIN NSX d on d.Id =	b.IdNsx
						LEFT JOIN  DongSP e on e.Id=IdDongSP 



						select * from DongSP
						select Ma,Ten from NSX


insert into SanPham(Ma,Ten) values (?,?);
declare  @idsp UNIQUEIDENTIFIER
set @idsp = (select Id from SanPham where Ma=?)
insert into ChiTietSP(IdSP,) values (@idsp,?);


declare  @idsp UNIQUEIDENTIFIER
set @idsp = (select Id from SanPham where Ma=?)
delete from ChiTietSP where IdSP=@idsp
delete from SanPham where Ma=?



declare  @idsp UNIQUEIDENTIFIER
set @idsp = (select Id from SanPham where Ma=?)
update SanPham set Ma=?,Ten=? where id=@idsp
update ChiTietSP set IdNsx=?,IdMauSac=?,IdDongSP=?,NamBH=?,MoTa=?,SoLuongTon=?,GiaNhap=?,GiaBan=? where IdSP=@idsp



declare  @idnsx UNIQUEIDENTIFIER
set @idnsx = (select Id from NSX where Ma=?)
update  ChiTietSP set IdNsx=null where IdNsx=@idnsx
delete from NSX  where id=@idnsx


update NSX set Ma=?,Ten=? where Id=?


insert into NSX(Ma,Ten) values(?,?)

select d.Ma,d.Ten,b.SoLuong,c.GiaBan from GioHang a left join GioHangChiTiet b on a.id=b.IdGioHang
                         left join ChiTietSP c on c.id=b.IdChiTietSP
						 left join SanPham d  on d.id=c.IdSP
						 left join MauSac e on e.id=c.IdMauSac where d.Ma='2'



if exists(select d.Ma,d.Ten,b.SoLuong,c.GiaBan from GioHang a left join GioHangChiTiet b on a.id=b.IdGioHang
                         left join ChiTietSP c on c.id=b.IdChiTietSP
						 left join SanPham d  on d.id=c.IdSP
						 left join MauSac e on e.id=c.IdMauSac where d.Ma=?)
begin
declare @sp 
end
else
begin
print 'nhap luong >100'
end
end

						 insert into GioHang(Ma) values ('GH')
						 select * from ChiTietSP
 insert into GioHangChiTiet(IdGioHang,IdChiTietSP,SoLuong) values 
 ('75C55D27-89DF-4178-A4C2-7B7CA2B913C3','79C7F69A-7DBA-4334-A558-AB518B4DC101',1)






if exists(select*from GioHang where Ma='GH')
begin
print 'chua co'
end
else
begin
 insert into GioHang(Ma) values('GH')
 end
 declare @giohang table (ma nvarchar(50) ,soluong nvarchar(50))
insert into @giohang  select d.Ma,b.SoLuong from GioHang a left join GioHangChiTiet b on a.id=b.IdGioHang
                         left join ChiTietSP c on c.id=b.IdChiTietSP
						 left join SanPham d  on d.id=c.IdSP
						 left join MauSac e on e.id=c.IdMauSac;
select*from @giohang
if exists(select*from @giohang where ma=? )
begin
declare @gan1 UNIQUEIDENTIFIER,@gan2 UNIQUEIDENTIFIER
set @gan1=(select Id from SanPham where Ma=?)
set  @gan2=(select Id from ChiTietSP where IdSP=@gan1)
update GioHangChiTiet set SoLuong=SoLuong+1 where IdChiTietSP=@gan2
end
else
begin
declare @gan3 UNIQUEIDENTIFIER,@gan4 UNIQUEIDENTIFIER,@gan5 UNIQUEIDENTIFIER
set @gan3=(select Id from SanPham where Ma=?)
set @gan4=(select Id from GioHang where Ma='GH')
set  @gan5=(select Id from ChiTietSP where IdSP=@gan3)
insert into GioHangChiTiet(IdGioHang,IdChiTietSP,SoLuong) values(@gan4,@gan5,1)
end









select * from GioHangChiTiet
select * from ChiTietSP
delete from GioHangChiTiet
delete from GioHang



select a.Ma,a.NgayTao,b.Ten,a.TinhTrang from HoaDon a left join NhanVien b  on a.IdNV=b.id

update HoaDon set TinhTrang=1 where Ma='GH'

select *from SanPham

insert into NhanVien(Ma) values('B')

delete from NhanVien


declare @idnv UNIQUEIDENTIFIER
set @idnv=(select id from NhanVien where Ma=?)
insert into  HoaDon(IdNV,Ma,NgayTao,TinhTrang) values (@idnv,?,?,?)

declare @idhd UNIQUEIDENTIFIER,@idspct UNIQUEIDENTIFIER
set @idhd=(select id from HoaDon where Ma=?)
set @idspct=(select b.Id from SanPham a join ChiTietSP b on a.Id=b.IdSP where a.Ma=?)
insert into HoaDonChiTiet(IdHoaDon,IdChiTietSP,SoLuong) values (@idhd,@idspct,?)


select * from HoaDon
delete from HoaDon

select a.Ma,b.Ma,e.Ma,e.Ten,a.NgayTao,a.TinhTrang,c.SoLuong,d.GiaBan from HoaDon a left join NhanVien b  on a.IdNV=b.id
                                                      left join HoaDonChiTiet c  on a.Id=c.IdHoaDon
                                                       left join ChiTietSP d  on d.Id=c.IdChiTietSP
													    left join SanPham e on e.Id=d.IdSP



insert into HoaDon()


if exists(select * from NhanVien where ma='A')
begin
print 'a'
end
else
begin
insert into NhanVien(Ma) values('A')
end