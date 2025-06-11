-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:4306
-- Generation Time: Jun 11, 2025 at 07:40 AM
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
-- Database: `db_kapitanSisig`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not_banned,1=banned',
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `position` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `lastname`, `username`, `password`, `is_banned`, `created_at`, `position`) VALUES
(1, 'Kristyle Marie', 'Modin', 'kmgmodin', '$2y$10$Aj1WGyrfovmy5VQA3wXKleP0nrV42X5knV.jfYJI1AStwXaV3kzDK', 0, '2024-10-16', 1),
(2, 'Evanica', 'Juarbal', 'errjuarbal', '$2y$10$w4bEjxDKpesntCnWKmKM9erbKVIv0mJmpx6zfvb4LlgwmhiEEGYiq', 0, '2025-04-08', 1),
(3, 'Rose', 'Juarbal', 'roseworker', '$2y$10$eUep3P4xx71bZl3NeLD4eO/LUQshwxpoW65/u/WglANXYnrtFV1G.', 0, '2025-04-08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(1, 'Sisig Meal', 0),
(2, 'Barkada Meals', 0),
(5, 'Shawarma Meals', 0),
(6, 'Meryenda Meals', 0),
(7, 'Extra', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(566) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`) VALUES
(8, 'Khim'),
(9, 'James'),
(10, 'Keisha'),
(11, 'Kyle');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `category` varchar(191) NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `reorder_point` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit_id`, `category`, `quantity`, `reorder_point`, `price`) VALUES
(5, 'Spoon', 14, 'Others', 92, 10.00, 0.00),
(6, 'Soy Sauce', 19, 'Condiments', 0, 10.00, 0.00),
(7, 'Tuna', 13, 'Meat & Poultry', 6900, 10.00, 0.00),
(8, 'Egg', 14, 'Others', 80, 10.00, 0.00),
(21, 'Chopstick', 14, 'Cutlery', 12, 1.00, 0.00),
(22, 'Pork Belly', 13, 'Meat & Poultry', 4300, 200.00, 0.00),
(23, 'Tofu', 13, 'Vegetables', 3000, 200.00, 0.00),
(24, 'Chicken', 13, 'Meat & Poultry', 6003, 200.00, 0.00),
(25, 'Onion', 14, 'Vegetables', 4, 10.00, 0.00),
(26, 'Garlic', 14, 'Vegetables', 3, 10.00, 0.00),
(27, 'Carrots', 14, 'Vegetables', 0, 5.00, 0.00),
(28, 'Bell Pepper', 14, 'Vegetables', 4, 5.00, 0.00),
(29, 'Knorr Liquid Seasoning', 19, 'Others', 0, 1.00, 0.00),
(30, 'Oil', 19, 'Others', 0, 1.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_items`
--

CREATE TABLE `ingredients_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_items`
--

INSERT INTO `ingredients_items` (`id`, `order_id`, `ingredient_id`, `unit_id`, `price`, `quantity`) VALUES
(1, 1, 8, 15, 120.00, 2.00),
(2, 2, 8, 15, 120.00, 1.00),
(3, 3, 5, 14, 10.00, 1.00),
(4, 4, 5, 14, 10.00, 1.00),
(5, 5, 5, 14, 10.00, 1.00),
(6, 6, 4, 16, 250.00, 2.00),
(7, 7, 8, 15, 120.00, 100.00),
(8, 8, 5, 14, 10.00, 100.00),
(9, 9, 8, 15, 120.00, 1.00),
(10, 10, 21, 14, 1.00, 2.00),
(11, 11, 21, 14, 1.00, 2.00),
(12, 12, 5, 14, 10.00, 13.00),
(13, 13, 21, 14, 1.00, 100.00),
(14, 14, 4, 16, 250.00, 5.00),
(15, 14, 6, 19, 70.00, 1.00),
(16, 14, 8, 15, 120.00, 15.00),
(17, 14, 5, 14, 10.00, 100.00),
(18, 15, 7, 16, 170.00, 5.00),
(19, 16, 7, 16, 170.00, 4.00),
(20, 17, 22, 16, 280.00, 4.00),
(21, 18, 21, 14, 1.00, 12.00),
(22, 19, 8, 15, 120.00, 4.00),
(23, 19, 5, 14, 2.00, 102.00),
(24, 20, 22, 16, 280.00, 5.00),
(25, 20, 7, 16, 350.00, 7.00),
(26, 20, 23, 16, 130.00, 3.00),
(27, 20, 24, 13, 140.00, 3.00),
(28, 21, 24, 16, 140.00, 6.00),
(29, 22, 8, 15, 120.00, 3.00),
(30, 22, 28, 14, 5.00, 4.00),
(31, 22, 25, 14, 5.00, 4.00),
(32, 22, 26, 14, 5.00, 3.00),
(33, 23, 8, 15, 120.00, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_reports`
--

CREATE TABLE `ingredients_reports` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_reports`
--

INSERT INTO `ingredients_reports` (`id`, `start_date`, `end_date`, `created_at`) VALUES
(1, '2024-11-26', '0000-00-00', '2024-11-26 04:55:57'),
(2, '2024-11-26', '0000-00-00', '2024-11-26 05:01:27'),
(3, '2025-04-07', '2025-04-08', '2025-04-08 09:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_report_details`
--

CREATE TABLE `ingredients_report_details` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `ingredient_name` varchar(255) DEFAULT NULL,
  `quantity_used` decimal(10,2) DEFAULT NULL,
  `unit_name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `batch_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_quantity` decimal(10,2) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_report_details`
--

INSERT INTO `ingredients_report_details` (`id`, `report_id`, `ingredient_name`, `quantity_used`, `unit_name`, `type`, `batch_number`, `created_at`, `total_quantity`, `expiry_date`) VALUES
(768, 1, 'Pork Belly', 500.00, 'g', 'Used', NULL, '2024-11-26 04:55:57', NULL, NULL),
(769, 1, 'Spoon', 10.00, 'pcs', 'Used', NULL, '2024-11-26 04:55:57', NULL, NULL),
(770, 1, 'Soy Sauce', 750.00, 'ml', 'Used', NULL, '2024-11-26 04:55:57', NULL, NULL),
(771, 1, 'Tuna', 500.00, 'g', 'Used', NULL, '2024-11-26 04:55:57', NULL, NULL),
(772, 1, 'Egg', 10.00, 'pcs', 'Used', NULL, '2024-11-26 04:55:57', NULL, NULL),
(773, 1, 'Chopstick', 0.00, '0', 'Stock In', NULL, '2024-11-26 04:55:58', 100.00, '2024-11-26'),
(774, 1, 'Pork Belly', 4.50, '0', 'Stock In', NULL, '2024-11-26 04:55:58', 5000.00, '2024-11-26'),
(775, 1, 'Spoon', 100.00, '0', 'Stock In', NULL, '2024-11-26 04:55:58', 100.00, '2024-11-26'),
(776, 1, 'Soy Sauce', 1.00, '0', 'Stock In', NULL, '2024-11-26 04:55:58', 250.00, '2024-11-26'),
(777, 1, 'Egg', 15.00, '0', 'Stock In', NULL, '2024-11-26 04:55:58', 180.00, '2024-11-26'),
(778, 1, 'Tuna', 5.00, '0', 'Stock In', NULL, '2024-11-26 04:55:58', 4500.00, '2024-11-26'),
(779, 1, 'Pork Belly', 500.00, 'g', 'Stock Out', '14', '2024-11-26 04:55:58', 4500.00, '2024-11-26'),
(780, 1, 'Pork Belly', 4000.00, 'g', 'Remaining', NULL, '2024-11-26 04:55:58', NULL, NULL),
(781, 1, 'Spoon', 90.00, 'pcs', 'Remaining', NULL, '2024-11-26 04:55:58', NULL, NULL),
(782, 1, 'Soy Sauce', 250.00, 'ml', 'Remaining', NULL, '2024-11-26 04:55:58', NULL, NULL),
(783, 1, 'Tuna', 4500.00, 'g', 'Remaining', NULL, '2024-11-26 04:55:58', NULL, NULL),
(784, 1, 'Egg', 170.00, 'pcs', 'Remaining', NULL, '2024-11-26 04:55:58', NULL, NULL),
(785, 1, 'Chopstick', 0.00, 'pcs', 'Remaining', NULL, '2024-11-26 04:55:58', NULL, NULL),
(786, 2, 'Pork Belly', 500.00, 'g', 'Used', NULL, '2024-11-26 05:01:27', NULL, NULL),
(787, 2, 'Spoon', 10.00, 'pcs', 'Used', NULL, '2024-11-26 05:01:27', NULL, NULL),
(788, 2, 'Soy Sauce', 750.00, 'ml', 'Used', NULL, '2024-11-26 05:01:27', NULL, NULL),
(789, 2, 'Tuna', 500.00, 'g', 'Used', NULL, '2024-11-26 05:01:27', NULL, NULL),
(790, 2, 'Egg', 10.00, 'pcs', 'Used', NULL, '2024-11-26 05:01:27', NULL, NULL),
(791, 2, 'Chopstick', 0.00, '0', 'Stock In', NULL, '2024-11-26 05:01:27', 100.00, '2024-11-26'),
(792, 2, 'Pork Belly', 4.50, '0', 'Stock In', NULL, '2024-11-26 05:01:27', 5000.00, '2024-11-26'),
(793, 2, 'Spoon', 100.00, '0', 'Stock In', NULL, '2024-11-26 05:01:27', 100.00, '2024-11-26'),
(794, 2, 'Soy Sauce', 1.00, '0', 'Stock In', NULL, '2024-11-26 05:01:27', 250.00, '2024-11-26'),
(795, 2, 'Egg', 15.00, '0', 'Stock In', NULL, '2024-11-26 05:01:27', 180.00, '2024-11-26'),
(796, 2, 'Tuna', 5.00, '0', 'Stock In', NULL, '2024-11-26 05:01:27', 4500.00, '2024-11-26'),
(797, 2, 'Pork Belly', 500.00, 'g', 'Stock Out', '14', '2024-11-26 05:01:27', 4500.00, '2024-11-26'),
(798, 2, 'Spoon', 1.00, 'pcs', 'Stock Out', '3', '2024-11-26 05:01:27', 4500.00, '2024-11-26'),
(799, 2, 'Spoon', 3.00, 'pcs', 'Stock Out', '13', '2024-11-26 05:01:27', 4500.00, '2024-11-26'),
(800, 2, 'Pork Belly', 4000.00, 'g', 'Remaining', NULL, '2024-11-26 05:01:27', NULL, NULL),
(801, 2, 'Spoon', 86.00, 'pcs', 'Remaining', NULL, '2024-11-26 05:01:27', NULL, NULL),
(802, 2, 'Soy Sauce', 250.00, 'ml', 'Remaining', NULL, '2024-11-26 05:01:27', NULL, NULL),
(803, 2, 'Tuna', 4500.00, 'g', 'Remaining', NULL, '2024-11-26 05:01:27', NULL, NULL),
(804, 2, 'Egg', 170.00, 'pcs', 'Remaining', NULL, '2024-11-26 05:01:27', NULL, NULL),
(805, 2, 'Chopstick', 0.00, 'pcs', 'Remaining', NULL, '2024-11-26 05:01:27', NULL, NULL),
(806, 3, 'Spoon', 3.00, 'pcs', 'Used', NULL, '2025-04-08 09:31:35', NULL, NULL),
(807, 3, 'Tuna', 100.00, 'g', 'Used', NULL, '2025-04-08 09:31:35', NULL, NULL),
(808, 3, 'Egg', 3.00, 'pcs', 'Used', NULL, '2025-04-08 09:31:35', NULL, NULL),
(809, 3, 'Pork Belly', 200.00, 'g', 'Used', NULL, '2025-04-08 09:31:35', NULL, NULL),
(810, 3, 'Spoon', 92.00, 'pcs', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(811, 3, 'Soy Sauce', 0.00, 'L', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(812, 3, 'Tuna', 6900.00, 'g', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(813, 3, 'Egg', 80.00, 'pcs', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(814, 3, 'Chopstick', 12.00, 'pcs', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(815, 3, 'Pork Belly', 4300.00, 'g', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(816, 3, 'Tofu', 3000.00, 'g', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(817, 3, 'Chicken', 6003.00, 'g', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(818, 3, 'Onion', 4.00, 'pcs', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(819, 3, 'Garlic', 3.00, 'pcs', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(820, 3, 'Carrots', 0.00, 'pcs', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(821, 3, 'Bell Pepper', 4.00, 'pcs', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(822, 3, 'Knorr Liquid Seasoning', 0.00, 'L', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL),
(823, 3, 'Oil', 0.00, 'L', 'Remaining', NULL, '2025-04-08 09:31:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_reports`
--

CREATE TABLE `inventory_reports` (
  `id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `report_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_report_details`
--

CREATE TABLE `inventory_report_details` (
  `id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `tracking_no` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `report_type` enum('Remaining','Completed','Cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `amount_received` decimal(10,2) NOT NULL,
  `change_money` varchar(200) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_status` enum('Placed','Preparing','Completed','Cancelled') NOT NULL DEFAULT 'Placed' COMMENT 'placed, preparing, completed, cancelled',
  `payment_mode` varchar(100) NOT NULL COMMENT 'cash,online',
  `order_placed_by_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `amount_received`, `change_money`, `order_date`, `order_status`, `payment_mode`, `order_placed_by_id`) VALUES
(60, 10, '000001', 'INV-798423', '100', 200.00, '100', '2025-04-08 15:55:18', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(61, 8, '000002', 'INV-960773', '100', 500.00, '400', '2025-04-08 16:13:17', 'Completed', 'Cash Payment', 'Evanica'),
(62, 11, '000003', 'INV-625763', '100', 200.00, '100', '2025-04-08 17:30:50', 'Completed', 'Cash Payment', 'Evanica');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 8, '10.00', '2'),
(2, 2, 8, '10.00', '21'),
(3, 3, 8, '10.00', '2'),
(4, 4, 8, '10.00', '25'),
(5, 5, 8, '10.00', '10'),
(6, 6, 5, '100.00', '1'),
(7, 6, 8, '10.00', '1'),
(8, 6, 6, '100.00', '1'),
(9, 7, 8, '10.00', '39'),
(10, 8, 8, '10.00', '1'),
(11, 9, 5, '100.00', '2'),
(12, 10, 8, '10.00', '10'),
(13, 11, 8, '10.00', '16'),
(14, 11, 5, '100.00', '1'),
(15, 11, 6, '100.00', '1'),
(16, 12, 8, '10.00', '900'),
(17, 13, 5, '100.00', '3'),
(18, 14, 6, '100.00', '3'),
(19, 15, 8, '10.00', '900'),
(20, 46, 5, '100.00', '5'),
(21, 46, 6, '100.00', '5'),
(22, 46, 8, '10.00', '5'),
(23, 47, 5, '100.00', '1'),
(24, 48, 5, '100.00', '1'),
(25, 49, 8, '10.00', '10'),
(26, 50, 5, '100.00', '2'),
(27, 51, 8, '10.00', '1'),
(28, 52, 8, '10.00', '500'),
(29, 53, 5, '100.00', '1'),
(30, 53, 8, '10.00', '1'),
(31, 54, 5, '100.00', '5'),
(32, 54, 6, '100.00', '5'),
(33, 54, 8, '10.00', '10'),
(34, 55, 5, '100.00', '1'),
(35, 56, 5, '100.00', '1'),
(36, 57, 5, '100.00', '1'),
(37, 58, 5, '100.00', '1'),
(38, 59, 5, '100.00', '5'),
(39, 59, 8, '10.00', '5'),
(40, 60, 5, '100.00', '1'),
(41, 61, 5, '100.00', '1'),
(42, 62, 6, '100.00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `productname` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `productname`, `description`, `price`, `image`, `created_at`, `quantity`) VALUES
(5, 1, 'Pork Sisig', '', 100.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 43),
(6, 1, 'Tuna Sisig', '', 100.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 69),
(8, 7, 'Fried Egg', 'Wow', 10.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 80),
(9, 1, 'Tofu Sisig', '', 100.00, 'pics/uploads/products/1732762184.jpg', '2024-11-28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorders`
--

CREATE TABLE `purchaseorders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_status` varchar(100) NOT NULL,
  `ingPayment_mode` varchar(100) NOT NULL,
  `order_placed_by_id` varchar(100) NOT NULL,
  `supplierName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchaseorders`
--

INSERT INTO `purchaseorders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `order_date`, `order_status`, `ingPayment_mode`, `order_placed_by_id`, `supplierName`) VALUES
(17, 1, '000017', 'INV-483119', '1120', '2024-11-28 10:08:30', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(18, 1, '000018', 'INV-780102', '12', '2024-11-28 10:12:55', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(19, 1, '000019', 'INV-774776', '684', '2024-11-28 10:15:39', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(20, 1, '000020', 'INV-159025', '4660', '2024-11-28 13:44:06', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(21, 1, '000021', 'INV-856629', '840', '2024-11-28 13:46:31', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(22, 1, '000022', 'INV-852741', '415', '2024-11-28 13:48:27', 'Delivered', 'Cash Payment', 'Kristyle Marie', '2'),
(23, 1, '000023', 'INV-269439', '120', '2024-11-28 14:26:42', 'Delivered', 'Cash Payment', 'Kristyle Marie', '2');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `product_id`, `name`, `created_at`) VALUES
(1, 1, '', '2024-10-22 05:38:04'),
(2, 2, '', '2024-10-22 06:57:40'),
(3, 3, '', '2024-10-22 07:03:38'),
(4, 4, '', '2024-11-08 12:49:51'),
(5, 5, '', '2024-11-08 13:05:37'),
(6, 6, '', '2024-11-08 13:25:18'),
(7, 8, '', '2024-11-08 13:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient_id`, `quantity`, `unit_id`) VALUES
(1, 1, 15, 1.00, 16),
(5, 2, 19, 50.00, 13),
(6, 2, 22, 50.00, 18),
(7, 2, 21, 50.00, 13),
(8, 2, 18, 1.00, 14),
(9, 2, 20, 50.00, 13),
(10, 2, 23, 50.00, 18),
(11, 3, 24, 100.00, 13),
(12, 1, 16, 1.00, 14),
(13, 4, 4, 100.00, 13),
(14, 4, 5, 1.00, 14),
(15, 4, 6, 50.00, 18),
(16, 5, 4, 100.00, 13),
(19, 6, 7, 100.00, 13),
(20, 6, 5, 1.00, 14),
(22, 7, 8, 1.00, 14),
(23, 5, 5, 1.00, 14),
(24, 5, 22, 100.00, 13),
(25, 5, 8, 1.00, 14),
(26, 6, 8, 1.00, 14);

-- --------------------------------------------------------

--
-- Table structure for table `saved_ingredients_reports`
--

CREATE TABLE `saved_ingredients_reports` (
  `id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `report_time` time NOT NULL,
  `report_type` enum('products','ingredients') NOT NULL,
  `report_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_ingredients_reports`
--

INSERT INTO `saved_ingredients_reports` (`id`, `report_date`, `report_time`, `report_type`, `report_data`, `created_at`, `start_date`, `end_date`) VALUES
(1, '2024-11-26', '05:55:58', 'ingredients', '[{\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"500\",\"unit_name\":\"g\",\"type\":\"Used\"},{\"ingredient_name\":\"Spoon\",\"quantity_used\":\"10\",\"unit_name\":\"pcs\",\"type\":\"Used\"},{\"ingredient_name\":\"Soy Sauce\",\"quantity_used\":\"750\",\"unit_name\":\"ml\",\"type\":\"Used\"},{\"ingredient_name\":\"Tuna\",\"quantity_used\":\"500\",\"unit_name\":\"g\",\"type\":\"Used\"},{\"ingredient_name\":\"Egg\",\"quantity_used\":\"10\",\"unit_name\":\"pcs\",\"type\":\"Used\"},{\"ingredient_name\":\"Chopstick\",\"quantity_used\":\"0.00\",\"unit_name\":\"pcs\",\"total_quantity\":\"100.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"4.50\",\"unit_name\":\"kg\",\"total_quantity\":\"5000.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Spoon\",\"quantity_used\":\"100.00\",\"unit_name\":\"pcs\",\"total_quantity\":\"100.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Soy Sauce\",\"quantity_used\":\"1.00\",\"unit_name\":\"L\",\"total_quantity\":\"250.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Egg\",\"quantity_used\":\"15.00\",\"unit_name\":\"dozen\",\"total_quantity\":\"180.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Tuna\",\"quantity_used\":\"5.00\",\"unit_name\":\"kg\",\"total_quantity\":\"4500.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"batch_number\":\"14\",\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"500.00\",\"unit_name\":\"g\",\"type\":\"Stock Out\",\"reason\":\"Production\"},{\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"4000.00\",\"unit_name\":\"g\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Spoon\",\"quantity_used\":\"90.00\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Soy Sauce\",\"quantity_used\":\"250.00\",\"unit_name\":\"ml\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Tuna\",\"quantity_used\":\"4500.00\",\"unit_name\":\"g\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Egg\",\"quantity_used\":\"170.00\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Chopstick\",\"quantity_used\":\"0.00\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"}]', '2024-11-26 04:55:58', '2024-11-26', '0000-00-00'),
(2, '2024-11-26', '06:01:27', 'ingredients', '[{\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"500\",\"unit_name\":\"g\",\"type\":\"Used\"},{\"ingredient_name\":\"Spoon\",\"quantity_used\":\"10\",\"unit_name\":\"pcs\",\"type\":\"Used\"},{\"ingredient_name\":\"Soy Sauce\",\"quantity_used\":\"750\",\"unit_name\":\"ml\",\"type\":\"Used\"},{\"ingredient_name\":\"Tuna\",\"quantity_used\":\"500\",\"unit_name\":\"g\",\"type\":\"Used\"},{\"ingredient_name\":\"Egg\",\"quantity_used\":\"10\",\"unit_name\":\"pcs\",\"type\":\"Used\"},{\"ingredient_name\":\"Chopstick\",\"quantity_used\":\"0.00\",\"unit_name\":\"pcs\",\"total_quantity\":\"100.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"4.50\",\"unit_name\":\"kg\",\"total_quantity\":\"5000.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Spoon\",\"quantity_used\":\"100.00\",\"unit_name\":\"pcs\",\"total_quantity\":\"100.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Soy Sauce\",\"quantity_used\":\"1.00\",\"unit_name\":\"L\",\"total_quantity\":\"250.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Egg\",\"quantity_used\":\"15.00\",\"unit_name\":\"dozen\",\"total_quantity\":\"180.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"ingredient_name\":\"Tuna\",\"quantity_used\":\"5.00\",\"unit_name\":\"kg\",\"total_quantity\":\"4500.00\",\"expiry_date\":\"2024-11-26\",\"type\":\"Stock In\"},{\"batch_number\":\"14\",\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"500.00\",\"unit_name\":\"g\",\"type\":\"Stock Out\",\"reason\":\"Production\"},{\"batch_number\":\"3\",\"ingredient_name\":\"Spoon\",\"quantity_used\":\"1.00\",\"unit_name\":\"pcs\",\"type\":\"Stock Out\",\"reason\":\"Expired\"},{\"batch_number\":\"13\",\"ingredient_name\":\"Spoon\",\"quantity_used\":\"3.00\",\"unit_name\":\"pcs\",\"type\":\"Stock Out\",\"reason\":\"Expired\"},{\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"4000.00\",\"unit_name\":\"g\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Spoon\",\"quantity_used\":\"86.00\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Soy Sauce\",\"quantity_used\":\"250.00\",\"unit_name\":\"ml\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Tuna\",\"quantity_used\":\"4500.00\",\"unit_name\":\"g\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Egg\",\"quantity_used\":\"170.00\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Chopstick\",\"quantity_used\":\"0.00\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"}]', '2024-11-26 05:01:27', '2024-11-26', '0000-00-00'),
(3, '2025-04-08', '11:31:35', 'ingredients', '[{\"ingredient_name\":\"Spoon\",\"quantity_used\":\"3\",\"unit_name\":\"pcs\",\"type\":\"Used\"},{\"ingredient_name\":\"Tuna\",\"quantity_used\":\"100\",\"unit_name\":\"g\",\"type\":\"Used\"},{\"ingredient_name\":\"Egg\",\"quantity_used\":\"3\",\"unit_name\":\"pcs\",\"type\":\"Used\"},{\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"200\",\"unit_name\":\"g\",\"type\":\"Used\"},{\"ingredient_name\":\"Spoon\",\"quantity_used\":\"92\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Soy Sauce\",\"quantity_used\":\"0\",\"unit_name\":\"L\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Tuna\",\"quantity_used\":\"6900\",\"unit_name\":\"g\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Egg\",\"quantity_used\":\"80\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Chopstick\",\"quantity_used\":\"12\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Pork Belly\",\"quantity_used\":\"4300\",\"unit_name\":\"g\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Tofu\",\"quantity_used\":\"3000\",\"unit_name\":\"g\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Chicken\",\"quantity_used\":\"6003\",\"unit_name\":\"g\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Onion\",\"quantity_used\":\"4\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Garlic\",\"quantity_used\":\"3\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Carrots\",\"quantity_used\":\"0\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Bell Pepper\",\"quantity_used\":\"4\",\"unit_name\":\"pcs\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Knorr Liquid Seasoning\",\"quantity_used\":\"0\",\"unit_name\":\"L\",\"type\":\"Remaining\"},{\"ingredient_name\":\"Oil\",\"quantity_used\":\"0\",\"unit_name\":\"L\",\"type\":\"Remaining\"}]', '2025-04-08 09:31:35', '2025-04-07', '2025-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `saved_products_reports`
--

CREATE TABLE `saved_products_reports` (
  `id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `report_time` time NOT NULL,
  `report_type` enum('products','ingredients') NOT NULL,
  `report_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_products_reports`
--

INSERT INTO `saved_products_reports` (`id`, `report_date`, `report_time`, `report_type`, `report_data`, `created_at`, `start_date`, `end_date`) VALUES
(28, '2024-11-28', '06:38:49', 'products', '{\"remaining_products\":[{\"productname\":\"Pork Sisig\",\"quantity\":\"1\"},{\"productname\":\"Tuna Sisig\",\"quantity\":\"5\"},{\"productname\":\"Fried Egg\",\"quantity\":\"170\"}],\"completed_orders\":[{\"id\":\"34\",\"order_id\":\"55\",\"product_id\":\"5\",\"price\":\"100.00\",\"quantity\":\"1\",\"tracking_no\":\"000002\",\"productname\":\"Pork Sisig\"}],\"cancelled_orders\":[{\"id\":\"35\",\"order_id\":\"56\",\"product_id\":\"5\",\"price\":\"100.00\",\"quantity\":\"1\",\"tracking_no\":\"000003\",\"productname\":\"Pork Sisig\"}]}', '2024-11-27 22:38:49', '2024-11-28', '0000-00-00'),
(29, '2025-04-08', '16:11:41', 'products', '{\"remaining_products\":[],\"completed_orders\":[{\"id\":\"40\",\"order_id\":\"60\",\"product_id\":\"5\",\"price\":\"100.00\",\"quantity\":\"1\",\"tracking_no\":\"000001\",\"productname\":\"Pork Sisig\"}],\"cancelled_orders\":[]}', '2025-04-08 08:11:41', '2025-04-07', '2025-04-08'),
(30, '2025-04-08', '17:31:22', 'products', '{\"remaining_products\":[],\"completed_orders\":[{\"id\":\"40\",\"order_id\":\"60\",\"product_id\":\"5\",\"price\":\"100.00\",\"quantity\":\"1\",\"tracking_no\":\"000001\",\"productname\":\"Pork Sisig\"},{\"id\":\"41\",\"order_id\":\"61\",\"product_id\":\"5\",\"price\":\"100.00\",\"quantity\":\"1\",\"tracking_no\":\"000002\",\"productname\":\"Pork Sisig\"},{\"id\":\"42\",\"order_id\":\"62\",\"product_id\":\"6\",\"price\":\"100.00\",\"quantity\":\"1\",\"tracking_no\":\"000003\",\"productname\":\"Tuna Sisig\"}],\"cancelled_orders\":[]}', '2025-04-08 09:31:22', '2025-04-07', '2025-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `stockin`
--

CREATE TABLE `stockin` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `purchaseorder_id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `stockin_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockin`
--

INSERT INTO `stockin` (`id`, `admin_id`, `purchaseorder_id`, `invoice_no`, `supplier_id`, `stockin_date`) VALUES
(17, 1, 17, 'INV-483119', 1, '2024-11-28 10:08:40'),
(18, 1, 18, 'INV-780102', 1, '2024-11-28 10:13:09'),
(19, 1, 19, 'INV-774776', 1, '2024-11-28 10:15:48'),
(20, 1, 20, 'INV-159025', 1, '2024-11-28 13:44:46'),
(21, 1, 21, 'INV-856629', 1, '2024-11-28 13:46:44'),
(22, 1, 22, 'INV-852741', 2, '2024-11-28 13:48:42'),
(23, 1, 23, 'INV-269439', 2, '2024-11-28 14:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `stockin_ingredients`
--

CREATE TABLE `stockin_ingredients` (
  `id` int(11) NOT NULL,
  `stockin_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `totalQuantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `expiryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockin_ingredients`
--

INSERT INTO `stockin_ingredients` (`id`, `stockin_id`, `ingredient_id`, `quantity`, `totalQuantity`, `unit_id`, `totalPrice`, `expiryDate`) VALUES
(19, 17, 22, 0.20, 3200.00, 16, 1120, '2024-11-28'),
(20, 18, 21, 12.00, 12.00, 14, 12, '2024-11-28'),
(21, 19, 5, 102.00, 94.00, 14, 204, '2024-11-28'),
(22, 19, 8, 4.00, 37.00, 15, 480, '2024-11-28'),
(23, 20, 7, 7.00, 7000.00, 16, 2450, '2024-11-28'),
(24, 20, 22, 5.00, 5000.00, 16, 1400, '2024-11-28'),
(25, 20, 23, 3.00, 3000.00, 16, 390, '2024-11-28'),
(26, 20, 24, 3.00, 3.00, 13, 420, '2024-11-28'),
(27, 21, 24, 6.00, 6000.00, 16, 840, '2024-11-28'),
(28, 22, 8, 3.00, 36.00, 15, 360, '2024-11-28'),
(29, 22, 25, 4.00, 4.00, 14, 20, '2024-11-28'),
(30, 22, 26, 3.00, 3.00, 14, 15, '2024-11-28'),
(31, 22, 28, 4.00, 4.00, 14, 20, '2024-11-28'),
(32, 23, 8, 0.75, 12.00, 15, 120, '2024-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `stock_out`
--

CREATE TABLE `stock_out` (
  `id` int(11) NOT NULL,
  `stockin_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_out`
--

INSERT INTO `stock_out` (`id`, `stockin_id`, `ingredient_id`, `quantity`, `reason`, `created_at`) VALUES
(79, 17, 22, 2000.00, 'Expired', '2024-11-28 10:12:20'),
(80, 17, 22, 1800.00, 'Loss', '2024-11-28 10:12:31'),
(81, 23, 8, 3.00, 'Damaged', '2024-11-28 14:29:18');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `phonenumber` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `firstname`, `lastname`, `phonenumber`, `address`, `status`) VALUES
(1, 'Marie', 'Meat Shop', '09094192413', 'Purok Lomboy Coog, Mandug,', 'active'),
(2, 'Mae', 'Vegetables', '0934567890', 'Coog', 'active'),
(3, 'John', 'Grocery Store', '1234567890', 'Davao City', 'active'),
(4, 'Evanica', 'Juarbal', '09566440399', 'Arellano Extension', 'active'),
(5, 'Evanica', 'Juarbal', '09566440399', 'Arellano Extension', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ingredients`
--

CREATE TABLE `supplier_ingredients` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_ingredients`
--

INSERT INTO `supplier_ingredients` (`id`, `supplier_id`, `ingredient_id`, `price`, `unit_id`) VALUES
(8, 2, 8, 120.00, 15),
(12, 1, 22, 280.00, 16),
(14, 1, 7, 350.00, 16),
(15, 1, 23, 130.00, 16),
(17, 1, 24, 140.00, 16),
(18, 2, 23, 140.00, 13),
(19, 2, 26, 5.00, 14),
(20, 2, 25, 5.00, 14),
(21, 2, 28, 5.00, 14),
(22, 3, 30, 340.00, 19),
(23, 3, 29, 1000.00, 19),
(24, 5, 5, 50.00, 14),
(25, 5, 23, 30.00, 16),
(26, 3, 6, 68.00, 19);

-- --------------------------------------------------------

--
-- Table structure for table `units_of_measure`
--

CREATE TABLE `units_of_measure` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `uom_name` varchar(255) DEFAULT NULL,
  `type` enum('reference','bigger','smaller') DEFAULT NULL,
  `ratio` decimal(10,5) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `rounding_precision` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units_of_measure`
--

INSERT INTO `units_of_measure` (`id`, `category_id`, `uom_name`, `type`, `ratio`, `active`, `rounding_precision`) VALUES
(13, 5, 'g', 'reference', 1.00000, 1, 0.01000),
(14, 6, 'pcs', 'reference', 1.00000, 1, 0.01000),
(15, 6, 'dozen', 'bigger', 12.00000, 1, 0.01000),
(16, 5, 'kg', 'bigger', 1000.00000, 1, 0.01000),
(18, 7, 'ml', 'reference', 1.00000, 1, 0.01000),
(19, 7, 'L', 'reference', 1.00000, 1, 0.01000),
(20, 7, 'gl', 'bigger', 0.00026, 1, 0.01000),
(22, 5, 'mg', 'smaller', 0.00100, 1, 0.00000);

-- --------------------------------------------------------

--
-- Table structure for table `unit_categories`
--

CREATE TABLE `unit_categories` (
  `id` int(11) NOT NULL,
  `category_unit_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_categories`
--

INSERT INTO `unit_categories` (`id`, `category_unit_name`) VALUES
(5, 'Weight'),
(6, 'Quantity'),
(7, 'Volume');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `ingredients_reports`
--
ALTER TABLE `ingredients_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients_report_details`
--
ALTER TABLE `ingredients_report_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `inventory_reports`
--
ALTER TABLE `inventory_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_report_details`
--
ALTER TABLE `inventory_report_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `saved_ingredients_reports`
--
ALTER TABLE `saved_ingredients_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_products_reports`
--
ALTER TABLE `saved_products_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockin`
--
ALTER TABLE `stockin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockin_ingredients`
--
ALTER TABLE `stockin_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_ingredients_ibfk_1` (`supplier_id`),
  ADD KEY `supplier_ingredients_ibfk_2` (`ingredient_id`);

--
-- Indexes for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `unit_categories`
--
ALTER TABLE `unit_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `ingredients_reports`
--
ALTER TABLE `ingredients_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ingredients_report_details`
--
ALTER TABLE `ingredients_report_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=824;

--
-- AUTO_INCREMENT for table `inventory_reports`
--
ALTER TABLE `inventory_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory_report_details`
--
ALTER TABLE `inventory_report_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `saved_ingredients_reports`
--
ALTER TABLE `saved_ingredients_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `saved_products_reports`
--
ALTER TABLE `saved_products_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `stockin_ingredients`
--
ALTER TABLE `stockin_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `unit_categories`
--
ALTER TABLE `unit_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units_of_measure` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_report_details`
--
ALTER TABLE `inventory_report_details`
  ADD CONSTRAINT `inventory_report_details_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `inventory_reports` (`id`);

--
-- Constraints for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `stock_out_ibfk_1` FOREIGN KEY (`stockin_id`) REFERENCES `stockin` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_out_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  ADD CONSTRAINT `supplier_ingredients_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `supplier_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
