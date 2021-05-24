-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Bulan Mei 2021 pada 13.14
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
(1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6InlvdXIgdXNlcm5hbWUiLCJmaXJzdG5hbWUiOiJ5b3VyIGZpcnN0bmFtZSIsImxhc3RuYW1lIjoieW91ciBsYXN0bmFtZSIsImFkZHJlc3MiOiJ5b3VyIGFkZHJlc3MiLCJnZW5kZXIiOiJtYWxlIiwiZGF0ZU9mQmlydGgiOiIyMDIxLTA0LTA5VDE3OjAwOjAwLjAwMFoiLCJyb2xlIjoyLCJpYXQiOjE2MTgwNDQ1MDIsImV4cCI6MTYxODEzMDkwMn0.71TkvPKM_5Rtil6W1giNWTzq_tnfVKgXcjmxvOxRpJQ', '192.168.43.107'),
(2, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6InlvdXIgdXNlcm5hbWUiLCJmaXJzdG5hbWUiOiJ5b3VyIGZpcnN0bmFtZSIsImxhc3RuYW1lIjoieW91ciBsYXN0bmFtZSIsImFkZHJlc3MiOiJ5b3VyIGFkZHJlc3MiLCJnZW5kZXIiOiJtYWxlIiwiZGF0ZU9mQmlydGgiOiIyMDIxLTA0LTA4VDE3OjAwOjAwLjAwMFoiLCJyb2xlIjoyLCJpYXQiOjE2MTgxMTk1NjcsImV4cCI6MTYxODIwNTk2N30.N50H2h6chGvoERz_eB8f6Iz_Uo7YMtaaEDNdeI1NUEk', '192.168.43.107'),
(3, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6InlvdXIgdXNlcm5hbWUiLCJmaXJzdG5hbWUiOiJ5b3VyIGZpcnN0bmFtZSIsImxhc3RuYW1lIjoieW91ciBsYXN0bmFtZSIsImFkZHJlc3MiOiJ5b3VyIGFkZHJlc3MiLCJnZW5kZXIiOiJtYWxlIiwiZGF0ZU9mQmlydGgiOiIyMDIxLTA0LTA4VDE3OjAwOjAwLjAwMFoiLCJyb2xlIjoyLCJpYXQiOjE2MTgxMzE1NjksImV4cCI6MTYxODIxNzk2OX0.yNDILfFCTiFqWkw4kxh5F2-tf30vuzKjsOaEWVN-Qd0', '192.168.43.107'),
(4, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDhUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjIsImlhdCI6MTYxODE0OTAwNCwiZXhwIjoxNjE4MjM1NDA0fQ.eYguYnFHMBgVUs3W8mtDJ4-kiLItG1Az0ka9q-GAJQs', '192.168.43.107'),
(5, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDhUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjIsImlhdCI6MTYxODE0OTgxMiwiZXhwIjoxNjE4MjM2MjEyfQ.80Pt5wjAZC_zu-2t5aWm9lv_5wzHZMUgrLEbqe1RoWw', '192.168.43.107'),
(6, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJjaGFlcnVsbWFyd2FuanI3QGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDgxMjM0NTY3ODkiLCJ1c2VybmFtZSI6InlvdXIgdXNlcm5hbWUiLCJmaXJzdG5hbWUiOiJ5b3VyIGZpcnN0bmFtZSIsImxhc3RuYW1lIjoieW91ciBsYXN0bmFtZSIsImFkZHJlc3MiOiJ5b3VyIGFkZHJlc3MiLCJnZW5kZXIiOiJtYWxlIiwiZGF0ZU9mQmlydGgiOiIyMDIxLTA0LTEwVDE3OjAwOjAwLjAwMFoiLCJyb2xlIjoyLCJpYXQiOjE2MTgxNTk3MzcsImV4cCI6MTYxODI0NjEzN30.1DS5Zz5f249ximO5kZ4YjNGBAb0mJ65ezoSvxhsEcuM', '192.168.43.107'),
(7, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDhUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjEsImlhdCI6MTYxODE5Njg5MCwiZXhwIjoxNjE4MjgzMjkwfQ.SXRVbAGRp67h_QFBik8FhVwPKf1ump6-wpc6oaemo2U', '192.168.43.107'),
(8, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDhUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjIsImlhdCI6MTYxODE5OTkzNCwiZXhwIjoxNjE4Mjg2MzM0fQ.nwaNLaWZwC6JdEs6oPffZWocZfTPBgjwDIgVqeH1mWU', '192.168.43.107'),
(9, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDdUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjIsImlhdCI6MTYxODIzMTkyOSwiZXhwIjoxNjE4MzE4MzI5fQ.yn22xqTaC7WKKhDDOFEX3ynKKNnSV1NB_W3amPJENF4', '192.168.43.107'),
(10, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDdUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjIsImlhdCI6MTYxODMxMDA3OCwiZXhwIjoxNjE4Mzk2NDc4fQ.YBFya4dtlnFBvPuEhqtAkBreUriYayxgkAvjX5f2PSs', '192.168.43.107'),
(11, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDZUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjIsImlhdCI6MTYxODMxMDE5NCwiZXhwIjoxNjE4Mzk2NTk0fQ.C-a1i_KgnbWjZHgvAcxyugYohnyfHVRqOrZskCBieuU', '192.168.43.107'),
(12, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDZUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjEsImlhdCI6MTYxODkxNzk0NCwiZXhwIjoxNjE5MDA0MzQ0fQ.B3WrrcPMqg22rOu3VTtRznFldyCvlgq_ItY6RriuOtM', '192.168.43.107'),
(13, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDZUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjEsImlhdCI6MTYxODkyMjQxOCwiZXhwIjoxNjE5MDA4ODE4fQ.q9siPm5hwhn_asRwwr_AZAGPhPqU7P4ZI7JBeVAeHEw', '192.168.43.107'),
(14, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDZUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjEsImlhdCI6MTYxODkzMTg1OCwiZXhwIjoxNjE5MDE4MjU4fQ.8MU8Zi0eR3dI1C1sOzsnzNE5LJSLJLMyXS2J5ktoZuc', '192.168.43.107'),
(15, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDZUMTc6MDA6MDAuMDAwWiIsInJvbGUiOjEsImlhdCI6MTYyMDY0NzA2MywiZXhwIjoxNjIwNzMzNDYzfQ.TsLB3qw4RVcNH-Nwpa-BTDeZwVfOluV2jqnqqdHmlYU', '192.168.43.107'),
(16, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJjaGFlcnVsbWFyd2FuanI3QGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDgxMjM0NTY3ODkiLCJ1c2VybmFtZSI6InlvdXIgdXNlcm5hbWUiLCJmaXJzdG5hbWUiOiJ5b3VyIGZpcnN0bmFtZSIsImxhc3RuYW1lIjoieW91ciBsYXN0bmFtZSIsImFkZHJlc3MiOiJ5b3VyIGFkZHJlc3MiLCJnZW5kZXIiOiJtYWxlIiwiZGF0ZU9mQmlydGgiOiIyMDIxLTA0LTExIiwicm9sZSI6MiwiaWF0IjoxNjIxMTM1OTUzLCJleHAiOjE2MjEyMjIzNTN9.fLY1tzBVQ8qpbYYTHesw_Ymck6BzUjHylK_EzUsuuKs', '192.168.43.107'),
(17, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJjaGFlcnVsbWFyd2FuanI3QGdtYWlsLmNvbSIsInBob25lTnVtYmVyIjoiMDgxMjM0NTY3ODkiLCJ1c2VybmFtZSI6InlvdXIgdXNlcm5hbWUiLCJmaXJzdG5hbWUiOiJ5b3VyIGZpcnN0bmFtZSIsImxhc3RuYW1lIjoieW91ciBsYXN0bmFtZSIsImFkZHJlc3MiOiJ5b3VyIGFkZHJlc3MiLCJnZW5kZXIiOiJtYWxlIiwiZGF0ZU9mQmlydGgiOiIyMDIxLTA0LTExIiwicm9sZSI6MiwiaWF0IjoxNjIxMTQyMTQyLCJleHAiOjE2MjEyMjg1NDJ9.mDQj5EJWgktpPs1QFpfSiYzy3Ynb48BSay1uMgSaTW0', '192.168.43.107'),
(18, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDYiLCJyb2xlIjoxLCJpYXQiOjE2MjEzNTQwMDEsImV4cCI6MTYyMTQ0MDQwMX0.EDOkeLm777SjHk99yFkZS2hYwHUoi2amKODPb7YEUDk', '192.168.43.107'),
(19, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDYiLCJyb2xlIjoxLCJpYXQiOjE2MjE1MjAzMDMsImV4cCI6MTYyMTYwNjcwM30.jqxcGheSNTD08jWotJjKwVvdnFXSNBLzCv0uQ8oY-AU', '192.168.43.107'),
(20, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDYiLCJyb2xlIjoxLCJpYXQiOjE2MjE2Njc4MzcsImV4cCI6MTYyMTc1NDIzN30.r3x-2I3Ql0-mjqVi7ANG0TOXudBztp0W48WP7Itgrbk', '192.168.43.107'),
(21, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJjaGFlcnVsbWFyd2FuMjBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwODEyMjQ2ODU1MDIiLCJ1c2VybmFtZSI6ImNoYWVydWxtYXJ3YW4yMCIsImZpcnN0bmFtZSI6InlvdXIgZmlyc3RuYW1lIiwibGFzdG5hbWUiOiJ5b3VyIGxhc3RuYW1lIiwiYWRkcmVzcyI6InlvdXIgYWRkcmVzcyIsImdlbmRlciI6Im1hbGUiLCJkYXRlT2ZCaXJ0aCI6IjIwMjEtMDQtMDYiLCJyb2xlIjoxLCJpYXQiOjE2MjE2NzE2NjgsImV4cCI6MTYyMTc1ODA2OH0.tOR6qoqTsFPtpEEP8U7C6akhU26YlVQhqO-A9ka4aGw', '192.168.43.107');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `orderType` varchar(100) NOT NULL,
  `orderDetails` varchar(255) NOT NULL,
  `orderPhone` varchar(15) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productImage` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `size` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL
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
  `id` int(11) NOT NULL,
  `inv` varchar(15) NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productImage` varchar(255) NOT NULL DEFAULT 'images\\default_products.jpg',
  `size` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `isPending` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_body`
--

INSERT INTO `order_body` (`id`, `inv`, `userID`, `userName`, `productName`, `productImage`, `size`, `amount`, `price`, `isPending`, `created_at`, `updated_at`) VALUES
(67, '1621674380634', 1, 'chaerulmarwan20', 'Nasi Goreng', 'images\\nasgor.jpg', 'R', 1, 15000, 1, '2021-05-22 16:06:20', '2021-05-22 16:06:20'),
(68, '1621674380634', 1, 'chaerulmarwan20', 'Nasi Goreng', 'images\\nasgor.jpg', 'XL', 1, 15000, 1, '2021-05-22 16:06:20', '2021-05-22 16:06:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_head`
--

CREATE TABLE `order_head` (
  `inv` varchar(15) NOT NULL,
  `cashierName` varchar(50) DEFAULT NULL,
  `userName` varchar(50) NOT NULL,
  `orderType` varchar(100) DEFAULT NULL,
  `orderDetails` varchar(255) DEFAULT NULL,
  `orderPhone` varchar(15) NOT NULL,
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
('1618232071631', 'Admin', 'chaerulmarwan20', 'Dine In', '19:54', '081224685502', 'Credit Card', 1, 105000, '2021-04-12 19:54:31', '2021-04-12 19:54:31'),
('1621135999767', 'Admin', 'your username', 'Dine In', '10:32', '08123456789', 'Credit Card', 1, 90000, '2021-05-16 10:33:19', '2021-05-16 10:33:19'),
('1621137134405', 'Admin', 'your username', 'Dine In', '10:52', '08123456789', 'Cash on Delivery', 1, 70000, '2021-05-16 10:52:14', '2021-05-16 10:52:14'),
('1621137240594', 'Admin', 'your username', 'Pick Up', '10:53', '08123456789', 'Bank Account', 1, 60000, '2021-05-16 10:54:00', '2021-05-16 10:54:00'),
('1621137533630', 'Admin', 'your username', 'Pick Up', '10:58', '08123456789', 'Credit Card', 1, 60000, '2021-05-16 10:58:53', '2021-05-16 10:58:53'),
('1621137820745', 'Admin', 'your username', 'Dine In', '11:3', '08123456789', 'Bank Account', 1, 50000, '2021-05-16 11:03:40', '2021-05-16 11:03:40'),
('1621142162107', 'Admin', 'your username', 'Door Delivery', '12:15', '08123456789', 'Credit Card', 1, 45000, '2021-05-16 12:16:02', '2021-05-16 12:16:02'),
('1621142181465', 'Admin', 'your username', 'Dine In', '12:16', '08123456789', 'Bank Account', 1, 90000, '2021-05-16 12:16:21', '2021-05-16 12:16:21'),
('1621354473611', 'Admin', 'chaerulmarwan20', 'Dine In', '23:13', '081224685502', 'Bank Account', 1, 45000, '2021-05-18 23:14:33', '2021-05-18 23:14:33'),
('1621521667015', 'Admin', 'chaerulmarwan20', 'Dine In', '21:40', '081224685502', 'Bank Account', 1, 50000, '2021-05-20 21:41:07', '2021-05-20 21:41:07'),
('1621522048841', 'Admin', 'chaerulmarwan20', 'Dine In', '21:47', '081224685502', 'Credit Card', 1, 45000, '2021-05-20 21:47:28', '2021-05-20 21:47:28'),
('1621673478337', 'Admin', 'chaerulmarwan20', 'Dine In', '15:21', '081224685502', 'Bank Account', 1, 60000, '2021-05-22 15:51:18', '2021-05-22 15:51:18'),
('1621674380634', 'Admin', 'chaerulmarwan20', 'Dine In', '15:59', '081224685502', 'Credit Card', 1, 60000, '2021-05-22 16:06:20', '2021-05-22 16:06:20');

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
  `hourStart` varchar(100) DEFAULT NULL,
  `hourEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `stock`, `totalSale`, `categoryID`, `description`, `size`, `created_at`, `updated_at`, `deliveryMethod`, `isFavorit`, `hourStart`, `hourEnd`) VALUES
(17, 'Cold Brew Coffee', 30000, 'images\\cold-brew.jpg', 100, 0, 1, 'Cold brewing is a method of brewing that combines ground coffee and cool water and uses time instead of heat to extract the flavor. It is brewed in small batches and steeped for as long as 48 hours.', 'R L XL', '2021-04-10 15:28:26', '2021-04-10 15:28:26', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(18, 'Hazelnut Coffee Late', 20000, 'images\\hazelnut.jpg', 96, 4, 1, 'Espresso and milk flavoured with hazelnut syrup and then poured over ice creates an ideal iced drink for those who love a lighter roasted coffee.', 'R L XL', '2021-04-10 15:31:44', '2021-04-10 15:31:44', 'Dine In Door Delivery Pick Up', 1, '10:00:00', '18:00:00'),
(19, 'Creamy Ice Latte', 20000, 'images\\creamy-ice.jpg', 97, 3, 1, 'Nothing better than a cold iced coffee in the summer time heat. Tall glasses filled with a cold creamy coffee.', 'R L XL', '2021-04-10 15:31:44', '2021-04-10 15:31:44', 'Dine In Door Delivery Pick Up', 1, '10:00:00', '18:00:00'),
(20, 'Coffee Beer', 10000, 'images\\beer.jpg', 100, 0, 1, 'Coffee beer sendiri merupakan minuman soda kopi dan tidak mengandung alkohol.', 'R L XL', '2021-04-10 15:33:41', '2021-04-10 15:33:41', 'Dine In Door Delivery Pick Up', 0, '10:00:00', '18:00:00'),
(21, 'Ramen', 30000, 'images\\ramen.jpg', 98, 2, 3, 'Ramen adalah masakan mi kuah Jepang yang berasal dari China.', 'R L XL', '2021-04-10 15:36:41', '2021-04-10 15:36:41', 'Dine In Door Delivery Pick Up', 1, '10:00:00', '18:00:00'),
(22, 'Nasi Goreng', 15000, 'images\\nasgor.jpg', 81, 19, 3, 'Nasi goreng adalah sebuah makanan berupa nasi yang digoreng dan diaduk dalam minyak goreng, margarin, atau mentega', 'R L XL', '2021-04-10 15:37:39', '2021-04-10 15:37:39', 'Dine In Door Delivery Pick Up', 1, '10:00:00', '18:00:00'),
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
  `dateOfBirth` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `phoneNumber`, `username`, `firstname`, `lastname`, `address`, `gender`, `dateOfBirth`, `role`, `active`, `image`) VALUES
(1, 'chaerulmarwan20@gmail.com', '$2b$10$bxaCD3MSQyBlDj/lKaXddOSzh32vEgaz1NznlxPXqbTLfKDOtm75m', '081224685502', 'chaerulmarwan20', 'your firstname', 'your lastname', 'Ganeas', 'male', '2021-04-06', 1, 1, 'images\\1620647074531-henry.png'),
(2, 'chaerulmarwanjr7@gmail.com', '$2b$10$BvrtY8Q.bkzcWkiMZ1VVUeJ7x6L1DmqOY8MW.Ns2GBRknuIWa0yv6', '08123456789', 'your username', 'your firstname', 'your lastname', 'your address', 'male', '2021-04-11', 2, 1, 'images\\avatar.png');

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
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `order_body`
--
ALTER TABLE `order_body`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
