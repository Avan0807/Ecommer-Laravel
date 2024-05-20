-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th5 20, 2024 lúc 07:01 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerceadvlara`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'YaeMiko', 'banner-1', 'https://yaemiko.click/wp-content/uploads/2024/04/Yaemiko-1-rotated.jpg', 'FROM ANIME WITH LOVE\r\nCHUYÊN BÁN TRANG PHỤC COSPLAY, CHO THUÊ ĐỒ QUANH HÀ NỘI', 'active', '2024-05-14 15:55:48', '2024-05-15 13:13:18'),
(2, 'MÙA HÈ RỰC LỬA', 'banner-2', 'https://yaemiko.click/wp-content/uploads/2024/04/tai-xuong-e1713292866832.jpg', 'NHỮNG MẪU TRANG PHỤC MỚI\r\nHãy cập nhật những mẫu sản phẩm mới nhất của Yae Miko', 'active', '2024-05-14 15:57:12', '2024-05-15 13:10:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'YaeMiko', 'test', 'active', '2024-05-14 23:59:28', '2024-05-15 13:02:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(2, 1, 5, 2, 769.23, 'new', 1, 769.23, '2024-05-15 11:54:26', '2024-05-19 02:02:18'),
(4, 8, 2, 1, 799.20, 'new', 6, 4795.20, '2024-05-15 13:13:47', '2024-05-19 01:56:41'),
(5, 9, 3, 1, 799.20, 'new', 2, 1798.20, '2024-05-19 01:59:32', '2024-05-19 02:00:39'),
(6, 8, 3, 1, 799.20, 'new', 1, 799.20, '2024-05-19 01:59:50', '2024-05-19 02:00:39'),
(7, 5, 4, 1, 1172.30, 'new', 1, 1172.30, '2024-05-19 02:01:10', '2024-05-19 02:01:30'),
(8, 8, NULL, 1, 799.20, 'new', 2, 1598.40, '2024-05-19 14:41:30', '2024-05-19 14:42:15'),
(9, 7, NULL, 1, 799.20, 'new', 4, 3196.80, '2024-05-19 14:41:38', '2024-05-20 00:52:40'),
(10, 4, NULL, 1, 1172.30, 'new', 4, 4689.20, '2024-05-19 14:41:49', '2024-05-19 14:42:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'onepiece', 'test', 'zoro', 'https://i.pinimg.com/564x/56/be/bd/56bebd8e5b9db6044ec974e862df487a.jpg', 1, NULL, NULL, 'active', '2024-05-14 23:55:40', '2024-05-15 12:59:04'),
(3, 'Naruto', 'naruto', 'naruto', 'https://i.pinimg.com/564x/c6/89/d4/c689d4801269482644302b75dee37c5b.jpg', 1, NULL, NULL, 'active', '2024-05-15 12:57:51', '2024-05-15 12:57:51'),
(4, 'Kimetsu no Yaiba', 'kimetsu-no-yaiba', 'kimetsu', 'https://i.pinimg.com/564x/fd/1a/48/fd1a48a4abeba49879d3c6126bb10f67.jpg', 1, NULL, NULL, 'active', '2024-05-15 12:58:43', '2024-05-15 13:01:41'),
(5, 'Genshin Impact', 'genshin-impact-2405195626-277', 'genshin impact', 'https://i.pinimg.com/564x/e5/4c/e0/e54ce02b8b29277d9e7275c5b5af5b0e.jpg', 1, NULL, NULL, 'active', '2024-05-19 09:56:26', '2024-05-19 09:56:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Văn', 'avan', 'Van080703@gmail.com', NULL, '0967078760', '123asdasdadasvavsavavasvasvasvasv', '2024-05-19 01:57:24', '2024-05-15 13:20:01', '2024-05-19 01:57:24'),
(2, 'Nguyễn Văn', 'lalala', 'Van080703@gmail.com', NULL, '0967078760', 'llloelaoeloaloeloaleoal', '2024-05-19 14:43:36', '2024-05-19 14:43:21', '2024-05-19 14:43:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2020_07_10_021010_create_brands_table', 1),
(25, '2020_07_10_025334_create_banners_table', 1),
(26, '2020_07_10_112147_create_categories_table', 1),
(27, '2020_07_11_063857_create_products_table', 1),
(28, '2020_07_12_073132_create_post_categories_table', 1),
(29, '2020_07_12_073701_create_post_tags_table', 1),
(30, '2020_07_12_083638_create_posts_table', 1),
(31, '2020_07_13_151329_create_messages_table', 1),
(32, '2020_07_14_023748_create_shippings_table', 1),
(33, '2020_07_15_054356_create_orders_table', 1),
(34, '2020_07_15_102626_create_carts_table', 1),
(35, '2020_07_16_041623_create_notifications_table', 1),
(36, '2020_07_16_053240_create_coupons_table', 1),
(37, '2020_07_23_143757_create_wishlists_table', 1),
(38, '2020_07_24_074930_create_product_reviews_table', 1),
(39, '2020_07_24_131727_create_post_comments_table', 1),
(40, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1be981ef-2b56-46cb-bb5f-665a00369284', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/ecommercelaravel\\/public\\/product-detail\\/venti\",\"fas\":\"fa-star\"}', '2024-05-19 01:57:05', '2024-05-15 12:55:00', '2024-05-19 01:57:05'),
('1ecab4dd-17db-4e4d-8e4a-952689e57e21', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/ecommercelaravel\\/public\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', '2024-05-15 00:05:59', '2024-05-15 00:02:50', '2024-05-15 00:05:59'),
('40c8ecd2-87bb-4494-b232-1b9d4a477f70', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/ecommerlaravel\\/public\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', '2024-05-19 02:16:28', '2024-05-19 02:02:18', '2024-05-19 02:16:28'),
('5232ec6a-b856-4e78-8170-c03657b6574b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/ecommercelaravel\\/public\\/blog-detail\\/interesting-things-about-wibu-anime-that-not-everyone-knows\",\"fas\":\"fas fa-comment\"}', '2024-05-20 00:49:03', '2024-05-20 00:48:47', '2024-05-20 00:49:03'),
('57b6ff0b-fb9a-449f-9cfa-d3852d36b065', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/ecommerlaravel\\/public\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2024-05-19 01:56:55', '2024-05-19 01:56:41', '2024-05-19 01:56:55'),
('a942d6e0-8c93-410b-a3ed-edc7b7fa2c03', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/ecommerlaravel\\/public\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', '2024-05-19 09:42:46', '2024-05-19 02:01:30', '2024-05-19 09:42:46'),
('ad16376f-7e19-4472-88ec-ea641d28dc5b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/ecommerlaravel\\/public\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', '2024-05-19 09:42:50', '2024-05-19 02:00:39', '2024-05-19 09:42:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` enum('cod','paypal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(2, 'ORD-A2A9FBK8H3', 1, 4795.20, NULL, NULL, 4795.20, 6, 'cod', 'unpaid', 'new', 'Nguyễn', 'Văn', 'Van080703@gmail.com', '0967078760', 'VN', '154000', 'Hà Nội', 'Sơn Tây', '2024-05-19 01:56:41', '2024-05-19 01:56:41'),
(3, 'ORD-FVVHQOFTCP', 1, 2397.60, NULL, 159.84, 2237.76, 3, 'cod', 'unpaid', 'process', 'Nguyễn', 'Văn', 'Van080703@gmail.com', '0967078760', 'VN', '154000', 'Hà Nội', 'Sơn Tây', '2024-05-19 02:00:39', '2024-05-19 09:53:13'),
(4, 'ORD-UTRXMOEZVY', 1, 1172.30, NULL, NULL, 1172.30, 1, 'cod', 'unpaid', 'delivered', 'Nguyễn', 'Văn', 'Van080703@gmail.com', '0967078760', 'VN', '154000', 'Hà Nội', 'Sơn Tây', '2024-05-19 02:01:30', '2024-05-19 09:53:19'),
(5, 'ORD-DNM8TJVEPP', 2, 769.23, NULL, NULL, 769.23, 1, 'cod', 'unpaid', 'cancel', 'Nguyễn', 'Văn', 'Van080703@gmail.com', '0967078760', 'VN', '154000', 'Hà Nội', 'Sơn Tây', '2024-05-19 02:02:18', '2024-05-19 09:53:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Những điều thú vị về Wibu Anime không phải ai cũng biết', 'interesting-things-about-wibu-anime-that-not-everyone-knows', 'Cosplay không còn chỉ là một hoạt động nghệ thuật cá nhân mà còn là một phần của văn hóa hiện đại, thể hiện sự đa dạng và sáng tạo của mọi người trên toàn thế giới.', 'Đối với nhiều người Wibu, đam mê văn hóa Nhật Bản không chỉ dừng lại ở việc xem anime và đọc manga. Họ thường cố gắng tích hợp các yếu tố của văn hóa Nhật Bản vào cuộc sống hàng ngày. Điều này có thể bao gồm việc học tiếng Nhật để hiểu rõ hơn nội dung không dịch, thử món ăn Nhật Bản, hoặc thậm chí mặc đồ truyền thống Nhật Bản như kimono hoặc yukata trong các sự kiện liên quan đến văn hóa Nhật. Văn hóa Wibu đã tạo ra cơ hội kết nối xã hội độc đáo. Các trang web, diễn đàn, và mạng xã hội chuyên về manga và anime đã thu hút hàng triệu người hâm mộ từ khắp nơi trên thế giới. Những nền tảng này cho phép người hâm mộ trò chuyện, chia sẻ đam mê, và thậm chí hợp tác trong các dự án sáng tạo liên quan đến văn hóa Nhật Bản.\r\n\r\nNgoài ra, Cosplay (từ viết tắt của “costume play”) là một phần quan trọng của văn hóa Wibu. Người hâm mộ thường tự tạo hoặc mua các bộ trang phục dựa trên nhân vật yêu thích từ anime, manga, hoặc video game và sau đó tham gia vào các sự kiện cosplay. Điều này đòi hỏi sự sáng tạo và nó là cách thú vị để thể hiện tình yêu đối với những nhân vật ưa thích. Cosplay không chỉ giới hạn trong việc mặc trang phục, mà còn trở thành một hình thức biểu diễn nghệ thuật đầy sáng tạo. Cosplayer không chỉ đơn giản là “hóa thân” thành nhân vật mình yêu thích, mà họ còn cố gắng tái hiện mọi chi tiết từ trang phục cho đến cử chỉ và biểu cảm của nhân vật.\r\n\r\nLịch sử phát triển của lễ hội cosplay đã từng bước lan rộng từ Nhật Bản ra thế giới. Sự phổ biến của anime và manga Nhật Bản đã góp phần thúc đẩy sự lan tỏa của Cosplay đến các quốc gia khác. Những bức ảnh và bài viết về Cosplay xuất hiện trên các trang web và tạp chí quốc tế, thu hút sự quan tâm của các người hâm mộ trên khắp thế giới. Cosplay không còn chỉ là một hoạt động nghệ thuật cá nhân mà còn là một phần của văn hóa hiện đại, thể hiện sự đa dạng và sáng tạo của mọi người trên toàn thế giới.\r\n\r\nNgày nay, bạn có thể thấy cosplayer tham gia vào các sự kiện lớn như Comic-Con, Anime Expo, và nhiều sự kiện khác trên toàn thế giới. Việc này thể hiện sự phổ biến và tiềm năng phát triển của Cosplay. Đồng thời, Cosplay đã có ảnh hưởng lớn đến công nghiệp giải trí. Nhiều bộ phim, truyện tranh và video game được yêu thích hơn nhờ sự xuất hiện của cosplayer thực hiện các vai diễn từ các tác phẩm này. Điều này đã tạo ra một sự tương tác độc đáo giữa người hâm mộ và các nhân vật ưa thích của họ.', 'Những điều thú vị về  Wjbu', 'https://yaemiko.click/wp-content/uploads/2024/04/image-7.png', '', 1, NULL, 1, 'active', '2024-05-15 13:17:06', '2024-05-15 13:19:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wjbu', 'wjbu', 'active', '2024-05-15 13:15:37', '2024-05-15 13:15:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Hay', 'active', NULL, NULL, '2024-05-20 00:48:47', '2024-05-20 00:48:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL DEFAULT '1',
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Scara', 'rozo', 'Trang phục cosplay này dựa trên nhân vật Scara trong Genshin Impact. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Genshin Impact\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/scara.jpg', 90, 'L,2XL', 'default', 'active', 999.00, 23.00, 1, 5, NULL, 1, '2024-05-15 00:00:00', '2024-05-19 09:57:11'),
(2, 'Luffy', 'luffy', 'Trang phục cosplay này dựa trên nhân vật Luffy trong One Piece. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: One piece\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/luffy.webp', 199, 'S,M,L,XL,2XL', 'default', 'active', 1990.00, 9.00, 1, 1, NULL, 1, '2024-05-15 12:38:02', '2024-05-15 13:09:12'),
(3, 'Law', 'law', 'Trang phục cosplay này dựa trên nhân vật Law trong One Piece. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: One piece\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/law.webp', 199, 'S,M,L,XL,2XL', 'default', 'active', 1990.00, 9.00, 1, 1, NULL, 1, '2024-05-15 12:39:32', '2024-05-15 13:08:57'),
(4, 'Rozo', 'rozo-2405155211-139', 'Trang phục cosplay này dựa trên nhân vật Rozo trong One Piece. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: One piece\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/310CeiJvB7L._SY500_.jpg', 11, 'S,M,L,XL,2XL', 'default', 'active', 1234.00, 5.00, 1, 1, NULL, 1, '2024-05-15 12:52:11', '2024-05-15 12:52:11'),
(5, 'Venti', 'venti', 'Trang phục cosplay này dựa trên nhân vật Venti  trong Genshin Impact. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Genshin Impact\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/venti-1.jpg', 113, 'S,M,L,XL,2XL', 'default', 'active', 1234.00, 5.00, 1, 5, NULL, 1, '2024-05-15 12:53:18', '2024-05-19 09:57:24'),
(6, 'Naruto', 'naruto', 'Trang phục cosplay này dựa trên nhân vật Naruto trong Naruto. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Naruto\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41y3bfPwZL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'new', 'active', 999.00, 20.00, 1, 3, NULL, 1, '2024-05-15 13:03:47', '2024-05-15 13:03:47'),
(7, 'Madara', 'madara', 'Trang phục cosplay này dựa trên nhân vật Madara trong Naruto. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Naruto\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/31BSmC4qrqL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'new', 'active', 999.00, 20.00, 1, 3, NULL, 1, '2024-05-15 13:04:25', '2024-05-15 13:04:25'),
(8, 'Tsunade', 'tsunade', 'Trang phục cosplay này dựa trên nhân vật Tsunade trong Naruto. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Naruto\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/31E1yxlVmXL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'new', 'active', 999.00, 20.00, 1, 3, NULL, 1, '2024-05-15 13:05:04', '2024-05-15 13:05:04'),
(9, 'Zenitsu', 'zenitsu', 'Trang phục cosplay này dựa trên nhân vật Zenitsu trong Kimetsu no Yaiba. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Kimetsu no Yaiba\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41QAY57bp7L._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'new', 'active', 999.00, 20.00, 1, 4, NULL, 1, '2024-05-15 13:06:19', '2024-05-15 13:06:19'),
(10, 'Nezuko', 'nezuko', 'Trang phục cosplay này dựa trên nhân vật Nezuko trong Kimetsu no Yaiba. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Kimetsu no Yaiba\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41I7vw1RizL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'hot', 'active', 999.00, 20.00, 1, 4, NULL, 1, '2024-05-15 13:06:52', '2024-05-20 00:59:01'),
(11, 'Nezuko', 'nezuko-2405200025-528', 'Trang phục cosplay này dựa trên nhân vật Nezuko trong Kimetsu no Yaiba. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Kimetsu no Yaiba\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41I7vw1RizL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'hot', 'active', 999.00, 20.00, 1, 4, NULL, 1, '2024-05-20 01:00:25', '2024-05-20 01:00:25'),
(12, 'Nezuko', 'nezuko-2405200029-359', 'Trang phục cosplay này dựa trên nhân vật Nezuko trong Kimetsu no Yaiba. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Kimetsu no Yaiba\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41I7vw1RizL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'hot', 'active', 999.00, 20.00, 1, 4, NULL, 1, '2024-05-20 01:00:29', '2024-05-20 01:00:29'),
(13, 'Nezuko', 'nezuko-2405200031-233', 'Trang phục cosplay này dựa trên nhân vật Nezuko trong Kimetsu no Yaiba. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Kimetsu no Yaiba\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41I7vw1RizL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'hot', 'active', 999.00, 20.00, 1, 4, NULL, 1, '2024-05-20 01:00:31', '2024-05-20 01:00:31'),
(14, 'Nezuko', 'nezuko-2405200052-708', 'Trang phục cosplay này dựa trên nhân vật Nezuko trong Kimetsu no Yaiba. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Kimetsu no Yaiba\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41I7vw1RizL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'hot', 'active', 999.00, 20.00, 1, 4, NULL, 1, '2024-05-20 01:00:52', '2024-05-20 01:00:52'),
(15, 'Nezuko', 'nezuko-2405200054-224', 'Trang phục cosplay này dựa trên nhân vật Nezuko trong Kimetsu no Yaiba. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Kimetsu no Yaiba\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41I7vw1RizL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'hot', 'active', 999.00, 20.00, 1, 4, NULL, 1, '2024-05-20 01:00:54', '2024-05-20 01:00:54'),
(16, 'Nezuko', 'nezuko-2405200119-848', 'Trang phục cosplay này dựa trên nhân vật Nezuko trong Kimetsu no Yaiba. Nó có thể được sử dụng trong các hội nghị cosplay và tiệc Halloween.', 'Nguồn: Kimetsu no Yaiba\r\n\r\nNhân vật: Zoro\r\n\r\nBao gồm: Quần, Áo , Áo Choàng, Thắt Lưng, Bông Tai\r\n\r\nChất liệu: polyester.\r\n\r\nHướng dẫn bảo quản: Giặt tay bằng nước lạnh, phơi khô, không dùng thuốc tẩy\r\n\r\nKích thước: Kích thước châu Á, bảng kích thước có thể có sai số 1-3 cm do phương pháp đo.', 'https://yaemiko.click/wp-content/uploads/2024/04/41I7vw1RizL._SY500_.jpg', 199, 'S,M,L,XL,2XL', 'hot', 'active', 999.00, 20.00, 0, 4, NULL, 1, '2024-05-20 01:01:19', '2024-05-20 01:01:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 5, 'ok', 'active', '2024-05-15 12:54:59', '2024-05-15 12:54:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'My Name Anh Van', 'Muốn hỏi gì không', 'https://yaemiko.click/wp-content/uploads/2024/04/cropped-logo-1.jpg', 'https://i.pinimg.com/236x/ee/87/d8/ee87d8be406a16e8649217baa79505c2.jpg', '1 P.Trung Hòa, Trung Hoà, Cầu Giấy, Hà Nội, Việt Nam', '0967078760', 'yaemiko@gmail.com', NULL, '2024-05-19 09:42:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giao Hàng Tiết kiệm', '12.00', 'active', '2024-05-19 15:07:25', '2024-05-19 15:07:25'),
(2, 'Giao Hàng Nhanh', '15.00', 'active', '2024-05-19 15:07:32', '2024-05-19 15:07:32'),
(3, 'Hoả Tốc', '25.00', 'active', '2024-05-19 15:07:37', '2024-05-19 15:07:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Anh Van', 'admin@mail.com', NULL, '$2y$10$PxKndFWhp9xG1R10Dud8G.Mf9UqngT5HH3UvsUOh/KT0EQRGQFLse', 'https://i.pinimg.com/564x/93/94/74/9394748d58e086d83ab1f55abaaff5c9.jpg', 'admin', NULL, NULL, 'active', NULL, NULL, '2024-05-14 15:52:34'),
(2, 'Customer A', 'customer@mail.com', NULL, '$2y$10$iWDqIulnajN36PGUKBf61uuZLY7USZZohHmzRecsXt960n9fR2DSy', NULL, 'user', NULL, NULL, 'active', NULL, NULL, NULL),
(3, 'Customer', 'customer2@mail.com', NULL, '$2y$10$lGYpa8KG1icunxYkQ4Gtk.RTCFr43JrdKPGXoSMhpO0znDmm6cmPK', 'https://i.pinimg.com/564x/93/94/74/9394748d58e086d83ab1f55abaaff5c9.jpg', 'user', NULL, NULL, 'inactive', NULL, '2024-05-14 23:51:55', '2024-05-19 09:53:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 1, 769.23, 1, 769.23, '2024-05-15 00:00:56', '2024-05-19 01:59:50');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
