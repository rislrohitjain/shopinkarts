-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table shopinkarts.attributes
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_attributes_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.attributes: ~5 rows (approximately)
INSERT INTO `attributes` (`id`, `name`, `slug`) VALUES
	(1, 'Size', 'size'),
	(2, 'Color', 'color'),
	(3, 'Material', 'material'),
	(4, 'Storage', 'storage'),
	(5, 'RAM', 'ram');

-- Dumping structure for table shopinkarts.attribute_values
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE IF NOT EXISTS `attribute_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attr_values_attribute` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.attribute_values: ~5 rows (approximately)
INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`) VALUES
	(1, 1, 'S'),
	(2, 1, 'M'),
	(3, 1, 'L'),
	(4, 1, 'XL'),
	(5, 1, 'XXL');

-- Dumping structure for table shopinkarts.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.cache: ~2 rows (approximately)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('shopinkarts-cache-admin@shopinkart.com|::1', 'i:1;', 1765717146),
	('shopinkarts-cache-admin@shopinkart.com|::1:timer', 'i:1765717146;', 1765717146);

-- Dumping structure for table shopinkarts.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.cache_locks: ~0 rows (approximately)

-- Dumping structure for table shopinkarts.carts
DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_carts_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.carts: ~5 rows (approximately)
INSERT INTO `carts` (`id`, `user_id`) VALUES
	(1, 301),
	(2, 302),
	(3, 303),
	(4, 304),
	(5, 305);

-- Dumping structure for table shopinkarts.cart_items
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cart_items_cart` (`cart_id`),
  KEY `idx_cart_items_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.cart_items: ~5 rows (approximately)
INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `quantity`, `price`) VALUES
	(1, 1, 1, 1, 75000.00),
	(2, 1, 4, 2, 799.00),
	(3, 2, 2, 1, 68000.00),
	(4, 3, 3, 1, 55000.00),
	(5, 4, 5, 1, 1599.00);

-- Dumping structure for table shopinkarts.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_categories_slug` (`slug`),
  KEY `idx_categories_parent` (`parent_id`),
  KEY `idx_categories_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.categories: ~5 rows (approximately)
INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `level`, `is_active`) VALUES
	(1, NULL, 'Electronics', 'electronics', 1, 1),
	(2, 1, 'Mobiles', 'mobiles', 2, 1),
	(3, 1, 'Laptops', 'laptops', 2, 1),
	(4, NULL, 'Fashion', 'fashion', 1, 1),
	(5, 4, 'Men Clothing', 'men-clothing', 2, 1);

-- Dumping structure for table shopinkarts.category_attributes
DROP TABLE IF EXISTS `category_attributes`;
CREATE TABLE IF NOT EXISTS `category_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cat_attr_unique` (`category_id`,`attribute_id`),
  KEY `idx_cat_attr_attribute` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.category_attributes: ~5 rows (approximately)
INSERT INTO `category_attributes` (`id`, `category_id`, `attribute_id`) VALUES
	(1, 2, 1),
	(2, 2, 2),
	(3, 3, 4),
	(4, 4, 1),
	(5, 5, 1);

-- Dumping structure for table shopinkarts.courier_partners
DROP TABLE IF EXISTS `courier_partners`;
CREATE TABLE IF NOT EXISTS `courier_partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_courier_slug` (`slug`),
  KEY `idx_courier_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.courier_partners: ~5 rows (approximately)
INSERT INTO `courier_partners` (`id`, `name`, `slug`, `is_active`) VALUES
	(1, 'Delhivery', 'delhivery', 1),
	(2, 'BlueDart', 'bluedart', 1),
	(3, 'DTDC', 'dtdc', 1),
	(4, 'Ekart', 'ekart', 1),
	(5, 'Shadowfax', 'shadowfax', 1);

-- Dumping structure for table shopinkarts.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table shopinkarts.invoices
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(100) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_invoices_number` (`invoice_number`),
  KEY `idx_invoices_order` (`order_id`),
  KEY `idx_invoices_transaction` (`transaction_id`),
  KEY `idx_invoices_date` (`invoice_date`),
  KEY `idx_invoices_payment_status` (`payment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.invoices: ~5 rows (approximately)
INSERT INTO `invoices` (`id`, `invoice_number`, `order_id`, `transaction_id`, `invoice_date`, `subtotal`, `tax_amount`, `discount_amount`, `total_amount`, `payment_status`, `created_at`) VALUES
	(1, 'INV-001', 1, 1, '2025-01-10', 75000.00, 1348.00, 0.00, 76348.00, 'paid', '2025-01-10 10:20:00'),
	(2, 'INV-002', 2, 2, '2025-01-11', 68000.00, 0.00, 0.00, 68000.00, 'paid', '2025-01-11 11:35:00'),
	(3, 'INV-003', 3, 3, '2025-01-12', 55000.00, 0.00, 0.00, 55000.00, 'failed', '2025-01-12 14:30:00'),
	(4, 'INV-004', 4, 4, '2025-01-13', 1599.00, 0.00, 100.00, 1499.00, 'paid', '2025-01-13 16:00:00'),
	(5, 'INV-005', 5, 5, '2025-01-14', 799.00, 0.00, 0.00, 799.00, 'refunded', '2025-01-14 17:10:00');

-- Dumping structure for table shopinkarts.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.jobs: ~0 rows (approximately)

-- Dumping structure for table shopinkarts.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.job_batches: ~0 rows (approximately)

-- Dumping structure for table shopinkarts.marketplaces
DROP TABLE IF EXISTS `marketplaces`;
CREATE TABLE IF NOT EXISTS `marketplaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_marketplace_slug` (`slug`),
  KEY `idx_marketplace_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.marketplaces: ~5 rows (approximately)
INSERT INTO `marketplaces` (`id`, `name`, `slug`, `is_active`) VALUES
	(1, 'Amazon', 'amazon', 1),
	(2, 'Flipkart', 'flipkart', 1),
	(3, 'Meesho', 'meesho', 1),
	(4, 'Shopinkarts', 'shopinkarts', 1),
	(5, 'Jiomart', 'jiomart', 1);

-- Dumping structure for table shopinkarts.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.migrations: ~4 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_12_14_114633_create_permission_tables', 2);

-- Dumping structure for table shopinkarts.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table shopinkarts.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.model_has_roles: ~3 rows (approximately)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(3, 'App\\Models\\User', 3);

-- Dumping structure for table shopinkarts.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_orders_number` (`order_number`),
  KEY `idx_orders_user` (`user_id`),
  KEY `idx_orders_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.orders: ~5 rows (approximately)
INSERT INTO `orders` (`id`, `user_id`, `order_number`, `total_amount`, `status`) VALUES
	(1, 301, 'ORD001', 76598.00, 'placed'),
	(2, 302, 'ORD002', 68000.00, 'confirmed'),
	(3, 303, 'ORD003', 55000.00, 'shipped'),
	(4, 304, 'ORD004', 1599.00, 'delivered'),
	(5, 305, 'ORD005', 799.00, 'cancelled');

-- Dumping structure for table shopinkarts.order_delivery
DROP TABLE IF EXISTS `order_delivery`;
CREATE TABLE IF NOT EXISTS `order_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `delivery_staff_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_delivery_order` (`order_id`),
  KEY `idx_order_delivery_staff` (`delivery_staff_id`),
  KEY `idx_order_delivery_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.order_delivery: ~5 rows (approximately)
INSERT INTO `order_delivery` (`id`, `order_id`, `delivery_staff_id`, `status`) VALUES
	(1, 1, 401, 'assigned'),
	(2, 2, 402, 'picked'),
	(3, 3, 403, 'out_for_delivery'),
	(4, 4, 404, 'delivered'),
	(5, 5, 405, 'cancelled');

-- Dumping structure for table shopinkarts.order_items
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_items_order` (`order_id`),
  KEY `idx_order_items_product` (`product_id`),
  KEY `idx_order_items_manufacturer` (`manufacturer_id`),
  KEY `idx_order_items_seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.order_items: ~5 rows (approximately)
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `manufacturer_id`, `seller_id`, `quantity`, `price`) VALUES
	(1, 1, 1, 101, 201, 1, 75000.00),
	(2, 1, 4, 103, 204, 2, 799.00),
	(3, 2, 2, 101, 202, 1, 68000.00),
	(4, 3, 3, 102, 203, 1, 55000.00),
	(5, 4, 5, 103, 205, 1, 1599.00);

-- Dumping structure for table shopinkarts.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table shopinkarts.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.permissions: ~6 rows (approximately)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'view user management', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(2, 'create users', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(3, 'edit users', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(4, 'delete users', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(5, 'view dashboard', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(6, 'manage content', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51');

-- Dumping structure for table shopinkarts.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `slug` varchar(160) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_products_slug` (`slug`),
  KEY `idx_products_manufacturer` (`manufacturer_id`),
  KEY `idx_products_category` (`category_id`),
  KEY `idx_products_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.products: ~5 rows (approximately)
INSERT INTO `products` (`id`, `manufacturer_id`, `category_id`, `name`, `slug`, `price`, `stock`, `is_active`) VALUES
	(1, 101, 2, 'iPhone 15', 'iphone-15', 75000.00, 50, 1),
	(2, 101, 2, 'Samsung S23', 'samsung-s23', 68000.00, 40, 1),
	(3, 102, 3, 'Dell Inspiron', 'dell-inspiron', 55000.00, 20, 1),
	(4, 103, 5, 'Men T-Shirt', 'men-tshirt', 799.00, 100, 1),
	(5, 103, 5, 'Men Jeans', 'men-jeans', 1599.00, 60, 1);

-- Dumping structure for table shopinkarts.product_attributes
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `attribute_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prod_attr_product` (`product_id`),
  KEY `idx_prod_attr_attribute` (`attribute_id`),
  KEY `idx_prod_attr_value` (`attribute_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.product_attributes: ~5 rows (approximately)
INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_id`, `attribute_value_id`) VALUES
	(1, 4, 1, 2),
	(2, 4, 1, 3),
	(3, 5, 1, 4),
	(4, 1, 4, 5),
	(5, 2, 4, 4);

-- Dumping structure for table shopinkarts.product_distributions
DROP TABLE IF EXISTS `product_distributions`;
CREATE TABLE IF NOT EXISTS `product_distributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `commission` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prod_dist_product` (`product_id`),
  KEY `idx_prod_dist_manufacturer` (`manufacturer_id`),
  KEY `idx_prod_dist_seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.product_distributions: ~5 rows (approximately)
INSERT INTO `product_distributions` (`id`, `product_id`, `manufacturer_id`, `seller_id`, `commission`) VALUES
	(1, 1, 101, 201, 10.00),
	(2, 2, 101, 202, 12.00),
	(3, 3, 102, 203, 8.00),
	(4, 4, 103, 204, 15.00),
	(5, 5, 103, 205, 15.00);

-- Dumping structure for table shopinkarts.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.roles: ~7 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(2, 'Admin', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(3, 'Jr. Operator', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(4, 'Sr. Operator', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(5, 'Seller', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(6, 'Manufacture', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51'),
	(7, 'Delivery Person', 'web', '2025-12-14 06:18:51', '2025-12-14 06:18:51');

-- Dumping structure for table shopinkarts.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.role_has_permissions: ~14 rows (approximately)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 1),
	(2, 2),
	(3, 1),
	(3, 2),
	(4, 1),
	(4, 2),
	(5, 1),
	(5, 2),
	(5, 3),
	(6, 1),
	(6, 2),
	(6, 3);

-- Dumping structure for table shopinkarts.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.sessions: ~3 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('8wTl8tw2lUwVOyY0oz3V4wbKewrlxYdVLlJ4IVs8', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmhHR0JVbzlXS05sQW9uMWs3STBubnQyM0RFQzhJSWVBbUx0UVRISCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Qvc2hvcGlua2FydHMiO3M6NToicm91dGUiO3M6NzoibGFuZGluZyI7fX0=', 1765722567),
	('lwtX2HzKOFKFQgdRsC7oCLwM5sgM97i7CpY4R2H8', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMWdhcnRrWGR5SFJ6YjBrWm5lck95TE1RRDVjS1NWUHp5YllVWm56USI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Qvc2hvcGlua2FydC9wdWJsaWMvaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3NjU3MTQ5Nzc7fX0=', 1765715051),
	('Y9K2pHOJ8nAJuRoweemzkY0TGHKlJbkQdxYR91A1', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicHVYc2w5dlNGS1dhNHBDS0JLejFlNlhJSmQ3cU9JTldUSmx1UmFHRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Qvc2hvcGlua2FydC9wdWJsaWMvaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3NjU3MTkwOTA7fX0=', 1765719274);

-- Dumping structure for table shopinkarts.subscribers
DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_subscribers_user` (`user_id`),
  KEY `idx_subscribers_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.subscribers: ~5 rows (approximately)
INSERT INTO `subscribers` (`id`, `user_id`, `is_active`) VALUES
	(1, 301, 1),
	(2, 302, 1),
	(3, 303, 0),
	(4, 304, 1),
	(5, 305, 0);

-- Dumping structure for table shopinkarts.subscriber_orders
DROP TABLE IF EXISTS `subscriber_orders`;
CREATE TABLE IF NOT EXISTS `subscriber_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sub_orders_subscriber` (`subscriber_id`),
  KEY `idx_sub_orders_user` (`user_id`),
  KEY `idx_sub_orders_transaction` (`transaction_id`),
  KEY `idx_sub_orders_status` (`status`),
  KEY `idx_sub_orders_dates` (`start_date`,`end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.subscriber_orders: ~5 rows (approximately)
INSERT INTO `subscriber_orders` (`id`, `subscriber_id`, `user_id`, `transaction_id`, `start_date`, `end_date`, `status`) VALUES
	(1, 1, 301, 'TXN001', '2025-01-01', '2025-12-31', 'active'),
	(2, 2, 302, 'TXN002', '2025-02-01', '2026-01-31', 'active'),
	(3, 3, 303, 'TXN003', '2024-01-01', '2024-12-31', 'expired'),
	(4, 4, 304, 'TXN004', '2025-03-01', '2026-02-28', 'active'),
	(5, 5, 305, 'TXN005', '2024-06-01', '2025-05-31', 'expired');

-- Dumping structure for table shopinkarts.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `subscriber_id` int(11) DEFAULT NULL,
  `transaction_number` varchar(100) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_transactions_number` (`transaction_number`),
  KEY `idx_transactions_order` (`order_id`),
  KEY `idx_transactions_subscriber` (`subscriber_id`),
  KEY `idx_transactions_status` (`status`),
  KEY `idx_transactions_date` (`transaction_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table shopinkarts.transactions: ~5 rows (approximately)
INSERT INTO `transactions` (`id`, `order_id`, `subscriber_id`, `transaction_number`, `payment_method`, `amount`, `currency`, `status`, `transaction_date`) VALUES
	(1, 1, NULL, 'TXN-ORD-001', 'UPI', 76598.00, 'INR', 'success', '2025-01-10 10:15:00'),
	(2, 2, NULL, 'TXN-ORD-002', 'Credit Card', 68000.00, 'INR', 'success', '2025-01-11 11:30:00'),
	(3, 3, NULL, 'TXN-ORD-003', 'Net Banking', 55000.00, 'INR', 'failed', '2025-01-12 14:20:00'),
	(4, NULL, 1, 'TXN-SUB-001', 'UPI', 1999.00, 'INR', 'success', '2025-01-01 09:00:00'),
	(5, NULL, 2, 'TXN-SUB-002', 'Debit Card', 2999.00, 'INR', 'success', '2025-02-01 09:00:00');

-- Dumping structure for table shopinkarts.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopinkarts.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Anubhav Singh', 'superadmin@shopinkarts.com', '2025-12-14 06:18:52', '$2y$12$374HlqO3qdAscvrOlP2RweaAjpLtnNKogQJyslflcE.b5bBX5z.8S', 'YtjStV3JM0', '2025-12-14 06:18:52', '2025-12-14 06:18:52'),
	(2, 'Admin', 'admin@shopinkarts.com', '2025-12-14 06:18:52', '$2y$12$kr94z8ISi1xq5RLQrOVwvO0ALEE1e1QWmUN6TPXMGKJQwUVermMga', 'uX62KPXsXoTnbTAIb8dBtOFtuAbHX1nRtK42SnYAMpJfDmLy8WDpY8TRA9Xm', '2025-12-14 06:18:52', '2025-12-14 06:18:52'),
	(3, 'Jr. Operator', 'operator@shopinkarts.com', '2025-12-14 06:18:52', '$2y$12$RIKlKCphI2SitqSl1hbWZ.bdHzLnaHaNtyFpsDeLT8.c7gw1OJyki', '4uS7AMsVO5', '2025-12-14 06:18:52', '2025-12-14 06:18:52');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
