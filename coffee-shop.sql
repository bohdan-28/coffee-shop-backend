-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Apr 2021 pada 22.50
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee-shop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `access_token`
--

CREATE TABLE `access_token` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `ipAddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `isReady` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `isReady`, `created_at`, `updated_at`) VALUES
(1, 'coffee', 1, '2021-04-08 01:53:31', '2021-04-08 01:53:31'),
(2, 'non-coffee', 1, '2021-04-08 01:53:31', '2021-04-08 01:53:31'),
(3, 'foods', 1, '2021-04-08 01:54:47', '2021-04-08 01:54:47'),
(4, 'add-on', 1, '2021-04-08 01:54:47', '2021-04-08 01:54:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_body`
--

CREATE TABLE `order_body` (
  `id` int(10) NOT NULL,
  `inv` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productImage` varchar(50) NOT NULL DEFAULT 'images\\default_products.jpg',
  `size` varchar(15) NOT NULL,
  `amount` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `isPending` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_body`
--

INSERT INTO `order_body` (`id`, `inv`, `userID`, `userName`, `productName`, `productImage`, `size`, `amount`, `price`, `isPending`, `created_at`, `updated_at`) VALUES
(13, 102071, 1, 'Herza', 'Kopi Ko', 'kopiko.png', 'R', 1, 70000, 0, '2021-04-08 14:34:01', '2021-04-08 02:56:34'),
(14, 102071, 1, 'Herza', 'Nasi Uduk', 'nasiuduk.png', 'XL', 2, 70000, 0, '2021-04-08 14:34:01', '2021-04-08 02:56:34'),
(17, 102073, 1, 'Herza', 'Kopi Ko', 'kopiko.png', 'R', 1, 70000, 1, '2021-04-08 17:55:43', '2021-04-08 17:55:43'),
(18, 102073, 1, 'Herza', 'Nasi Uduk', 'nasiuduk.png', 'XL', 2, 70000, 1, '2021-04-08 17:55:43', '2021-04-08 17:55:43'),
(19, 102075, 3, 'Herzaa', 'Kopi Ko', 'kopiko.png', 'R', 1, 70000, 1, '2021-04-08 17:57:27', '2021-04-08 17:57:27'),
(20, 102075, 3, 'Herzaa', 'Nasi Uduk', 'nasiuduk.png', 'XL', 2, 70000, 1, '2021-04-08 17:57:27', '2021-04-08 17:57:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_head`
--

CREATE TABLE `order_head` (
  `inv` int(11) NOT NULL,
  `cashierName` varchar(50) DEFAULT NULL,
  `userName` varchar(50) NOT NULL,
  `orderType` int(10) DEFAULT NULL,
  `orderDetails` text DEFAULT NULL,
  `orderPhone` int(15) NOT NULL,
  `paymentType` varchar(25) NOT NULL,
  `isPending` tinyint(1) NOT NULL DEFAULT 1,
  `total` int(12) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_head`
--

INSERT INTO `order_head` (`inv`, `cashierName`, `userName`, `orderType`, `orderDetails`, `orderPhone`, `paymentType`, `isPending`, `total`, `created_at`, `updated_at`) VALUES
(102071, 'Kevin', 'Herza', 0, 'Jalan Hartono2', 2147483647, 'OVO', 0, 210000, '2021-04-08 14:34:01', '2021-04-08 02:56:34'),
(102073, NULL, 'Herza', 0, 'Jalan Hartono2', 2147483647, 'OVO', 1, 210000, '2021-04-08 17:55:43', '2021-04-08 17:55:43'),
(102075, NULL, 'Herzaa', 0, 'Jalan Hartono2', 2147483647, 'OVO', 1, 210000, '2021-04-08 17:57:27', '2021-04-08 17:57:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'images\\default_products.jpg',
  `stock` int(10) DEFAULT NULL,
  `totalSale` int(10) NOT NULL DEFAULT 0,
  `categoryID` int(10) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `size` varchar(25) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deliveryMethod` varchar(50) NOT NULL,
  `isFavorit` tinyint(1) NOT NULL DEFAULT 0,
  `hourStart` time DEFAULT NULL,
  `hourEnd` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `stock`, `totalSale`, `categoryID`, `description`, `size`, `created_at`, `updated_at`, `deliveryMethod`, `isFavorit`, `hourStart`, `hourEnd`) VALUES
(3, 'Tahu SUmedang', 20000, 'images\\1617740731728-220px-A_Quiet_Place_Part_II.jpg', 120, 50, 3, 'Tahu geprek top 1 indo', 'R', '2021-04-06 23:27:28', '2021-04-09 03:45:20', '', 0, '00:00:00', '00:00:00'),
(4, 'Martabak Manis', 30000, 'images\\1617740660955-220px-A_Quiet_Place_Part_II.jpg', 120, 0, 3, 'Martbak yang rasanya manis', 'R', '2021-04-06 23:27:28', '2021-04-07 03:24:20', '', 0, '00:00:00', '00:00:00'),
(16, 'Coffee Lamping', 10000, 'images1617914243721-220px-The_Courier_poster.jpg', 500, 0, 1, 'Makanan tradisional murah meriah dan lezat', 's', '2021-04-09 03:37:23', '2021-04-09 03:37:23', 'dine', 0, '12:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `dateOfBirth` date NOT NULL,
  `role` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `access_token`
--
ALTER TABLE `access_token`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_body`
--
ALTER TABLE `order_body`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_head`
--
ALTER TABLE `order_head`
  ADD PRIMARY KEY (`inv`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `access_token`
--
ALTER TABLE `access_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `order_body`
--
ALTER TABLE `order_body`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `order_head`
--
ALTER TABLE `order_head`
  MODIFY `inv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102076;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
