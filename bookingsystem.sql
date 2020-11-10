-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 18, 2019 at 02:35 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Quyen` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'User',
  `HoTen` text COLLATE utf8_unicode_ci,
  `SoDienThoai` text COLLATE utf8_unicode_ci,
  `DiaChi` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Email`, `MatKhau`, `Quyen`, `HoTen`, `SoDienThoai`, `DiaChi`) VALUES
('minhvuon@gmail.com', '123', 'User', 'Nguyễn Minh Vươn', '0961529563', 'Tam Quan Bắc'),
('vuon@gmail.com', '123', 'Admin', 'Vuon Minh Nguyen', '0961529563', 'Tam Quan Town, Binh Dinh province');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `IDBooking` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IDLichXe` int(11) NOT NULL,
  `IDVe` int(11) NOT NULL,
  `NgayDatVe` date DEFAULT NULL,
  `TinhTrangThanhToan` bit(1) DEFAULT b'0',
  `TongTien` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDBooking`),
  KEY `TaiKhoan` (`Email`),
  KEY `IDLichXe` (`IDLichXe`),
  KEY `IDVe` (`IDVe`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`IDBooking`, `Email`, `IDLichXe`, `IDVe`, `NgayDatVe`, `TinhTrangThanhToan`, `TongTien`) VALUES
(1, 'vuon@gmail.com', 4, 1, '2019-12-12', b'0', 160),
(11, 'minhvuon@gmail.com', 3, 1, '2019-02-02', b'0', 60);

-- --------------------------------------------------------

--
-- Table structure for table `lichtrinh`
--

DROP TABLE IF EXISTS `lichtrinh`;
CREATE TABLE IF NOT EXISTS `lichtrinh` (
  `IDLichTrinh` int(11) NOT NULL AUTO_INCREMENT,
  `DiemXuatPhat` text COLLATE utf8_unicode_ci,
  `DiemDen` text COLLATE utf8_unicode_ci,
  `ThoiGianChay` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDLichTrinh`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lichtrinh`
--

INSERT INTO `lichtrinh` (`IDLichTrinh`, `DiemXuatPhat`, `DiemDen`, `ThoiGianChay`) VALUES
(2, 'Quy Nhơn', 'Đà Nẵng', 6),
(3, 'Tam Quan', 'Quy Nhơn', 2),
(4, 'Đà Nẵng', 'Quy Nhơn', 6),
(5, 'Quy Nhơn', 'Gia Lai', 5),
(6, 'Gia Lai', 'Quy Nhơn', 5);

-- --------------------------------------------------------

--
-- Table structure for table `lichxe`
--

DROP TABLE IF EXISTS `lichxe`;
CREATE TABLE IF NOT EXISTS `lichxe` (
  `IDLichXe` int(11) NOT NULL AUTO_INCREMENT,
  `IDLichTrinh` int(11) NOT NULL,
  `IDXe` int(11) NOT NULL,
  `GioXuatPhat` time DEFAULT NULL,
  `NgayDi` date DEFAULT NULL,
  `GiaVe` int(11) DEFAULT '0',
  PRIMARY KEY (`IDLichXe`),
  KEY `IDLichTrinh` (`IDLichTrinh`),
  KEY `IDXe` (`IDXe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lichxe`
--

INSERT INTO `lichxe` (`IDLichXe`, `IDLichTrinh`, `IDXe`, `GioXuatPhat`, `NgayDi`, `GiaVe`) VALUES
(3, 3, 3, '08:00:00', '2019-01-30', 50),
(4, 5, 4, '14:00:00', '2019-11-20', 150),
(5, 4, 3, '13:00:00', '2018-11-20', 150),
(6, 6, 2, '10:00:00', '2019-11-20', 150);

--
-- Triggers `lichxe`
--
DROP TRIGGER IF EXISTS `xoaBooking`;
DELIMITER $$
CREATE TRIGGER `xoaBooking` AFTER DELETE ON `lichxe` FOR EACH ROW BEGIN
DELETE FROM booking WHERE booking.IDLichXe=OLD.IDLichXe;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `loaixe`
--

DROP TABLE IF EXISTS `loaixe`;
CREATE TABLE IF NOT EXISTS `loaixe` (
  `IDLoaiXe` int(11) NOT NULL AUTO_INCREMENT,
  `LoaiXe` text COLLATE utf8_unicode_ci,
  `CuocPhi` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDLoaiXe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaixe`
--

INSERT INTO `loaixe` (`IDLoaiXe`, `LoaiXe`, `CuocPhi`) VALUES
(1, 'Gường nằm', 30),
(2, 'Cao cấp', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tinhtrangxe`
--

DROP TABLE IF EXISTS `tinhtrangxe`;
CREATE TABLE IF NOT EXISTS `tinhtrangxe` (
  `IDTinhTrangXe` int(11) NOT NULL AUTO_INCREMENT,
  `IDLichXe` int(11) NOT NULL,
  `SoChoConLai` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTinhTrangXe`),
  KEY `IDLichXe` (`IDLichXe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinhtrangxe`
--

INSERT INTO `tinhtrangxe` (`IDTinhTrangXe`, `IDLichXe`, `SoChoConLai`) VALUES
(3, 3, 18),
(4, 4, 34),
(5, 5, 18),
(6, 6, 35);

-- --------------------------------------------------------

--
-- Table structure for table `ve`
--

DROP TABLE IF EXISTS `ve`;
CREATE TABLE IF NOT EXISTS `ve` (
  `IDVe` int(11) NOT NULL AUTO_INCREMENT,
  `LoaiVe` text COLLATE utf8_unicode_ci,
  `PhuThu` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDVe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ve`
--

INSERT INTO `ve` (`IDVe`, `LoaiVe`, `PhuThu`) VALUES
(1, 'Cao cấp', 10),
(2, 'Loai 1', 5),
(3, 'Loại 2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xe`
--

DROP TABLE IF EXISTS `xe`;
CREATE TABLE IF NOT EXISTS `xe` (
  `IDXe` int(11) NOT NULL AUTO_INCREMENT,
  `IDLoaiXe` int(11) NOT NULL,
  `TenXe` text COLLATE utf8_unicode_ci,
  `SoCho` int(11) DEFAULT NULL,
  `DiaChi` text COLLATE utf8_unicode_ci NOT NULL,
  `SDT` int(11) NOT NULL,
  `ThongTin` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDXe`),
  KEY `IDLoaiXe` (`IDLoaiXe`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `xe`
--

INSERT INTO `xe` (`IDXe`, `IDLoaiXe`, `TenXe`, `SoCho`, `DiaChi`, `SDT`, `ThongTin`) VALUES
(2, 1, 'Hoàng Long', 35, '25 Nguyễn Khắc Tiệp', 1800333364, ''),
(3, 2, 'Sơn Tùng', 18, '25 Nguyễn Lữ', 1900969671, 'wellcome to ST'),
(4, 1, 'Sơn Tùng', 35, '01 Phan Bội Châu', 1900969671, 'Công ty Sơn Tùng được thành lập vào ngày 29 tháng 04 năm 2014 với hoạt động kinh doanh chính là lĩnh vực vận tải hành khách, vận tải hàng hóa đường bộ và kinh doanh dịch vụ. Sau hơn một năm ra đời Sơn Tùng mới định hướng lựa chọn lĩnh vực vận tải hành khách trên tuyến Quy Nhơn – Đà Nẵng.\r\n '),
(7, 1, 'Cuộc Huê', 35, '25 Nguyễn Lữ', 19001009, '');

--
-- Triggers `xe`
--
DROP TRIGGER IF EXISTS `xoaLichXe`;
DELIMITER $$
CREATE TRIGGER `xoaLichXe` AFTER DELETE ON `xe` FOR EACH ROW BEGIN
DELETE FROM lichxe WHERE IDXe=OLD.IDXe;

END
$$
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `account` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`IDLichXe`) REFERENCES `lichxe` (`IDLichXe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`IDVe`) REFERENCES `ve` (`IDVe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lichxe`
--
ALTER TABLE `lichxe`
  ADD CONSTRAINT `lichxe_ibfk_1` FOREIGN KEY (`IDLichTrinh`) REFERENCES `lichtrinh` (`IDLichTrinh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lichxe_ibfk_2` FOREIGN KEY (`IDXe`) REFERENCES `xe` (`IDXe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tinhtrangxe`
--
ALTER TABLE `tinhtrangxe`
  ADD CONSTRAINT `tinhtrangxe_ibfk_1` FOREIGN KEY (`IDLichXe`) REFERENCES `lichxe` (`IDLichXe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `xe`
--
ALTER TABLE `xe`
  ADD CONSTRAINT `xe_ibfk_1` FOREIGN KEY (`IDLoaiXe`) REFERENCES `loaixe` (`IDLoaiXe`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
