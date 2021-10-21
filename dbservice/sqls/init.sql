-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： db:3306
-- 產生時間： 2021 年 09 月 01 日 16:31
-- 伺服器版本： 8.0.25
-- PHP 版本： 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `payment`
--
CREATE DATABASE IF NOT EXISTS `payment` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `payment`;

-- --------------------------------------------------------

--
-- 資料表結構 `article`
--

CREATE TABLE `article` (
  `id` int NOT NULL,
  `title` varchar(1000) NOT NULL,
  `auth` varchar(500) NOT NULL,
  `uid` int NOT NULL,
  `paperid` varchar(1000) NOT NULL,
  `pagecount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `indentify`
--

CREATE TABLE `indentify` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `indentify`
--

INSERT INTO `indentify` (`id`, `name`) VALUES
(0, 'non ieee member'),
(1, 'ieee member'),
(2, 'student'),
(3, 'root');

-- --------------------------------------------------------

--
-- 資料表結構 `paymentItem`
--

CREATE TABLE `paymentItem` (
  `id` int NOT NULL,
  `pid` int NOT NULL,
  `rid` int NOT NULL,
  `page` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `paymentrecord`
--

CREATE TABLE `paymentrecord` (
  `id` int NOT NULL,
  `ispay` tinyint(1) NOT NULL DEFAULT '-1',
  `createtime` int NOT NULL,
  `paytime` int DEFAULT NULL,
  `uid` int NOT NULL,
  `des` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receiptitle` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `paymode`
--

CREATE TABLE `paymode` (
  `id` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `amt` int NOT NULL,
  `indentid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `paymode`
--

INSERT INTO `paymode` (`id`, `name`, `amt`, `indentid`) VALUES
(1, 'has article', 8500, 0),
(2, 'without article', 100, 0),
(3, 'without article', 50, 2),
(4, 'without article', 100, 1),
(5, 'has article', 7500, 1),
(6, 'has article', 3000, 2),
(7, 'extra page', 4200, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(256) NOT NULL,
  `indentid` int NOT NULL DEFAULT '0',
  `position` varchar(1000) NOT NULL,
  `affiliation` varchar(10000) NOT NULL,
  `country` varchar(1000) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `ieeeid` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `studentid` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidx` (`uid`);

--
-- 資料表索引 `indentify`
--
ALTER TABLE `indentify`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `paymentItem`
--
ALTER TABLE `paymentItem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymodeidex` (`pid`),
  ADD KEY `recordidx` (`rid`);

--
-- 資料表索引 `paymentrecord`
--
ALTER TABLE `paymentrecord`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidxx` (`uid`);

--
-- 資料表索引 `paymode`
--
ALTER TABLE `paymode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indentidx` (`indentid`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `indentifyidx` (`indentid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `article`
--
ALTER TABLE `article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `indentify`
--
ALTER TABLE `indentify`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `paymentItem`
--
ALTER TABLE `paymentItem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `paymentrecord`
--
ALTER TABLE `paymentrecord`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `paymode`
--
ALTER TABLE `paymode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `uidx` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `paymentItem`
--
ALTER TABLE `paymentItem`
  ADD CONSTRAINT `paymodeidex` FOREIGN KEY (`pid`) REFERENCES `paymode` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `recordidx` FOREIGN KEY (`rid`) REFERENCES `paymentrecord` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `paymentrecord`
--
ALTER TABLE `paymentrecord`
  ADD CONSTRAINT `uidxx` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- 資料表的限制式 `paymode`
--
ALTER TABLE `paymode`
  ADD CONSTRAINT `indentidx` FOREIGN KEY (`indentid`) REFERENCES `indentify` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 資料表的限制式 `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `indentifyidx` FOREIGN KEY (`indentid`) REFERENCES `indentify` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
