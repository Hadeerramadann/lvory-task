-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2022 at 03:22 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lvory_task`
--

-- --------------------------------------------------------

--
-- Table structure for table `coursses`
--

CREATE TABLE `coursses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coursses`
--

INSERT INTO `coursses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'math', NULL, NULL),
(2, 'since', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coursses_students`
--

CREATE TABLE `coursses_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `cours_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coursses_students`
--

INSERT INTO `coursses_students` (`id`, `student_id`, `cours_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 3, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coursses_teatchers`
--

CREATE TABLE `coursses_teatchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teatcher_id` bigint(20) UNSIGNED NOT NULL,
  `cours_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coursses_teatchers`
--

INSERT INTO `coursses_teatchers` (`id`, `teatcher_id`, `cours_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_02_16_085132_create_teatchers_table', 1),
(3, '2022_02_16_085251_create_students_table', 1),
(4, '2022_02_16_085316_create_coursses_table', 1),
(5, '2022_02_16_091127_create_coursses_teatchers_table', 1),
(6, '2022_02_16_092016_create_coursses_students_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'hadeer', NULL, NULL),
(2, 'fahd', NULL, NULL),
(3, 'ahmed', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teatchers`
--

CREATE TABLE `teatchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teatchers`
--

INSERT INTO `teatchers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'noor', NULL, NULL),
(2, 'amar', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coursses`
--
ALTER TABLE `coursses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coursses_students`
--
ALTER TABLE `coursses_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coursses_students_student_id_foreign` (`student_id`),
  ADD KEY `coursses_students_cours_id_foreign` (`cours_id`);

--
-- Indexes for table `coursses_teatchers`
--
ALTER TABLE `coursses_teatchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coursses_teatchers_teatcher_id_foreign` (`teatcher_id`),
  ADD KEY `coursses_teatchers_cours_id_foreign` (`cours_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teatchers`
--
ALTER TABLE `teatchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coursses`
--
ALTER TABLE `coursses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coursses_students`
--
ALTER TABLE `coursses_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coursses_teatchers`
--
ALTER TABLE `coursses_teatchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teatchers`
--
ALTER TABLE `teatchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coursses_students`
--
ALTER TABLE `coursses_students`
  ADD CONSTRAINT `coursses_students_cours_id_foreign` FOREIGN KEY (`cours_id`) REFERENCES `coursses` (`id`),
  ADD CONSTRAINT `coursses_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `coursses_teatchers`
--
ALTER TABLE `coursses_teatchers`
  ADD CONSTRAINT `coursses_teatchers_cours_id_foreign` FOREIGN KEY (`cours_id`) REFERENCES `coursses` (`id`),
  ADD CONSTRAINT `coursses_teatchers_teatcher_id_foreign` FOREIGN KEY (`teatcher_id`) REFERENCES `teatchers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
