-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 05, 2021 lúc 08:29 AM
-- Phiên bản máy phục vụ: 10.4.16-MariaDB
-- Phiên bản PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhom5`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card`
--

CREATE TABLE `card` (
  `id_product` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `amount_product` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `card`
--

INSERT INTO `card` (`id_product`, `username`, `amount_product`, `status`) VALUES
('22', 'user1', 3, 0),
('301', 'nhom 5', 3, 0),
('305', 'admin', 3, 0),
('307', 'admin', 1, 0),
('307', 'user1', 1, 0),
('310', 'user1', 3, 0),
('6', 'admin', 1, 0),
('6', 'user1', 1, 0),
('6', 'user2', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id_product` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id_product`, `content`, `username`) VALUES
(22, 'sản phẩm tốt', 'user1'),
(301, 'ss', 'nhom 5'),
(307, 'đánh giá 5 sao <3', 'admin'),
(307, '3 sao', 'user1'),
(310, 'sản phẩm tốt', 'user1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `evalute`
--

CREATE TABLE `evalute` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_product` int(11) NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `evalute`
--

INSERT INTO `evalute` (`username`, `id_product`, `point`) VALUES
('admin', 307, 5),
('nhom 5', 301, 4),
('user1', 22, 5),
('user1', 307, 3),
('user1', 310, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufactures`
--

CREATE TABLE `manufactures` (
  `manu_id` int(11) NOT NULL,
  `manu_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufactures`
--

INSERT INTO `manufactures` (`manu_id`, `manu_name`) VALUES
(1, 'Citizen'),
(2, 'Lenovo'),
(3, 'LG'),
(4, 'Xiaomi'),
(5, 'Kanen'),
(6, 'Apple'),
(7, 'HP'),
(8, 'Samsung'),
(9, 'Huawei'),
(10, 'Asus'),
(12, 'Oppo'),
(13, 'Mozard ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manu_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `pro_image` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `amount_evalute` int(11) NOT NULL,
  `medium_point` double NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `manu_id`, `type_id`, `price`, `pro_image`, `description`, `feature`, `created_at`, `amount_evalute`, `medium_point`, `status`) VALUES
(1, 'Đồng hồ Nam Citizen BI5000-87L', 1, 3, 1548000, 'dong-ho-nam-citizen-bi5000-87l-trang-600x600.jpg', 'Xu hướng thiết kế chính của đồng hồ Citizen là đơn giản và thanh lịch. Citizen luôn chú trọng đến việc đổi mới và tạo sự phong phú cho các mẫu thiết kế. Các chi tiết cũng được Citizen đầu tư kỹ lưỡng trong khâu chế tác.\r\nSở hữu thiết kế sang trọng và tinh tế, chiếc đồng hồ quartz này phù hợp với các quý ông mạnh mẽ và thời thượng\r\n\r\nĐồng hồ Citizen BI5000-87L mang thương hiệu đồng hồ Citizen đến từ Nhật Bản, nổi tiếng với nhiều chiếc đồng hồ hiện đại và sang trọng.\r\n\r\nLớp vỏ ngoài bền chắc giúp đồng hồ có khả năng chịu va đập tốt\r\n\r\n- Mặt kính của mẫu đồng hồ Citizen nam này có độ trong suốt tốt, cứng cáp, hạn chế nứt vỡ khi rơi ở độ cao vừa phải.\r\n\r\n- Bộ khung chắc chắn, khả năng chống oxi hóa và ăn mòn tốt, bảo vệ an toàn cho các chi tiết máy bên trong.\r\n\r\nHệ số chống nước 5 ATM, chiếc đồng hồ nam này vẫn an toàn khi bạn đeo đi mưa và tắm, không mang khi bơi lội hay lặn\r\n\r\nNgười dùng nắm bắt thông tin ngày trong tháng dễ dàng hơn khi chiếc đồng hồ kim này được trang bị lịch ngày\r\n\r\nDây đồng hồ có độ bền cao, chịu được mọi điều kiện thời tiết, dễ dàng đánh bóng như mới sau một thời gian sử dụng', 1, '2020-11-17 07:46:13', 0, 0, 1),
(2, 'Laptop Lenovo IdeaPad S145 15IIL i3 1005G1/4GB/256GB/Win10 (81W8001XVN)', 2, 4, 11490000, 'lenovo-ideapad-s145-81w8001xvn-a4-216292-600x600.jpg', 'Thiết kế đơn giản, thời trang và tinh tế\r\nLaptop  mang thiết kế cơ bản của dòng Lenovo IdeaPad S145 có ngoại hình đẹp mắt, lớp vỏ được làm bằng nhựa phủ sơn màu xám sang trọng với logo Lenovo được đặt gọn gàng sang một bên trên nắp lưng. Độ dày 17.9 mm, cân nặng 1.79 kg phù hợp với các bạn học sinh sinh viên, người thường xuyên di chuyển.\r\nĐáp ứng tốt nhu cầu học tập, văn phòng\r\nMáy được trang bị con chip Intel Core i3 Ice Lake thế hệ 10 và RAM 4 GB. Với cấu hình này, dân văn phòng hay các bạn học sinh, sinh viên có thể yên tâm xử lí các tác vụ thường ngày như soạn thảo Word, soạn bài thuyết trình trên PowerPoint, lướt web, nghe nhạc, ... mượt mà.', 0, '2020-11-17 07:49:36', 0, 0, 1),
(3, 'Laptop Lenovo IdeaPad C340 14IML i5 10210U/8GB/512GB/2GB MX230/Touch/Win10 (81TK007RVN)', 2, 4, 13920000, 'lenovo-ideapad-c340-14iml-i5-81tk007rvn-kg-213526-600x600.jpg', 'Máy tính nhỏ gọn, siêu linh hoạt\r\nLenovo IdeaPad C340 có trọng lượng 1.65 kg, không quá nặng nề khi mang laptop trên vai suốt ngày dài.\r\nNhà sản xuất Lenovo còn trang bị cho chiếc máy tính xách tay này bộ đèn bàn phím tiện lợi, hỗ trợ bạn tối đa trong trường hợp bạn phải làm việc ban đêm nhưng ngại bật đèn làm phiền người khác.\r\n\r\nĐặc biệt laptop Lenovo IdeaPad C340 là dòng laptop lai, có khả năng gập xoay 360 độ với màn hình cảm ứng mượt mà. Điều này giúp bạn tự do làm việc với mọi tư thế thoải mái nhất.\r\n\r\nViệc trang bị màn hình cảm ứng còn giúp ích rất nhiều đối với dân thiết kế, vẽ AI, những người cần chỉnh sửa bài thuyết trình thường xuyên.\r\n\r\nKích thước màn hình 14 inch cân bằng với trọng lượng giúp tổng thể máy trông gọn gàng. Với độ phân giải Full HD (1920 x 1080), IdeaPad C340 cho hình ảnh sắc nét, đẹp mắt. ', 1, '2020-11-17 07:49:36', 0, 0, 1),
(4, 'Loa Bluetooth LG Xboom Go PL5 Xanh Đen\r\n', 3, 1, 2690000, 'loa-bluetooth-lg-xboom-go-pl5-xanh-den-600x600-1-600x600.jpg', 'Thiết kế đơn giản, phong cách năng động\r\nLoa Bluetooth LG Xboom Go PL5 Xanh Đen có thiết kế hình trụ nằm ngang tạo cảm giác vừa vặn khi cầm trên tay, màu xanh đen trẻ trung năng động.\r\n\r\nThoải mái mang chiếc loa Bluetooth này tham gia vào các bữa tiệc tại bể bơi hay ngoài trời mà không cần lo lắng bị ướt nước với chuẩn kháng nước IPX5.', 1, '2020-11-17 07:51:47', 0, 0, 1),
(5, 'Tai nghe Bluetooth Kanen K6', 5, 2, 600000, 'tai-nghe-bluetooth-kanen-k6-avatar-600x600.jpg', 'Cách sử dụng tai nghe\r\n- Nút tròn ấn giữ: Bật/tắt nguồn.\r\n\r\n- Nút tròn ấn 1 lần: Dừng/ phát nhạc, nhận/ngắt cuộc gọi.\r\n\r\n- Nút tròn ấn 2 lần: Kích hoạt Siri, Bixby,...\r\nCách kết nối tai nghe Bluetooth\r\n- Bạn ấn nút nguồn (hình tròn), lúc này tai nghe sẽ chớp xanh đỏ liên tục để chờ kết nối.\r\n\r\n- Mở Bluetooth trong điện thoại và dò tìm tên K6 để kết nối.\r\n\r\n- Tai nghe sẽ tự động kết nối với điện thoại ở những lần sau.', 0, '2020-11-17 07:53:04', 0, 0, 1),
(6, 'Loa kéo karaoke LG RL2 50W', 3, 1, 3090000, 'loa-keo-lg-rl2-10-600x600.jpg', 'Âm thanh trung thực, mạnh mẽ, cuốn hút bất tận với công suất 50 W, loa trầm 6.5\"\r\nLoa trầm phát âm trầm tinh tế tái hiện từng nốt nhạc rõ ràng, sắc sảo, cho bạn cảm nhận âm thanh chân thật, quyến rũ.\r\n\r\nLoa kéo sử dụng liên tục trong thời gian từ 13 - 16 tiếng, sạc đầy trong 8 - 10 tiếng cho bạn ca hát, nghe nhạc thoải mái, dài lâu.', 1, '2020-11-17 08:04:33', 0, 0, 1),
(7, 'Điện thoại iPhone 11 64GB', 6, 5, 19990000, 'iphone-11-red-2-400x460-400x460.png', 'Nâng cấp mạnh mẽ về camera\r\nNói về nâng cấp thì camera chính là điểm có nhiều cải tiến nhất trên thế hệ iPhone mới.\r\nNgoài camera chính vẫn có độ phân giải 12 MP thì chúng ta sẽ có thêm một camera góc siêu rộng và cũng với độ phân giải tương tự.', 0, '2020-11-17 08:10:49', 0, 0, 1),
(8, 'Điện thoại iPhone 8 Plus 128GB', 6, 5, 14190000, 'iphone-8-plus-128gb-082720-052722-400x460.png', 'Thiết kế sang trọng, bóng bẩy\r\niPhone 8 Plus giữ nguyên thiết kế đã hoàn thiện từ thế hệ đàn em iPhone 7 Plus, bên cạnh đó iPhone 8 Plus được bo tròn góc cạnh mềm mại giúp cho máy tăng độ sang trọng, thêm bắt mắt. Máy được trang bị khung nhôm cao cấp chắc chắn, và mặt kính cường lực ở mặt trước và phần lưng cùng với logo táo khuyết quen thuộc.', 1, '2020-11-17 08:24:57', 0, 0, 1),
(9, 'Máy tính bảng iPad Mini 7.9 inch Wifi 64GB (2019)', 6, 4, 899000, 'ipad-mini-79-inch-wifi-2019-gold-400x460.png', 'Tất cả nâng cấp đều ở bên trong\r\nIPad mini 4 và iPad Mini 7.9 inch Wifi 2019 là bước nhảy vọt về hiệu năng từ bộ xử lý A8 sang A12 Bionic mới nhất mang lại \"hiệu năng gấp 3 lần và đồ họa nhanh hơn 9 lần\". Đồng thời, dung lượng RAM đã có sự nâng cấp nhẹ so với thế hệ thứ 4, tăng từ 2 GB lên RAM 3 GB giúp bạn chạy đa nhiệm nhiều ứng dụng tốt hơn.', 0, '2020-11-17 08:31:57', 0, 0, 1),
(10, 'Laptop HP 15s fq1111TU i3 1005G1/4GB/256GB/Win10 (193R0PA)', 7, 4, 11390000, 'hp-15s-fq1111tu-i3-193r0pa-224012-224012-600x600.jpg', 'Vi xử lý mới nhất\r\nVi xử lý Intel Core i3 Gen 10 mới nhất giúp nâng cấp hiệu suất với khả năng đáp ứng hệ thống mượt mà và khả năng kết nối nhanh, đáp ứng nhu cầu học tập, giải trí hằng ngày. \r\n\r\nRAM 4 GB đa nhiệm khá mượt, đủ dùng khi mở khoảng 15 - 20 tab Chrome. Máy có hỗ trợ nâng cấp RAM lên tối đa 16 GB.', 0, '2020-11-17 08:35:41', 0, 0, 1),
(11, 'Apple Watch S5 44mm viền nhôm dây cao su đen', 6, 3, 11691000, 'apple-watch-s5-44mm-vien-nhom-day-cao-su-ava-1-600x600.jpg', 'Tính năng màn hình luôn hiển thị (Always-on) giúp bạn xem giờ và thông báo tiện lợi bất cứ lúc nào. Khi không quan sát, đồng hồ sẽ tự giảm độ sáng xuống để tiết kiệm pin. Màn hình trên Apple Watch S5 44mm sử dụng tấm nền OLED cao cấp, tiết kiệm pin hơn, độ sắc nét đạt chuẩn Retina - nghĩa là bạn rất khó để nhận biết các điểm ảnh, rỗ hạt bằng mắt thường.', 1, '2020-11-17 08:39:56', 0, 0, 1),
(12, 'Laptop Apple MacBook Air 2017 i5 1.8GHz/8GB/128GB (MQD32SA/A)', 6, 4, 20990000, 'apple-macbook-air-mqd32sa-a-i5-5350u-600x600.jpg', 'Thiết kế siêu mỏng và nhẹ \r\nMacbook Air 2017 mang những đặc trưng thiết kế của dòng MacBook Air với trọng lượng và độ dày của laptop lần lượt là 1.7 cm và 1.35 kg rất tiện lợi và dễ dàng giúp người dùng không cảm thấy bất tiện khi mang trên vai thường xuyên khi đi học hay đi làm. \r\n\r\nĐây cũng là chiếc MacBook chính hãng có giá rẻ nhất hiện tại, phù hợp với mọi người tiêu dùng. ', 1, '2020-11-17 08:44:30', 0, 0, 1),
(13, 'Đồng hồ Nam Citizen AW1598-70X', 1, 3, 4980000, 'citizen-aw1598-70x-nam-avatar-1-600x600.jpg', 'Đơn giản và thanh lịch \r\nXu hướng thiết kế chính của đồng hồ Citizen là đơn giản và thanh lịch. Citizen luôn chú trọng đến việc đổi mới và tạo sự phong phú cho các mẫu thiết kế. Các chi tiết cũng được Citizen đầu tư kỹ lưỡng trong khâu chế tác.\r\n\r\nTìm hiểu thêm\r\n\r\nThiết kế nam tính, hiện đại, phù hợp với các chàng trai năng động, trẻ trung.\r\n\r\nĐồng hồ nam Citizen AW1598-70X là chiếc đồng hồ mang thương hiệu Citizen nổi tiếng và chất lượng của Nhật Bản.\r\n\r\nĐược tích hợp công nghệ Eco-Drive, hoạt động bằng nguồn năng lượng được chuyển hóa từ ánh sáng (mặt trời, đèn, ...).\r\n\r\nXem thêm: Công nghệ Eco-Drive là gì?\r\n\r\nBảo vệ an toàn phần lõi bên trong nhờ bộ khung bền bỉ, chịu lực tốt.\r\n\r\n- Mặt kính đồng hồ Citizen có độ trong suốt cao, không lóa mắt khi xem giờ dưới nắng.\r\n\r\n- Khung viền cứng cáp, chắc chắn, chống oxi hóa, chịu được mọi thời tiết khắc nghiệt.\r\n\r\nThoải mái đeo khi tắm, bơi vì có hệ số chống nước 100m, không mang đồng hồ nam khi lặn.\r\n\r\nLưu ý: Không vặn các núm điều khiển khi bơi.\r\n\r\nDễ dàng kiểm soát thời gian khi đồng hồ được trang bị lịch ngày hữu dụng.\r\n\r\nDây đồng hồ Citizen nam bền chắc, chống ăn mòn, cho cảm giác mát tay khi đeo.', 1, '2020-11-17 08:45:55', 0, 0, 1),
(14, 'Laptop LG Gram 17 i7 1065G7/8GB/512GB/Win10 (17Z90N-V.AH75A5)', 3, 4, 38490000, 'lg-gram-17-i7-17z90n-vah75a5-142120-022156-600x600.jpg', 'Tự tin đồng hành cùng LG Gram 17 i7 (17Z90N-V.AH75A5) - chiếc máy tính xách tay 17 inch đến từ nhà LG. Siêu mỏng nhẹ, pin cực trâu và màn hình tràn viền rộng lớn là những điểm nổi bật của chiếc máy tính này. \r\nThiết kế gọn nhẹ, siêu di động\r\nLG Gram đem đến thiết kế siêu mỏng nhẹ chỉ 1.35 kg với một chiếc laptop 17 inch.\r\n\r\nThân máy được hoàn thiện từ chất liệu hợp kim Nano Carbon - Magie sang trọng và bền bỉ, tự tin đồng hành cùng bạn trong mọi tình huống.', 1, '2020-11-17 08:51:25', 0, 0, 1),
(15, 'Điện thoại Samsung Galaxy S20+', 8, 5, 23990000, 'samsung-galaxy-s20-plus-400x460-fix-400x460.png', 'Chiếc điện thoại Samsung Galaxy S20 Plus - Siêu phẩm với thiết kế màn hình tràn viền, hiệu năng đỉnh cao kết hợp cùng nhiều đột phá về công nghệ dẫn đầu thế giới smartphone.\r\nThiết kế màn hình tràn viền, siêu mượt 120 Hz\r\nThiết kế của chiếc điện thoại Samsung Galaxy S20 Plus là kính kết hợp độc đáo giữa với khung kim loại cùng mặt lưng kính cường lực Gorilla Glass 6 thế hệ mới nhất cho khả năng chống chịu trầy xước và va đập tốt. \r\n\r\nSamsung Galaxy S20 Plus | Thiết kế siêu tràn viền\r\n\r\nMàn hình Galaxy S20+ có kích thước 6.7 inch độ phân giải 2K (1440 x 3200 Pixels) sử dụng tấm nền Dynamic AMOLED 2X với khả năng hiển thị màu sắc sắc nét, độ chi tiết cao và sống động.\r\n\r\nKhung máy được hoàn thiện một cách tỉ mỉ, độ chính xác cao với viền màn hình đã được thiết kế cong nhẹ cho cảm giác dễ dàng cầm nắm, không bị cấn tay hay vô tình chạm vào màn hình.\r\n\r\nSamsung Galaxy S20 Plus | Viền màn kim loại\r\n\r\nĐiểm nổi bật trên chiếc điện thoại Samsung Galaxy S20 Plus chính là việc trang bị màn hình Infinity O tràn viền ra bốn cạnh với tỷ lệ diện tích hiển thị lên tới 90.5%.\r\n\r\nTần số quét màn hình lên đến 120 Hz cho cảm giác phản hồi nhanh, dường như không có độ trễ. Người dùng có thể điều chỉnh giữa 60 và 120 Hz để tiết kiệm năng lượng pin cho máy.\r\n\r\nSamsung Galaxy S20 Plus | Thiết kế màn hình 120 Hz\r\n\r\nBên cạnh đó màn hình của máy còn hỗ trợ công nghệ hiển thị HDR10+ mang đến những thước phim giải trí hay những pha hành động combat được tái hiện một cách sống động, chân thực cùng trải nghiệm thao tác siêu mượt mà.\r\n\r\nĐột phá camera sau \r\nGalaxy S20+ được trang bị hệ thống 4 camera sau bao gồm: camera tele 64 MP, camera góc rộng và camera góc siêu rộng 12 MP và cuối cùng cảm biến TOF với chức năng hỗ trợ đo chiều sâu.\r\n\r\nSamsung Galaxy S20 Plus | Đột phá camera sau\r\n\r\nCụm camera sau được thiết kế hơi lồi so với mặt lưng, hỗ trợ các tính năng độc đáo mới được trang bị trên dòng sản phẩm Galaxy S20 như quay video 8K, Space Zoom, Single Take,... người dùng thỏa thích sáng tạo nên nhiều kiệt tác nghệ thuật.\r\n\r\nSamsung Galaxy S20 Plus | Chụp đêm \r\n\r\nĐây cũng là lần đầu tiên Samsung trang bị tính năng quay video chất lượng điện ảnh 8K lên chiếc điện thoại, mang đến những thước phim với độ phân giải đáng kinh ngạc, độ sắc nét sẽ cũng được duy trì ở mức tối đa ngay cả khi video được trình chiếu trên những màn hình lớn.\r\n\r\n\r\nVới độ phân giải lên đến 64MP, việc giữ được độ rõ nét và màu sắc tươi mới cho bức ảnh không thể làm khó được Samsung Galaxy S20+.\r\n\r\nSamsung Galaxy S20+ | 64 MP\r\n\r\nNgoài những công nghệ nổi bật như chúng ta đã nhắc ở trên, Galaxy S20 series còn sở hữu nhiều chế độ và tính năng ấn tượng khác hỗ trợ tối đa khả năng chụp ảnh nâng cao như điều chỉnh ISO, tốc độ màn trập, phơi sáng,... chất lượng hình ảnh sẽ trở nên ấn tượng hơn, đúng ý người dùng hơn.\r\n\r\nSamsung Galaxy S20 Plus | Giao diện chụp ảnh\r\n\r\nTrải nghiệm camera trên chiếc điện thoại cho chuyển chế độ mượt mà giữa các chế độ góc thường, góc siêu rộng. Chất lượng hình ảnh được chụp bằng Samsung Galaxy S20 Plus với màu sắc nét, độ chi tiết cao kết hợp cùng bộ công cụ chỉnh sửa được tích hợp sẵn ngay trên điện thoại, dễ dàng chỉnh sửa ảnh và video để tạo nên những thước phim ấn tượng nhất.\r\n\r\nẢnh chụp góc thường trên Samsung Galaxy S20+\r\nSamsung Galaxy S20+ zoom tối đa 30X\r\nTính năng Single Take của Samsung Galaxy S20+ với khả năng ghi lại nhiều tấm hình trong một lần chụp, điện thoại sẽ sử dụng 3 camera sau để chụp được 14 hình ảnh hoặc quay những video khác nhau, từ đó gợi ý cho người dùng những tấm hình đẹp nhất hay các video vui vẻ với chất lượng cao, có thể chia sẻ ngay mà không cần edit thêm. \r\n\r\n\r\nCamera trước của máy có độ phân giải 10 MP hứa hẹn sẽ cho ra những tấm hình chụp selfie ấn tượng cho bạn tự tin khoe ảnh cùng người thân và gia đình.\r\n\r\nSamsung Galaxy S20 Plus | Camera selfie\r\n\r\nHiệu năng mạnh mẽ, chơi game đỉnh cao\r\nChiếc điện thoại Samsung Galaxy được trang bị con cây nhà lá vườn Samsung mang tên Exynos 990 8 nhân mới nhất, được thiết kế trên quy trình 7 nm hiện đại với xung nhịp cao nhất có thể đạt tới 2.73 GHz.\r\n\r\nSamsung Galaxy S20 Plus | Hiệu năng đỉnh cao\r\n\r\nĐi kèm theo máy mà dung lượng RAM lớn 8 GB cho sự mượt mà hoàn hảo khi chuyển đổi giữa các ứng dụng, bộ nhớ trong của máy cũng không kém phần nổi trội khi được trang bị bộ nhớ trong 128 GB có hỗ trợ thẻ nhớ ngoài lên đến 1T.\r\n\r\nSamsung Galaxy S20 Plus | Khay sim\r\n\r\nHiệu năng mạnh mẽ của máy dễ dàng giúp cho điện thoại chơi game tốt, mượt mà ở mức cấu hình cao nhất cũng như đáp ứng tốt các tác vụ từ cơ bản đến nâng cao, kể cả những hoạt động thực tế ảo VR hay các tựa game 3D yêu cầu mức đồ họa cao.\r\n\r\nSamsung Galaxy S20 Plus | Hiệu năng mạnh mẽ trên Android 10\r\n\r\nMáy được cài đặt sẵn hệ điều hành Android 10 mới nhất tùy biến trên giao diện OneUI 2.0 đẹp mắt, dễ dàng với các thao tác, nâng cao trải nghiệm sử dụng của người dùng.\r\n\r\nJack tai nghe 3.5 mm được loại bỏ hoàn toàn trên Samsung Galaxy S20+, chúng ta sẽ có thể kết nối tai nghe qua cổng USB Type C hiện đại. \r\n\r\nSamsung Galaxy S20 Plus | Trải nghiệm thực tế\r\n\r\nLoa thoại của máy cũng được Samsung làm gần như ẩn bên trong cạnh trên màn hình, cho một thiết kế liền mạnh. Máy có tính năng chống nước, bụi chuẩn IP68, hạn chế hư hỏng do nước và bụi gây ra.\r\n\r\nDung lượng pin lớn, thoải mái trải nghiệm\r\nGalaxy S20 Plus được trang bị viên pin lớn với dung lượng 4.500 mAh cho bạn thỏa sức trải nghiệm suốt ngày dài chỉ với một lần sạc duy nhất, ngoài ra máy còn được hỗ trợ sạc nhanh 25W cho người dùng thêm nhiều giờ trải nghiệm, chỉ trong vài phút sạc.\r\n\r\nSamsung Galaxy S20 Plus | Dung lượng pin lớn\r\n\r\nBên cạnh chức năng sạc truyền thống bằng cổng USB Type C máy còn được trang bị chức năng sạc không dây 15W hay chế độ sạc ngược không dây 9W dễ dàng sạc pin cho các phụ kiện mà không cần phải sử dụng tới sạc dự phòng.\r\n\r\nSamsung Galaxy S20 Plus | Cảm biến vân tay\r\n\r\nMáy còn được trang bị cảm biến vân tay trong màn hình tốc độ nhận diện nhanh và chính xác, bên cạnh đó người dùng có thể mở khóa bằng tính năng nhận diện khuôn mặt với tốc độ mở khóa cũng nhanh không kém.\r\n\r\n\r\nBài viết này có hữu ích cho Bạn không ?\r\n\r\nHữu ích \r\nKhông Hữu ích\r\n', 1, '2020-11-17 08:52:46', 0, 0, 1),
(16, 'Máy tính bảng iPad Pro 11 inch Wifi Cellular 128GB (2020)', 6, 5, 25490000, 'ipad-pro-11-inch-wifi-cellular-128gb-2020-bac-400x460-400x460.png', 'Đã 2 năm kể từ khi mẫu iPad Pro 2018 ra mắt, mới đây, mẫu iPad Pro mới nhất - iPad Pro 11 inch (2020) vừa được Apple trình làng với nhiều sự cải tiến đáng giá lẫn về tính năng và sức mạnh xử lý, hứa hẹn đây sẽ là mẫu máy tính bảng được săn đón nhiều nhất trong năm 2020.\r\nThiết kế “bình cũ rượu mới” sang trọng đậm chất “Táo”\r\nCó thể thấy rằng, mẫu iPad Pro 2020 11 inch hầu như không có sự khác biệt nhiều so với thế hệ iPad trước đó về mặt thiết kế. ', 1, '2020-11-17 08:54:07', 0, 0, 1),
(17, 'Máy tính bảng Huawei MediaPad T3 10 (2017)', 9, 4, 3740000, 'huawei-mediapad-t3-10-1-33397-chitiet-400x460.png', 'Huawei MediaPad T3 10 (2017) là chiếc máy tính bảng với màn hình kích thước lớn cùng khe cắm sim tiện lợi giúp người dùng có thể nghe gọi như một chiếc smartphone.\r\nThiết kế mỏng, đẹp\r\nVề tổng thể, máy nổi bật với phần khung viền kim loại sang trọng, kết hợp màu sắc hiện đại cho cảm giác khá thanh lịch, nhẹ nhàng.', 1, '2020-11-17 08:55:26', 0, 0, 1),
(18, 'Điện thoại Samsung Galaxy A51 (6GB/128GB)', 8, 5, 7490000, 'samsung-galaxy-a51-400x460-new-400x460.png', 'Thiết kế thời thượng, bật cá tính\r\nMáy có thiết kế mỏng nhẹ thuộc hàng top trong phân khúc, chỉ 7.9 mm. Mặt lưng với họa tiết cắt kim cương đa sắc nổi bật, đi kèm là 3 tùy chọn màu sắc sành điệu: Xanh Crush Đa Sắc, Trắng Crush Lấp Lánh, Đen Crush Kim Cương.', 0, '2020-11-17 08:57:08', 0, 0, 1),
(19, 'Laptop Asus VivoBook X441MA N5000/4GB/1TB/Win10 (GA024T)', 10, 4, 6690000, 'asus-x441ma-ga024t11-191993-600x600.jpg', 'Laptop Asus Vivobook X441MA N5000 là chiếc máy tính xách tay nhỏ gọn được Asus ưu ái trang bị một hệ thống các cổng kết nối đồ sộ cùng một hiệu năng ổn định với CPU Intel Pentium thế hệ 7.\r\nThiết kế nhỏ gọn\r\nDù sở hữu lối thiết kế đơn giản nhưng Asus Vivobook X441MA vẫn mang lại sự sang trọng nhất định đến cho người dùng nhờ việc kết hợp hài hòa giữa 2 màu sắc đen và trắng. Tuy được hoàn thiện từ chất liệu nhựa nhưng máy vẫn đảm bảo độ cứng cáp và đặc biệt trọng lượng máy chỉ là 1.7 kg sẽ khá phù hợp cho những người thường xuyên di chuyển.', 0, '2020-11-17 08:58:08', 0, 0, 1),
(20, 'Laptop Lenovo IdeaPad S340 14IIL i3 1005G1/8GB/512GB/Win10 (81VV003VVN)', 2, 4, 12999000, 'lenovo-ideapad-s340-14iil-i3-1005g1-8gb-512gb-win1-20-600x600.jpg', 'Lenovo IdeaPad S340 14IIL (81VV003VVN) sở hữu cấu hình khá, hiệu năng ổn định và thiết kế tinh tế đẹp mắt. Đây sẽ là chiếc laptop văn phòng phù hợp với đối tượng sinh viên, dân văn phòng thường xuyên xử lý các tác vụ văn phòng, học tập và chỉnh sửa hình ảnh cơ bản. \r\nHiệu năng ổn định đáp ứng nhu cầu văn phòng và thiết kế cơ bản \r\nLenovo IdeaPad S340 14IIL (81VV003VVN) được trang bị bộ vi xử lý Intel Core i3 Ice Lake thế hệ 10 mới ra mắt với những cải tiến về hiệu năng và tốc độ xử lý so với thế hệ trước cùng với RAM 8 GB mang đến sức mạnh xử lý tốt các tác vụ học tập, văn phòng cơ bản và xử lý hình ảnh vừa phải trên các ứng dụng Photoshop, AI,...    ', 1, '2020-11-17 08:59:03', 0, 0, 1),
(21, 'Điện thoại Samsung Galaxy A51 (8GB/128GB)', 8, 5, 8390000, 'samsung-galaxy-a51-8gb-blue-400x460-1-400x460.png', 'Galaxy A51 8GB là phiên bản nâng cấp RAM của smartphone tầm trung đình đám Galaxy A51 từ Samsung. Sản phẩm nổi bật với thiết kế sang trọng, màn hình Infinity-O cùng cụm 4 camera đột phá. sản phẩm cũng là Smartphone Android Bán Chạy Nhất Thế Giới Quý 1/2020 (theo báo cáo từ Strategy Analytics).\r\nMàn hình tràn viền Infinity-O thời thượng\r\nMặt trước của Galaxy A51 8GB nổi bật với màn hình tràn viền vô cực Infinity-O kế thừa từ series S, Note cao cấp. ', 1, '2020-11-17 09:00:04', 0, 0, 1),
(22, 'Điện thoại iPhone 11 Pro Max 64GB', 6, 5, 29990000, 'iphone-11-pro-max-black-400x460.png', 'Trong năm 2019 thì chiếc smartphone được nhiều người mong muốn sở hữu trên tay và sử dụng nhất không ai khác chính là iPhone 11 Pro Max 64GB tới từ nhà Apple.\r\nCamera được cải tiến mạnh mẽ\r\nChắc chắn lý do lớn nhất mà bạn muốn nâng cấp lên iPhone 11 Pro Max chính là cụm camera mới được Apple nâng cấp rất nhiều.', 1, '2020-11-17 09:01:00', 0, 0, 1),
(23, 'Apple Watch S6 LTE 40mm viền nhôm dây cao su\r\n', 6, 3, 14391000, 'apple-watch-s6-lte-40mm-vien-nhom-day-cao-su-ava-600x600.jpg', 'Kiểu dáng năng động, cá tính\r\nApple Watch S6 LTE 40mm viền nhôm dây cao su sở hữu màn hình 1.57 inch giúp hiển thị đầy đủ thông tin và hình ảnh sắc nét. Dây đeo được làm từ chất liệu cao su dẻo dai và êm ái, cho cảm giác dễ chịu khi mang. Thêm vào đó, mặt kính cường lực Sapphire giúp chống trầy, tăng độ bền cho thiết bị. Các đường nét được thiết kế tinh xảo làm nên sự đẳng cấp của Apple Watch.\r\n\r\nApple Watch S6 LTE 40mm viền nhôm dây cao su sở hữu thiết kế hiện đại\r\n\r\nĐồng hồ thông minh Apple sở hữu chip S6 cho hiệu năng vượt bậc\r\nNhờ có bộ xử lý S6 hoàn toàn mới, đồng hồ đạt hiệu năng cao hơn 20% so với dòng chip S5 thế hệ trước, đây được coi là bước nhảy vọt về phần cứng của dòng Apple Watch.\r\n\r\nApple Watch S6 LTE 40mm viền nhôm dây cao su sở hữu bộ chip xử lý cho hiệu năng cao\r\n\r\nHệ điều hành watchOS 7.0 đem đến nhiều tính năng mới\r\nVới các tính năng mới như: Family Setup, nhận biết rửa tay, chia sẻ màn hình qua iMessages, Siri dịch nhanh 10 ngôn ngữ, 7 loại mặt đồng hồ mới, fitness ... nhờ đó, hệ điều hành WatchOS 7.0 này sẽ giúp Apple Watch S6 trở nên hoàn hảo hơn.\r\n\r\nApple Watch S6 LTE 40mm viền nhôm dây cao su sử dụng hệ điều hành watchOS 7\r\n\r\nCảm biến SpO2 giúp theo dõi nồng độ oxy trong máu\r\nApple Watch 2020 được trang bị cảm biến SpO2 hỗ trợ người dùng theo dõi nồng độ oxy trong máu định kỳ, ngay cả khi bạn đang ngủ. Bên cạnh đó, thiết bị này còn được hỗ trợ đo điện tâm đồ ECG giúp bạn chăm sóc sức khỏe của mình tốt hơn.', 0, '2020-11-17 09:01:41', 0, 0, 0),
(255, 'Điện thoại OPPO Reno4', 12, 5, 8190000, '1608308050oppo-reno4-xanh-600x600.jpg', 'OPPO Reno4 - Chiếc điện thoại có thiết kế thời thượng, hiệu năng mạnh mẽ cùng bộ 4 camera siêu ấn tượng, tối ưu hóa cho chụp ảnh và quay phim siêu sắc nét, hứa hẹn sẽ là sản phẩm đáng để nâng cấp của hãng OPPO trong năm nay.\r\nĐầu tiên, OPPO Reno 4 có sự nâng cấp toàn diện so với người anh em Reno3, khi sử dụng chất liệu nhôm nguyên khối và được bọc kính cường lực Gorilla Glass 3 ở phần mặt trước và vỏ nhựa giả kính mặt lưng góp phần tăng độ cứng cáp lẫn nét sang trọng cho máy. \r\n\r\nTiếp đến là màn hình hyperbol kích thước 6.4 inch có phần viền benzel được làm siêu mỏng, độ phân giải Full HD+ (1080 x 2400 Pixels) trên nền màu AMOLED mang đến chất lượng hình ảnh rõ nét, sống động, trải nghiệm giải trí chơi game trên thiết bị này sẽ cực lỳ thích.', 1, '2020-12-18 16:14:10', 0, 0, 1),
(259, 'Điện thoại Samsung Galaxy Z Fold2 5G', 8, 5, 5000000, 'samsung-galaxy-z-fold-2-vang-dong-600x600.jpg', 'Đặc điểm nổi bật của Samsung Galaxy Z Fold2 5G\r\n\r\nSamsung Galaxy Z Fold 2 là tên gọi chính thức của điện thoại màn hình gập cao cấp nhất của Samsung. Với nhiều nâng cấp tiên phong về thiết kế, hiệu năng và camera, hứa hẹn đây sẽ là một siêu phẩm thành công tiếp theo đến từ “ông trùm” sản xuất điện thoại lớn nhất thế giới.', 1, '2021-01-03 04:49:45', 0, 0, 1),
(260, 'Điện thoại iPhone 12 256GB', 6, 5, 27000000, 'iphone-12-trang-new-600x600-600x600.jpg', 'iPhone 12 256 GB được Apple cho ra mắt đã đem đến làn sóng mạnh mẽ đối với những ai yêu công nghệ nói chung và “fan hâm mộ” trung thành của iPhone nói riêng, với con chip mạnh, dung lượng lưu trữ lớn cùng thiết kế toàn diện và khả năng hiển thị hình ảnh xuất sắc.', 1, '2021-01-03 04:51:33', 0, 0, 1),
(261, 'Điện thoại Samsung Galaxy Z Flip', 8, 5, 36000000, 'samsung-galaxy-z-flip-600x600-1-600x600.jpg', 'Cuối cùng sau bao nhiêu thời gian chờ đợi, chiếc điện thoại Samsung Galaxy Z Flip đã được Samsung ra mắt tại sự kiện Unpacked 2020. Siêu phẩm với thiết kế màn hình gập vỏ sò độc đáo, hiệu năng tuyệt đỉnh cùng nhiều công nghệ thời thượng, dẫn dầu 2020.', 1, '2021-01-03 04:53:15', 0, 0, 1),
(262, 'Điện thoại OPPO Reno3 Pro', 12, 5, 8000000, 'oppo-reno3-pro-(10).jpg', 'OPPO Reno3 Pro tiếp nối truyền thống dòng Reno, vẫn sở hữu cụm camera sau chất lượng cao và bổ sung tính năng quay video Siêu chống rung 2.0 ấn tượng. OPPO cũng trang bị cho máy cụm camera selfie kép tích hợp AI, thiết kế cao cấp theo kịp xu hướng.', 1, '2021-01-03 04:54:38', 0, 0, 1),
(263, 'Điện thoại OPPO Find X2', 12, 5, 19000000, 'oppo-find-x2-blue-600x600-1-600x600.jpg', 'Tiếp nối thành công vang dội của thế hệ Find X, OPPO chính thức ra mắt Find X2 với những đường nét thanh lịch từ thiết kế phần cứng cho đến trải nghiệm phần mềm, hứa hẹn một vẻ đẹp hoàn hảo, một sức mạnh xứng tầm', 1, '2021-01-03 04:55:49', 0, 0, 1),
(264, 'Điện thoại Xiaomi Mi 10T Pro 5G', 4, 5, 12000000, 'xiaomi-mi-10t-pro-den-600x600.jpg', 'Mi 10T Pro 5G mẫu smartphone cao cấp của Xiaomi trong năm 2020 cuối cùng cũng được trình làng với loạt những thông số gây “choáng ngợp”: màn hình tần số quét 144 Hz, vi xử lý Snapdragon 865 và cụm camera khủng 108 MP kèm theo đó là một mức giá dễ chịu cho người dùng.', 1, '2021-01-03 04:57:44', 0, 0, 1),
(265, 'Điện thoại Xiaomi POCO X3 NFC', 4, 5, 6000000, 'xiaomi-poco-x3-(4).jpg', 'Tiếp nối sự thành công về thế mạnh là điện thoại tầm trung với thiết kế hiện đại sang trọng, Xiaomi đã cho ra mắt Xiaomi POCO X3 NFC mang theo nhiều tính năng hấp dẫn trên 1 chiếc điện thoại thông minh, cụm camera chất lượng, hiệu năng mạnh mẽ, dung lượng pin khủng cùng khả năng sạc nhanh vượt trội 33W.', 1, '2021-01-03 04:59:11', 0, 0, 1),
(266, 'Điện thoại Xiaomi Redmi Note 9 Pro (6GB/128GB)', 4, 5, 6000000, 'xiaomi-redmi-note-9-pro-white-600x600.jpg', 'Xiaomi Redmi Note 9 Pro 6GB/128GB là chiếc smartphone tầm trung mới nhất của Xiaomi gây ấn tượng với cấu hình mạnh mẽ, hệ thống bốn camera sau chất lượng, dung lượng pin khủng cùng mức giá bán cực kỳ hấp dẫn.', 1, '2021-01-03 05:00:18', 0, 0, 1),
(267, 'Điện thoại Huawei Nova 7i (Nền tảng Huawei Mobile Service)', 9, 5, 6000000, 'huawei-nova-7i-pink-600x600-1-600x600.jpg', 'Sau thành công dòng sản phẩm Nova 3i, Nova 5i, Huawei tiếp tục cho ra mắt người kế nhiệm mang tên Huawei Nova 7i với nhiều đột phá về cấu hình, thiết kế và camera. Đi kèm với giá thành phải chăng, thiết bi hứa hẹn tạo nên cơn sốt điện thoại cho năm 2020.', 1, '2021-01-03 05:01:48', 0, 0, 1),
(268, 'Điện thoại OPPO Reno4 Pro', 12, 5, 11000000, 'oppo-reno4-pro-trang-600x600.jpg', 'Mới đây, OPPO đã chính thức trình làng chiếc smartphone mới mang tên OPPO Reno4 Pro. Máy được trang bị cấu hình vô cùng cao cấp với vi xử lý chip Snapdragon 720G, bộ 4 camera đến 48 MP ấn tượng, cùng công nghệ sạc siêu nhanh Super VOOC 65 W hướng tới nhóm khách hàng thích chụp ảnh, chơi game với hiệu năng cao nhưng được bán với mức giá vô cùng tốt.', 1, '2021-01-03 05:04:11', 0, 0, 1),
(269, 'Laptop Lenovo Yoga Duet 7 13IML05 i5 10210U/8GB/512GB/Touch/Pen/Win10 (82AS007BVN)', 2, 4, 26000000, 'lenovo-yoga-duet-7-13iml05-i5-82as007bvn-304420-084404-600x600.jpg', 'Cực kỳ linh hoạt và mạnh mẽ với cấu hình thế hệ 10 mới nhất, màn hình cảm ứng cùng thiết bị mở khoá khuôn mặt thông minh, laptop Lenovo Yoga Duet 7 13IML05 i5 (82AS007BVN) quả là một tuyệt tác của giới công nghệ 2020.', 1, '2021-01-03 05:06:40', 0, 0, 1),
(270, 'Laptop Lenovo YOGA S730 13IWL i5 8265U/8GB/512GB/Win10 (81J0008SVN)', 2, 4, 23000000, 'lenovo-yoga-s730-13iwl-i5-8265u-8gb-512gb-win10-8-2-208860-600x600.jpg', 'Laptop Lenovo YOGA S730 13IWL i5 là chiếc laptop văn phòng với thiết kế siêu mỏng và nhẹ, hiệu suất khá đáp ứng các nhu cầu học tập, làm việc và giải trí.', 1, '2021-01-03 05:07:57', 0, 0, 1),
(271, 'Laptop Lenovo Yoga Slim 7 14IIL05 i7 1065G7/8GB/512GB Win 10 (82A100FKVN)', 2, 4, 24000000, 'lenovo-yoga-slim-7-14iil05-i7-82a100fkvn-155820-025845-600x600.jpg', 'Laptop Lenovo Yoga Slim 7 14IIL05 i7 (82A100FKVN) thuộc dòng laptop cao cấp, Yoga Slim 7 sở hữu cấu hình mạnh mẽ trong một thiết kế mỏng nhẹ, sẵn sàng để đồng hành cùng bạn mọi lúc mọi nơi. ', 1, '2021-01-03 05:09:27', 0, 0, 1),
(272, 'Laptop Asus Gaming Rog Strix G512 i7 10750H/8GB/512GB/144Hz/4GB GTX1650Ti/Win10 (IAL001T)', 10, 4, 28000000, 'asus-gaming-rog-strix-g512-i7-ial001t-272120-022128-225687-600x600.jpg', 'Laptop Asus Gaming Rog Strix G512 i7 (IAL001T) là chiếc laptop gaming có cấu hình mạnh mẽ và thiết kế hầm hố đậm chất gaming. Máy được trang bị chip Intel Core i7 thế hệ mới nhất cùng với màn hình cao cấp chuẩn gaming giúp bạn thỏa sức chiến những tựa game cực đỉnh.', 1, '2021-01-03 05:11:52', 0, 0, 1),
(273, 'Laptop Asus ZenBook UX425EA i5 1135G7/8GB/512GB/Cáp/Túi/Win10 (BM069T)', 10, 4, 22000000, 'asus-zenbook-ux425ea-i5-bm069t-grey-new-600x600.jpg', 'Siêu phẩm Asus ZenBook UX425EA i5 (BM069T) vừa ra mắt đến từ nhà Asus sở hữu thiết kế đẹp tinh tế, di động tối ưu cùng độ bền chuẩn quân đội. Đặc biệt, chiếc máy này sở hữu con chip Intel thế hệ 11 mới nhất đến thời điểm hiện tại đem đến những tính năng hiện đại và tân tiến nhất.', 1, '2021-01-03 05:13:32', 0, 0, 1),
(274, 'Laptop Asus VivoBook X509JA i7 1065G7/8GB/512GB/Office H&S2019/Win10 (EJ232TS)', 10, 4, 18000000, 'asus-vivobook-x509ja-i7-ej232ts-vântay-220576-600x600.jpg', 'Laptop ASUS VivoBook X509JA i7 (EJ232TS) với ngoại hình hiện đại, sang trọng, cấu hình mạnh mẽ giúp bạn làm việc, giải trí thoải mái. Laptop còn trang bị bảo mật vân tay hiện đại, màn hình tràn viền để bạn thả ga sáng tạo.', 1, '2021-01-03 05:15:19', 0, 0, 1),
(275, 'Laptop HP Envy 13 aq1057TX i7 10510U/8GB/512GB/2GB MX250/Win10 (8XS68PA)', 7, 4, 29000000, 'hp-envy-13-i7-8xs68pa-220503-220503-600x600.jpg', 'Laptop HP Envy 13 aq1057TX i7 (8XS68PA) là chiếc laptop thuộc dòng HP Envy 13 vừa được ra mắt năm 2019 có cấu hình mạnh mẽ với chip Intel Core i7 thế hệ mới cùng card đồ họa rời. Máy có thiết kế siêu mỏng nhẹ phù hợp với người thường xuyên di chuyển.', 1, '2021-01-03 05:17:10', 0, 0, 1),
(276, 'Laptop HP Envy 13 ba1030TU i7 1165G7/8GB/512GB/Office H&S2019/Win10 (2K0B6PA)', 7, 4, 28000000, 'hp-envy-13-ba1030tu-i7-2k0b6pa-101820-091857-600x600.jpg', 'Laptop HP Envy 13 ba1030TU i7 (2K0B6PA) sở hữu thiết kế mỏng nhẹ cùng cấu hình cực mạnh mẽ đáp ứng đa dạng nhu cầu làm việc, giúp bạn đạt được hiệu suất làm việc tốt nhất.', 1, '2021-01-03 05:19:16', 0, 0, 1),
(277, 'Laptop Apple MacBook Pro 2020 M1/8GB/512GB (MYD92SA/A)', 6, 4, 39000000, 'apple-macbook-pro-2020-myd92saa-600x600.jpg', 'Apple Macbook Pro 2020 (MYD92SA/A) với hiệu năng cực kỳ mạnh mẽ tích hợp chip Apple M1 lần đầu xuất hiện trên MAC đã xuất hiện trên thị trường laptop, con laptop này hứa hẹn sẽ mang đến cho bạn một sản phẩm “Pro” chưa từng thấy.', 1, '2021-01-03 05:20:40', 0, 0, 1),
(278, 'Laptop Apple MacBook Air 2020 M1/8GB/256GB (MGN63SA/A)', 6, 4, 28000000, 'apple-macbook-air-2020-mgn63saa-1-600x600.jpg', 'Laptop Apple MacBook Air (MGN63SA/A) thuộc dòng laptop cao cấp sang trọng có cấu hình ổn định, thời lượng pin dài, thiết kế mỏng nhẹ sẽ đáp ứng tốt các nhu cầu làm việc của bạn.', 1, '2021-01-03 05:21:37', 0, 0, 1),
(279, 'Loa Tivi Bluetooth Mozard M103 Nâu', 13, 1, 2000000, 'loa-tivi-bluetooth-mozard-m103-nau-ava-300x300.jpg', 'Loa Tháp Bluetooth Mozard M103 nâu có phong cách thiết kế hơi hướng retro bởi sự kết hợp độc đáo giữa tông màu đen hiện đại và gam màu gỗ nâu cổ điển. Tuy phong cách thiết kế hơi hướng cổ điển những chiếc loa tháp này lại không kén không gian bài trí, dù bạn đặt nó ở phòng có thiết kế hiện đại hay truyền thống thì nó vẫn hài hòa không hề tạo ra sự lệch nhịp nào.', 1, '2021-01-03 05:29:10', 0, 0, 1),
(280, 'Loa Bluetooth Mozard E8', 13, 1, 665000000, 'loa-bluetooth-mozard-e8-600x600.jpg', 'Loa Bluetooth Mozard E8 có 2 màu sắc là đỏ và Xanh Navy đẹp mắt cho bạn dễ lựa chọn theo sở thích. Thiết kế hình trụ gọn gàng, kết cấu chắc chắn bạn có thể trực tiếp cầm trên tay để di chuyển hay cho vào balo, túi xách để mang đi xa như công tác, du lịch.', 1, '2021-01-03 05:30:22', 0, 0, 1),
(281, 'Loa Bluetooth Mozard H8030D Đen', 13, 1, 59500000, 'loa-bluetooth-mozard-h8030d-den-271920-111954-600x600.jpg', 'Loa Bluetooth Mozard có thiết kế nhỏ gọn, chắc chắn, dễ dàng mang theo bên mình khi đi du lịch, dã ngoại,...', 1, '2021-01-03 05:36:19', 0, 0, 1),
(282, 'Loa Bluetooth Mozard Y550 Plus', 13, 1, 3850000, 'loa-bluetooth-mozard-y550-plus-ava-600x600.jpg', 'Loa Bluetooth Mozard Y550 Plus có thiết kế hình lăng trụ tam giác độc đáo cùng màu đen hợp thời trang sẽ là một món phụ kiện lạ mắt dành cho những bạn trẻ. Loa có kích thước nhỏ gọn bạn có thể để vào balo hay túi xách mang đi muôn nơi, loa còn được trang bị thêm dây treo tiện lợi.', 1, '2021-01-03 05:38:13', 0, 0, 1),
(283, 'Loa Bluetooth Mozard E7', 13, 1, 4900000, 'loa-bluetooth-mozard-e7-1-600x600-1-600x600.jpg', 'Loa Bluetooth Mozard E7 có thiết kế độc đáo, lạ mắt với dạng hình trụ được bo tròn đầy thẩm mĩ. Phần loa khi bật nhạc có hiệu ứng rung âm cho cảm giác đã mắt hơn.', 1, '2021-01-03 05:39:09', 0, 0, 1),
(284, 'Tai nghe AirPods Pro sạc không dây Apple MWP22', 6, 2, 50000, 'tai-nghe-bluetooth-airpods-pro-apple-mwp22-ava-600x600.jpg', 'AirPods Pro với thiết kế gọn gàng, đẹp và tinh tế, tai nghe được thiết kế theo dạng In-ear thay vì Earbuds như AirPods 2, cho phép chống ồn tốt hơn, khó rớt khi đeo và êm tai hơn.', 1, '2021-01-03 05:42:41', 0, 0, 1),
(285, 'Tai nghe AirPods 2 Apple MV7N2', 6, 2, 30000, 'tai-nghe-bluetooth-airpods-2-apple-mv7n2-trang-avatar-1-600x600.jpg', 'Tai nghe Bluetooth AirPods 2 Apple MV7N2 Trắng vẫn giữ cho mình thiết kế hiện đại, cao cấp, hợp thời trang.', 1, '2021-01-03 05:44:13', 0, 0, 1),
(286, 'Tai nghe nhét trong EarPods Lightning Apple MMTN2', 6, 2, 7900000, 'tai-nghe-earpods-cong-lightning-apple-mmtn2-1-1-600x600.jpg', 'Tai nghe EarPods cổng Lightning Apple MMTN2 thiết kế trẻ trung với màu trắng sang trọng, tinh tế', 1, '2021-01-03 05:45:27', 0, 0, 1),
(287, 'Tai nghe nhét tai Earpods Apple MNHF2', 6, 1, 7900000, 'tai-nghe-earpods-apple-md827fea-1-600x600.jpg', 'Tai nghe Earpods Apple MNHF2 với thiết kế đẹp mắt, kiểu dáng quen thuộc trẻ trung', 1, '2021-01-03 05:47:10', 0, 0, 1),
(288, 'Tai nghe EP Kanen IP-225', 5, 1, 1050000, 'tai-nghe-ep-kanen-ip-225-add-600x600.jpg', 'Tai nghe có dây thương hiệu Kanen, có màu sắc trẻ trung, thiết kế nhỏ gọn, tiện lợi', 1, '2021-01-03 05:49:11', 0, 0, 1),
(289, 'Tai nghe Bluetooth Kanen K9', 5, 1, 3150000, 'tai-nghe-bluetooth-kanen-k9-avatar-600x600.jpg', 'Công nghệ bluetooth 4.1 cho khoảng cách kết nối lên đến 10m. Có thể gọi nhanh, nghe nhạc, tạo cuộc hẹn, v.v.. thông qua Siri hay Google Voice. Đệm tai nghe dày, thoải mái khi sử dụng khoảng thời gian dài.Dung lượng pin: 300 mAh, cho thời gian sử dụng có thể lên đến 10 giờ, thời gian sạc khoảng 2 giờ.', 1, '2021-01-03 05:51:53', 0, 0, 1),
(290, 'Tai nghe Bluetooth Kanen K9', 5, 1, 3150000, 'tai-nghe-bluetooth-kanen-k9-avatar-600x600.jpg', 'Công nghệ bluetooth 4.1 cho khoảng cách kết nối lên đến 10m. Có thể gọi nhanh, nghe nhạc, tạo cuộc hẹn, v.v.. thông qua Siri hay Google Voice. Đệm tai nghe dày, thoải mái khi sử dụng khoảng thời gian dài.Dung lượng pin: 300 mAh, cho thời gian sử dụng có thể lên đến 10 giờ, thời gian sạc khoảng 2 giờ.', 1, '2021-01-03 05:52:02', 0, 0, 1),
(291, 'Tai nghe nhét trong Kanen S40 Xanh lá', 5, 2, 1400000, 'tai-nghe-nhet-trong-kanen-s40-xanh-la-1-1-600x600.jpg', 'Tai nghe dạng móc vào trong vành tai. Phù hợp để đeo khi tập thể dục hay hoạt động mạnh. Tai nghe dạng nút giúp cách âm tốt với bên ngoài. Có nút ấn nhận cuộc gọi, ngừng/chơi nhạc, tăng/giảm âm lượng. Dây dài 120 cm thoải mái để vừa vận động vừa nghe nhạc', 1, '2021-01-03 05:54:37', 0, 0, 1),
(292, 'Tai nghe chụp tai Kanen IP-892', 5, 2, 2450000, 'tai-nghe-chup-tai-kanen-ip-892-2-5-600x600.jpg', 'Tai nghe chụp tai Kanen IP-892 - Khoảng cách nới lỏng tai nghe Tai nghe sử dụng được cho điện thoại, máy tính bảng, laptop, máy nghe nhạc...\r\nTai nghe chụp tai Kanen IP-892 tương thích với nhiều thiết bị. Nút ấn tương tác tốt trên tai nghe Kanen Với ứng dụng nghe nhạc mặc định, có thể tăng giảm âm lượng, nhận cuộc gọi, ngừng/chơi nhạc, ấn nút tròn 2 lần để chuyển bài hát.  Với ứng dụng nghe nhạc online, bạn không thể ấn để chuyển bài. Tai nghe chụp tai Kanen IP-892 -  Nút ấn tương tác tốt', 1, '2021-01-03 05:58:18', 0, 0, 1),
(293, 'Tai nghe chụp tai Kanen IP-2090', 5, 2, 2450000, 'tai-nghe-chup-tai-kanen-ip-2090-2-3-600x600.jpg', 'Có thể gấp gọn khi muốn cho vào trong balo. Lớp đệm tai êm và dày, giúp đeo tai thoải mái và hạn chế bị rách. Có thể kéo dãn tai nghe 3 cm để vừa vặn hơn khi sử dụng. Tương thích với hầu hết điện thoại hiện nay. Có nút nhận cuộc gọi, phát/dừng chơi nhạc, tăng giảm âm lượng. Dây dài lên đến 1.5 m thoải mái để vừa dùng máy vừa nghe nhạc.', 1, '2021-01-03 06:02:31', 0, 0, 1),
(294, 'Tai nghe chụp tai Kanen IP-950', 5, 2, 2450000, 'tai-nghe-chup-tai-kanen-ip-9500-2-600x600.jpg', 'Jack cắm 3.5 mm. Độ dài dây 1 m. Phím điều khiển Mic thoại, Nghe/nhận cuộc gọi, Phát/dừng chơi nhạc, Chuyển bài há', 1, '2021-01-03 06:03:52', 0, 0, 1),
(295, 'Tai nghe Bluetooth Samsung Level U Pro BN920C', 8, 2, 100000, 'tai-nghe-bluetooth-samsung-level-u-pro-bn920c-add-600x600.jpg', 'Tai nghe Samsung Level U Pro BN920C được thiết kế sang trọng. Toàn thân tai nghe được gia công bằng vỏ nhựa và cao su, phần cao su sẽ giúp tai nghe tiếp xúc với da trơn hơn, thoải mái hơn.', 1, '2021-01-03 06:11:15', 0, 0, 1),
(296, 'Tai nghe Bluetooth Samsung MG900E', 8, 2, 8500000, 'tai-nghe-bluetooth-samsung-mg900e-add-600x600.jpg', 'Tai nghe Bluetooth Samsung MG900E có 2 màu đen - trắng, kiểu dáng nhỏ gọn, vỏ nhựa cho trọng lượng nhẹ', 1, '2021-01-03 06:12:48', 0, 0, 1),
(297, 'Tai nghe Bluetooth True Wireless LG HBS-FN6', 3, 2, 300000, 'tai-nghe-bluetooth-true-wireless-lg-hbs-fn6-ava-600x600.jpg', 'Thiết kế với màu đen sành điệu, hoặc màu trắng hiện đại, dễ dàng thu phục mọi người dùng. Tai nghe Bluetooth True Wireless LG HBS-FN6 kích thước nhỏ gọn với hộp sạc vừa vặn trong lòng bàn tay, dễ dàng để bạn mang theo đến mọi nơi', 1, '2021-01-03 06:13:46', 0, 0, 1),
(298, 'Tai nghe Bluetooth LG HBS-1120 Đen', 3, 2, 300000, 'tai-nghe-bluetooth-lg-hbs-1120-den-1-600x600-1-600x600.jpg', 'Tai nghe Bluetooth LG HBS-1120 thiết kế cao cấp, tinh xảo, nổi bật khi đeo. Thiết kế tinh xảo, nổi bật - Tai nghe Bluetooth LG HBS-1120 Đen. Đệm tai nghe mềm mại, nút tai có thể thu vào tiện lợi, đảm bảo mang đến trải nghiệm thoải mái, dễ chịu nhất', 1, '2021-01-03 06:15:02', 0, 0, 1),
(299, 'Tai nghe Bluetooth LG HBS-780', 3, 2, 1000000, 'tai-nghe-bluetooth-lg-hbs-780-add-600x600-1-600x600.jpg', 'Tai nghe LG HBS-780 với thiết kế dạng vòng đeo cổ gọn gàng, cao cấp, phù hợp cho người trẻ trung, năng động. Tai nghe có 5 màu: đỏ, xanh dương, đen, trắng và vàng đồng cho bạn tha hồ lựa chọn màu sắc phù hợp với cá tính của mình ', 1, '2021-01-03 06:15:59', 0, 0, 1),
(300, 'Apple Watch SE LTE 40mm viền nhôm dây cao su', 6, 3, 1045610, 'apple-watch-se-lte-40mm-vien-nhom-day-cao-su-thumb-hong-600x600.jpg', 'Dù không có nhiều thay đổi so với những phiên bản trước nhưng chiếc đồng hồ Apple Watch SE LTE vẫn mang trong mình nét tinh tế và sang trọng của một chiếc đồng hồ cao cấp với những chi tiết được gia công tinh xảo, chất liệu cao cấp (khung viền được làm từ 100% từ nhôm tái chế), dây đeo êm tay, mang đến sự nổi bật khi người dùng đeo chiếc đồng hồ trên tay. ', 1, '2021-01-03 06:18:41', 0, 0, 1),
(301, 'Vòng tay thông minh Samsung Galaxy Fit2 đỏ', 8, 3, 750123, 'samsung-galaxy-fit2-do-1-600x600.jpg', 'Mang nét hiện đại, trẻ trung, Samsung Galaxy Fit2 đỏ được trang bị màn hình có kích thước 1.1 inch, sử dụng tấm nền AMOLED cùng độ phân giải 126 x 294 pixels cho khả năng hiển thị thông báo, hình ảnh tốt. Dây đeo silicone bền bỉ, nhẹ nhàng, không thấm nước, thiết kế dạng rãnh giúp ngăn sự tích tụ mồ hôi.  ', 1, '2021-01-03 06:19:53', 0, 0, 1),
(302, 'Samsung Galaxy Watch 3 45mm titanium', 8, 3, 14000123, 'samsung-galaxy-watch-3-45mm-titanium-263520-043508-600x600.jpg', 'Thay cho chất liệu thép không gỉ thông thường cho những mẫu Samsung Galaxy Watch 3, giờ đây chiếc đồng hồ Samsung Galaxy Watch 3 45mm titanium được trang bị dây đeo Titanium nhẹ và sang trọng. Kết hợp cùng lớp màu Mystic Black độc quyền với nét đẹp huyền bí, tinh tế giúp cho mẫu đồng hồ này trở nên đặc biệt và cao cấp hơn hẳn những phiên bản khác ', 1, '2021-01-03 06:21:20', 0, 0, 1),
(303, 'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone', 8, 3, 5500000, 'samsung-galaxy-watch-active-2-44-mm-sillicon-thumm-600x600.jpg', 'Đồng hồ thông minh Samsung Galaxy Watch Active 2 cải tiến hơn với màn hình chống chói, hiển thị thông tin sắc nét. Các tiện ích khác cũng được nâng cấp nhằm mang lại sự tiện lợi nhất cho người dùng ', 1, '2021-01-03 06:22:36', 0, 0, 1),
(304, 'Samsung Galaxy Watch 3 45mm viền thép đen dây da', 8, 3, 9000000, 'samsung-galaxy-watch-3-45mm-600x600.jpg', 'Đồng hồ thông minh Galaxy Watch 3 45 mm sở hữu phong cách thiết kế thanh lịch, cổ điển với viền mặt bằng thép và chất liệu dây da. Dây da được chế tác một cách tinh xảo, mang lại vẻ đẹp sang trọng cho thiết bị ', 1, '2021-01-03 06:23:34', 0, 0, 1),
(305, 'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone hồng', 8, 3, 4000000, 'samsung-galaxy-watch-active-2-40-mm--thum-600x600.jpg', 'Đồng hồ thông minh Samsung Galaxy Watch Active 2 40 mm là phiên bản nhỏ gọn của dòng sản phẩm. Với các tính năng chăm sóc sức khỏe, màn hình cải tiến với viền cảm ứng mang lại trải nghiệm hoàn hảo cho người dùng. ', 1, '2021-01-03 06:24:56', 0, 0, 1),
(306, 'Samsung Galaxy Watch 3 41mm viền thép bạc dây da', 8, 3, 9000000, 'samsung-galaxy-watch-3-41mm-bac-054220-104255-600x600.jpg', 'Samsung Galaxy Watch 3 41mm viền thép bạc dây da sở hữu 2 nút bấm và vòng bezel xoay điều khiển vật lý độc đáo. Màn hình 1.2 inch cùng độ phân giải 360 x 360 pixels giúp hình ảnh hiển thị được chân thật, rõ nét. Viền đồng hồ được làm bằng thép cứng cáp cùng dây đeo bằng da tạo cảm giác chắc chắn và dễ chịu cho người dùng khi đeo. ', 1, '2021-01-03 06:25:48', 0, 0, 1),
(307, 'Đồng hồ thông minh Mi Watch', 4, 3, 3000000, 'mi-watch-255520-015535-200x200.jpg', 'Đồng hồ thông minh Mi Watch này mang phong cách trẻ trung, cá tính và đậm chất thể thao. Đồng hồ được trang bị công nghệ màn hình AMOLED với kích thước 1.39 inch cùng độ phân giải 454 x 454 pixels và độ sáng lên đến 450 nits giúp người dùng có thể quan sát thông tin rõ nét, chất lượng. Bên cạnh đó, đồng hồ còn được trang bị mặt kính cường lực Gorilla Glass 3 hạn chế trầy xước và tăng độ bền cho thiết bị. ', 1, '2021-01-03 06:28:38', 0, 0, 1),
(308, 'Vòng đeo tay thông minh Mi Band 5', 4, 3, 690000, 'mi-band-5-thum-600x600.jpg', 'Vòng đeo tay thông minh Mi Band 5 có màn hình 1.1 inch cùng độ phân giải là 126 x 294 pixels, lớn hơn so với phiên bản 0.95 inch của Mi Band 4. Mật độ điểm ảnh trên Mi Band 5 được nâng cấp lên đến 300ppi, vì thế người dùng có thể quan sát các thông báo rõ ràng trên màn hình. Dây đeo làm từ silicone với thiết kế ôm trọn cổ tay, mang lại cảm giác vô cùng mềm mại và không bị phai màu khi sử dụng sau một thời gian dài ', 1, '2021-01-03 06:29:41', 0, 0, 1),
(309, 'Huawei Watch GT2 Pro 46mm dây silicone', 1, 1, 8190000, 'watch-gt2-pro-46mm-day-silicone-ava-600x600.jpg', 'Huawei Watch GT2 Pro 46mm dây silicone với thiết kế vỏ bằng titan, mặt đồng hồ làm bằng kính sapphire và mặt lưng bằng gốm tạo nên vẻ đẹp cao cấp, sang trọng. Sở hữu màn hình AMOLED 1.39 inch có độ phân giải 454 x 454 pixels, cho hình ảnh được hiển thị sắc nét, chi tiết hơn. Thiết kế dây đeo silicone mềm mai, không bị khó chịu khi dùng trong thời gian dài. ', 1, '2021-01-03 06:31:00', 0, 0, 1),
(310, 'Điện thoại iPhone 12 128GB eee', 6, 5, 24990000, '1609678251iphone-12-trang-new-600x600-600x600.jpg', 'Mới đây, Apple đã trình diện đến người dùng mẫu điện thoại iPhone 12 128 GB với sự tuyên bố về một kỷ nguyên mới của iPhone: iPhone 5G siêu nhanh, nâng cấp về màn hình và hiệu năng hứa hẹn đây sẽ là smartphone cao cấp đáng chú ý nhất trong năm nay.  ', 1, '2021-01-03 12:50:51', 0, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `protypes`
--

CREATE TABLE `protypes` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `protypes`
--

INSERT INTO `protypes` (`type_id`, `type_name`) VALUES
(1, 'Loa'),
(2, 'Tai nghe'),
(3, 'Đồng hồ'),
(4, 'Máy Tính'),
(5, 'Điện Thoại');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_`
--

CREATE TABLE `user_` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_`
--

INSERT INTO `user_` (`username`, `password`, `fullname`, `email`, `birthdate`, `gender`, `phone`, `role`, `status`) VALUES
('123', '$2y$10$ijicWUVPk3lkteh4C0f.8uSk34A/GR6RODQoxS46eFr6kdnfAFRtm', '123', 'truongmonster150851@gmail.com', '15/01/2001', 'male', '1692876336', 0, 1),
('a', '$2y$10$t9J9OqQ4Zxm71xOB8MvCaO9G30nkumrpFa6R31V1TWta08cBvAoTK', 'a', 'truongmonster150851@gmail.com', '15/01/2001', 'male', '1692876336', 0, 0),
('admin', '$2y$10$pX55RhOdS/Ef.7UYKlzNA.OCT.Q9kG1zV4zsnN8eg8U.zv221c2Qm', 'Nguyen Ngoc Truong', 'truong@gmail.com', '01/15/2020', 'Male', '0392876336', 1, 1),
('dg', '$2y$10$2KW.VHKO7.ukbQq6bJO5/euBACcZ1H8mwasbC5W3Ud5fo1YSkkFbG', '456', 'truongmonster150851@gmail.com', '15/01/2001', 'male', '1692876336', 0, 0),
('nhom 5', '$2y$10$A68dJD383j.SWvW8.nuGiO3pARsod16MfRsoNnCP.zUZ99TC9Bf.O', 'Nguyễn Ngọc Trường', 'truongmonster150851@gmail.com', '15/01/2001', 'male', '1692876336', 0, 1),
('user1', '$2y$10$pX55RhOdS/Ef.7UYKlzNA.OCT.Q9kG1zV4zsnN8eg8U.zv221c2Qm', 'Nguyễn Ngọc Trường', 'truong@gmail.com', '01/15/2020', 'Male', '0392876336', 0, 1),
('user2', '$2y$10$hKA1lHRdV7Xt9UEm/GvAb.Lm0qyd6SF2rzqbfiPb6CKImgDbWvhCO', 'Nguyễn Ngọc Trường', 'truongmonster150851@gmail.com', '15/01/2001', 'male', '1692876336', 0, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id_product`,`username`,`status`) USING BTREE,
  ADD KEY `username` (`username`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_product`,`username`),
  ADD KEY `username` (`username`);

--
-- Chỉ mục cho bảng `evalute`
--
ALTER TABLE `evalute`
  ADD PRIMARY KEY (`username`,`id_product`);

--
-- Chỉ mục cho bảng `manufactures`
--
ALTER TABLE `manufactures`
  ADD PRIMARY KEY (`manu_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK01_products` (`manu_id`),
  ADD KEY `FK02_Products` (`type_id`);

--
-- Chỉ mục cho bảng `protypes`
--
ALTER TABLE `protypes`
  ADD PRIMARY KEY (`type_id`);

--
-- Chỉ mục cho bảng `user_`
--
ALTER TABLE `user_`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `manufactures`
--
ALTER TABLE `manufactures`
  MODIFY `manu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT cho bảng `protypes`
--
ALTER TABLE `protypes`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user_` (`username`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user_` (`username`);

--
-- Các ràng buộc cho bảng `evalute`
--
ALTER TABLE `evalute`
  ADD CONSTRAINT `evalute_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user_` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
