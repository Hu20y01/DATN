-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2023 at 06:16 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dataonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `iddonhang` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`iddonhang`, `idsp`, `soluong`, `gia`) VALUES
(54, 15, 2, '63990000'),
(54, 16, 2, '78990000'),
(55, 16, 1, '78990000'),
(56, 30, 1, '123456789'),
(57, 30, 1, '123456789'),
(58, 30, 1, '123456789'),
(59, 30, 1, '123456789'),
(60, 30, 1, '123456789'),
(61, 30, 1, '123456789'),
(62, 30, 1, '123456789'),
(63, 16, 1, '78990000'),
(63, 15, 1, '63990000'),
(64, 16, 3, '78990000'),
(64, 15, 3, '63990000'),
(65, 15, 3, '63990000'),
(65, 16, 1, '78990000'),
(66, 15, 3, '63990000'),
(66, 16, 1, '78990000'),
(67, 9, 1, '19090000'),
(68, 16, 1, '78990000'),
(68, 14, 1, '18990000'),
(69, 34, 1, '10000000'),
(69, 13, 1, '21990000'),
(69, 10, 1, '34990000'),
(69, 7, 1, '12000000'),
(70, 35, 1, '100000'),
(71, 16, 1, '78990000'),
(72, 3, 4, '19200000');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `diachi` text NOT NULL,
  `sodienthoai` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `soluong` int(11) NOT NULL,
  `tongtien` varchar(255) NOT NULL,
  `trangthai` int(11) DEFAULT 0 COMMENT '0: Chưa thanh toán, 1: Đã thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`id`, `iduser`, `diachi`, `sodienthoai`, `email`, `soluong`, `tongtien`, `trangthai`) VALUES
(1, 2, 'hanoi', '01236546548', 'abc@jksahdu.com', 5, '564651234', 0),
(2, 3, 'ha nam', '0567494894', 'abc@ghakjhuiaab.com', 4, '1234854548', 0),
(3, 2, 'hung yen', '0554674445', 'abc@fsadasda.com', 2, '354354354', 0),
(4, 2, 'lang son', '0567454353', 'abc@dwqgsfaf.com', 7, '5435735223', 0),
(5, 2, 'thai binh', '05674326253', 'abc@fhfdhjadc.com', 8, '5437854856', 0),
(6, 2, 'hai phong', '0567532424', 'abc@fuiuyrtyoiuyy.com', 3, '543636443', 0),
(7, 2, 'quang ninh', '0566548945', 'abc@mnbmbvgdf.com', 5, '2544326556', 0),
(8, 1, 'ha noi', '0567489451', 'abc@dung.com', 5, '2500000', 0),
(51, 1, 'ha noi', '0123456', 'a@a.a', 3, '20000000', 0),
(57, 15, 'hieu', '123', 'hoang@gmail.com', 2, '50000', 0),
(58, 15, 'hieu', '123', 'hoang@gmail.com', 2, '50000', 0),
(62, 0, 'adfadfaf', '1', 'a', 1, '123456789', 0),
(63, 0, 'thanh xuan ha noi', '012345678', 'dung@gmailm.com', 2, '142980000', 0),
(64, 21, 'hà nội', '0254858526', 'buidung@gmail.com', 6, '428940000', 0),
(65, 14, 'Trieu Khuc', '098363773', 'admin@gmail.com', 4, '270960000', 0),
(66, 14, 'Ha Noi', '098363773', 'admin@gmail.com', 4, '270960000', 0),
(67, 3, 'Ha Noi', '0932758475', 'user1@gmail.com', 1, '19090000', 0),
(68, 22, 'Hà Nội', '0987656565', 'huy@gmail.com', 2, '97980000', 0),
(69, 22, 'Hà Nội', '0987656565', 'huy@gmail.com', 4, '78980000', 0),
(70, 22, 'ok', '0987656565', 'huy@gmail.com', 1, '100000', 0),
(71, 22, 'iki', '0987656565', 'huy@gmail.com', 1, '78990000', 0),
(72, 14, 'mua them', '098363773', 'admin@gmail.com', 4, '76800000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tensanpham` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `hinhanh`) VALUES
(2, 'MacBook', 'https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP741/SP741-finish_top_rosegold_large.jpg'),
(3, 'Laptop', 'https://cdn.tgdd.vn/Files/2021/09/04/1380197/logo-24h-cong-nghe8_1280x720-800-resize.png'),
(14, 'danh mục mới', '');

-- --------------------------------------------------------

--
-- Table structure for table `sanphammoi`
--

CREATE TABLE `sanphammoi` (
  `id` int(11) NOT NULL,
  `danhmuc` int(11) DEFAULT NULL,
  `tensp` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `giasp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` text COLLATE utf8_unicode_ci NOT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `loai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanphammoi`
--

INSERT INTO `sanphammoi` (`id`, `danhmuc`, `tensp`, `giasp`, `hinhanh`, `mota`, `loai`) VALUES
(1, 2, 'MacBook Air 2018 i5 8GB 128GB ', '16900000', 'macbookair2018_13inch_silver_01.jpeg', 'Bộ xử lý CPU: 1.6 GHz Intel Core i5 (Broadwell)\r\nBộ nhớ RAM: 8GB of 2133 MHz LPDDR3 SDRAM\r\nLưu trữ SSD: 128GB\r\nVGA: Intel HD Graphics 617\r\nMàn hình: 13.3\" \r\nĐộ phân giải: 2560 x 1600\r\nKhối lượng: 1.25kg\r\nKích thước: 1.5 x 30 x 21.2 cm', 1),
(2, 2, 'MacBook Air 13\" 2020 M1 256GB ', '24499000', 'macbook_air_m1.png', 'Màn hình	13.3 inch, 2560 x 1600 Pixels, IPS, IPS LCD LED Backlit, True Tone\r\nCPU	Apple, M1\r\nRAM	8 GB, LPDDR4\r\nỔ cứng	SSD 256 GB\r\nĐồ họa	Apple M1 GPU 7 nhân\r\nTrọng lượng	1.29 kg\r\nKích thước	304.1 x 212.4 x 4.1 ~ 16.1 mm', 1),
(3, 2, 'MacBook Air 2018 Core i5 (Like New)', '19200000', 'macbookair-2018-silver.jpg', 'CPU: Core i5 (1.6Ghz Turbo Boost up to 3.6Ghz)\r\nRAM: 16GB of 2133 MHz LPDDR3 SDRAM\r\nLưu trữ SSD: 256GB\r\nVGA: Intel UHD Graphics 617\r\nMàn hình: 13.3\" \r\nĐộ phân giải: 2560 x 1600\r\nKhối lượng: 1.25kg\r\nKích thước: 1.5 x 30 x 21.2 cm', 1),
(4, 2, 'MacBook Pro 2020 99% i5 8GB 256GB ', '23800000', 'macbook-pro-13-inch-2020-maconline.jpg', '1.4GHz quad-core 8th-generation Intel Core i5 processor\r\nTurbo Boost up to 3.9GHz\r\nIntel Iris Plus Graphics 645\r\n8GB 2133MHz LPDDR3 memory\r\n256GB SSD storage¹\r\n13-inch Retina display with True Tone\r\nMagic Keyboard\r\nTouch Bar and Touch ID\r\nTwo Thunderbolt 3 ports\r\nMàu Sắc: Silve, Grey', 1),
(5, 2, 'MacBook Pro 2018 99% i5 8GB 256GB', '21500000 ', 'macbook-pro-2018.jpg', 'CPU: Intel Core i5 2.3Ghz Coffee Lake\r\nGraphics: Intel Iris Graphics 655\r\nRAM: RAM 8GB 2133MHz DDR4\r\nỔ cứng SSD: SSD PCle 256GB\r\nMàn hình: 13\" inch RETINA\r\nĐộ Phân Giải : 2560x1600px\r\nCổng Mạng : 802.11ac Wi-Fi, Bluetooth 5.0\r\nKhe Cắm : 4 cổng Thunderbolt 3 ports\r\nThiết bị nghe nhìn : FaceTime HD Camera, Dual Mics\r\nKhối lượng: 1.37kg', 1),
(6, 2, 'Macbook Pro 2019 13-inch i5 1.4Ghz ', '20000000', 'macbook-pro-13inch-2019.jpg', 'Bộ xử lý CPU: 1.4 GHz Intel Core i5\r\nBộ nhớ RAM: 8GB of 2133 MHz LPDDR3 SDRAM\r\nLưu trữ SSD: 128GB\r\nVGA: Intel Iris Plus Graphics 645\r\nMàn hình: 13.3\" Retina True Tone\r\nĐộ phân giải: 2560 x 1600 \r\nKhối lượng: 1.37kg\r\nKích thước: 30.41 x 21.24 cm\r\nCổng mạng: 802.11ac Wi-Fi, Bluetooth 5.0', 1),
(7, 2, 'MacBook Pro 2013 13 inch i5 4GB 256GB', '12000000', 'macbook-pro-2013.jpg', '- CPU: 2.4 GHz dual-core Intel Core i5 (Turbo Boost 2.9 GHz)\r\n- Graphics: Intel HD Graphics 5100\r\n- RAM: 8GB 1600MHz\r\n- Ổ cứng SSD: 256 GB\r\n- Màn hình: 13.3 inch RETINA\r\n- Độ Phân Giải : 2560 x 1600\r\n- Cổng Mạng : 802.11ac Wi-Fi, Bluetooth 4.0\r\n- Khe Cắm : Thunderbolt 2, USB 3.0, HDMI\r\n- Thiết bị nghe nhìn : FaceTime HD Camera, Dual Mics\r\n- Hệ điều hành : Mac OS X Mavericks', 1),
(8, 2, 'MacBook Pro 2015 Cũ 13-inch i5 8GB 128GB', '13500000', 'macbook-pro-2015.jpg', 'CPU: 2.7GHz Dual-core Intel Core i5 Broadwell (Turbo Boost up to 3.1GHz)\r\nRAM: 8GB 1866MHz LPDDR3 SDRAM\r\nỔ cứng SSD: 128 GB\r\nMàn hình: 13,3 inch RETINA\r\nĐộ Phân Giải : 2560 x 1600\r\nCổng Mạng : 802.11ac Wi-Fi, Bluetooth 4.0\r\nKhe cắm: Thunderbolt 2, USB 3.0, HDMI\r\nThiết bị nghe nhìn : FaceTime HD Camera, Dual Mics\r\nPin: 10 giờ, nặng 1.58 kg', 1),
(9, 3, 'Laptop Acer Nitro 5 Gaming AN515 ', '19090000', 'https://cdn.tgdd.vn/Products/Images/44/263980/acer-nitro-5-gaming-an515-45-r6ev-r5-nhqbmsv006-1.jpg', 'CPU:\r\nRyzen 55600H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\n512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiGTX 1650 4GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)USB Type-C', 2),
(10, 3, 'Laptop Lenovo Yoga 9 14ITL5 ', '34990000', 'https://cdn.tgdd.vn/Products/Images/44/239233/lenovo-yoga-9-14itl5-i7-82bg006evn-1-1-org.jpg', 'CPU:\r\ni71185G73GHz\r\nRAM:\r\n16 GBLPDDR4 (On board)4266 MHz\r\nỔ cứng:\r\n1 TB SSD M.2 PCIe\r\nMàn hình:\r\n14\"4K/UHD (3840 x 2160)\r\nCard màn hình:\r\nCard tích hợpIntel Iris Xe\r\nCổng kết nối:\r\n1 x USB 3.22 x Thunderbolt 4 USB-CJack tai nghe 3.5 mm', 2),
(11, 3, 'Laptop MSI Gaming GE66 Raider 11UG', '58990000', 'https://cdn.tgdd.vn/Products/Images/44/249152/msi-gaming-ge66-raider-11ug-i7-258vn-1-1-org.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n16 GBDDR4 2 khe (1 khe 8GB + 1 khe 8GB)3200 MHz\r\nỔ cứng:\r\n2 TB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)360Hz\r\nCard màn hình:\r\nCard rờiRTX 3070 8GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)Mini DisplayPortThunderbolt 4 USB-CUSB Type-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ kim loại\r\nKích thước, trọng lượng:\r\nDài 358 mm - Rộng 267 mm - Dày 23.4 mm - Nặng 2.38 Kg', 2),
(12, 3, 'Laptop HP Gaming VICTUS 16 e0170AX', '25490000', 'https://cdn.tgdd.vn/Products/Images/44/268677/hp-gaming-victus-16-e0170ax-r7-4r0u7pa-1-1.jpg', 'CPU:\r\nRyzen 75800H3.2GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 4GB + 1 khe 4GB)3200 MHz\r\nỔ cứng:\r\n512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)\r\nMàn hình:\r\n16.1\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\n1x USB 3.1 Gen 1 Type-A ( HP Sleep and Charge)1x USB 3.1 Gen 1 Type-C (support Power Delivery, DisplayPort, HP Sleep and Charge)2 x USB 3.1HDMIJack tai nghe 3.5 mmLAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 11 Home SL\r\nThiết kế:\r\nVỏ nhựa\r\nKích thước, trọng lượng:\r\nDài 370 mm - Rộng 260 mm - Dày 23.5 mm - Nặng 2.46 kg', 2),
(13, 3, 'Laptop Dell Gaming G15 5515', '21990000', 'https://cdn.tgdd.vn/Products/Images/44/260170/dell-gaming-g15-5515-r5-p105f004cgr-1-1.jpg', 'CPU:\r\nRyzen 55600H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\n256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB (2280) / 1TB (2230))Không hỗ trợ khe cắm HDD\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)120Hz\r\nCard màn hình:\r\nCard rờiRTX 3050 4GB\r\nCổng kết nối:\r\n1 x USB 3.22 x USB 2.0HDMIJack tai nghe 3.5 mmLAN (RJ45)USB Type-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành\r\nWindows 11 Home SL + Office Home & Student vĩnh viễn\r\nThiết kế:\r\nVỏ nhựa\r\nKích thước, trọng lượng:\r\nDài 357.26 mm - Rộng 272.11 mm - Dày 26.9 mm - Nặng 2.8 kg', 2),
(14, 3, 'Laptop Lenovo IdeaPad Gaming 3 15IHU6', '18990000', 'https://cdn.tgdd.vn/Products/Images/44/279407/lenovo-ideapad-gaming-3-15ihu6-i5-82k10178vn-1.jpg', 'CPU:\r\ni511300H3.1GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 4GB + 1 khe 4GB)3200 MHz\r\nỔ cứng:\r\n512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB (2280) / 512GB (2242))Hỗ trợ thêm 1 khe cắm HDD SATA (nâng cấp tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)120Hz\r\nCard màn hình:\r\nCard rờiGTX 1650 4GB\r\nCổng kết nối:\r\n2 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)USB Type-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 11 Home SL\r\nThiết kế:\r\nVỏ nhựa\r\nKích thước, trọng lượng:\r\nDài 359.6 mm - Rộng 251.9 mm - Dày 24.2 mm - Nặng 2.25 kg', 2),
(15, 3, 'Laptop MSI Gaming GS66 Stealth 11UG', '63990000', 'https://cdn.tgdd.vn/Products/Images/44/249147/msi-gaming-gs66-stealth-11ug-i7-219vn-1-1-org.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n32 GBDDR4 2 khe (1 khe 16GB + 1 khe 16GB)3200 MHz\r\nỔ cứng:\r\n2 TB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)360Hz\r\nCard màn hình:\r\nCard rờiRTX 3070 Max-Q 8GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-CUSB Type-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ kim loại\r\nKích thước, trọng lượng:\r\nDài 358.3 mm - Rộng 248 mm - Dày 19.8 mm - Nặng 2.1 Kg', 2),
(16, 3, 'Laptop MSI Creator Z16P B12UGST', '78990000', 'https://cdn.tgdd.vn/Products/Images/44/274777/msi-creator-z16p-b12ugst-i7-050vn-a-01.jpg', 'CPU:\r\ni712700H2.30 GHz\r\nRAM:\r\n32 GBDDR5 2 khe (1 khe 16GB + 1 khe 16GB)5200 MHz\r\nỔ cứng:\r\n2 TB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)\r\nMàn hình:\r\n16\"QHD+ (2560 x 1600)165Hz\r\nCard màn hình:\r\nCard rờiRTX 3070Ti Max-Q 8GB\r\nCổng kết nối:\r\n1 x USB 3.2Jack tai nghe 3.5 mmThunderbolt 4 USB-CUSB Type-C\r\nĐặc biệt:\r\nCó màn hình cảm ứngCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 11 Home SL\r\nThiết kế:\r\nVỏ kim loại\r\nKích thước, trọng lượng:\r\nDài 359 mm - Rộng 256 mm - Dày 19 mm - Nặng 2.39 kg', 2),
(34, 3, 'San pham moi', '10000000', '35.jpg', 'Dang cap nhat', 1),
(35, 14, 'sản phẩm mới', '100000', '17.jpg', 'Đang cập nhật', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL DEFAULT '',
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`, `phone`, `role`) VALUES
(3, 'user1@gmail.com', '123456', 'thuong', '0932758475', 'user'),
(7, 'abc@gmail.com', '123', 'dung', '058794524', 'user'),
(8, 'dung@gmail.com', '123', 'dung', '0123456', 'user'),
(12, 'dung@gmailm.com', '123', 'dung bui', '012345678', 'user'),
(13, 'abc@abc.com', '123', 'dung', '0123456', 'user'),
(14, 'admin@gmail.com', '123456', 'Huy', '098363773', 'admin'),
(15, 'abcz@gmail.com', '1', 'baban', '0874747', 'user'),
(16, 'ab@a.com', '123456', 'a', '24685', 'user'),
(19, 'nam210@gmail.com', '1111111', 'nam vu', '121212', 'user'),
(20, 'xuanbom@g.com', '123123', 'bom', '232322', 'user'),
(21, 'buidung@gmail.com', '123', 'dũng', '0254858526', 'user'),
(22, 'huy@gmail.com', '123456', 'Huy pham', '0987656565', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanphammoi`
--
ALTER TABLE `sanphammoi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sanphammoi`
--
ALTER TABLE `sanphammoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
