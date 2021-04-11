-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Apr 2021 pada 19.24
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.1

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

--
-- Dumping data untuk tabel `access_token`
--

INSERT INTO `access_token` (`id`, `idUser`, `accessToken`, `ipAddress`) VALUES
(1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6InlvdXIgdXNlcm5hbWUiLCJmaXJzdG5hbWUiOiJ5b3VyIGZpcnN0bmFtZSIsImxhc3RuYW1lIjoieW91ciBsYXN0bmFtZSIsImFkZHJlc3MiOiJ5b3VyIGFkZHJlc3MiLCJnZW5kZXIiOiJtYWxlIiwiZGF0ZU9mQmlydGgiOiIyMDIxLTA0LTA5VDE3OjAwOjAwLjAwMFoiLCJyb2xlIjoyLCJpYXQiOjE2MTgwNDQ1MDIsImV4cCI6MTYxODEzMDkwMn0.71TkvPKM_5Rtil6W1giNWTzq_tnfVKgXcjmxvOxRpJQ', '192.168.43.107');

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
  `inv` int(15) NOT NULL,
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_head`
--

CREATE TABLE `order_head` (
  `inv` int(15) NOT NULL,
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
(17, 'Cold Brew Coffee', 30000, 'images\\cold-brew.jpg', 100, 0, 1, 'Cold brewing is a method of brewing that combines ground coffee and cool water and uses time instead of heat to extract the flavor. It is brewed in small batches and steeped for as long as 48 hours.', 'R L XL', '2021-04-10 15:28:26', '2021-04-10 15:28:26', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(18, 'Hazelnut Coffee Late', 20000, 'images\\hazelnut.jpg', 100, 0, 1, 'Espresso and milk—flavoured with hazelnut syrup and then poured over ice—creates an ideal iced drink for those who love a lighter-roasted coffee. Created with love', 'R L XL', '2021-04-10 15:31:44', '2021-04-10 15:31:44', 'Dine In Door Delivery Pick Up', 1, '10:00:00', '18:00:00'),
(19, 'Creamy Ice Latte', 20000, 'images\\creamy-ice.jpg', 100, 0, 1, 'Nothing better than a cold iced coffee in the summer time heat. Tall glasses filled with a cold creamy coffee.', 'R L XL', '2021-04-10 15:31:44', '2021-04-10 15:31:44', 'Dine In Door Delivery Pick Up', 1, '10:00:00', '18:00:00'),
(20, 'Coffee Beer', 10000, 'images\\beer.jpg', 100, 0, 1, 'Coffee beer sendiri merupakan minuman soda kopi dan tidak mengandung alkohol.', 'R L XL', '2021-04-10 15:33:41', '2021-04-10 15:33:41', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(21, 'Ramen', 30000, 'images\\ramen.jpg', 100, 0, 3, 'Ramen adalah masakan mi kuah Jepang yang berasal dari China.', 'R L XL', '2021-04-10 15:36:41', '2021-04-10 15:36:41', 'Dine In Door Delivery Pick Up', 1, '10:00:00', '18:00:00'),
(22, 'Nasi Goreng', 15000, 'images\\nasgor.jpg', 100, 0, 3, 'Nasi goreng adalah sebuah makanan berupa nasi yang digoreng dan diaduk dalam minyak goreng, margarin, atau mentega', 'R L XL', '2021-04-10 15:37:39', '2021-04-10 15:37:39', 'Dine In Door Delivery Pick Up', 1, '10:00:00', '18:00:00'),
(23, 'Ayam Goreng', 30000, 'images\\ayam.jpg', 100, 0, 3, 'Ayam goreng adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas.', 'R L XL', '2021-04-10 15:38:26', '2021-04-10 15:38:26', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(24, 'Ikan Bakar', 35000, 'images\\ikan.jpg', 100, 0, 3, 'Ikan bakar adalah hidangan ikan yang dibakar atau dipanggang di atas api atau bara api.', 'R L XL', '2021-04-10 15:39:33', '2021-04-10 15:39:33', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(25, 'Thai Tea', 20000, 'images\\thai.jpg', 100, 0, 2, 'Teh Thailand biasanya dikenal sebagai minuman Thailand yang terbuat dari teh Ceylon, susu dan gula, serta disajikan panas atau dingin.', 'R L XL', '2021-04-10 15:40:12', '2021-04-10 15:40:12', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(26, 'Salad', 20000, 'images\\salad.jpg', 100, 0, 4, 'Jenis makanan yang terdiri dari campuran sayur-sayuran dan bahan-bahan makanan siap santap.', 'R L XL', '2021-04-10 15:42:11', '2021-04-10 15:42:11', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(27, 'Pisang Keju', 20000, 'images\\pisang.jpg', 100, 0, 4, 'Pisang keju merupakan pisang yang digoreng kemudian dibubuhi aneka toping di atasnya, seperti keju, cokelat, susu kental manis, hingga kacang tumbuk.', 'R L XL', '2021-04-10 15:43:20', '2021-04-10 15:43:20', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(28, 'Kentang Goreng', 20000, 'images\\kentang.jpg', 100, 0, 4, 'Kentang goreng adalah hidangan yang dibuat dari potongan-potongan kentang yang digoreng dalam minyak goreng panas.', 'R L XL', '2021-04-10 15:43:53', '2021-04-10 15:43:53', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00');

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

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `phoneNumber`, `username`, `firstname`, `lastname`, `address`, `gender`, `dateOfBirth`, `role`, `active`, `image`) VALUES
(1, 'chaerulmarwan20@gmail.com', '$2b$10$K9cfwH7j.0dIgaYDwwe/HuvSdrQ5tZ2ftNpyB3Vq6BfmeIWYH19xO', '081224685502', 'your username', 'your firstname', 'your lastname', 'your address', 'male', '2021-04-09', 2, 1, 'images\\avatar.png');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_body`
--
ALTER TABLE `order_body`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `inv` (`inv`);

--
-- Indeks untuk tabel `order_head`
--
ALTER TABLE `order_head`
  ADD PRIMARY KEY (`inv`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `access_token`
--
ALTER TABLE `access_token`
  ADD CONSTRAINT `access_token_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_body`
--
ALTER TABLE `order_body`
  ADD CONSTRAINT `order_body_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_body_ibfk_2` FOREIGN KEY (`inv`) REFERENCES `order_head` (`inv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
