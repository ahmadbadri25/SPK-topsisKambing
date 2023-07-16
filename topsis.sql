-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jul 2023 pada 21.13
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topsis`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kambing`
--

CREATE TABLE `kambing` (
  `id_kambing` int(10) NOT NULL,
  `no_kalung` varchar(6) NOT NULL,
  `ciri_khas` text NOT NULL,
  `tanggal_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kambing`
--

INSERT INTO `kambing` (`id_kambing`, `no_kalung`, `ciri_khas`, `tanggal_input`) VALUES
(6, 'A1', 'Sehat', '2023-07-13'),
(7, 'A2', 'Domba Garut', '2023-07-13'),
(8, 'A3', 'Kambing Muda', '2023-07-13'),
(9, '04', 'Etawa', '2023-07-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `type` enum('benefit','cost') NOT NULL,
  `bobot` float NOT NULL,
  `ada_pilihan` tinyint(1) DEFAULT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama`, `type`, `bobot`, `ada_pilihan`, `urutan_order`) VALUES
(11, 'C1', 'benefit', 1, 0, 0),
(12, 'C2', 'benefit', 0.75, 0, 1),
(13, 'C3', 'benefit', 0.5, 0, 2),
(14, 'C4', 'cost', 0.25, 0, 5),
(15, 'C5', 'cost', 0.5, 0, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_kambing`
--

CREATE TABLE `nilai_kambing` (
  `id_nilai_kambing` int(11) NOT NULL,
  `id_kambing` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_kambing`
--

INSERT INTO `nilai_kambing` (`id_nilai_kambing`, `id_kambing`, `id_kriteria`, `nilai`) VALUES
(25, 8, 11, 1),
(26, 8, 12, 0.5),
(27, 8, 13, 0.5),
(28, 8, 14, 0.75),
(30, 6, 11, 0.5),
(31, 6, 12, 0.75),
(32, 6, 13, 0.75),
(33, 6, 14, 0.5),
(35, 7, 11, 0.75),
(36, 7, 12, 1),
(37, 7, 13, 0.75),
(38, 7, 14, 0.25),
(43, 6, 15, 0.25),
(48, 7, 15, 0.5),
(53, 8, 15, 0.5),
(54, 9, 11, 0.75),
(55, 9, 12, 1),
(56, 9, 13, 0.75),
(57, 9, 14, 0.25),
(58, 9, 15, 0.25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pilihan_kriteria`
--

CREATE TABLE `pilihan_kriteria` (
  `id_pil_kriteria` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nilai` float NOT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `role` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `email`, `alamat`, `role`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Ihza Fadhilah', 'Onicesport@gmail.com', 'Jalan Naik Turun 3312', '1'),
(7, 'petugas', '670489f94b6997a870b148f74744ee5676304925', 'Hansel', 'test@thesamplemail.com', 'test', '2'),
(8, 'baru', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'ihza', 'fadhilah@gmail.com', 'Depok', '1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kambing`
--
ALTER TABLE `kambing`
  ADD PRIMARY KEY (`id_kambing`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `nilai_kambing`
--
ALTER TABLE `nilai_kambing`
  ADD PRIMARY KEY (`id_nilai_kambing`),
  ADD UNIQUE KEY `id_kambing_2` (`id_kambing`,`id_kriteria`),
  ADD KEY `id_kambing` (`id_kambing`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD PRIMARY KEY (`id_pil_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kambing`
--
ALTER TABLE `kambing`
  MODIFY `id_kambing` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `nilai_kambing`
--
ALTER TABLE `nilai_kambing`
  MODIFY `id_nilai_kambing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT untuk tabel `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  MODIFY `id_pil_kriteria` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai_kambing`
--
ALTER TABLE `nilai_kambing`
  ADD CONSTRAINT `nilai_kambing_ibfk_1` FOREIGN KEY (`id_kambing`) REFERENCES `kambing` (`id_kambing`),
  ADD CONSTRAINT `nilai_kambing_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD CONSTRAINT `pilihan_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
