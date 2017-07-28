-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17-0ubuntu0.16.04.2 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for csm
DROP DATABASE IF EXISTS `csm`;
CREATE DATABASE IF NOT EXISTS `csm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `csm`;

-- Dumping structure for table csm.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(2, NULL, 1, 'Category 2', 'category-2', '2017-07-15 13:05:34', '2017-07-15 13:05:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table csm.data_rows
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.data_rows: ~64 rows (approximately)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(3, 1, 'category_id', 'text', 'Category', 0, 0, 1, 1, 1, 0, NULL, 3),
	(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(5, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true}}', 8),
	(9, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, NULL, 12),
	(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, NULL, 13),
	(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
	(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
	(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
	(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
	(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
	(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"}}', 6),
	(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
	(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
	(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '', 10),
	(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '', 11),
	(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '', 12),
	(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
	(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
	(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, '', 3),
	(29, 3, 'password', 'password', 'password', 1, 0, 0, 1, 1, 0, '', 4),
	(30, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '', 5),
	(31, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 6),
	(32, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
	(33, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '', 8),
	(34, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
	(35, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
	(36, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
	(37, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
	(38, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
	(39, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(40, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(41, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 4),
	(42, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '', 5),
	(43, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, '', 6),
	(44, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
	(45, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
	(46, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
	(47, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
	(48, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
	(49, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
	(50, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(51, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(52, 3, 'role_id', 'text', 'role_id', 1, 1, 1, 1, 1, 1, '', 9),
	(53, 7, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
	(54, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(55, 7, 'period', 'text', 'Period', 1, 1, 1, 1, 1, 1, NULL, 3),
	(56, 7, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, NULL, 4),
	(57, 1, 'page_id', 'text', 'Page', 0, 1, 1, 1, 1, 0, NULL, 16),
	(65, 11, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
	(66, 11, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, NULL, 2),
	(67, 11, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, NULL, 3),
	(68, 11, 'file', 'file', 'File', 0, 1, 1, 1, 1, 1, NULL, 4),
	(69, 11, 'page_id', 'select_dropdown', 'Page', 0, 1, 1, 1, 1, 1, '{"relationship":{"key":"id","label":"title"}}', 5),
	(70, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
	(71, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table csm.data_types
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.data_types: ~7 rows (approximately)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
	(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', NULL, NULL, 1, 0, '2017-07-15 13:05:33', '2017-07-22 17:33:10'),
	(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', '', '', 1, 0, '2017-07-15 13:05:33', '2017-07-15 13:05:33'),
	(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', '', '', 1, 0, '2017-07-15 13:05:33', '2017-07-15 13:05:33'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', '', '', 1, 0, '2017-07-15 13:05:33', '2017-07-15 13:05:33'),
	(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', '', '', 1, 0, '2017-07-15 13:05:33', '2017-07-15 13:05:33'),
	(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', '', '', 1, 0, '2017-07-15 13:05:33', '2017-07-15 13:05:33'),
	(7, 'gallery', 'gallery', 'Gallery', 'Galleries', 'voyager-images', 'App\\Gallery', NULL, NULL, 1, 0, '2017-07-15 21:53:16', '2017-07-15 21:53:16'),
	(11, 'files', 'files', 'File', 'Files', 'voyager-file-text', 'App\\File', NULL, NULL, 1, 0, '2017-07-23 07:55:43', '2017-07-23 07:55:43');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table csm.files
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table csm.files: ~52 rows (approximately)
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`id`, `title`, `description`, `file`, `page_id`, `created_at`, `updated_at`) VALUES
	(1, 'Maison du Barreau - Paris', 'Chère Mme le Bâtonnier de l’Ordre des avocats de Paris (Me Christiane Féral-Schuhl)', 'files/July2017/z05yDKtJyDUFgcfVCYXg.doc', 15, '2017-07-23 08:07:38', '2017-07-23 08:07:38'),
	(2, 'Capacity Building of the Lebanese Judiciary', 'Au cœur de cette assemblée cosmopolite riche par ses cultures et ses langues diverses arabophone, francophone, anglo-saxonne, italophone et hispanophone', 'files/July2017/ZGMbLAnIiddFHdWQfVbB.doc', 15, '2017-07-23 08:21:36', '2017-07-23 08:21:36'),
	(3, 'مدرسة سيدة اللويزة', 'بِالتَّهْليلِ والتَّرنيمِ قَصَدْتُ أَنْ أَسْتَهِلَّ كَلِمَتي لِأَنَّني أُلْقيها في مَدْرَستي، في بَيْتِيَ الثّاني، حيثُ اختَبَرْتُ الْمَحبّةَ وَتجذّرتُ في الرَّجاءِ وَنَما فِيَّ الإيمانُ وَأَثْمَر', 'files/July2017/06onRoeZUhFrPcF8GmFE.doc', 15, '2017-07-23 08:23:39', '2017-07-23 08:23:39'),
	(4, 'مكننة المحاكم بيت المحامي', 'إنني، في المستهّل، أتقدّم بإسم زملائي في المجلس، وبإسمي الشخصي، بالشكر لمعالي وزير التنمية الإدارية الاستاذ محمد فنيش ومعالي وزير العدل النقيب شكيب قرطباوي وممثلة الاتحاد الأوروبي في لبنان السيدة أنجيلينا إيخورست على حضورهم اليوم', 'files/July2017/ynssnM1zBlYURqdJCo5H.doc', 15, '2017-07-23 08:25:24', '2017-07-23 08:25:24'),
	(5, 'Cour de Cassation du Liban', 'Allocution d’ouverture de Monsieur Jean FAHED\r\nPremier président de la Cour de cassation du Liban\r\nCongrès de l’AHJUCAF', 'files/July2017/C4As24f9nzy8qYL8hPsu.doc', 15, '2017-07-23 08:27:08', '2017-07-23 08:27:08'),
	(6, 'البوابة الالكترونية', 'تتمثّلُ السِمة الأساس لعصرنا الحاضر في الثورة المعلوماتية، التي أزالت، إفتراضياً، الحدود والعوائق بين الدول والمجتمعات والمؤسسات كافة', 'files/July2017/5bWR21khg096byCv5ZCd.doc', 15, '2017-07-23 08:27:57', '2017-07-23 08:27:57'),
	(7, 'كلمة يوم المحامي طرابلس', 'بِقلبٍ مُفعَمٍ بالغِبْطَةِ أَقِفُ أمامَكم في هذه المناسبةِ الجليلةِ ،العزيزةِ على القلبِ، المتمثّلةِ في يومِ المحامي في لبنانَ،  مُرَحِّبًا بكم في دارِ العدلِ هذه، مخاطِباً إيّاكُم بلسانِ المُضيفِ صاحبِ الدارِ والمناسبةِ لا بلسانِ الضَّيْفِ', 'files/July2017/91jYjpd0ipE3qTvZlQjj.doc', 15, '2017-07-23 08:29:41', '2017-07-23 08:29:41'),
	(8, 'كلمة الرئيس فهد في يوبيل المعهد', 'بِاسْمِ السلطةِ القضائيةِ في لبنان، وبقلبٍ مُفعَمٍ بالغِبْطَةِ والعزْمِ والأمل، أَقِفُ أمامَكم في غُرَّةِ هذا العامِ القضائي الجديد، المُصادفِ مرورَ خمسين عاماً على نَشْأةِ معهد الدروس القضائية، مُرَحِّباً بكم يا رأسَ البلادِ وقاضِيَها الأوَّل ورُبَّانَها الى بَرِّ الأمانِ بإذنِ اللهِ', 'files/July2017/L3AccV084NWbvUhktY6i.doc', 15, '2017-07-23 08:30:50', '2017-07-23 08:30:50'),
	(9, 'حوار القضاة كلية الحقوق الكسليك', 'في بداية الكلامِ، يطيبُ لي، من رَحَباتِ هذا المِنبر الحُرّ، أن أُحيّي جامعة الروح القدس عبر رئيسها الأب هادي محفوظ، وأن أبارك لها بالعيد الخامس والعشرين لكلية الحقوق', 'files/July2017/nlNX7zlBYlyx2XphGtOL.doc', 15, '2017-07-23 08:31:00', '2017-07-23 08:32:15'),
	(10, 'وضع حجر الأساس قصر العدل عاليه', 'سأل الاسكندر أرسطو الفيلسوف أَيُّهما أَحوجُ لِلمَلِك: الشجاعةُ أمِ العدل؟ فأَجاب ارسطو : "إذا عَدَلَ الملكُ لا يحتاجُ إلى الشجاعة"، من هنا القولُ المأثور : "العدلُ أساسُ الْمُلْك".', 'files/July2017/8BjOBK1Q5x9dS6hLiVAD.doc', 15, '2017-07-23 08:33:48', '2017-07-23 08:33:48'),
	(11, 'القضاء دعوتنا وقضيتنا', 'منذ مطلع صباي شدّني التّوْقُ إلى المطلق، وإلى المُثُلِ العليا السّامية، وهو تَوْقٌ إذا ما تيسّر لليافع دفعه إلى التّفاني في العمل من أجل مجتمع يقترب من تلك المثل العليا ويحقّق المرتجى', 'files/July2017/Y8ecoBJijGd9zxMClOeG.doc', 15, '2017-07-23 08:34:36', '2017-07-23 08:34:36'),
	(12, 'قسم القضاة', 'أيها القضاةُ الأصيلون،\r\nتبدأون اليوم مسيرةً جديدةً في حياتكم.\r\nتبدأونها بقسمٍ يتجاوزُ حدود اللحظةِ الراهنةِ والشكلياتِ الإجرائية، فيمتد إلى أعمقِ وجدانِكم ويرسم لكم خطاً في الإمتهان والرسالة، وصراطاً مستقيماً في السلوك، قسمٌ لا يقتصرُ على عملكم المهني، بل يشملُ جميع جوانب حياتكم ليدخلَ إلى السيرة والسريرة والحياة الإجتماعية.', 'files/July2017/l8NQ1ifG9uINVG4pqgWX.doc', 15, '2017-07-23 08:35:51', '2017-07-23 08:35:51'),
	(13, 'حلف يمين القضاة الأصيلين', 'إنَّ مَن وُلِّي رُتبةَ القضاء فقد وُلِّي شرفًا عظيمًا لا يرقى إِليه أيُّ شرف، وحُمّل حِمْلًا جسيماً لا يُوازيه أيُّ حِمْل', 'files/July2017/Yb0OMvbsGqLjunapaGAw.doc', 15, '2017-07-23 08:37:01', '2017-07-23 08:37:01'),
	(14, 'رقابة محكمة الاستئناف على القرار التحكيمي', 'ان القانون اللبناني، في معرض مقاربته لموضوع الرقابة القضائية على القرار التحكيمـي أجاز سلوك سبيل الاستئناف الى جانب الطعن عن طريق البطلان. ولكن الاستنئاف بقي محصوراً في نطاق التحكيم الداخلي، وغالباً ما يستبعده الاطراف، مما جعل الطعن عن طريق البطلان الوسيلة الطبيعية للتظلّم من العمل التحكيمي', 'files/July2017/Qs2ckwkcAgbBHL6U939T.doc', 15, '2017-07-23 08:37:55', '2017-07-23 08:37:55'),
	(15, 'كلمة في وداع القاضي المرحوم نصري لحّود', 'عصيٌّ عليَّ في هذه اللحظاتِ العَجْلَى والثَكلى أن أَنْقُلَ كلَّ ما في البالِ من خواطرَ وما في العقلِ من حقائق.\r\nكُنتَ الطبيعةَ الطاهرةَ والطبعَ الّذي تقرأُه في العينين قبل أن ينطِقَ اللسان.\r\nكُنتَ العاطفةَ العاصفةَ الجاريةَ التي تشبِهُ من البحرِ جَذْرَهُ ومدَّهُ ومن السيف غِمدَهُ وحدَّهْ', 'files/July2017/egV07ZQP50cxy8TULqUE.doc', 15, '2017-07-23 08:38:53', '2017-07-23 08:38:53'),
	(16, 'الأمن القضائي اللبناني بين التشريع والاجتهاد', 'بدأ مفهوم الأمن القضائي، يكتسب أهمية متزايدة في السنوات العشر الأخيرة خصوصاً في البلدان الاوروبية المنضوية ضمن الاتحاد الأوروبي بعد أن تظّهر أن اجتهاد المحكمة الأوروبية لحقوق الإنسان ومحكمة العدل الأوروبية يدفع باتجاه عدم إصدار قوانين رجعية من حيث الزمان أو تفسيرية كما يعرض للآثار السلبية لأي تغيير في الاجتهاد على استقرار التعامل بين المواطنين', 'files/July2017/gDiJIoIyzUhxZgXtvKYE.docx', 15, '2017-07-23 08:39:50', '2017-07-23 08:39:50'),
	(17, 'دور حكم القانون في التنمية الاقتصادية', 'لكل زمان علمُه الخاص تماماً كلغته الخاصة، فكما كانت اللغة اللاتينية وعلوم الفلسفة والفيزياء والكيمياء تشكِّلُ اساس العلوم في زمنٍ مضى، أصبحت الانكليزية وعلومُ الاقتصاد والتكنولوجيا والمعلوماتية الإدارية، ركائزَ هذا الزمن', 'files/July2017/1uJRluI3OVarncE9FKM7.docx', 15, '2017-07-23 08:41:26', '2017-07-23 08:41:26'),
	(18, 'l\'éthique et la magistrature', 'La justice, sous des noms divers, gouverne le monde, nature et humanité, science et conscience, logique et morale, économie politique, politique, histoire, littérature et art', 'files/July2017/YsfhkeKxICBEJ7CPtf3Y.doc', 15, '2017-07-23 08:42:32', '2017-07-23 08:42:32'),
	(19, 'Signature du protocole avec l\'Italie', 'Signature du protocole avec l\'Italie', 'files/July2017/dQkSDArkrGkGrvBg9jej.pdf', 15, '2017-07-23 09:28:07', '2017-07-23 09:28:07'),
	(20, 'تكريم الرئيس سامي منصور', 'تكريم الرئيس سامي منصور', 'files/July2017/IM3xcYa4d5Z4pIuH9bBe.pdf', 15, '2017-07-23 09:28:46', '2017-07-23 09:28:46'),
	(21, 'بيان رقم 1 - عناصر الحماية', NULL, 'files/July2017/o166AElkonL0SkvIRMr1.doc', 16, '2017-07-23 12:46:59', '2017-07-23 12:46:59'),
	(22, 'البيان رقم 2 - جلسة المجلس العدلي', NULL, 'files/July2017/sQJ2T3VnV0mBdxukP633.doc', 16, '2017-07-23 12:47:56', '2017-07-23 12:47:56'),
	(23, 'البيان رقم 3 - تنفيذ حكم شرعي', NULL, 'files/July2017/ciYIWydWxwvXV3nxyYAQ.doc', 16, '2017-07-23 17:24:35', '2017-07-23 17:24:35'),
	(24, 'البيان رقم 8 - عراك قضائي', NULL, 'files/July2017/DIhToa9G4ntHF9LnoqdQ.doc', 16, '2017-07-23 17:25:07', '2017-07-23 17:25:07'),
	(25, 'البيان رقم 9 - تشويش على القضاء', NULL, 'files/July2017/oa1GhnhAFGybN1pJoqMV.doc', 16, '2017-07-23 17:25:35', '2017-07-23 17:25:35'),
	(26, 'البيان رقم 12 - حادثة المشرفية', NULL, 'files/July2017/nwpMSdFAOwuZDIlN6l4Y.doc', 16, '2017-07-23 17:26:00', '2017-07-23 17:32:10'),
	(27, 'البيان رقم 14 - باريس إتفاقية التوأمة', NULL, 'files/July2017/WFbRgBvSot0HNLYLjZPs.doc', 16, '2017-07-23 17:26:23', '2017-07-23 17:26:23'),
	(28, 'البيان رقم 13 - التعرض للقضاة', NULL, 'files/July2017/uEKQIV1UbPLOgrE3cdM8.doc', 15, '2017-07-23 17:27:08', '2017-07-23 17:27:08'),
	(29, 'البيان رقم 13 - التعرض للقضاة', NULL, 'files/July2017/Hxfqm1VMMBI6jWyjf6Vg.doc', 16, '2017-07-23 17:27:10', '2017-07-23 17:27:10'),
	(30, 'البيان رقم 15 - زيارة قصر عدل بعبدا', NULL, 'files/July2017/SgEEYEO9fIQYMuPPzQbb.doc', 16, '2017-07-23 17:27:43', '2017-07-23 17:27:43'),
	(31, 'البيان رقم 16 - المكتب الإعلامي', NULL, 'files/July2017/gfYiO6injWjdr3H6RPj8.doc', 16, '2017-07-23 17:28:01', '2017-07-23 17:28:01'),
	(32, 'البيان رقم 17 - صيادو الدالية و مبدأ العلانية', NULL, 'files/July2017/rnnVfFx4l8Ie9qAt8wp4.doc', 16, '2017-07-23 17:28:32', '2017-07-23 17:28:32'),
	(33, 'البيان رقم 18 - حداداً على شهداء بئر حسن', NULL, 'files/July2017/Qs5ornuIuGk5fzlgbKV2.doc', 16, '2017-07-23 17:28:56', '2017-07-23 17:28:56'),
	(34, 'البيان رقم 19 - زيارة قصر عدل زحلة', NULL, 'files/July2017/Y9MUlB7Is9krO9jAsZov.doc', 16, '2017-07-23 17:29:17', '2017-07-23 17:29:17'),
	(35, 'البيان رقم 20 - زيارة قائد الجيش للرئيس الأول', NULL, 'files/July2017/W1yKWPebSXaKrOEI8rGe.doc', 16, '2017-07-23 17:29:55', '2017-07-23 17:29:55'),
	(36, 'البيان رقم 21 - نهر البارد', NULL, 'files/July2017/vxDw57paJnsuk1naNJdd.doc', 16, '2017-07-23 17:30:13', '2017-07-23 17:30:13'),
	(37, 'البيان رقم 22 - نهر البارد', NULL, 'files/July2017/wBHIfWO5Fb6GBOvqOhj4.doc', 16, '2017-07-23 17:30:27', '2017-07-23 17:30:27'),
	(38, 'البيان رقم 23 - مؤتمر دبي', NULL, 'files/July2017/C8o17vhNiAZpxfSG2IrD.doc', 16, '2017-07-23 17:30:49', '2017-07-23 17:30:49'),
	(39, 'البيان رقم 24 - الميلاد و رأس السنة', NULL, 'files/July2017/XdvxNbYbscqrMXmquBb1.doc', 16, '2017-07-23 17:31:00', '2017-07-23 17:34:12'),
	(40, 'بيان رقم 1 - قسم يمين القضاة', NULL, 'files/July2017/ClpOyPCK65khNoTS9tbK.doc', 16, '2017-07-23 17:43:00', '2017-07-23 17:44:43'),
	(41, 'بيان رقم 2 - زيارة مدير عام وزارة الزراعة', NULL, 'files/July2017/PlEC7jN3w2iVAZtenReh.doc', 16, '2017-07-23 17:43:00', '2017-07-23 17:45:02'),
	(42, 'بيان رقم 4 - قضية البازي', NULL, 'files/July2017/ucayDOpQtI7JUlh3z5PH.doc', 16, '2017-07-23 17:45:23', '2017-07-23 17:45:23'),
	(43, 'بيان رقم 4 - ملحق', NULL, 'files/July2017/A3hlSwl49cmHk7RfNQmx.doc', 16, '2017-07-23 17:45:36', '2017-07-23 17:45:36'),
	(44, 'بيان رقم 5 - المناقلات القضائية', NULL, 'files/July2017/OBGI5yIweRKIfyKtAegH.doc', 16, '2017-07-23 17:46:36', '2017-07-23 17:46:36'),
	(45, 'بيان رقم 7 - قضية المرحومة رلى يعقوب', NULL, 'files/July2017/WcjUK6Trto5pivGW4cod.doc', 16, '2017-07-23 17:46:56', '2017-07-23 17:46:56'),
	(46, 'بيان رقم 6 - المقبولين للتعيين بصفة قاضي متدرج', NULL, 'files/July2017/WZV6n9ULXEuhvLLGJqmU.doc', 16, '2017-07-23 17:47:30', '2017-07-23 17:47:30'),
	(47, 'بيان رقم 3 - ملفات قضية نهر البارد', NULL, 'files/July2017/ilEN92ra4kC61DWOPgSG.doc', 16, '2017-07-23 17:47:44', '2017-07-23 17:47:44'),
	(48, 'بيان رقم 9 - وفاة المرحوم نصري لحود', NULL, 'files/July2017/zlWWiDPiWKIvHwMnNobb.doc', 16, '2017-07-23 17:48:10', '2017-07-23 17:48:10'),
	(49, 'بيان رقم 8 - إدانة إثنين من فتح الإسلام', NULL, 'files/July2017/zlB4LqBuS6Hsjke5hUFz.doc', 16, '2017-07-23 17:48:30', '2017-07-23 17:48:30'),
	(50, 'زيارة الشكر لمعالي وزير العدل النقيب شكيب قرطباوي', NULL, 'files/July2017/HHZTGsDVNN01GmUiXx0x.doc', 16, '2017-07-23 17:48:54', '2017-07-23 17:48:54'),
	(51, 'بيان بحكم تهريب اشخاص صادر عن المجلس العدلي', NULL, 'files/July2017/K1QRlgsLlChJ07NYzkWm.docx', 16, '2017-07-23 17:49:12', '2017-07-23 17:49:12'),
	(52, 'بيان عن حكمين صادرين عن فتح الإسلام', NULL, 'files/July2017/bnS9aGxqlH4NuwIduTsB.doc', 16, '2017-07-23 17:49:43', '2017-07-23 17:49:43'),
	(53, 'بيان بزيارة وزير العدل', NULL, 'files/July2017/NudGPqnY42090pTffVbX.doc', 16, '2017-07-23 17:50:00', '2017-07-23 17:50:00');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

-- Dumping structure for table csm.galleries
DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `period` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table csm.galleries: ~17 rows (approximately)
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` (`id`, `name`, `period`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'الرئيس غالب غانم', '2008-2011', 'gallery/July2017/D6rAFBAlwKPLDtlXdHCA.jpg', '2017-07-15 22:00:10', '2017-07-15 22:00:10'),
	(2, 'الرئيس أنطوان خير', '2005-2008', 'gallery/July2017/XLLc6xn5sici9RrYRcXE.jpg', '2017-07-15 22:00:32', '2017-07-15 22:00:32'),
	(3, 'الرئيس طانيوس الخوري', '2002-2005', 'gallery/July2017/9P2HC2yLfQEA1iAtCORU.jpg', '2017-07-15 22:00:52', '2017-07-15 22:00:52'),
	(4, 'الرئيس نصري لحود', '2002', 'gallery/July2017/QoJunQiwXQM2mGSdxFH3.jpg', '2017-07-15 22:01:11', '2017-07-15 22:01:11'),
	(5, 'الرئيس منير حنين', '1997-2002', 'gallery/July2017/gP1RaWS9cxYFcvBujCc1.jpg', '2017-07-15 22:01:32', '2017-07-15 22:01:32'),
	(6, 'الرئيس فيليب خيرالله', '1992-1997', 'gallery/July2017/icOiWqdXkM04dPxuWHgU.jpg', '2017-07-15 22:01:48', '2017-07-15 22:01:48'),
	(7, 'الرئيس عاطف النقيب', '1990-1992', 'gallery/July2017/KpMYuChuEMUo8KnchDMl.jpg', '2017-07-15 22:02:04', '2017-07-15 22:02:04'),
	(8, 'الرئيس أمين نصار', '1983-1990', 'gallery/July2017/11a5qb5J4jq6PQmmaX9T.jpg', '2017-07-15 22:02:19', '2017-07-15 22:02:19'),
	(9, 'الرئيس يوسف جبران', '1979-1983', 'gallery/July2017/aaZX5PFQEclwAuExBf6w.jpg', '2017-07-15 22:02:40', '2017-07-15 22:02:40'),
	(10, 'الرئيس أميل ابو خير', '1968-1978', 'gallery/July2017/2QUR20uP7Ty43Oqd6Aws.jpg', '2017-07-15 22:03:06', '2017-07-15 22:03:06'),
	(11, 'الرئيس البير فرحات', '1967-1968', 'gallery/July2017/mJEPlPSVRTdJbkJye0qa.jpg', '2017-07-15 22:03:24', '2017-07-15 22:03:24'),
	(12, 'الرئيس مسعود حنين', '1966-1967', 'gallery/July2017/nvkLFAcPrcS1RlPcmEG2.jpg', '2017-07-15 22:03:43', '2017-07-15 22:03:43'),
	(13, 'الرئيس بدري المعوشي', '1950-1966', 'gallery/July2017/MDcMd9WthrO4uaAKMho1.jpg', '2017-07-15 22:03:58', '2017-07-15 22:03:58'),
	(14, 'الرئيس أميل تيان', '1948-1949', 'gallery/July2017/aEEhhMNrUBLTU0cgpDCz.jpg', '2017-07-15 22:04:15', '2017-07-15 22:04:15'),
	(15, 'الرئيس ألفرد تابت', '1943-1948', 'gallery/July2017/pxq5CPbLpFmmri3zyMa5.jpg', '2017-07-15 22:04:31', '2017-07-15 22:04:31'),
	(16, 'الرئيس شكري قرداحي', '1943-1932', 'gallery/July2017/CYK3fgamzrmeXCGnjGs2.jpg', '2017-07-15 22:04:47', '2017-07-15 22:04:47'),
	(17, 'الرئيس نجيب ابو صوان', '1919-1932', 'gallery/July2017/D5y5xEXk6rPivEkdoMJb.jpg', '2017-07-15 22:05:04', '2017-07-15 22:05:04');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;

-- Dumping structure for table csm.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.menus: ~2 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2017-07-15 13:05:33', '2017-07-15 13:05:33'),
	(2, 'main', '2017-07-15 15:35:14', '2017-07-15 15:35:14');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table csm.menu_items
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.menu_items: ~34 rows (approximately)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '/admin', '_self', 'voyager-boat', NULL, NULL, 1, '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL, NULL),
	(2, 1, 'Media', '/admin/media', '_self', 'voyager-images', NULL, NULL, 4, '2017-07-15 13:05:33', '2017-07-15 21:54:58', NULL, NULL),
	(3, 1, 'Posts', '/admin/posts', '_self', 'voyager-news', NULL, NULL, 7, '2017-07-15 13:05:33', '2017-07-23 07:43:53', NULL, NULL),
	(4, 1, 'Users', '/admin/users', '_self', 'voyager-person', NULL, NULL, 3, '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL, NULL),
	(5, 1, 'Categories', '/admin/categories', '_self', 'voyager-categories', NULL, NULL, 9, '2017-07-15 13:05:33', '2017-07-23 07:43:46', NULL, NULL),
	(6, 1, 'Pages', '/admin/pages', '_self', 'voyager-file-text', NULL, NULL, 8, '2017-07-15 13:05:33', '2017-07-23 07:43:53', NULL, NULL),
	(7, 1, 'Roles', '/admin/roles', '_self', 'voyager-lock', NULL, NULL, 2, '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL, NULL),
	(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 10, '2017-07-15 13:05:33', '2017-07-23 07:43:46', NULL, NULL),
	(9, 1, 'Menu Builder', '/admin/menus', '_self', 'voyager-list', NULL, 8, 1, '2017-07-15 13:05:33', '2017-07-15 21:54:58', NULL, NULL),
	(10, 1, 'Database', '/admin/database', '_self', 'voyager-data', NULL, 8, 2, '2017-07-15 13:05:33', '2017-07-15 21:54:58', NULL, NULL),
	(11, 1, 'Settings', '/admin/settings', '_self', 'voyager-settings', NULL, NULL, 11, '2017-07-15 13:05:33', '2017-07-23 07:43:46', NULL, NULL),
	(12, 2, 'Supreme Judicial Council', '', '_self', NULL, '#000000', NULL, 1, '2017-07-15 15:36:23', '2017-07-15 15:45:09', NULL, ''),
	(13, 2, 'His authorship', '/his_authorship', '_self', NULL, '#000000', 12, 1, '2017-07-15 15:36:47', '2017-07-15 15:36:50', NULL, ''),
	(14, 2, 'Duties', '/duties', '_self', NULL, '#000000', 12, 2, '2017-07-15 15:36:59', '2017-07-15 15:37:34', NULL, ''),
	(15, 2, 'President', '/president', '_self', NULL, '#000000', 12, 3, '2017-07-15 15:37:09', '2017-07-15 15:37:35', NULL, ''),
	(16, 2, 'vice president', '/vice_president', '_self', NULL, '#000000', 12, 5, '2017-07-15 15:37:18', '2017-07-23 07:22:19', NULL, ''),
	(17, 2, 'Former Presidents', '/former_presidents', '_self', NULL, '#000000', 12, 6, '2017-07-15 15:37:30', '2017-07-23 07:22:17', NULL, ''),
	(18, 2, 'Duties and morals of judges', '', '_self', NULL, '#000000', NULL, 2, '2017-07-15 15:37:53', '2017-07-15 15:45:20', NULL, ''),
	(19, 2, 'Ethics of judges', '/ethics_of_judges', '_self', NULL, '#000000', 18, 1, '2017-07-15 15:38:07', '2017-07-15 15:42:09', NULL, ''),
	(20, 2, 'Make a complaint', '/make_a_complaint', '_self', NULL, '#000000', 18, 2, '2017-07-15 15:38:19', '2017-07-23 07:22:18', NULL, ''),
	(21, 2, 'Disciplinary Board of Judges', '/disciplinary_board_of_judges', '_self', NULL, '#000000', 18, 3, '2017-07-15 15:38:36', '2017-07-23 07:22:18', NULL, ''),
	(22, 2, 'Supreme Authority for Discipline', '/supreme_authority_for_discipline', '_self', NULL, '#000000', 18, 4, '2017-07-15 15:38:56', '2017-07-23 07:22:18', NULL, ''),
	(23, 2, 'information Office', '', '_self', NULL, '#000000', NULL, 3, '2017-07-15 15:39:11', '2017-07-15 15:45:28', NULL, ''),
	(24, 2, 'Media data', '/media_data', '_self', NULL, '#000000', 23, 1, '2017-07-15 15:39:22', '2017-07-15 15:42:19', NULL, ''),
	(25, 2, 'Press interviews', '/press_interviews', '_self', NULL, '#000000', 23, 2, '2017-07-15 15:39:38', '2017-07-15 15:42:20', NULL, ''),
	(26, 2, 'Press articles', '/press_articles', '_self', NULL, '#000000', 23, 3, '2017-07-15 15:39:48', '2017-07-23 07:22:08', NULL, ''),
	(27, 2, 'For judges', '', '_self', NULL, '#000000', NULL, 4, '2017-07-15 15:40:00', '2017-07-15 15:45:35', NULL, ''),
	(28, 2, 'Circulars of the Council', '/circulars_of_the_council', '_self', NULL, '#000000', 27, 1, '2017-07-15 15:40:14', '2017-07-16 00:59:45', NULL, ''),
	(29, 2, 'Decisions of the Council', '/decisions_of_the_council', '_self', NULL, '#000000', 27, 2, '2017-07-15 15:40:28', '2017-07-15 15:43:09', NULL, ''),
	(30, 2, 'Advisory bodies', '/advisory_bodies', '_self', NULL, '#000000', 27, 3, '2017-07-15 15:40:39', '2017-07-23 07:22:04', NULL, ''),
	(31, 2, 'Court statistics', '/court_statistics', '_self', NULL, '#000000', 27, 4, '2017-07-15 15:40:48', '2017-07-23 07:22:04', NULL, ''),
	(32, 2, 'Decree of Judicial Formations', '/decree_of_judicial_formations', '_self', NULL, '#000000', 27, 5, '2017-07-15 15:41:06', '2017-07-23 07:22:05', NULL, ''),
	(33, 2, 'Business distribution decisions', '/business_distribution_decisions', '_self', NULL, '#000000', 27, 6, '2017-07-15 15:41:20', '2017-07-23 07:22:05', NULL, ''),
	(34, 2, 'Judicial assignments', '/judicial_assignments', '_self', NULL, '#000000', 27, 7, '2017-07-15 15:41:31', '2017-07-23 07:22:05', NULL, ''),
	(35, 2, 'Journey to the heart of justice', '/journey_to_the_heart_of_justice', '_self', NULL, '#000000', NULL, 5, '2017-07-15 15:41:46', '2017-07-15 15:43:22', NULL, ''),
	(36, 1, 'Gallery', '/admin/gallery', '_self', 'voyager-images', '#000000', NULL, 5, '2017-07-15 21:54:01', '2017-07-15 21:54:58', NULL, ''),
	(37, 2, 'president_word', '/president_word', '_self', NULL, '#000000', 12, 4, '2017-07-23 07:21:42', '2017-07-23 07:22:19', NULL, ''),
	(38, 1, 'Files', '/admin/files', '_self', 'voyager-news', '#000000', NULL, 6, '2017-07-23 07:43:18', '2017-07-23 07:43:53', NULL, '');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table csm.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.migrations: ~20 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_01_01_000000_create_pages_table', 1),
	(6, '2016_01_01_000000_create_posts_table', 1),
	(7, '2016_02_15_204651_create_categories_table', 1),
	(8, '2016_05_19_173453_create_menu_table', 1),
	(9, '2016_10_21_190000_create_roles_table', 1),
	(10, '2016_10_21_190000_create_settings_table', 1),
	(11, '2016_11_30_135954_create_permission_table', 1),
	(12, '2016_11_30_141208_create_permission_role_table', 1),
	(13, '2016_12_26_201236_data_types__add__server_side', 1),
	(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(15, '2017_01_14_005015_create_translations_table', 1),
	(16, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
	(17, '2017_01_15_000000_create_permission_groups_table', 1),
	(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(20, '2017_04_21_000000_add_order_to_data_rows_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table csm.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.pages: ~15 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(2, 1, 'تأليف مجلس القضاء الأعلى', NULL, '<p>يتألف مجلس القضاء الاعلى من عشرة اعضاء على الوجه التالي:</p>\r\n<p>اعضاء حكميون هم:</p>\r\n<p>أ- الرئيس الاول لمحكمة التمييز رئيسا</p>\r\n<p>النائب العام لدى محكمة التمييز نائبا للرئيس</p>\r\n<p>رئيس هيئة التفتيش القضائي عضوا</p>\r\n<p>وتستمر ولايتهم طيلة مدة توليهم لمهامهم.</p>\r\n<p>ب- اعضاء منتخبون:</p>\r\n<p>قاضيان من رؤساء الغرف في محكمة التمييز يتم انتخابهما لمدة ثلاث سنوات من قبل الرئيس الاول لمحكمة التمييز ورؤساء الغرف والمستشارين في محكمة التمييز كافة عضوين</p>\r\n<p>تلتئم الهيئة الناخبة بناء على دعوة الرئيس الاول لمحكمة التمييز وباشرافه خلال الشهر الذي يسبق تاريخ انتهاء ولاية المجلس ويجري التوصيت بالاقتراع السري ويعتبر فائزا المرشحان اللذان ينالان العدد الاكبر من اصوات المقترعين واذا تساوت الاصوات يعتبر فائزا الاعلى درجة واذا تساوت الدرجات فالاكبر سنا ينظم الرئيس الاول لمحكمة التمييز محضرا بالنتيجة يبلغه الى وزير العدل تنظم دقائق هذه الفقرة بمرسوم يتخذ في مجلس الوزراء</p>\r\n<p>بناء على اقتراح وزير العدل بعد استطلاع رأي مجلس القضاء الاعلى</p>\r\n<p>ج- اعضاء معينون:</p>\r\n<p>قاض من رؤساء الغرف في محكمة التمييز قاضيان من رؤساء الغرف في محاكم الاستئناف قاض من رؤساء غرف محاكم الدرجة الاولى قاض عدلي من بين رؤساء المحاكم او من رؤساء الوحدات في وزارة العدل اعضاء</p>\r\n<p>يعين الاعضاء المذكورون في الفقرة ج بمرسوم بناء على اقتراح وزير العدل لمدة ثلاث سنوات غير قابلة للتجديد في حال شغور مركز اي من الاعضاء المذكورين في الفقرتين ب و ج يتم اختيار العضو البديل بالطريقة ذاتها للمدة المتبقية من الولاية وتكون هذه الولاية قابلة للتجديد اذا لم تتجاوز السنة والنصف</p>\r\n<p>ان ولاية القضاة المذكورين في الفقرتين ب و ج هي ثلاث سنوات غير قابلة للتجديد الا بعد انقضاء ولاية كاملة على انتهاء ولايتهم.</p>\r\n<p>&nbsp;</p>\r\n<p>يقسم اعضاء مجلس القضاء الاعلى امام رئيس الجمهورية وبحضور وزير العدل اليمين التالية:</p>\r\n<p>"اقسم بالله بأن اقوم بمهامي في مجلس القضاء الاعلى بكل امانة واخلاص وان احفظ سر المذاكرة وان اتوخى في جميع اعمالي حسن سير القضاء وكرامته واستقلاله".</p>\r\n<p><strong>الهيئة الحالية لمجلس القضاء الأعلى</strong></p>\r\n<p>الهيئة الحالية لمجلس القضاء الأعلى مؤلفة من الرئيس الأول لمحكمة التمييز القاضي جان فهد والنائب العام لدى محكمة التمييز القاضي سمير حمود ورئيس هيئة التفتيش القضائي القاضي أكرم بعاصيري ورئيس هيئة القضايا في وزارة العدل القاضي مروان كركبي ورئيس الغرفة الأولى لدى محكمة التمييز القاضي حبيب حدثي والرئيس الأول لمحكمة استئناف بيروت القاضي طنوس مشلب ورئيس الغرفة الخامسة لدى محكمة التمييز القاضي ميشال طرزي ورئيس الغرفة الثامنة لدى محكمة التمييز القاضي غسان فواز ورئيس الغرفة السابعة لدى محكمة استئناف جبل لبنان القاضي عفيف الحكيم &nbsp;ورئيس الغرفة الابتدائية الثالثة في جبل لبنان القاضي محمد مرتضى</p>', NULL, 'his_authorship', NULL, NULL, 'ACTIVE', '2017-07-15 17:46:33', '2017-07-15 17:55:46'),
	(3, 1, 'مهام مجلس القضاء الأعلى', NULL, '<p>&nbsp;</p>\r\n<p>واستقلاله وحسن سير العمل في المحاكم ويتخذ القرارات اللازمة بهذا الشأن".</p>\r\n<p>&nbsp;</p>\r\n<p>"وبالإضافة الى المقررات التي يتخذها مجلس القضاء</p>\r\n<p>الاعلى والآراء التي يبديها في الحالات المنصوص عليها في القانون والانظمة تناط به</p>\r\n<p>الصلاحيات التالية:</p>\r\n<p>&nbsp;</p>\r\n<p>أ- وضع مشروع المناقلات والالحاقات والانتدابات القضائية</p>\r\n<p>الفردية او الجماعية وعرضها على وزير العدل للموافقة عليه.</p>\r\n<p>&nbsp;</p>\r\n<p>ب- لا تصبح التشكيلات نافذة الا بعد موافقة وزير العدل</p>\r\n<p>&nbsp;</p>\r\n<p>- عند حصول اختلاف في وجهات النظر بين وزير العدل ومجلس</p>\r\n<p>القضاء الاعلى تعقد جلسة مشتركة بينهما للنظر في النقاط المختلفة عليها</p>\r\n<p>&nbsp;</p>\r\n<p>- اذا استمر الخلاف ينظر مجلس القضاء الاعلى مجددا في</p>\r\n<p>الامر للبت فيه ويتخذ قراره باكثرية سبعة اعضاء ويكون قراره في هذا الشان نهائيا</p>\r\n<p>وملزما</p>\r\n<p>&nbsp;</p>\r\n<p>- تصدر التشكيلات القضائية وفقا للبنود السابقة بمرسوم</p>\r\n<p>بناء على اقتراح وزير العدل</p>\r\n<p>&nbsp;</p>\r\n<p>- مع مراعاة احكام تعيين القضاة اللذين تلحظ القوانين</p>\r\n<p>النافذة تعيينهم بمرسوم يتخذ في مجلس الوزراء لا يرقى ولا ينقل اي من اعضاء مجلس</p>\r\n<p>القضاء الاعلى الا على طوال مدة ولايته.</p>\r\n<p>&nbsp;</p>\r\n<p>ج- تأليف المجلس التأديبي للقضاة.</p>\r\n<p>&nbsp;</p>\r\n<p>د- درس ملف اي قاض والطلب الى هيئة التفتيش القضائي</p>\r\n<p>اجراء التحقيقات اللازمة واتخاذ التدابير والقرارات المناسبة.</p>\r\n<p>&nbsp;</p>\r\n<p>ه- النظر في طلبات العفو الخاص المقدمة من المحكومين</p>\r\n<p>بعقوبة الاعدام او المحالة اليه من المراجع المختصة.</p>\r\n<p>&nbsp;</p>\r\n<p>و- تعيين لجنة مؤلفة من ثلاثة من اعضائه للنظر في سائر</p>\r\n<p>طلبات العفو الخاص.</p>\r\n<p>&nbsp;</p>\r\n<p>ز- ابداء الرأي في</p>\r\n<p>مشاريع القوانين والانظمة المتعلقة بالقضاء العدلي, واقتراح المشاريع والنصوص التي يراها مناسبة بهذا الشأن على وزير العدل.</p>', NULL, 'duties', NULL, NULL, 'ACTIVE', '2017-07-15 18:19:18', '2017-07-15 18:19:18'),
	(4, 1, 'زيارة النائب العام لدى محكمة التمييز إلى إمارة ابو ظبي', NULL, '<p>راز النائب العام لدى محكمة التمييز القاضي سمير حمود، على راس وفد قضائي، سعادة المستشار علي محمد البلوشي النائب العام لإمارة أبوظبي وبحث معه فرص التعاون المتاحة بين النيابة العامة في أبوظبي والجمهورية اللبنانية وإمكانات تعزيزها في المجالات القضائية والقانونية وتبادل الوفود والزيارات للتعرف على النظم النيابية المطبقة في البلدين الشقيقين</p>\r\n<p>&nbsp;</p>\r\n<p>وعرض سعادة البلوشي التطورات المتلاحقة التي سجلتها النيابة العامة في أبو ظبي خلال الفترة الماضية والتخصصات التي تم استحداثها والتي كان لها دور بارز في الارتقاء بأداء النيابات إلى أعلى المستويات من حيث الدقة والنزاهة في تحقيق العدالة.</p>\r\n<p>&nbsp;</p>\r\n<p>من جهته أشاد الرئيس حمود بالتطور الملحوظ الذي تشهده الخدمات القضائية والنيابية في دائرة القضاء في أبوظبي خاصة فيما يتعلق باستخدام التقنيات الحديثة في تحويل القضايا وتبسيط إجراءات التقاضي . معربا عن أمله في تطوير التعاون المشترك في هذا المجال في ظل العلاقات المميزة التي تربط البلدين والشعبين الشقيقين</p>', 'pages/July2017/ZKq0RFkDXgwabiERH7yW.jpg', 'vice_president', NULL, NULL, 'ACTIVE', '2017-07-15 18:21:31', '2017-07-15 18:21:31'),
	(5, 1, 'أخلاقيات القضاة', NULL, '<p><strong>الاستقلال</strong></p>\r\n<p>يقتضي التمييز بين استقلال القضاء واستقلال القاضي ، فعلى القاضي الاّ يكتفي بالقول إنّه مستقلّ بل ان يعمل بطريقة توحي بأنه مستقلّ بالفعل ، وأنّ القاضي يكون مستقّلاً إزاء المجتمع بوجه عام وإزاء فرقاء النزاع بوجه خاص. في ضوء ذلك يمتنع القاضي عن إقامة أية علاقة غير ملائمة مع السلطة التشريعية والسلطة التنفيذية ويحمي نفسه من كلّ تأثير آتٍ من جانبهما. ومن الوجوه التطبيقية لمبدأ الاستقلال ممارسة القاضي مهماته معتمداً على تقديره المهني للوقائع والأسباب القانونية الملائمة ، وذلك بمنأى عن أيّ تأثير خارجي أو تحريض أو ضغط أو تهديد او تدخّل مباشر او غير مباشر من قبل أيّ كان ولأيّ سبب كان. ومن الوجوه التطبيقية أيضاً : استقلال القاضي إزاء زملائه القضاة سواء خلال المذاكرة التي تمنحه ملء الحرية في التعبير عن الرأي او لدى ممارسة مهمّاته القضائية في أيّ موقع آخر.&nbsp;</p>\r\n<p><strong>التجرد</strong></p>\r\n<p>على القاضي ، من هذا المنطلق ، أن يتصرّف تصرّف الأب الصالح ، والحكم المنزّه، في كل قضية يعالجها . وعليه ان يميل عن أيّ هوى خاص وعن توقّع أيّ مكسب فردي . وعليه أن يمارس وظائفه القضائية بالطريقة التي تعزّز الثقة به وتقلّل او تُلاشي الفرص التي تدفع المتقاضين إلى طلب ردّه &nbsp;. ومن التطبيقات العملية لمسلك التجرّد : وجوب مبادرة القاضي إلى التنحي تلقائياً كلمّا توافرت الأسباب الملحوظة في القانون او كلّما اعتقد اعتقاداً راسخاً بان هناك أسبابا جديّة تدعو اي مراقب منصف وعارف وغير متحيّز الى الشك بان ثمة تضارباً بين ممارسة وظيفته القضائية وبين مصلحته الخاصة ومصلحة من يرتبط وإيّاهم بروابط القرابة او الودّ او الشراكة . وعليه ادارة التحقيقات بشكل حازم ، واحترام الفرقاء وحقوقهم في الدفاع ، وتجنّب توجيه الملاحظات المؤذية الى اصحاب العلاقة ، والمرافعة بشكل يراعي أدبيات المهنة اذا كان من قضاة النيابة العامة . وعليه ادارة شؤونه الذاتية ومشاريعه المالية بالشكل الذي يُضيّّق &nbsp;الى اقصى الحدود فرص طلب ردّه او احتمالات تنحّيه التلقائي . ويقتضي الا يبادر الى التنحّي اذا كان تنحّيه هو بالذات او تنحّي أعضاء آخرين قبله من المحكمة التي يشترك في تأليفها ، يؤدّي الى التمنّع عن إحقاق الحق . ومن تطبيقات مبدأ الحياد أيضاً الامتناع عن اي تعليق يتناول مسار المحاكمة ويوحي بانه سيحرم احد أطراف النزاع من نتيجة عادلة يتوخّاها ، سواء جرى هذا التعليق في معرض المحاكمة او خارجها . ومن التطبيقات كذلك سهر القاضي على مراقبة سلوكه مراقبة ذاتية صارمة ، داخل المحكمة وخارجها .&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>والحياد هو لون من ألوان التجرّد . وما من حق القاضي ان يمارس اي نوع من أنواع الانتقائية في ما يتخذه من قرارات .&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>واذا كان الحياد وجهاً من وجوه التجرّد ، فالمساواة وجه من وجوه الحياد . ويتجلّى مبدأ المساواة بامتناع القاضي عن الانحياز الى هذا او ذاك من المتقاضين بسبب الدين أو المذهب أو العرق أو اللون أو الجنسية أو العمر أو الجنس أو الحالة المدنية أو القدرات الجسدية والنفسية . ويتجلّى أيضا بمعاملة المحامين وأطراف النزاع والشهود والمساعدين القضائيين والخبراء ، فضلا عن زملائه القضاة ، معاملة لا تمييز فيها بسبب الاختلافات المذكورة .&nbsp;</p>\r\n<p><strong>النزاهة</strong></p>\r\n<p>على القاضي ، في هذا المضمار ، بذل كلّ جهد ممكن حتى لا يكون سلوكه محلاً لأيّ ارتياب . وعليه أن يكون دائم التنبّه والحذر تجاه كل ربح او نفع او حظوة يحاول ان يوفّرها له أحدهم ، وتجاه كلّ من يسعى الى تقريبه منه بسبب المهمات التي يمارسها ، كما يحصل أحيانا لدى دعوة القضاة الى حضور المآدب أو الحفلات الخاصة دون ان يكونوا معنيين شخصيا بها ، وذلك من قبل بعض السياسيين أو رجال الأعمال او الساعين الى النفوذ . ويمتنع على القاضي ان يلتمس مكافأة او هديّة او منحة او قرضاً بسبب أمر متعلّق بعمله القضائي . وينطبق هذا الحظر على أفراد الأسرة التي يُعيلها .&nbsp;</p>\r\n<p><strong>التحفظ</strong></p>\r\n<p>من الوجوه التطبيقية لموجب التحفظ امتناع القاضي عن المجاهرة بأي رأي من شأنه زرع الشك لدى المتقاضين حول تجرده ، واجتنابه كل أشكال النضال الديني او السياسي او العقائدي على وجه عام . وامتناعه عن التعليق العلني على قرارات قضائية صادرة عن سواه تعليقاً يخدم أغراضاً غير علمية أو من شأنه النيل من قدر المحكمة التي صدرت عنها .&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>ومن الوجوه التطبيقيّة لهذا الموجب انّه يتعيّن على القاضي التحلّي في تصرفاته وسلوكه وهندامه بما يحفظ هيبته داخل قصور العدل وخارجها ، وعدم إقامة علاقات شخصية مع اصحاب الدعاوى ووكلائهم ، وتجنّب التردّد على الشخصيات السياسية وتلك التي تتعاطى الشأن العام. وعليه الاّ يرتاد أماكن اللهو المشبوهة وأيّ مكان آخر لا يليق بمقامه .&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>وعليه الاّ يسعى الى تعزيز وضع المتقاضين في دعاوى مقامة امام زملائه ، وان يكون شديد التحفظ لدى استقباله المحامين في مكتبه حتى لا يوحي هذا الأمر بأنّه من قبيل التفضيل أو الانحياز لفريق دون الآخر ، وألاّ يسّمي محاميا للتوكّل بقضية اذا ما طلب منه ذلك أحد المتقاضين ، وإلاّ يقدّم الاستشارات القانونية لأيّ كان .&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>إنّ حفظ سرّ المذاكرة هو امتداد لموجب التحفظ . وهو يقضي بأن يكون القاضي مؤتمناً على حرمة المداولات وبأن يحافظ على سريّة التحقيقات الجزائية او سواها ممّا يفرضه القانون .&nbsp;</p>\r\n<p><strong>الشجاعة الأدبية</strong></p>\r\n<p>&nbsp;في أكثر اللحظات حرجا لا يصحّ للقاضي أنّ ينسى أنّ القرار بيده ، فليكتُب إذاً ما يُمليه &nbsp;عليه القانون والضمير ، بالرغم من كل العوامل السلبية الضاغطة .&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>ومن المفيد التذكير في هذا المقام بأن التخلّص من الحرج لا يكون باستنكاف القاضي عن النظر في القضية المطروحة عن طريق طلب التنحي لاستشعار الحرج الاّ اذا كان هذا الاستشعار بالغ الجدية ونادراً . والحل الصحيح لا يكون بالانسحاب وبدفع الدعوى الى قاض آخر ، وإنّما يكون بالمواجهة ، أي بالشجاعة الأدبية .&nbsp;</p>\r\n<p><strong>التواضع</strong></p>\r\n<p>للتواضع وجوه منها الهدوء الذي هو أمضى الأسلحة القضائية نَفَاذاً . فالغيظ والغضب والحماسة والغليان عواطف جارفة وباب الى فقدان السيطرة على النفس وعلى الموقف .&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>يتمثل التواضع في العديد من المواقف التي تواجه القاضي . فعليه ألاّ يسعى الى استغلال موقعه لإنجاز معاملة خاصة ، والى مخالفة القوانين لتأمين حاجاته او تحقيق رغباته . وينطبق ذلك على كل ما يعود بالنفع على أفراد اسرته وسائر المرتبطين به برابطة قربى او مودة . وعليه ، في هذا الخطّ ، الاّ يسمح لهؤلاء باستغلال موقعه لاجتناء المكاسب الخاصة .&nbsp;</p>\r\n<p><strong>الصدق والشرف</strong></p>\r\n<p>جرى التشديد على مصطلحي " الصدق " و " الشرف " في القوانين القضائية خصوصاً بمناسبة قسم اليمين . &nbsp;واذا كان صعبا فصل كل مصطلح منهما عن الآخر، فبالامكان الدلالة على إشارات وأمثلة توضح مضمونهما وتحفظ خصوصية كل منهما بالرغم من التقارب والتكامل .&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>يفرض الصدق نفسه على القاضي إزاء زملائه ويتمثّل على الأخصّ باحترامه الرؤساء القضائيين التسلسليين وبوضعهم في الجو الحقيقي لمسار عمله . ويفرض نفسه على أطراف النزاع وذلك بوجوب وضعهم ، ضمن الحدود المتاحة ، في الجو الحقيقي لمسار الدعوى ( أسباب تأخر فصلها مثلا : التحقيقات المعقدة ، انتظار تقارير الخبراء ، التبليغات الاستثنائية ، تغيّب القضاة المشروع عن الجلسات ... )&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>اما التصرّف بشرف فهو لا يعني استبعاد حق القاضي في تنظيم حياته الخاصة كأي مواطن عادي خارج إطار المؤسسة القضائية . ومع ذلك ، عليه ان يسهر على هيبة وظيفته ممتنعا عن كل تصرف يضعف الثقة بالمؤسسة القضائية ( كمخالطة عشرة السوء ... )&nbsp;</p>\r\n<p><strong>الأهلية والنشاط</strong></p>\r\n<p>الأهلية اداة عمل القاضي والنشاط هو العمل ذاته .&nbsp;</p>\r\n<p>لا محلّ في هذا المقام للتبسّط في مسألة الأهلية الوثيقة الارتباط بالتهيؤ الثقافي والقانوني العام .&nbsp;</p>\r\n<p>أمّا النشاط ، فمن مستلزماته ان يقدّم القاضي مهماته القضائية على كل مهمة أخرى ، وان يفصل في القضايا المعروضة عليه ضمن مهلة معقولة . ومن مستلزمات هذا الموجب إحقاق الحق وبالتالي إصدار القرارات المناسبة حتى لا يكون في حالة تمنع او استنكاف عن إحقاق الحق . ومن مستلزماته أيضاً ان يظلّ القاضي دائم الاستعداد لتلبية كلّ مهمة تفرضها عليه مقتضيات العمل . فليس له ان يتبرّم من أي ملف او أيّ قضيّة ينتدب لفصلها .&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 'ethics_of_judges', NULL, NULL, 'ACTIVE', '2017-07-15 18:23:35', '2017-07-15 18:23:35'),
	(6, 1, 'تقديم الشكوى', NULL, '<p>كل اخلال بواجبات الوظيفة وكل عمل يمس الشرف او الكرامة او الادب يؤلف خطأ يعاقب عليه تأديبيا.</p>\r\n<p>&nbsp;يعتبر بنوع خاص اخلال بواجبات الوظيفة التخلف عن الجلسات وتأخير البت بالدعاوى وعدم تحديد موعد معين لافهام الحكم عند ختام المذاكرة والتمييز بين المتقاضين وإفشاء سر المذاكرة</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; تقدم الشكوى مباشرة وبصورة خطية من المتضرر في قلم هيئة التفتيش القضائي الكائن في الطابق الرابع في قصر العدل في بيروت</p>\r\n<p>&nbsp;</p>\r\n<p>يقوم رئيس الهيئة فورا بنفسه او بواسطة من يكلفه من المفتشين العامين او المفتشين بالتحقيق في كل شكوى ترد اليه مباشرة او عن طريق&nbsp;</p>\r\n<p>وزير العدل ويمكنه حفظ الشكاوى المقدمة اليه مباشرة اذا وجدها غير جدية.</p>\r\n<p>&nbsp;</p>\r\n<p>لرئيس واعضاء هيئة التفتيش القضائي الحق باستعمال جميع وسائل التحقيق للقيام بمهامهم والاطلاع على جميع الوثائق والملفات والسجلات والاستماع الى من يرون استماعه ضروريا من الموظفين وغيرهم واستدعاء هؤلاء بواسطة النيابة العامة عند الاقتضاء لمجلس هيئة التفتيش ان يفرض عند الاقتضاء على الموظفين في حالات عرقلة اعمال التفتيش عقوبة التنبيه</p>\r\n<p>&nbsp;</p>\r\n<p>يحيل مجلس هيئة التفتيش القضائي القضاة وموظفي الفئة الثانية وما فوق التابعين لمراقبة الهيئة الى مجلس التأديب اذا ظهر له في التحقيقات &nbsp;ما يوجب هذه الاحالة. وله ان يقترح على وزير العدل توقيف القاضي المحال الى مجلس التأديب عن العمل&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 'make_a_complaint', NULL, NULL, 'ACTIVE', '2017-07-15 18:24:44', '2017-07-15 18:24:44'),
	(7, 1, 'المجلس التأديبي تأليفه وأصول المحاكمة لديه', NULL, '<p>يتألف المجلس التأديبي للقضاة من رئيس غرفة لدى محكمة التمييز رئيسا وعضوية رئيسي غرفة لدى محكمة الاستئناف يعينهم رئيس مجلس القضاء الاعلى في بدء كل سنة قضائية كما له ان يعين بديلا لاي منهم عند الغياب او التعذر</p>\r\n<p>- يقوم رئيس هيئة التفتيش القضائي او من يفوضه من اعضاء الهيئة بوظيفة مفوض الحكومة لدى المجلس.</p>\r\n<p>- ينظر المجلس في تأديب القضاة بناء على احالة مجلس هيئة التفتيش القضائي.</p>\r\n<p>تطبق على رئيس واعضاء المجلس اسباب الرد والتنحي المنصوص عليها في قانون اصول المحاكمات المدنية.</p>\r\n<p>- ينظر مجلس القضاء الاعلى في طلب التنحي بمهلة ثلاثة ايام على الاكثر.</p>\r\n<p>يضع الرئيس تقريرا او يكلف احد عضوي المجلس بذلك. &nbsp;يجري المقرر التحقيقات اللازمة ويستمع الى صاحب العلاقة ويتلقى افادات الشهود بعد اليمين ويرفع تقريره الى المجلس بلا ابطاء.</p>\r\n<p>يدعو الرئيس فورا صاحب العلاقة للاطلاع على الملف وعلى تقرير المقرر وللحضور امام المجلس في الجلسة التي يعينها له.</p>\r\n<p>تجري المحاكمة بصورة سرية. يتلى تقرير المقرر ويطلب الى صاحب العلاقة تقديم دفاعه حول الامور المؤاخذ عليها.</p>\r\n<p>يحق لصاحب العلاقة ان يستعين بمحام واحد او باحد القضاة واذا تغيب ينظر المجلس في القضية على ضوء المستندات فقط.</p>\r\n<p>يصدر المجلس قرارا معللا في اليوم ذاته او يؤجله الى اليوم التالي على الاكثر.</p>\r\n<p><strong>وقف القاضي عن العمل</strong></p>\r\n<p>لوزير العدل ان يوقف عن العمل بناء على اقتراح مجلس هيئة التفتيش القضائي, القاضي المحال على المجلس التأديبي. &nbsp;يتقاض القاضي الموقوف عن العمل نصف رواتبه وتعويضاته</p>', NULL, 'disciplinary_board_of_judges', NULL, NULL, 'ACTIVE', '2017-07-15 18:25:32', '2017-07-15 18:25:32'),
	(8, 1, 'الهيئة التأديبية العليا', NULL, '<p>يقبل قرار المجلس الطعن من قبل القاضي المعني او من قبل رئيس هيئة التفتيش القضائي بمهلة خمسة عشر يوما من تاريخ صدوره امام الهيئة القضائية العليا للتأديب تتالف الهيئة القضائية العليا للتأديب من رئيس مجلس القضاء الاعلى او نائبه رئيسا ومن اربعة اعضاء يعينون من قبل المجلس في بداية كل سنة قضائية كما يعين المجلس بديلا لاي منهم عند الغياب او التعذر تتبع لدى الهيئة القضائية العليا للتأديب اجراءات المحاكمة المعمول بها امام المجلس التأديبي لا يقبل قرار الهيئة القضائية العليا للتأديب اي طريق من طرق المراجعة بما فيها التمييز ويكون نافذا بحد ذاته بمجرد ابلاغه الى صاحب العلاقة بالصورة الادارية يبلغ هذا القرار الى وزير العدل.&nbsp;</p>\r\n<p>لا يجوز نشر او اعلان اية معاملة من معاملات الملاحقة التأديبية ما عدا القرار النهائي اذا تضمن عقوبة الصرف او العزل</p>', NULL, 'supreme_authority_for_discipline', NULL, NULL, 'ACTIVE', '2017-07-15 18:28:51', '2017-07-15 18:28:51'),
	(9, 1, 'برنامج رحلة إلى قلب العدالة', NULL, '<p>إن الفكرة التي يكونها طلاب المرحلة الثانوية عن المحاكم، سلبية بشكل عام فالمحكمة بعيدة عنهم ولا تعنيهم فهي مخصصة للمجرمين ورمز للعقاب والجرائم والسجن كما والظلم وصرف النفوذ أحياناً. إن هذه الفكرة لم تبن على أسس علمية بل على ما وصل إلى مسامع الطلاب من أخبار عن المحاكم والقضاء. من هنا تبرز أهمية إيجاد تماس مباشر بين المحكمة من جهة والطلاب من جهة أخرى، بين عالم المدرسة المغلق وعالم المحكمة المفتوح، لتصحح الصورة التي كونها كل منهم عن المحاكم من خلال الأخبار التي وصلت إليه من الأهل أو الغير أو وسائل الإعلام والتي غالباً ما تفتقر إلى التجرد لا بل تكون مجبولة أحياناً كثيرة أقله بالعواطف.</p>\r\n<p>إن الغاية الأساسية من دعوة الطلاب لحضور جلسة محاكمة هي إظهار محورية ودور المحكمة في المجتمع باعتبارها الملجأ لكل متضرر والمعاقب لكل مجرم أو متعسف وأيضاً الحامي للقاصر المعرض للخطر. إن حضور الطلاب لكيفية إحقاق الحق بصورة حية ومباشرة يساهم في تصحيح صورة المحاكم والقضاء في ذهن تلامذة اليوم ومواطني الغد</p>', NULL, 'journey_to_the_heart_of_justice', NULL, NULL, 'ACTIVE', '2017-07-15 18:30:40', '2017-07-15 18:30:40'),
	(10, 1, 'الهيئات الاستشارية', NULL, '<p>المادة الأولى - تنشأ هيئة استشارية واحدة في كلّ محافظة لمعاونة الرئيس الأول الاستئنافي في مهامه الاداريّة وللقيام بما ينصّ عليه هذا الملحق.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;تستثنى محافظة جبل لبنان حيث تنشأ هيئتان احداهما يغطّي عملها محاكم جبل لبنان الجنوبي، وثانيتهما محاكم جبل لبنان الشمالي.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;المادة الثانية المعدّلة &ndash; تؤلّف الهيئة من:</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;- الرئيس الأوّل لمحكمة الاستئناف في المحافظة، رئيساً حكميّاً.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;- قاضٍ يمثّل رؤساء غرف الاستئناف.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;- قاضٍ يمثّل رؤساء الغرف الابتدائية.</p>\r\n<p>&nbsp;</p>\r\n<p>- قاضٍ يمثّل القضاة المنفردين.</p>\r\n<p>&nbsp;</p>\r\n<p>- قاضٍ يمثّل مستشاري غرف الاستئناف.</p>\r\n<p>&nbsp;</p>\r\n<p>- قاضٍ يمثّل قضاة التحقيق (باستثناء قاضي التحقيق الأوّل) والمحامين العامين الاستئنافيين.</p>\r\n<p>&nbsp;</p>\r\n<p>- قاضٍ يمثّل أعضاء الغرف الابتدائية.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; أعضاء.</p>\r\n<p>&nbsp;</p>\r\n<p>يتمّ اختيار الأعضاء غير الحكميين وفق اﻵليّة المبيّنة في المادة الرابعة من هذا الملحق.</p>\r\n<p>&nbsp;</p>\r\n<p>المادة الثالثة - بصورة مؤقتة، وبانتظار تخصيص محاكم جبل لبنان الشمالي بنيابة عامة استئنافية ودائرة قضاة تحقيق مستقلّتين، يتمّ تمثيل الغرف الابتدائية والقضاة المنفردين في الهيئة العائدة الى هذه المحاكم بعضوين اثنين.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;المادة الرابعة المعدّلة - تجتمع كلّ فئة من الفئات المبيّنة في المادة الثانية من هذا الملحق في الأسبوع الأول من السنة القضائية بدعوة من الرئيس الأول الاستئنافي.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;يتمّ في هذا الاجتماع، انتخاب قاض من كل فئة بالأكثرية العادية، لعضوية الهيئة الاستشارية.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; تُراعى، في هذا الصّدد، خصوصيّة محاكم جبل لبنان.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;المادة الخامسة المعدّلة - مدة ولاية العضوية في الهيئة الاستشارية سنتان، يمكن تجديدها لمرّة واحدة فقط.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;تسقط العضوية حكماً:</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;- بانتهاء ممارسة العمل القضائي، أو بتعليق هذه الممارسة لأيّ سبب كان.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;- بخروج القاضي من الفئة التي يمثّلها.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;- بتعيينه عضواً في مجلس القضاء الأعلى.</p>\r\n<p>&nbsp;</p>\r\n<p>فور شغور المركز، يتمّ انتخاب عضو بديل وفقاً للآلية ذاتها المبيّنة في المادة الرابعة.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;يكمل العضو البديل ولاية العضو الذي حلّ محلَّه.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;المادة السّادسة - بعد انقضاء اسبوعين على تشكيلها، وبناءً على دعوة من رئيسها، تلتقي الهيئة الاستشارية قضاة المحافظة جميعاً لعرض برنامج عملها والاستماع الى ملاحظاتهم بشأنه.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;يُبلّغ برنامج العمل النهائي الى مجلس القضاء الأعلى.</p>\r\n<p>&nbsp;</p>\r\n<p>المادة السابعة المعدّلة - تجتمع الهيئة الاستشارية في مكتب رئيسها وبدعوة منه مرّتين على الأقلّ خلال السنة القضائية، وكلّما دعت الحاجة.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;لا يكون الاجتماع قانونياً إلاّ اذا حضره أربعة أعضاء على الأقلّ بمن فيهم الرئيس الأوّل.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;تتّخذ القرارات بالإجماع وإلاّ فبالأكثرية المطلقة، وفي حال تعادل الأصوات يكون صوت الرئيس مرجّحاً.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;يتولّى مهام المقرر أصغر أعضاء الهيئة سنّاً.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;المادة الثامنة - تتولّى الهيئة:</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;- معاونة الرئيس الأوّل، بناءً على طلبه، في جميع مهامه الاداريّة.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;- تقديم الاقتراحات الى مجلس القضاء الأعلى حول المواضيع المتعلّقة بشؤون القضاة في المحافظة وبتحسين ظروف ممارسة عملهم وبكل أمر من شأنه الارتقاء بعمل الجسم القضائي.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;المادة التاسعة - يلتزم أعضاء الهيئة بالمحافظة على سرّية المداولة، ويعتبر الاخلال بهذا الموجب بمثابة افشاء سرّ المذاكرة لدى المحاكم.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;المادة العاشرة - يُبلّغ هذا القرار من الرؤساء الأول الاستئنافيين، ويُعمل به فوراً.</p>\r\n<p><strong>الهيئة الاستشارية في بيروت</strong></p>\r\n<p>الرئيس الاول بالتكليف</p>\r\n<p>القاضي السيد طنوس مشلب</p>\r\n<p>القاضي السيد روكز رزق</p>\r\n<p>القاضي السيدة رولا عبد الله</p>\r\n<p>القاضي السيد محمود مكيّة</p>\r\n<p>القاضي السيد فادي العنيسي</p>\r\n<p>القاضي السيد ______</p>\r\n<p><strong>الهيئة الاستشارية في لبنان الشمالي</strong></p>\r\n<p>الرئيس الاول</p>\r\n<p>القاضي السيد رضا رعد</p>\r\n<p>القاضي السيدة رولا المصري</p>\r\n<p>القاضي السيد زياد دواليبي</p>\r\n<p>القاضي السيد ألاء الخطيب</p>\r\n<p>القاضي السيد مارسيل باسيل</p>\r\n<p>القاضي السيدة ديمة ديب</p>\r\n<p><strong>الهيئة الاستشارية في جبل لبنان الشمالي</strong></p>\r\n<p>الرئيس الاول بالانتداب</p>\r\n<p>القاضي السيد ميشال طرزي</p>\r\n<p>القاضي السيدة رندا كفوري</p>\r\n<p>القاضي السيد ايلي جبران</p>\r\n<p>القاضي السيدة نضال شمس الدين</p>\r\n<p>القاضي السيد طانيوس السغبيني</p>\r\n<p>القاضي السيد جوزف تامر</p>\r\n<p><strong>الهيئة الاستشارية في جبل لبنان الجنوبي</strong></p>\r\n<p>الرئيس الاول بالتكليف</p>\r\n<p>القاضي السيد ميشال طرزي</p>\r\n<p>القاضي السيد عفيف الحكيم</p>\r\n<p>القاضي السيدة عفاف يونس</p>\r\n<p>القاضي السيد ايلي الحلو</p>\r\n<p>القاضي السيد حسن حمدان</p>\r\n<p>القاضي السيد ______</p>\r\n<p><strong>الهيئة الاستشارية في البقاع</strong></p>\r\n<p>الرئيس الاول</p>\r\n<p>القاضي السيد أسامة اللحام</p>\r\n<p>القاضي السيد حارس الياس</p>\r\n<p>القاضي السيد عصام ضاهر</p>\r\n<p>القاضي السيد علي عراجي</p>\r\n<p>القاضي السيد نقولا منصور</p>\r\n<p>القاضي السيد انطوان ابو زيد</p>\r\n<p><strong>الهيئة الاستشارية في الجنوب</strong></p>\r\n<p>الرئيس الاول</p>\r\n<p>القاضي السيدة رُلى جدايل</p>\r\n<p>القاضي السيد مازن عاصي</p>\r\n<p>القاضي السيدة رشا عبد الساتر</p>\r\n<p>القاضي السيد جورج مزهر</p>\r\n<p>القاضي السيدة رُلى عثمان</p>\r\n<p>القاضي السيد أميرة شحرور</p>\r\n<p><strong>الهيئة الاستشارية في النبطية</strong></p>\r\n<p>الرئيس الاول</p>\r\n<p>القاضي السيد برنار الشويري</p>\r\n<p>القاضي السيد محمد مظلوم</p>\r\n<p>القاضي السيد عبد زلزلة</p>\r\n<p>القاضي السيد محمد مازح</p>\r\n<p>القاضي السيد نديم الناشف</p>\r\n<p>القاضي السيد محمد عبده</p>\r\n<p>&nbsp;</p>', NULL, 'advisory_bodies', NULL, NULL, 'INACTIVE', '2017-07-15 18:35:40', '2017-07-15 18:35:40'),
	(11, 1, 'قرار تشكيلات قضائية', NULL, '<p>المادة الأولى: ينقل القضاة التالية أسماؤهم من مراكزهم، سواء كانوا يشغلونها بالأصالة أو بالانتداب أو بالإثنين معاً، و يعيّنون في المراكز التالية:</p>\r\n<table border="1" width="601" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة لارا عبد الصمد </strong></p>\r\n</td>\r\n<td>\r\n<p><strong>قاضياً منفرداً في بيروت. </strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد رودني ضو</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في بيروت وينتدب قاضياً ملحقاً في أمانة سرّ مجلس القضاء الأعلى بالوكالة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة زينة الحجّار</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في طرابلس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة فاطمة ماجد</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في طرابلس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة ران الحاج </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في طرابلس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد راني صفير</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً عقارياً وقاضياً عقارياً إضافياً في لبنان الشمالي وينتدب قاضياً منفرداً في طرابلس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد جو خليل</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في زغرتا وينتدب قاضياً منفرداً في بشري.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد طانيوس الحايك </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في زغرتا.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد وسام الحجار </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في المنية- الضنية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد سامر متى</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في حلبا وينتدب قاضياً منفرداً في القبيات.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد جرجي الخوري </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في حلبا وينتدب قاضياً منفرداً في القبيات.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد جوزف تامر</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في زحلة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة ريتا حرّو </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في زحلة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة سهى فليفل</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في زحلة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة رولا عاكوم </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في صيدا.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد إيهاب بعاصيري </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في جزين.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة هبة هاشم </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في صور وتنتدب قاضياً منفرداً في جويّا.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد جورج سالم </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في صيدا وينتدب قاضياً منفرداً في صور وجويّا.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد أحمد مزهر</strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في النبطية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد حسين الحسيني </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في النبطية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد فارس بو نصّار </strong></p>\r\n</td>\r\n<td>\r\n<p>قاضياً منفرداً في راشيا.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>المادة الثانية: يشكّل القضاة التالية أسماؤهم كأعضاء غرف في محاكم الدرجة الأولى وذلك على النحو الآتي:</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة سالي شليطا الخوري</strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الأولى في بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة ليال الحلو </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الأولى في محافظة بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة سلام يقظان</strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الثانية في محافظة بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة غريتا طانيوس</strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الثانية في محافظة بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة سمر البحيري </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الثالثة في محافظة بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة سحر عويدات</strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الرابعة في محافظة بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة تراز مقوّم</strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الرابعة في محافظة بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة سيسيل سرحال</strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الخامسة في محافظة بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة لارا كوزاك </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية السادسة في محافظة بيروت.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة نانسي كرم </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية السادسة في محافظة بيروت.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة مايا عويدات </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية السابعة في بيروت.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة فرح الضيقة </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية السابعة في بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة جويل ابو حيدر </strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الأولى في محافظة جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة كرما حسيكي.</strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الثانية في محافظة جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد محمد فرحات </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الثالثة في محافظة جبل لبنان.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة سمر عبد الهادي </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية السادسة في محافظة جبل لبنان.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة اوجينا نصير </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية السابعة في محافظة جبل لبنان.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة أماني فواز </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الثامنة في محافظة جبل لبنان.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد شادي قردوحي </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً اضافياً لدى محكمة الدرجة الأولى في محافظة جبل لبنان وينتدب قاضياً منفرداً في جبيل</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد محمد معطي </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الأولى في محافظة لبنان الشمالي.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد أماني مرعشلي </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الأولى في لبنان &nbsp;الشمالي.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة جوليانا عبد الله </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الثانية في لبنان الشمالي.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة ادلين صفير </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الأولى في محافظة البقاع.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّد نور الدين صادق </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الأولى في محافظة البقاع.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي السيّدة فرح حمزة </strong></p>\r\n</td>\r\n<td>\r\n<p>عضواً لدى الغرفة الإبتدائية الثانية في محافظة البقاع.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>المادة الثالثة: يلغى إنتداب القاضي السيّد ماهر الزين ويعيّن قاضياً منفرداً في صيدا.</p>\r\n<p>&nbsp;</p>\r\n<p>المادة الرابعة: يكلّف القضاة الذين نقلوا من مراكزهم بإصدار الأحكام في الدعاوى التي خُتِمت المحاكمة فيها في المراكز التي كانوا يشغلونها.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 'decree_of_judicial_formations', NULL, NULL, 'ACTIVE', '2017-07-15 18:51:05', '2017-07-15 18:51:05'),
	(12, 1, 'قرار توزيع الأعمال', NULL, '<p>إن وزير العدل،</p>\r\n<p>بناء على المرسوم رقم 11217 تاريخ 15/2/2014،</p>\r\n<p>بناء على المرسوم الاشتراعي رقم 150 تاريخ 16/9/1983 وتعديلاته (قانون القضاء العدلي) لاسيما المادتين 15 و18 منه،</p>\r\n<p>بناء على المرسوم رقم 11896 تاريخ 29/5/2014 (مناقلات وتعيينات قضائية)،</p>\r\n<p>بناء على قرار مجلس القضاء الأعلى تاريخ 5/6/2014،</p>\r\n<p>يقرر ما يأتي :</p>\r\n<p>&nbsp;</p>\r\n<p>المادة الأولى : توزع الأعمال بين القضاة الأتية اسمائهم وفقا ًلما يلي :</p>\r\n<p>أولاً : في بيروت</p>\r\n<p>&nbsp;</p>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p><strong>بيروت</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي جان طنوس</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى المالية والتجارية التي كانت تنظر فيها القاضي رلى صفير بما فيها دعاوى الأصول الموجزة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي الفين بو ديوان</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في&nbsp;دعاوى النفوس والدعاوى الإدارية وجميع ما لم يرد ذكره في قرار توزيع الأعمال.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي رلى صفير</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية الحق الشخصي.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي رلى انطون</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى العقارية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي غادة شمس الدين</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في قضايا التنفيذ ومشاكله ودعاوى جنح الأحداث.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ميرنا كلاب</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في قضايا التنفيذ ومشاكله ودعاوى جنح الأحداث.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p>تتقاسم القاضيتان غادة شمس الدين وميرنا كلاب دعاوى جنح الأحداث بالتساوي فيما بينهما بإشراف الرئيس الأول لمحكمة استئناف بيروت.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي جورج عطية</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>قضايا تنفيذ عقود بيع السيارات والآليات ودعاوى المخالفات وجرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>ثانياً : محاكم جبل لبنان</p>\r\n<p>&nbsp;</p>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p><strong>بعبدا</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي رولان الشرتوني</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014، وفي دعاوى جنح الأحداث وجرائم قانون البناء وقانون السير وجميع المخالفات في قضاء بعبدا.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ميراي ملاك</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في دعاوى الإيجارات.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي زينه حيدر أحمد</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى المالية والتجارية وما لم يرد ذكره في قرار توزيع الأعمال.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي زينب فقيه</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى العقارية ودعاوى النفوس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي رمزي فرحات</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي سمرندا نصار</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية العالقة أمامها والواردة إليها لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي نادر منصور</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي هبة عبد الله</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ندين نجم</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ساندرا الخوري</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي حسن حمدان</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر الدعاوى الجزائية الواردة&nbsp; بعد تاريخ 1/6/2014 وفي دعاوى العجلة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p>توزع الدعاوى الجزائية الواردة بين القضاة عبد الله ونجم والخوري وحمدان بالتساوي فيما بينهم بإشراف الرئيس الأول لمحكمة استئناف جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي يوسف الحكيم</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في معاملات التنفيذ ومشاكلها.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ناديا جدايل</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في معاملات التنفيذ ومشاكلها.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي جيهان عون</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في معاملات التنفيذ ومشاكلها.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p>يعاد توزيع معاملات التنفيذ ومشاكله العالقة لغاية تاريخ 1/6/2014 بالتساوي بين القضاة الحكيم وجدايل وعون ويوزع الورود بعد تاريخ 1/6/2014 بالتساوي بينهم بإشراف الرئيس الأول لمحكمة استئناف جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p><strong>&nbsp;</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p><strong>الجديدة</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي رولا شمعون</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى المالية</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي نتالي الهبر</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في دعاوى الإيجارات العالقة أمامها والواردة إليها لغاية تاريخ 1/6/2014</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي جوزف تامر</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى التجارية ودعاوى النفوس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ريمه شرف الدين</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى المختلطة والعقارية العالقة أمامها لغاية تاريخ 1/6/2014 وجميع الدعاوى المختلطة والعقارية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي رزوين الحجيلي</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى المختلطة والعقارية العالقة أمامها والواردة إليها لغاية تاريخ 1/6/2014 ودعاوى الإيجارات الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي طانيوس السغبيني</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ناجي الدحداح</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي اسعد بيرم</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي سرمد صيداوي</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ريان نصر</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي روني شحاده</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي هشام القنطار </strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014 بالإضافة إلى الدعاوى الناشئة عن قانون السير وقانون البناء وجميع المخالفات.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي كارلا شواح</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p>توزع الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014 بين القضاة الدحداح والقنطار والشواح بمعدل 2/5 لكل من القاضيين القنطار والشواح و1/5 للقاضي الدحداح بإشراف الرئيس الأول لمحكمة استنئاف جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p><strong>جونية</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي الياس ريشا</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في معاملات التنفيذ ومشاكله وفي قضايا الأمور المستعجلة وقضايا النفوس بالإضافة إلى جرائم قانون البناء وجرائم قانون السير وجميع المخالفات وما لم يرد ذكره في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي طارق طربيه</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في معاملات التنفيذ ومشاكله وفي دعاوى الإيجارات بالإضافة إلى جرائم قانون البناء وجرائم قانون السير وجميع المخالفات.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p>توزع معاملات التنفيذ ومشاكله وجرائم قانون البناء وجرائم قانون السير وجميع المخالفات مناصفة بين القاضيين ريشا وطربيه بإشراف الرئيس الأول لمحكمة استئناف جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ريما حرفوش</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى المختلطة والعقارية، وتنظر في الدعاوى المالية والتجارية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي غريس ناضر</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى المالية والتجارية العالقة لديها والواردة إليها لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي جوزف بو سليمان</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي كارمن غالب</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية العالقة أمامها والواردة إليها لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي دينا دعبول</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية العالقة أمامها والواردة إليها لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي جورج حبيقة</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي ميشال معوض</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p>توزع الدعاوى الجزائية الواردة قبل تاريخ 1/6/2014 والتي لم يتمّ قيدها على جدول المرافعات بعد، على القضاة الثلاثة بو سليمان ودعبول وغالب بالتساوي فيما بينهم تحت إشراف الرئيس الأول لمحكمة استئناف جبل لبنان.</p>\r\n<p>توزع الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014 بين القضاة بو سليمان وحبيقة ومعوض بمعدل 2/5 لكل من القاضيين حبيقة ومعوض و1/5 للقاضي بو سليمان بإشراف الرئيس الأول لمحكمة استئناف جبل لبنان.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; عاليه&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي منصور القاعي</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>ينظر في الدعاوى الجزائية العالقة والواردة لغاية تاريخ 1/6/2014 بالإضافة إلى جرائم قانون البناء وقانون السير وسائر المخالفات وما لم يرد ذكره في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي سارة بريش</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية العالقة أمامها والواردة إليها لغاية تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي نجاة ابو شقرا</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي نادين ضومط</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى العقارية والمختلطة ودعاوى الإيجارات.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي دوريس شمعون</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في الدعاوى المالية والتجارية ودعاوى النفوس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<p><strong>القاضي كارين أبو عبدالله</strong></p>\r\n</td>\r\n<td valign="top">\r\n<p>تنظر في قضايا التنفيذ ومشاكله وقضايا الامور المستعجلة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<p>توزع الدعاوى الجزائية الواردة قبل تاريخ 1/6/2014 والتي لم يتم قيدها على جدول المرافعات بعد، بالتساوي بين القاضيين القاعي وبريش تحت إشراف الرئيس الأول لمحكمة استئناف جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>الدامور وشحيم</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي نضال الشاعر</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية وجرائم قانون البناء وجرائم قانون السير وجميع المخالفات في الدامور وشحيم وفي دعاوى التنفيذ ومشاكله في الدامور.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي نادين بو علوان</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية وجرائم قانون البناء وقانون السير وجميع المخالفات في الدامور وشحيم وفي دعاوى الأمور المستعجلة في الدامور.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي كالين العبد الله</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في جميع الدعاوى المدنية وما لم يرد عليه نص في هذا القرار في الدامور وشحيم وفي دعاوى الامور المستعجلة وقضايا التنفيذ ومشاكله في شحيم.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2">\r\n<p>توزع الدعاوى الجزائية بالتساوي فيما بين القاضيين الشاعر وبو علوان بإشراف الرئيس الأول لمحكمة استئناف جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>جبيل وقرطبا</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي جوزف عجاقه</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في قضايا التنفيذ ومشاكله وقضايا الأمور المستعجلة ودعاوى النفوس</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي رانيا رحمة</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى العقارية والمختلطة والمالية والتجارية ودعاوى الإيجارات وما لم يرد ذكره في قرار توزيع الأعمال</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي فادي ملكون</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية العالقة أمامه والواردة إليه لغاية تاريخ 1/6/2014</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي كابي شاهين </strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014 وجميع الجرائم الناشئة عن قانون السير وقانون البناء وجميع المخالفات.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>بعقلين</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي رائد ابو شقرا</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع أعمال المحكمة بما فيها جرائم قانون السير</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>دير القمر</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي الياس مخيبر</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في أعمال المحكمة كافة بما فيها جرائم قانون السير</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>القاضي العقاري والقاضي العقاري الإضافي</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي لبيب سلهب</strong></p>\r\n</td>\r\n<td>\r\n<p>يتولى أعمال القاضي العقاري في أقضية الشوف وبعبدا وجبيل ويتولى أعمال القاضي العقاري الإضافي في أقضية عاليه والمتن الشمالي وكسروان.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي علا حيدر</strong></p>\r\n</td>\r\n<td>\r\n<p>تتولى أعمال القاضي العقاري في أقضية عاليه والمتن الشمالي وكسروان وتتولى أعمال القاضي العقاري الإضافي في أقضية الشوف وبعبدا وجبيل.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>مجلس العمل التحكيمي</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ماجدة مزيحم</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى المسجلة لدى الغرفة الأولى وفي نصف الدعاوى المسجلة لدى الغرفة الثانية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ميراي حداد</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى المسجلة لدى الغرفة الثالثة وفي نصف الدعاوى المسجلة لدى الغرفة الثانية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2">\r\n<p>تحدد كيفية توزيع الدعاوى بين القاضيتين ماجدة مزيحم وميراي حداد بقرار من الرئيس الأول.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>ثالثا : محاكم لبنان الشمالي</p>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>طرابلس</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي آنياس معتوق</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية في محكمتي الجزاء الاولى والثانية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي جيسيكا برمكي</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية في محكمتي الجزاء الاولى والثانية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي هنادي جابر</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية في محكمتي الجزاء الاولى والثانية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي نازك الخطيب</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية في محكمتي الجزاء الاولى والثانية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2">\r\n<p>توزع الدعاوى الجزائية بالتساوي فيما بين القضاة بإشراف الرئيس الأول لمحكمة استئناف جبل لبنان.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ماتيلدا توما</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى اعمال دائرة التنفيذ ومشاكل التنفيذ ذات الرقم المفرد وعقود الآليات</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي رشا ابراهيم</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى اعمال دائرة التنفيذ ومشاكل التنفيذ ذات الرقم المزدوج</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي جويس عقيقي</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى الامور المستعجلة ودعاوى النفوس</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي رنا حبقة</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى الايجارات والجنح المذكورة في القانون رقم 97/623</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي أمال عيد</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى الايجارات وفي جنح المذكورة في القانون رقم 97/623</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي الين ابي خالد</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى العقارية والمختلطة</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ديما ديب</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى جنح الاحداث و دعاوى مخالفات قانون البناء وجرائم قانون السير والمخالفات الصحية والبلدية وكل ما لم يرد عليه نص0</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي هانيا الحسن</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعوى المالية والتجارية</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ندى المعلوف</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعوى المالية والتجارية</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2">\r\n<p>توزع الدعاوى المدنية والجنح المذكورة في القانون رقم 97/623 بالتساوي بين القضاة المكّلفين بها بإشراف الرئيس الأول لمحكمة استئناف لبنان الشمالي.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>حلبا والقبيات</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي حسين العبدالله</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية وجرائم قانون السير في محكمتي حلبا والقبيات.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي باسم نصر</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى المدنية العالقة لغاية تاريخ 1/6/2014 وقضايا التنفيذ ومشاكله وكل ما لم يرد عليه نص في هذا القرار في حلبا والقبيات.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي المنتدب سامر متى</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى المدنية الواردة اعتبارا من تاريخ 1/6/2014 وفي دعاوى النفوس في حلبا والقبيات</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>زغرتا- اهدن</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي مرسيل باسيل</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى الجزائية ودعاوى الامور المستعجلة وقضايا التنفيذ ومشاكله وجرائم قانون السير ونصف الدعاوى المدنية العالقة امامه والواردة إليه لغاية تاريخ 1/6/2014 وكل ما لم يرد عليه نص في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي راني صفير</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في نصف الدعاوى المدنية العالقة لغاية 1/6/2014 وجميع الدعاوى المدنية الواردة اعتبارا من تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>بشري</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي المنتدب راني صفير</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى بما فيها جرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>أميون</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي هانيا الحلوة</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية والدعاوى المالية والتجارية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي اميل عازار</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية وجميع جرائم قانون السير ودعاوى الامور المستعجلة والنفوس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي غريس طايع</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى المختلطة والعقارية ودعاوى الايجارات وقضايا التنفيذ ومشاكله وكل ما لم يرد عليه نص في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2">\r\n<p>توزع الدعاوى الجزائية بالتساوي بين القاضيين الحلوة وعازار بإشراف الرئيس الأول لمحكمة استئناف لبنان الشمالي.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>المنية وسير الضنية</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي زياد المصري الشعراني</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى الجزائية وفي جرائم قانون السير وفي جميع الدعاوى المدنية العالقة والواردة إليه قبل تاريخ 1/6/2014 وفي دعاوى النفوس والعجلة وفي قضايا التنفيذ ومشاكله وفي جميع ما لم يرد عليه نص في هذا القرار، في المنية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي شادي القردوحي</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى المدنية والجزائية وقضايا التنفيذ ومشاكله وجرائم قانون السير وفي جميع ما لم يرد عليه نص في هذا القرار، في سير الضنية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي احمد مزهر</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى المختلطة والعقارية والإيجارات والمالية والتجارية الواردة إلى المنية اعتباراً من تاريخ 1/6/2014</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>البترون ودوما</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي مارجي مجدلاني</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى المدنية ودعاوى الامور المستعجلة وفي قضايا التنفيذ ومشاكله في محكمة البترون وجميع الدعاوى المدنية والجزائية وقضايا التنفيذ ومشاكله في محكمة دوما وكل ما لم يرد عليه نص في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي كارلا رحال</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية وجرائم قانون السير في محكمة البترون.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>رابعاً : محاكم الجنوب</p>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>صيدا</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>نادين القاري</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى الحق العام.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ماهر الزين</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في دعاوى الحق الشخصي العالقة أمامه وفي جرائم قانون السير وجميع المخالفات وفي نصف دعاوى الحق الشخصي الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي منى حنقير</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى الحق الشخصي العالقة أمامها ونصف دعاوى الحق الشخصي الواردة بعد تاريخ 1/6/2014.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>اياد البردان</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في قضايا التنفيذ ومشاكله وقضايا الأمور المستعجلة</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي حسن سكينة</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى العقارية والمختلطة وجنح الأحداث.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي اميرة شحرور</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى المالية والتجارية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي جهينة دكروب</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في دعاوى الإيجارات وقضايا النفوس وكل ما لم يرد عليه نص في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>صور وجويا</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>مايا فواز</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية التي كانت مناطة سابقاً بالقاضي بلال بدر ونصف الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014 والمسجلة بأرقام مفردة وجرائم قانون السير وقضايا الأمور المستعجلة في صور.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>عبد القادر النقوزي</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية التي كانت مناطة به سابقاً كقاض منتدب ونصف الدعاوى الجزائية الواردة بعد تاريخ 1/6/2014 المسجلة بأرقام مزدوجة في صور وقضايا التنفيذ ومشاكله في صور وكل ما لم يرد عليه نص في هذا القرار.</p>\r\n<p>وفي جميع الدعاوى الجزائية بما فيها جرائم قانون السير في جويا.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي منال فارس</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى العقارية والمختلطة والتجارية والمالية ودعاوى الإيجارات والنفوس في صور وكل ما لم يرد عليه نص في هذا القرار وفي جميع الدعاوى المدنية وقضايا التنفيذ في جويا.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>جزين</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ماهر الزين</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى الجزائية بما فيها جرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي شادي زرزور</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى المدنية وقضايا التنفيذ وكل ما لم يرد عليه نص في هذا القرار</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>خامساً : محاكم البقاع</p>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>زحلة</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>الغرفة الاستئنافية الأولى</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في قضايا الهيئة الاتهامية وطلبات الصيغة التنفيذية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>الغرفة الاستئنافية الثانية</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى المختلطة والعقارية والمالية والتجارية ودعاوى الإيجارات والأحوال الشخصية ومشاكل التنفيذ وأتعاب المحاماة وفي كل ما لم يرد عليه نص في هذا القرار أو قرار توزيع الأعمال النافذ.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي انطوان ابو زيد</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى العقارية والمختلطة وقضايا الأمور المستعجلة وكل ما لم يرد عليه نص في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي محمد سلام</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى التجارية وجنح الأحداث.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي رولا ابو خاطر</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في قضايا التنفيذ ومشاكله وقضايا النفوس.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ندى الحاج شحاده</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في الدعاوى الجزائية والدعاوى المالية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي إيهاب عبد الرحيم</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية وجرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي وسيم التقي</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ناديا عقل</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية ودعاوى الإيجارات.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>بعلبك &ndash; دير الأحمر</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي اسيل الأثات</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في جرائم الأموال الجزائية وفي جرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي سهيل حلاوي</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الجرائم الجزائية الاخرى.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>جب جنين</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي فادي العريضي</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى الجزائية ودعاوى الامور المستعجلة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي طارق بو نصار</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى العقارية والمختلطة والتجارية والمالية ودعاوى الإيجارات والنفوس وقضايا التنفيذ ومشاكله وجرائم قانون السير وكل ما لم يرد عليه نص في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>صغبين</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي طارق بو نصار</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية وجرائم قانون السير ودعاوى الامور المستعجلة.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي فادي العريضي</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى العقارية والمختلطة والتجارية والمالية ودعاوى الإيجارات والنفوس وقضايا التنفيذ ومشاكله وكل ما لم يرد عليه نص في هذا القرار.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>راشيا</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي ياسر مصطفى</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع دعاوى محكمة راشيا بما فيها جرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>سادساً : محاكم النبطية</p>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>النبطية</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي محمد عبده</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في الدعاوى الجزائية ودعاوى جنح الاحداث وجرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي كريستل ملكي</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في جميع الدعاوى المدنية بما فيها قضايا الأمور المستعجلة وقضايا التنفيذ ومشاكله.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>حاصبيا ومرجعيون</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي وائل ابو عساف</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى الداخلة ضمن اختصاصه في مرجعيون وفي حاصبيا بما في ذلك جرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>تبنين وبنت جبيل</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضية ديالا ونسة</strong></p>\r\n</td>\r\n<td>\r\n<p>تنظر في جميع الدعاوى الداخلة ضمن اختصاصها في تبنين بما في ذلك جرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي مسلم عبده&nbsp; </strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع الدعاوى الداخلة ضمن اختصاصه في بنت جبيل بما في ذلك جرائم قانون السير.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">\r\n<p><strong>القاضي العقاري والقاضي العقاري الإضافي</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>القاضي خليل غصن</strong></p>\r\n</td>\r\n<td>\r\n<p>ينظر في جميع القضايا الداخلة ضمن اختصاصه بصفته قاضيا عقاريا وقاضيا عقاريا اضافيا</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>المادة الثانية: تبقى قرارات توزيع الأعمال ذات الأرقام 1292 و1293 و1294 و1295 و1296 و1297/2010 وتعديلاتها سارية المفعول في كل ما لا يتعارض مع القرار الحاضر. المادة الثالثة : يبلغ هذا القرار حيث تدعو الحاجة. بيروت في 9/6/2014 وزير العدل اللواء أشرف ريفي</p>', NULL, 'business_distribution_decisions', NULL, NULL, 'ACTIVE', '2017-07-15 19:28:52', '2017-07-15 19:28:52'),
	(13, 1, 'الانتدابات القضائية', NULL, '<p>إن وزير العدل،</p>\r\n<p>بناء على المرسوم الاشتراعي رقم 150 تاريخ 16/9/1983 وتعديلاته (قانون القضاء العدلي) لاسيما المادة 5 منه،</p>\r\n<p>بناء على المرسوم رقم 11896 تاريخ 29/5/2014 (مناقلات وتعيينات قضائية)،</p>\r\n<p>بناء على المرسوم رقم 11217 تاريخ 15/2/2014 (مناقلات وتعيينات قضائية)،</p>\r\n<p>بناء على قرار مجلس القضاء الأعلى تاريخ 30/6/2014،</p>\r\n<p>يقرر ما يأتي :</p>\r\n<p>المادة الأولى : ينتدب السادة القضاة التالية اسماؤهم، بالإضافة إلى وظائفهم الحالية، سواء كانت أصلية أم أصلية وبالانتداب، وفقاً لما يلي :</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة رنا عويدات مستشاراً بالإنتداب في الغرفة الثانية لدى محكمة التمييز بالإضافة إلى وظيفتها الأصلية قاضياً منفرداً في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد فادي عنيسي مستشاراً بالإنتداب في الغرفة الثالثة لدى محكمة التمييز بالإضافة إلى وظيفته الأصلية قاضي تحقيق في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة أماني سلامه مستشاراً بالإنتداب في الغرفة الرابعة لدى محكمة التمييز بالإضافة إلى وظيفتها الأصلية رئيساً للغرفة الأولى في محكمة الدرجة الأولى في جبل لبنان.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد محمود مكية مستشاراً بالإنتداب في الغرفة الرابعة لدى محكمة التمييز بالإضافة إلى وظيفته الأصلية رئيساً للغرفة السابعة لدى محكمة الدرجة الأولى في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد حبيب مزهر مستشاراً بالإنتداب في الغرفة الخامسة لدى محكمة التمييز بالإضافة إلى وظيفته الأصلية رئيساً للغرفة الثالثة لدى محكمة الدرجة الأولى في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد فرانسوا الياس مستشاراً بالإنتداب في الغرفة السادسة لدى محكمة التمييز بالإضافة إلى وظيفته الأصلية قاضياً منفرداً في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة &nbsp;ليلى رعيدي مستشاراً بالإنتداب في الغرفة السادسة لدى محكمة التمييز بالإضافة إلى وظيفتها الأصلية مستشاراً لدى المحكمة العسكرية الدائمة في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة زلفا الحسن مستشاراً بالإنتداب في الغرفة الثامنة لدى محكمة التمييز بالإضافة إلى وظيفتها الأصلية قاضياً منفرداً في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة إيمان عبد الله مستشاراً بالإنتداب في الغرفة العاشرة لدى محكمة التمييز، بالإضافة إلى وظيفتها الأصلية قاضياً منفرداً في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد محمد درباس محاميا ًعاماً بالإنتداب في النيابة العامة لدى محكمة التمييز، بالإضافة إلى وظيفته الأصلية مستشاراً لدى المحكمة العسكرية الدائمة.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة كارلا قسيس محامياً عاماً بالإنتداب في النيابة العامة لدى محكمة التمييز، بالإضافة إلى وظيفتها الأصلية مستشاراً لدى الغرفة الثامنة في محكمة التمييز.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد عماد سعيد محامياً عاماً بالإنتداب في النيابة العامة لدى محكمة التمييز، بالإضافة إلى وظيفته الأصلية مستشاراً لدى الغرفة السابعة في محكمة الاستئناف في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة إميلي ميرنا كلاس محامياً عاماً بالإنتداب في النيابة العامة لدى محكمة التمييز، بالإضافة إلى وظيفتها الأصلية قاضياً منفرداً في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد طنوس مشلب، رئيساً أولاً بالإنتداب لمحكمة استئناف بيروت، بالإضافة إلى وظيفته الأصلية رئيساً للغرفة العاشرة لدى محكمة استئناف بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة جمال الخوري، رئيساً بالإنتداب للغرفة الأولى لدى محكمة استئناف بيروت، بالإضافة إلى وظيفتها الأصلية مستشاراً في الغرفة الثانية لدى محكمة التمييز.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد خالد زوده رئيساً بالإنتداب للغرفة التاسعة لدى محكمة استئناف بيروت، بالإضافة إلى وظيفته الأصلية رئيساً للغرفة الثانية عشرة لدى محكمة استئناف جبل لبنان.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد زياد أبو حيدر نائباً عاماً بالإنتداب لدى النيابة العامة الاستئنافية في بيروت، بالإضافة إلى وظيفته الأصلية محامياً عاماً لدى النيابة العامة في البقاع.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد بلال وزنه قاضي تحقيق بالإنتداب لدى دائرة التحقيق في بيروت، بالإضافة إلى وظيفته الاصلية قاضي تحقيق بالأصالة لدى دائرة التحقيق في لبنان الشمالي ومحامياً عاماً بالإنتداب لدى النيابة العامة التمييزية.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد محمد مظلوم مستشاراً إضافياً بالإنتداب لدى محكمة الاستئناف في بيروت بالإضافة إلى وظيفته الأصلية رئيس الغرفة الثانية لدى محكمة استئناف النبطية.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد فادي الياس مستشاراً إضافياً لدى محكمة الاستئناف في بيروت بالإضافة إلى وظيفته الأصلية رئيساً للغرفة الأولى لدى محكمة الدرجة الأولى في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد ميشال طرزي رئيساً أول بالإنتداب لدى محكمة الاستئناف في جبل لبنان، بالإضافة إلى وظيفته الأصلية رئيس الغرفة العاشرة لدى محكمة استئناف جبل لبنان.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة سانيا نصر رئيس الغرفة الأولى لدى محكمة الاستئناف في جبل لبنان، بالإنتداب، بالإضافة إلى وظيفتها الأصلية مستشاراً لدى الغرفة الخامسة لدى محكمة التمييز.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة ريما خليل رئيس الغرف الرابعة عشرة لدى محكمة استئناف جبل لبنان بالانتداب، بالإضافة إلى وظيفتها الأصلية مستشاراً في الغرفة الرابعة لدى محكمة التمييز.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة رندا حرّوق مستشاراً إضافياً لدى محكمة الاستئناف في جبل لبنان بالإضافة إلى وظيفتها الأصلية مستشاراً في الغرفة الرابعة لدى محكمة التمييز.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد جورج حرب مستشاراً إضافياً لدى محكمة الاستئناف في جبل لبنان بالإضافة إلى وظيفته الأصلية رئيساً للغرفة الرابعة لدى محكمة الدرجة الأولى في بيروت.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة نضال شمس الدين مستشاراً إضافياً لدى محكمة الاستئناف في جبل لبنان بالإضافة إلى وظيفتها الأصلية رئيساً للغرفة السابعة لدى محكمة الدرجة الأولى في جبل لبنان.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة ساندرا المهتار، قاضي تحقيق بالإنتداب لدى دائرة التحقيق في جبل لبنان، بالإضافة إلى وظيفتها الأصلية مستشاراً في الغرفة الثامنة لدى محكمة استئناف جبل لبنان.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة سهى الحسن مستشاراً إضافياً لدى محكمة الاستئناف في لبنان الشمالي بالإضافة إلى وظيفتها الأصلية رئيساً للغرفة الثانية لدى محكمة الدرجة الأولى في لبنان الشمالي.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد أحمد رامي الحاج، قاضي تحقيق بالإنتداب لدى دائرة التحقيق في لبنان الشمالي، بالإضافة إلى وظيفته الأصلية مستشاراً في الغرفة الثانية لدى محكمة استئناف لبنان الشمالي.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة نازك الخطيب مستشاراً إضافياً لدى محكمة الاستئناف في لبنان الشمالي بالإضافة إلى وظيفتها الأصلية قاضياً منفرداً في طرابلس.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة غادة عون رئيساً بالإنتداب للغرفة الثالثة لدى محكمة استئناف البقاع، بالإضافة إلى وظيفتها الأصلية مستشاراً في الغرفة السادسة لدى محكمة التمييز.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد عماد زين، قاضي تحقيق أول بالإنتداب في البقاع، بالإضافة إلى وظيفته الأصلية قاضي تحقيق في المحكمة العسكرية.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيدة ناديا عقل مستشاراً بالانتداب في الغرفة الأولى لدى محكمة استئناف البقاع بالإضافة إلى وظيفتها الأصلية قاضياً منفرداً في زحلة.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد جمال عبد الله رئيس الغرفة الرابعة لدى محكمة الاستئناف في الجنوب، بالانتداب، بالإضافة إلى وظيفته الأصلية رئيساً للغرفة الثانية لدى محكمة الدرجة الأولى في جبل لبنان.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد حسن سكينه قاضياً منفرداً بالإنتداب في النبطية بالإضافة إلى وظيفته الأصلية قاضياً منفرداً في الجنوب.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد أحمد مزهر، قاضياً منفرداً بالوكالة والإنتداب في النبطية، بالإضافة إلى وظيفته الأصلية عضواً في الغرفة الثانية لدى المحكمة الابتدائية في لبنان الشمالي وقاضياً منفرداً بالوكالة والإنتداب في المنية وسير الضنية.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;القاضي السيد علي الموسوي، قاضي تحقيق في دائرة تحقيق البقاع بالإنتداب، مركزه بعلبك، بالإضافة إلى وظيفته الأصلية قاضياً منفرداً في رأس بعلبك والهرمل.</p>\r\n<p>&nbsp;</p>\r\n<p>المادة الثانية : يبلغ هذا القرار حيث تدعو الحاجة.</p>', NULL, 'judicial_assignments', NULL, NULL, 'ACTIVE', '2017-07-15 21:39:32', '2017-07-15 21:39:32'),
	(14, 1, 'الرئيس', NULL, '<p>اتّصلت الحرية بكيان لبنان اتّصالَ الروحِ بالجسد، والجوهرِ بالشكل. وتنامت في ظلالِها مجموعات حضارّية متلوّنةُ الثقافات، اختارت العيشَ معاً في حِمى نظام ديمقراطي زادَهُ التنّوع والتعدُّدُ تكاملاً ورسوخاً. ولم يفت هذا الوطنَ المتطلّعَ أبداً إلى الأسمى أن يجعلَ من العدل أساساً للملك وأن يُنيطَ بالسلطة القضائية شأناً خطيراً هو صونُ الحرّيات، وحمايةُ حقوق الإنسان، وتوطيدُ حكم القانون. وما من صَمّام أمان يجعل أبناءَ هذه الأرض وضيوفَها يطمئنّون إلى حقوقهم ويلتزمون بواجباتهم غير العدالة التي يسهرُ على إشاعتها قضاة نذروا النفس لعطاءٍ لا تحدُّهُ حدود، تنطلق قراراتهم من قصور العدل ومن أعماق الوجدان لتعبّرَ عن وجهٍ من وجوه رسالة لبنان الكونيّة. أيّها المواطنون، أيّها المتقاضون، أيّها الصحافيون القضائيون، أيّها المعنيّون بشأن العدالة كائنةً ما كانت مشاربُكم وتطلّعاتكم... أهلاً بكم على الموقع الالكتروني لمجلس القضاء الأعلى، السّاهر بموجب القانون وبقتضيات الضمير على حسن سير القضاء وكرامته واستقلاله، وبالتالي على توفير العدالة، ومن تجلّياتها احترام كرامة الإنسان وحرّية الفرد. هذا الموقع ظِلّ من ظلال الشفافية يُلقى على مسار مجلس القضاء الأعلى حتّى لا يبقى عملُهُ مغلقاً وعصيّاً على من يَنشدُ التعرّف إلى السلطة القضائية ودورها، وهذا حق من حقوقه. وهو يَضعُ في متناول المهتمّين معلومات تدور حول مهام المجلس وأنشطتِهِ ومبادراته في سبيل تعزيز الثقة بين القضاء والمجتمع، وبين القاضي والمواطن. كما يتيح كذلك الاطلاع على القواعد الأخلاقية والسلوكيّة التي يتبعها القضاة سواء عند أداء مهامهم أو في مسرح الحياة الخاصّة. إنّني أشجّعكم على زيارة أقسام هذا الموقع جميعاً للإفادة من المعلومات المنشورة عليه، وأدعوكم ألّا تحجبوا عنه اقتراحاتكم الآيلة إلى تحسين خدماته. ولزوار هذا الموقع من القضاة أقول: إنّ مجلس القضاء الأعلى، بحكم مسؤوليّاته الجُلّى وغيرته على ارتقاء العدالة وشيوعها، هو دائم الاستعداد لمعاضدة أيٍّ منكم في تحصين مساحة الحرّية والاستقلال اللازمة لتمكين القاضي من الاستجابة لانتظارات النّاس ومن خدمة المتقاضين على أفضلِ وجه. وفي سبيل جعل التواصل معكم ميسوراً ومُتاحاً في كلّ ظرف، تمَّ إنشاء قسم خاص بكم نأمل أن يُسهم في بلورة صورة القاضي المثالي وأن يَصُبّ في خانة توحيد الجهود الهادفة إلى بلوغ قضاءٍ أكثرَ منعةً وعدالةٍ أكثرَ رسوخاً</p>', 'pages/July2017/aXtNWmqakJIbitLjrPeV.jpg', 'president', NULL, NULL, 'ACTIVE', '2017-07-23 07:16:41', '2017-07-23 07:16:41'),
	(15, 1, 'كلمة الرئيس', NULL, NULL, NULL, 'president_word', NULL, NULL, 'ACTIVE', '2017-07-23 08:04:19', '2017-07-23 08:04:19'),
	(16, 1, 'البيانات الإعلامية', NULL, NULL, NULL, 'media_data', NULL, NULL, 'ACTIVE', '2017-07-23 12:45:52', '2017-07-23 12:45:52');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table csm.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table csm.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.permissions: ~39 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
	(1, 'browse_admin', NULL, '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(2, 'browse_database', NULL, '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(3, 'browse_media', NULL, '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(4, 'browse_settings', NULL, '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(5, 'browse_menus', 'menus', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(6, 'read_menus', 'menus', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(7, 'edit_menus', 'menus', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(8, 'add_menus', 'menus', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(9, 'delete_menus', 'menus', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(10, 'browse_pages', 'pages', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(11, 'read_pages', 'pages', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(12, 'edit_pages', 'pages', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(13, 'add_pages', 'pages', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(14, 'delete_pages', 'pages', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(15, 'browse_roles', 'roles', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(16, 'read_roles', 'roles', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(17, 'edit_roles', 'roles', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(18, 'add_roles', 'roles', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(19, 'delete_roles', 'roles', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(20, 'browse_users', 'users', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(21, 'read_users', 'users', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(22, 'edit_users', 'users', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(23, 'add_users', 'users', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(24, 'delete_users', 'users', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(25, 'browse_posts', 'posts', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(26, 'read_posts', 'posts', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(27, 'edit_posts', 'posts', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(28, 'add_posts', 'posts', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(29, 'delete_posts', 'posts', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(30, 'browse_categories', 'categories', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(31, 'read_categories', 'categories', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(32, 'edit_categories', 'categories', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(33, 'add_categories', 'categories', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(34, 'delete_categories', 'categories', '2017-07-15 13:05:33', '2017-07-15 13:05:33', NULL),
	(35, 'browse_gallery', 'gallery', '2017-07-15 21:53:16', '2017-07-15 21:53:16', NULL),
	(36, 'read_gallery', 'gallery', '2017-07-15 21:53:16', '2017-07-15 21:53:16', NULL),
	(37, 'edit_gallery', 'gallery', '2017-07-15 21:53:16', '2017-07-15 21:53:16', NULL),
	(38, 'add_gallery', 'gallery', '2017-07-15 21:53:16', '2017-07-15 21:53:16', NULL),
	(39, 'delete_gallery', 'gallery', '2017-07-15 21:53:16', '2017-07-15 21:53:16', NULL),
	(45, 'browse_files', 'files', '2017-07-23 07:55:43', '2017-07-23 07:55:43', NULL),
	(46, 'read_files', 'files', '2017-07-23 07:55:43', '2017-07-23 07:55:43', NULL),
	(47, 'edit_files', 'files', '2017-07-23 07:55:44', '2017-07-23 07:55:44', NULL),
	(48, 'add_files', 'files', '2017-07-23 07:55:44', '2017-07-23 07:55:44', NULL),
	(49, 'delete_files', 'files', '2017-07-23 07:55:44', '2017-07-23 07:55:44', NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table csm.permission_groups
DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE IF NOT EXISTS `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.permission_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;

-- Dumping structure for table csm.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.permission_role: ~39 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table csm.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.posts: ~4 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`, `page_id`) VALUES
	(1, 1, 0, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/nlje9NZQ7bTMYOUG4lF1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-07-15 13:05:34', '2017-07-22 17:34:23', 2),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/7uelXHi85YOfZKsoS6Tq.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-07-15 13:05:34', '2017-07-15 13:05:34', NULL),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/9txUSY6wb7LTBSbDPrD9.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-07-15 13:05:34', '2017-07-15 13:05:34', NULL),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/yuk1fBwmKKZdY2qR1ZKM.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-07-15 13:05:34', '2017-07-15 13:05:34', NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table csm.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2017-07-15 13:05:33', '2017-07-15 13:05:33'),
	(2, 'user', 'Normal User', '2017-07-15 13:05:33', '2017-07-15 13:05:33');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table csm.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.settings: ~9 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`) VALUES
	(1, 'title', 'Site Title', 'Site Title', '', 'text', 1),
	(2, 'description', 'Site Description', 'Site Description', '', 'text', 2),
	(3, 'logo', 'Site Logo', '', '', 'image', 3),
	(4, 'admin_bg_image', 'Admin Background Image', '', '', 'image', 9),
	(5, 'admin_title', 'Admin Title', 'Voyager', '', 'text', 4),
	(6, 'admin_description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 5),
	(7, 'admin_loader', 'Admin Loader', '', '', 'image', 6),
	(8, 'admin_icon_image', 'Admin Icon Image', '', '', 'image', 7),
	(9, 'google_analytics_client_id', 'Google Analytics Client ID', '', '', 'text', 9);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table csm.translations
DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.translations: ~26 rows (approximately)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 1, 'pt', 'Post', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(2, 'data_types', 'display_name_singular', 2, 'pt', 'Página', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(3, 'data_types', 'display_name_singular', 3, 'pt', 'Utilizador', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(5, 'data_types', 'display_name_singular', 5, 'pt', 'Menu', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(6, 'data_types', 'display_name_singular', 6, 'pt', 'Função', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(7, 'data_types', 'display_name_plural', 1, 'pt', 'Posts', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(8, 'data_types', 'display_name_plural', 2, 'pt', 'Páginas', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(9, 'data_types', 'display_name_plural', 3, 'pt', 'Utilizadores', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(11, 'data_types', 'display_name_plural', 5, 'pt', 'Menus', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(12, 'data_types', 'display_name_plural', 6, 'pt', 'Funções', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(13, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(14, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(15, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(16, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(17, 'menu_items', 'title', 2, 'pt', 'Media', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(18, 'menu_items', 'title', 3, 'pt', 'Publicações', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(19, 'menu_items', 'title', 4, 'pt', 'Utilizadores', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(20, 'menu_items', 'title', 5, 'pt', 'Categorias', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(21, 'menu_items', 'title', 6, 'pt', 'Páginas', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(22, 'menu_items', 'title', 7, 'pt', 'Funções', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(23, 'menu_items', 'title', 8, 'pt', 'Ferramentas', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(24, 'menu_items', 'title', 9, 'pt', 'Menus', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(25, 'menu_items', 'title', 10, 'pt', 'Base de dados', '2017-07-15 13:05:35', '2017-07-15 13:05:35'),
	(26, 'menu_items', 'title', 11, 'pt', 'Configurações', '2017-07-15 13:05:35', '2017-07-15 13:05:35');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table csm.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table csm.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$E6fL.MQOqjqQ831IC0ysoejItC5Hj02hnN8igvXNOrWLz4Fz98Qpa', 'rinUyXIsjXBeuVbSM8pDGeS17M6A66jVKrnCWwZvBOCewMYn6RibXjgiezPi', '2017-07-15 13:05:34', '2017-07-15 13:05:34'),
	(2, 2, 'User', 'user@user.com', 'users/default.png', '$2y$10$dZ2/B35.e.v3zCmgewFaje/dKyNShCPKDxYwdw8MzQWSvpb1jzQIe', 'syC8yfOmnSWUKPMB9cGi0UTk04Iae7aEtzJkQ65icZwZoWexUUCbTqN5m2zQ', '2017-07-23 23:19:02', '2017-07-23 23:19:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
