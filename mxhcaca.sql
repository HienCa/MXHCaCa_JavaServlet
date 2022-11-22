-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 20, 2022 lúc 05:52 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mxhcaca`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `UserID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL,
  `CommentsContent` varchar(250) NOT NULL,
  `CommentsDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversation`
--

CREATE TABLE `conversation` (
  `ConversationID` int(11) NOT NULL,
  `ConversationName` varchar(200) DEFAULT NULL,
  `TimeConv` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `conversation`
--

INSERT INTO `conversation` (`ConversationID`, `ConversationName`, `TimeConv`) VALUES
(1, 'CVG', NULL),
(3, NULL, '2022-11-18 14:44:41'),
(13, NULL, '2022-11-18 14:47:11'),
(16, NULL, '2022-11-18 14:51:25'),
(17, NULL, '2022-11-19 14:52:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversationdetail`
--

CREATE TABLE `conversationdetail` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ConversationID` int(11) NOT NULL,
  `NickName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `conversationdetail`
--

INSERT INTO `conversationdetail` (`ID`, `UserID`, `ConversationID`, `NickName`) VALUES
(1, 1, 1, 'Tuấn Bảo'),
(2, 2, 1, 'Văn Hiền'),
(6, 3, 1, 'Hoàng Anh'),
(7, 1, 3, 'Bảo Ca'),
(8, 3, 3, 'Hoàng Anh'),
(17, 1, 13, 'Tuấn Bảo'),
(18, 4, 13, 'Dũng Lê'),
(23, 1, 16, 'Tuấn Bảo'),
(24, 5, 16, 'Thanh Hải'),
(25, 1, 17, 'Tuấn Bảo'),
(26, 2, 17, 'Văn Hiền');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `likes`
--

CREATE TABLE `likes` (
  `UserID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `messagesID` int(11) NOT NULL,
  `MessagesContent` varchar(250) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `ConversationdetailID` int(11) NOT NULL,
  `Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`messagesID`, `MessagesContent`, `Image`, `ConversationdetailID`, `Time`) VALUES
(17, 'Hi, H.A!', NULL, 7, '2022-11-17 15:13:40'),
(18, 'Hi, Bảo!', NULL, 8, '2022-11-17 15:13:40'),
(19, 'Hi, qq!', NULL, 7, '2022-11-17 15:14:46'),
(23, 'a', NULL, 17, '2022-11-18 12:57:20'),
(27, 'w', NULL, 17, '2022-11-18 14:27:06'),
(28, 'a', NULL, 17, '2022-11-18 14:28:35'),
(29, 's', NULL, 17, '2022-11-18 14:28:39'),
(30, 'chao', NULL, 7, '2022-11-18 14:44:41'),
(31, 'f', NULL, 17, '2022-11-18 14:44:48'),
(35, 'sdddd', NULL, 17, '2022-11-18 14:47:11'),
(38, 'a', NULL, 23, '2022-11-18 14:51:25'),
(39, 'Hello', NULL, 25, '2022-11-19 14:52:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `relation`
--

CREATE TABLE `relation` (
  `UserID` int(50) NOT NULL,
  `FUserID` int(50) NOT NULL,
  `TrangThai` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `relation`
--

INSERT INTO `relation` (`UserID`, `FUserID`, `TrangThai`) VALUES
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 1),
(1, 9, 1),
(1, 10, 1),
(1, 11, 1),
(1, 13, 0),
(2, 1, 2),
(2, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),
(3, 1, 2),
(3, 2, 1),
(3, 4, 1),
(3, 5, 1),
(3, 6, 1),
(3, 7, 1),
(3, 8, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(4, 5, 1),
(4, 6, 1),
(4, 7, 1),
(4, 8, 1),
(5, 1, 1),
(5, 2, 1),
(5, 3, 1),
(5, 4, 1),
(5, 6, 1),
(5, 7, 1),
(5, 8, 1),
(6, 1, 1),
(6, 2, 1),
(6, 3, 1),
(6, 4, 1),
(6, 5, 1),
(6, 7, 1),
(6, 8, 1),
(7, 1, 1),
(7, 2, 1),
(7, 3, 1),
(7, 4, 1),
(7, 5, 1),
(7, 6, 1),
(7, 8, 1),
(8, 1, 1),
(8, 2, 1),
(8, 3, 1),
(8, 4, 1),
(8, 5, 1),
(8, 6, 1),
(8, 7, 1),
(9, 1, 1),
(10, 1, 1),
(11, 1, 1),
(13, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `StatusID` int(11) NOT NULL,
  `StatusCaption` varchar(250) DEFAULT NULL,
  `StatusImages` varchar(250) DEFAULT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`StatusID`, `StatusCaption`, `StatusImages`, `likes`) VALUES
(1, 'Thương em', 'anhdoi.jpg', 0),
(3, 'cfc', 'anhdoi.jpg', 0),
(4, 'aaaa', NULL, 0),
(5, 'buồn...', 'anhbuongtayroido.mp4', 0),
(6, 'buồn...', 'anhVN.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `upload`
--

CREATE TABLE `upload` (
  `UserID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL,
  `DateTimeUpload` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `upload`
--

INSERT INTO `upload` (`UserID`, `StatusID`, `DateTimeUpload`) VALUES
(1, 1, '2022-10-15 00:00:00'),
(2, 4, '2022-10-14 00:00:00'),
(3, 3, '2022-10-15 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FULLNAME` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(50) NOT NULL,
  `Avt` varchar(30) DEFAULT 'defaultImage.png',
  `AnhBia` varchar(30) DEFAULT NULL,
  `Hometown` varchar(200) DEFAULT NULL,
  `School` varchar(200) DEFAULT NULL,
  `Relationship` varchar(50) DEFAULT NULL,
  `Hobbies` varchar(200) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `FULLNAME`, `Username`, `Email`, `Password`, `Avt`, `AnhBia`, `Hometown`, `School`, `Relationship`, `Hobbies`, `Active`) VALUES
(1, 'Tuấn Bảo', '0353045164', NULL, '10052001', 'anhdoi.jpg', 'anhdoi.jpg', '', '', '', '', 0),
(2, 'Văn Hiền', 'tuanbao.1005@gmail.com', NULL, '10052001', 'nvhh.jpg', NULL, '', '', '', '', 0),
(3, 'Kuroba Z Kaitou', '0353045161', NULL, '10052001', 'pha.jpg', NULL, '', '', '', '', 1),
(4, 'Dũng Lê', '0353045162', NULL, '10052001', 'lenguyenanhdung.jpg', NULL, '', '', '', '', 0),
(5, 'Thanh Hải', '0353045163', NULL, '10052001', 'phanthanhhai.jpg', NULL, '', '', '', '', 1),
(6, 'Phan Minh Tài', '0353045165', NULL, '10052001', 'pmt.jpg', NULL, '', '', '', '', 0),
(7, 'Minh Trần', '0353045166', NULL, '10052001', 'tranbaminh.jpg', NULL, '', '', '', '', 0),
(8, 'Nguyên Di', '0353045167', NULL, '10052001', 'lhnd.jpg', NULL, '', '', '', '', 0),
(9, 'Hoàng Anh', '0353045168', NULL, '10052001', 'kzt.jpg', NULL, '', '', '', '', 0),
(10, 'Bảo Bảo', '0353045169', NULL, '10052001', 'kzt.jpg', NULL, '', '', '', '', 0),
(11, 'Ngọc Yến', '0353045170', NULL, '10052001', 'ntb.jpg', NULL, '', '', '', '', 0),
(12, 'Anh Dũng Nguyễn', 'AnhDungNguyen', NULL, '123123', 'defaultImage.png', NULL, NULL, NULL, NULL, NULL, 1),
(13, 'Hien Ca', '0123456', NULL, '10052001', 'defaultImage.png', NULL, NULL, NULL, NULL, NULL, 1),
(14, 'Hien Bế', 'hienbe', NULL, '123123', 'h1.png', 'anhVN.jpg', NULL, NULL, NULL, NULL, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`UserID`,`StatusID`),
  ADD KEY `FK-StatusCmt` (`StatusID`);

--
-- Chỉ mục cho bảng `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`ConversationID`);

--
-- Chỉ mục cho bảng `conversationdetail`
--
ALTER TABLE `conversationdetail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_User_Users` (`UserID`),
  ADD KEY `FK_Conv_Convs` (`ConversationID`);

--
-- Chỉ mục cho bảng `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`UserID`,`StatusID`),
  ADD KEY `FK-StatusLike` (`StatusID`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messagesID`),
  ADD KEY `FK_MessConvdID_ConvdID` (`ConversationdetailID`) USING BTREE;

--
-- Chỉ mục cho bảng `relation`
--
ALTER TABLE `relation`
  ADD PRIMARY KEY (`UserID`,`FUserID`),
  ADD KEY `FK_FU_U` (`FUserID`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`StatusID`);

--
-- Chỉ mục cho bảng `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`UserID`,`StatusID`),
  ADD KEY `FK-StatusUpload` (`StatusID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `conversation`
--
ALTER TABLE `conversation`
  MODIFY `ConversationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `conversationdetail`
--
ALTER TABLE `conversationdetail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `messagesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK-StatusCmt` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`),
  ADD CONSTRAINT `FK-UserCmt` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `conversationdetail`
--
ALTER TABLE `conversationdetail`
  ADD CONSTRAINT `FK_Conv_Convs` FOREIGN KEY (`ConversationID`) REFERENCES `conversation` (`ConversationID`),
  ADD CONSTRAINT `FK_User_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `FK-StatusLike` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`),
  ADD CONSTRAINT `FK-UserLike` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `FK_cd_Convd` FOREIGN KEY (`ConversationdetailID`) REFERENCES `conversationdetail` (`ID`);

--
-- Các ràng buộc cho bảng `relation`
--
ALTER TABLE `relation`
  ADD CONSTRAINT `FK_FU_U` FOREIGN KEY (`FUserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `FK_U_U` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `FK-StatusUpload` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`),
  ADD CONSTRAINT `FK-UserUpload` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
