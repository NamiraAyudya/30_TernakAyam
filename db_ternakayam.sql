-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 13, 2026 at 01:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ternakayam`
--

-- --------------------------------------------------------

--
-- Table structure for table `ayam`
--

CREATE TABLE `ayam` (
  `id` int(11) NOT NULL,
  `kode_ayam` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ayam`
--

INSERT INTO `ayam` (`id`, `kode_ayam`, `jumlah`, `tanggal_masuk`, `keterangan`) VALUES
(1, '', 0, '0000-00-00', ''),
(2, 'AY001', 300, '2026-08-01', ''),
(3, 'AY002', 500, '2026-10-10', 'Produksi telur pada hari ini');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jumlah_langganan` int(11) NOT NULL DEFAULT 0,
  `satuan` varchar(20) DEFAULT 'kg',
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `pembeli` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 0,
  `harga` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `tanggal`, `pembeli`, `jumlah`, `harga`, `total`) VALUES
(2, '2026-10-04', 'siti', 50, 1500.00, 75000.00),
(3, '2026-10-10', 'Ibu dwi', 50, 1500.00, 75000.00);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` decimal(12,2) NOT NULL DEFAULT 0.00,
  `satuan` varchar(20) NOT NULL DEFAULT 'butir',
  `deskripsi` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `harga`, `satuan`, `deskripsi`, `foto`) VALUES
(2, 'Telur Besar', 1500.00, 'butir', 'Telur Besar yang fresh dengan harga terjangkau per butir', NULL),
(3, 'Telur Kecil', 1200.00, 'butir', 'Telur kecil yang fresh dengan harga terjangkau', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produksi_telur`
--

CREATE TABLE `produksi_telur` (
  `id_produksi` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_telur` int(11) NOT NULL DEFAULT 0,
  `satuan` varchar(20) NOT NULL DEFAULT 'butir',
  `telur_rusak` int(11) NOT NULL DEFAULT 0,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produksi_telur`
--

INSERT INTO `produksi_telur` (`id_produksi`, `tanggal`, `jumlah_telur`, `satuan`, `telur_rusak`, `keterangan`) VALUES
(1, '2026-09-01', 500, 'butir', 20, ''),
(2, '2026-10-06', 100, 'butir', 0, ''),
(3, '2026-10-06', 150, 'butir', 10, ''),
(4, '2026-10-10', 500, 'butir', 0, ''),
(5, '2026-10-13', 500, 'butir', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `stok_telur`
--

CREATE TABLE `stok_telur` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `masuk` int(11) NOT NULL DEFAULT 0,
  `terjual` int(11) NOT NULL DEFAULT 0,
  `rusak` int(11) NOT NULL DEFAULT 0,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_telur`
--

INSERT INTO `stok_telur` (`id`, `tanggal`, `masuk`, `terjual`, `rusak`, `keterangan`) VALUES
(1, '2026-10-01', 500, 100, 10, ''),
(2, '2026-10-13', 500, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`) VALUES
(1, 'admin', '$2y$10$y5wSxwv9hLH/6fcEP8qKlOpAGXb69WNmiMki5TN7OkmMVgYz1s2V2', 'Administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ayam`
--
ALTER TABLE `ayam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produksi_telur`
--
ALTER TABLE `produksi_telur`
  ADD PRIMARY KEY (`id_produksi`);

--
-- Indexes for table `stok_telur`
--
ALTER TABLE `stok_telur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ayam`
--
ALTER TABLE `ayam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produksi_telur`
--
ALTER TABLE `produksi_telur`
  MODIFY `id_produksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stok_telur`
--
ALTER TABLE `stok_telur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
