-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 04, 2021 lúc 07:28 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `manhgroup`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  `Position` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Position`) VALUES
(7, 'Trang trí', 1),
(8, 'Phòng khách', 2),
(9, 'ghế phụ', 1),
(10, 'Phòng Làm việc', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `groups`
--

CREATE TABLE `groups` (
  `GroupID` int(11) NOT NULL,
  `GroupName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `groups`
--

INSERT INTO `groups` (`GroupID`, `GroupName`) VALUES
(1, 'Admin'),
(2, 'Moder'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturers`
--

CREATE TABLE `manufacturers` (
  `ManufacturerID` int(11) NOT NULL,
  `ManufacturerName` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `manufacturers`
--

INSERT INTO `manufacturers` (`ManufacturerID`, `ManufacturerName`) VALUES
(1, 'Cong ty B'),
(12, 'Viet Nam'),
(13, 'Trung Quoc'),
(14, 'Chau Au'),
(20, 'gi cung co');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orderitems`
--

INSERT INTO `orderitems` (`OrderID`, `ProductID`, `Quantity`) VALUES
(47, 52, 1),
(47, 49, 1),
(47, 51, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddedDate` datetime NOT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Sum` int(11) DEFAULT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `AddedDate`, `Address`, `Phone`, `Sum`, `Status`) VALUES
(47, 1, '2020-12-12 11:47:07', 'qưeqwe', '12132', 0, b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ManufacturerID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `ImageUrl` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL DEFAULT 0,
  `Quantity` int(11) NOT NULL DEFAULT 0,
  `Description` varchar(1000) NOT NULL,
  `Body` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ProductID`, `ManufacturerID`, `CategoryID`, `ProductName`, `ImageUrl`, `Price`, `Quantity`, `Description`, `Body`) VALUES
(55, 13, 9, 'Đèn để bàn gọn nhẹ Petite', '734256487product-5-1.png', 690000, 25, 'Nguồn gốc nguyên vật liệu cũng như chất lượng, độ bền sản phẩm đã được kiểm chứng bởi các nhà nhập khẩu Âu Mỹ', ''),
(61, 12, 8, 'Đèn để bàn gọn nhẹ Petite', '505416084promotion9.png', 1000000, 303, 'day là 1 san pham tot', 'day la san pam rat tot'),
(56, 14, 8, 'Ấm trà inox không ghỉ', '2047297875product-1.png', 890000, 20, 'Dòng sản phẩm xuất khẩu được sản xuất tại Nhà Máy Việt Nam theo tiêu chuẩn Châu Âu. Nguồn gốc nguyên vật liệu cũng như chất lượng, độ bền sản phẩm đã được kiểm chứng bởi các nhà nhập khẩu Âu Mỹ', 'Khung sườn: gỗ dầu (Việt Nam) đã xử lý mối mọt theo tiêu chuẩn xuất khẩu Châu Âu\r\nNệm mút: nhập khẩu từ Malaysia\r\nChỉ may: nhập khẩu từ Anh Quốc'),
(57, 12, 9, 'Bàn xếp gọn nhẹ TB01', '1770765570product-2-1.png', 630000, 45, 'Dòng sản phẩm xuất khẩu được sản xuất tại Nhà Máy Việt Nam theo tiêu chuẩn Châu Âu. Nguồn gốc nguyên vật liệu cũng như chất lượng, độ bền sản phẩm đã được kiểm chứng bởi các nhà nhập khẩu Âu Mỹ', 'Dòng sản phẩm xuất khẩu được sản xuất tại Nhà Máy Việt Nam theo tiêu chuẩn Châu Âu. Nguồn gốc nguyên vật liệu cũng như chất lượng, độ bền sản phẩm đã được kiểm chứng bởi các nhà nhập khẩu Âu Mỹ'),
(59, 14, 9, 'Ghế gỗ bập bênh Iconic', '1214081962promotion6.png', 850000, 30, 'Ghế gỗ bập bênh Iconic', 'Ghế gỗ bập bênh IconicGhế gỗ bập bênh Iconic'),
(60, 14, 9, 'Ghế phòng khách Arctander', '463823069promotion10.png', 999000, 99, 'Ghế phòng khách Arctander', 'Ghế phòng khách ArctanderGhế phòng khách Arctander');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `PassWord` varchar(32) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `GroupID`, `FullName`, `UserName`, `PassWord`, `Email`) VALUES
(1, 1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com'),
(34, 3, 'nguyen manh', 'adminn', '21232f297a57a5a743894a0e4a801fc3', 'khongcan@gmail.com'),
(35, 3, 'nguyen manh', 'themoivip12', '21232f297a57a5a743894a0e4a801fc3', 'themoivip12@gmail.com'),
(38, 3, 'nguyen manh dao', 'thekhongvip12', '21232f297a57a5a743894a0e4a801fc3', 'thekhongvip12@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`GroupID`);

--
-- Chỉ mục cho bảng `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`ManufacturerID`);

--
-- Chỉ mục cho bảng `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `ManufacturerID` (`ManufacturerID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserName` (`UserName`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `GroupID` (`GroupID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `groups`
--
ALTER TABLE `groups`
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `ManufacturerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
