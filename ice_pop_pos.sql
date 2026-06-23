-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 23, 2026 at 11:39 AM
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
-- Database: `ice_pop_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `image_path` varchar(255) DEFAULT 'default_icepop.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `stock_quantity`, `is_active`, `image_path`) VALUES
(1, 'Raspberry', 1400.00, 25, 1, '1782193903_BlueBerry.png.webp'),
(2, 'Rainbow', 1600.00, 23, 1, 'default_icepop.png'),
(3, 'Pineapple', 1700.00, 8, 1, '1782197837_pngtree-bright-yellow-popsicle-ice-cream-on-a-wooden-stick-png-image_16048646.png'),
(4, 'Chocolate', 1800.00, 32, 1, '1782197944_pngtree-chocolate-popsicle-isolated-png-image_10188240.png'),
(5, 'Green Apple', 1400.00, 9, 1, '1782198253_pngtree-green-popsicle-ice-cream-isolated-on-white-background-png-image_15396245.png'),
(6, 'Mango', 1800.00, 10, 1, '1782198093_pngtree-mango-popsicle-png-image_16478802.png'),
(7, 'Bluberry', 1400.00, 8, 1, '1782198185_pngtree-3d-render-blue-ice-pop-png-image_11573288.png'),
(8, 'Strawberry', 1900.00, 16, 1, '1782204504_54535-4-ice-pop-picture-free-transparent-image-hq.png'),
(9, 'Jelly', 1500.00, 20, 1, '1782205425_pngtree-delicious-ice-lolly-popsicles-for-summer-png-image_12913078.png');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_date`, `total_amount`) VALUES
(1, '2026-06-06 06:21:00', 4200.00),
(2, '2026-06-20 06:25:41', 2000.00),
(3, '2026-06-21 06:29:03', 5800.00),
(4, '2026-06-21 06:30:40', 4000.00),
(5, '2026-06-21 06:31:45', 1800.00),
(6, '2026-06-22 06:33:24', 1400.00),
(7, '2026-06-22 06:34:40', 1400.00),
(8, '2026-06-22 06:34:46', 1800.00),
(9, '2026-06-22 06:35:42', 8200.00),
(10, '2026-06-22 06:36:59', 1400.00),
(11, '2026-06-23 06:38:58', 1400.00),
(12, '2026-06-23 06:39:11', 1400.00),
(13, '2026-06-23 06:40:48', 1400.00),
(14, '2026-06-23 06:45:53', 1400.00),
(15, '2026-06-23 06:46:23', 1400.00),
(16, '2026-06-23 06:48:36', 22400.00),
(17, '2026-06-23 06:48:58', 29000.00),
(18, '2026-06-23 06:49:07', 1400.00),
(19, '2026-06-23 07:07:06', 1400.00),
(20, '2026-06-23 07:18:31', 1400.00),
(21, '2026-06-23 07:20:56', 1300.00),
(22, '2026-06-23 07:41:04', 2000.00),
(23, '2026-06-23 08:45:43', 2600.00),
(24, '2026-06-23 08:50:44', 2600.00),
(25, '2026-06-23 08:56:39', 1800.00),
(26, '2026-06-23 09:04:15', 9400.00),
(27, '2026-06-23 09:35:01', 3400.00);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `line_item_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`line_item_id`, `transaction_id`, `product_id`, `quantity`) VALUES
(1, 1, 2, 3),
(2, 2, 4, 1),
(3, 3, 1, 2),
(4, 3, 2, 2),
(5, 4, 4, 2),
(6, 5, 5, 1),
(7, 6, 3, 1),
(8, 7, 2, 1),
(9, 8, 5, 1),
(10, 9, 2, 3),
(11, 9, 4, 2),
(12, 10, 3, 1),
(13, 11, 2, 1),
(14, 12, 2, 1),
(15, 13, 2, 1),
(16, 14, 2, 1),
(17, 15, 2, 1),
(18, 16, 2, 16),
(19, 17, 1, 10),
(20, 17, 3, 10),
(21, 18, 2, 1),
(22, 19, 2, 1),
(23, 20, 2, 1),
(24, 21, 1, 1),
(25, 22, 4, 1),
(26, 23, 1, 2),
(27, 24, 1, 2),
(28, 25, 5, 1),
(29, 26, 4, 2),
(30, 26, 9, 3),
(31, 27, 8, 1),
(32, 27, 9, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`line_item_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `line_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transaction_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
