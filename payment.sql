-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： db:3306
-- 產生時間： 2021 年 10 月 21 日 10:07
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

--
-- 傾印資料表的資料 `article`
--

INSERT INTO `article` (`id`, `title`, `auth`, `uid`, `paperid`, `pagecount`) VALUES
(291, 'dsa', 'ddsadas', 33, 'dsad', 5),
(292, 'Highly Efficient Indexing Scheme for k-Dominant Skyline Processing over Uncertain Data Stream', 'Chuan-Chi Lai, Hsuan-Yu Lin, and Chuan-Ming Liu', 35, '1570747620', 5),
(293, 'Transformer Empowered CSI Feedback for Massive MIMO Systems', 'Yang Xu, Mingqi Yuan, Man-On Pun', 37, '1570762433', 5),
(294, 'Task scheduling approaches for fog computing', 'Lina Benchikh, Lemia Louail', 38, '1570753177', 5),
(295, 'Dynamic TDMA for Wireless Sensor Networks', 'Chahrazed Benrebbouh, Lemia Louail', 38, '1570753105', 5),
(296, 'Beyond Octave-Spanning Supercontinuum Generation of Optical Vortices in Ring-Core Photonic Crystal Fiber', 'Yang Yue, Wenpu Geng', 39, '1570761058', 2),
(297, 'On Deep Learning-Based Hybrid Precoding for Reconfigurable Intelligent Surface (RIS)-Aided Multiuser Millimeter-Wave Massive MIMO 6G Systems', 'Hong-Yunn Chen, Cheng-Fu Chou, Leana Golubchik', 43, '1570753130', 5),
(298, 'Geographic Routing with Two-Hop Movement Information in Mobile Opportunistic Networks', 'Hengbing Zhu, Mohd Yaseen Mir, Chih-Lin Hu', 44, '1570748812', 5),
(299, 'On-Chip Multiband MIMO Dielectric Resonator Antenna Design for Mm-wave Application', 'Meshari D. Alanazi, Salam K Khamas ', 45, '1570753459', 4),
(300, 'High thermal stability of 850 nm VCSELs with enhanced mask margin up to 85 °C for 100G-SR4 Operation', 'Hao-Tien Cheng, Yun-Cheng Yang, Chao-Hsin Wu', 46, '1570752892', 5),
(301, 'Analysis of the spectral dependent microwave characteristics of 1.3 μm DFB Laser at different temperatures', 'Te-Hua Liu, Chieh Lo, Hao-Tien Cheng, Yun-Cheng Yang, Chao-Hsin Wu ', 46, '1570753175', 4),
(302, 'Survivable Virtual Network Embedding Problem on Elastic Optical Networks with Node Failure', 'Der-Rong Din, Yu-Chen Hsiao', 47, '1570744677', 5),
(303, 'A Study of Neural Network Receivers in OFDM Systems Subject to Memoryless Impulse Noise', ' Der-Feng Tseng, Che-Shien Lin', 48, '1570753366', 5),
(304, 'Data-Driven Symbol Definition for Color Shift Keying in Screen Camera Communications', 'Alex Cartagena Gordillo', 49, '1570751549', 4),
(305, 'Design of a DRX Sleep Scheduling Scheme with Carrier Aggregation in 3GPP Heterogeneous Cellular Networks', 'Fu-Ping Yang, Jian-Yuan Hong, Jen-Jee Chen, Tzung-Shi Chen', 50, '1570745097', 5),
(306, 'Performance Assessment for different SDN-Based Controllers', 'Mohammad Nowsin Amin Sheikh, I-Shyan Hwang, Razat Kharga, Elaiyasuriyan Ganesan', 51, '1570744394', 2),
(307, 'P2P locality-aware Live IPTV over SDN based FiWi Network', 'Razat Kharga, Ardian Rianto, I-Shyan Hwang', 51, '1570744608', 3),
(308, 'Impact of Artificial Seawater and Turbulence Factors on Underwater Optical Wireless Communication', 'Shofuro Afifah, Lina Marlina, Chia-Chun Chen, Ya-Ling Liu, Shien-Kuei Liaw, Chien-Hung Yeh', 52, '1570752881', 5),
(309, 'Strategy-Proof Beam-Aware Multicast Resource Allocation Mechanism', 'Pan-Yang Su, Yi-Yun Li, and Hung-Yu Wei', 53, '1570750921', 5),
(312, '40 Gb/s × 8 WDM Bi-directional Transmission in 100 GHz Channel Spacing using Dispersion Compensating Fiber', 'Lina Marlina, Shofuro Afifah, Hiroki Kishikawa, Shien-Kuei Liaw', 54, '1570752898', 3),
(313, 'A Scalable Optical Intra-Cluster Data Center Network with an Efficient WDMA protocol: Performance and Power Consumption Study', 'Peristera Baziana, George Drainakis', 55, '1570752025', 5),
(314, 'Using Machine Learning Techniques to Predict Recurrent Breast Cancer in Taiwan', 'Ying-Chen Chen, Chi-Chang Chang', 56, '1570749602', 1),
(315, 'Performance of Fully Digital Zero-Forcing Precoding in mmWave Massive MIMO-NOMA with Antenna Reduction', 'Ms. Nouran Mohamed Zaghlool Arafat, Prof. Ahmed E. El-Mahdy', 57, '1570748402', 5),
(316, 'PPoL: A Periodic Channel Hopping Sequence with Nearly Full Rendezvous Diversity', 'Yi-Jheng Lin, Cheng-Shang Chang', 60, '1570752987', 5),
(317, 'A wireless sensing device for open farmland and its back-end system design', 'Chien-Hung Lai,Yuh-Shyan Hwang', 59, '1570753219', 4),
(318, 'Channel Modeling of Air-to-Ground Signal Measurement with Two-Ray Ground-Reflection Model for UAV Communication Systems	', 'Chia-Chuan Chiu, Ang-Hsun Tsai, Hsin-Piao Lin, Chao-Yang Lee, Li-Chun Wang', 61, '1570753362', 6),
(319, 'Collision Avoidance Control for Connected Drones in Air-Intersections', 'Chao-Yang Lee, Bing-Hao Liao', 62, '1570761831', 2),
(320, 'An improvement of cycle-based energy-saving scheme in medium-load traffic for NG-EPON networks', 'Chien-Ping Liu, Ho-Ting Wu, Yu-Hsuan Hung, Kai-Wei Ke', 63, '1570738041', 1),
(321, 'Secrecy Energy Efficiency Maximization for UAV Enabled Communication Systems', 'Qingcheng Tao, Gongchao Su, Bin Chen, Mingjun Dai, Xiaohui Lin, and Hui Wang', 64, '1570751560', 5),
(322, 'Collision Avoidance Control for Connected Drones in Air-Intersections', 'Chao-Yang Lee, Bing-Hao Liao', 65, '570761831', 2),
(323, 'Activity Recognition Based on FR-CNN and Attention-Based LSTM Network', 'Ching-Jung, Huang, Tan-Hsu Tan, Munkhjargal Gochoo, Yung-Fu Chen', 66, '1570753140', 4),
(324, '1-bit Nonlinear Mapping Precoder for Downlink Massive MU-MIMO Systems', 'Jung-Lang Yu, Yipu Yuan, Biling Zhang', 67, '1570744290', 4),
(325, 'Extended Abstract）An Efficient AI Resource Allocation Algorithm Based on QoS', 'Ming-An Chung,Sung-Yun Chai', 70, '1570738182', 2),
(326, 'A Machine Learning Approach for CQI Feedback Delay in 5G and Beyond 5G Networks', 'Andson Balieiro, Kelvin Dias, Paulo Guarda ', 71, '1570751620', 5),
(327, 'A Positioning Control Module for Lubricate Railway and Lower Pantograph', 'Ming-Shian Lin, Kuo-Chi Wu', 72, '1570753227', 3),
(328, 'QAM Signal Classification and Timing Jitter Identification Based on Eye Diagrams and Deep Learning', 'Alhussain Almarhabi, Hatim Alhazmi, Abdullah Samarkandi, Mofadal Alymani, Mohsen H. Alhazmi and Yu-Dong Yao', 73, '1570744388', 5),
(329, 'Using Machine Learning and Light Spatial Sequence Arrangement for Copying Positioning Unit Cell to Reduce Training Burden in Visible Light Positioning (VLP)', 'Li-Sheng Hsu, Dong-Chang Lin, Chi-Wai Chow, Tun-Yao Hung, Yun-Han Chang, Ching-Wei Peng, Yang Liu, Chien-Hung Yeh, Kun-Hsien Lin', 75, '1570742219', 4),
(331, 'Cooperative Deep Learning-Based Uplink Distributed Fair Resource Allocation for Aerial Reconfigurable Intelligent Surfaces Wireless Networks', 'Wei-Ting Chen, Cheng-Sen Huang, Li-Chun Wang', 76, '1570751596', 5),
(332, 'Modeling Implicit User Relations with Information Propagation Graph for User Influence Prediction', 'Jenq-Haur Wang, Po-Hung Lin', 77, '1570753260', 5),
(333, 'Learning from UAV Experimental Results for Performance Modeling of Reconfigurable Intelligent Surface Flying Platform', 'Bo-Rong Wu, Li-Chun Wang', 78, '1570753156', 6),
(334, 'Hybrid Multicast and Unicast Streaming System with Layered Video Coding', 'Ming-Chang Tsai, Shih-Hsuan Yang', 80, '1570753129', 2),
(335, 'Latest Advances in Spectrum Management for 6G Communications', 'Li-Chun Wang, Haoran Peng, Cheng-Sen Huang, Ang-Hsun Tsai', 81, '1570763178', 3),
(337, 'Comparative Study on CDMA Code Design of PMCW Radar on Long-Range Multi-Objects Detection', 'Yi-Lin Lee, Yun-Ruei Li, Li-Chun Wang', 82, '1570753507', 2),
(338, 'RIS-assisted UAV Networks: Deployment Optimization with Reinforcement-Learning-Based Federated Learning', 'Hsuan-Fu Wang, Cheng-Sen Huang, Li-Chun Wang', 83, '1570753401', 6),
(339, '12-Bit 200 MS/s Switched-Current Pipelined Analog-to-Digital Converter for High-Speed DSL', 'Guo-Ming Sung, Jing-Yan Weng, Ming-Chang Tsai, Yue-Chi Wang', 84, '1570744691', 5),
(340, '12-Bit 200 MS/s Digital Transmitter for Very-High-Bit-Rate Digital Subscriber Loop', 'Guo-Ming Sung, Guan-Xiang Tan, Qi-Hong Chen, Yu-Ting Yang', 84, '1570744697', 5),
(342, '5G Edge Computing Experiments with Intelligent Resource Allocation for Multi-Application Video Analytics', 'Tzu-Hsuan Chao, Jian-Han Wu, Yao Chiang, Hung-Yu Wei', 85, '1570752976', 5),
(343, 'A Systematic Resource Management for VR Streaming on MECs', 'Yu-Syuan Jheng, Min-Li Wu, Ta-Wei Yang, Cheng-Fu Chou, Ing-Chau Chang', 68, '1570753164', 2),
(344, 'Wi-Fi DSAR: Wi-Fi based Indoor Localization using Denoising Supervised Autoencoder', 'Yun-Hao Wang, Ta-Wei Yang, Cheng-Fu Chou, Ing-Chau Chang', 87, '1570753388', 5),
(345, 'Optical Focusing-based Adaptive Modulation for Optoacoustic Communication', 'Muntasir Mahmud, Md Shafiqul Islam, Mohamed Younis and Gary Carter', 88, '1570745077', 5),
(346, 'A Systematic Resource Management for VR Streaming on MECs', 'Yu-Syuan Jheng, Min-Li Wu, Ta-Wei Yang, Cheng-Fu Chou, Ing-Chau Chang', 41, '1570753164', 2),
(347, 'A Deep Neural Network Equalizer for FSO Transmission System', 'Jyun-Wei Li, Song-Lin You, Run-Kai Shiu, Chih-Yen Yen, Peng-Chun Peng', 89, '1570744732', 2),
(348, 'Modulation Classification in a Multipath Fading Channel Using Deep Learning: 16QAM, 32QAM and 64QAM', 'Abdullah Samarkandi', 91, '1570744624', 5),
(349, 'Simulated Throughput of the O-CDMA/ P-ALOHA Network with Variable-size-message Two-classes Multimedia Traffic', 'Shu-Ming Tseng, Sung-Wei Fu, Jian-Cheng Yu', 86, '1570744703', 2),
(350, 'Prediction of THz Absorption and Inverse Design of Graphene-Based Metasurface Structure Using Deep Learning', 'Erfan Dejband, Jyun-Wei Li, Peng-Chun Peng, Tan-Hsu Tan', 92, '1570752940', 2),
(352, 'Performance Analysis of Multi-User Diversity Schemes on Interference-Limited D-GG Atmospheric Turbulence Channels', 'Anu Goel, Richa Bhatia', 93, '1570753072', 5),
(353, 'A Simulation of Innovative Car Parking Bidding System', 'Sheng-Ming Wang, Winston Yang, Wei-Min Cheng', 95, '1570749901', 4),
(354, 'Data-driven Spatial Features Analysis Using Share of Voice in Commercial Area', 'Sheng-Ming Wang, Winston Yang', 95, '1570751508', 4),
(355, 'Machine Learning-based Path Loss Modeling in Urban Propagation Environments', 'Rong-Terng Juang, Jia-Qing Lin, Hsin-Piao Lin', 96, '1570762156', 2),
(356, 'Prediction of THz Absorption and Inverse Design of Graphene-Based Metasurface Structure Using Deep Learning', 'Erfan Dejband, Jyun-Wei Li, Peng-Chun Peng, Tan-Hsu Tan', 97, '1570752940', 3),
(359, 'Various microcavity lasers monolithically grown on planar on-axis Si (001) substrates', 'Zhaoyu Zhang, Yaoran Huang', 99, '1570762285', 2),
(360, 'High-Baud-Rate 32-QAM OFDM Single-arm and Dual-arm Encoded Silicon Mach-Zehnder Modulator', 'Shih-Chun Kao, Kuo-Fang Chung, Cheng-Ting Tsai, Ding-Wei Huang, Tien-Tsong Shih, Gong-Ru Lin', 101, '1570749032', 3),
(361, 'Impulse Response and Noise Figure of a 50-Gbps O-band Ge p-i-n Waveguide Photodiode with High Responsivity', 'Jyun-Yang Su, Kuo-Fang Chung, Shih-Chun Kao, Chih-Hsien Cheng, Cheng-Ting Tsai, Ding-Wei Huang, Gong-Ru Lin', 101, '1570748943', 3),
(362, 'Employing Telecom Fiber Cables as Sensing Media for Road Traffic Applications', 'Ming-Fang Huang', 102, '1570761830', 3),
(363, 'Event identification by deep transfer learning with dual transformations', 'Jun-Li Lu', 103, '1570751838', 5),
(364, 'Multi-agent Learning based Anti-jamming Communications Against Cognitive Jammers', 'Milidu N. Jayaweera', 104, '1570744580 ', 5),
(365, '3D-printed mold-assisted U-shaped optical fiber sensor for displacement sensing', 'Hung-Jen Liao, Chin-Ping Yu', 100, '1570748853', 3),
(367, 'Design and spectral reconstruction assisted by intelligent algorithms for high-resolution Fourier transform spectrometer', 'Huaijian Luo, Zhuili Huang, Chuang Xu, Alan Pak Tao Lau, and Changyuan Yu', 107, '1570762121', 4),
(369, 'Building a Mininet-based Fiber Optic Simulator', 'Yaoqing Liu, Anthony Dowling, Chris Page, William Smith', 109, '1570752911', 5),
(370, 'Channel Quality Estimation in 3D Drone Base Station for Future Wireless Network', 'Getaneh Berie Tarekegn, Rong-Terng Juang , Hsin-Piao Lin , Yirga Yayeh Munaye , Li-Chun Wang , Shiann-Shiun Jeng ', 110, '1570744896', 4),
(371, 'Radio Resource Allocation for 5G Networks Using Deep Reinforcement Learning', 'Yirga Munaye, Rong-Terng Juan’s, Hsin-Piao Lin, Getaneh Tarekegn, Ding-Bing Lin, and Shiann-Shaun Jeng', 111, '1570744899', 5),
(372, 'Improving Routing Protocol for Low-Power and Lossy Networks over IoT Enviroment', 'Khalid A. Darabkh, Muna Al-Akhras, and Ala’ Khalifeh', 112, '1570752858', 5),
(373, 'Resource Allocation based on Genetic Algorithm for Cloud Computing', 'Yi-Liang Chen, Shih-Yun Huang, Yao-Chung Chang, Han-Chieh Chao', 113, '1570761440', 2),
(374, 'Edge-based Realtime Image Object Detection for UAV Missions', 'Meng-Shou Wu, Chi-Yu Li', 116, '1570762469', 2);

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
  `page` int NOT NULL DEFAULT '1',
  `aid` int DEFAULT NULL,
  `receiptid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `paymentItem`
--

INSERT INTO `paymentItem` (`id`, `pid`, `rid`, `page`, `aid`, `receiptid`) VALUES
(706, 3, 1630620722, 1, NULL, 73),
(712, 5, 1630620750, 1, 291, NULL),
(713, 8, 1630620750, 1, NULL, NULL),
(714, 5, 1630620736, 1, 292, 1),
(715, 5, 1630620762, 1, 293, 2),
(716, 1, 1630620740, 1, 294, 3),
(717, 1, 1630620741, 1, 295, 4),
(718, 5, 1630620839, 1, 296, 5),
(719, 5, 1630620761, 1, 297, NULL),
(721, 5, 1630620748, 1, 298, 8),
(722, 1, 1630620835, 1, 299, 9),
(724, 5, 1630620755, 1, 300, 10),
(725, 5, 1630620756, 1, 301, NULL),
(726, 1, 1630620764, 1, 302, 11),
(728, 5, 1630620767, 1, 303, 12),
(730, 5, 1630620849, 1, 304, 13),
(732, 5, 1630620773, 1, 305, 14),
(734, 5, 1630620776, 1, 306, 15),
(735, 5, 1630620777, 1, 307, 16),
(737, 5, 1630620927, 1, 308, 17),
(738, 5, 1630620883, 1, 309, 18),
(743, 5, 1630620928, 1, 312, 72),
(744, 5, 1630620868, 1, 313, 19),
(745, 1, 1630620791, 1, 314, 20),
(747, 1, 1630620893, 1, 315, 21),
(749, 1, 1630620816, 1, 316, 24),
(750, 1, 1630620815, 1, 317, 23),
(751, 1, 1630620929, 1, 318, 25),
(752, 7, 1630620929, 1, 318, NULL),
(753, 1, 1630620823, 1, 319, NULL),
(755, 1, 1630620822, 1, 320, 26),
(756, 5, 1630620828, 1, 321, 27),
(757, 5, 1630620827, 1, 322, 28),
(758, 1, 1630620854, 1, 323, 29),
(760, 5, 1630620853, 1, 324, 30),
(761, 3, 1630620837, 1, NULL, 32),
(763, 1, 1630620843, 1, 325, 33),
(765, 1, 1630620968, 1, 326, 34),
(766, 1, 1630620848, 1, 327, 35),
(767, 5, 1630620875, 1, 328, 36),
(768, 3, 1630620852, 1, NULL, NULL),
(769, 5, 1630620945, 1, 329, 37),
(772, 1, 1630620865, 1, 331, 38),
(774, 5, 1630620869, 1, 332, 39),
(775, 1, 1630620892, 1, 333, 40),
(776, 7, 1630620892, 1, 333, NULL),
(777, 5, 1630620874, 1, 334, 41),
(779, 5, 1630620888, 1, 335, 42),
(781, 1, 1630620890, 1, 337, 43),
(782, 1, 1630620931, 1, 338, 44),
(783, 7, 1630620931, 1, 338, NULL),
(784, 5, 1630620897, 1, 339, 45),
(785, 5, 1630620898, 1, 340, 46),
(788, 3, 1630620902, 1, NULL, 6),
(789, 5, 1630620903, 1, 342, 47),
(790, 2, 1630620906, 1, NULL, NULL),
(792, 1, 1630620955, 1, 343, 31),
(793, 1, 1630620957, 1, 344, 49),
(794, 5, 1630620915, 1, 345, 50),
(795, 1, 1630620972, 1, 346, 7),
(796, 5, 1630620920, 1, 347, 51),
(797, 3, 1630620922, 1, NULL, 52),
(798, 1, 1630620926, 1, 348, 53),
(799, 5, 1630620930, 1, 349, 48),
(800, 9, 1630620930, 1, NULL, NULL),
(801, 1, 1630620933, 1, 350, NULL),
(804, 1, 1630620940, 1, 352, NULL),
(805, 1, 1630620944, 1, 353, 54),
(806, 1, 1630620944, 1, 354, 55),
(807, 1, 1630620946, 1, 355, 56),
(808, 5, 1630620948, 1, 356, 57),
(810, 2, 1630620953, 1, NULL, 22),
(813, 5, 1630620962, 1, 359, 58),
(814, 5, 1630620966, 1, 360, 60),
(815, 5, 1630620966, 1, 361, 61),
(816, 5, 1630620971, 1, 362, 62),
(819, 1, 1630620977, 1, 363, 63),
(820, 1, 1630620978, 1, 364, 64),
(821, 1, 1630620980, 1, 365, 59),
(823, 2, 1630620983, 1, NULL, 65),
(826, 5, 1630620986, 1, 367, 66),
(829, 2, 1630620989, 1, NULL, NULL),
(830, 5, 1630620990, 1, 369, 67),
(831, 1, 1630620991, 1, 370, 68),
(832, 1, 1630620992, 1, 371, 69),
(833, 5, 1630620994, 1, 372, 70),
(834, 5, 1630620996, 1, 373, 71),
(835, 3, 1630620997, 1, NULL, NULL),
(836, 3, 1630620998, 1, NULL, NULL),
(838, 5, 1630621001, 1, 374, 74);

-- --------------------------------------------------------

--
-- 資料表結構 `paymentrecord`
--

CREATE TABLE `paymentrecord` (
  `id` int NOT NULL,
  `createtime` int NOT NULL,
  `paytime` int DEFAULT NULL,
  `uid` int NOT NULL,
  `des` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receiptitle` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `paymentrecord`
--

INSERT INTO `paymentrecord` (`id`, `createtime`, `paytime`, `uid`, `des`, `receiptitle`) VALUES
(1630620722, 1631286521, 1630620722, 33, 'Payment', 'National Taipei University of Technology'),
(1630620736, 1631369876, 1632232020, 35, 'Payment', '逢甲大學    統一編號：52005505'),
(1630620740, 1631375382, 1631542596, 38, '1570753177, non ieee member', 'paper1'),
(1630620741, 1631375454, 1631542752, 38, '1570753105, non ieee member', 'paper2'),
(1630620748, 1631381601, 1631381812, 44, '1570748812, ieee member', '國立中央大學'),
(1630620750, 1631382030, NULL, 33, 'Payment', 'test'),
(1630620755, 1631398405, 1631399930, 46, '1570752892, ieee member', 'National Taiwan University'),
(1630620756, 1631398502, NULL, 46, '1570753175, ieee member', ''),
(1630620761, 1631404254, NULL, 43, 'Payment', '國立臺灣大學 National Taiwan University'),
(1630620762, 1631410319, 1631411044, 37, 'Payment', 'The Chinese University of Hong Kong, Shenzhen'),
(1630620764, 1631410938, 1631411112, 47, 'Payment', '國立彰化師範大學(NCUE)    統一編號：58815502'),
(1630620767, 1631415713, 1631415921, 48, 'Payment', 'National Taiwan University of Science and Technology'),
(1630620773, 1631429521, 1631429771, 50, '1570745097, ieee member', 'National Yang Ming Chiao Tung University'),
(1630620776, 1631430187, 1631430445, 51, 'Payment', '元智大學資訊工程系 黃依賢'),
(1630620777, 1631430942, 1631431110, 51, '1570744608, ieee member', '元智大學資訊工程系 黃依賢'),
(1630620791, 1631455085, 1631455372, 56, 'Payment', 'Chung-Shan Medical University'),
(1630620815, 1631498586, 1631498683, 59, 'Payment', ''),
(1630620816, 1631498675, 1631498840, 60, 'Payment', 'National Tsing Hua University'),
(1630620822, 1631512502, 1631512882, 63, 'Payment', '臺北城市科技大學'),
(1630620823, 1631514566, NULL, 62, 'Payment', ''),
(1630620827, 1631515237, 1631515322, 65, 'Payment', '國立陽明交通大學'),
(1630620828, 1631515735, 1631515916, 64, 'Payment', 'Shenzhen University,China'),
(1630620835, 1631523237, 1631523343, 45, 'Payment', 'meshari'),
(1630620837, 1631523510, 1631523682, 69, 'Payment', 'National Tsing Hua University'),
(1630620839, 1631524979, 1631525043, 39, 'Payment', 'Nankai University, China'),
(1630620843, 1631526329, 1631526419, 70, 'Payment', ''),
(1630620848, 1631543674, 1631543975, 72, 'Payment', '新北大眾捷運股份有限公司    統一編號：69278085'),
(1630620849, 1631553179, 1631553395, 49, 'Payment', 'WOCC Registration'),
(1630620852, 1631584332, NULL, 74, 'non author, student', ''),
(1630620853, 1631585403, 1631585709, 67, 'Payment', 'Fu Jen Catholic University'),
(1630620854, 1631590785, 1631590897, 66, 'Payment', ''),
(1630620865, 1631604176, 1631604317, 76, 'Payment', '國立陽明交通大學'),
(1630620868, 1631605701, 1631605865, 55, 'Payment', ''),
(1630620869, 1631605866, 1631606024, 77, '1570753260, ieee member', '國立台北科技大學'),
(1630620874, 1631627840, 1631628050, 80, '1570753129, ieee member', 'National Taipei University of Technology'),
(1630620875, 1631644434, 1631644610, 73, 'Payment', '30th Wireless and Optical Communications Conference for Mr. Alhussain Almarhabi'),
(1630620883, 1631681723, 1631708913, 53, 'Payment', ''),
(1630620888, 1631684787, 1631685431, 81, 'Payment', '國立陽明交通大學'),
(1630620890, 1631685251, 1631685403, 82, 'Payment', '國立陽明交通大學    統一編號：87557573'),
(1630620892, 1631686260, 1631686362, 78, 'Payment', '國立陽明交通大學'),
(1630620893, 1631693586, 1631693753, 57, 'Payment', 'WOCC 2021 (Paper Registration Receipt)'),
(1630620897, 1631758206, 1631758608, 84, '1570744691, ieee member', 'National Taipei University of Technology'),
(1630620898, 1631758321, 1631758761, 84, '1570744697, ieee member', 'National Taipei University of Technology'),
(1630620902, 1631759202, 1632051452, 40, 'non author, student', ''),
(1630620903, 1631790855, 1631791729, 85, '1570752976, ieee member', ''),
(1630620906, 1631793248, 1631793448, 86, 'Payment', 'National Taipei University of Technology'),
(1630620915, 1631799766, 1631890878, 88, 'Payment', ''),
(1630620920, 1631805348, 1631951003, 89, 'Payment', 'National Taipei University of Technology'),
(1630620922, 1631808267, 1631808449, 90, 'Payment', 'Registration Fee wocc2021'),
(1630620926, 1631817680, 1631817716, 91, 'Payment', ''),
(1630620927, 1631849265, 1631849410, 52, 'Payment', 'Student author IEEE member'),
(1630620928, 1631849601, 1631849693, 54, 'Payment', 'Student author IEEE member'),
(1630620929, 1631850746, 1631850844, 61, 'Payment', '國立陽明交通大學'),
(1630620930, 1631859377, 1631859686, 86, '1570744703, ieee member', 'National Taipei University of Technology (Shu-Ming Tseng)'),
(1630620931, 1631861635, 1631861747, 83, 'Payment', '國立陽明交通大學'),
(1630620933, 1631864749, NULL, 92, 'Payment', ''),
(1630620940, 1631878520, NULL, 93, 'Payment', 'WOCC 2021 Payment'),
(1630620944, 1631881450, 1631881874, 95, 'Payment', ''),
(1630620945, 1631881949, 1631887189, 75, 'Payment', ''),
(1630620946, 1631913029, 1631913161, 96, '1570762156, non ieee member', '逢甲大學    統一編號：52005505'),
(1630620948, 1631943921, 1631944038, 97, 'Payment', ''),
(1630620953, 1631955516, 1631955618, 58, 'Payment', 'Pooja Prajapat'),
(1630620955, 1631959836, 1631959918, 68, 'Payment', '國立臺灣大學    統一編號：03734301'),
(1630620957, 1631967892, 1631968055, 87, 'Payment', '國立臺灣大學    統一編號：03734301'),
(1630620962, 1632035988, 1632036448, 99, 'Payment', '香港中文大学（深圳）'),
(1630620966, 1632053258, 1632053434, 101, 'Payment', 'National Taiwan University'),
(1630620968, 1632057190, 1632057372, 71, 'Payment', ''),
(1630620971, 1632064082, 1632064418, 102, 'Payment', 'Ming-Fang Huang, NEC Labs America'),
(1630620972, 1632065885, 1632065996, 41, 'Payment', '國立臺灣大學    統一編號：03734301'),
(1630620977, 1632103255, 1632104023, 103, '1570751838, non ieee member', 'Conference Invoice/Receipt (The 30th Wireless and Optical Communications Conference, 2021)'),
(1630620978, 1632103298, 1632103515, 104, '1570744580 , non ieee member', ''),
(1630620980, 1632103379, 1632103586, 100, 'Payment', '國立中山大學    統一編號：76211194'),
(1630620983, 1632124756, 1632125059, 105, 'Payment', '國立東華大學'),
(1630620986, 1632129158, 1632129551, 107, '121, ieee member', 'The Hong Kong Polytechnic University'),
(1630620989, 1632141818, NULL, 106, 'Payment', ''),
(1630620990, 1632144791, 1632145093, 109, '1570752911, ieee member', ''),
(1630620991, 1632148666, 1632148957, 110, '1570744896, non ieee member', 'National Dong Hwa University'),
(1630620992, 1632150874, 1632151094, 111, '1570744899, non ieee member', 'National Taipei University of Technology '),
(1630620994, 1632165649, 1632166000, 112, 'Payment', 'Visa'),
(1630620996, 1632240309, 1632240485, 113, 'Payment', 'National Taitung University    統一編號：93504006'),
(1630620997, 1632969292, NULL, 114, 'non author, student', ''),
(1630620998, 1632970284, NULL, 115, 'non author, student', ''),
(1630621001, 1633492384, 1633492533, 116, 'Payment', 'National Yang Ming Chiao Tung University');

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
(2, 'without article', 3000, 0),
(3, 'without article', 1500, 2),
(4, 'without article', 3000, 1),
(5, 'has article', 7500, 1),
(6, 'has article', 8500, 2),
(7, 'extra page', 4200, NULL),
(8, 'has paid base', -1500, 2),
(9, 'has paid base', -3000, 0),
(10, 'has paid base', -3000, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `Receipt`
--

CREATE TABLE `Receipt` (
  `id` int NOT NULL,
  `dist` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uid` int NOT NULL,
  `datetime` int NOT NULL,
  `articleTitle` varchar(1000) NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `Receipt`
--

INSERT INTO `Receipt` (`id`, `dist`, `uid`, `datetime`, `articleTitle`, `total`) VALUES
(1, '10000001', 35, 1633457687, 'Highly Efficient Indexing Scheme for k-Dominant Skyline Processing over Uncertain Data Stream', 7500),
(2, '10000002', 37, 1633457689, 'Transformer Empowered CSI Feedback for Massive MIMO Systems', 7500),
(3, '10000003', 38, 1633457689, 'Task scheduling approaches for fog computing', 8500),
(4, '10000004', 38, 1633457690, 'Dynamic TDMA for Wireless Sensor Networks', 8500),
(5, '10000005', 39, 1633457691, 'Beyond Octave-Spanning Supercontinuum Generation of Optical Vortices in Ring-Core Photonic Crystal Fiber', 7500),
(6, '10000006', 40, 1633457692, '', 1500),
(7, '10000007', 41, 1633457692, 'A Systematic Resource Management for VR Streaming on MECs', 8500),
(8, '10000008', 44, 1633457693, 'Geographic Routing with Two-Hop Movement Information in Mobile Opportunistic Networks', 7500),
(9, '10000009', 45, 1633457694, 'On-Chip Multiband MIMO Dielectric Resonator Antenna Design for Mm-wave Application', 8500),
(10, '10000010', 46, 1633457694, 'High thermal stability of 850 nm VCSELs with enhanced mask margin up to 85 °C for 100G-SR4 Operation', 7500),
(11, '10000011', 47, 1633457695, 'Survivable Virtual Network Embedding Problem on Elastic Optical Networks with Node Failure', 8500),
(12, '10000012', 48, 1633457696, 'A Study of Neural Network Receivers in OFDM Systems Subject to Memoryless Impulse Noise', 7500),
(13, '10000013', 49, 1633457697, 'Data-Driven Symbol Definition for Color Shift Keying in Screen Camera Communications', 7500),
(14, '10000014', 50, 1633457697, 'Design of a DRX Sleep Scheduling Scheme with Carrier Aggregation in 3GPP Heterogeneous Cellular Networks', 7500),
(15, '10000015', 51, 1633457698, 'Performance Assessment for different SDN-Based Controllers', 7500),
(16, '10000016', 51, 1633457699, 'P2P locality-aware Live IPTV over SDN based FiWi Network', 7500),
(17, '10000017', 52, 1633457700, 'Impact of Artificial Seawater and Turbulence Factors on Underwater Optical Wireless Communication', 7500),
(18, '10000018', 53, 1633457700, 'Strategy-Proof Beam-Aware Multicast Resource Allocation Mechanism', 7500),
(19, '10000019', 55, 1633457719, 'A Scalable Optical Intra-Cluster Data Center Network with an Efficient WDMA protocol: Performance and Power Consumption Study', 7500),
(20, '10000020', 56, 1633457720, 'Using Machine Learning Techniques to Predict Recurrent Breast Cancer in Taiwan', 8500),
(21, '10000021', 57, 1633457721, 'Performance of Fully Digital Zero-Forcing Precoding in mmWave Massive MIMO-NOMA with Antenna Reduction', 8500),
(22, '10000022', 58, 1633457722, '', 3000),
(23, '10000023', 59, 1633457722, 'A wireless sensing device for open farmland and its back-end system design', 8500),
(24, '10000024', 60, 1633457723, 'PPoL: A Periodic Channel Hopping Sequence with Nearly Full Rendezvous Diversity', 8500),
(25, '10000025', 61, 1633457724, 'Channel Modeling of Air-to-Ground Signal Measurement with Two-Ray Ground-Reflection Model for UAV Communication Systems	', 12700),
(26, '10000026', 63, 1633457725, 'An improvement of cycle-based energy-saving scheme in medium-load traffic for NG-EPON networks', 8500),
(27, '10000027', 64, 1633457725, 'Secrecy Energy Efficiency Maximization for UAV Enabled Communication Systems', 7500),
(28, '10000028', 65, 1633457726, 'Collision Avoidance Control for Connected Drones in Air-Intersections', 7500),
(29, '10000029', 66, 1633457727, 'Activity Recognition Based on FR-CNN and Attention-Based LSTM Network', 8500),
(30, '10000030', 67, 1633457728, '1-bit Nonlinear Mapping Precoder for Downlink Massive MU-MIMO Systems', 7500),
(31, '10000031', 68, 1633457728, 'A Systematic Resource Management for VR Streaming on MECs', 8500),
(32, '10000032', 69, 1633457729, '', 1500),
(33, '10000033', 70, 1633457730, 'Extended Abstract）An Efficient AI Resource Allocation Algorithm Based on QoS', 8500),
(34, '10000034', 71, 1633457731, 'A Machine Learning Approach for CQI Feedback Delay in 5G and Beyond 5G Networks', 8500),
(35, '10000035', 72, 1633457732, 'A Positioning Control Module for Lubricate Railway and Lower Pantograph', 8500),
(36, '10000036', 73, 1633457732, 'QAM Signal Classification and Timing Jitter Identification Based on Eye Diagrams and Deep Learning', 7500),
(37, '10000037', 75, 1633457747, 'Using Machine Learning and Light Spatial Sequence Arrangement for Copying Positioning Unit Cell to Reduce Training Burden in Visible Light Positioning (VLP)', 7500),
(38, '10000038', 76, 1633457748, 'Cooperative Deep Learning-Based Uplink Distributed Fair Resource Allocation for Aerial Reconfigurable Intelligent Surfaces Wireless Networks', 8500),
(39, '10000039', 77, 1633457749, 'Modeling Implicit User Relations with Information Propagation Graph for User Influence Prediction', 7500),
(40, '10000040', 78, 1633457749, 'Learning from UAV Experimental Results for Performance Modeling of Reconfigurable Intelligent Surface Flying Platform', 12700),
(41, '10000041', 80, 1633457750, 'Hybrid Multicast and Unicast Streaming System with Layered Video Coding', 7500),
(42, '10000042', 81, 1633457751, 'Latest Advances in Spectrum Management for 6G Communications', 7500),
(43, '10000043', 82, 1633457752, 'Comparative Study on CDMA Code Design of PMCW Radar on Long-Range Multi-Objects Detection', 8500),
(44, '10000044', 83, 1633457752, 'RIS-assisted UAV Networks: Deployment Optimization with Reinforcement-Learning-Based Federated Learning', 12700),
(45, '10000045', 84, 1633457753, '12-Bit 200 MS/s Switched-Current Pipelined Analog-to-Digital Converter for High-Speed DSL', 7500),
(46, '10000046', 84, 1633457754, '12-Bit 200 MS/s Digital Transmitter for Very-High-Bit-Rate Digital Subscriber Loop', 7500),
(47, '10000047', 85, 1633457755, '5G Edge Computing Experiments with Intelligent Resource Allocation for Multi-Application Video Analytics', 7500),
(48, '10000048', 86, 1633457755, 'Simulated Throughput of the O-CDMA/ P-ALOHA Network with Variable-size-message Two-classes Multimedia Traffic', 7500),
(49, '10000049', 87, 1633457756, 'Wi-Fi DSAR: Wi-Fi based Indoor Localization using Denoising Supervised Autoencoder', 8500),
(50, '10000050', 88, 1633457757, 'Optical Focusing-based Adaptive Modulation for Optoacoustic Communication', 7500),
(51, '10000051', 89, 1633457757, 'A Deep Neural Network Equalizer for FSO Transmission System', 7500),
(52, '10000052', 90, 1633457758, '', 1500),
(53, '10000053', 91, 1633457759, 'Modulation Classification in a Multipath Fading Channel Using Deep Learning: 16QAM, 32QAM and 64QAM', 8500),
(54, '10000054', 95, 1633457782, 'A Simulation of Innovative Car Parking Bidding System', 8500),
(55, '10000055', 95, 1633457783, 'Data-driven Spatial Features Analysis Using Share of Voice in Commercial Area', 8500),
(56, '10000056', 96, 1633457783, 'Machine Learning-based Path Loss Modeling in Urban Propagation Environments', 8500),
(57, '10000057', 97, 1633457784, 'Prediction of THz Absorption and Inverse Design of Graphene-Based Metasurface Structure Using Deep Learning', 7500),
(58, '10000058', 99, 1633457785, 'Various microcavity lasers monolithically grown on planar on-axis Si (001) substrates', 7500),
(59, '10000059', 100, 1633457786, '3D-printed mold-assisted U-shaped optical fiber sensor for displacement sensing', 8500),
(60, '10000060', 101, 1633457786, 'High-Baud-Rate 32-QAM OFDM Single-arm and Dual-arm Encoded Silicon Mach-Zehnder Modulator', 7500),
(61, '10000061', 101, 1633457787, 'Impulse Response and Noise Figure of a 50-Gbps O-band Ge p-i-n Waveguide Photodiode with High Responsivity', 7500),
(62, '10000062', 102, 1633457788, 'Employing Telecom Fiber Cables as Sensing Media for Road Traffic Applications', 7500),
(63, '10000063', 103, 1633457789, 'Event identification by deep transfer learning with dual transformations', 8500),
(64, '10000064', 104, 1633457789, 'Multi-agent Learning based Anti-jamming Communications Against Cognitive Jammers', 8500),
(65, '10000065', 105, 1633457790, '', 3000),
(66, '10000066', 107, 1633457791, 'Design and spectral reconstruction assisted by intelligent algorithms for high-resolution Fourier transform spectrometer', 7500),
(67, '10000067', 109, 1633457791, 'Building a Mininet-based Fiber Optic Simulator', 7500),
(68, '10000068', 110, 1633457792, 'Channel Quality Estimation in 3D Drone Base Station for Future Wireless Network', 8500),
(69, '10000069', 111, 1633457793, 'Radio Resource Allocation for 5G Networks Using Deep Reinforcement Learning', 8500),
(70, '10000070', 112, 1633457794, 'Improving Routing Protocol for Low-Power and Lossy Networks over IoT Enviroment', 7500),
(71, '10000071', 113, 1633457794, 'Resource Allocation based on Genetic Algorithm for Cloud Computing', 7500),
(72, '10000072', 54, 1633457828, '40 Gb/s × 8 WDM Bi-directional Transmission in 100 GHz Channel Spacing using Dispersion Compensating Fiber', 7500),
(73, '10000073', 33, 1633484896, '', 1500),
(74, '10000074', 116, 1633515326, 'Edge-based Realtime Image Object Detection for UAV Missions', 7500),
(75, '10000075', 118, 1111, '遠傳電信股份有限公司', 100000),
(76, '10000076', 119, 111, '國立臺北科技大學電子工程系系友會', 100000);

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
  `studentid` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isveg` varchar(10) NOT NULL,
  `teamsid` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`id`, `pwd`, `name`, `email`, `indentid`, `position`, `affiliation`, `country`, `tel`, `ieeeid`, `studentid`, `isveg`, `teamsid`) VALUES
(29, '1', 'a', 'root', 3, '', '', '', '', NULL, NULL, '', ''),
(33, '2uaiigol', 'Chuan-Ming Liu', 'cmliu@ntut.edu.tw', 2, 'Prof.', 'National Taipei University of Technology', 'Taiwan', '+886-9-82201689', '41535578', '055503', '0', '11107@cc.ntut.edu.tw'),
(35, 'math5471', 'Chuan-Chi Lai', 'chuanclai@fcu.edu.tw', 1, 'Asst. Prof.', 'Feng Chia University', 'Taiwan', '+886-988234145', '92608640', '', '0', 'chuanclai@o365.fcu.edu.tw'),
(36, 'Trainbus@123', '', 'arnabmukherjee91@icloud.com', 0, '', '', '', '', '', '', '', ''),
(37, 'trinas142067', 'Man On Pun', 'simonpun@cuhk.edu.cn', 1, 'Assoc. Prof.', 'The Chinese University of Hong Kong, Shenzhen', 'China', '+86-755-84273823', '41493453', '', '0', ''),
(38, 'lemwocc90@', '', 'lemia.louail@univ-setif.dz', 0, '', '', '', '', '', '', '', ''),
(39, 'yy611118', 'Yang Yue', 'yueyang@nankai.edu.cn', 1, 'Prof.', 'Nankai University', 'China', '', '90597267', '', '0', ''),
(40, 'badluck1013', 'Te-Hua Liu', 'r09941030@ntu.edu.tw', 2, 'Mr.', '', 'Taiwan', '0976796368', '', 'R09941030', '0', ''),
(41, 'Cefiro00!!', 'Min-Li Wu', 'minliwu@cmlab.csie.ntu.edu.tw', 2, 'Mr.', 'Graduate Institute of Networking and Multimedia, National Taiwan University ', 'Taiwan', '+886972866136', '', 'R08944067', '0', 'minli.wu@outlook.com'),
(42, 'wocc2021', '', 'changintw@gmail.com', 0, '', '', '', '', '', '', '', ''),
(43, '123222949', 'hongyunn chen', 'd05944018@ntu.edu.tw', 2, 'Mr.', 'NTU', 'Taiwan', '0983424626', '95173514', 'D05944018', '0', ''),
(44, 'NCLab722', 'Chih-Lin Hu', 'chihlin.hu@gmail.com', 1, 'Dr.', 'National Central University', 'Taiwan', '(03)4227151ext.35575', '41435491', '', '0', 'chihlin.hu@gmail.com'),
(45, 'MazeN789@', 'MESHARI D. ALANAZI', 'mdalsayer@gmail.com', 2, 'Mr.', 'The University of Sheffield', 'United Kingdom', '07404557095', '', '1694631', '0', ''),
(46, 'tien3721', 'Hao-Tien Cheng', 'f06943156@ntu.edu.tw', 2, 'Mr.', 'National Taiwan University', 'Taiwan', '0906883381', '97092573', 'F06943156', '0', 'f06943156@g.ntu.edu.tw'),
(47, 'dd541001', 'Der-Rong Din', 'deron@cc.ncue.edu.tw', 0, 'Prof.', 'Department CSIE, National Changhua University of Education (NCUE)', 'Taiwan', '0928188928', '', '', '0', ''),
(48, 'wireless69', 'Der-Feng Tseng', 'dtseng@mail.ntust.edu.tw', 1, 'Assoc. Prof.', 'National Taiwan University of Science and Technology', 'Taiwan', '886-2737-6513', '90318364', '', '0', 'dtseng@ms.ntust.edu.tw'),
(49, 'CCOWAlex2021', 'Alex Cartagena Gordi', 'acartagena@untels.edu.pe', 1, 'Prof.', 'Universidad Nacional Tecnologica de Lima Sur', 'Peru', '+51999490919', ' 41559526', '', '0', 'acartagena@untels'),
(50, 'c1054jjchen', 'Jen-Jee Chen', 'jenjee@nctu.edu.tw', 1, 'Assoc. Prof.', 'National Yang Ming Chiao Tung University', 'Taiwan', '+886-6-303-2121 ext.57902', '80381923', '', '0', 'jenjee@o365.nctu.edu.tw'),
(51, 'TUb35aRkbHXKFz8', 'I-Shyan Hwang', 'ishwang@saturn.yzu.edu.tw', 1, 'Prof.', 'Yuan Ze University', 'Taiwan', '0900246157', '00708560', '', '0', 'ishwang@saturn.yzu.edu.tw'),
(52, 'Frenzyim96.', 'Shofuro Afifah', 'm10819802@gapps.ntust.edu.tw', 2, 'Ms.', 'National Taiwan University of Science and Technology', 'Taiwan', '0973092684', '97910375', 'D11019802', '1', 'Shofuro Afifah'),
(53, 'su112358132134', 'Pan-Yang Su', 'b07901093@ntu.edu.tw', 2, 'Mr.', 'National Taiwan University', 'Taiwan', '0918016180', '97969480', 'B07901093', '0', 'su3500su3500@gmail.com'),
(54, 'Cantik18*', 'Lina ', 'm10819803@gapps.ntust.edu.tw', 2, 'Ms.', 'National Taiwan University of Science and Technology', 'Taiwan', '0902477530', '97955740', 'M10819803', '1', 'Lina Marlina'),
(55, 'Newlife1', 'Peristera Baziana', 'baziana@uth.gr', 1, 'Asst. Prof.', 'University of Thessaly', 'Greece', '', '90856021', '', '0', ''),
(56, 'Aa2054207', 'Ying-Chen Chen', 'amy0988147957@gmail.com', 2, 'Ms.', '', 'Taiwan', '+886988147957', '', '1059001', '0', ''),
(57, 'IloveU123', 'Nouran Arafat', 'nouran.zaghlool@guc.edu.eg', 0, 'Ms.', 'German University in Cairo', 'Egypt', '+201003791609', '', '', '0', '+201003791609'),
(58, 'Sulochana@02', 'Pooja Prajapat', 'prajapat.pooja98@gmail.com', 0, 'Ms.', 'Indian Institute of Space Science and Technology', 'India', '8739967082', '', '', '1', 'pooja.sc17b108@ug.iist.ac.in'),
(59, '2lgigoal', 'Chien-Hung Lai', 'laisan86@gmail.com', 0, 'Dr.', 'Electronics Engineering', 'Taiwan', '02-2771-2171', '', '', '0', '12245@cc.ntut.edu.tw'),
(60, 'nthulab34130', 'Yi-Jheng Lin', 's107064901@m107.nthu.edu.tw', 0, 'Mr.', 'National Tsing Hua University', 'Taiwan', '(+886) 975-097-406', '', '', '0', ''),
(61, 'Ss87315teve', 'Chia-Chuan Chiu', 'steve.ee09@nycu.edu.tw', 2, 'Mr.', 'National Yang Ming Chiao Tung University', 'Taiwan', '0910618224', '', '409504010', '0', ''),
(62, '0140ZXas', 'Bing Hao', '40430142@gm.nfu.edu.tw', 2, 'Mr.', '[Electrical and Computer Engineering], National Yang Ming Chiao Tung University, [Hsinchu City 300], Taiwan.', 'Taiwan', '0912468409', '', '410511003', '0', ''),
(63, 'Clare862', 'Chien-Ping Liu', 'clare@ml.tpcu.edu.tw', 0, 'Asst. Prof.', 'Taipei City University of Science and Technology', 'Taiwan', '0937933379', '', '', '0', '083017@mso.tpcu.edu.tw'),
(64, '123456789', 'Gongchao Su', '1085069@qq.com', 1, 'Dr.', 'Shenzhen ', 'China', '+86-18879752997', '91139698', '', '0', ''),
(65, 'sunshine', 'Chao-Yang lee', 'chaoyang@nfu.edu.tw', 1, 'Asst. Prof.', 'National Formosa University', 'Taiwan', '05-6313436', '96342883', '', '0', ''),
(66, 'euler7314', 'Ching Jung Huang', 't100319012@ntut.org.tw', 2, 'Mr.', 'National Taipei University of Technology', 'Taiwan', '0926815009', '', '100319012', '0', ''),
(67, 'a0m1baby', 'Jung-Lang Yu', 'yujl@mail.fju.edu.tw', 1, 'Prof.', 'Fu Jen Catholic University, Department of Electrical Engineering', 'Taiwan', '+886-2-29052102', '41627949', '', '0', '049469@m365.fju.edu.tw'),
(68, 'andy551209', 'Yu-Syuan Jheng', 'yuxian@cmlab.csie.ntu.edu.tw', 2, 'Mr.', 'National Taiwan University', 'Taiwan', '0955759517', '', 'R09944038', '0', 'yuxian@cmlab.csie.ntu.edu.tw'),
(69, 'juanjuan86', 'Chun-Yen Lin', 'apple234821@gmail.com', 2, 'Ms.', 'National Tsing Hua University', 'Taiwan', '+886932892565', '', '109064505', '0', '109064505@office365.nthu.edu.tw'),
(70, '1J4dk3vu4au4', 'SUNG-YUN CHAI', 't108362549@ntut.edu.tw', 0, 'Dr.', 'National Taipei University of Technology', 'Taiwan', '+886987928463', '', '', '0', 'peter.zhai092088@gmail.com'),
(71, 'Wocckey2021#', 'Andson Balieiro', 'amb4@cin.ufpe.br', 0, 'Prof.', 'Universidade Federal de Pernambuco ', 'Brazil', '+5581998568611', '', '', '0', ''),
(72, 'mp332b4c', 'Ming-Shian  Lin', 'd98943009@ntu.edu.tw', 0, 'Mr.', 'New Taipei Metro Corporation', 'Taiwan', '0921817131', '', '', '0', ''),
(73, 'Wocc@Alhussain#857', 'Alhussain Almrhabi', 'aalmarha@stevens.edu', 1, 'Mr.', 'Stevens Institute of Technology', 'United States', '', '92415226', '', '0', ''),
(74, 'lhj960425', 'Huaijian Luo', '18044198r@connect.polyu.hk', 2, 'Mr.', 'The Hong Kong Polytechnic University', 'China', '+852 55776066', '', '18044198R', '0', '18044198r@connect.polyu.hk'),
(75, 'akb48ske48', 'Chi-Wai Chow', 'cwchow@faculty.nctu.edu.tw', 1, 'Prof.', 'National Yang Ming Chiao Tung University', 'Taiwan', '03-5712121', '41585071', '', '0', ''),
(76, 'Gunies144', 'WeiTing Chen', 'wchen4520.ee09@nycu.edu.tw', 2, 'Mr.', 'National Yang Ming Chiao Tung University', 'Taiwan', '0916494144', '', '309511057', '0', ' wchen4520.ee09@nycu.edu.tw'),
(77, 'JHW4Chri', 'Jenq-Haur Wang', 'jhwang@ntut.edu.tw', 1, 'Assoc. Prof.', 'National Taipei University of Technology', 'Taiwan', '+886-2-27712171#4238', '41458808', '', '0', '11297@cc.ntut.edu.tw'),
(78, 'Justdo1t', 'Bo-Rong Wu', 'justin.ee09@nycu.edu.tw', 2, 'Mr.', 'National Yang Ming Chiao Tung University', 'Taiwan', '0932786927', '', '309511044', '0', 'justin.cv05@o365.nctu.edu.tw'),
(79, 'lovekc1121', '', 'd86518.ms04@g2.nctu.edu.tw', 0, '', '', '', '', '', '', '', ''),
(80, 'wl12202222', 'Shih-Hsuan Yang', 'shyang@ntut.edu.tw', 1, 'Prof.', 'National Taipei University of Technology', 'Taiwan', '+886-2-27712171-4211/1101', '00617506', '', '0', ''),
(81, 'lichun123', 'Li-Chun Wang', 'wang@nycu.edu.tw', 1, 'Prof.', 'National Yang Ming Chiao Tung University', 'Taiwan', '0988588091', '03395118', '', '0', ''),
(82, 'n3562359', 'Yun Ruei Li', 'ray_yrl@outlook.com', 2, '', 'NYCU', 'Taiwan', '0937868569', '', '0780701', '0', 'Ray Li'),
(83, 'Woccaccount1', 'Hsuan-Fu Wang', 'frankey.ee09@nycu.edu.tw', 2, 'Mr.', 'National Yang Ming Chiao Tung University', 'Taiwan', '0975195192', '', '309511046', '1', ''),
(84, 'ntut2121', 'GuoMing Sung', 'gmsung@ntut.edu.tw', 1, 'Prof.', 'National Taipei University of Technology', 'Taiwan', '+886 2 27712171 EXT 2121', '40229482', '', '0', ''),
(85, 'jhAPTX4869', '建翰 吳', 'R10921065@ntu.edu.tw', 2, 'Ms.', 'Department of Electrical Engineering of National Taiwan University', 'Taiwan', '0966972431', '97970417', 'R10921065', '0', ''),
(86, 'C120208416', 'Shu-Ming Tseng', 'shuming@ntut.edu.tw', 1, 'Prof.', 'National Taipei University of Technology', 'Taiwan', '+886-2-27712171 ext 2216', '40135990', '', '0', 'shuming@mail.ntut.edu.tw'),
(87, 'woccD04944002', 'Ta Wei Yang', 'd04944002@ntu.edu.tw', 2, 'Mr.', 'National Taiwan University', 'Taiwan', '', '', 'D04944002', '0', ''),
(88, 'UMBC2021', 'Mohamed Younis', 'younis@umbc.edu', 1, 'Prof.', 'University of Maryland Baltimore County', 'United States', '4104553968', '40180979', '', '0', ''),
(89, 'PPeg.eo90g', 'Peng-Chun Peng', 'pcpeng@mail.ntut.edu.tw', 1, 'Prof.', 'National Taipei University of Technology', 'Taiwan', '', '90829598', '', '0', ''),
(90, 'Masroor@124', 'Mohd Mir', 'mohdmir121@gmail.com', 2, 'Mr.', 'National Central University, Taiwan', 'Taiwan', '+886901325512', '', '106583602', '1', 'yaseen.eng1000@hotmail.com'),
(91, 'Sa112233!', 'Abdullah Samarkandi', 'asamarka@stevens.edu', 2, 'Mr.', 'Stevens Institute of Technology ', 'Saudi Arabia', '+17193211706', '97978382', '10431559', '0', ''),
(92, '31253125', 'Erfan Dejband', 'e.dejband@gmail.com', 2, 'Dr.', '', 'Taiwan', '', '', '109319413', '0', ''),
(93, 'Anugoel1!', 'ANU GOEL', 'anu.goel@ymail.com', 0, 'Asst. Prof.', 'NSUT EAST CAMPUS (formerly AIACTR), Affiliated to GGSIPU, Delhi, India', 'India', '9868333454', '', '', '1', ''),
(94, 'l1l1l1l1', '', 'sungweifu@gmail.com', 0, '', '', '', '', '', '', '', ''),
(95, 'wowwowwow', 'Winston Yang', 'winston-yang@hotmail.com', 2, '', 'Doctoral Program of Design National Taipei University of Technology', 'Taiwan', '933949427', '', '106859009', '0', ''),
(96, 'wocc2021', 'Rong-Terng Juang', 'rtjuang@mail.fcu.edu.tw', 0, 'Asst. Prof.', 'Feng Chia University', 'Taiwan', '', '', '', '0', 'rtjuang@o365.fcu.edu.tw'),
(97, 'ntut416416!', 'Tan-Hsu Tan', 'thtan@ntut.edu.tw', 1, 'Prof.', 'National Taipei University of Technology', 'Taiwan', '886-0936310710', '92076665', '', '0', ''),
(98, 'Jacky860818', 'Jyun-Yang Su', 'r08941036@ntu.edu.tw', 2, 'Mr.', 'Graduate Institute of Photonics and Optoelectronics', 'Taiwan', '', '', 'R08941036', '0', ''),
(99, 'NOEL2017', 'Zhaoyu Zhang', 'zhangzy@cuhk.edu.cn', 1, 'Assoc. Prof.', 'The Chinese University of Hong Kong, Shenzhen', 'China', '18128836453', '97615065', '', '0', ''),
(100, 'nsysu52527000', 'Hung-Jen Liao', 'redpig0808@gmail.com', 2, 'Mr.', 'National Sun Yat-sen University', 'Taiwan', '0921012417', '', 'B073090032', '0', ''),
(101, 'grlin1806', 'Gong-Ru Lin', 'grlin@ntu.edu.tw', 1, 'Prof.', 'Graduate Institute of Photonics and Optoelectronics, and Department of Electrical Engineering, National Taiwan University, Taipei, Taiwan.', 'Taiwan', '0972525643', '03289675', '', '0', ''),
(102, 'T220898274', 'MingFang Huang', 'mhuang@nec-labs.com', 1, 'Dr.', 'NEC Laboratories America', 'United States', '6099514812', '1002658', '', '0', 'mhuang@nec-labs.com '),
(103, 'vgrbft159', 'Jun-Li Lu', 'jllu@slis.tsukuba.ac.jp', 0, 'Dr.', 'Faculty of Library, Information and Media Science, University of Tsukuba', 'Japan', '(+81)90-3949-7401', '', '', '0', 'None'),
(104, 'Mj02mj02', 'Milidu Jayaweera', 'milidutkd@gmail.com', 0, 'Mr.', 'La Cueva H.S.', 'United States', '5056201805', '', '', '0', 'na'),
(105, 'ckcchcpc', 'Po-Hao Chang', 'po@gms.ndhu.edu.tw', 0, 'Asst. Prof.', 'Dept. of Electrical Engineering, Natl. Dong Hwa University', 'Taiwan', '+886-3-8905076', '', '', '0', ''),
(106, 'aliadevrajpapu1007*N', 'Naveen N', 'naveennmj2007@gmail.com', 0, 'Asst. Prof.', 'Visvesvaraya Technological University', 'India', '9986926311', '', '', '0', 'naveennmj2007@gmail.com'),
(107, 'Optics2046', 'Changyuan YU', 'changyuan.yu@polyu.edu.hk', 1, 'Prof.', 'The Hong Kong Polytechnic University', 'Hong Kong', '+852-27666258', '41538117', '', '0', 'changyuan.yu@polyu.edu.hk'),
(109, 'dHtcgn7aMRP2GpQ', 'Yaoqing Liu', 'yliu@fdu.edu', 1, '', 'FDU', 'United States', '2016922267', '93625245', '', '0', ''),
(110, 'poyuan1124', 'Shiann Shiun JENG', 'ssjeng@gms.ndhu.edu.tw', 0, 'Prof.', 'National Dong Hwa University', 'Taiwan', '886-3-8905065', '', '', '0', ''),
(111, 'ntut2248', 'Lin Hsin-Piao', 'hplin@ntut.edu.tw', 0, 'Prof.', 'National Taipei University of Technology ', 'Taiwan', '886-935747960', '', '', '0', ''),
(112, 'nabeel2010', 'Khalid A. Darabkh', 'k.darabkeh@ju.edu.jo', 1, 'Prof.', 'The University of Jordan ', 'Jordan', '+962-796969219', '92058980', '', '0', ''),
(113, 'ysl2WOCC', 'Yao-Chung Chang', 'ycc.nttu@gmail.com', 1, 'Prof.', 'National Taitung University', 'Taiwan', '886-89-517557', '41574697', '', '0', ''),
(114, 'kym03120', 'Yungmin Kim', 't109990022@ntut.org.tw', 2, 'Ms.', 'NTUT IEECS', 'Korea, Republic of', '0972027715', '', '109990022', '0', '109990022@cc.ntut.edu.tw'),
(115, '080402_l*T', 'Theodore Lucky Tendy', 't109990007@ntut.org.tw', 2, 'Mr.', 'Prof.劉傳銘', 'Taiwan', '0902279148', '', '109990007', '0', '109990007@cc.ntut.edu.tw'),
(116, '3235281039', 'Chi-Yu Li', 'chiyuli@cs.nctu.edu.tw', 1, 'Assoc. Prof.', 'National Yang Ming Chiao Tung University', 'Taiwan', '0972341221', '92076073', '', '0', 'chiyuli@o365.nctu.edu.tw'),
(117, 'ntut0315', 'Hyun Jung', 'lightmaker95@gmail.com', 2, 'Ms.', '', 'Taiwan', '0965038315', '', '109990004', '0', '109990004@cc.ntut.edu.tw'),
(118, '123', '遠傳', '遠傳', 0, '', '', '', '', NULL, NULL, '', ''),
(119, '123', '電子工程系系友會', '電子工程系系友會', 0, '', '', '', '', NULL, NULL, '', '');

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
  ADD UNIQUE KEY `receiptunique` (`receiptid`),
  ADD KEY `paymodeidex` (`pid`),
  ADD KEY `aidindex` (`aid`),
  ADD KEY `ridx` (`rid`);

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
-- 資料表索引 `Receipt`
--
ALTER TABLE `Receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidxxx` (`uid`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `indentify`
--
ALTER TABLE `indentify`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `paymentItem`
--
ALTER TABLE `paymentItem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=839;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `paymentrecord`
--
ALTER TABLE `paymentrecord`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1630621002;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `paymode`
--
ALTER TABLE `paymode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Receipt`
--
ALTER TABLE `Receipt`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

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
  ADD CONSTRAINT `aidindex` FOREIGN KEY (`aid`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paymodeidex` FOREIGN KEY (`pid`) REFERENCES `paymode` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `receiptidx` FOREIGN KEY (`receiptid`) REFERENCES `Receipt` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `ridx` FOREIGN KEY (`rid`) REFERENCES `paymentrecord` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- 資料表的限制式 `Receipt`
--
ALTER TABLE `Receipt`
  ADD CONSTRAINT `uidxxx` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 資料表的限制式 `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `indentifyidx` FOREIGN KEY (`indentid`) REFERENCES `indentify` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
