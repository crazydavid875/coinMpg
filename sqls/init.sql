-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Aug 07, 2021 at 04:01 PM
-- Server version: 8.0.26
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE USER 'coursemap'@'%' IDENTIFIED WITH mysql_native_password BY 'coursemap';GRANT USAGE ON *.* TO 'coursemap'@'%';ALTER USER 'coursemap'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

GRANT ALL PRIVILEGES ON `coursemap`.* TO `coursemap`@`%`;
--
-- Database: `coursemap`
--
CREATE DATABASE IF NOT EXISTS `coursemap` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `coursemap`;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int NOT NULL,
  `name` char(50) NOT NULL,
  `description` char(100) NOT NULL,
  `level` char(50) NOT NULL,
  `department` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `description`, `level`, `department`) VALUES
(48, '設計思考', '設計思考是設計師對於問題進行深入探究以發展出解決方案的方法。透過使用者的同理以定義問題的本質，再進行設計展開、構想驗證以使其設計更具有使用者中心的思維。', '0', '設計'),
(49, '設計繪畫', '繪畫是設計表現的基本工具。透過自身的視覺感受、觀察與思考並以繪畫形式表現出來，可以有效與快速地成為與其他領域專家溝通的橋樑。', '0', '設計'),
(50, '設計思考工具與方法', '設計思考涵蓋了從問題的探索到解決方案的提出整個流程，每一個步驟設計師都需要了解如何選擇與運用適當的方法與策略。', '1', '設計'),
(51, 'UIUX', '在設計任何互動產品或網站時，都應了解人們如何透過介面與產品進行互動。使用者介面(UI)與使用者體驗(UX)將會是判斷一個產品或服務是否成功的關鍵。', '1', '設計'),
(52, '行動裝置應用與側畫', '生活中許多事情都可以透過行動裝置中的應用程式進行處理，學習如何規劃與開發符合使用者需求的應用程式是一門重要的學問。', '1', '設計'),
(53, '跨領域創新整合應用', '不同的互動介面具有不同的特質，對於使用者的意義也不一樣。能夠整合適當的技術於對應的應用情境，進而提出對於目標族群有意義與價值的設計是設計師的目標。', '2', '設計'),
(54, '服務設計', '在先進科技的支持下，產品形式不再限於實體的物件，而擴及無形的服務體驗。如何規劃與設計一個好的服務體驗將會是設計師設計一個產品必備的技能之一。', '2', '設計'),
(55, '產品開發策略', '產品開發策略', '2', '設計'),
(56, '設計美學色彩學', '培養好的美感是學習設計最基本與重要的。設計師要能將設計的意義、透過使用者的感官進行訊息的傳遞，使其對於產品理解與產生情感的連結。', '0', '設計'),
(57, '色彩學', '色彩學', '0', '設計'),
(58, '電腦動畫', '不同於靜態的視覺呈現，動畫能透用視覺與聽覺的結合，搭配適當的敘事過程完整表現設計師所欲傳遞給使用者的故事情境。相關的製作概念與方法都是必備的。', '1', '設計'),
(59, '互動影音', '互動設計領域是很新的一個領域，可以透過互動裝置的設計概念與藝術美感帶給觀者無限可能的體驗與想像空間。', '1', '設計'),
(60, '攝影', '攝影', '1', '設計'),
(61, '互動專題企畫', '互動專題企畫', '2', '設計'),
(106, '程式設計', '程式設計', '0', '資訊'),
(111, '物聯網系統軟體介紹', '物聯網系統軟體介紹', '0', '資訊'),
(112, '物聯網系統簡介', '物聯網系統簡介', '0', '資訊'),
(113, 'HTML5程式開發', 'HTML5程式開發', '1', '資訊'),
(114, '行動裝置應用程式設計', '行動裝置應用程式設計', '1', '資訊'),
(115, 'Web基本原理', 'Web基本原理', '1', '資訊'),
(116, '新世代物聯網', '新世代物聯網', '2', '資訊'),
(117, 'Web新興技術', 'Web新興技術', '2', '資訊'),
(120, '智慧感測系統整合運用', '智慧感測系統整合運用', '2', '資訊'),
(121, '行動應用服務研發及內容設計', '行動應用服務研發及內容設計', '2', '資訊'),
(131, 'HTML5程式設計', 'HTML5程式設計', '1', '資訊'),
(132, 'Web技術', 'Web技術', '1', '資訊'),
(134, '物聯網網際服務與應用', '物聯網網際服務與應用', '2', '資訊'),
(142, '巨量資料入門與實務', '巨量資料入門與實務', '2', '資訊'),
(148, '電腦圖學導論', '電腦圖學導論', '0', '資訊'),
(149, '人機介面設計', '人機介面設計', '1', '資訊'),
(156, '智慧終端整合', '智慧終端整合', '2', '資訊'),
(159, 'WebXR', 'WebXR', '2', '資訊'),
(170, '體感互動設計', '體感互動設計', '2', '資訊');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int NOT NULL,
  `name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(2, '設計'),
(1, '資訊');

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE `field` (
  `id` int NOT NULL,
  `name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `field`
--

INSERT INTO `field` (`id`, `name`) VALUES
(2, '介面感知'),
(1, '智慧互聯網');

-- --------------------------------------------------------

--
-- Table structure for table `mapping_course_reference`
--

CREATE TABLE `mapping_course_reference` (
  `id` int NOT NULL,
  `cid` int NOT NULL,
  `rid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mapping_course_reference`
--

INSERT INTO `mapping_course_reference` (`id`, `cid`, `rid`) VALUES
(2, 48, 10),
(3, 48, 11),
(4, 48, 12),
(5, 48, 13),
(6, 48, 14),
(7, 48, 15),
(8, 48, 16),
(9, 48, 17),
(10, 48, 18),
(11, 48, 19),
(12, 56, 20),
(13, 56, 21),
(14, 57, 22),
(15, 58, 23),
(16, 58, 24),
(17, 58, 25),
(18, 58, 26),
(19, 58, 27),
(20, 58, 28),
(21, 59, 29),
(22, 59, 30),
(23, 59, 31),
(24, 59, 32),
(25, 60, 33),
(26, 60, 34),
(27, 51, 35),
(28, 51, 36),
(29, 51, 37),
(30, 51, 38),
(31, 51, 39),
(32, 51, 40),
(33, 51, 41),
(34, 53, 42),
(35, 53, 43),
(36, 53, 44),
(37, 53, 45),
(38, 61, 46),
(39, 61, 47),
(40, 61, 48),
(41, 61, 49),
(42, 48, 10),
(43, 48, 11),
(44, 48, 12),
(45, 48, 135),
(46, 48, 14),
(47, 48, 15),
(48, 48, 17),
(49, 48, 18),
(50, 48, 140),
(51, 48, 19),
(52, 56, 142),
(53, 56, 20),
(54, 56, 21),
(55, 57, 22),
(56, 58, 23),
(57, 58, 24),
(58, 58, 25),
(59, 58, 26),
(60, 58, 27),
(61, 58, 28),
(62, 59, 29),
(63, 59, 30),
(64, 59, 31),
(65, 59, 32),
(66, 60, 33),
(67, 60, 34),
(68, 51, 36),
(69, 51, 37),
(70, 51, 38),
(71, 51, 39),
(72, 51, 40),
(73, 51, 163),
(74, 53, 164),
(75, 53, 42),
(76, 53, 43),
(77, 53, 44),
(78, 53, 45),
(79, 61, 47),
(80, 61, 170),
(81, 61, 49),
(82, 48, 10),
(83, 48, 11),
(84, 48, 12),
(85, 48, 13),
(86, 48, 15),
(87, 48, 16),
(88, 48, 140),
(89, 49, 179),
(90, 49, 180),
(91, 50, 14),
(92, 50, 17),
(93, 50, 18),
(94, 50, 19),
(95, 51, 35),
(96, 51, 36),
(97, 51, 37),
(98, 51, 38),
(99, 51, 39),
(100, 51, 40),
(101, 51, 41),
(102, 52, 48),
(103, 52, 193),
(104, 52, 194),
(105, 52, 195),
(106, 52, 196),
(107, 52, 197),
(108, 52, 198),
(109, 53, 199),
(110, 53, 200),
(111, 53, 201),
(112, 53, 202),
(113, 53, 203),
(114, 53, 204),
(115, 54, 205),
(116, 54, 206),
(117, 54, 207),
(118, 55, 208),
(119, 55, 209),
(120, 55, 210),
(121, 55, 196),
(122, 55, 212),
(123, 48, 10),
(124, 48, 11),
(125, 48, 12),
(126, 48, 13),
(127, 48, 135),
(128, 48, 15),
(129, 48, 16),
(130, 48, 140),
(131, 49, 179),
(132, 49, 180),
(133, 50, 14),
(134, 50, 17),
(135, 50, 18),
(136, 50, 19),
(137, 51, 36),
(138, 51, 37),
(139, 51, 38),
(140, 51, 39),
(141, 51, 40),
(142, 51, 163),
(143, 51, 41),
(144, 52, 170),
(145, 52, 193),
(146, 52, 194),
(147, 52, 195),
(148, 52, 196),
(149, 52, 197),
(150, 52, 198),
(151, 53, 199),
(152, 53, 200),
(153, 53, 203),
(154, 53, 244),
(155, 53, 245),
(156, 53, 246),
(157, 54, 205),
(158, 54, 206),
(159, 54, 207),
(160, 55, 208),
(161, 55, 209),
(162, 53, 196),
(163, 106, 253),
(164, 106, 254),
(165, 106, 255),
(166, 106, 256),
(167, 106, 257),
(168, 111, 258),
(169, 112, 259),
(170, 113, 260),
(171, 114, 261),
(172, 115, 262),
(173, 116, 263),
(174, 117, 264),
(175, 117, 265),
(176, 116, 266),
(177, 120, 267),
(178, 121, 268),
(179, 120, 269),
(180, 116, 270),
(181, 106, 253),
(182, 106, 254),
(183, 106, 255),
(184, 106, 256),
(185, 106, 257),
(186, 111, 258),
(187, 112, 259),
(188, 131, 260),
(189, 132, 279),
(190, 114, 261),
(191, 134, 281),
(192, 134, 282),
(193, 134, 263),
(194, 117, 264),
(195, 117, 265),
(196, 117, 286),
(197, 134, 266),
(198, 121, 268),
(199, 142, 289),
(200, 106, 253),
(201, 106, 254),
(202, 106, 255),
(203, 106, 256),
(204, 106, 257),
(205, 148, 281),
(206, 149, 296),
(207, 149, 297),
(208, 149, 298),
(209, 149, 299),
(210, 113, 260),
(211, 115, 261),
(212, 115, 262),
(213, 156, 303),
(214, 156, 304),
(215, 117, 263),
(216, 159, 264),
(217, 117, 265),
(218, 106, 253),
(219, 106, 254),
(220, 106, 255),
(221, 106, 256),
(222, 106, 257),
(223, 148, 281),
(224, 149, 296),
(225, 149, 298),
(226, 131, 260),
(227, 170, 297),
(228, 170, 318),
(229, 170, 303),
(230, 170, 304),
(231, 117, 279),
(232, 117, 282),
(233, 159, 264),
(234, 117, 261),
(235, 117, 262);

-- --------------------------------------------------------

--
-- Table structure for table `mapping_field_department_course`
--

CREATE TABLE `mapping_field_department_course` (
  `id` int NOT NULL,
  `fid` int NOT NULL,
  `did` int NOT NULL,
  `cid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mapping_field_department_course`
--

INSERT INTO `mapping_field_department_course` (`id`, `fid`, `did`, `cid`) VALUES
(9, 2, 1, 48),
(10, 2, 1, 51),
(11, 2, 1, 53),
(12, 2, 1, 56),
(13, 2, 1, 57),
(14, 2, 1, 58),
(15, 2, 1, 59),
(16, 2, 1, 60),
(17, 2, 1, 61),
(18, 2, 2, 48),
(19, 2, 2, 56),
(20, 2, 2, 57),
(21, 2, 2, 58),
(22, 2, 2, 59),
(23, 2, 2, 60),
(24, 2, 2, 51),
(25, 2, 2, 53),
(26, 2, 2, 61),
(27, 1, 1, 48),
(28, 1, 1, 49),
(29, 1, 1, 50),
(30, 1, 1, 51),
(31, 1, 1, 52),
(32, 1, 1, 53),
(33, 1, 1, 54),
(34, 1, 1, 55),
(35, 1, 2, 48),
(36, 1, 2, 49),
(37, 1, 2, 50),
(38, 1, 2, 51),
(39, 1, 2, 52),
(40, 1, 2, 53),
(41, 1, 2, 54),
(42, 1, 2, 55),
(83, 1, 1, 106),
(84, 1, 1, 106),
(85, 1, 1, 106),
(86, 1, 1, 106),
(87, 1, 1, 106),
(88, 1, 1, 111),
(89, 1, 1, 112),
(90, 1, 1, 113),
(91, 1, 1, 114),
(92, 1, 1, 115),
(93, 1, 1, 116),
(94, 1, 1, 117),
(95, 1, 1, 117),
(96, 1, 1, 116),
(97, 1, 1, 120),
(98, 1, 1, 121),
(99, 1, 1, 120),
(100, 1, 1, 116),
(101, 1, 2, 106),
(102, 1, 2, 106),
(103, 1, 2, 106),
(104, 1, 2, 106),
(105, 1, 2, 106),
(106, 1, 2, 111),
(107, 1, 2, 112),
(108, 1, 2, 131),
(109, 1, 2, 132),
(110, 1, 2, 114),
(111, 1, 2, 134),
(112, 1, 2, 134),
(113, 1, 2, 134),
(114, 1, 2, 117),
(115, 1, 2, 117),
(116, 1, 2, 117),
(117, 1, 2, 134),
(118, 1, 2, 121),
(119, 1, 2, 142),
(120, 2, 2, 106),
(121, 2, 2, 106),
(122, 2, 2, 106),
(123, 2, 2, 106),
(124, 2, 2, 106),
(125, 2, 2, 148),
(126, 2, 2, 149),
(127, 2, 2, 149),
(128, 2, 2, 149),
(129, 2, 2, 149),
(130, 2, 2, 113),
(131, 2, 2, 115),
(132, 2, 2, 115),
(133, 2, 2, 156),
(134, 2, 2, 156),
(135, 2, 2, 117),
(136, 2, 2, 159),
(137, 2, 2, 117),
(138, 2, 1, 106),
(139, 2, 1, 106),
(140, 2, 1, 106),
(141, 2, 1, 106),
(142, 2, 1, 106),
(143, 2, 1, 148),
(144, 2, 1, 149),
(145, 2, 1, 149),
(146, 2, 1, 131),
(147, 2, 1, 170),
(148, 2, 1, 170),
(149, 2, 1, 170),
(150, 2, 1, 170),
(151, 2, 1, 117),
(152, 2, 1, 117),
(153, 2, 1, 159),
(154, 2, 1, 117),
(155, 2, 1, 117);

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` int NOT NULL,
  `name` char(100) NOT NULL,
  `type` char(50) NOT NULL,
  `link` char(100) DEFAULT NULL,
  `description` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `reference`
--

INSERT INTO `reference` (`id`, `name`, `type`, `link`, `description`) VALUES
(10, '方法對了，人人都可以是設計師', '中文', 'https://www.openedu.tw/course.jsp?id=208', '透過創意思考法的步驟練習，及平時觀察與發掘的訓練及方式，使學員們可利用循序漸進之思考方式來進行創意發想'),
(11, 'Design Theory', '英文', 'https://www.edx.org/course/design-theory', 'Explore key concepts in the new field of design theory. Gain fundamental knowledge of what design is'),
(12, 'Design Thinking Fundamentals', '英文', 'https://www.edx.org/course/design-thinking-fundamentals', 'Learn how a user-centered approach and design thinking principles inspire innovative ideas to create'),
(13, '設計運算思維', '中文', 'https://www.openedu.tw/course.jsp?id=1019', '從設計的角度學習運算思維，透過生活中的案例分析及設計決策一步步了解運算的邏輯。'),
(14, 'Design Thinking: Prototyping and User Testing', '英文', 'https://www.edx.org/course/design-thinking-prototyping-and-user-testing', 'Learn the importance of prototyping and user testing solutions before going to market and how to ass'),
(15, 'Design Thinking for Leading and Learning', '英文', 'https://www.edx.org/course/design-thinking-for-leading-and-learning', 'A hands-on course for education leaders to learn about design thinking and explore how it can transf'),
(16, 'Introduction to Game Design', '英文', 'https://www.edx.org/course/introduction-to-game-design', 'A practical introduction to game design and game design concepts, emphasizing the basic tools of gam'),
(17, '設計思考入門', '中文', 'https://www.openedu.tw/course.jsp?id=960', '帶領同學將設計思考的心態與方法透過線上課程與線下實作的方式，學會實踐在生活當中'),
(18, '設計思考與實踐', '中文', 'https://www.openedu.tw/course.jsp?id=285', '能學習設計思考的概念與理念，並得知如何運用各種設計方法與策略的實作經驗'),
(19, '寶博士的創新思考之道:關於創新思考的五十道陰影', '中文', 'https://www.openedu.tw/course.jsp?id=207', '創新思考為文明進步、產業更新、個人創業的基石之一，而本課程的教學策略，主要在於蒐集與創意/創新思考有關的源頭、名言、理論與範例，透過葛教授在外稍具知名度之身分-「寶博士」進行脫口秀討論，並突擊訪談知名'),
(20, '跳跳與小巴-解鎖平面設計', '中文', 'https://www.ewant.org/admin/tool/mooccourse/mnetcourseinfo.php?hostid=10&id=3753', '透過這門課可以學習到有關平面設計的知識，如資訊傳達、字型、排版、色彩基礎、配色方法與工具、書籍的設計與排版、印刷的注意事項等等。'),
(21, '斜槓設計師—看見視覺設計專業創作過程', '中文', 'https://www.openedu.tw/course.jsp?id=1181', '1. 瞭解視覺設計的本質與其在生活上的應用。2. 了解專案設計流程，培養及建立有目標及設計思維的創作習慣。3.看見專業化設計創作的過程。4. 強化訊息傳遞與意念行銷的藝術美感、資訊圖像與動態處理的能力'),
(22, 'FUNDAMENTA！DESIGN（1092高中自主學習）', '中文', 'https://www.ewant.org/admin/tool/mooccourse/mnetcourseinfo.php?hostid=9&id=3325', '設計是一門綜合學問，本課程從設計的基礎元素開始介紹，用充滿溫度的設計作品與故事，滿足學員們的需求與渴望，讓生活充滿多元的想像，帶領學員經由自己的眼睛與雙手去判斷、去調整自己對世界的觀察深度與廣度，學著'),
(23, 'Digital Design', '英文', 'https://www.edx.org/course/digital-design', 'The course is an introduction to digital design technology. It allows you to understand the basics o'),
(24, '動畫12守則新解', '中文', 'https://www.openedu.tw/course.jsp?id=1201', '本課程為落實動畫人必備知識與技術「動畫12守則」所開設之動畫專業線上學習課程，課程中將設計完整之12守則動畫製作表現演出內容，清楚表達12守則之應用方法。依據「動畫12守則」，設計簡單有效之作業，使學'),
(25, '逐格動畫 | 定格動畫', '中文', 'https://www.openedu.tw/course.jsp?id=510', '此課程含五個學習主題，共計 34 個小單元，並依照課程進度安排不同的課程內容，藉以促進互動學習並建立跨領域對話之思辨能力。１．「逐格動畫」認識逐格動畫中直接處理類的創作媒材。２．「偶的製作」學習從零開'),
(26, 'Wow！視覺特效Show一手！', '中文', 'https://www.openedu.tw/course.jsp?id=141', '因應上述學習者的特質和需求，本課程規畫包含知識、技能和態度等三大層面的學習成效指標，期能提供以學習者為中心的磨課師課程。1.知識--A.掌握多媒體影音匯流趨勢下的視覺特效設計理念與應用範疇。B.增加對'),
(27, '分鏡設計秘笈', '中文', 'https://www.openedu.tw/course.jsp?id=1202', '1.本課程針對時下國內動畫業最欠缺之項目-「分鏡腳本師」之人才培育為目標。2.課程中將設計完整之分鏡設計課程，內容以實際案例(老師原創內容，沒有版權問題)為教學內容，從基礎概念到分鏡實務，詳細而有條理'),
(28, 'OpenToonz 全能通', '中文', 'https://www.openedu.tw/course.jsp?id=919', '1. 推廣免費專業動畫工具Opentoonz。2. 透過Opentoonz，學習動畫專業製作與標準製作流程。3. 使學員從本課程中，了解動畫短片製作的過程與說故事的方法學員能夠使用Opentoonz製'),
(29, '本聲綱目', '中文', 'https://www.openedu.tw/course.jsp?id=275', '在數位音樂軟體或網路下載音效資料庫中，經常拿來放入影片作品的特效都感覺與影片格格不入，這時才驚覺大部分的音效地點在國外錄製而非華人本身在地環境所收錄的聲音。有鑒於此，本課程主要目標有四項：1.引導學生'),
(30, '互動音樂程式設計與創作(2021春季班)', '中文', 'https://www.openedu.tw/course.jsp?id=990', '本課程連結三個面向：(1)聲音/音樂科學：從最基本的聲波震動出發，透過頻譜 (Spectrogram)分析，解釋頻率，泛音現象，音色，音樂的緊張/和諧關係，音樂與?學關係。(2)基礎樂理與創作：藉由旋'),
(31, '【108-2】音樂資料科學II', '中文', 'https://www.openedu.tw/course.jsp?id=976', '藉由「音樂資料科學I」累積的基礎，本課程將先帶領學生利用Python程式語言的libRosa函式庫，分析開放式資料集並實作進階計算音樂分析；接著，將操作Sonic Visualiser軟體，參與採譜或'),
(32, '【109-1】音樂人工智慧', '中文', 'https://www.openedu.tw/course.jsp?id=1082', '理解資料科學運作原理探索開放式音樂與音訊資料集認識 Python 通用型程式語言運用人工智慧輔助創作與演奏洞察科技對人文精神的衝擊'),
(33, '攝影與行動', '中文', 'https://www.openedu.tw/course.jsp?id=210', '「手機」一個新穎的攝影創作工具。是否觸動你想要進一步觀察生活、用影像與世界溝通?本課程「攝影與行動」從基本操作、拍攝對象、美學與技術以及App與網路平台四大主題，循序漸進以基礎訓練到天馬行空的想法，創'),
(34, '攝影趣', '中文', 'https://www.openedu.tw/course.jsp?id=119', '本課程以了解攝影原理與觀念，學習影像處理技術與應用為主旨。課程設計上著重學習樂趣，以生動活潑的方式講解攝影知識與創新技術，影像處理的主要軟體為Photoshop，藉由講述與實作，使學員對攝影產生高度興'),
(35, '使用者導向智慧終端創新設計', '中文', 'https://lrs.itsa.org.tw/course_view.php?id=135', '透過跨領域整合教學與互動的模式，導引資通訊領域的學生瞭解互動設計領域的基礎的知識，以及設計的本質。'),
(36, 'Introduction to User Experience', '英文', 'https://www.edx.org/course/introduction-to-user-experience-3', 'From application software to mobile application and website, get an introduction on how to design pr'),
(37, '多重感測器技術結合人因工程', '中文', 'https://www.openedu.tw/course.jsp?id=743', '能了解在設計產品時會考慮到人的思維、人的使用方式，對後續在設計產品時能知道方向以及需要注意的地方。'),
(38, '人機介面設計', '中文', 'https://lrs.itsa.org.tw/course_view.php?id=97', '透過實際開發設計經驗教學傳承，提供學生學習人機介面相關技能，並實際應用於網頁或其他系統開發。'),
(39, 'Designing the User Experience', '英文', 'https://www.edx.org/course/designing-the-user-experience', 'Translate product ideas into tangible assets by creating wireframes, 3D renderings, prototypes, and'),
(40, 'Axure RP', '中文', 'https://axure.userxper.com/category/9-learn/?', '專門針對數位裝置介面的使用者經驗規劃人員或網站企劃人員或系統分析師而設計的介面原型設計軟體。'),
(41, '【108-1】動態網頁程式設計', '中文', 'https://www.openedu.tw/course.jsp?id=837', '本課程旨在教導學生使用HTML5+CSS3+Javascript技術進行現代化的網頁設計，課程內容以靜態網頁的版面設計為主，包含RWD的響應式跨平台網頁設計，其中，也涵蓋了UI／UX的概念建立，期待同'),
(42, '【108-2】互動設計(二)', '中文', 'https://www.openedu.tw/course.jsp?id=1000', '本課程著重數位內容的互動性設計與實構空間應用，配合本計畫主題 (海洋文化)，根據文化 文本形態與內容服務，建構多樣性的互動內容與 應用，並進一步探索空間美學、構造工法技 術，整合實與虛共構的互動 內容'),
(43, '【109-1】數位互動裝置整合設計', '中文', 'https://www.openedu.tw/course.jsp?id=1088', '『數位互動裝置整合設計』屬於中階課程，學習數位互動裝置的設計原理與實務操作，包含常用的感應器與互動程式的程式撰寫與應用，並實際做出互動裝置的原型，在課程在課程的實作內容將著重在地的文化資產資源以鹿港的'),
(44, '文學院相關－互動式地圖教具', '中文', 'https://www.openedu.tw/course.jsp?id=1038', '課程中將教導學生使用Processing、Arduino與3D建模列印，製作出簡易的台灣地圖，搭配電容式觸控按鈕，將台灣的簡單地理知識呈現在Processing的畫面上'),
(45, '藝術學院相關－顏色偵測互動數位藝術', '中文', 'https://www.openedu.tw/course.jsp?id=1040', '課程中教導學生使用Processing、Arduino與3D建模列印，製作出能感測顏色並將顏色資訊儲存到Arduino，再配合Processing將感測出的顏色製作出隨機圖案呈現在畫面上。'),
(46, '【108-2】遊戲運用及程式設計', '中文', 'https://www.openedu.tw/course.jsp?id=998', '本課程以實作教學與專家工作坊為主，培養學生利用數位科技進行人文知識生產的轉譯文學能力與基礎程式設計等跨領域能力。課程中將邀請產業界專家介紹文學知識轉譯技巧並實作。同時，為結合鄰近兩所高中108新課綱多'),
(47, '3D遊戲設計- UNREAL ENGINE 射擊遊戲開發', '中文', 'https://www.openedu.tw/course.jsp?id=1162', '本課程將介紹材質、影像、音樂等多媒體素材的特性，並藉由Unreal遊戲引擎，透過遊戲開發誘發學生之學習動機。課程中將透過視覺化程式開發的方式，整合各項多媒體資源，進行問題導向之設計開發，以具體呈現多媒'),
(48, '玩電玩，學程式-以理科生為主', '中文', 'https://www.openedu.tw/course.jsp?id=1013', '本課程將以簡單的電腦小遊戲為包裝，從中了解程式邏輯及運算思維，進而學習Processing程式設計技巧。透過年輕人的語言與表達方式，跳脫老師的呆版形象，讓學生能在學習的過程中，不僅能紮實學習更增添許多'),
(49, '魔法程式設計創意課程', '中文', 'https://www.openedu.tw/course.jsp?id=384', '您日夜努力，上山下海的抓寶貝？為何不設計個程式，讓自己在家就有無數的寶貝可以抓？當然可以！趕快來學全球正夯的CodeSpells（程式拼寫）。是的，就像小時候玩的拼積木一樣，運用模塊來拼組，就完成了程'),
(135, 'Design Thinking Capstone', '英文', 'https://www.edx.org/course/design-thinking-capstone-3', 'Demonstrate the knowledge and skills gained during the Design Thinking MicroMasters program.'),
(140, '社會創新與藝術實踐', '中文', 'https://www.openedu.tw/course.jsp?id=417', '社會創新是為了符合各種社會需求，延伸和增強公民參與的新策略、新觀念、新想法和新組織。本課程介紹運用創意設計思考及新科技所能達成的社會變革和創新，引導學習者運用分析和設計工具，針對實際場域，提出改善社會'),
(142, '商業美學與文創藝術', '中文', 'https://www.openedu.tw/course.jsp?id=587', '目前世界潮流正往文化創意的方向發展，本課程期待利用跑遍世界所見的各類文創藝術的經驗，以及觀察台灣近來文創藝術的趨勢，帶領同學進入文創藝術世界，透過學習而具有多元與國際化的文創藝術視野，修課後能踏入文創'),
(163, '【108-2】使用者介面設計', '中文', 'https://www.openedu.tw/course.jsp?id=995', '使用者經驗與人機介面為目前熱門的設計相關領域，亦是未來設計與產業發展的重要目標之一，有鑑於產業或是相關領域的對於介面設計人才的需求，因此教學最終目標在於使學生能對人機介面設計流程、應用工具與驗證評估有'),
(164, '【108-1】數位策展', '中文', 'https://www.openedu.tw/course.jsp?id=825', '本課程介紹近年來流行於仿間的數位策展是如何運用新的媒體資訊科技，提出一個經過重整脈絡的主題故事，從人人都是策展人，論及共構與共享的網路平台概念。學生可透過數位策展個案分析了解資訊歸納的過程，此外，藉由'),
(170, '玩電玩，學程式-以文科生為主', '中文', 'https://www.openedu.tw/course.jsp?id=782', '本課程將以簡單的電腦小遊戲為包裝，從中了解程式邏輯及運算思維，進而學習Processing程式設計技巧。透過年輕人的語言與表達方式，跳脫老師的呆版形象，讓學生能在學習的過程中，不僅能紮實學習更增添許多'),
(179, '與自己對畫', '中文', 'https://www.openedu.tw/course.jsp?id=431', '以繪畫建立設計表現基本工具的技能、引發學生觀察、在創作中思考、對自我有肯定、可以也願意簡單的以繪畫去記錄生活、思考設計，學生可培植下列能力： (1) 對「繪畫」能力可掌控。 (2) 對「設計觀察」有所'),
(180, '漫話漫畫', '中文', 'https://www.openedu.tw/course.jsp?id=149', '藉由漫畫提升全民的美感教育，包含美的感受力、想像力、創造力與實踐力四大面向。提升全民對於漫畫的美學素養，並進而貢獻於改善臺灣文創產業體質，進行專業人才的基礎培養訓練。在技能面，學生能夠學習以自我風格繪'),
(193, 'APPS進階實作暨物理實驗專題應用 (2021春季班)', '中文', 'https://www.openedu.tw/course.jsp?id=1130', '本課程延續「APPs基礎實作」，以APP Inventor 2為開發平台，介紹資料存取、資料庫、GPS定位，以及手機感測器等進階概念。基於這些概念，課程針對幾個物理實驗專題從自動化擷取數據開始，到後續'),
(194, 'APPs基礎實作 (2021春季班)', '中文', 'https://www.openedu.tw/course.jsp?id=1131', '本課程採用App Inventor2做為開發環境，帶領同學了解程式語言的基本架構，包括變數宣告、迴圈、邏輯判斷、陣列與子程式等核心概念。藉由程式概念的建立，同學將可完成數個APPs的實作，例如語音計算'),
(195, 'APP玩家必學─APP INVENTOR 2資料庫專題實戰(自學課程)', '中文', 'https://www.openedu.tw/course.jsp?id=1167', '本課程除以專案方式教授APP程式開發技能外，亦著重使用者介面設計(User Interface，UI)概念與使用者體驗(User Experience，UX)探討，使學員能在開發APP時理解「從使用者'),
(196, 'Web／APP 物聯技術', '中文', 'https://www.openedu.tw/course.jsp?id=673', '物聯網應用開發技術過去多著重在感測器資料取得與開發版的通訊。為了將低中端裝置多元所帶來的困擾，物聯網的標準架構與開發技術都已Web為基礎在演進。行動 APP 在物聯網架構中，即使不扮演閘道(Gatew'),
(197, '穿戴物聯應用與技術入門', '中文', 'https://www.openedu.tw/course.jsp?id=672', '網路的發展，改變了人類生活與工作的方式。隨著行動網路及手機APP演進，智慧穿戴及物聯網的發展已經是公認的趨勢。物聯網不但應用涵蓋面廣，在資通訊範圍內所包含的技術不但多，也一直在快速演進變化。本課程介紹'),
(198, '物聯網基礎程式設計: 應用Andino與LinkIt ONE板', '中文', 'https://www.openedu.tw/course.jsp?id=634', '物聯網 Internet of Things，又簡稱為IoT，是目前最夯的科技新名詞之一，世界各國也正在如火如荼地開發物聯網的技術。因為有了物聯網，促成了許多新科技的發明，例如工業4.0智慧製造，智慧'),
(199, '智慧物聯雲端技術', '中文', 'https://www.openedu.tw/course.jsp?id=674', '傳統軟體服務開發完成後，佈署與維運的成本相當高。雲端運算的出現大大的降低了維運成本。過去運用人工智慧的門檻和成本也相當高，近年來雲端於務紛紛整合人工智慧功能，開發者已經能像使用API一樣的加入AI功能'),
(200, 'AIoT技術與應用', '中文', 'https://www.openedu.tw/course.jsp?id=1137', '本課程將AI內容跨足到IoT的領域，將人工智慧議題的領域拓展到物聯網的範疇，透過嵌入式平台結合各種感測器，帶領學員實際操作，做出簡單的物聯網設備，並且帶入基礎的機器學習與深度學習概念，將物聯網設備蒐集'),
(201, '工業物聯網安全及連網整合技術課程', '中文', 'https://www.openedu.tw/course.jsp?id=942', '近年工業4.0、智慧製造、工業物聯網等相關議題為各國產學界所著重研發目標，預期未來所有工廠作業將走向智慧化、高效能化。隨著物聯網的概念趨於成熟甚至普及，將會引進越來越多的可連網電子產品如手機、感測器、'),
(202, '工業4.0導論', '中文', 'https://univ.deltamoocx.net/courses/course-v1:AT+AT_014_1092+2021_02_22/about', '工業4.0為德國為持續製造業領先地位所提出的發展願景，其初步的成果也引起了全世界的注意，各國政府紛紛推出相對應的產業發展策略。工業4.0的核心為網宇時體系統和物聯網，追究其核心實為將資訊通訊技術更進一'),
(203, '下世代物聯網應?技術', '中文', 'https://www.openedu.tw/course.jsp?id=1094', '本系列課程共有三個主題：1. 大數據技術：訓練學生熟習當下大數據分析發展最常用的技術，使用PySpark與MLlib進行實際操作。2.機器學習概論：本課程會介紹各種常見的機器學習模型的基本理論，包含N'),
(204, '機器學習與物聯網資料分析', '中文', 'https://www.openedu.tw/course.jsp?id=951', '大數據資料時代來臨，物聯網的資料正是目前機器學習的主要發揮來源，第一周主要介紹機器學習的基本觀念，說明機器學習模型概念及範例，使實際的資料透過模型，能預測出與人類相匹敵的結果。第二週主要介紹物聯網所分'),
(205, '2021-自學課程-社會企業(1-6月)', '中文', 'https://mooc.nthu.edu.tw/course/info/59', '透過課堂中的實際案例探討，進而了解目前社會企業家如何利用有限資源，推動系統性變革，分析其進行社會企業的策略與組織特性，並探索解決社會問題的創新方法，培養學員們對社會企業界時事的敏感度，且未來能以建構適'),
(206, '【109-1】創新與創業', '中文', 'https://www.openedu.tw/course.jsp?id=1081', '本課程屬於鍵結人文、社會科學、數位科技領域的跨領域應用創作型課程，若由人文領域設計思考課程出發，讓文創藝術設計的學生多具備了了市場的思維，不再只是個人的創作，而是有清楚消費族群輪廓、有目標、有獲利可能'),
(207, '創業九宮格', '中文', 'https://www.openedu.tw/course.jsp?id=136', '本課程主要透過Alexander Osterwalder所定義出的商業(獲利)模式九宮格架構為基礎，包括價值主張、顧客區隔、行銷通路、顧客關係、關鍵夥伴、關鍵活動、關鍵資源、成本結構、營收模式等，即企'),
(208, '【109-2】跨媒體設計研究', '中文', 'https://www.openedu.tw/course.jsp?id=1156', '1. 培養學生對跨媒體敘事與?位內容作品的知識，及與社會設計之關係。2. 提供學生跨媒體的數位科技工具與雲端資料庫運用之應用能力。3. 訓?學生對跨媒體設計與?位敘事的實務企劃能?，並培養團隊合作與溝'),
(209, '深度學習與智慧物聯網', '中文', 'https://www.ewant.org/admin/tool/mooccourse/mnetcourseinfo.php?hostid=10&id=3431', '本課程將AI內容跨足到AIo的領域，將人工智慧議題的領域拓展到物聯網的範疇，透過物聯網設備的實際操作，帶領學員實際操作物聯網開發平台，結合各種sensor組合出符合需求的物連網作品，並與 AI技術結合'),
(210, '大眾運輸之智慧聯網系統', '中文', 'https://www.openedu.tw/course.jsp?id=1049', '1. 建立學員對物聯網系統之整體概念。2. 訓練學員熟悉當代嵌入式系統平台的運作及其應用。3. 讓學員了解大眾運輸之相關問題並利用所學提升大眾運輸的品質。'),
(212, '下世代物聯網通訊技術(自學課程)', '中文', 'https://www.openedu.tw/course.jsp?id=1023', '※BLE/Zigbee技術課程目標為學習物聯網BLE與Zigbee通訊技術與應用，了解BLE/Zigbee各層通訊協定的標準、技術、趨勢以及產業的需求與應用。\n※LoRA長距離低功耗無線網路技術以 L'),
(244, '物聯網系統簡介', '中文', 'https://www.openedu.tw/course.jsp?id=630', '學習磨課師課程的成功關鍵，在於最初的課程設計。本課程利用各單元所挑選的題材吸引學員注意力，或許是物聯網新的科技產品，也可能是新奇的影片，藉由輔導學員觀察現象開始，吸引學員目光與產生學習興趣，再設計一系'),
(245, '下世代物聯網核網技術(自學課程)', '中文', 'https://www.openedu.tw/course.jsp?id=948', '? 熟習運用5G核心網路技術: 物聯網平台 、物聯網核網 、物聯網安全於下世代物聯網應用。? 物聯網平台包括國際物聯網平台標準oneM2M、oneM2M的架構、oneM2M的通訊方法、oneM2M的資'),
(246, '智慧感測系統與雲端整合運用', '中文', 'https://www.openedu.tw/course.jsp?id=949', '隨著人口年齡結構改變，醫療照護已成為現今科技著重展的事項，結合物聯網與積體電路設計的技巧，可以將現有較繁瑣、且不易攜帶的生理訊號感測器變得更加便利，在此課程分為六個單元，共12部影片，學生可以由中學習'),
(253, 'C#', '', '', ''),
(254, 'Java', '', '', ''),
(255, 'Javascript', '', '', ''),
(256, 'Python', '', '', ''),
(257, 'C / C++', '', '', ''),
(258, 'I1 從自由軟體到物聯網的實踐', '中文', 'https://mytube.ncku.edu.tw/media.php?id=3261[Youtube] https://youtu.be/xs6mG9LXo60', '本課程將介紹從專案構想到最後真正的產品成型進而開放程式碼的生命週期。'),
(259, 'I2 物聯網', '中文', 'http://ocw.tku.edu.tw/courses/1/32/33/%E7%89%A9%E8%81%AF%E7%B6%B2 [Youtube] https://youtu.be/dXbr1j9', '介紹物聯網的基礎概念與所使用到的各種技術，瞭解創新技術發展的軌跡，並洞悉智慧物件聯網後可帶來的創新服務。'),
(260, 'W1 HTML5跨平台程式開發', '中文', '', '瞭解HTML5相關開發的技術知識，並透過相關實作教學，誘導進行創意發想與專題實作。'),
(261, 'W7 Node.js教學', '中文', 'https://developers.google.com/ar/develop', '教學課程簡介Node.JS運作、Web開發的基礎'),
(262, 'W8 Web Development', '英文', 'https://www.w3schools.com/whatis/default.asp', 'This tutorial introduces the front-end and back-end basics and then dig deeper and choose frameworks'),
(263, 'W4 NodeRED Tutorial for IIoT', '英文', 'https://youtu.be/3AR432bguOY', 'Node-RED tutorial for Industrial Internet of Things (IIoT) is to help you get started building your'),
(264, 'W5 WebXR(jeelizAR)', '英文', 'https://github.com/jeeliz/jeelizAR', 'WebXR is a JavaScript/WebGL lightweight object recognition library designed.'),
(265, 'W6 8th Wall Web', '英文', 'https://github.com/8thwall/web', 'Built entirely using standards-compliant JavaScript and WebGL, 8th Wall Web is a complete implementa'),
(266, 'I3 新世代物聯網-區域網路篇', '中文', 'https://www.openedu.tw/course.jsp?id=497 [Youtube] https://youtu.be/Q2s8w67Pgmc', '針對下世代物聯網的前端與後端所需技術，進行完整且有系統的設計理論討論與實務效能分析。'),
(267, 'I4 智慧終端之整合應用設計與開發', '中文', '', '培育能利用物聯網與雲端平台設計來開發智慧服務系統之人才，瞭解物聯網的關鍵在商業模式與服務。'),
(268, 'I5 結合物聯網與雲端平台之智慧服務系統', '中文', '', '如何整合微型感測周邊裝置並應用於智慧終端，設計與開發新一代資通訊服務，為本門課教授目標。'),
(269, 'I6 Machine Learning', '英文', 'https://developers.google.com/machine-learning/crash-course/ml-intro', 'Google\'s fast-paced, practical introduction to machine learning, including video lectures, real-worl'),
(270, 'I7 Colab / Tensorflow', '英文', 'https://colab.research.google.com/notebooks/welcome.ipynb', 'Colaboratory is a free Jupyter notebook environment that requires no setup and runs entirely in the'),
(279, 'W2 Web Development In 2019 - A Practical Guide', '英文', 'https://youtu.be/UnTQVlqmDQ0', 'This is the yearly step by step guide to look at nearly all aspects of web technology including the'),
(281, 'R3 OpenCV Python Tutorial For Beginners', '英文', 'https://youtu.be/kdLM6AOd2vc', 'OpenCV is an image processing library created by Intel. The course offers you a unique approach of l'),
(282, 'W3 NodeRED Getting Started', '英文', 'https://nodered.org/docs/getting-started', 'This guide will help you get Node-RED installed and running in just a few minutes.'),
(286, 'Webduino 學習手冊', '中文', 'https://tutorials.webduino.io/zh-tw/docs/basic/index.html', '在 Webduino 的基礎教學系列，將會介紹 Webduino 開發板、初始化設定、Webduino Blockly 的操作以及電子零件、傳感器的基本操作，帶領同學 能夠具備基本 Webduino'),
(289, 'I8 Python 與 Azure Notebooks 的機器學習服務介紹', '中文', 'https://docs.microsoft.com/zh-tw/learn/paths/intro-to-ml-with-python/', '了解如何利用 Python 和 Jupyter Notebooks 中的相關程式庫，在 Azure 上執行來預測模式及識別趨勢。'),
(296, 'R1 Beginner Scripting', '英文', 'https://learn.unity.com/course/beginner-scripting', 'Dive into scripting, in this course we will cover the fundamentals of C#.'),
(297, 'R2 Robotic Vision', '英文', 'http://ocw.nctu.edu.tw/course_detail-v.php?bgid=8&gid=0&nid=564', 'This course covers fundamental and advanced domains in vision for mobile robots and VR.'),
(298, 'R4 Beginner\'s Guide to Google\'s Vision API in Python', '英文', 'https://learn.unity.com/course/beginner-scripting', 'Learn what Vision API is and what are all the things that it offers. You will also learn how you can'),
(299, 'R5 ARCore Develop', '英文', 'https://developers.google.com/ar/develop', 'ARCore provides SDKs for many of the most popular development environments. You can build entirely n'),
(303, 'R7 Unity互動式遊戲程式設計入門', '中文', 'https://youtu.be/OZH7GSsLgaE', '針對從來沒有接觸過Unity的學習者所設計的內容。'),
(304, 'R8 第一次玩Unity 3D就上手：用AR實現你的寶可夢', '中文', 'https://www.openedu.tw/course.jsp?id=720', '從基本AR概論開始，進入Unity3D實作，搭配Vuforia AR套件，輕易地完成一件AR作品並發布上架。'),
(318, 'R6 ARKit入門到精通', '中文', 'https://space.bilibili.com/103407808/channel/detail?cid=50424', '將學習到使用ARKit與Unity構建AR應用程式所需的基礎知識');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `mapping_course_reference`
--
ALTER TABLE `mapping_course_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `mapping_field_department_course`
--
ALTER TABLE `mapping_field_department_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `did` (`did`),
  ADD KEY `fid` (`fid`),
  ADD KEY `mapping_field_department_course_ibfk_1` (`cid`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `field`
--
ALTER TABLE `field`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mapping_course_reference`
--
ALTER TABLE `mapping_course_reference`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `mapping_field_department_course`
--
ALTER TABLE `mapping_field_department_course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mapping_course_reference`
--
ALTER TABLE `mapping_course_reference`
  ADD CONSTRAINT `mapping_course_reference_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `mapping_course_reference_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `reference` (`id`);

--
-- Constraints for table `mapping_field_department_course`
--
ALTER TABLE `mapping_field_department_course`
  ADD CONSTRAINT `mapping_field_department_course_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mapping_field_department_course_ibfk_2` FOREIGN KEY (`did`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `mapping_field_department_course_ibfk_3` FOREIGN KEY (`fid`) REFERENCES `field` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
