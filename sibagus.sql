-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jan 2024 pada 13.09
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sibagus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `merk` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `merk`, `tipe`, `satuan`) VALUES
('1', 'Kursi Kantor', 'Doodook', 'Kursi kantor air spring', 'Pcs'),
('2', 'Kursi Sofa', 'Soph', 'Kursi sofa panjang', 'Pcs'),
('3', 'Meja Kerja', 'Gawee', 'Meja kerja kayu dan kabinet', 'Pcs'),
('4', 'Kipas Angin', 'Semwing', 'Kipas angin dinding', 'Pcs'),
('5', 'Karpet', 'Ambal', 'Karpet permadani', 'Lembar'),
('6', 'Monitor Komputer', 'Nitro', 'Ultrawide 24 inch', 'Pcs'),
('7', 'Komputer Personal', 'Ternal', 'Core i7 Gen 12, SSD 256 GB, Ram 8 GB', 'Pcs'),
('8', 'pulpen', 'kenko', '', 'pcs'),
('8787iuiuiui', 'tip-ex', 'kenko', '', 'pcs'),
('bkt67868767868', 'kertas', 'sidu', '', 'pcs'),
('BR002', 'Coba', 'Test', '', 'Pcs');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_pemohon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `kode_barang`, `tanggal`, `nama_pemohon`) VALUES
(15, '8787iuiuiui', '2024-01-19', 'EVY DIYANTI'),
(16, '8', '2024-01-19', 'ALFISYAHRIN FIRDAUS, S.H.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar_detail`
--

CREATE TABLE `barang_keluar_detail` (
  `id` int(11) NOT NULL,
  `barang_keluar_id` int(11) NOT NULL,
  `barang_id` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `status_kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_keluar_detail`
--

INSERT INTO `barang_keluar_detail` (`id`, `barang_keluar_id`, `barang_id`, `jumlah`, `satuan`, `status_kode`) VALUES
(18, 15, '8787iuiuiui', 1, NULL, 'Belum'),
(19, 16, '8', 0, NULL, 'Belum'),
(20, 8, '8', 18, 'pcs', 'Belum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `no_bukti` varchar(50) NOT NULL,
  `sumber_dana` varchar(255) DEFAULT NULL,
  `pemasok_id` int(11) DEFAULT NULL,
  `karyawan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `tanggal`, `no_bukti`, `sumber_dana`, `pemasok_id`, `karyawan_id`) VALUES
(10, '2024-01-19', 'BKT009', NULL, NULL, 2),
(11, '2024-01-19', '0708989089080980', NULL, NULL, 1),
(12, '2024-01-19', '070898908909090909090', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk_detail`
--

CREATE TABLE `barang_masuk_detail` (
  `id` int(11) NOT NULL,
  `barang_masuk_id` int(11) NOT NULL,
  `barang_id` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `status_kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_masuk_detail`
--

INSERT INTO `barang_masuk_detail` (`id`, `barang_masuk_id`, `barang_id`, `jumlah`, `status_kode`) VALUES
(1, 1, '2', 3, 'Sudah'),
(2, 1, '4', 6, 'Sudah'),
(3, 2, '1', 7, 'Sudah'),
(4, 2, '3', 7, 'Sudah'),
(5, 3, '5', 10, 'Belum'),
(6, 4, '1', 2, 'Belum'),
(7, 4, '3', 2, 'Belum'),
(8, 4, '6', 3, 'Belum'),
(9, 4, '7', 3, 'Belum'),
(10, 5, '5', 1, 'Belum'),
(11, 5, '2', 6, 'Belum'),
(12, 5, '4', 3, 'Belum'),
(13, 6, '6', 6, 'Belum'),
(14, 6, '7', 6, 'Belum'),
(15, 7, '6', 1, 'Belum'),
(16, 7, '7', 1, 'Belum'),
(17, 8, '1', 1, 'Belum'),
(18, 8, '3', 1, 'Belum'),
(21, 10, 'BR002', 10, 'Sudah'),
(22, 11, 'bkt67868767868', 50, 'Belum'),
(23, 11, '1', 5, 'Belum'),
(24, 12, '5', 9, 'Belum'),
(25, 12, '8', 18, 'Sudah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventaris_ruang`
--

CREATE TABLE `inventaris_ruang` (
  `id` int(11) NOT NULL,
  `kode_id` int(11) NOT NULL,
  `ruang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inventaris_ruang`
--

INSERT INTO `inventaris_ruang` (`id`, `kode_id`, `ruang_id`) VALUES
(1, 1, 1),
(2, 4, 1),
(3, 10, 1),
(4, 11, 1),
(5, 17, 1),
(6, 18, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama_karyawan` varchar(255) NOT NULL,
  `nomor_hp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama_karyawan`, `nomor_hp`, `alamat`, `email`, `password`, `level`) VALUES
(1, 'Adul', '08100000', 'Sungai Kacang', 'adul@email.com', '997593f7b7af4fc758127e1dc41e3446', 'admin'),
(2, 'Beta', '08200000', 'Pantai Hambawang', 'beta@email.com', '987bcab01b929eb2c07877b224215c92', 'user'),
(3, 'Cita', '08300000', 'Pasar Papan', 'cita@email.com', 'ebea7d75ce0ae38a0440221a067eb2bc', 'user'),
(4, 'Bagus', '085156354184', 'BJB', 'bagus@email.com', '17b38fc02fd7e92f3edeb6318e3066d8', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode`
--

CREATE TABLE `kode` (
  `id` int(11) NOT NULL,
  `barang_masuk_detail_id` int(11) NOT NULL,
  `barang_keluar_detail_id` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `kondisi_barang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kode`
--

INSERT INTO `kode` (`id`, `barang_masuk_detail_id`, `barang_keluar_detail_id`, `kode`, `kondisi_barang`) VALUES
(1, 1, 0, '2022/12/0002/0001', 'Baru'),
(2, 1, 0, '2022/12/0002/0002', 'Baru'),
(3, 1, 0, '2022/12/0002/0003', 'Baru'),
(4, 1, 0, '2022/12/0004/0001', 'Baru'),
(5, 1, 0, '2022/12/0004/0002', 'Baru'),
(6, 1, 0, '2022/12/0004/0003', 'Baru'),
(7, 1, 0, '2022/12/0004/0004', 'Baru'),
(8, 1, 0, '2022/12/0004/0005', 'Baru'),
(9, 1, 0, '2022/12/0004/0006', 'Baru'),
(10, 2, 0, '2022/12/0001/0001', 'Baru'),
(11, 2, 0, '2022/12/0001/0002', 'Baru'),
(12, 2, 0, '2022/12/0001/0003', 'Baru'),
(13, 2, 0, '2022/12/0001/0004', 'Baru'),
(14, 2, 0, '2022/12/0001/0005', 'Baru'),
(15, 2, 0, '2022/12/0001/0006', 'Baru'),
(16, 2, 0, '2022/12/0001/0007', 'Baru'),
(17, 2, 0, '2022/12/0003/0001', 'Baru'),
(18, 2, 0, '2022/12/0003/0002', 'Baru'),
(19, 2, 0, '2022/12/0003/0003', 'Baru'),
(20, 2, 0, '2022/12/0003/0004', 'Baru'),
(21, 2, 0, '2022/12/0003/0005', 'Baru'),
(22, 2, 0, '2022/12/0003/0006', 'Baru'),
(23, 2, 0, '2022/12/0003/0007', 'Baru'),
(33, 21, 0, '2024/01/BR002/0001', 'Baru'),
(34, 21, 0, '2024/01/BR002/0002', 'Baru'),
(35, 21, 0, '2024/01/BR002/0003', 'Baru'),
(36, 21, 0, '2024/01/BR002/0004', 'Baru'),
(37, 21, 0, '2024/01/BR002/0005', 'Baru'),
(38, 21, 0, '2024/01/BR002/0006', 'Baru'),
(39, 21, 0, '2024/01/BR002/0007', 'Baru'),
(40, 21, 0, '2024/01/BR002/0008', 'Baru'),
(41, 21, 0, '2024/01/BR002/0009', 'Baru'),
(42, 21, 0, '2024/01/BR002/0010', 'Baru'),
(43, 0, 11, '2024/01/0001/0001', 'Baru'),
(44, 0, 11, '2024/01/0001/0002', 'Baru'),
(45, 0, 11, '2024/01/0001/0003', 'Baru'),
(46, 0, 11, '2024/01/0001/0004', 'Baru'),
(47, 0, 11, '2024/01/0001/0005', 'Baru'),
(48, 25, 0, '2024/01/0008/0001', 'Baru'),
(49, 25, 0, '2024/01/0008/0002', 'Baru'),
(50, 25, 0, '2024/01/0008/0003', 'Baru'),
(51, 25, 0, '2024/01/0008/0004', 'Baru'),
(52, 25, 0, '2024/01/0008/0005', 'Baru'),
(53, 25, 0, '2024/01/0008/0006', 'Baru'),
(54, 25, 0, '2024/01/0008/0007', 'Baru'),
(55, 25, 0, '2024/01/0008/0008', 'Baru'),
(56, 25, 0, '2024/01/0008/0009', 'Baru'),
(57, 25, 0, '2024/01/0008/0010', 'Baru'),
(58, 25, 0, '2024/01/0008/0011', 'Baru'),
(59, 25, 0, '2024/01/0008/0012', 'Baru'),
(60, 25, 0, '2024/01/0008/0013', 'Baru'),
(61, 25, 0, '2024/01/0008/0014', 'Baru'),
(62, 25, 0, '2024/01/0008/0015', 'Baru'),
(63, 25, 0, '2024/01/0008/0016', 'Baru'),
(64, 25, 0, '2024/01/0008/0017', 'Baru'),
(65, 25, 0, '2024/01/0008/0018', 'Baru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasok`
--

CREATE TABLE `pemasok` (
  `id` int(11) NOT NULL,
  `nama_pemasok` varchar(255) NOT NULL,
  `nama_kontak` varchar(255) NOT NULL,
  `nomor_hp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pemasok`
--

INSERT INTO `pemasok` (`id`, `nama_pemasok`, `nama_kontak`, `nomor_hp`, `alamat`) VALUES
(1, 'CV Alading', 'Mas Dindin', '08000000', 'Banjarbaru'),
(2, 'CV Benalu', 'Mbak Pia', '08000001', 'Martapura');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `id` int(11) NOT NULL,
  `nama_ruang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`id`, `nama_ruang`) VALUES
(1, 'Front Office'),
(2, 'Marketing'),
(3, 'Finance'),
(4, 'TU');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `barang_keluar_detail`
--
ALTER TABLE `barang_keluar_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_masuk_detail`
--
ALTER TABLE `barang_masuk_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `inventaris_ruang`
--
ALTER TABLE `inventaris_ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kode`
--
ALTER TABLE `kode`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `barang_keluar_detail`
--
ALTER TABLE `barang_keluar_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk_detail`
--
ALTER TABLE `barang_masuk_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `inventaris_ruang`
--
ALTER TABLE `inventaris_ruang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kode`
--
ALTER TABLE `kode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang_keluar_detail`
--
ALTER TABLE `barang_keluar_detail`
  ADD CONSTRAINT `barang_keluar_detail_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang_masuk_detail`
--
ALTER TABLE `barang_masuk_detail`
  ADD CONSTRAINT `barang_masuk_detail_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
