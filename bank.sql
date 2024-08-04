-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2023 at 08:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joki`
--

-- --------------------------------------------------------

--
-- Table structure for table `datanasabah`
--

CREATE TABLE `datanasabah` (
  `NoRekening` char(11) NOT NULL,
  `NamaNasabah` varchar(150) NOT NULL,
  `JenisKelamin` enum('L','P') NOT NULL,
  `TempatLahir` varchar(150) NOT NULL,
  `TanggalLahir` date NOT NULL,
  `NoHandphone` varchar(20) NOT NULL,
  `AlamatNasabah` mediumtext NOT NULL,
  `tglDaftar` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `datanasabah`
--

INSERT INTO `datanasabah` (`NoRekening`, `NamaNasabah`, `JenisKelamin`, `TempatLahir`, `TanggalLahir`, `NoHandphone`, `AlamatNasabah`, `tglDaftar`) VALUES
('diana', 'diana', 'P', 'jakarta', '2000-09-12', '08956765434567', 'kelana mencari rumah', '2023-12-05 11:34:11'),
('thor', 'thor', 'L', 'pp', '2023-12-05', '0879872543653', 'Jalana Mangga 2', '2023-12-05 11:32:43');

--
-- Triggers `datanasabah`
--
DELIMITER $$
CREATE TRIGGER `tambahPengguna` AFTER INSERT ON `datanasabah` FOR EACH ROW BEGIN INSERT INTO dataUser (dataUser.username,dataUser.password,dataUser.namaUser,dataUser.levelUser) VALUES (new.NoRekening,md5(new.TanggalLahir),new.NamaNasabah,'nasabah'); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `datasimpanan`
--

CREATE TABLE `datasimpanan` (
  `IdSimpanan` int(11) NOT NULL,
  `WaktuTransaksi` datetime NOT NULL,
  `MutasiSimpanan` enum('Simpan','Tarik') NOT NULL,
  `NoRekening` char(5) NOT NULL,
  `Jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `datasimpanan`
--

INSERT INTO `datasimpanan` (`IdSimpanan`, `WaktuTransaksi`, `MutasiSimpanan`, `NoRekening`, `Jumlah`) VALUES
(28, '2023-11-12 22:15:00', 'Simpan', '', 5000),
(29, '2023-11-12 22:15:56', 'Simpan', 'Dea', 50000),
(30, '2023-11-12 22:25:43', 'Tarik', 'Dea', 500),
(31, '2023-11-14 11:31:37', 'Simpan', 'abcde', 50000),
(32, '2023-11-14 11:31:54', 'Simpan', 'abcde', 100000),
(33, '2023-11-14 11:32:23', 'Tarik', 'abcde', 15000),
(34, '2023-12-05 11:29:19', 'Simpan', '57298', 20000),
(35, '2023-12-05 11:30:16', 'Tarik', '57298', 100),
(36, '2023-12-05 11:33:06', 'Simpan', 'thor', 90000),
(37, '2023-12-05 11:34:36', 'Simpan', 'diana', 100000),
(38, '2023-12-05 11:44:43', 'Simpan', 'Thori', 100000),
(39, '2023-12-05 11:44:51', 'Simpan', 'Thori', 50000),
(40, '2023-12-05 11:45:02', 'Simpan', 'thor', 50000),
(41, '2023-12-05 11:45:24', 'Tarik', 'thor', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `datauser`
--

CREATE TABLE `datauser` (
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `namaUser` varchar(30) NOT NULL,
  `levelUser` enum('teller','manager','admin','cs','nasabah') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `datauser`
--

INSERT INTO `datauser` (`username`, `password`, `namaUser`, `levelUser`) VALUES
('57298456023', '4198c8f11de82f16e395f9c750ca2a11', 'diana', 'nasabah'),
('65433456786', '1580ba5387a5f09fd756401d039eaadc', 'kiko', 'nasabah'),
('abcde', '00dc6d45a0ee3d9fcf09147b8330901e', 'Diana', 'nasabah'),
('cs', '202cb962ac59075b964b07152d234b70', 'Budi', 'cs'),
('Dea', '29bf5a7f59b4afd55ddf2b6db25a3f8a', 'Dea', 'nasabah'),
('diana', 'fd8ae7f7c0dc150c73478a107a5f2b51', 'diana', 'nasabah'),
('manager', '202cb962ac59075b964b07152d234b70', 'admin', 'manager'),
('teller', '202cb962ac59075b964b07152d234b70', 'Rina', 'teller'),
('thor', 'f95ae002652c2cb1fcbe973add2d4d6f', 'thor', 'nasabah'),
('Thoriq', '4198c8f11de82f16e395f9c750ca2a11', 'Thoriq', 'nasabah');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datanasabah`
--
ALTER TABLE `datanasabah`
  ADD PRIMARY KEY (`NoRekening`);

--
-- Indexes for table `datasimpanan`
--
ALTER TABLE `datasimpanan`
  ADD PRIMARY KEY (`IdSimpanan`);

--
-- Indexes for table `datauser`
--
ALTER TABLE `datauser`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datasimpanan`
--
ALTER TABLE `datasimpanan`
  MODIFY `IdSimpanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
