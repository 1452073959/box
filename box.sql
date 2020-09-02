/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50724
Source Host           : 127.0.0.1:3306
Source Database       : box

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-09-02 12:11:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Index', 'feather icon-bar-chart-2', '/', '2020-08-28 02:35:55', null);
INSERT INTO `admin_menu` VALUES ('2', '0', '2', 'Admin', 'feather icon-settings', '', '2020-08-28 02:35:55', null);
INSERT INTO `admin_menu` VALUES ('3', '2', '3', 'Users', '', 'auth/users', '2020-08-28 02:35:55', null);
INSERT INTO `admin_menu` VALUES ('4', '2', '4', 'Roles', '', 'auth/roles', '2020-08-28 02:35:55', null);
INSERT INTO `admin_menu` VALUES ('5', '2', '5', 'Permission', '', 'auth/permissions', '2020-08-28 02:35:55', null);
INSERT INTO `admin_menu` VALUES ('6', '2', '6', 'Menu', '', 'auth/menu', '2020-08-28 02:35:55', null);
INSERT INTO `admin_menu` VALUES ('7', '2', '7', 'Operation log', '', 'auth/logs', '2020-08-28 02:35:55', null);
INSERT INTO `admin_menu` VALUES ('8', '0', '8', '抽盒商品分类', 'fa-500px', 'cate', '2020-08-29 11:10:43', '2020-08-29 11:10:43');
INSERT INTO `admin_menu` VALUES ('9', '0', '9', '抽盒商品', 'fa-address-book', '/products', '2020-08-29 11:28:16', '2020-08-29 11:28:16');
INSERT INTO `admin_menu` VALUES ('10', '0', '10', '券', 'fa-archive', 'ticket', '2020-08-29 16:39:09', '2020-08-29 16:39:09');
INSERT INTO `admin_menu` VALUES ('11', '0', '11', '用户', 'fa-address-book-o', 'user', '2020-08-30 16:08:36', '2020-08-30 16:08:36');
INSERT INTO `admin_menu` VALUES ('12', '0', '12', '商城商品', 'fa-ambulance', 'shop', '2020-09-02 11:31:53', '2020-09-02 11:31:53');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-28 11:11:29', '2020-08-28 11:11:29');
INSERT INTO `admin_operation_log` VALUES ('2', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"udAyamJY6JNSsO3kMlDrcdhjnwWE2vBhUIkJrH77\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-28 11:11:37', '2020-08-28 11:11:37');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-28 11:11:38', '2020-08-28 11:11:38');
INSERT INTO `admin_operation_log` VALUES ('4', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-29 10:02:48', '2020-08-29 10:02:48');
INSERT INTO `admin_operation_log` VALUES ('5', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"FrTty0mG3DuhNucsQBmu2YITkVXWzEIjVWh16X2L\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-29 10:02:53', '2020-08-29 10:02:53');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-29 10:02:54', '2020-08-29 10:02:54');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 10:55:39', '2020-08-29 10:55:39');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"box\",\"tb\":\"products\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 10:55:46', '2020-08-29 10:55:46');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"products\"}', '2020-08-29 10:55:46', '2020-08-29 10:55:46');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"products\",\"exist-table\":\"box|products\",\"model_name\":\"App\\\\Models\\\\Product\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\Product\",\"create\":[\"model\",\"repository\",\"controller\",\"migrate\",\"lang\"],\"fields\":{\"0\":{\"name\":\"cid\",\"translation\":\"\\u5206\\u7c7bid\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},\"1\":{\"name\":\"title\",\"translation\":\"\\u5546\\u54c1\\u540d\\u79f0\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1\\u540d\\u79f0\"},\"2\":{\"name\":\"description\",\"translation\":\"\\u63cf\\u8ff0\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u63cf\\u8ff0\"},\"3\":{\"name\":\"image\",\"translation\":\"\\u5546\\u54c1\\u56fe\\u7247\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1\\u56fe\\u7247\"},\"5\":{\"name\":\"price\",\"translation\":\"\\u4ef7\\u683c\",\"type\":\"decimal\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u4ef7\\u683c\"},\"7\":{\"name\":\"recommended\",\"translation\":\"\\u63a8\\u8350\\u4f4d1\\u54262\\u662f\",\"type\":\"tinyInteger\",\"nullable\":\"on\",\"key\":null,\"default\":\"1\",\"comment\":\"\\u63a8\\u8350\\u4f4d1\\u54262\\u662f\"},\"8\":{\"name\":\"status\",\"translation\":\"\\u72b6\\u60011\\u4e0a\\u67b62\\u4e0b\\u67b6\",\"type\":\"tinyInteger\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u72b6\\u60011\\u4e0a\\u67b62\\u4e0b\\u67b6\"}},\"primary_key\":\"id\",\"timestamps\":\"1\",\"soft_deletes\":\"1\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 10:57:03', '2020-08-29 10:57:03');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-29 10:57:05', '2020-08-29 10:57:05');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"box\",\"tb\":\"product_skus\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 11:04:08', '2020-08-29 11:04:08');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"product_skus\"}', '2020-08-29 11:04:08', '2020-08-29 11:04:08');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product_skus\",\"exist-table\":\"box|product_skus\",\"model_name\":\"App\\\\Models\\\\ProductSku\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductSkuController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\ProductSku\",\"create\":[\"model\",\"lang\"],\"fields\":[{\"name\":\"title\",\"translation\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"image\",\"translation\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"product_id\",\"translation\":null,\"type\":\"unsignedInteger\",\"key\":null,\"default\":null,\"comment\":null}],\"primary_key\":\"id\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 11:04:23', '2020-08-29 11:04:23');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-29 11:04:23', '2020-08-29 11:04:23');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"box\",\"tb\":\"categories\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 11:05:18', '2020-08-29 11:05:18');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"categories\"}', '2020-08-29 11:05:19', '2020-08-29 11:05:19');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"categories\",\"exist-table\":\"box|categories\",\"model_name\":\"App\\\\Models\\\\Category\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\CategoryController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\Category\",\"create\":[\"model\",\"repository\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"text\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"parent_id\",\"translation\":null,\"type\":\"integer\",\"nullable\":\"on\",\"key\":null,\"default\":\"0\",\"comment\":null},{\"name\":\"is_directory\",\"translation\":null,\"type\":\"tinyInteger\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"image\",\"translation\":\"\\u5206\\u7c7b\\u56fe\\u7247\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u5206\\u7c7b\\u56fe\\u7247\"},{\"name\":\"path\",\"translation\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 11:05:35', '2020-08-29 11:05:35');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-29 11:05:36', '2020-08-29 11:05:36');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:09:37', '2020-08-29 11:09:37');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u62bd\\u76d2\\u5546\\u54c1\\u5206\\u7c7b\",\"icon\":\"fa-500px\",\"uri\":\"cate\",\"roles\":[null],\"permissions\":null,\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 11:10:43', '2020-08-29 11:10:43');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-29 11:10:45', '2020-08-29 11:10:45');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:10:48', '2020-08-29 11:10:48');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-08-29 11:10:49', '2020-08-29 11:10:49');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-08-29 11:12:35', '2020-08-29 11:12:35');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-08-29 11:12:36', '2020-08-29 11:12:36');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/cate/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:12:38', '2020-08-29 11:12:38');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/cate/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:13:52', '2020-08-29 11:13:52');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/cate/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:14:33', '2020-08-29 11:14:33');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"_id\":\"RbC6E17Ee7B8XevC\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"123.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Sep 03 2019 20:37:38 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"457202\"}', '2020-08-29 11:15:18', '2020-08-29 11:15:18');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"text\":\"\\u6f6e\\u73a9\",\"image\":\"images\\/2edfc155bcfdb5acabfb87c9c28ce570.png\",\"_file_\":null,\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 11:15:20', '2020-08-29 11:15:20');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:15:21', '2020-08-29 11:15:21');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-08-29 11:16:28', '2020-08-29 11:16:28');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/cate', 'GET', '127.0.0.1', '[]', '2020-08-29 11:17:35', '2020-08-29 11:17:35');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"_parent_id_\":\"57\",\"_tier_\":\"1\",\"_children_page_57\":\"1\"}', '2020-08-29 11:17:37', '2020-08-29 11:17:37');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:23:23', '2020-08-29 11:23:23');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/cate/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:25:40', '2020-08-29 11:25:40');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"_id\":\"vv3rTOHVobDYMZk5\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"123.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Sep 03 2019 20:37:38 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"457202\"}', '2020-08-29 11:25:55', '2020-08-29 11:25:55');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"text\":\"\\u6f6e\\u73a9\",\"image\":\"images\\/acfc23a20a993c31cbf52fdd804a27ce.png\",\"_file_\":null,\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/cate\"}', '2020-08-29 11:25:56', '2020-08-29 11:25:56');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:25:56', '2020-08-29 11:25:56');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/cate/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:27:01', '2020-08-29 11:27:01');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"_id\":\"wgTqdk6tQOMuiJD3\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"upload_column\":\"image\",\"id\":\"WU_FILE_1\",\"name\":\"123.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Sep 03 2019 20:37:38 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"457202\"}', '2020-08-29 11:27:09', '2020-08-29 11:27:09');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/cate', 'POST', '127.0.0.1', '{\"text\":\"net user\",\"image\":\"images\\/dfc5cb4804eccb962bbb426181e4511c.png\",\"_file_\":null,\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/cate\"}', '2020-08-29 11:27:10', '2020-08-29 11:27:10');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:27:10', '2020-08-29 11:27:10');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:27:47', '2020-08-29 11:27:47');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:27:51', '2020-08-29 11:27:51');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u62bd\\u76d2\\u5546\\u54c1\",\"icon\":\"fa-address-book\",\"uri\":\"\\/products\",\"roles\":[null],\"permissions\":null,\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 11:28:16', '2020-08-29 11:28:16');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-29 11:28:17', '2020-08-29 11:28:17');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-29 11:29:02', '2020-08-29 11:29:02');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-29 11:29:45', '2020-08-29 11:29:45');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-08-29 11:29:54', '2020-08-29 11:29:54');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-29 11:30:07', '2020-08-29 11:30:07');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:30:09', '2020-08-29 11:30:09');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:30:11', '2020-08-29 11:30:11');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:32:56', '2020-08-29 11:32:56');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:32:57', '2020-08-29 11:32:57');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:32:58', '2020-08-29 11:32:58');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:35:05', '2020-08-29 11:35:05');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:35:07', '2020-08-29 11:35:07');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:37:47', '2020-08-29 11:37:47');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:37:50', '2020-08-29 11:37:50');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:38:06', '2020-08-29 11:38:06');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:38:11', '2020-08-29 11:38:11');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:38:14', '2020-08-29 11:38:14');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:39:11', '2020-08-29 11:39:11');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:45:16', '2020-08-29 11:45:16');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:45:38', '2020-08-29 11:45:38');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:48:11', '2020-08-29 11:48:11');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:49:25', '2020-08-29 11:49:25');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:49:52', '2020-08-29 11:49:52');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 11:50:02', '2020-08-29 11:50:02');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 11:56:18', '2020-08-29 11:56:18');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:57:57', '2020-08-29 11:57:57');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:58:02', '2020-08-29 11:58:02');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:58:07', '2020-08-29 11:58:07');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:58:20', '2020-08-29 11:58:20');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:58:22', '2020-08-29 11:58:22');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:58:32', '2020-08-29 11:58:32');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:58:42', '2020-08-29 11:58:42');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 11:59:27', '2020-08-29 11:59:27');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 12:00:44', '2020-08-29 12:00:44');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/products', 'POST', '127.0.0.1', '{\"_id\":\"8n1nsyLYBGlrTtxG\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"\\u80cc\\u666f \\u62f7\\u8d1d.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Mon Sep 30 2019 20:43:27 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"767623\"}', '2020-08-29 12:01:09', '2020-08-29 12:01:09');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/products', 'POST', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/a11ec99eb7fbbf2f583cc2b0473c5940.png\",\"_file_\":null,\"file\":null,\"price\":\"50\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-29 12:01:17', '2020-08-29 12:01:17');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 12:01:19', '2020-08-29 12:01:19');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 12:01:21', '2020-08-29 12:01:21');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 12:01:42', '2020-08-29 12:01:42');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 12:02:38', '2020-08-29 12:02:38');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 12:02:39', '2020-08-29 12:02:39');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 12:48:40', '2020-08-29 12:48:40');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 12:48:41', '2020-08-29 12:48:41');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 13:06:29', '2020-08-29 13:06:29');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:06:29', '2020-08-29 13:06:29');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:06:33', '2020-08-29 13:06:33');
INSERT INTO `admin_operation_log` VALUES ('94', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:06:44', '2020-08-29 13:06:44');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:06:47', '2020-08-29 13:06:47');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"n3M0Sk7AFQmt1JJ9\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"upload_column\":\"image\",\"_relation\":\"skus,\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"psc.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Sat Apr 18 2020 07:39:23 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"35273\"}', '2020-08-29 13:07:10', '2020-08-29 13:07:10');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/a11ec99eb7fbbf2f583cc2b0473c5940.png\",\"_file_\":null,\"file\":null,\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"new_1\":{\"title\":\"sku1\",\"image\":\"images\\/psc.jpg\",\"id\":null,\"_remove_\":null}},\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-29 13:07:12', '2020-08-29 13:07:12');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:07:13', '2020-08-29 13:07:13');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 13:15:07', '2020-08-29 13:15:07');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:15:09', '2020-08-29 13:15:09');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-29 13:15:40', '2020-08-29 13:15:40');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:15:51', '2020-08-29 13:15:51');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:15:54', '2020-08-29 13:15:54');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '[]', '2020-08-29 13:17:27', '2020-08-29 13:17:27');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:17:29', '2020-08-29 13:17:29');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:17:30', '2020-08-29 13:17:30');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:25:44', '2020-08-29 13:25:44');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"7teOp4f54tG0dfXr\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"upload_column\":\"image\",\"_relation\":\"skus,\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"psc.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Sat Apr 18 2020 07:39:23 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"35273\"}', '2020-08-29 13:25:59', '2020-08-29 13:25:59');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/a11ec99eb7fbbf2f583cc2b0473c5940.png\",\"_file_\":null,\"file\":null,\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"new_1\":{\"title\":\"\\u7c7b\\u522b2\",\"image\":\"images\\/bcf8de0501e18a46a6b36bb77b8daf8d.jpg\",\"id\":null,\"_remove_\":null}},\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-29 13:26:01', '2020-08-29 13:26:01');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:26:01', '2020-08-29 13:26:01');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 13:28:43', '2020-08-29 13:28:43');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 13:28:46', '2020-08-29 13:28:46');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"mavICQD68XriJPHc\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"upload_column\":\"image\",\"_relation\":\"skus,\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"psc.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Sat Apr 18 2020 07:39:23 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"35273\"}', '2020-08-29 15:20:19', '2020-08-29 15:20:19');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/a11ec99eb7fbbf2f583cc2b0473c5940.png\",\"_file_\":null,\"file\":null,\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"3\":{\"title\":\"sku1\",\"image\":\"images\\/psc.jpg\",\"id\":\"3\",\"_remove_\":null},\"4\":{\"title\":\"\\u7c7b\\u522b2\",\"image\":\"images\\/bcf8de0501e18a46a6b36bb77b8daf8d.jpg\",\"id\":\"4\",\"_remove_\":null},\"new_1\":{\"title\":\"sku3\",\"image\":\"images\\/fbeae359f063754c6f1bbb5b8f98c401.jpg\",\"id\":null,\"_remove_\":null}},\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-29 15:20:20', '2020-08-29 15:20:20');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 15:20:21', '2020-08-29 15:20:21');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-29 16:00:09', '2020-08-29 16:00:09');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 16:00:12', '2020-08-29 16:00:12');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"box\",\"tb\":\"user_discount\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 16:00:20', '2020-08-29 16:00:20');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"user_discount\"}', '2020-08-29 16:00:21', '2020-08-29 16:00:21');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"user_discount\",\"exist-table\":\"box|user_discount\",\"model_name\":\"App\\\\Models\\\\UserDiscount\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\UserDiscountController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\UserDiscount\",\"create\":[\"model\"],\"fields\":[{\"name\":\"discount_id\",\"translation\":null,\"type\":\"integer\",\"key\":null,\"default\":\"0\",\"comment\":null},{\"name\":\"user_id\",\"translation\":null,\"type\":\"integer\",\"key\":null,\"default\":\"0\",\"comment\":null},{\"name\":\"amount\",\"translation\":\"\\u6570\\u91cf\",\"type\":\"integer\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u6570\\u91cf\"}],\"primary_key\":\"id\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 16:13:24', '2020-08-29 16:13:24');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-29 16:13:24', '2020-08-29 16:13:24');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"box\",\"tb\":\"discount\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 16:17:24', '2020-08-29 16:17:24');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"discount\"}', '2020-08-29 16:17:25', '2020-08-29 16:17:25');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"discount\",\"exist-table\":\"box|discount\",\"model_name\":\"App\\\\Models\\\\Discount\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\DiscountController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\Discount\",\"create\":[\"model\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"name\",\"translation\":\"\\u5361\\u540d\\u79f0\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u5361\\u540d\\u79f0\"},{\"name\":\"description\",\"translation\":\"\\u5361\\u63cf\\u8ff0\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u5361\\u63cf\\u8ff0\"}],\"primary_key\":\"id\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 16:17:33', '2020-08-29 16:17:33');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-29 16:17:37', '2020-08-29 16:17:37');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 16:17:56', '2020-08-29 16:17:56');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u5238\",\"icon\":\"fa-archive\",\"uri\":\"ticket\",\"roles\":[null],\"permissions\":null,\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 16:39:09', '2020-08-29 16:39:09');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-29 16:39:11', '2020-08-29 16:39:11');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 16:39:13', '2020-08-29 16:39:13');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/ticket/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 16:39:15', '2020-08-29 16:39:15');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/ticket', 'POST', '127.0.0.1', '{\"name\":\"\\u63d0\\u793a\\u5361\",\"description\":\"\\u63d0\\u793a\\u5361\\u63cf\\u8ff0\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/ticket\"}', '2020-08-29 16:40:05', '2020-08-29 16:40:05');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/ticket/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 16:40:06', '2020-08-29 16:40:06');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/ticket', 'POST', '127.0.0.1', '{\"name\":\"\\u663e\\u793a\\u5361\",\"description\":\"\\u663e\\u793a\\u5361\\u63cf\\u8ff0\",\"_token\":\"Jiyd5k3X7ivEtbTEepwsxbD3cAEc6skBaxfDnxMk\"}', '2020-08-29 16:40:16', '2020-08-29 16:40:16');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-29 16:40:17', '2020-08-29 16:40:17');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/ticket', 'GET', '127.0.0.1', '[]', '2020-08-29 16:40:21', '2020-08-29 16:40:21');
INSERT INTO `admin_operation_log` VALUES ('136', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-30 10:22:57', '2020-08-30 10:22:57');
INSERT INTO `admin_operation_log` VALUES ('137', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ZaNKV9j6XOyvJSkix2qmTj7pTT3qyPhA4gxrIENC\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-30 10:23:04', '2020-08-30 10:23:04');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-30 10:23:05', '2020-08-30 10:23:05');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 10:23:08', '2020-08-30 10:23:08');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin/ticket/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 10:23:10', '2020-08-30 10:23:10');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin/ticket', 'POST', '127.0.0.1', '{\"name\":\"\\u540e\\u6094\\u5361\",\"description\":\"\\u540e\\u4f1a\\u5361\\u63cf\\u8ff0\",\"_token\":\"lfWl5jwi0JhjEyUMpwR0R0lbY7QrlPK54GShDld9\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/ticket\"}', '2020-08-30 10:23:28', '2020-08-30 10:23:28');
INSERT INTO `admin_operation_log` VALUES ('142', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 10:23:28', '2020-08-30 10:23:28');
INSERT INTO `admin_operation_log` VALUES ('143', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-30 13:35:23', '2020-08-30 13:35:23');
INSERT INTO `admin_operation_log` VALUES ('144', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"h6IyiSwZ4DjvNEUbvbAMYeKeEAsUE8UKFDfaUy6l\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-30 13:35:29', '2020-08-30 13:35:29');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-30 13:35:30', '2020-08-30 13:35:30');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 13:35:38', '2020-08-30 13:35:38');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 13:35:45', '2020-08-30 13:35:45');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 13:35:48', '2020-08-30 13:35:48');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"hU2QF5WdoqI4KhKm\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"upload_column\":\"image\",\"_relation\":\"skus,\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"psc.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Sat Apr 18 2020 07:39:23 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"35273\"}', '2020-08-30 13:36:02', '2020-08-30 13:36:02');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/a11ec99eb7fbbf2f583cc2b0473c5940.png\",\"_file_\":null,\"file\":null,\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"3\":{\"title\":\"sku1\",\"image\":\"images\\/psc.jpg\",\"id\":\"3\",\"_remove_\":null},\"4\":{\"title\":\"\\u7c7b\\u522b2\",\"image\":\"images\\/bcf8de0501e18a46a6b36bb77b8daf8d.jpg\",\"id\":\"4\",\"_remove_\":null},\"5\":{\"title\":\"sku3\",\"image\":\"images\\/fbeae359f063754c6f1bbb5b8f98c401.jpg\",\"id\":\"5\",\"_remove_\":null},\"new_1\":{\"title\":\"5\",\"image\":\"images\\/0feeceae88a79d99125a20e783780caa.jpg\",\"id\":null,\"_remove_\":null}},\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-30 13:36:04', '2020-08-30 13:36:04');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 13:36:07', '2020-08-30 13:36:07');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 13:59:47', '2020-08-30 13:59:47');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:19:05', '2020-08-30 15:19:05');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-30 15:19:06', '2020-08-30 15:19:06');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:19:09', '2020-08-30 15:19:09');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:19:10', '2020-08-30 15:19:10');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:19:11', '2020-08-30 15:19:11');
INSERT INTO `admin_operation_log` VALUES ('158', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_parent_id_\":\"58\",\"_tier_\":\"1\",\"_children_page_58\":\"1\"}', '2020-08-30 15:19:15', '2020-08-30 15:19:15');
INSERT INTO `admin_operation_log` VALUES ('159', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_parent_id_\":\"59\",\"_tier_\":\"1\",\"_children_page_59\":\"1\"}', '2020-08-30 15:19:17', '2020-08-30 15:19:17');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-30 15:32:20', '2020-08-30 15:32:20');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-30 15:32:37', '2020-08-30 15:32:37');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-30 15:32:40', '2020-08-30 15:32:40');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-30 15:32:41', '2020-08-30 15:32:41');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:32:44', '2020-08-30 15:32:44');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:32:48', '2020-08-30 15:32:48');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:32:49', '2020-08-30 15:32:49');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:32:54', '2020-08-30 15:32:54');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:32:55', '2020-08-30 15:32:55');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:32:58', '2020-08-30 15:32:58');
INSERT INTO `admin_operation_log` VALUES ('170', '1', 'admin/products', 'POST', '127.0.0.1', '{\"_id\":\"sMKFKXif8yRqVQjP\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"psc.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Sat Apr 18 2020 07:39:23 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"35273\"}', '2020-08-30 15:33:25', '2020-08-30 15:33:25');
INSERT INTO `admin_operation_log` VALUES ('171', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-30 15:34:16', '2020-08-30 15:34:16');
INSERT INTO `admin_operation_log` VALUES ('172', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:34:32', '2020-08-30 15:34:32');
INSERT INTO `admin_operation_log` VALUES ('173', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:34:40', '2020-08-30 15:34:40');
INSERT INTO `admin_operation_log` VALUES ('174', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:34:42', '2020-08-30 15:34:42');
INSERT INTO `admin_operation_log` VALUES ('175', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:34:46', '2020-08-30 15:34:46');
INSERT INTO `admin_operation_log` VALUES ('176', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-30 15:36:27', '2020-08-30 15:36:27');
INSERT INTO `admin_operation_log` VALUES ('177', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:29', '2020-08-30 15:36:29');
INSERT INTO `admin_operation_log` VALUES ('178', '1', 'admin/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:29', '2020-08-30 15:36:29');
INSERT INTO `admin_operation_log` VALUES ('179', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:33', '2020-08-30 15:36:33');
INSERT INTO `admin_operation_log` VALUES ('180', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:35', '2020-08-30 15:36:35');
INSERT INTO `admin_operation_log` VALUES ('181', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:36', '2020-08-30 15:36:36');
INSERT INTO `admin_operation_log` VALUES ('182', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:39', '2020-08-30 15:36:39');
INSERT INTO `admin_operation_log` VALUES ('183', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:40', '2020-08-30 15:36:40');
INSERT INTO `admin_operation_log` VALUES ('184', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:50', '2020-08-30 15:36:50');
INSERT INTO `admin_operation_log` VALUES ('185', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:36:53', '2020-08-30 15:36:53');
INSERT INTO `admin_operation_log` VALUES ('186', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"key\":\"images\\/a11ec99eb7fbbf2f583cc2b0473c5940.png\",\"_column\":\"image\"}', '2020-08-30 15:37:00', '2020-08-30 15:37:00');
INSERT INTO `admin_operation_log` VALUES ('187', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"bynpoD3D0R7Csi0c\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"upload_column\":\"image\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"psc.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Sat Apr 18 2020 07:39:23 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"35273\"}', '2020-08-30 15:37:06', '2020-08-30 15:37:06');
INSERT INTO `admin_operation_log` VALUES ('188', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"bynpoD3D0R7Csi0c\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"image\":\"images\\/2843414dcf29f776e99f707b6c1b16b7.jpg\"}', '2020-08-30 15:37:06', '2020-08-30 15:37:06');
INSERT INTO `admin_operation_log` VALUES ('189', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/2843414dcf29f776e99f707b6c1b16b7.jpg\",\"_file_\":null,\"file\":null,\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"3\":{\"title\":\"sku1\",\"image\":\"images\\/psc.jpg\",\"id\":\"3\",\"_remove_\":null},\"4\":{\"title\":\"\\u7c7b\\u522b2\",\"image\":\"images\\/bcf8de0501e18a46a6b36bb77b8daf8d.jpg\",\"id\":\"4\",\"_remove_\":null},\"5\":{\"title\":\"sku3\",\"image\":\"images\\/fbeae359f063754c6f1bbb5b8f98c401.jpg\",\"id\":\"5\",\"_remove_\":null},\"6\":{\"title\":\"sku4\",\"image\":\"images\\/0feeceae88a79d99125a20e783780caa.jpg\",\"id\":\"6\",\"_remove_\":null},\"7\":{\"title\":\"sku5\",\"image\":null,\"id\":\"7\",\"_remove_\":null},\"8\":{\"title\":\"sku6\",\"image\":null,\"id\":\"8\",\"_remove_\":null}},\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-30 15:37:10', '2020-08-30 15:37:10');
INSERT INTO `admin_operation_log` VALUES ('190', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:37:11', '2020-08-30 15:37:11');
INSERT INTO `admin_operation_log` VALUES ('191', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 15:37:26', '2020-08-30 15:37:26');
INSERT INTO `admin_operation_log` VALUES ('192', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '[]', '2020-08-30 15:37:29', '2020-08-30 15:37:29');
INSERT INTO `admin_operation_log` VALUES ('193', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/2843414dcf29f776e99f707b6c1b16b7.jpg\",\"_file_\":null,\"file\":null,\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"3\":{\"title\":\"sku1\",\"image\":\"images\\/psc.jpg\",\"id\":\"3\",\"_remove_\":null},\"4\":{\"title\":\"\\u7c7b\\u522b2\",\"image\":\"images\\/bcf8de0501e18a46a6b36bb77b8daf8d.jpg\",\"id\":\"4\",\"_remove_\":null},\"5\":{\"title\":\"sku3\",\"image\":\"images\\/fbeae359f063754c6f1bbb5b8f98c401.jpg\",\"id\":\"5\",\"_remove_\":null},\"6\":{\"title\":\"sku4\",\"image\":\"images\\/0feeceae88a79d99125a20e783780caa.jpg\",\"id\":\"6\",\"_remove_\":null},\"7\":{\"title\":\"sku5\",\"image\":null,\"id\":\"7\",\"_remove_\":null},\"8\":{\"title\":\"sku6\",\"image\":null,\"id\":\"8\",\"_remove_\":null}},\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\"}', '2020-08-30 15:37:34', '2020-08-30 15:37:34');
INSERT INTO `admin_operation_log` VALUES ('194', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 16:05:57', '2020-08-30 16:05:57');
INSERT INTO `admin_operation_log` VALUES ('195', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 16:06:02', '2020-08-30 16:06:02');
INSERT INTO `admin_operation_log` VALUES ('196', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-30 16:06:16', '2020-08-30 16:06:16');
INSERT INTO `admin_operation_log` VALUES ('197', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-30 16:06:19', '2020-08-30 16:06:19');
INSERT INTO `admin_operation_log` VALUES ('198', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-30 16:06:32', '2020-08-30 16:06:32');
INSERT INTO `admin_operation_log` VALUES ('199', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-30 16:06:45', '2020-08-30 16:06:45');
INSERT INTO `admin_operation_log` VALUES ('200', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"box\",\"tb\":\"users\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\"}', '2020-08-30 16:06:50', '2020-08-30 16:06:50');
INSERT INTO `admin_operation_log` VALUES ('201', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"users\"}', '2020-08-30 16:06:51', '2020-08-30 16:06:51');
INSERT INTO `admin_operation_log` VALUES ('202', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"users\",\"exist-table\":\"box|users\",\"model_name\":\"App\\\\Models\\\\User\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\UserController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\User\",\"create\":[\"controller\",\"lang\"],\"fields\":[{\"name\":\"nickname\",\"translation\":\"\\u5fae\\u4fe1\\u6635\\u79f0\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"weapp_avatar\",\"translation\":\"\\u5fae\\u4fe1\\u5934\\u50cf\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"weapp_openid\",\"translation\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"defaultaddress_id\",\"translation\":null,\"type\":\"integer\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\"}', '2020-08-30 16:07:28', '2020-08-30 16:07:28');
INSERT INTO `admin_operation_log` VALUES ('203', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-30 16:07:30', '2020-08-30 16:07:30');
INSERT INTO `admin_operation_log` VALUES ('204', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 16:08:15', '2020-08-30 16:08:15');
INSERT INTO `admin_operation_log` VALUES ('205', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u7528\\u6237\",\"icon\":\"fa-address-book-o\",\"uri\":\"user\",\"roles\":[null],\"permissions\":null,\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\"}', '2020-08-30 16:08:36', '2020-08-30 16:08:36');
INSERT INTO `admin_operation_log` VALUES ('206', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-30 16:08:38', '2020-08-30 16:08:38');
INSERT INTO `admin_operation_log` VALUES ('207', '1', 'admin/user', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 16:08:40', '2020-08-30 16:08:40');
INSERT INTO `admin_operation_log` VALUES ('208', '1', 'admin/user', 'GET', '127.0.0.1', '[]', '2020-08-30 16:09:00', '2020-08-30 16:09:00');
INSERT INTO `admin_operation_log` VALUES ('209', '1', 'admin/user', 'GET', '127.0.0.1', '[]', '2020-08-30 16:09:36', '2020-08-30 16:09:36');
INSERT INTO `admin_operation_log` VALUES ('210', '1', 'admin/user', 'GET', '127.0.0.1', '[]', '2020-08-30 16:09:42', '2020-08-30 16:09:42');
INSERT INTO `admin_operation_log` VALUES ('211', '1', 'admin/user', 'GET', '127.0.0.1', '[]', '2020-08-30 17:51:26', '2020-08-30 17:51:26');
INSERT INTO `admin_operation_log` VALUES ('212', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:51:26', '2020-08-30 17:51:26');
INSERT INTO `admin_operation_log` VALUES ('213', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:51:27', '2020-08-30 17:51:27');
INSERT INTO `admin_operation_log` VALUES ('214', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:51:30', '2020-08-30 17:51:30');
INSERT INTO `admin_operation_log` VALUES ('215', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:51:34', '2020-08-30 17:51:34');
INSERT INTO `admin_operation_log` VALUES ('216', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"uKnFztJsei0fRJBp\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"upload_column\":\"cover\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"8.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Sat Feb 15 2020 16:39:31 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"280010\"}', '2020-08-30 17:51:53', '2020-08-30 17:51:53');
INSERT INTO `admin_operation_log` VALUES ('217', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"uKnFztJsei0fRJBp\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"cover\":\"images\\/8.png\"}', '2020-08-30 17:51:54', '2020-08-30 17:51:54');
INSERT INTO `admin_operation_log` VALUES ('218', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/2843414dcf29f776e99f707b6c1b16b7.jpg\",\"_file_\":null,\"file\":null,\"cover\":\"images\\/8.png\",\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"3\":{\"title\":\"sku1\",\"image\":\"images\\/psc.jpg\",\"id\":\"3\",\"_remove_\":null},\"4\":{\"title\":\"\\u7c7b\\u522b2\",\"image\":\"images\\/bcf8de0501e18a46a6b36bb77b8daf8d.jpg\",\"id\":\"4\",\"_remove_\":null},\"5\":{\"title\":\"sku3\",\"image\":\"images\\/fbeae359f063754c6f1bbb5b8f98c401.jpg\",\"id\":\"5\",\"_remove_\":null},\"6\":{\"title\":\"sku4\",\"image\":\"images\\/0feeceae88a79d99125a20e783780caa.jpg\",\"id\":\"6\",\"_remove_\":null},\"7\":{\"title\":\"sku5\",\"image\":null,\"id\":\"7\",\"_remove_\":null},\"8\":{\"title\":\"sku6\",\"image\":null,\"id\":\"8\",\"_remove_\":null}},\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-30 17:51:57', '2020-08-30 17:51:57');
INSERT INTO `admin_operation_log` VALUES ('219', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"LDIun6YlmWlz9EqN\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"upload_column\":\"image\",\"_relation\":\"skus,8\",\"_method\":\"PUT\",\"id\":\"WU_FILE_1\",\"name\":\"4.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Sat Feb 15 2020 14:56:18 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"226298\"}', '2020-08-30 17:52:04', '2020-08-30 17:52:04');
INSERT INTO `admin_operation_log` VALUES ('220', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"LDIun6YlmWlz9EqN\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"skus\":{\"8\":{\"image\":\"images\\/4.png\"}}}', '2020-08-30 17:52:04', '2020-08-30 17:52:04');
INSERT INTO `admin_operation_log` VALUES ('221', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"qYO7mjI4z4VmB2hC\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"upload_column\":\"image\",\"_relation\":\"skus,7\",\"_method\":\"PUT\",\"id\":\"WU_FILE_2\",\"name\":\"4.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Sat Feb 15 2020 14:56:18 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"226298\"}', '2020-08-30 17:52:09', '2020-08-30 17:52:09');
INSERT INTO `admin_operation_log` VALUES ('222', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"qYO7mjI4z4VmB2hC\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"skus\":{\"7\":{\"image\":\"images\\/2c5a3ef6fc5de98c67e573b8c73e76e4.png\"}}}', '2020-08-30 17:52:10', '2020-08-30 17:52:10');
INSERT INTO `admin_operation_log` VALUES ('223', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/2843414dcf29f776e99f707b6c1b16b7.jpg\",\"_file_\":null,\"file\":null,\"cover\":\"images\\/8.png\",\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"3\":{\"title\":\"sku1\",\"image\":\"images\\/psc.jpg\",\"id\":\"3\",\"_remove_\":null},\"4\":{\"title\":\"\\u7c7b\\u522b2\",\"image\":\"images\\/bcf8de0501e18a46a6b36bb77b8daf8d.jpg\",\"id\":\"4\",\"_remove_\":null},\"5\":{\"title\":\"sku3\",\"image\":\"images\\/fbeae359f063754c6f1bbb5b8f98c401.jpg\",\"id\":\"5\",\"_remove_\":null},\"6\":{\"title\":\"sku4\",\"image\":\"images\\/0feeceae88a79d99125a20e783780caa.jpg\",\"id\":\"6\",\"_remove_\":null},\"7\":{\"title\":\"sku5\",\"image\":\"images\\/2c5a3ef6fc5de98c67e573b8c73e76e4.png\",\"id\":\"7\",\"_remove_\":null},\"8\":{\"title\":\"sku6\",\"image\":\"images\\/4.png\",\"id\":\"8\",\"_remove_\":null}},\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-30 17:52:16', '2020-08-30 17:52:16');
INSERT INTO `admin_operation_log` VALUES ('224', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:52:17', '2020-08-30 17:52:17');
INSERT INTO `admin_operation_log` VALUES ('225', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-30 17:53:04', '2020-08-30 17:53:04');
INSERT INTO `admin_operation_log` VALUES ('226', '1', 'admin/products/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:53:30', '2020-08-30 17:53:30');
INSERT INTO `admin_operation_log` VALUES ('227', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"key\":\"images\\/8.png\",\"_column\":\"cover\"}', '2020-08-30 17:53:36', '2020-08-30 17:53:36');
INSERT INTO `admin_operation_log` VALUES ('228', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"GV53fiXPPBA9q4rk\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"upload_column\":\"cover\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"bj1.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Sat Feb 15 2020 15:22:22 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"283524\"}', '2020-08-30 17:53:42', '2020-08-30 17:53:42');
INSERT INTO `admin_operation_log` VALUES ('229', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"_id\":\"GV53fiXPPBA9q4rk\",\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"cover\":\"images\\/27a343ae6a057e08cfe9824876159e63.png\"}', '2020-08-30 17:53:43', '2020-08-30 17:53:43');
INSERT INTO `admin_operation_log` VALUES ('230', '1', 'admin/products/16', 'PUT', '127.0.0.1', '{\"cid\":\"58\",\"title\":\"\\u94f6\\u72d0\",\"series\":\"\\u94f6\\u72d0_\\u7cfb\\u5217\",\"image\":\"images\\/2843414dcf29f776e99f707b6c1b16b7.jpg\",\"_file_\":null,\"file\":null,\"cover\":\"images\\/27a343ae6a057e08cfe9824876159e63.png\",\"price\":\"50.00\",\"number\":\"12\",\"recommended\":\"1\",\"status\":\"1\",\"skus\":{\"3\":{\"title\":\"sku1\",\"image\":\"images\\/psc.jpg\",\"id\":\"3\",\"_remove_\":null},\"4\":{\"title\":\"\\u7c7b\\u522b2\",\"image\":\"images\\/bcf8de0501e18a46a6b36bb77b8daf8d.jpg\",\"id\":\"4\",\"_remove_\":null},\"5\":{\"title\":\"sku3\",\"image\":\"images\\/fbeae359f063754c6f1bbb5b8f98c401.jpg\",\"id\":\"5\",\"_remove_\":null},\"6\":{\"title\":\"sku4\",\"image\":\"images\\/0feeceae88a79d99125a20e783780caa.jpg\",\"id\":\"6\",\"_remove_\":null},\"7\":{\"title\":\"sku5\",\"image\":\"images\\/2c5a3ef6fc5de98c67e573b8c73e76e4.png\",\"id\":\"7\",\"_remove_\":null},\"8\":{\"title\":\"sku6\",\"image\":\"images\\/4.png\",\"id\":\"8\",\"_remove_\":null}},\"_token\":\"zlellWJhgEmmi14xKe28GoD0kkBJwqOqmME5d13v\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/box.test\\/admin\\/products\"}', '2020-08-30 17:53:45', '2020-08-30 17:53:45');
INSERT INTO `admin_operation_log` VALUES ('231', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:53:47', '2020-08-30 17:53:47');
INSERT INTO `admin_operation_log` VALUES ('232', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:55:40', '2020-08-30 17:55:40');
INSERT INTO `admin_operation_log` VALUES ('233', '1', 'admin/user', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:55:41', '2020-08-30 17:55:41');
INSERT INTO `admin_operation_log` VALUES ('234', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-30 17:55:43', '2020-08-30 17:55:43');
INSERT INTO `admin_operation_log` VALUES ('235', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-09-02 11:01:23', '2020-09-02 11:01:23');
INSERT INTO `admin_operation_log` VALUES ('236', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"0IGJpjkjQGRSJZfKLGjdfTzxcpw1lyDuYIzsayRk\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-09-02 11:02:41', '2020-09-02 11:02:41');
INSERT INTO `admin_operation_log` VALUES ('237', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-09-02 11:02:43', '2020-09-02 11:02:43');
INSERT INTO `admin_operation_log` VALUES ('238', '1', 'admin/user', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:03:06', '2020-09-02 11:03:06');
INSERT INTO `admin_operation_log` VALUES ('239', '1', 'admin/ticket', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:03:16', '2020-09-02 11:03:16');
INSERT INTO `admin_operation_log` VALUES ('240', '1', 'admin/user', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:03:35', '2020-09-02 11:03:35');
INSERT INTO `admin_operation_log` VALUES ('241', '1', 'admin/user', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:29:29', '2020-09-02 11:29:29');
INSERT INTO `admin_operation_log` VALUES ('242', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:29:30', '2020-09-02 11:29:30');
INSERT INTO `admin_operation_log` VALUES ('243', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:29:40', '2020-09-02 11:29:40');
INSERT INTO `admin_operation_log` VALUES ('244', '1', 'admin/helpers/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:29:41', '2020-09-02 11:29:41');
INSERT INTO `admin_operation_log` VALUES ('245', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:29:41', '2020-09-02 11:29:41');
INSERT INTO `admin_operation_log` VALUES ('246', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"box\",\"tb\":\"shop\",\"_token\":\"0ArQ27YADhlBM6UbpD1JfIjcTXObfUTDVQbzQYYR\"}', '2020-09-02 11:29:46', '2020-09-02 11:29:46');
INSERT INTO `admin_operation_log` VALUES ('247', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"shop\"}', '2020-09-02 11:29:46', '2020-09-02 11:29:46');
INSERT INTO `admin_operation_log` VALUES ('248', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"shop\",\"exist-table\":\"box|shop\",\"model_name\":\"App\\\\Models\\\\Shop\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ShopController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\Shop\",\"create\":[\"model\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"titile\",\"translation\":\"\\u5546\\u54c1\\u540d\\u79f0\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1\\u540d\\u79f0\"},{\"name\":\"series\",\"translation\":\"\\u7cfb\\u5217\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7cfb\\u5217\"},{\"name\":\"image\",\"translation\":\"\\u56fe\\u7247\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u56fe\\u7247\"},{\"name\":\"description\",\"translation\":\"\\u8be6\\u60c5\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u8be6\\u60c5\"},{\"name\":\"price\",\"translation\":\"\\u4ef7\\u683c\",\"type\":\"decimal\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u4ef7\\u683c\"},{\"name\":\"recommended\",\"translation\":\"\\u662f\\u5426\\u63a8\\u8350\\u4f4d1\\u662f2\\u5426\",\"type\":\"string\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u662f\\u5426\\u63a8\\u8350\\u4f4d1\\u662f2\\u5426\"}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"0ArQ27YADhlBM6UbpD1JfIjcTXObfUTDVQbzQYYR\"}', '2020-09-02 11:30:02', '2020-09-02 11:30:02');
INSERT INTO `admin_operation_log` VALUES ('249', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-09-02 11:30:04', '2020-09-02 11:30:04');
INSERT INTO `admin_operation_log` VALUES ('250', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:31:32', '2020-09-02 11:31:32');
INSERT INTO `admin_operation_log` VALUES ('251', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u5546\\u57ce\\u5546\\u54c1\",\"icon\":\"fa-ambulance\",\"uri\":\"shop\",\"roles\":[null],\"permissions\":null,\"_token\":\"0ArQ27YADhlBM6UbpD1JfIjcTXObfUTDVQbzQYYR\"}', '2020-09-02 11:31:52', '2020-09-02 11:31:52');
INSERT INTO `admin_operation_log` VALUES ('252', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-02 11:31:54', '2020-09-02 11:31:54');
INSERT INTO `admin_operation_log` VALUES ('253', '1', 'admin/shop', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:31:57', '2020-09-02 11:31:57');
INSERT INTO `admin_operation_log` VALUES ('254', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:34:40', '2020-09-02 11:34:40');
INSERT INTO `admin_operation_log` VALUES ('255', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:34:41', '2020-09-02 11:34:41');
INSERT INTO `admin_operation_log` VALUES ('256', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:34:42', '2020-09-02 11:34:42');
INSERT INTO `admin_operation_log` VALUES ('257', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:34:43', '2020-09-02 11:34:43');
INSERT INTO `admin_operation_log` VALUES ('258', '1', 'admin/shop/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:34:48', '2020-09-02 11:34:48');
INSERT INTO `admin_operation_log` VALUES ('259', '1', 'admin/shop/create', 'GET', '127.0.0.1', '[]', '2020-09-02 11:35:10', '2020-09-02 11:35:10');
INSERT INTO `admin_operation_log` VALUES ('260', '1', 'admin/shop', 'POST', '127.0.0.1', '{\"_id\":\"1m3AXEatpIMsaZEZ\",\"_token\":\"0ArQ27YADhlBM6UbpD1JfIjcTXObfUTDVQbzQYYR\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"03.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Sat Feb 15 2020 15:26:08 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"57663\"}', '2020-09-02 11:35:36', '2020-09-02 11:35:36');
INSERT INTO `admin_operation_log` VALUES ('261', '1', 'admin/shop', 'POST', '127.0.0.1', '{\"titile\":\"\\u5546\\u54c1\\u540d\\u79f0\",\"series\":\"\\u7cfb\\u5217\",\"image\":\"images\\/03.png\",\"_file_\":null,\"description\":\"<p>xxxx\\u5546\\u54c1\\u8be6\\u60c5<\\/p>\",\"price\":\"50\",\"recommended\":\"1\",\"status\":\"1\",\"_token\":\"0ArQ27YADhlBM6UbpD1JfIjcTXObfUTDVQbzQYYR\"}', '2020-09-02 11:35:51', '2020-09-02 11:35:51');
INSERT INTO `admin_operation_log` VALUES ('262', '1', 'admin/shop', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:35:51', '2020-09-02 11:35:51');
INSERT INTO `admin_operation_log` VALUES ('263', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:36:24', '2020-09-02 11:36:24');
INSERT INTO `admin_operation_log` VALUES ('264', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:36:28', '2020-09-02 11:36:28');
INSERT INTO `admin_operation_log` VALUES ('265', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:36:39', '2020-09-02 11:36:39');
INSERT INTO `admin_operation_log` VALUES ('266', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:36:52', '2020-09-02 11:36:52');
INSERT INTO `admin_operation_log` VALUES ('267', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:37:14', '2020-09-02 11:37:14');
INSERT INTO `admin_operation_log` VALUES ('268', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:37:35', '2020-09-02 11:37:35');
INSERT INTO `admin_operation_log` VALUES ('269', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:37:38', '2020-09-02 11:37:38');
INSERT INTO `admin_operation_log` VALUES ('270', '1', 'admin/shop', 'GET', '127.0.0.1', '[]', '2020-09-02 11:37:48', '2020-09-02 11:37:48');
INSERT INTO `admin_operation_log` VALUES ('271', '1', 'admin/shop/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:38:28', '2020-09-02 11:38:28');
INSERT INTO `admin_operation_log` VALUES ('272', '1', 'admin/shop', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-02 11:43:53', '2020-09-02 11:43:53');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'Auth management', 'auth-management', '', '', '1', '0', '2020-08-28 02:35:55', null);
INSERT INTO `admin_permissions` VALUES ('2', 'Users', 'users', '', '/auth/users*', '2', '1', '2020-08-28 02:35:55', null);
INSERT INTO `admin_permissions` VALUES ('3', 'Roles', 'roles', '', '/auth/roles*', '3', '1', '2020-08-28 02:35:55', null);
INSERT INTO `admin_permissions` VALUES ('4', 'Permissions', 'permissions', '', '/auth/permissions*', '4', '1', '2020-08-28 02:35:55', null);
INSERT INTO `admin_permissions` VALUES ('5', 'Menu', 'menu', '', '/auth/menu*', '5', '1', '2020-08-28 02:35:55', null);
INSERT INTO `admin_permissions` VALUES ('6', 'Operation log', 'operation-log', '', '/auth/logs*', '6', '1', '2020-08-28 02:35:55', null);

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu` (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_permission_menu_permission_id_menu_id_unique` (`permission_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2020-08-28 02:35:55', '2020-08-28 02:35:55');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_menu_role_id_menu_id_unique` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_users_role_id_user_id_unique` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$KqcNcAvMv9ZQtBJGGyQnm.uebcc3xTWUlj8QcN4IZOFBUHcVMY98m', 'Administrator', null, null, '2020-08-28 02:35:55', '2020-08-28 02:35:55');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) DEFAULT '0',
  `is_directory` tinyint(1) DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类图片',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('58', '潮玩', '0', null, 'images/acfc23a20a993c31cbf52fdd804a27ce.png', null, '2020-08-29 11:25:56', '2020-08-29 11:25:56');
INSERT INTO `categories` VALUES ('59', 'net user', '0', null, 'images/dfc5cb4804eccb962bbb426181e4511c.png', null, '2020-08-29 11:27:10', '2020-08-29 11:27:10');

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES ('1', '提示卡', '提示卡描述');
INSERT INTO `discount` VALUES ('2', '显示卡', '显示卡描述');
INSERT INTO `discount` VALUES ('3', '后悔卡', '后会卡描述');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '1');
INSERT INTO `migrations` VALUES ('4', '2019_08_19_000000_create_failed_jobs_table', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '封面图',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品图片',
  `series` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '系列',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `number` tinyint(10) NOT NULL DEFAULT '0' COMMENT '盒子数量',
  `recommended` tinyint(10) DEFAULT '1' COMMENT '推荐位1否2是',
  `status` tinyint(5) DEFAULT NULL COMMENT '状态1上架2下架',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `categories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('16', '58', '银狐', null, 'images/27a343ae6a057e08cfe9824876159e63.png', 'images/2843414dcf29f776e99f707b6c1b16b7.jpg', '银狐_系列', '50.00', '12', '1', '1', '2020-08-29 12:01:19', '2020-08-30 17:53:43');

-- ----------------------------
-- Table structure for product_skus
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_skus_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES ('3', 'sku1', 'images/psc.jpg', '16');
INSERT INTO `product_skus` VALUES ('4', '类别2', 'images/bcf8de0501e18a46a6b36bb77b8daf8d.jpg', '16');
INSERT INTO `product_skus` VALUES ('5', 'sku3', 'images/fbeae359f063754c6f1bbb5b8f98c401.jpg', '16');
INSERT INTO `product_skus` VALUES ('6', 'sku4', 'images/0feeceae88a79d99125a20e783780caa.jpg', '16');
INSERT INTO `product_skus` VALUES ('7', 'sku5', 'images/2c5a3ef6fc5de98c67e573b8c73e76e4.png', '16');
INSERT INTO `product_skus` VALUES ('8', 'sku6', 'images/4.png', '16');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `series` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '系列',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '详情',
  `price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '价格',
  `recommended` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否推荐位1是2否',
  `status` int(255) DEFAULT '0' COMMENT '1上架2下架',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '商品名称', '系列', 'images/03.png', '<p>xxxx商品详情</p>', '50', '1', '1', '2020-09-02 11:35:51', '2020-09-02 11:35:51');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务标题',
  `award` text COLLATE utf8mb4_unicode_ci COMMENT '奖励+',
  `type` int(255) DEFAULT '0' COMMENT '任务类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weapp_avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weapp_openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultaddress_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`weapp_avatar`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Dream Snow', 'https://thirdwx.qlogo.cn/mmopen/vi_32/fvSzic2fdNUMgDEXQMSMy4qUHQCCCcyPhyZCaKibRcGFckNYyqicx2mfJiagqjKV0USu8icX9fnibDE9wqb4aMazNseA/132', 'oUf9a5AT4xPDZy8lJ5Fpskh5gTqE', null, '2020-08-28 11:51:38', '2020-08-28 11:51:38');

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '该地址所属的用户',
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市',
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_ibfk_1` (`user_id`),
  CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES ('21', '1', '湖北', '武汉', '洪山', '详细地址', '张三', '12345678');
INSERT INTO `user_addresses` VALUES ('22', '1', '湖北', '武汉', '洪山', '详细地址', '张三', '1276692857');
INSERT INTO `user_addresses` VALUES ('23', '1', '湖北', '武汉', '洪山', '详细地址', '张三', '1276692857');

-- ----------------------------
-- Table structure for user_discount
-- ----------------------------
DROP TABLE IF EXISTS `user_discount`;
CREATE TABLE `user_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `user_discount_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_discount_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_discount
-- ----------------------------
INSERT INTO `user_discount` VALUES ('1', '1', '1', '1193', null, '2020-08-30 13:47:10');
INSERT INTO `user_discount` VALUES ('2', '2', '1', '49', null, '2020-08-30 15:08:46');

-- ----------------------------
-- Table structure for user_task
-- ----------------------------
DROP TABLE IF EXISTS `user_task`;
CREATE TABLE `user_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_task
-- ----------------------------
