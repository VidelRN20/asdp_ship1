-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Mar 2024 pada 06.47
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ship_ticketing_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(30) NOT NULL,
  `accommodation` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `accommodations`
--

INSERT INTO `accommodations` (`id`, `accommodation`, `description`, `date_created`) VALUES
(7, 'Penumpang I', 'Ekonomi Dewasa', '2024-03-26 02:13:41'),
(8, 'Penumpang II', 'Ekonomi Anak', '2024-03-26 02:14:09'),
(9, 'Golongan I', 'Sepeda Kayuh', '2024-03-26 02:14:30'),
(10, 'Golongan II', 'Sepeda Motor ( 500 CC) & Gerobak', '2024-03-26 02:16:47'),
(11, 'Golongan III', 'Sepeda Motor (>500 cc) & Roda 3', '2024-03-26 02:17:22'),
(12, 'Golongan IVA', 'Kendaraan Penumpang (<5 meter)', '2024-03-26 02:18:27'),
(13, 'Golongan IVB', 'Kendaraan Barang (<5 Meter)', '2024-03-26 02:19:30'),
(14, 'Golongan VA', 'Kendaraan Penumpang (<7 Meter)', '2024-03-26 02:20:26'),
(15, 'Golongan VB', 'Kendaraan Barang (<7 Meter)', '2024-03-26 02:23:20'),
(16, 'Golongan VIA', 'Kendaraan Penumpang (<10 Meter)', '2024-03-26 02:24:39'),
(17, 'Golongan VIB', 'Kendaraan Barang (<10 Meter)', '2024-03-26 02:25:03'),
(18, 'Golongan VII', 'Kendaraan (<12 Meter)', '2024-03-26 02:26:27'),
(19, 'Golongan VIII', 'Kendaraan (<16 Meter)', '2024-03-26 02:27:14'),
(20, 'Golongan IX', 'Kendaraan (>16 Meter)', '2024-03-26 02:28:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `port_list`
--

CREATE TABLE `port_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `port_list`
--

INSERT INTO `port_list` (`id`, `name`, `location`, `date_created`) VALUES
(1, 'Hansisi', 'Semau', '2024-03-22 08:04:51'),
(2, 'Bolok', 'Kupang', '2024-03-22 08:05:07'),
(4, 'Waibalun', 'Larantuka', '2024-03-26 00:37:35'),
(5, 'Pantai Baru', 'Rote', '2024-03-26 02:41:52'),
(6, 'Aimere', 'Aimere, Ngada', '2024-03-26 02:52:38'),
(7, 'Waingapu', 'Waingapu, Sumba Timur', '2024-03-26 02:53:34'),
(8, 'Sabu', 'Sabu Raijua', '2024-03-26 02:53:43'),
(9, 'Kalabahi', 'Alor', '2024-03-26 02:55:03'),
(10, 'Lewoleba', 'Lembata', '2024-03-26 02:56:08'),
(11, 'Tobilota', 'Adonara', '2024-03-26 02:57:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservations`
--

CREATE TABLE `reservations` (
  `id` int(30) NOT NULL,
  `ticket_number` varchar(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `accommodation_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `ticket_price` float NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = Confirmed, 2 = Cancel',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `Plat_Nomor` varchar(10) NOT NULL,
  `NIK` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedules`
--

CREATE TABLE `schedules` (
  `id` int(30) NOT NULL,
  `port_from_id` int(30) NOT NULL,
  `port_to_id` int(30) NOT NULL,
  `ship_id` int(30) NOT NULL,
  `departure_datetime` datetime DEFAULT NULL,
  `arrival_datetime` datetime DEFAULT NULL,
  `total_passengers` int(10) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `schedules`
--

INSERT INTO `schedules` (`id`, `port_from_id`, `port_to_id`, `ship_id`, `departure_datetime`, `arrival_datetime`, `total_passengers`, `date_created`, `date_updated`) VALUES
(18, 1, 2, 1, '2024-03-22 10:11:00', '2024-03-22 11:11:00', 0, '2024-03-12 10:12:48', '2024-03-22 08:13:41'),
(20, 1, 2, 1, '2024-03-23 08:13:00', '2024-03-23 08:14:00', 0, '2024-03-22 08:15:26', NULL),
(22, 2, 1, 1, '2024-03-25 08:39:00', '2024-03-25 10:39:00', 0, '2024-03-22 08:40:51', '2024-03-22 08:57:26'),
(23, 2, 1, 2, '2024-03-28 03:10:00', '2024-03-28 04:10:00', 0, '2024-03-26 03:13:41', '2024-03-27 10:18:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sched_accom`
--

CREATE TABLE `sched_accom` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `accommodation_id` int(30) NOT NULL,
  `net_fare` float NOT NULL,
  `max_passenger` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sched_accom`
--

INSERT INTO `sched_accom` (`id`, `schedule_id`, `accommodation_id`, `net_fare`, `max_passenger`) VALUES
(90, 18, 1, 100000, 40),
(91, 18, 2, 120000, 50),
(92, 18, 3, 50000, 60),
(93, 18, 4, 25000, 70),
(142, 20, 1, 15000, 20),
(143, 20, 2, 20000, 100),
(144, 20, 3, 50000, 50),
(145, 20, 4, 25000, 100),
(177, 22, 1, 150000, 20),
(178, 22, 2, 200000, 20),
(179, 22, 3, 50000, 20),
(180, 22, 4, 25000, 20),
(184, 23, 9, 140000, 20),
(185, 23, 10, 200000, 10),
(186, 23, 8, 40000, 70);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ship_list`
--

CREATE TABLE `ship_list` (
  `id` int(30) NOT NULL,
  `id_code` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ship_list`
--

INSERT INTO `ship_list` (`id`, `id_code`, `name`, `description`, `status`, `date_created`) VALUES
(1, '65500', 'KMP. Uma Kalada', 'Feri', 1, '2021-08-28 10:22:54'),
(2, '65499', 'KMP. Cakalang II', 'Feri', 1, '2021-08-28 10:23:34'),
(4, '65501', 'KMP. Ile Labalekan', 'Feri', 1, '2024-03-26 02:44:28'),
(5, '65502', 'KMP. Inerie II', 'Feri', 1, '2024-03-26 02:46:00'),
(6, '65503', 'KMP. Lakaan', 'Feri', 1, '2024-03-26 02:46:36'),
(7, '65504', 'KMP. Ranaka', 'Feri', 1, '2024-03-26 02:46:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Ship/Ferry Ticket Reservation System - PHP'),
(6, 'short_name', 'SFTRS - PHP'),
(11, 'logo', 'uploads/1630115400_ship_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1630250880_vessel.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(2, 'John', 'Smith', 'jsmith@sample.com', '39ce7e2a8573b41ce73b5ba41617f8f7', 'uploads/1630246860_male.png', NULL, 2, '2021-08-29 22:21:31', NULL),
(3, 'Videl', 'Ngefak', 'videlrichard@gmail.com', '7b610f0166a5cd6f1600b89903440cae', NULL, NULL, 2, '2024-03-07 03:00:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `port_list`
--
ALTER TABLE `port_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sched_accom`
--
ALTER TABLE `sched_accom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indeks untuk tabel `ship_list`
--
ALTER TABLE `ship_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `port_list`
--
ALTER TABLE `port_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `sched_accom`
--
ALTER TABLE `sched_accom`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT untuk tabel `ship_list`
--
ALTER TABLE `ship_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `sched_accom`
--
ALTER TABLE `sched_accom`
  ADD CONSTRAINT `sched_accom_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
