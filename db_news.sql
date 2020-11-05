-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2020 at 02:36 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_news`
--

CREATE TABLE `tb_news` (
  `judul` varchar(100) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `isi` longtext NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `photo_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_news`
--

INSERT INTO `tb_news` (`judul`, `kategori`, `isi`, `waktu`, `id_user`, `id`, `photo_url`) VALUES
('judul  Berita S ience', 'Tech', 'Isi konten news', '2020-11-05 13:28:04', 11, 28, 'http://192.168.43.49/webservice_news/assets/judul  Berita S ience.jpeg'),
('Judul Science', 'Tech', 'konten berita', '2020-11-05 13:27:11', 11, 29, 'http://192.168.43.49/webservice_news/assets/Judul Science.jpeg'),
('Judul Politics', 'Poitics', 'Content  berita5', '2020-11-05 13:25:20', 11, 30, 'http://192.168.43.49/webservice_news/assets/Judul Politics.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` int(11) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `nama`, `email`, `phone`, `pass`) VALUES
(1, '1', '1', 32432, '$2y$10$8.CEG5mD3mSZnVvdmwwccucCL2qIBZ2XCELJHYTeu8Pho/4O1G5/a'),
(2, '1', 'rifanhidayat0811@gmai.com', 32432, '$2y$10$ni3uP4wMEfCdzMBf2wKfn.R4YPgMTrGYVwXFvam2O7QVjSoAZQP4i'),
(3, 'Rifan Hidayat', 'rifanhidayat0811@gmail.com', 2147483647, '$2y$10$lgqAAltfViVc.pPJNzgYL.h1qMecg.CDFZxeG1aA0F8TOdezyFe82'),
(4, 'rifanhidayat', 'rifanhidayat@gmail.com', 2147483647, '$2y$10$0TpqJ3avbZhThMAG0CCVTOSXx0TffC/ZYX0y11xQukbKZk9Gmvm9q'),
(5, 'Rifan', 'rifan@gmail.com', 897676, '$2y$10$ue.sKFdM/4fPLxuUEBhkpuNNKBYbCnmuGIivs6FkU8NIf2rAggtVS'),
(6, 'ndj', 'sjjs@.com', 7979, 'jsjsj'),
(7, 'bzb', 'nzbzb@', 7979, 'rifanhidayat'),
(8, 'bzb', 'bsh@', 79, 'nB'),
(9, 'Rifan', 'rifanhidayat11@gmail.com', 2147483647, 'rifan'),
(10, 'rifan', 'rifan1@gmail.com', 849, 'rifan'),
(11, 'RifanHidayat', 'rifan11@gmail.com', 4979, 'rifanhidayat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_news`
--
ALTER TABLE `tb_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_news`
--
ALTER TABLE `tb_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
