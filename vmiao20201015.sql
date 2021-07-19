/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : vmiao

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-10-15 11:42:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for abouts
-- ----------------------------
DROP TABLE IF EXISTS `abouts`;
CREATE TABLE `abouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of abouts
-- ----------------------------
INSERT INTO `abouts` VALUES ('1', '<p><img src=\"http://cdn.lzhnb.com/uploads/image/2019/07/03/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\" title=\"/uploads/image/2019/07/03/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\" alt=\"timg (1).jpeg\"/></p><p style=\"text-align: center;\">这个是关于我们的介绍</p>', '2019-07-03 10:24:35', '2019-07-03 10:47:12');

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_detail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', '140926', '山西省 忻州市 静乐县', 'wang汪大', '13232155454', 'ha哈哈', '1', '2019-07-05 17:25:28', '2019-07-05 17:50:10', '5');
INSERT INTO `addresses` VALUES ('2', '310118', '上海 上海市 青浦区', '六', '18825155594', 'ce\'shi测试di地址', '1', '2019-07-05 17:45:43', '2019-07-08 16:54:32', '5');
INSERT INTO `addresses` VALUES ('3', '340711', '安徽省 铜陵市 郊区', '七', '13232155454', '我wi我我', '1', '2019-07-05 17:50:34', '2019-07-08 16:54:38', '5');
INSERT INTO `addresses` VALUES ('4', '140926', '山西省 忻州市 静乐县', 'en嗯嗯', '13232155656', 'ajsdafasdfffd', '0', '2019-07-08 16:55:23', '2019-07-08 16:55:23', '5');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '14', 'Index', 'fa-bar-chart', 'dashboard', null, null, '2020-10-14 17:08:45');
INSERT INTO `admin_menu` VALUES ('2', '0', '15', 'Admin', 'fa-tasks', '', null, null, '2020-10-14 17:08:45');
INSERT INTO `admin_menu` VALUES ('3', '2', '16', 'Users', 'fa-users', 'auth/users', null, null, '2020-10-14 17:08:45');
INSERT INTO `admin_menu` VALUES ('4', '2', '17', 'Roles', 'fa-user', 'auth/roles', null, null, '2020-10-14 17:08:45');
INSERT INTO `admin_menu` VALUES ('5', '2', '18', 'Permission', 'fa-ban', 'auth/permissions', null, null, '2020-10-14 17:08:45');
INSERT INTO `admin_menu` VALUES ('6', '2', '19', 'Menu', 'fa-bars', 'auth/menu', null, null, '2020-10-14 17:08:45');
INSERT INTO `admin_menu` VALUES ('7', '2', '20', 'Operation log', 'fa-history', 'auth/logs', null, null, '2020-10-14 17:08:45');
INSERT INTO `admin_menu` VALUES ('8', '0', '1', '虚拟商品', 'fa-credit-card', 'virtuals', null, '2019-07-02 17:02:41', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('9', '19', '5', '关于我们', 'fa-info-circle', 'about/1/edit', null, '2019-07-03 10:10:55', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('10', '0', '2', '现金兑换', 'fa-money', 'cash', null, '2019-07-05 16:00:44', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('11', '19', '7', '活动轮播图', 'fa-photo', 'banners', null, '2019-07-08 14:48:59', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('12', '19', '6', '活动文章', 'fa-file-powerpoint-o', 'articles', null, '2019-07-08 15:25:12', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('13', '18', '13', '商家任务', 'fa-tasks', 'tasks', null, '2020-10-11 23:42:33', '2020-10-14 17:08:45');
INSERT INTO `admin_menu` VALUES ('14', '17', '9', '电商平台', 'fa-shopping-bag', 'good-sources', null, '2020-10-12 00:29:33', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('15', '17', '10', '任务类型', 'fa-balance-scale', 'require-types', null, '2020-10-12 03:34:51', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('16', '0', '3', '用户管理', 'fa-users', 'users', null, '2020-10-12 15:24:49', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('17', '0', '8', '平台设置', 'fa-gears', null, null, '2020-10-14 16:54:07', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('18', '0', '11', '任务管理', 'fa-product-hunt', null, null, '2020-10-14 16:55:50', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('19', '0', '4', '内容管理', 'fa-connectdevelop', null, null, '2020-10-14 16:57:27', '2020-10-14 16:58:04');
INSERT INTO `admin_menu` VALUES ('20', '18', '12', '用户任务', 'fa-check-circle', 'task-users', null, '2020-10-14 17:08:29', '2020-10-14 17:08:45');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:06:54', '2019-04-18 14:06:54');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:07:08', '2019-04-18 14:07:08');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:07:12', '2019-04-18 14:07:12');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:07:16', '2019-04-18 14:07:16');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:15:10', '2019-04-18 14:15:10');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:15:55', '2019-04-18 14:15:55');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:15:58', '2019-04-18 14:15:58');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/auth/setting', 'PUT', '192.168.242.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$MCMh0Nf\\/ss2Gj79G\\/KtaYOPNeuz8ZCF5vPb2.ZjxhAJ6Sj3FfDq1O\",\"password_confirmation\":\"$2y$10$MCMh0Nf\\/ss2Gj79G\\/KtaYOPNeuz8ZCF5vPb2.ZjxhAJ6Sj3FfDq1O\",\"_token\":\"XOnigKF9USe0FHh1sAc6kYTS3JAd16AHtohQudPO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/demo.me\\/admin\\/auth\\/login\"}', '2019-04-18 14:16:08', '2019-04-18 14:16:08');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:16:08', '2019-04-18 14:16:08');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:16:13', '2019-04-18 14:16:13');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:16:46', '2019-04-18 14:16:46');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:16:49', '2019-04-18 14:16:49');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/users', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:16:52', '2019-04-18 14:16:52');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:26:35', '2019-04-18 14:26:35');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:26:38', '2019-04-18 14:26:38');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/users', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:26:44', '2019-04-18 14:26:44');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:27:56', '2019-04-18 14:27:56');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:28:00', '2019-04-18 14:28:00');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:03', '2019-04-18 14:28:03');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:04', '2019-04-18 14:28:04');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:20', '2019-04-18 14:28:20');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:21', '2019-04-18 14:28:21');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:28', '2019-04-18 14:28:28');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:31', '2019-04-18 14:28:31');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:29:09', '2019-04-18 14:29:09');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:46', '2019-04-18 14:58:46');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:47', '2019-04-18 14:58:47');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:53', '2019-04-18 14:58:53');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:54', '2019-04-18 14:58:54');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:56', '2019-04-18 14:58:56');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:57', '2019-04-18 14:58:57');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:59:17', '2019-04-18 14:59:17');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:59:18', '2019-04-18 14:59:18');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:59:41', '2019-04-18 14:59:41');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:59:42', '2019-04-18 14:59:42');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/auth/roles', 'GET', '192.168.242.1', '[]', '2019-04-18 15:01:36', '2019-04-18 15:01:36');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/auth/permissions', 'GET', '192.168.242.1', '[]', '2019-04-18 15:01:37', '2019-04-18 15:01:37');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-04-18 15:01:38', '2019-04-18 15:01:38');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 15:13:52', '2019-04-18 15:13:52');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 15:13:53', '2019-04-18 15:13:53');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 17:41:36', '2019-04-18 17:41:36');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 17:41:37', '2019-04-18 17:41:37');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 17:41:40', '2019-04-18 17:41:40');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-28 10:58:21', '2019-04-28 10:58:21');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-28 10:58:23', '2019-04-28 10:58:23');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-05-22 14:59:37', '2019-05-22 14:59:37');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-05-22 14:59:39', '2019-05-22 14:59:39');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 16:59:36', '2019-07-02 16:59:36');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 16:59:38', '2019-07-02 16:59:38');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-02 17:02:02', '2019-07-02 17:02:02');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/auth/menu', 'POST', '192.168.242.1', '{\"parent_id\":\"0\",\"title\":\"\\u865a\\u62df\\u5546\\u54c1\",\"icon\":\"fa-credit-card\",\"uri\":\"virtuals\",\"roles\":[null],\"permission\":null,\"_token\":\"lHLnoW7paanMrLEeaCLDfHb1U2CEhOGVBWzibFA5\"}', '2019-07-02 17:02:41', '2019-07-02 17:02:41');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-02 17:02:42', '2019-07-02 17:02:42');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:02:44', '2019-07-02 17:02:44');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:02:45', '2019-07-02 17:02:45');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:02:46', '2019-07-02 17:02:46');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:03:11', '2019-07-02 17:03:11');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:03:12', '2019-07-02 17:03:12');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:03:13', '2019-07-02 17:03:13');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin/virtuals/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:03:15', '2019-07-02 17:03:15');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:12:55', '2019-07-02 17:12:55');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:12:56', '2019-07-02 17:12:56');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:12:58', '2019-07-02 17:12:58');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/virtuals/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:13:00', '2019-07-02 17:13:00');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:13:19', '2019-07-02 17:13:19');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:13:20', '2019-07-02 17:13:20');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:13:20', '2019-07-02 17:13:20');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/virtuals/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:13:22', '2019-07-02 17:13:22');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:13:32', '2019-07-02 17:13:32');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:13:33', '2019-07-02 17:13:33');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:13:34', '2019-07-02 17:13:34');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/virtuals/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:13:36', '2019-07-02 17:13:36');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:18:31', '2019-07-02 17:18:31');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:18:31', '2019-07-02 17:18:31');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:18:32', '2019-07-02 17:18:32');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/virtuals/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:18:34', '2019-07-02 17:18:34');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin/virtuals', 'POST', '192.168.242.1', '{\"price\":\"50\",\"type\":\"\\u4eac\\u4e1cE\\u5361\",\"_token\":\"lHLnoW7paanMrLEeaCLDfHb1U2CEhOGVBWzibFA5\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/virtuals\"}', '2019-07-02 17:18:47', '2019-07-02 17:18:47');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:18:47', '2019-07-02 17:18:47');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/virtuals/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:18:50', '2019-07-02 17:18:50');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/virtuals/1', 'PUT', '192.168.242.1', '{\"price\":\"50\",\"type\":\"1\",\"_token\":\"lHLnoW7paanMrLEeaCLDfHb1U2CEhOGVBWzibFA5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/virtuals\"}', '2019-07-02 17:19:00', '2019-07-02 17:19:00');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:19:01', '2019-07-02 17:19:01');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:20:30', '2019-07-02 17:20:30');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:20:30', '2019-07-02 17:20:30');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:20:32', '2019-07-02 17:20:32');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:21:01', '2019-07-02 17:21:01');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:21:04', '2019-07-02 17:21:04');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:21:04', '2019-07-02 17:21:04');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:25:05', '2019-07-02 17:25:05');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:25:07', '2019-07-02 17:25:07');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:25:10', '2019-07-02 17:25:10');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:26:07', '2019-07-02 17:26:07');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:26:09', '2019-07-02 17:26:09');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:26:11', '2019-07-02 17:26:11');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin/virtuals/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:26:26', '2019-07-02 17:26:26');
INSERT INTO `admin_operation_log` VALUES ('94', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:27:24', '2019-07-02 17:27:24');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:27:25', '2019-07-02 17:27:25');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:27:27', '2019-07-02 17:27:27');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin/virtuals/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:27:29', '2019-07-02 17:27:29');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/virtuals', 'POST', '192.168.242.1', '{\"price\":\"18\",\"type\":\"7_2\",\"_token\":\"lHLnoW7paanMrLEeaCLDfHb1U2CEhOGVBWzibFA5\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/virtuals\"}', '2019-07-02 17:27:45', '2019-07-02 17:27:45');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:27:45', '2019-07-02 17:27:45');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-02 17:31:05', '2019-07-02 17:31:05');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-02 17:31:06', '2019-07-02 17:31:06');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:31:08', '2019-07-02 17:31:08');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin/virtuals/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:31:11', '2019-07-02 17:31:11');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin/virtuals/1', 'PUT', '192.168.242.1', '{\"name\":\"50\\u5143\\u4eac\\u4e1cE\\u5361\",\"price\":\"50\",\"type\":\"1\",\"_token\":\"lHLnoW7paanMrLEeaCLDfHb1U2CEhOGVBWzibFA5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/virtuals\"}', '2019-07-02 17:31:21', '2019-07-02 17:31:21');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:31:21', '2019-07-02 17:31:21');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/virtuals/2/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-02 17:31:24', '2019-07-02 17:31:24');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/virtuals/2', 'PUT', '192.168.242.1', '{\"name\":\"\\u7231\\u5947\\u827a\\u6708\\u5361\",\"price\":\"18\",\"type\":\"7_2\",\"_token\":\"lHLnoW7paanMrLEeaCLDfHb1U2CEhOGVBWzibFA5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/virtuals\"}', '2019-07-02 17:31:31', '2019-07-02 17:31:31');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-02 17:31:31', '2019-07-02 17:31:31');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-03 10:10:16', '2019-07-03 10:10:16');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-03 10:10:17', '2019-07-03 10:10:17');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin/virtuals', 'GET', '192.168.242.1', '[]', '2019-07-03 10:10:19', '2019-07-03 10:10:19');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-03 10:10:24', '2019-07-03 10:10:24');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/auth/menu', 'POST', '192.168.242.1', '{\"parent_id\":\"0\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"icon\":\"fa-info-circle\",\"uri\":\"about\",\"roles\":[null],\"permission\":null,\"_token\":\"D2cxjP1wZyktosuquDPjqAsO4z3mHSZtRdogSATK\"}', '2019-07-03 10:10:55', '2019-07-03 10:10:55');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-03 10:10:56', '2019-07-03 10:10:56');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-03 10:11:00', '2019-07-03 10:11:00');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-03 10:11:03', '2019-07-03 10:11:03');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/about', 'GET', '192.168.242.1', '[]', '2019-07-03 10:11:04', '2019-07-03 10:11:04');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/about/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:11:17', '2019-07-03 10:11:17');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-03 10:11:51', '2019-07-03 10:11:51');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-07-03 10:11:51', '2019-07-03 10:11:51');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/about', 'GET', '192.168.242.1', '[]', '2019-07-03 10:11:53', '2019-07-03 10:11:53');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/about/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:11:55', '2019-07-03 10:11:55');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-03 10:13:23', '2019-07-03 10:13:23');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin/about', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:13:26', '2019-07-03 10:13:26');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/about/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:13:27', '2019-07-03 10:13:27');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin/about/create', 'GET', '192.168.242.1', '[]', '2019-07-03 10:14:09', '2019-07-03 10:14:09');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/about', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:14:12', '2019-07-03 10:14:12');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/about/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:14:18', '2019-07-03 10:14:18');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/about/create', 'GET', '192.168.242.1', '[]', '2019-07-03 10:20:07', '2019-07-03 10:20:07');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/about', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:20:11', '2019-07-03 10:20:11');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/about/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:20:13', '2019-07-03 10:20:13');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/about', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:20:17', '2019-07-03 10:20:17');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/about', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:20:20', '2019-07-03 10:20:20');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin/about/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:20:22', '2019-07-03 10:20:22');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/about/create', 'GET', '192.168.242.1', '[]', '2019-07-03 10:21:29', '2019-07-03 10:21:29');
INSERT INTO `admin_operation_log` VALUES ('136', '1', 'admin/about/create', 'GET', '192.168.242.1', '[]', '2019-07-03 10:24:10', '2019-07-03 10:24:10');
INSERT INTO `admin_operation_log` VALUES ('137', '1', 'admin/about', 'POST', '192.168.242.1', '{\"detail\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2019\\/07\\/03\\/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\\\" title=\\\"\\/uploads\\/image\\/2019\\/07\\/03\\/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\\\" alt=\\\"timg (1).jpeg\\\"\\/><\\/p><p>\\u8fd9\\u4e2a\\u662f\\u5173\\u4e8e\\u6211\\u4eec\\u7684\\u4ecb\\u7ecd<\\/p>\",\"_token\":\"D2cxjP1wZyktosuquDPjqAsO4z3mHSZtRdogSATK\"}', '2019-07-03 10:24:35', '2019-07-03 10:24:35');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/about', 'GET', '192.168.242.1', '[]', '2019-07-03 10:24:36', '2019-07-03 10:24:36');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/about/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:24:40', '2019-07-03 10:24:40');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:24:48', '2019-07-03 10:24:48');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin/auth/menu/9/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:24:54', '2019-07-03 10:24:54');
INSERT INTO `admin_operation_log` VALUES ('142', '1', 'admin/auth/menu/9', 'PUT', '192.168.242.1', '{\"parent_id\":\"0\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"icon\":\"fa-info-circle\",\"uri\":\"about\\/1\\/edit\",\"roles\":[null],\"permission\":null,\"_token\":\"D2cxjP1wZyktosuquDPjqAsO4z3mHSZtRdogSATK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/auth\\/menu\"}', '2019-07-03 10:25:03', '2019-07-03 10:25:03');
INSERT INTO `admin_operation_log` VALUES ('143', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-03 10:25:03', '2019-07-03 10:25:03');
INSERT INTO `admin_operation_log` VALUES ('144', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-03 10:25:05', '2019-07-03 10:25:05');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin/about/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 10:25:08', '2019-07-03 10:25:08');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/about/1/edit', 'GET', '192.168.242.1', '[]', '2019-07-03 10:25:34', '2019-07-03 10:25:34');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/about/1', 'PUT', '192.168.242.1', '{\"detail\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2019\\/07\\/03\\/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\\\" title=\\\"\\/uploads\\/image\\/2019\\/07\\/03\\/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\\\" alt=\\\"timg (1).jpeg\\\"\\/><\\/p><p style=\\\"text-align: center;\\\">\\u8fd9\\u4e2a\\u662f\\u5173\\u4e8e\\u6211\\u4eec\\u7684\\u4ecb\\u7ecd<\\/p>\",\"_token\":\"D2cxjP1wZyktosuquDPjqAsO4z3mHSZtRdogSATK\",\"_method\":\"PUT\"}', '2019-07-03 10:47:12', '2019-07-03 10:47:12');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/about/1/edit', 'GET', '192.168.242.1', '[]', '2019-07-03 10:47:13', '2019-07-03 10:47:13');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/about/1/edit', 'GET', '192.168.242.1', '[]', '2019-07-03 10:47:26', '2019-07-03 10:47:26');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/about/1', 'PUT', '192.168.242.1', '{\"detail\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2019\\/07\\/03\\/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\\\" title=\\\"\\/uploads\\/image\\/2019\\/07\\/03\\/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\\\" alt=\\\"timg (1).jpeg\\\"\\/><\\/p><p style=\\\"text-align: center;\\\">\\u8fd9\\u4e2a\\u662f\\u5173\\u4e8e\\u6211\\u4eec\\u7684\\u4ecb\\u7ecd<\\/p>\",\"_token\":\"D2cxjP1wZyktosuquDPjqAsO4z3mHSZtRdogSATK\",\"_method\":\"PUT\"}', '2019-07-03 10:47:30', '2019-07-03 10:47:30');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/about/1/edit', 'GET', '192.168.242.1', '[]', '2019-07-03 10:47:31', '2019-07-03 10:47:31');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/about/1', 'GET', '192.168.242.1', '[]', '2019-07-03 20:46:07', '2019-07-03 20:46:07');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/about/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-03 20:46:12', '2019-07-03 20:46:12');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/about/1', 'PUT', '192.168.242.1', '{\"detail\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2019\\/07\\/03\\/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\\\" title=\\\"\\/uploads\\/image\\/2019\\/07\\/03\\/55afed62a9ae1e4fdd59c86e3af346b1.jpeg\\\" alt=\\\"timg (1).jpeg\\\"\\/><\\/p><p style=\\\"text-align: center;\\\">\\u8fd9\\u4e2a\\u662f\\u5173\\u4e8e\\u6211\\u4eec\\u7684\\u4ecb\\u7ecd<\\/p>\",\"_token\":\"UCEC73PrkOg7CxKGaX1kKbzq1mztLaLZuxCd4rdt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/about\\/1\"}', '2019-07-03 20:46:15', '2019-07-03 20:46:15');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/about/1/edit', 'GET', '192.168.242.1', '[]', '2019-07-03 20:46:15', '2019-07-03 20:46:15');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-05 15:59:36', '2019-07-05 15:59:36');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/virtuals', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-05 15:59:38', '2019-07-05 15:59:38');
INSERT INTO `admin_operation_log` VALUES ('158', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-05 15:59:47', '2019-07-05 15:59:47');
INSERT INTO `admin_operation_log` VALUES ('159', '1', 'admin/auth/menu', 'POST', '192.168.242.1', '{\"parent_id\":\"0\",\"title\":\"\\u73b0\\u91d1\\u5151\\u6362\",\"icon\":\"fa-money\",\"uri\":\"cash\",\"roles\":[null],\"permission\":null,\"_token\":\"dn2AI0B4QJQrcytS6slonaIpDLuZHbe6SUheZPEe\"}', '2019-07-05 16:00:44', '2019-07-05 16:00:44');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-05 16:00:45', '2019-07-05 16:00:45');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-05 16:00:47', '2019-07-05 16:00:47');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/cash', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-05 16:00:51', '2019-07-05 16:00:51');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:01:31', '2019-07-05 16:01:31');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:02:40', '2019-07-05 16:02:40');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:02:48', '2019-07-05 16:02:48');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:07:49', '2019-07-05 16:07:49');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:17:21', '2019-07-05 16:17:21');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:18:21', '2019-07-05 16:18:21');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:19:23', '2019-07-05 16:19:23');
INSERT INTO `admin_operation_log` VALUES ('170', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:20:18', '2019-07-05 16:20:18');
INSERT INTO `admin_operation_log` VALUES ('171', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:20:20', '2019-07-05 16:20:20');
INSERT INTO `admin_operation_log` VALUES ('172', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:24:59', '2019-07-05 16:24:59');
INSERT INTO `admin_operation_log` VALUES ('173', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:28:37', '2019-07-05 16:28:37');
INSERT INTO `admin_operation_log` VALUES ('174', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:29:22', '2019-07-05 16:29:22');
INSERT INTO `admin_operation_log` VALUES ('175', '1', 'admin/cash/10', 'PUT', '192.168.242.1', '{\"status\":\"on\",\"_token\":\"dn2AI0B4QJQrcytS6slonaIpDLuZHbe6SUheZPEe\",\"_method\":\"PUT\"}', '2019-07-05 16:29:24', '2019-07-05 16:29:24');
INSERT INTO `admin_operation_log` VALUES ('176', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:31:07', '2019-07-05 16:31:07');
INSERT INTO `admin_operation_log` VALUES ('177', '1', 'admin/cash/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-05 16:31:09', '2019-07-05 16:31:09');
INSERT INTO `admin_operation_log` VALUES ('178', '1', 'admin/cash', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-05 16:31:18', '2019-07-05 16:31:18');
INSERT INTO `admin_operation_log` VALUES ('179', '1', 'admin/cash/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-05 16:31:19', '2019-07-05 16:31:19');
INSERT INTO `admin_operation_log` VALUES ('180', '1', 'admin/cash/create', 'GET', '192.168.242.1', '[]', '2019-07-05 16:32:20', '2019-07-05 16:32:20');
INSERT INTO `admin_operation_log` VALUES ('181', '1', 'admin/cash', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-05 16:32:26', '2019-07-05 16:32:26');
INSERT INTO `admin_operation_log` VALUES ('182', '1', 'admin/cash/10', 'PUT', '192.168.242.1', '{\"status\":\"on\",\"_token\":\"dn2AI0B4QJQrcytS6slonaIpDLuZHbe6SUheZPEe\",\"_method\":\"PUT\"}', '2019-07-05 16:32:28', '2019-07-05 16:32:28');
INSERT INTO `admin_operation_log` VALUES ('183', '1', 'admin/cash/10', 'PUT', '192.168.242.1', '{\"status\":\"off\",\"_token\":\"dn2AI0B4QJQrcytS6slonaIpDLuZHbe6SUheZPEe\",\"_method\":\"PUT\"}', '2019-07-05 16:32:37', '2019-07-05 16:32:37');
INSERT INTO `admin_operation_log` VALUES ('184', '1', 'admin/cash/10', 'PUT', '192.168.242.1', '{\"status\":\"on\",\"_token\":\"dn2AI0B4QJQrcytS6slonaIpDLuZHbe6SUheZPEe\",\"_method\":\"PUT\"}', '2019-07-05 16:32:42', '2019-07-05 16:32:42');
INSERT INTO `admin_operation_log` VALUES ('185', '1', 'admin/cash', 'GET', '192.168.242.1', '[]', '2019-07-05 16:46:08', '2019-07-05 16:46:08');
INSERT INTO `admin_operation_log` VALUES ('186', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-08 14:48:13', '2019-07-08 14:48:13');
INSERT INTO `admin_operation_log` VALUES ('187', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:48:23', '2019-07-08 14:48:23');
INSERT INTO `admin_operation_log` VALUES ('188', '1', 'admin/auth/menu', 'POST', '192.168.242.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d3b\\u52a8\\u8f6e\\u64ad\\u56fe\",\"icon\":\"fa-photo\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"n21OeapxVN2BrXPffzUMO6YChqi1LdcNj7zPHCN6\"}', '2019-07-08 14:48:59', '2019-07-08 14:48:59');
INSERT INTO `admin_operation_log` VALUES ('189', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-08 14:49:00', '2019-07-08 14:49:00');
INSERT INTO `admin_operation_log` VALUES ('190', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-08 14:49:02', '2019-07-08 14:49:02');
INSERT INTO `admin_operation_log` VALUES ('191', '1', 'admin', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:04', '2019-07-08 14:49:04');
INSERT INTO `admin_operation_log` VALUES ('192', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:09', '2019-07-08 14:49:09');
INSERT INTO `admin_operation_log` VALUES ('193', '1', 'admin/auth/menu/11/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:14', '2019-07-08 14:49:14');
INSERT INTO `admin_operation_log` VALUES ('194', '1', 'admin/auth/menu/11', 'PUT', '192.168.242.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d3b\\u52a8\\u8f6e\\u64ad\\u56fe\",\"icon\":\"fa-photo\",\"uri\":\"banners\",\"roles\":[null],\"permission\":null,\"_token\":\"n21OeapxVN2BrXPffzUMO6YChqi1LdcNj7zPHCN6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/auth\\/menu\"}', '2019-07-08 14:49:20', '2019-07-08 14:49:20');
INSERT INTO `admin_operation_log` VALUES ('195', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-08 14:49:20', '2019-07-08 14:49:20');
INSERT INTO `admin_operation_log` VALUES ('196', '1', 'admin', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:25', '2019-07-08 14:49:25');
INSERT INTO `admin_operation_log` VALUES ('197', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:33', '2019-07-08 14:49:33');
INSERT INTO `admin_operation_log` VALUES ('198', '1', 'admin/banners', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:36', '2019-07-08 14:49:36');
INSERT INTO `admin_operation_log` VALUES ('199', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 14:49:39', '2019-07-08 14:49:39');
INSERT INTO `admin_operation_log` VALUES ('200', '1', 'admin/banners', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:41', '2019-07-08 14:49:41');
INSERT INTO `admin_operation_log` VALUES ('201', '1', 'admin/banners/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:43', '2019-07-08 14:49:43');
INSERT INTO `admin_operation_log` VALUES ('202', '1', 'admin/banners', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:49:46', '2019-07-08 14:49:46');
INSERT INTO `admin_operation_log` VALUES ('203', '1', 'admin/banners/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:51:24', '2019-07-08 14:51:24');
INSERT INTO `admin_operation_log` VALUES ('204', '1', 'admin/banners/create', 'GET', '192.168.242.1', '[]', '2019-07-08 14:51:28', '2019-07-08 14:51:28');
INSERT INTO `admin_operation_log` VALUES ('205', '1', 'admin/banners', 'POST', '192.168.242.1', '{\"link\":\"https:\\/\\/www.baidu.com\",\"is_show\":\"on\",\"_token\":\"n21OeapxVN2BrXPffzUMO6YChqi1LdcNj7zPHCN6\"}', '2019-07-08 14:52:29', '2019-07-08 14:52:29');
INSERT INTO `admin_operation_log` VALUES ('206', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 14:52:29', '2019-07-08 14:52:29');
INSERT INTO `admin_operation_log` VALUES ('207', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 14:53:03', '2019-07-08 14:53:03');
INSERT INTO `admin_operation_log` VALUES ('208', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 14:53:23', '2019-07-08 14:53:23');
INSERT INTO `admin_operation_log` VALUES ('209', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 14:53:30', '2019-07-08 14:53:30');
INSERT INTO `admin_operation_log` VALUES ('210', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 14:54:56', '2019-07-08 14:54:56');
INSERT INTO `admin_operation_log` VALUES ('211', '1', 'admin/banners/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 14:56:30', '2019-07-08 14:56:30');
INSERT INTO `admin_operation_log` VALUES ('212', '1', 'admin/banners', 'POST', '192.168.242.1', '{\"link\":\"https:\\/\\/www.baidu.com\",\"is_show\":\"on\",\"_token\":\"n21OeapxVN2BrXPffzUMO6YChqi1LdcNj7zPHCN6\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/banners\"}', '2019-07-08 14:56:48', '2019-07-08 14:56:48');
INSERT INTO `admin_operation_log` VALUES ('213', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 14:56:49', '2019-07-08 14:56:49');
INSERT INTO `admin_operation_log` VALUES ('214', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 15:02:00', '2019-07-08 15:02:00');
INSERT INTO `admin_operation_log` VALUES ('215', '1', 'admin/auth/permissions', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:24:10', '2019-07-08 15:24:10');
INSERT INTO `admin_operation_log` VALUES ('216', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:24:11', '2019-07-08 15:24:11');
INSERT INTO `admin_operation_log` VALUES ('217', '1', 'admin/auth/menu', 'POST', '192.168.242.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d3b\\u52a8\\u6587\\u7ae0\",\"icon\":\"fa-file-powerpoint-o\",\"uri\":\"articles\",\"roles\":[null],\"permission\":null,\"_token\":\"n21OeapxVN2BrXPffzUMO6YChqi1LdcNj7zPHCN6\"}', '2019-07-08 15:25:11', '2019-07-08 15:25:11');
INSERT INTO `admin_operation_log` VALUES ('218', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-08 15:25:12', '2019-07-08 15:25:12');
INSERT INTO `admin_operation_log` VALUES ('219', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-07-08 15:25:15', '2019-07-08 15:25:15');
INSERT INTO `admin_operation_log` VALUES ('220', '1', 'admin/articles', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:25:17', '2019-07-08 15:25:17');
INSERT INTO `admin_operation_log` VALUES ('221', '1', 'admin/articles', 'GET', '192.168.242.1', '[]', '2019-07-08 15:26:47', '2019-07-08 15:26:47');
INSERT INTO `admin_operation_log` VALUES ('222', '1', 'admin/articles/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:26:50', '2019-07-08 15:26:50');
INSERT INTO `admin_operation_log` VALUES ('223', '1', 'admin/articles/create', 'GET', '192.168.242.1', '[]', '2019-07-08 15:27:12', '2019-07-08 15:27:12');
INSERT INTO `admin_operation_log` VALUES ('224', '1', 'admin/articles/create', 'GET', '192.168.242.1', '[]', '2019-07-08 15:32:37', '2019-07-08 15:32:37');
INSERT INTO `admin_operation_log` VALUES ('225', '1', 'admin/articles/create', 'GET', '192.168.242.1', '[]', '2019-07-08 15:33:00', '2019-07-08 15:33:00');
INSERT INTO `admin_operation_log` VALUES ('226', '1', 'admin/articles/create', 'GET', '192.168.242.1', '[]', '2019-07-08 15:33:04', '2019-07-08 15:33:04');
INSERT INTO `admin_operation_log` VALUES ('227', '1', 'admin/articles', 'POST', '192.168.242.1', '{\"title\":\"\\u9884\\u552e\\u6d3b\\u52a8\\u5927\\u916c\\u5bbe\",\"sub_title\":\"\\u706b\\u7206\\u9884\\u5b9a\\u4e2d\\u2026\\u2026\",\"content\":\"<p>\\u8fd9\\u662f\\u56fe\\u6587\\u5185\\u5bb9<\\/p>\",\"_token\":\"n21OeapxVN2BrXPffzUMO6YChqi1LdcNj7zPHCN6\"}', '2019-07-08 15:33:27', '2019-07-08 15:33:27');
INSERT INTO `admin_operation_log` VALUES ('228', '1', 'admin/articles', 'GET', '192.168.242.1', '[]', '2019-07-08 15:33:27', '2019-07-08 15:33:27');
INSERT INTO `admin_operation_log` VALUES ('229', '1', 'admin/articles/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:33:30', '2019-07-08 15:33:30');
INSERT INTO `admin_operation_log` VALUES ('230', '1', 'admin/articles/1', 'PUT', '192.168.242.1', '{\"title\":\"\\u9884\\u552e\\u6d3b\\u52a8\\u5927\\u916c\\u5bbe\",\"sub_title\":\"\\u706b\\u7206\\u9884\\u5b9a\\u4e2d\\u2026\\u2026\",\"content\":\"<p>\\u8fd9\\u662f\\u56fe\\u6587\\u5185\\u5bb9<\\/p><p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2019\\/07\\/08\\/65374e6a3ff4e10af88871dbb001a2a8.jpeg\\\" title=\\\"\\/uploads\\/image\\/2019\\/07\\/08\\/65374e6a3ff4e10af88871dbb001a2a8.jpeg\\\" alt=\\\"timg (2).jpeg\\\"\\/><\\/p>\",\"_token\":\"n21OeapxVN2BrXPffzUMO6YChqi1LdcNj7zPHCN6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/articles\"}', '2019-07-08 15:33:43', '2019-07-08 15:33:43');
INSERT INTO `admin_operation_log` VALUES ('231', '1', 'admin/articles', 'GET', '192.168.242.1', '[]', '2019-07-08 15:33:43', '2019-07-08 15:33:43');
INSERT INTO `admin_operation_log` VALUES ('232', '1', 'admin/articles', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:33:46', '2019-07-08 15:33:46');
INSERT INTO `admin_operation_log` VALUES ('233', '1', 'admin/articles/1', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:33:51', '2019-07-08 15:33:51');
INSERT INTO `admin_operation_log` VALUES ('234', '1', 'admin/articles', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:33:55', '2019-07-08 15:33:55');
INSERT INTO `admin_operation_log` VALUES ('235', '1', 'admin/articles', 'GET', '192.168.242.1', '[]', '2019-07-08 15:34:41', '2019-07-08 15:34:41');
INSERT INTO `admin_operation_log` VALUES ('236', '1', 'admin/articles/create', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:34:48', '2019-07-08 15:34:48');
INSERT INTO `admin_operation_log` VALUES ('237', '1', 'admin/articles', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:34:49', '2019-07-08 15:34:49');
INSERT INTO `admin_operation_log` VALUES ('238', '1', 'admin/articles/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:34:51', '2019-07-08 15:34:51');
INSERT INTO `admin_operation_log` VALUES ('239', '1', 'admin/articles', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 15:34:54', '2019-07-08 15:34:54');
INSERT INTO `admin_operation_log` VALUES ('240', '1', 'admin/articles/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 16:37:19', '2019-07-08 16:37:19');
INSERT INTO `admin_operation_log` VALUES ('241', '1', 'admin/articles/1/edit', 'GET', '192.168.242.1', '[]', '2019-07-08 16:40:59', '2019-07-08 16:40:59');
INSERT INTO `admin_operation_log` VALUES ('242', '1', 'admin/banners', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 16:41:00', '2019-07-08 16:41:00');
INSERT INTO `admin_operation_log` VALUES ('243', '1', 'admin/banners/1/edit', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 16:41:05', '2019-07-08 16:41:05');
INSERT INTO `admin_operation_log` VALUES ('244', '1', 'admin/banners/1', 'PUT', '192.168.242.1', '{\"link\":\"1\",\"is_show\":\"on\",\"_token\":\"n21OeapxVN2BrXPffzUMO6YChqi1LdcNj7zPHCN6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/pointshop.me\\/admin\\/banners\"}', '2019-07-08 16:41:32', '2019-07-08 16:41:32');
INSERT INTO `admin_operation_log` VALUES ('245', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 16:41:32', '2019-07-08 16:41:32');
INSERT INTO `admin_operation_log` VALUES ('246', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 16:44:12', '2019-07-08 16:44:12');
INSERT INTO `admin_operation_log` VALUES ('247', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 16:44:15', '2019-07-08 16:44:15');
INSERT INTO `admin_operation_log` VALUES ('248', '1', 'admin/banners', 'GET', '192.168.242.1', '[]', '2019-07-08 16:44:48', '2019-07-08 16:44:48');
INSERT INTO `admin_operation_log` VALUES ('249', '1', 'admin/articles', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-08 17:11:29', '2019-07-08 17:11:29');
INSERT INTO `admin_operation_log` VALUES ('250', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-07-12 13:17:22', '2019-07-12 13:17:22');
INSERT INTO `admin_operation_log` VALUES ('251', '1', 'admin/banners', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-12 13:17:26', '2019-07-12 13:17:26');
INSERT INTO `admin_operation_log` VALUES ('252', '1', 'admin/cash', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-12 13:17:26', '2019-07-12 13:17:26');
INSERT INTO `admin_operation_log` VALUES ('253', '1', 'admin/cash/12', 'PUT', '192.168.242.1', '{\"status\":\"on\",\"_token\":\"oR4bEFqrNMifVOg32lOPB5FotuFlLcuTUEZzBEJ3\",\"_method\":\"PUT\"}', '2019-07-12 13:17:29', '2019-07-12 13:17:29');
INSERT INTO `admin_operation_log` VALUES ('254', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-09-02 08:48:34', '2019-09-02 08:48:34');
INSERT INTO `admin_operation_log` VALUES ('255', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-09-02 08:48:35', '2019-09-02 08:48:35');
INSERT INTO `admin_operation_log` VALUES ('256', '1', 'admin/auth/logout', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-09-02 08:48:45', '2019-09-02 08:48:45');
INSERT INTO `admin_operation_log` VALUES ('257', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-09-02 08:54:36', '2019-09-02 08:54:36');
INSERT INTO `admin_operation_log` VALUES ('258', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-09-02 08:54:38', '2019-09-02 08:54:38');
INSERT INTO `admin_operation_log` VALUES ('259', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-09-26 23:57:23', '2020-09-26 23:57:23');
INSERT INTO `admin_operation_log` VALUES ('260', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-26 23:57:28', '2020-09-26 23:57:28');
INSERT INTO `admin_operation_log` VALUES ('261', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-09-27 00:00:00', '2020-09-27 00:00:00');
INSERT INTO `admin_operation_log` VALUES ('262', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-09-27 00:00:06', '2020-09-27 00:00:06');
INSERT INTO `admin_operation_log` VALUES ('263', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-27 00:00:07', '2020-09-27 00:00:07');
INSERT INTO `admin_operation_log` VALUES ('264', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-09-27 00:00:35', '2020-09-27 00:00:35');
INSERT INTO `admin_operation_log` VALUES ('265', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-09-27 00:01:09', '2020-09-27 00:01:09');
INSERT INTO `admin_operation_log` VALUES ('266', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-27 00:03:49', '2020-09-27 00:03:49');
INSERT INTO `admin_operation_log` VALUES ('267', '1', 'admin/banners/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-27 00:04:40', '2020-09-27 00:04:40');
INSERT INTO `admin_operation_log` VALUES ('268', '1', 'admin/banners', 'POST', '127.0.0.1', '{\"link\":\"1\",\"is_show\":\"on\",\"_token\":\"aaUNfuHsrvMysVKjYsJCbzRpSzIDkmup5jD8wGfH\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/banners\"}', '2020-09-27 00:04:52', '2020-09-27 00:04:52');
INSERT INTO `admin_operation_log` VALUES ('269', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-09-27 00:04:54', '2020-09-27 00:04:54');
INSERT INTO `admin_operation_log` VALUES ('270', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-09-27 00:07:15', '2020-09-27 00:07:15');
INSERT INTO `admin_operation_log` VALUES ('271', '1', 'admin/banners/2', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"aaUNfuHsrvMysVKjYsJCbzRpSzIDkmup5jD8wGfH\"}', '2020-09-27 00:10:19', '2020-09-27 00:10:19');
INSERT INTO `admin_operation_log` VALUES ('272', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-27 00:10:19', '2020-09-27 00:10:19');
INSERT INTO `admin_operation_log` VALUES ('273', '1', 'admin/banners/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"aaUNfuHsrvMysVKjYsJCbzRpSzIDkmup5jD8wGfH\"}', '2020-09-27 00:10:22', '2020-09-27 00:10:22');
INSERT INTO `admin_operation_log` VALUES ('274', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-27 00:10:22', '2020-09-27 00:10:22');
INSERT INTO `admin_operation_log` VALUES ('275', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-27 01:40:11', '2020-09-27 01:40:11');
INSERT INTO `admin_operation_log` VALUES ('276', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-27 01:44:39', '2020-09-27 01:44:39');
INSERT INTO `admin_operation_log` VALUES ('277', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-27 01:45:49', '2020-09-27 01:45:49');
INSERT INTO `admin_operation_log` VALUES ('278', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-27 01:47:43', '2020-09-27 01:47:43');
INSERT INTO `admin_operation_log` VALUES ('279', '1', 'admin/banners/3', 'PUT', '127.0.0.1', '{\"image_src\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQAAAQABAAD\\/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD\\/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD\\/wAARCACYAV4DASIAAhEBAxEB\\/8QAHQAAAAYDAQAAAAAAAAAAAAAAAAQFBgcIAQMJAv\\/EAFEQAAEDAwIDBQMIBgcFBAsBAAECAwQABREGEgchMQgTIkFRFBZhFTJWcYGRlNEJI0JTobEXM1JigpLBJENjcuE0RoSyJTU2VFVkc4OTosLx\\/8QAHAEAAQUBAQEAAAAAAAAAAAAAAwACBAUGAQcI\\/8QAQBEAAQMCBAMEBggFBAIDAAAAAQIDEQAEBRIhMQZBUQcTIjIUI2FxkaEVF0JSVIGSsRZiwdHhJNLi8DNyQ4Ki\\/9oADAMBAAIRAxEAPwDndpZHfats7aQTunM5\\/wAwroI3\\/VpJPRIqhvDKCbjxDsMRAJK5rZ5DyHPP8Kvik7UBJ8q947MW\\/wDRPrPNf7Af3rzjjFc3DSOif61sSsp6Gtm4kc\\/WtKACcDPPpXshXrXpZrIV6KsHFZHrWvByCo5rbSpw01rKSa2VrT1r1u+FMUKfIr3nlisAn1oUARTYpTFAnqTROQvcQPLNGXDy5UUdAxkdc0RApijSlEQnalWcUyuNrIOn4m0FQEjy65Ip5wncowMchTe4qxHJOj3ZCElSojiHTt8hnB\\/gapsXY9ItXWfvJUPiDU\\/D3e6fbWORH71F1gjOmEl\\/0byAT93WoH18gt6skAggKX51YSzpDUEFxI8KeW84yc1AfFJKm9VuFSSncQrGPWvm1mQlQr11zWKX9BLR3yAoZCOeKnXhooS5OoIyRuL9okOIHnuSAf8ASoD0C4DLSSeQSanng+EnV7kYKH+02+S3gc\\/nNqx\\/KpTmrJnpQEGFikfW2lJ3EV9rSFvmttSL6uFHZceJ7tC3CtIKvgMiky7fowO0nAJ9gGmp48tlw7sn7FpFDV78hNjZcgvrSowEqDjailSChafECOYIzUZ2vjTxgsCkptXFLU0cDoPlR1Q+5RIqmqwroZ+i\\/wCzhxc4Dal1w5xK081b2rjEjIjONSkPJcUlaiQNp+NN7X1u1OviNqJN0sMeVb1XGUWQ8yl7mVkJBI5gZINOH9F1xc4k8R7vrWFrvWM+9twIsZccSloUUFS1A9AD5edHtaXlTetb8kLyE3GQnr1\\/WGspxNcKt0oI5moN68WgI51Gt\\/naLsubOO5jiEFRFOMLC1B84KlbD4gOWArNabPBmOKcRY9QR5MaQ0HExpSe6xyVkJUvkoA9cHIp4vx7Hc1lyfbYzqlZyspG\\/n8etJDugLRJCWbfdZkZlIUO43haMKIJAz06eVZZrEGssL0PxqIm5TEUbskl3SV3gvXy0N\\/Jz7gQ53JKkNjAKiFEnzzyz051P1k1XpHU8pVn0xeGn1d38xPh2j0Sfq8qgwQbhYNK3GBZIDMmdLWCHGykLUCRkgK5DanH21H78zVFotlwvctmdDdtIwlLbZbLkjd4cKHzvDzUQMdKtbLEEFJESJ+VTre9HlO1WA4j8LlzWVzoUKNNfbG54vtfrFJA5bVjnkVDkHRDkuBJuFsbnW72VSoSTHcKlOOKVkoQ2SFJV6nPrRqNx51hqSJbLXInTbeGWm0KeaZQ6ZSysjxegxy5j9k0tQp7EiayzIvUe5+zBTr0VlxLilSQAEoSPIk+nQcqNdpbB9XpUhzu1+WmSWr9JVPjzL5HuUhvdGagy+SgcYDZKv2QPRXOkSzNzLfercpzSHyLLSFtMy4zithcUAEKOcpO0AqHPlU2ytN2BmJPtrhFunKdbKI6TkSSs+IYPXCsg9BXtnhy5DcYuDEmSzHS+srD+G0yngMIbR+zjngmorjISIUNP+9NPlQi2Ipj2RXFOM2qRZr89KiLllAVcUKBWn9pSRnmBjPWpNkcYL\\/pFoR5egZd2iRW0hyVEa2qUSCSUgjBH21Hl0ga4c7q+SrSw\\/GiurbSRIAKe9VySjuj80bRnPnSPc5sG4Q4lncuE+El191ZbjvF9Tj3JI3AqCkAEHaPrqOi37k5kgT+X9KaEBJkb1JVx1zoG7GMdSMxokiYz7QGZjYC20E8iv8As59T1x8K8O6O0FeoipFrgQ3G8HxxnSc\\/AbTiozRHfuzkqA7fLXdWFIG9ua94yUdE4wCSTkAZ9a32e7xNJSFqVaJEF+UyQ020wtpDXhA3bV\\/OJPxwcVWqwxSUlSF6\\/wDeutR1WiCZO9OmTwps1yecdgTvk9wIGGV+MD4nzGfWmhdOHus4ZU2xa3JWQQlyJ+sBx5kVJWiNJ3WBC+UL3qRyU\\/JG4GS0EhpJ5gcuf2GnU0pbGWlPpUEgkKA5FPrVa6txleoBqA\\/ZIWcwEe6qwNwr7ZXHIMjvFO7slt9stlPqK9RZzroeU5CUVsu4BUBgjrkZ8qsw\\/Gt92AEmO1JBI8SkBWD9tJt74aWXVS1vuR1258oSO8aQACAMfN6eVJN2lW+9Q3bZSASDrUCPcQLRYn46LxckstyiQ0VHkTmnO1dGXWu9juJcQoZCkHINedbdmG83Qsm3SbbPabVnu3wW1p\\/5fKmDcdH8V9FXR9qVZJjdkQ3jvG2C4hA2\\/OCk55irJDDFwgBtQCuc04Md6gKSdakeDOCUKJcxuNFb7eFRmMh3mB4cHJKvgPuqI7BrBej9OzLtqLUUi8RzJDbe2OUuM+oVkcqVomsI2o9ZadtMKI89EvCkOJk9EoR55+6is4ctbwSNRO9dtmHFO5I5xNTboeOL3PatL0hLYs0dpZOOYkdeY9dylH60irJ8O4bcC1qKSlPzUDI8h1\\/jUK6U0rbtOPLZhtOLW8+ua++4rKlKJyST9vIVJFj1FmMGWFeFHX663jCcqNK3KhkAR0rkp2XtOpumvHLy6jc3ao5Wn0Di+Q\\/hmraDOagrse2J2TZNQXNtBIDgKyMDCUJ5\\/wA6ncvxUgbScq519TcB26bfBW43VKj+Z0+QFeMcSuF7EVzsmB8v71tSnpXrPlWn2ppJ5uY+usGfGT\\/vAT9VbKFHlVGCIrYoEnIPSgFA8ia0mZHT1dGDz6VgTIo\\/3oruRXSmkijaBjlXqinyhFH++H31gz2P3o++ud2rpXcwo3urOfjRRMyN++H3Vkzo4H9cK5kPSuFU0ZXnHKtCkk9RyrWZbGArvgM\\/GsmXGIwXB99dCSKaSKyw4WnRnoo4FbdUPtNaZnKdwptTJQUnoc0TVKjq\\/wB9jBpM1pOS7paQlLhV3fM49KG81mIJGlEaUAYqP4Lqmo4bbAShSVEk8zgVCfGFBTqdLpOdyEn+NS5B\\/XRWTyG\\/PNfTmai3jWylF3irCioFsc8+hr5iukJau3m07AqHwNeyNKKrdtR3gftRTRi9igckE4HKp34MylNcQLeUqJ3KDXTkdwIx\\/Gq\\/aQXtWkAk7iMfCpw4dvGJq22up5bX21H68ikDmbIpRBmky+EGA9HdVksNzGPD6ocJA\\/hUGTHe6U6VcsFWCfUVNutt1uv99tZ5d1dJzJRj+0VEfzFSXprsmcOtcaLs+olXG4xpNzhNSHkokcg4pOVYGDjnVIATU8mn9+hnlPytScR1OrKsRYuMn++ql7iBcy1r3Uac8hdZI6\\/8U1Kv6Pbs7Wbgfe9XybRe5c1F0YYSUP7Ts2qJ5EAZ61BHEmYU8R9Tp9LvKA5\\/8VVZPidouJQKgXqc6RR1i7qUclfLFKEe9ADmf40wxMGc7jyPlRpu4rByTWJWwRVUpBFSExek7gQrn65pQReG3E925tWkjG0gEEemDUcs3RQwTkA0fZuO4ZSs8qAWSKaARtT0hQdNMyDIZtLDLxcU9uS3jxkEbs+vM007zwwckttS7BqDbKiblRg8ggJJJIGU8xzPXnW5m8qSQConl51ti390yFtHkhIGCT1z8KK3cvsHMk0Zt51s6U203TjHpa4uXM6cFycQOUlLwe7wddoBG4DonnjGCaO6m47ONXBu33ezPxnLenZ30NxST3mMlRQfCAcq5\\/3adbV3dz3qHMHyBNeX51vntqbnQmXAQUr3tjxZGPTOMVOZxhSSCtO3TSpCMRUNxSajXdiYuDTcfUEaLc0pb2xXnSwClwBRJx4cgDoPXnT00i\\/pi4yhdpzTKl9yptC3dqlF9W4EoUkfNxjnnzqNL5w20tqK5KvCkezTHiVFxpO8hXLHhPLHKkheg9VWeU05p7UO4JfXjILZ2qxkrOccsDAHXJ9KnpxC3fAClQfaP61MRdNu6k1JSdP6S+Wo9oYtEhtRmOKU2ytLyHAgDyPi255J+2pUs7luvtucCW0utsK2KbcZxgjkUjPpjH2VDOmGtQwb9L71jeoAMtS3FYW8NgKlIx0Tk45nrmnZHVLs5S80y62nHNtCNwz65HrUS9uUOCAa6p1pR0NSBJQWXEILaG2igHK8eH0zRV2IuRJKY6GitR2qxzVgj4UkR7q5eVbFr2uOJCVb0EBIAp5WARYERtCn2nX1DDjoGN5x\\/CqZSQajrdSNAdaKQ9Kx4TgdcecKgQraD4aV1IGzJSduMUcSqOvxKIBPlnpXruWljko0BbIUZqC4hThzGk5DZIyM1hxsFBBAx559KUlQSQTnl5Yoo5b577haiJSpwjw7uQHqSfIAUksKWoISNTQgwpRCUjU1Detbfada6ie0uqxRk26LgzJQbSC651LY5eQwSfiKiew6TatPaE93YLy1QY0JMhlnb4UIPIcxyB5VO1xehquUp6AgJjhZQleP6zB8Th+s5+zFNzQ1niPX+8a7eyp65uiHFKk42RWTtBH\\/ADK3H6sV6JY2jdq0Ega9fbWwYsGrdCQBqKeVyUuDHedT4nZCg20PjTg0\\/alRIacpKiocz60kw20z7qN3iTFwoj+8f+lPSKyEt4SkDH8quWxoKKreudPZdDtq4NPTEFCRcri+yT+0QkJ5fxqRQ53igdx+r0qHuz\\/dCnhbFgbylLc59wfAkjnUmR5uFhaVZI619d8I22TBLdQ5oH7V4bjas1+77zS0WUZBWCM9Ca0yWWwkEHOenOtMi69+lIAHhHOiL0xS8DPIchitE22s71VUcdAAG0\\/XWncPM0VD5zgnp61nvM9CPvqSEECK4RNGsA868lQHkfvov3n94UCskZyPvruU00g0YSodSMGvSVI5knn9dEw6onqDXrvQOu2uFFNo3vQcDHLFYK88gKKKeTj0+qvKZCQoEGl3dLejgxu+d9lE9VpfZ03OQtpSQ80MFQxkZ6ivffgq8JHxzSvqC5tP8I7+0+4lUlh5ju1KGSGyeg88Z+NQMQWplqQJBMfHnUi3bC1iobt0ptNtjoW64k7QDyHLJ5fzqOOMikqdhq8SiARknPnTok2S9Pwm59uu5xsDiIy2wUHHxHOmnxPdalWi2SW04KgQc+R6EffXyteq\\/wBa9\\/7L\\/c17OxrbI9w\\/akjSBKnhjmBjFTXo5Yav0J1w58aCPLzFQvoZtb76UIHXGT6VMmn1lNyigAHu0gk49DQ0HwwK6qvPGltqHxK1E2s7SuezL+sONJV\\/MmlPRPHG6ab05b7P7vOSmYbQbS8ltWFAH1Sf9KT+0ilDHFJyQU7UzLVBe5ftEIKSf\\/1pE0fIbbsiG1ghbTq0nl8eXP6qqiQDFTBqK6Jfo\\/OKKeINy1Uwi2uxFRY7KiHHFqzlR6bgKr5xPZc\\/pF1MtI63eVj\\/APKqpj\\/RputPXfWAQkhSYzAPPl881XniNxQ0z\\/Snqy3SJHs7jF7mNneORKXlD\\/Ss9jbanEpKRNRrkEgQK8LSraN2frrX7SGzsKq9RLtb7hhUaS28k88oUDitj8RiS2ptJCSeYPnWXUiNFCogSnnSfMnPhP8AsjyUhJ8efq8q32m\\/+0NgLKgehUfOk+626egB6O6lS0jG0jIP1iiFzjToymXmnlNAp2rQlPgJP18xTxbIWKL3SFiDTxVd0NslRdUPIHPKkN7iJaWJi7V7VsmNuBn9aOSioZG0+dNVZuDAaRKmoKFkhHUjPpmka+6Thz31SHJHcy1AEuoVnry5D1pzWHM5oeOnspybJvc1NUHVcaQxtkOIyDglBJT\\/ANaPs3mO8934eSA2CCBnBzVckWnVNiDblpnrkJYVuJU4cYPwpyK1vcICmVSYy3A83lxCU+Hd1Jz9lDdwYf8AxEEVxdkk+Wp+jXhtLpKMfXnNGnroh1ooS+EFR6g+dQtK1szb0x0iUG\\/a\\/wBYUrPhSkAEgkHlStF1Ml9W62SErUAFKG7IwfLPmKr1YW4nU7UD0DmDUzQLs6EIJcyQPEnNK7F82gKCz9RHSoYt2vW3HVRpDKmnm+qQrOQPOlqPrWOUlTSHVqRjvEBOSkH1qEuzcQdRUddo42YIqX49+wnJV4ledHo99GQNwGPMHFRhDv7b+0oeBGM\\/VSk1eEE5Dgz1xmg92sb1HKVpOoqUYupFIIHe5HxNLEbUxI+cOXxqI2Ltz3bqORr+OYSsnHI0PNXAoiplj6i3gJ3Ci+o9fIsmmJzEMoNxuykW6N6pC+bih9SR\\/Go2Z1DtRkqxyppWO+ydVaukTXXd8K1lzuwOneHl\\/oau8CR3tzmH2dat8IR3z8q5U4rxc\\/Y50fT0NorelMLWkpPJpCAMkj4lWKLah1uzpaHAtltQJE+UoNxWCk4SB1JA8hTVtM6Tdtb3m8oW4PZhHt7QGMKAyt3BP95YH+GnPKkQ7rqeIt9pChDyEqA55+utyluTrWlWogVJehWX\\/YWpEwYlPYcez\\/aPUfZT7jsnb1ppaZdSsJ8xT9gxwpvJFSRpQQMxrkJwSuIa0iI+8jbIWf5VJbF1weTvX41BfDKeti1ORUq27XFKJ+BxT8TeWUtbi\\/lzpsAJx9tfUnCeMNDB7dsnZIHwrx3GLNSr1yBuakEXVROEuED4VsFwWlP9Zy+NR0b2+tWA8W0gfsnBr0i4pUrK1lZ+Kia1beMNxVX9Hr51IvykFncqQjP\\/ADCvSbigcu\\/R\\/mFMBNwTjKcfZyrciYkjO6jjFW+ornoCutP1M4KOEupP1EV69oXjBxzphpl58+XwAr0ma4kna44n6lGiDFG\\/ZTTYr5U+hIUrOV4P3V5Mledu\\/wDjTNF5ltglEtf2gH+deRqCaOanEL+BGP5V1OKM0M2DlPEynB+1mvBmKByqmmNTBIJebUn4pOaOM3JqYgqYkhZHUZ5\\/dTk4m04cqDrTTZrQJUKcKbgN3ziKT9UXhxGnZbCXMB1SAR686R3pbzKVEEkikK53Ga8kx1BagsghIGeflULEsQQ1bL7zTTfpRre1UpxOTU0SZueoZcBu3WqCzHSlvu\\/bHV7sJJ57U468\\/wCFNzijCjwLBbokdRKWfASepOOv2k07o8mHZrU2i5mMlzzS46gKzz5YzmkO96igyHG1tNWqS+lWW1TCpTTJPmlAxv8A8R+yvlS+cb9LdWDIKlfM17BboUWEJjkP2FNrh9ElKcLqYUl1I25U22ohODnmQKk6BOVanRIksBCBkAuPNoP3FVHbBZ+GdyhNy9ccTbvcFKSD8l2xr2OMn+7hOAfupU+Wez3Ymz8n8LTOCfD3kt4rWo\\/bVOrE1IVlabUo+wf3rV2vC6Xmw9cXTTYPVYJ+Ammhxl1xZteX22XC2upaXEtTcF4OOIO5aCogjaTkczWjRd8VbYr8Vv2N1K3y4EunJINOzV+reEGnrZabpfeC0JuJdkrEVSG0lWEYzkjB86I6chdnjX61s2uy3ywSUJCyuI+vCQSQDtUSD0qCrEVJV6xlQ+BqwHCbDo\\/01+yo9MxH7irx\\/o2ZyJt51goQI7BEWPlTJ+dhRqjfHG0A8X9aqUg4VqCec4\\/+YXV6f0cej7XpW96vVZ9Ym9Rn47ASl6MG3mvET4iOR8vKoh4v8KGp2vNRSjHBU9dJThO31cUaa6+l1IWjY1m77D3sPfNs9GYRsZGokQRVO2m50F3dDkvMkcwULIpftvEXVlq8C5KZLQ8nRk\\/fUiXjhE+yVLbbUCPhTOuOhLjEUcs7x8BURYbX5xVetkHcUsW3jJBVtTdILjJxgqThSadkDWembygIZnMOZAwlZwc\\/bUOyrE81ycZUk+uKTF20pJIyD545fyqKrD2V+XSo5t0nymrDLhwZTIb7tsoJ3YwMUQd01EKgtDYznPi51CcC+6lsikiBdX8Z+atRUPuNOi28X7vH8N0gJdSORWg7SfsqIvD32\\/8AxmaZ3TqT4TT1k6b9nhOpZQS4rqQrHLzNEmrJGXBRHCXVJGSSTzBxivdu4paZuQDTzyorhHMOjH8acMOXbZacRX2lp8tqgciox71vRYIpveLToaaK9GW2c065KZcCwkobUlXPp1NIatL3uHDeEO47QFFQ2L2q2jpUoGE0tJQkAAjHWiztpUUbEoSo\\/wCnpTmrtaefxpyLk7GmJYkagamIVdXEvtKQVoWfnBWTyyOoxil5u5ONblw3cPbilwFRwazIiuR8q9leYSOW08xjPUEUmKeZivOOqylDytu\\/HzPrpyh35mKPmDhp2s31CU92pWXEYP18q2s3OQzMLjDhS2cBKEqOcimnAWpWHVrTzOAScDH20uN92ySsg8uYG7ANQl2+SdKbliQac4vU+IkqakrBA5qJCgK327U13S8XZC0uRylJ2BICt3mQaaHygWnVBKspVg4PPzrdb7tJJWZcYMhCylI3g78dFfVURVoI1FALaYgin9N15CYgSnEuKQtDRKQvA8RHStuhJzNo4cypsd9CpziS46N3MKUTjP8AGoe1ffIb8R2GdgW4oJ8I54HP76dGgt0nh1ImIVtMmV3SW0nxFCRyz95q8wezTbtlzrVphbKWUkgb1K2lYsu26cgKdUgreQuU+SMK7xas9PLqKcGn7O45IEt1OTu8\\/M0nPw3rjfYUeGkoQ22lx1CeSVDGAOVStp6xsobbDyQSkDP11oERU9Zk0vaVtknu0L5JB8yKkm1x47DWHRvWevpTYtjSUsoQnAApxxVEApAPKiKANNTvXE7T1rRZ7XKmPLDY24BUeRPUCkD35k7ztty+R\\/ZWf5GpWbt6FaYfi92ge0YwFjIKh50wBphcdewY34G5ScYPxrV2+J31onJbuEJrPO2du+cziZNEUazW8kqcssklP7Ta8ZpSi6pyEk2y5NhY5btpApQgacl\\/J3tUlpptZV4UpeJSR5fbXpNiKUpW5c2GEkEnc9nJz9VTUcQ4mN3PkKCcNtNgn50XXqN5HiS1Kx\\/ebTRmNrctHD8Qug+o24o6nSzzDKX13FtbCjkr70AUYt9mizXSiK7Fc2qSlW14f61KTxJfnddB+i7fpXljXttwEG0vZPnv5fyo2jWkIjYLU7z\\/AOIPypXZ0W2Xu6UwMg56Upt6AQoDaztBIyc9af8AxHfD7Q+f96b9FsdKaatUMK\\/q7afqMhI\\/nWtzUTqk4RYlrx1xJbpzTdA7BlLfI8txI5fAii6tDNIa3thJyOfPrTxxRfcyPjXPolnpTOk6wKEKS5p15J8iJDf50mua1noWHoVhk7k89yVBZ+3aadcvQCltd5koznl5YpuyNEqbUXGwQUnkR5URHE12TKvkf8VxWFsgRTz0RqQ6pt8h242WVCeiAhSltkNrXz2jJ55PKnBG0FpKzQW9RcX9USW1SgHGbfDe7pIbPMBSh4jyx0pF0S7Fg2OfZr5FfkFxXfxXUryptzGMkE8xTY4wT5N0gwmGbTJX7O2A9JUdyMDknakdMADrVLxLxHiuOgW7yiltJ5cxG55SDPKtVgVhgmBZbtKA84pHlMwlebY7GIgjU1Mmnr92eLZIal6d4dtTXmBhL7jqnACfXcTk\\/WKU9UcWNDIiKmTOGUCQ0gebSVnGPiKpxCuKmHkuNynIz39pC9qh91ONrXupDFXb57rM9hXLLgG7Gf7Q51kE4awo+uUon31qVccXzMpsmm209AkR86sNZ+I\\/Cm992tvhPbUOu8m0hsJJPwxW6bq3hUJCokvhY0FgBaUoyD5\\/H4GmpwasbWtGPeOJYpUf5IuDTbncrK2kJ3NjJ9M7jUh8T7OhEwOdylHdsZztwSS4f4V0WFtoEKVI\\/moC+MMRUfWttEHq2KZmqNXcEddW2Dpi\\/wCnLlDatjji4qW3FIU0pfzsddw+HOsaN0ToyFIXM0LqgzUqb2GJJ2h1ODkY\\/wCtNvihZ2G+HDdzLITIj3NtAcAAICh0z91Rpp\\/VWomJ8dmKgyXwSptwY7wbRkgnzGM0lWzjcqbcM+3UUMY7Z3fgv7REHmgZFD3QYP5iup36PFJTfdYNLSpLqI0YLSRzB3GnlrPSYlagujoT8+W8rmPVRqMf0YetGNZydWTFJ2S2ozCXhjBICjgn41Yy+QUqu01R5EyFnH+I1xYUtIzCDVO8y0w+pDCsydCDzg66jkeo61BNz0Cy4CTFSf8ADTOuvDKO\\/kpYSk\\/8tWNftQWgnZ59aTJFgbWSe6z9Q51HU0DvTSkEVVG98JmXEkKjA\\/HFR7fuEOxR7poirsT9Ktq+a0cf8ppt3PRLS0ndHJJ+BoZbA2oZaSaondOGs+Nu7tonH2015mmJ0YHvIq+R9KvJdeHLCwrEbn9VMq78Lo7m5Psuc\\/3aHChQS0Qap7ItasYIKfUEGirDM2CrvYMl5hSTkbFED7qsneOECQFFMcD+FMa68LpLBUWW1J9BjlXc2niFDLZ5imNbeIurLYra84iU2ABhaef3inXbOMMBZS3dIbsdR6qSNwx6037jo2fFWoOMbgOtIkizLbO1be0DoKjrtrd3cRUdVshWsVNVr1fp27pSmLOZUT+zv2n7qPPW23S0L2JbwvqMdar4YCkq3IUpKh5g4P30fgal1PZ1j2W6ulI\\/YcO8fxqIvDCDLSqAbdQ8pqVblph5lvEd4qbA8O8AqBpLjh4NDvFqUUKICScnHrSBA4tT0nu7pbkPJ6FTRwR\\/pSvG1npW7KSgy24yx1TIBSfqznFDLLzY9YJ9tESpaRCx+dGY7pawcbSnJ8XmP\\/8Aa3mYhTBceztzjA58\\/jR9qyxpbCnI0tqSpasJWFgjb8K9zdGOufrok5baynxJBwDigZm80E1zvG5iaaL8X2u6IeS0FoUsBKsYBHmKsZwx0ZA01pRsyI4U5JWp\\/wAYyEgjAA+ymPpXhFc7mIEqbdo6ImFLU2lJUsgHmPTPKpxjWwylRbTEHh5JAHkgfVVwwPCAnatAwkBsGlfh9aFOy3LpJTtDyvAMdE1IyISGCpYVncrPKi1osyYLLbbbJSEgDFLXcYHNJyfICpo0NdImt8BQykBWAenLrS9CJKDk032EKScbCNtL0LO39rp6UWK4BXPz2SIRs9kYCf8A6Qrz7BB\\/9yjn4d0n8qMUDX2Z6Oz9wfCvkXv3fvH4n+9aFQoCk7FQ4xSOiS0nFFLizY7fFXKl22Hsb\\/4COZ9ByrE2\\/QIUxmA46S66QCkfsA+Zpt3xcvUV8TaYn9RHOFq8s+ZP8awPFXF1nhVo41haUvXZWGkoEE94oSAroEiSfdBivY+zrsvxHiPEmX+Ic9rhobVcOPKlILKDBKSealQlJ9uYA7FzQ4Fokxm5CLRDT3qd2DHR+VG49qiKcS3EtLBcUrCUtRwST8AB1oQ2BEitxy7u7pIRk+eBU2dnmJoGdqe2uXez3f5RtTq58i4IkITEjtN+IKWnBOOXwzmtI+\\/9G4YLq4ZzLSkFQAHmjX59Pyrzdbbd\\/izlvZOw0VqySVeXN4d9fL116moaLSUKO+OEqHIgowQfiPKvSmO7Sl1bCkJUfCpSCAo58vWrGS7NpDT\\/ABmRbNPaJvVwnzZLkhEl1TUqPJjPpKu+aQQB+0CCTgedSvcrbcosS4to0rFuLlqYUtFuFuZ7uOSDhDaykJez0XtIwTyrP3fFdvbluLcQsA6lI306GBPMx8dKtbXhp+4DkvnwkjQKO2vUaxyE1R1uDJfQFtW51aDkApZKgfXoK8qhrQpTa4SkqQMqSW8FI9SMVc\\/gxbrRcuHNtDUaWgj2qS4guthSVBfjT06Z+aD5UIkfTUjixqWJ7JA9qmWWOtxyXIjnCAhSu7bbUkgpIQCs9QQD0zQV8YtIeeZ9FHq55jkoDXT8+dGTwu4plp0XB8ccjzBPWqW+yoKcmKCnGeaBivPsTK0lQhtqQMZPcjAz0ycVd3WrlgXwclP\\/ACe2G5EZUNPdwFjDn6rHiDYASPHhWQOfLrW9vh1ouHYbvZWNGtewOXCBubEIrSvkcq3d9zxnr4cZ6HyanjW2DfeO2uU5inlyKQTqB97b2b05XCdz3mRq4kZQqdeYMDc9N\\/lVGhDipTu9lZAzjk0MZ+wV6egNJGx+A2kLSFBK2QNySORwRzFWd0Tp7Trmtr5pJuPNFmhXqQZUNcFt6L3YSvudjh8SVED4g9aT+P8AaNGf0f2bUFrtvdyvZraxEfW8FPOsez7iFITyGBt5+uatG+I7dy9bs+488QYGmYSJEDX3E6a1WuYHcN2i7oveSZGv2d41Pu1A1qs\\/yJZjz+Rrf+GR+VZFns+f\\/VEH8Mj8qOdOVCtb6Mz9wfAVmu\\/d+8fiaxESm3tLZgJEVt0jehlIQlWOmQnrXm4qXMjOJeUp1RQQN5zjl\\/1r1kVh1IU2sE45VDxG2ZFm6QgeVXIdDUuwfdN20Co+ZPM9RTJ4gWA3DhBqVCh44zseWgEZ5BWDVbXmDESpxtK0qSopyBjlirfakiOSeHOp4ycbVWsnHmcHNQdovhXN1zBuaYkyOxIittSgZC9qVJKiMA\\/YK+UTrX03MVbb9EA2WL\\/r9oggGLFUATzAK1Vdi7tA3OVggfrV5\\/zGqwfoz+HsnRGp9cuyIDrYkRoyQ+HO8adwonKVDlVrLi3vuEoqx\\/Wr\\/majOipNvqSTSCtlSSRjNVq7StwucHWUNqHcJcZBgIUUtOqQCd6ufI1aVbGCSaqv2pgRriBy5fJyP\\/Oqtv2bIS5j6AsSMqt\\/dWP7Q1KbwNRSY8SdvfUSfLt9PI3y4H65Kz\\/rQ+W730N4mn65CvzolQr6M9FY+4n4CvAPSHvvn40aN3u2edyln631\\/nWDc7ioZXcJJ\\/8AuqP+tFqFL0Vj7ifgK76S998\\/GtTWpA\\/OctybhJ9obGSkqUMj4eteI96amy3oSJLjjkc+PrgfaabesT7LNiTbcD7eAQEpGcpxzzShpFuOm1plNOhx19RU8rz3eleXYdxJd3fEy+HVNtS2pSlKA3bypKUpEn1kq8fIATGtfQGOdneD4dwA1xy04\\/D6G0IbJ1S\\/mWHFrVlHqSEEtbFRME6arqghR8QSo\\/HnWpUaKoZMVhX+AU5tDS9U26\\/Juej7UudPjoUS2iH7TtSeRJRgjz6mn5fdVca9RWp+zXrSiosCVhMh75ADPdozzVvCAUgdcit7dLRbvBCWmynSSVAH8hlM6ba614fbtreaKlOLB5QkkH88wjX2VGcDh7qO6KSm36FuMkrAKSza1qyD55CelaE6MuLjsyO3pVxblvUG5SEwsqZUpQSAoYyDk4wfOrY6avGmToW\\/RnNa2OSxEhxkOrF4nFtA34G4lOUZIxhHn1onwye0rbUamFs1Fp6Ww\\/NguJbhxnZS21LfbA3OugEjdnr0JJrKL4kUhLqjajwEAeE6zl3MaaHaPz5VokYAlamgLg+IEnxDSAdhz1G8\\/lVX5\\/DvUNtbD9y0HcIza1htKnrUpAKj0AJT1PpWf6Ob4q3G5q0LK9lDndFw24434zt+b6VdG6W+3xblp9VuutylNXHVqZAVJc3pdcS46XU4PNAbwR0GeVLFtmzJukW7zKh3OEtHeuvR5d1U0Sy2hWXVEJO0KB3AHHQVXr40KW0rFqgyfd15HXkfdzqejhNK1lKrhQ09\\/TWRpz\\/PlVDLfYZcqYbZbbK6uUkKKo7Ec7wEglR2gZ5AZPLlWyDbrlcnVsW23yZbraFOLQw0pakoSMlRABwB5mrl8C7nZZtltU1iZAM2Yq6uuF+ax7WseIgqCkFxeE+YIGOZBFM7W0aDddZafcsVuMkSbVJYcn2ichlEd1tSluFTzaQhWEEZBHmKsE8TNqu3LVVqkZQdTG4zbyBp4dNfjVavhwptW7gPk5iNIPOPaddenwqtnsl9i2wXUsTGoJe9mS+NyW+9Azsz0zjnii6bncm1bkXCSkjoQ6rI\\/jVwdRXfRA07drKiBbkra753uJI76S+v5PaCHGkAHBJKRkDolR9apqRgnlg56elX3D+It4yhal24RliNBqDVXjVi5hKkJQ+VZp2J0ijny5e+vy1O\\/EL\\/ADrPy5ffK+3D8Sv86I0K0PorH3E\\/AVSekvffPxo98uXv\\/wCNT\\/xK\\/wA6tdwKlyZPDqA7IkOPOlbuVuqKiRu5czzqodW44BtlXDW3lJ6rd\\/8ANXmfamy03hDZQkD1g2AH2VV6L2ZPOLxdeYk+A8z1TVSe5e\\/cr+6h3T37lf3V1Y9ztJ\\/Rm1fg2\\/yoe52k\\/ozavwbf5VA+tlH4U\\/rH+2jfVo5+IH6f81yQv+mhd45UiOUSUeJDgGCT6GvenrE7aIRQ6ytUh0lTysHmfSuth0bpQjlpq1D\\/AMG3+VAaN0r9G7V+Db\\/Ks6ni7B04x9OpsIfyxOcR\\/wC0ZfNGmbeNK2y7fiV3hf8AhBzEJs84WElJkR9gHN5M3iybZgDvXKcMv+TSz\\/hxTiha01NatKSdH25KI0Oa4VyXGmQl59Pkha+pT8K6be52lPo1a\\/wbf5UDo7Sh\\/wC7Vq\\/Bt\\/lV672o29wAHbOYMiV8x\\/8AWsa32c3DJJbuokQfCdjy3rmvH4l6xbtlmtkhYkIsUlD8J1xs982lJB7rvPnd2cfNzS5duOOqrpGvrCbDbIrl\\/aU1JfjtOJcAKgrkSo46V0N9ztKfRu1\\/g2\\/yoe5+lfo3a\\/wbf5VBXx\\/hrigpVgJBnze2eSeuvvqYjgjEEJKReb6eX2R16GPdXP3S3aE1npG1M2ez2O2IjtMlnKouVKB65OcknzpHe4w6wOqhrKJb4ES5iK5E71uPy2L5Z2nluAyM\\/GujQ0dpQf8Adq1fg2\\/yoe52lPo3a\\/wbf5UxPHmFJWpwYeJVMnNvO8+HWacrgzElpSg3uiYgZdo2jXlXOy6cadVXjTq9MS7NbTEWtbuUsLCw4oYKwd3I8vq+FJeleJeo9NQ7jbpMJi8RLo407IZuCFuArbztUDkEEZNdJ\\/c7Snlpq1\\/g2\\/yoe52lPPTdr\\/Bt\\/lRE9oGHJbLKbEZSZIzc9DPl01AOnSmHge\\/U4HTeeICPLy26+01zsf446+durdzYRFjBuWiWGWY+1BKGu6QkgfOSEcsH1JpJ1DxBu1\\/si7CjTtrt8ZxxLqzFjqClFOdoyokgDPQYrpR7naU8tN2v8G3+VZ9z9KfRq1fg2\\/ypN9oOHMqSpFhBTEeLpt9nWPbSXwPiDiSld5IO\\/h6\\/np+Vcpy09nmyv7qx3T37lf3V1Y9ztJ\\/Rm1fg2\\/yoe52k\\/o1avwbf5VZ\\/Wyj8Kf1\\/8agfVm5+IH6T\\/euVHcuful\\/5awpl3aR3KjkeldWPc7Sn0btf4Nv8qHubpT6NWr8G3+VAue1NNwwtkWpGYEefqI+7Rrfs4Ww8h30geEg+XoffXLAh57T13t6mcd5a5CeY64TnFVwt0e6PQX4qIczujESXEtJUMgEHPrgZru\\/7n6Uxj3atWCCP+xN+f2Vqb0LoprJa0jZUZG07be0Mj0+bXkfeeyvU6ol+ixianjL1am6SSi2uxo7kSKV5KcqVlRz0Jq3U5B+UZO\\/zdX\\/M0\\/7bp6x2fcbRZ4MHeAlXs0dDWQOgO0CjZiRlEqLDZJ5klIoS\\/FRWnO7qLlIHQDl9RqqParZcGurfhCiPk5A5DP7a6v8A+xxfKM1\\/kFE5em7DPcDs6zQZCwMbnY6FHHpkir3hnGRw7iAvijPAIiY39utU3EuHHiCwNkFZJIM77Vyi7pf7tX+U0O7X+7V\\/lNdVvc7Sn0btf4Nv8qHubpT6N2v8G3+Vel\\/Wyj8Kf1\\/8a86+rRz8QP0\\/5rlT3a\\/3av8AKawWnc8mV4+quq\\/ubpT6N2v8G3+VD3N0n9GrV+Db\\/Kl9bKPwp\\/X\\/AMa59Wbn4gfp\\/wA1yYZ0\\/surl2cLzjjidiQpIwgY6CsWzTyrVJfej98Gn1bi1gbUn4V1p9ztKfRq1fg2\\/wAqHufpT6NWr8G3+VZ9rjHBmHUPt4fC0LU4Fd4ZzL8xJiTPMGRoNNK2t1bcUXls7Zv4lLTrSGVI7tOXu29W0hOychkhSQFAkmdTXLiz3zUWm5C5lguc23POJ2LcjrUgqT6EjypVkcSuJEthcaRrK9utOJKFoVJWQpJ5EHnXTL3O0p56btf4Nv8AKse52k\\/LTVr\\/AAbf5VbL7TbR1WdyxBPUkE\\/HLWSR2e3TaciLsgdADHwzVzHRrXVTelFaLakFFqcVucaSwkFfPIClAZIz6mhZ9bassFoXZLRKWxFckty1hLacqcQQU5OM4BAOK6ce52lPo3a\\/wbf5UPc7Sfnpq1H\\/AMG3+VcPaXZlJSbEQTmPiGp6+Xeujs+u0kKF3qBGx26b1zkVxu4sLfU+rUsvKiSE92kBBIOVJGORO45I5mtcTjPxThx2IrOo5Xcsp2KbWhKw6kjBDmR4+XLnXR\\/3O0n9GbV+Db\\/Kh7m6U+jdr\\/Bt\\/lUf6wMLiPo5PxT\\/ALaN\\/BGJTPpyvn\\/urmBadUakseo06rtT641xbcccQ4hsYBWMKG3pggkY\\/hS3eOLfEa9t9xKvDrbPcuxy0wyhpBQ5jeMIAHPAyfgK6Se52k\\/ozavwbf5UPc7Sf0atX4Nv8qM52k2Lqw4uwBUBAJUJA\\/T7TQkcAXjSChF4QDqQAQJ\\/VXNxPFziIm3G2\\/KmEdx7MHPZm+9De3bjvNu7py60yi0+TkoWfsrqx7m6U+jdr\\/Bt\\/lQ9zdJ\\/Rq1fg2\\/yojHada2s9xZBM7woCf8A8017s9uriO9u80dQT\\/WuU\\/dPfuV\\/dWe5d\\/dL+6uq\\/udpP6M2r8G3+VD3O0p9G7X+Db\\/KpP1so\\/Cn9f8AxoH1aOfiB+n\\/ADXKnunP3S\\/8pq3nZ\\/ZUnhpbcpIO53kRj9qrN+5+lPo3bPwjf5UaYstrithmNb4zLaeiW2kpA+wCstxbxqniezTZhnJCgqc07AiNh1rS8LcKL4bvFXZdC5SUxEbkHqelHqFChWBraUKFChSpUKFChSpUKFChSpUKFChSpUKFChSpUKFChSpUKFCsAg9DmlSrNChQpUqFChQpUqFCsZFZpUqFCsbhnrQyKVKs0KFClSoUKFYP10qVZoVgEHoc1mlSoUKFClSoUKFClSoUKFYzzxy++lSrNChQpUqFChQpUqFCsVmlSoUKFClSqDeNPas0fwVky4N505qObIj7UhbEFaYq1qGUpD6sIzjyBzyNMZfbM1LGVohu58HLhb3NbTBHiJkXBKQptZQGnWztO4K7wHntxjzqHu31qDhWbnO05bBfPfX2+PJm95KkGF3HdKHgaUvut3zOaUg8jzqNuIWkbtYuG3DzidedETrPARMjxyV3+VIdmNdyhaXEJUs+zbw2sp7sjkfhWPvMVukXDraFiERtyE6yYPL3b86+juGuz7h67wixubxhQcuCoesJBUe7JTkSHEykq1BAUSAJygzXQbhxxek610fctTX3S87TsiyuvszokpwK2qaBKihQxuT6EgVFGlu2hMv+i\\/fpXC+4GAu+fJTSIkwPPONbcl9LagkqSFKbSQnPNR58qifhpZtbX\\/s4cSdQaJ05GtErUr47pb9zkvPKtyQorcWHnF+PuypIUNu4Z9BTW4YjYnssJSfCu+3jcMnxf7a119aMvFbg91BiUydNyVBI5cpnaq6z4DwQLve8SF5HSkJzEFARbuPKHhWfMUZASpREE8oNrNR9qiJpbUdh09e+HGqYXy9cBb40iSwltCicYUnxEq5lP8ft08Xu1zofhdqm36SDrNwuKpgj3VoSS0q2t92F94rKSFDaoHApt9sgp99uDHMf+1Q\\/\\/ioZ4kSZLHGbtEts6UVd0u2VhLj4LY9iT3DH63x8z6eHnRLvEbq2UtsKEhQAMcspUdB1iKruHeEMDxli1vXWSAppalJDkBSg+lkHMraAvNAiSAOetjJ\\/a00g1xU07oO1mFPtd+t\\/ygb2LkhtiOjx\\/OCuX7GMZzk9KlLS3EvRus7C\\/qTS9+jXO3xt4dejr3bSjO4EdfL7aof2btJ6J0hJ0S\\/xK4fxdVs8TGVt2+dJiplN25bbqkJa7lSSBnG4r8gefQ1LHYTbaHZ61atCEJzOmg7R1AZGKfYYncPOJS7HizGPuwEkD2zM86DxdwNg+G2jruHlfqC0jMYKXStbqVq3JSUlBTEJEiYg089bduLhLZtBPav0bd4t\\/nNvNNi0rdVGfUlSgFK5pPzQc9PKlWw9sng1P0\\/YLredVwrdOvRbacgpdLqojiwf6w4GEjGCr4jlXP8AtLk1PZvvCBdNDJj\\/ACs0fZX2wb6Vb0c2lbshrlz8J5BXOlLXr0yRpXhFHm3PQ8plJWlDNkQBPaBWxyn+NWVH9nkOi6qk8QXgBcgRlBiNJJjrP\\/dq3yux\\/hxRFkkuBQecRnzeKEt5gIyZd\\/YD\\/Mdq6L8YuN8fhLpy2atXp2fe7VLmtx5L1vUlRjtrHhcx+0CSBy9R6io21t2xF2G9a20\\/atGPLkaVsUa9suTHi2HkutsL2LbxuQQH8dT82kPthWi66dGj+JOktWPWq8R\\/\\/QUaA0N6J5ewptAaOUeFQJUSk8tp6pTVXtZ8NL3Y9ccTrBq7WF2ut0sOl4s16Sl5SDIUpuKpLTuSSttAd2hPTwJPlU\\/E8Surd1SGthHSPKT8429m+tZLgTgrh7GLFm5vfEohRIlYJIebTsITCQoDMDCu88soJN+OHvaT4eaxa0zaJepLfE1Nf7TEuJtbTxcLa3mwstbsfOTk8jg48q9y+K3FuNIeZZ4CXSQ204pCHk3WPtcSDyUATkAjnVROzS1pW5dpDh77o2T2MW3Q8VV3BilouT\\/Zypx45+dv3oIX5gjFT5ZeL3EGV21L5wikX1LulYtsTJZhGK0ChfszK8hwJ343LUeaj1o9tiTlwylTioJVkBSBrpuZqqxvgu0wrEHmbBoOJRbm4Ul4rBSAspKUd2RyggKJ059Ro3tg6g4i3i96c0ZwZus252EqTMZVcWUpbUFKRjPn4kkcqkhXGCVo3heNd8XLK3peUhYZdie1B5IcUva2AsDookHpyGT5VT3syRuKEnjFxYa4XS9Px5hmvh927suupQn2p7YpAQRzCuuastxa4Xw9dcHoDXHzV0eFKsTiJUu4QHfZobj+e7TvQvIIUFBOOXNXLGaVhd3VxbKeJJUM0SAE6GNwJp3F3DuBYRjjOGhCUMqLRVkLi34UgKIyklMEmBAJ23qNrl+kMgw9ORLo1oZtc9V1VbpURV2TtQ2Ekh5taUErT0HMJ5nzp56C7bug9Z66maUktM2u3NuoYhXV+akIluqHzAggKHMKwenIZxmqg6evKNKWtUrWsp+Mzc7i6m2uRNPWa5Idb5Y\\/WPpUtPXp08\\/WpG7MPD63X7j1Ne4jONIXad11sUGQ3EYXKdUQjeWmfCAkIBCEjGeY86rLXFb911CQqZIGoHTqDz+fKtvj3AXCmH4ddXKmCkNoWUqS4tRJkaJChlOQ+E6nKCSqSARZLjx2pIPBPVemdKp087fpN+Qt59mNIIejM7kpQsICTv3HvMcx8w039d9uDSOldR6bs1q07crlGvLpalvutvRlxRuQkKQhTeXeSicJPl8ar12hLdqSP2r7w7qmZHld\\/YZMq2JZHhjQww8lpGD0UChSj8VE1EdrlOTIfCszZmtnHkXKSV90VlLTYkI5244PjwDuxnCgmnXWN3bbziEmAFQNBoAQPnM03AOzDh+6w6yublJWVNZlkLUAsrQ6oH2ZMkCIk7zsejcTtDWPUmhtcaq0nbbmtzR1vlzMXCI5Gbklllbg2lQ5glBB8xURWXt5z3OH6eIWoODF8atIlexKnQ5jTkXvv7O5e1Wfht+2o27LVzv9x4Acdnr1drlJbFonuNoluqUO8chvlxzxftEgZI6n41BHttkHZv8AYP6T7om6fLm73UyfZdmP+0Hw43eXWuXOM3QbQ6hUSlR5bg6b\\/wBNabgvZrgXpt3h9wz3ndvsoBlwkJW3mV5IA11lQyp5nargay7cl+sFn01qiJwavEa0X2UEolXCS0lMlnBz3JQT4skHxADkanfXvHLRfCvS9q1RxBlu2xm6qQ200EF1zvFNlZThPXAByRyzj1rm9rufYX+FvDmLbuLN11BNZfAk2GTksWnp\\/V5SBz6dTVou1LpvjWvUenuImj9F2TU2n9L2ot+wXCMiaFKdSC86qOvpyShOUnd4aPa4rdKbdX5oCI0Bidz4enSaq8d4BwJq6w+2CQwlxVwFEqW2VBsgNpBdmCokDNBB1KZFTnprtB6J1foK\\/cSrGuZ8hWPvgqTKZLKX+7bCiW93UZO3PqDUR8P+3ZCv1juGp9Y8MtQ2izxD+quEJl2ZHcAJCipYQkI28gefU0lwrrbu1Z2W7lHtBVogWB9fyjAtrKUxnVMNd73QTyw2relXqFJ55xUK8OLzxj1L2QtbCPqWxJ0lYe9gOw5FvPtXdhDThS04jakDLgOVBSs554xRLjE7kKQptUpKCqQBCiPYTIAqHhHA+CrYu0XjWVxFy20UrcUFNIUYEKSkoWtZnlljYiatZB7YOmL\\/AA7fcdI6A1xeok58NCRHs7vdpRuKVL3\\/ADVbSDkZ8qUNbdqrR2iuI\\/8AR5Js97ujrMMSZjtqiLlmItWNjbjaAVAkHPwyM9aijsoWLjjK4S6AuVj17p+3aTYfkqVb3LcpcmQ17Y8HG1uE4JJ3lJGCMjrRjj1rLS+lOIE7U8a7670JLjtot9zu9s0k29Gn8wpsqkuJwrHQc\\/LHlUhN9ceiJuFqyzlOoA0Ikx4vmSKqV8LYL\\/ELuD27RcSjvU+FbhUFJXlTnhqQYB0QlQzESYBpc052x5S9Y3u3aj4Z6oj6cbXutNxi2SYt11vA8LrRRkHO7mMDywetSjwb7QGlONTl5TpeFd2E2aQGHVzoqmgvOenoeRyk8xyyKq2rjU1utzKuPvF0LvQHycj3PjhU0KOB3Ix+syTgbc86lDgKm82XhjqbSfDCz39m9QX1y4k\\/WdnVb2XnnzlStoAK9uFEgk88ZOCK5Y37zjoSV5k6zomeoAyk\\/Oi8UcI4bZ4cq4bt+6dJbSk5nAgCcqlq7xpPOJgnUkwIgu3tJdqW28BxarZAtAv9\\/ubwKbal8tlLHmsqCVEKJwEjHPn6U6eB\\/HbTnGjT6bjBdag3dkFNwtC39z8NYOMKBAJHxxVP7tbr9wLvFz4762uGjOJGofaUBh9y9946wpagApphIISUnof2R0xRC8cPNUcVdVWbjHpDWeidBXjUfcqZi229rTJckqJJURyKHCnqOQJTjqaB9L3SXyqJ\\/k5hPXNtM8qsz2f4C7hTbQXkif8AVSSlTgGYt915ggJPnICpEkRVxeNfGbUfCmTZH7ToR\\/UsGbKTFniHK\\/2qKXDhohrB3BRChkkdBz50xNV9rq96d4t3ThdB4T3K8rtlvauCnIkxAfCFR0PK3NrASAneQTuPTpUb9pDTN40LrDQt50jrm5L4h3i3psCu6Vh25LG1IlugcglAWsE4yfBj5pNIHCG+OWvifry88QbJrTUGsXoDVmKIloUt2PE9nQ2286CclxaEIOehOT+1T7m\\/uBcFkKy+IdCAMsxsdTppy61EwThDCF4MnEnGUv8AqlwJcQpS+9SkKIkDInxDOCAoGCkKFWU7PXaHPHHRtz1e\\/piTZ0WyU6wtvve+S4Ep3DYQASrbjIx1PLNRzxb7dWl9HSLKnQtme1G\\/LeWmVEkNPRFpRgbCgqRzJUcYwaivsV3X5D4g6gsto17eBpSyokTpUOZB7qOo7AFOuKyru1JKSOZ57c1H2qOIV34xdqe2aiiwNQNQFKcTYWrW22iaqM227seZDo2AqUlSiSOQB8wKjvYtcCyaUlULUcpMAzB3EafKrqz7PMH\\/AIovUOsFVoy33qRnWgJBSSlteYZsxjNorwgaztV02O15wm+TW5k6bdGHyylbjAtkhW1ZGSgK2c+fKiHEztXW\\/RnB+08X9PaYl3SJdLm3bfY5ilw3WypLqio5SrmC3j0OetVe7Sdw1zbOHaVS5\\/FVhh64MNufL8iIIy+SlAZYAUVbkgjPLkakbtcx3ofY\\/wBBCbdJc99+danlvyl73XFrhvLOTgZ6n7P4lXityUOwYKEzsBqT7zUC34BwJN3hhKCpNy+UEd5mGVIkiUoRvI5yI5yalSf2rr5ZLDH1HqDgRrCBAkpa2SnpUJDJU4MpAUp0cjyxn1pcsHHXiFqbUFmhROAupYVmuBJk3SXLjbGEEZStIbWoLSfrHLHWoF7Vt04lPdnKLAvGlbRE08n5M7iazclLfcASnZuZKABnz8RxT+7P3FzXmobxYuHrcfSbcKyWeMLjGE9xU4JU2kocQkoAOBjKRkDcOdGavXDdBhxxWoSR4RJJ5bbaVU3nDFmMBVi1taNEhToV61aglKQmFAhwyqVAZTsYnfWS+LHaI0Vw10zfZ7OoLRPvtmb3CzrnpQ84vcP1eBkg4OehpvcL+2Bw61voBvWWqLzaNLzAp7vra\\/cA46hKCcEDAKsjmBik\\/tiWDh1Z+C2q9T3PS9hTeZzKI7E5Vva9qW+paQMO7d+cA889BUTaP4Zabs\\/YQuOpb1pK0KvUy0TLgzNkQGlSUNurIZUHSNwyjaQc+dFuLq8bvFNoKYCCqNeuntn5UDBuHeHb7htq6fQ4HXblDIVmE6pGaB5coJnUFQPPlVwNBcRNK8SdPsak0deGrhBeSPGg+JCv7C0nmlQ8wadNVl\\/R\\/RIzXACLLbjoQ5JuUpS1BIyvBSASfPFWaq0sn1XNuh5YgqANYDifCmcExq6w5hRUhpakgmJIBjWNKp32z+BHE7iJOam6A0jp66NTXmRJeaittXNru0rA3SFrAU14\\/mgZBAr3qXst8UeK2moGluIWsYdssumrQxFstvt2VpemNxw2JD6lY88jA8ifXNChUReE27rq3Fyc0SJ00\\/7NaG37QsYsbC1tbbIksZsi8srBMCZJIBgZQQAYJ15167OnCXjVpLSPEizcRbe0uXcYLdutbqpCFrkpaZcbThQPJvCkgbsHrmkLQ3Zw4sWpPAhM+xx2fci53KZeT7UghlD0htaMYPiOEnpQoUwYQwEIRJ8O2v8AMFfuPhUhztDxU3Fw+lDaS8ZUAkgA9wtnQZtPAsnn4oO2lPLj5w\\/416642aEbgadhTNKWO5t3NNwZWG1xxlO9t0KVlR8G4FI\\/ax5U39ZcA+OF64ocXb7pZqyQ7VrKAzCZXcCVKkIDTQUEFBy2dyTzUCOXShQp7mFsvKUpajJM7\\/ykdNoNR7TjzEcMt2GbZtsJQ2UDwkyO9S4SRMFRUkSYj2TrTg\\/o47RXDjgXpHTfDcadf1BYYT0SYw60HXNzrqjvYeUUhJSlQyCOf2c3V2TeDGouGHBxzR+tWG2Z9zkvSH2mXN3dIWgJCSoct2AenIZoUKI1hzTTyXAScqYAJ02A\\/oKr73jG\\/wAQw96zWhCQ873i1JTClKlSgCZ1SkrUQIkTvTG4z9jHRds4KXWw8IdCx5OpO+ZfjSZSkOTFJDiSttDqsbcpB5ZAqCHuD3GR\\/R9v0852Sba3dLZGWwxemJKWJC3TjDzndup7xacctxIB50KFQbvB7dbgUiU6RAiI\\/MGtfw12k4zb2pauIeIWVhTinc0lIB1S4mUwPKZGp61PPEjg9xc1pwe4b6kiQ3mOJ2jX45b9olh44WUpdLilEpUfC2snmcJUBnNMLiTwt45xONWodXucHo+ubbquwwrfcWY8\\/wBlZWpMdhLoCgtLicOMHHqDQoUS4wxpac2Yz4enIETBBGx10qvwXjy\\/tH+57ptSfWgAhQhK1pcKUqStKgErSFJhWhJ1py8N43H4cXNKXV7gL7m6cs1sXapTMW4IUJDCWwlnvl7tzxbCEpQFbsZPPnSdboPF239qq68djwO1M5aZ0ERExUrjl4LDDTZJO\\/BGWz99ChUZVkA2jxnRWb7O4Efdqza4pU5dPxatALZ7kgd75FKKjqXSoqJjxEkwABRHs72TjHwf4h661jeuBupZkbVLq3Y7TDkcKay+454srx0WByqY+JVq4jdoDs7an0urQbul7\\/cpUdiNEuclACm25jLm8rSTgbEHl1yKFCjWNoA2bXMchCpGnPfWJqDxLxM49fN48GG03LamlBQzx6qMoylZEaCdJPUVBHFDsiajtfDrhpZNNcPYVw1HElq945UBKP1qMpKStatu4dacGmOzRxAsnaksuqXNDWGDpWyjvUzLYyiOwsBKinLJWpfehSgCrGDtBoUKeMFtQ7nE6FMbfZGnLnzrq+07HVYeplwpUFoeBJCifWmSR4vsyQjkBpBpycXtDcQB2rrXxQtPD+432yWrTwad7jYA66O\\/\\/VDcRzO9Pw51Els7M3aSsF1gcVtM6ft7btmkvybLpi43AyVwGlrUsNpyoI+ctRwFAZ59aFChvYSy86pSlHcq0I0Ons5Rzolp2iYnhViw0002R3aGjmSo5kJzaEZ4k51AkAGDAIBMzBfL52lNZ9nvWUHVnDNqFerkhFnhQLbgOqbWQHnVArICNpKRgk8\\/QUkcS+zjq7TfY9tHC3TVnVeNQJuEebOai7Tl1W4ubdxAKU5CfjjNChRHLBDiFFxRJy5ZMTBM9N6jW\\/F11h9yyiyZbbQLjvcqQoJKkJSEgyonKNTE7kmajPirwu7Ql60Rwu4eK4cKehWdlDociIK3WHSQFIkKPgRgAnkcYq0+stL9pqXqR5jQ2tdMQNOPx22G0TYK3H2DsAUtJBGVZ5jPL4UKFK1w1tC3AFq+yN40AgDSK5xBxndP29oVMMwnvjBRmGZxwFSoUVCZSIIjnvNbdKdl3T2nOGI4djU2oWFSpzlyudytk5UOROkOJKV7yjkUFOBt6eFOelRzxM7Ien9EcHtU2zhhdtdOPyY63m7OzeFKjTHyUj9YwkBLmQBnPoKFCpT2G2qmsuTYED2CqPDONMcZv0u+kE53UrUDspWYHUCPyiIGgihwH7Kvt3B\\/TLPES\\/69tVxhOuSF2hu+LZjRHUSXFNqQyAUoJG1eRz3KJ5Hpu7RukuL3HO9N8HNNaYNo0nFeZk3HUE5wFMjCQQloBW44yfrKfLlQoUP6OZFsLdMgGAY3IA2P+IqwPGGIqxp7FnQlbjZcW2FAlLalKHiSJ3HLNmGxMkU3u0BwV4h6XvvCK68I9HP6ii8PWWUJbDiEla2XULG\\/JGAracketP3hRqrtB3JevNVcQOF89oLZiiy2D21rY4QFJdQgqVtSTkEk4BoUKCmzSzeFTaiAdY0jyx06UZ7il2\\/wNu3vGG3FJ8IcUF54LveKEhYAzK3IAMEgEb1EXGXhRqnX2ipFj0V2NE6ZvL0hp1NzalW4LQkKysZS4FHIyOvnSvovRWqtHaSskQ9iOHP1JaWGUm6SJNuy6+jGXSd5UDyz60KFDGFt94XQozEbI9\\/3fnVorj28XYpw5TCC0lRVGe4mSIIKu\\/kiPskx7KdfaH4N8SdVax0Bxl4aW9EHVltQGLiy6pLqWWglTidwztVtJcR4eat45jGQz+JHDrjpxx1oxqnRegJvDu4xYS4Mu+SrmlhdwZwRsU00SSnnyz0Bx5DAoUV3Dm3XFJKiAuCYjcDfbT2xFVWG8b32H2jTiGm1KYSpCCoKJCFqJKT4gFpH2QsKA6TrS\\/2O+HvGnhRebvw\\/1boS0wrOSqS9eUL3uTHDySEqBIUOuMhOB5ZopxV7Plx4h9r7T8y76Fem6ARZ0xpzzaiywkpYkbEZQpKk+Mt\\/N9froUK4MNa9GRbqJKUqETHI7bbUb+NsQVjVzjLSUoedYUlRTmGqkiVjxEhY5GYHIUxu052TLlbFRoPBrg5DegyXwUzYVwkuymUpTgtuIfdKNpJByOfhqWOPvCHX\\/ErQXCXhtbLQfZretiTe31OJCIpjxEoCVc8kqKnEjGefXAoUK4MJt+8dSNAuAQIA3npRFdoOMLt7B10ha7fvSlSs6lFRQUyoqUZI3EQJ1IOtJnHLSvaC4vcMBw1h8H4lqZbdjqbeN7bcwhkjAxjzArdoThhxKtfEjSmtLlwShRp9utceyTrmb6lWGW0KT3waSPEvBx4ifCAPjQoUT6OQp4OqWSdPu8tvs1BHGtw1hysNZt20tnPsXZ9YAF697JkAaGRptSzxB4O8Re0PxJTB142mx8ONMTFezxG5G5+8rGP1qtp8KCOQzzHi+uifap\\/pze0XO4Z6B4Zwrlp27ttwmZFtdUZEZlGxW1TW0JSDt2gg4x6UKFOuLFHcuQogr3POOm0QOQig4NxVcfSdkhbTam7f\\/wAaCFZAoeIr0UCVlQBJJM7baVJHZS4d3rhlwVsGmdRRDFuoS7JlskglpbiyraSCRkDaDjzzUyUKFT7ZpLLKW07AAfKsni9+9it+9fXHncWpRjaSSTHsr\\/\\/Z\",\"link\":null,\"is_show\":\"on\",\"_token\":\"aaUNfuHsrvMysVKjYsJCbzRpSzIDkmup5jD8wGfH\",\"_method\":\"PUT\"}', '2020-09-27 01:48:05', '2020-09-27 01:48:05');
INSERT INTO `admin_operation_log` VALUES ('280', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-27 01:48:07', '2020-09-27 01:48:07');
INSERT INTO `admin_operation_log` VALUES ('281', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-09-27 01:48:21', '2020-09-27 01:48:21');
INSERT INTO `admin_operation_log` VALUES ('282', '1', 'admin/banners/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-27 01:48:33', '2020-09-27 01:48:33');
INSERT INTO `admin_operation_log` VALUES ('283', '1', 'admin/banners', 'POST', '127.0.0.1', '{\"image_src\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQAAAQABAAD\\/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD\\/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD\\/wAARCACYAV4DASIAAhEBAxEB\\/8QAHQAAAgICAwEAAAAAAAAAAAAAAQIAAwYIBAUHCf\\/EAEwQAAECBQMDAgMFBAUIBwkAAAECAwAEBQYRBxIhCDFBE1EUImEJFTJxgRYjM5EXQpWh0yRHYpPB1OHwGTdDsbPS8SlSZXKCkpbE0f\\/EABoBAAMBAQEBAAAAAAAAAAAAAAABAgMEBQb\\/xAAxEQACAgEDAgQFAgYDAAAAAAAAAQIRAxIhMQRRE0FxgSJhkaHBsdEFFDJC4fEjM\\/D\\/2gAMAwEAAhEDEQA\\/ANKxzEIx3Jhsn+qIB\\/0v7o+oPDAMnjiCEgdzAA9h3hsY7nEAE4B9swf0iDnmD\\/fAIKR7Q4UfIzC5we0EEflDSAfdnsImM8woVDDJOIKF6gwc8RYkbRg8wcADAEMlMHImRI84h0pxEA5xDpHiGIKUw4T7CIlMWJSDyYBEAEMlP\\/dDYxBSOYaVhZEp+kMBDYHYwQIaQmyDxDAAjIgHsecRBjtiChB2cZ5iAD8onnkniIBz\\/wD2EO7LBye5xE4xgeYgHHEQ5gEQkfT9IHOeIIT78QdvtBQCnvAzxiCQQcGBggd+IKGTvz5hFH++G9jnEBQz3gATJx+UDOT2hiB3IMKR+UA0BQ\\/SEP0MOT7ee8KeTAMTBJ\\/OFVmLAOYVQHtAFlSueYm3AxDEHMAj3gArV7mFKiOMn9YcjvCkdziJYWKFqxAOF8HPHkQT7wpH1hDs648e8AjJ+sHnMDaODmAoIGRxB9siIM8D3iYgAgI5PaAc54hsYGCYXPgdoAug5x45EEdsD84XyOM5hs47Zh8CHR3GYuAzFKT\\/AMItRDEOMHkw6eOwHEBIz+sMATgCGQwgA+Y311K6Qui\\/RlVIltUtar4ok1WZYzUq2JcTIcSnAUcsyawnBUOCQY0MA5xH1M0lrPTV1mTjDdT0lu+rzNnyDQeqtwTC\\/g2lqKf3SSicXkrKVK2lGNqDnHAPH1cpY9Mk3XnVe3J1dNGMrW1+VnjF09MvQ5YstTp68NYdTqPK1dhEzITE5b8021MtqQlYKFmnbVHatJIByM4IBjh2roN9n7e1x020bX6gr3natV5hEpJy\\/wB3ON+q6o4SncuRCU5PkkD6x71dWpXTf1MT9d+I0SvDUKS0yS42\\/PSU1LS0owysry6yldQZU4lYl1HIQVEIT42x4nQNe\\/s8LXrMlcVvaC35T6lTnkzErMsuYWy4nkKSfvHgiOaE8so18Wr29jaUYJ\\/217muPUjpfRdGta7k01t2enZyn0ZUqll6dUgvK9WVZeVuKEpTwpwgYA4AjYGwvs5nr3se3b0GtlJkRX6TJ1QSrlMK1Meuylz0yr1hkp3YzgZx2Ea6693\\/AEXVLV65L9t5uqN02qvtLlUVNe6aS2hlDYDh3ryRs4+c8YjAhx4jv0ZZY4pSp1vtZyKeOM3cbXrRvUj7LeoLZU+nXKlqaQcKcFGUUj8z6+Ir\\/wCjBfxka90b+yT\\/AI8cbQU\\/+zn1cPtWZv8A8CQjSLzHPij1GRyXicOuEa5JYYKL0cruzn3DSTQa9U6EJgTH3fOPSheSMBz01lO4DnGcZxkxtz0vdLFsag9O166m3RZE3cNbf+Il7VlGZl5hZdZaICklC0pWFvrCTuBA9E+5EasWBYlf1LvSj2La8v61TrM0iVYBB2oz+JxeASEISFLUccJST4j6JdWNT1Z6bNFLItXQaWqEjQKA36NWrssy26tkISEoDqSCEh1a3FqXtA3hIBGcHTqskrjig\\/if\\/vuR00U9WSS2RqFbPSnq7QL0tSY1R0xqMlbE5cVLp9RcfdQlCmn5ptooJbXuG7fjKeRnuO8TrM00svSfXOes6waP910hmQlH0S\\/xDr2FrRlR3OqUrk\\/WNxrvvG86NoloFQdRa8qr3Xet50GbnX32w24Gfi0zYTtAACm90s0eBzmKOq7pIpuu90V27bAvRhV\\/UtiWE1RJh1AbXL+kn0k\\/+80pW1ZStWUKPy\\/LtKhzw6p+IpZXS3W11ytzafTrQ1jW+z35PnTZlrTt73hQrLpr7LE5X6nK0th18kNocfdS2lSykE7QVAnAJxniNrR9mBrRjIvmyv8AXzf+BGrLli3exebenszb83L3G7PN0xNOfSGnfiVrCENndgDKlJAJOOQc45jfyzNBtPaZaFDpt29EV2VKuStNlmKnOtVKTCJmbS0lLzif8vTwpYURwO\\/Ydo6OqyvHTjKr9Py0Y9PjU7Uo\\/r+EziVL7OZh\\/Q6lW3Ipt1nUuXnFLna6Z2c+Feli66oICNpG7YppOfSB+Q8+\\/m3\\/AEYOs4HF82V\\/r5v\\/AAI2YmqPb07p5KaUzPRre7lqSMwZqXphnqf6bbpWtZUFfH7z8zizyf60ebX3oHYdWsyt0uy+iW7KXXpqQeZps67UpMol5lSCG3Ff5ergKwfwnt2McWPqcq2c+X8n+fsdc8MHuo+Xz\\/Y0Ava152yLxrtmVJ9h+bt+pzVLmHWCS2txh1TalIJAO0lBIyAcY4EdIcDx3jsKzR6jQKvPUKryypaepsy7KTTJUCWnm1FK0kgkHCkkcHHEcFR4MeyuDym9xCATiIRBzgfWApXeBplIVWfbMKT9IY8YMKfzzCoBcgwuPJhvxeImB2goqxfbHmEUD7xaUj8vaK1DgiEITHOIhz75icxO8NjEKR58Qqk8YzDkf3QqoQitWRxjMKQO3n8os4BP1hDk+0A7OrzntxBHJhNx9oO\\/2iaNB+3bAgFWYXJIzniCOO4goAgFXPYRAcd4mcxMcdoZLZCRz2\\/lBSAfbiFAOfyh0jnMML7jp47mLUDAipP1xFyewPtCrcRYgHGCYtSOYqT3i5HGD3iqJZyJGRnKjNtSFPlHpqafUENMstla3FHsEpHJP0EbydOfUa\\/opow1pXWumS7ayp9ybXU32qeUNz4fUrhxKmiV\\/uils7s5SkDsAI00sK86xp1eVHvq30y5qVEm0TkqJhBW0XEHI3JBBI\\/URswn7TDqO7GWtD+zHP8AFjm6nHPIlFRtetG+Cccdtun6WbedOeoWn9023f01bHTM5YLFNkGnJ2TVTG5f75QW5ghrCW078BKk4IP8X68+If05aHgYH2ez\\/wD+Osf7vGU9NvXNW79trUGf1euuyaFUKLINPUBp11EkZt8tzBUkJddy7hSGRhPPzY8iPDD9pb1FjgS1of2Y5\\/ixww6fI5yWnt5vt9zqnlgoxer7I1puqlVOl12a+87dnaJ8U4uYl5OallMKQypatuEqA+UYxkDHyn2jquSORHstx9QK9atZrW1A1+o8pP0ilIYkZ+TpUupr15JDrjhSElzJUS6rnePHaPdf6Wvs1h\\/mJuX\\/AFK\\/99j0ZZZ40tUG38tzijjjK6kl6lmgvH2c+ro\\/+Mzf\\/gSEaRjHePoPRernodtywqpphRtMrtlbXrbyn56nJlElD7ikoSolRmisZDSBwR+GMPOrf2aw\\/wAxVy\\/6lf8AvsYYpzxyk3je7s1y44zUUprZGr2jerFw6Jah0vUS2m2HpmnqUl2XeHyTLCxtcaJxlO5ORuHIODG5PRbqh1Ba73HeFKvCofelh1FTsxVpmbyPhHHlZMpKK7hLiNyS3+FtHzApURv1f1In+ni9ta6R+wMjVLL09mvhJeoLXLlx+W+ch54ILrmRgp\\/rHGCQk4wdhOpbqR090k05R009Mj0u3K+iWKvWZJ3eEoUP3jaHR\\/Ffc\\/7RzskfKOfwX1EPGSjGHxS835L9xYH4Vty2XbzMe1p1zlNaOtSw2Lfm0zFuWrc1LpdOdQrKH3PjWi++nkghSxtChwpDaD5h+szUe8dKesSYvOxaw7TqnJ0uQAUnlDzZbBU04nstCsDKT7A8EAjWzRWoSFJ1gsWqVSdYk5OTuSmTEzMPuBttlpE02pS1qPCUgAkk8ACPWOuy6rYvHqFqNdtK4qbWqcumyTaZunzSJhkqS3hQC0EgkHuMw\\/AjjyxxpbKLX3E8rnjlNve0Y7Pa9VLUDqQt\\/W3UENyzUnXaXOPMSiFKRKycs82rY2kkk4ShR78qJPmNl6DqPPdVPVdUaDY2sOodAsl2jCbaRSKk5IKbdZbbSohtW5IBWo5+XnOY0p08t2jXje1Hte4LpatyQqkymVcqjrBeblirhKlp3J+Uq2gkqASDknAMbsU7ULpa6KreqjeldeTqFqJUpX4dU824l5lB4wlTrf7ttnencW0KW4SEhSsBKkz1OOMajBPVVLbYeCTdub2u33MsoNH0eubUA6WUPrW1umboE3MSXwArMwk+swFl1PqKlQ38obXzuwccE8R55aevT\\/Tt1T3ba+qGrN9V+0KNLPSMqmpzzs+tT6gwtC1IBCcgeoNwSMZ+sa99NmptLszqOtvUq\\/6k6mVTUJp6pThQVqC5hl1BdUAMkb3dysDOM8eI28NI6SmuoZ\\/qOnuoyjTThfXPfc+5taA6Zf0u4ypQH4gkJznA\\/PHJiWGTjO2nHt5+yNYZPESlGk0+\\/l9TQjUuu0+59RrquWkqWqRq9bnp6WUtO1RadfWtBKT2O1Q4jGN3giM71xuqgXvq7dl02pLMy9GqFTeXT0My4YSZcHa2r0wBt3JSFEYByTnmMFIJ7\\/8ArHqY4\\/Ctjz5\\/1MryT3ETENjGfr7wMjGIpoV7CnPkwpA7Q5GTCkccxFDViwDyDn84fzCqTx3iqHYh9gYUjmHIhCMQtI0wDGIUiH8YxAymIaKsrIzxCHjxFigfaE4Hf++FQthD35hSEjntFh2+RFaueAD\\/ADgA6fPPmCB7+IhwMZz25iDtCNeA7vGInmJjMEDPYQEthx4MEAGIAPHJhgMHMMlgAGYP5wRgd4PBhoRASo8RajtyYryEnAMZ1KaLakTelUzrXLW8ldmyc38DMVH4xgFt4rQgJLRX6pypxAyEkcw7UeWNJvgw5JBMXD6RmGoejGpOlFNt2sX3bqadJ3XKGdpDom2HviWQltRVhtalIwHW+FhJ+b6HBrWkGolt6eUPVat26Za17jeUxTZ4zDJLziS4Cn0gouJ\\/hLOVJAIAweRApwaTT5Bxkm7RiSe0WCK0kY7Rlls6YagXjbtZu217VnqlSLdbU9VJthIKJRtKFLKl85ACEqOfoYG1Hd7ELfgxrxxiGSPeO8smwrx1GrJt+xbdnK3UQyuYMtKN73PTTjcrHsMj+cdRNSsxIzb0jOMOMPy7imnWnE7VoWk4Ukg8ggggiKjTdeYndWLiCDiABxxGYOaSaiN6dNatOWy\\/+yTz5lkVMOtlHqhZbKSkK3j5gRykRbcY1YknLgxFWO+M\\/WDgnvHeWXZFzah3NI2bZlKVUqzUitMrKpcQ2XChClqwpZCRhKVHkjtHHuK3K1aVdnrZuOQckanTH1S03LOEFTTiThSSQSMj6GHcb0+ZLTqzq9v0gBB8xdt94yWh6ZagXNbNRvO3bOq1TolIUpE\\/PSksp1qWKUeoorKR8oCPmKjwBjJGYJSS5BW9kYwlIGMxZ4jIRpnqOD\\/1f3J\\/ZL\\/\\/AJYb+jXUcf5v7k\\/sp\\/8A8kTqj3Hpl2Mc\\/CcCHGcciK+c89+2YzCpaU6h0axKdqbVLXmZe16s6liTqSloLbyzvwkAK3Z\\/dr7j+qYttRq2CTlwYke4wMRME\\/yjt7XtavXpXpK1rXprtQqlRc9KVlmyAp1eCcDcQOwPnxHKvex7q04uedsy9KSqmVmnen8TKqcQ4W\\/UbS4j5m1KScoWk8Hz75ELVG9N7k061VsY\\/twIVQx28xcU\\/Ln2jMJ3RnUyR01k9Ypq2FJtCoOFmXqQmmFBSw4prBbC\\/UT86FDlI7Z7cw3JR5Y4pyujByOOYrwB5MWHBOIChCfYaYhHtA7fz8w+PIHPaFVjkCCgsQnn3gYzyIfb\\/wA4hCMHjtBXYdikeYQ+RFhx4hCfpByNCkcQqobOTAMZtFJlau\\/mFP8AzmLDCEAwOIrEP8uIUjMOR+UIeDC0lJnT+cwxxiJjP6wdpBzEGlg+sEJ8weO8EcQ6IsOD47Qc+BA4PAMOAB3goQoB7wcH8+Ib8oIQcwU2Pg5NJpU\\/WqpKUakyjs3PT77ctLMNJ3LddWoJQhI8kqIAHuY+t9HW8jpZqW7o0RLuIqaEnTsrGJz96z\\/lWfQx\\/p\\/wz\\/C7+R8lqHWKlbtZkLhos0qWqFMmmpyUfSkKLTzawtC8EEHCkg4II4j60UF+6GdKLEv68eoHWFc3d1Ckak61Qbbk6i2087LNuuDbL0x1TaMuYTvPOO5IMcHXp\\/D6\\/P8AB19I18X+PycLqktmr3xp7ZNl0LpkRXZ+vUdchLzqlACynHUS6R\\/2R4TnnlviX\\/kur1h9K1+TdjdMN76lViRrVnMy1NptHpeUOPLcl2ktKdJl3Ebi2lKgdwAC1E\\/Tl39rJN9O+n1J1snbz1DvujVepfcqqRcclLUt1kqQ+oPpaEkw8lYXLhIC\\/lKFqIB+UwV6Uf0hdWmm3UvRJBP7MTtlqqb0wo8GZ9IoZ3eyi1ONFPuGFn+rHDC4RTbpK6a79tzrlUm6Vt1fp7GkPVRpNoLo9qPRrL04uqsVRMq6tq52p10OOSagtvCUlLSBkoUs8buQPyjczp6pnSgrRjVOS0mqlzTlqzFPdRcyplt0zKWTKuhXogthRV6ZcxtBOcRoPWNQLBuzqWquo2odGmarZ9SuSbn5yRl1EPPSanFltCSlaDu27P66Rx3xH0A0U6g9PKzorqre+h2kVNs6WselvzjDTks0hM++1KOuoL6GNucFAB\\/eKUQo\\/MO8dvVxyLDGLtvbe9uTl6eUHkk1VbmLdINK6X6BrZcFD01pl1N3PLNumQdq7Mw0pNNMvKF1LiHAkBXrqcxlAO0p5xiOhntIujXV6yNXL304t2tuVy0afUJ+ZfmpuaaQJ0szDqFJQpeFDe0o4xjsMcx6X0va23BVNH7h1z14te3rZo8jMPTUpW5aRW0\\/OpeUPXc2HcpQKgw2lSCS4UBOCUAnptNdGdM7BsPWaS0W1BVd8jqDZa5+myTZExMMpS1PNAb0fxNzjpQAUhYU2pKsnmOdycZybbTVLm0++5soqUEklW74+h88dJ7MRqLqXa1iPTDku1X6vKU955sAraacdSla0g8EhJURnyI+nKOli3qh03zXTlI326ZeTq75lak6whK3ZpJU+lsoyQQlaiFY5KW1Yx3GrejehtP0G6sdPpPUa8aQxKfcCbqW5PrTJiXdcZdbRLr9VWPUQ+OMHkJBwDkD3ev3hUbq6dU3hZNximzFW1ZcdpVUWcoZQ5W3EtOKGeUbCnKc4KcjtHR1uSWWcfDe2313\\/Yw6WEYRlrW+\\/wBNjpenDRLpq041OtKVmb9rDesFKaUidoLr2WEzxlFiYSkfDjKAlTikn1MEbSCR372t9LvSbrXrPdsmjUK5Ji9DMzFQrFNk5ttCZZXqJS5gLlyMBS0j8R7w2m3S3eEv1H07Xi89c7fuqqtvvvzMtKsbFupVKrZSlsBZCUoSpOBjsn9YzfTfQljS7qSvnWWr6h0Vxq6mZltFMJDT8t6z7LwKlKVzgN47c7hHNPKlJzjkd6fvfHHBvHFcVFwVX9u\\/PJ8mEJUohKUlSlHAA7kx9AdUKPM9L\\/RLQNNQ2WrhvipMIq5Cjltx3D0wMjg7UNNsH3BJ5jynT\\/STTDp56rrYoWr1\\/wBNqlLlpJFZk6jLp2SaJ\\/esMJfVuOxKVNleeRu2BQ2lRj3zqwk53qcsHSBvTpTEq9d1amJimKqSi2gIRKvOBThSlRSShsnGDycfWO\\/qcyyZcaX9HN\\/Wv0OTBicITf8AdxRk3Vtrr1D6U3hRqTo5Y\\/35TpymfETTv3JMzux\\/1Vp27mlAJ+UJODzzmOJ0ma+9R+qmo1Rt7WCw\\/uSjS9EenWJj7imZLdNJfYQlG91RScoccO0c\\/LnwY7aw7O67XLtp6dStWbXbtoqX8eqjS0v8aE7FbfS9WSKM79mc+M+YqvKzevZF01JGn+rFpuW8Hj93qqstL\\/FlrA\\/i+nJhG7Oe3Eeclj0eF8N1zb\\/Y7Lnq8T4q7bfufNjSW0LbvzUGk2nd15ylp0ifLwmaxN7PSlQhla07t60J+ZSUoGVDlQ79j9Fr70T0rq3SbZ+m9R14o1OtqlVBD8ndDgZ+GnnAZnDacvBGT6i+yz\\/DPHfGk1P6SNVqjrbUdBpJ2hO3BSJVuenH\\/jSmUbYWhpW8KUgLXgPtgpSgq5PBAzG9d16UaSaa9LVp2B1JXIj7ktebQ449IqfSibnFfEbGkhtJdUMPLOE7T8mSQAY7+vyqU4OEvNOkr9zk6WDUZqUfd7ex5rQrN6TdBNItKtbb60+qzteqkrTZ5meps\\/NrWKgGEv8AqlszKGwNyc4A2+NuIyCl3n0ZdY2q0pTappzX6jc70gptuam3H5Jv0GQpe1Xw8yASNysEpJ7DOAMc+5NLNNtVOljR2kal6nyVlSsnRqfNSsxMzMuyJhfwSUlALykg4Cs8cx0+hmi3TNoZqFK6hUvqgtqpzErLvsJl5isU9CCHUFJJKXc8ZjlcoOMpuUte9cmyUlJRUY6dr4NddNdAdONSuq+9NG6tVKhQaLTanWWqUzIuhTqxLTSkoYC3gs8MpWrcQokNnJycxsVK6K3Ve\\/RTaei1MAFTRdL9Om39uUSyGatNJfeUCRlKEoUrGcnAA5IjVZvVilab9Y1a1Zll\\/etJkrzq83vkHEOfEyjz76FKaVnarc24Sk5wcjnEbp6gdSVTsrpSp+tum9lLkFXHVZpTcrOtqe+D+KfmlGaWUAJG53asbvlJcSnJ3AnfqvH1Q0+dVffcy6bwtM9Xzv02PNb66rLV6VKuxoJbWn9MvWWtOTalF1N+cSw96mCotOAMqSVpBSFKScZJGAQQPTNd+qSQ0Z0+07vdjSilVZV90\\/45UsqZSyJQ+gw7tCg0rf8AxsZwPw\\/Xj5b1GfnqrPzNUqc27NTk68uYmH3VFS3XVkqUtRPJJJJJPcmNzOuX\\/qD6ex70H\\/8ASkovL0WOGTHF7t3fz2FDqZyhNx2qq+W5q7rHqKnVnUmt6hpoLNF++HGnPgWXfUQzsaQ3gK2pznZn8I7xhZGIJHOcmApOe2I9OMFGKiuEee5OUm2ADzCKxn2h+RCHPmKSC6Yqge\\/98JjByIsOD34hSMQmqLEJz3GIH68wVDML9BiFQwEDHfEKeOYbEIoEH3hUIBEVnjmLFHvFecHmDSNbHVhOf+e0DCjxDkEeYhxyB+kZJGouBkEcwQPMNtJzkwfpiAkAEMB4EFKcw4AA57Q0gAE\\/nDfURACOcYBg4z+XtGiRDZE9+B+sfXVGoNo2D03aLv3ZrnVdNm5y0qWhh6Qp7E0Z0pkJfKVB2WfCQnIPATnd58fItI+seyXl1Qai3tbWnFsz0hQpJrS5EsiizEpLOB5wsNtNoU\\/6ji0LOGEE4SkEk8YOI5Oq6Z9Q4pcI3wZlh1G63VfIT2tvSvZFP0tuaq6lzFavFpuSqTkmhiYnClueCipDbTKEJb2qSVbEgJRuJPKj6XYVkSVn6GyPR5XdWZVq\\/wCp2tPhtTXzOMNPKcz6aTyptv1CgcpUpDalJCQn5NSXftP9bVTe6UtG0JSSRKusNyzUs8drqk4bcKi4c7CB8oABBIPgp1gqWpN+1a\\/Fanz91VF26XJxM996esQ+l5ONpSR+EJACUpGAEgJAAAEckOizTholsk7XnudEuqxRlrju3t7HI1K0yvfRu8puzb3pLtPqcivchYBLb7eTseZXjC0KxkKH5HBBA32161f1OlOmXTyZues2vabmpRlJGqyjdG+JcblXD6i5rct4NBssBr1GVMnl4o3DuNP9bOp+\\/de6padUviRpTn7KMBDcshj9xNPKWlTzrqc5\\/eBtsKQCEgJ+XGTFXUT1HXd1H3FSa9ctNk6Y1R5AScvJSalllKycuugLJIKzt4zwlCBk4yeqWHJmeN5Etrs54ZIYlPQ3vwbR9VSL6v3XXTfpXvu\\/JCjW1UJKTfM3SKWWmpiac9VptRl1OkAeo16aE79qN+cKxiE6VdLhod1lXppn+3K5CalaW+ijSz8uh1FZlXEpeb9VeUne2j03ClsAqLbmFJSkhWsus\\/Uzeutl0W1dlXpVLpM\\/ajLbMg9IB0Oq2LStKnFqWckLGRtCcZMLdnUzqfemsdH1vq8zIsXBQ1sfBpkJf4dlLTTilhkgHctB3rSd6lEpUUkkcREely+F4eyTTv17+5UuoxrJr53X0Kepi6dSbq1ruWa1WYZlrgkpn7vdlZdKky7DbQ2oSyFEn0yPnBz828q\\/rRsWmUm6h9mbTZGnyr0zMzFyekyyy2VrcWagsBKUjkknsBGrWsmrNw626gT+odzSNOlJ6eCEFqRlw2hLaBtQCfxOKCQE71EqIAHAAA9X0g62790bsGh6e2\\/a9FmpOiVB2dS\\/M+r6rwcUsrbVhWACHFAEDIwDzG2XBklixqEd4tOvLYyxZILJNyezTV+p7boJptJ9GGndY6itbWWWLon5NUjb1vqd2zAKxu9NR52uuEJ3YB9JtKieVKSmvWLTyn9b2m9L170dblP25pUomRuSgB0BxwpBISnJ\\/Gk7igqx6jZxncgJjUTVrWfUHW65lXRf9bXOPJ3JlZZvKJaTbOPkZbzhA4GTypWAVEnmONpjqrfmj9ytXZp\\/cD9LnkDY4lOFNTDflt1s\\/K4n6EcHBGCARK6TL\\/3av+T7V2K\\/mcaXhV8H39THatSKrQajMUiuU2ap89KOKaflpplTTrSwcFKkqAII9iI3xvzSzULVzpR0EtjTelPTlSCQ846lz0m5Vr0VJU644cbEjcB7nOACSAdSNdNb7t6gLzbvW7mZWXfZkmZBiVlElLLLaASrbklXzOKcXySRuxnAEZwnrK1QptgWdY1oejbr1nSzsozU5RZU9MtONKbUlxCwUeQoccKSlQwUgjXNizZYwlFJSTv5cGeGeKDmm3T+vJuFobRLA6XL0tnRl+4v2r1OvdxQrMyl4qapkq2y48EJSTlKSUJABwpeS4rakIRHB1alNMOqm\\/Ln0emq2uzdULOm3JWjT6XSGqrKgBwIUkEFe3crKPxIPzoJSVoGhWmerFxabap0\\/VxtCKzWZKZmJxZqDq1\\/EuvNrQtbiwdyifUKic5J7xx9RNSK1qDqTVNUHm0UuqVKdTPj4JxSRLup27S2oncCCkEHOQY51\\/D5+L4mreufnfbtXkb\\/AM5Dw9FbXx8vXvZ3t\\/2drL036gu0qvVWfodeclVFuep1SVmZlF5RuQ6hQVsVtIwrB4wQMRtDqXR7gu7oG0koUmxNT1ZrFyyssy2slTrzzq54JyTySSRyY1PY1nv1zVGjau16uTNXuCjTMk+l+YXtU8iWCEobWU44UhASo91blFWSok+63L9onqlcNzW\\/Wv2OthiRt+cM+iQU046XnVNLa3KdUrKSEOOBJSBgqJO7gDXPhzycGoptbt8b9jHDkxR1Jt09q\\/JkH2h8zTLSpuleidGn1OM2nQyXEEglSNjTDC1eytsu6f8A6o0yB5xjt5jLtW9TK7rDqHWtQ7h+SZq0xvQwlW5EswkBLTKTgZCEBKc4BJBJ5JjEcDv7x09NheDEoS58\\/V7mPUZFlyOS4Mk04sC4NUr4o1hWyx6lQrEylhBI+VpHdbqv9FCApR+iTH04rerWkNn39bXRjXZGWnqHOW41Rpp55z5UPqQhEtLOBONqnG0lW4HIU6yRjJMfOrQzXW8dALsduyzpWmzLk1LmUmmJ6VDiXWSQraFjC0fMEq+VQBKRkEDEYZc1zV28bjqF2XFUXZ2q1SZXNzMws\\/MpxRzkewHYAcAAAcARz9R0suqn8TqKW3e+\\/sbYOojgh8O7fPp\\/kzHWLSB+wtXbi05tGYcuaXpc4W5d2QQZhwIUNyW3AgcOoGUrGPxJVGx3XlJTlN0P0Dp1QlXpWblKMpiYYeQUONOJk5NKkKSeQQQQQeQRHg+gHUvfnTtUK3PWnJUyot15lpE1L1JDi2y42pRQ4Ni0q3De4O+CFHPYR1+ufUPqN1B1WQqd+PSDbVKbcRJSUgwpqXY9Qp3kBSlKJVsRkqUfwjEDxZpZYauI+ffbsOOTEscq5l5dt+55cfygfpFhGefH0hcc947aOS9xFcDGMiEKT\\/sxFpEKeIPMd0VEee0KST3i3GewxCEJx3xDKTEwDz+sKRjjHeHOIBBz2\\/WIodlZGIUgRYUkc9oVQOYVAVLHuP1ivB7kZi8phDhI5hDTOoAJPI+kMEjHMHjsBDBPkxlRrwADPeGAA\\/OD9DBx35\\/SKSJbAAIKQB9YgA8iHCew9opKiQBMOlAPOIZKfaLEpGRDE2IEAeIsSgf8IYJwIZI7wCAlPtDEDjnMHsMCIE54ENbiYAMntDAZ\\/SCE\\/SGCc8ntFpCcgAc5hhkRMQcHxFKNkN2MMmCDz\\/siBPj2hggd4tKgsOMDgwRjz\\/OCEe8EJHgwqJsXGYZI75hwAe8NgZwItIEQDA4g\\/TzBSPbiCRCoVibfpDpGTyOIbZmHSkDj++HRNleDzBIPtDlODjvEUniFQ0yrxnzE+ntDgDyO\\/MAjz\\/3xLRYpA9oXBHaLMHjtAwIVBYhHnxCnyYsIIHAzClPEKkFlf5wCIsKT394XGIKKYpTx2itSc+IuI\\/SFKT4hD4KCMeO0AZ88cxcUjtCKSO0A9RWcZ+kIrtFpH6RWoY8ROkCs89oVQHkQxHMTGeAMwVRR1e0AZP8AOCPPGPrEI557DxBA\\/lGaRdkwOeP1ghJhgk8+\\/vFiU4EMViBBixKfeGCDFiUDgYgIbESjkRYE5hkp88wwAIwIpILAEjEHbz2\\/uhsfSDiDSTdDSjqWJpmYcaS6lpxKy2eywCDjz37Rlj180mYq1PqX7FU5tMothx5hraG39ky48rIKTjelwII5ACRgYwkYhg+DBEVoUuQU2uDuWa3IyssiWlaRgNuTqg446FOFD7KG20qUEDPplBWD5KjgJ7xzqXdVJps5SZoWsw+imtKbcbecCviNwBJV8mDhZcIBChhSUncE\\/NjYTx2hwmHoixa2jkzdQXNSkpJfDsNplAsBSGkpW4VHOVqABVgBIGScYOO5z2\\/7RU342YmxbbCkvy5aDbjmQhZZWj1E4SADlYUEgBI2gADjHQhJP1h0oAP5RehNE62d3PVqjz3KKAZfFKYkPkmcj4hvZmY5QcbthygY\\/Efm754dSfps489Mykm7KqcUgpbLiVITwd\\/ZKfOMDHAzknvHFSPrExzxxAoJcCcm+TtabXKfJzTb07QmptpEt8Kpv1SkqCjha8ncEqKSoAgDBIVyQct9+ygRKBqlJS5Lyb0q6v1eHitsoQvaEgJKSQrjkkZJz80dQEjt3hgiG4IetpHNptRl5KRnZN2lszLk2lIbeWfmYIChlPHncP8A7R+nbVG46LOzVWmpe1m5cVNKUNo+J3iWwCTs+XjKw2eMYSkpGAo4x8JAg8Y4HMGhN2TraVI7dVclXK\\/T6wqktFmSRJJclCr5XvQbbSskgceoUKUeDys9+57IXjIrp6ZZ+1KcXvvk1VbqBgFshA+GCSDhv5VdyT8355xfAI9ofGYPDUuQ1tcHbz1alpqbL8vSwwyTK5a9QK3+i2EKKiEgKKyN6jjuTwYtqlbp06Z74KjKkRMTXxDOyZKy0nA\\/dqJTlQBGRjbjJznjHTAYH+2DjiGoRRLmzvZq45CZrb9UFESwy\\/OzkyGWVoBbQ8MIaSpTZADeODt88BPeOPM1yUfp89JCiyza5mZL7DqAkKYSpQKkD5cqHypA5AHOB8xjq8Qqkn3zBoiGuR29OrNJkXJF92hfEuSjLjTqVvJ9N8qWo7inZkYQtSe55CTkAbTy5C76fJy1FlnrVkZj7qnGJp5xWAucQ266stKO38Kg7tJ5\\/CM5ASE47z7Qqh7RLxp8lKbXBdUps1Cefn1SzEuX3C56TCSltGT2SCScD6kmONjI8cw4Bx7xMc8wVQrd2UlPPMBSfEW7Tn6GFI5\\/SGkCdblZH0hCmLimIU8QUUnZTt94m3P0izA8CEKeImrGIpODiEUP0i76GFIBPeCgsoKcjniEUkH\\/AIRcQcmEIHMFDTKSPYeIrKPYRyCnMIoHwMmFRSZ1AST3wcwyEZizZDpRiMkaWKlJHcfpDhPMMlOcQ4RxyP0hiAB594bjyYYDAzjETZAkSgJSOw8RYlBgpRiHA9sRpQm+woTgwdsOBBKfcw6IbKtuDzBCfpFoQDDBvA5EWKytKSfyiwJPgQ4QIcIwIKE2VpBHeHA+kNj2xBCSO8UkKwBJ9swducGHCfcQduYYrsUJhinjxBCRD7ODCoR6FQNIZy6tPbduG3nXJmu3FeD1qysgpSENKUmXlnG1b1EYKlTBSckAACOvuXT9m3tN7XvQzbyp2uVSr0+YllBOxn4P4bBSRySozCs\\/\\/KMRj9t1+s2jcFOui35v4Sp0mZbnJN\\/00uek82oKQrasFJwQDggj3EcN512amHJl9W5x1ZWtWMZUTknjjvGajPVzt\\/vb9C3OFbLf\\/RQE85MWBIMHZDADsI1MmwYxxiCB+cNj+cHG3zDQhMdzCkHOOYuGM9oBQT4hDKwMHHiAU+0WbT2EDBx2gY7ECYhST+f1iwjj24iYIESMpUj2EKUYi\\/bnmApJ9oOARx9nPHmGKfpDhPOYmCM58wMEylSTjiEKYvI8QvH84dFJ0UlIEKU\\/SLiM9jCqGO8Kh2cdSfaE245jkFPmEI+kAJnHCTzAIi4phO3BiWUmdaE\\/TEME\\/SJEjnNRkgwyQREiRaQMbbnxDoTmJEikZtjgfSCBEiRQhwkf+sOEee8SJDRLYwSPEHgjjnMSJFJEoZKfYQ22JEigbCE+wh0p8xIkNED7TiGCIkSBgEJPtDBBHMSJCAIRjuIYJ94kSKoTGCfGIm3\\/AJESJALyCB7CCB+cSJDFYdsTGOwiRIQEKSYG2JEgodgKPpE2ntEiQqGmDbA2mJEh0MBTxAKIkSJCxSn6Qim+MRIkA+BCgjOYVecYPIiRIY0xNucDP6QqgAeYkSBopcCkA9oQoz4ESJEMZ\\/\\/Z\",\"link\":\"1\",\"is_show\":\"on\",\"_token\":\"aaUNfuHsrvMysVKjYsJCbzRpSzIDkmup5jD8wGfH\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/banners\"}', '2020-09-27 01:48:44', '2020-09-27 01:48:44');
INSERT INTO `admin_operation_log` VALUES ('284', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-09-27 01:48:45', '2020-09-27 01:48:45');
INSERT INTO `admin_operation_log` VALUES ('285', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-27 01:56:30', '2020-09-27 01:56:30');
INSERT INTO `admin_operation_log` VALUES ('286', '1', 'admin/banners/3', 'PUT', '127.0.0.1', '{\"image_src\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQAAAQABAAD\\/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD\\/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD\\/wAARCACYAV4DASIAAhEBAxEB\\/8QAHQAAAQQDAQEAAAAAAAAAAAAABgMEBQcAAggBCf\\/EAD8QAAIBAgUCBQEGAwcEAgMBAAECAwQRAAUSITEGQQcTIlFhcRQjMkKBkRVSoQhiscHR4fAWJHLxM5JTgqLC\\/8QAGwEAAgMBAQEAAAAAAAAAAAAAAgMBBAUABgf\\/xAApEQACAgIDAAICAgEFAQAAAAAAAQIRAyEEEjEFQRMiMlEUQmFxgbGh\\/9oADAMBAAIRAxEAPwC7y7kaVczrEpVEUDToUszWA2O++2\\/IO5sXkUVRUUhDMiwbfeeZdRGV9NwRYD1EX2NvgbI0c8lLBrifzJHU+aUKtp3It7DfY9tr2JwpSVKJMjs6rpdjGQyhWZzezfrfYW5uCNrZfYunsE9WGKQvoVApfUFuhBNmTewuy3sLj1X77JQ08ZqHlq42lcARyIlgzesk3A352uBclhvjd3ghZI5ZgYNCaWkcgFNgt2\\/Idufm9uceSSzQqifafMadyIfVYAatmU8dtjtv72Ix1nG\\/mTVaxxwRGS4veVr33FrFidRAU2UHgn2Jxsrko6LTJ9oQ6lhhS6MQDcsOxGkduebWwlQrTxqoZROb3IY6x5lt2K3\\/AAcG9+4BvdcKwNUzU8zOAqepQUe9iGA2F+OTcj3xJFbEZ6epjqvOZ5YlmTzHJi3TSeCTf+a99u3uMeVEc8QX7RUjVGt3HpJDMpNgDpubfPDbY3zKrqApj8qJHivIFjc6LEHgdx6f078Ww3DrVxqglXyrAkfhB2AUH3v6Tb6XG+OOfhFTSVlVVRzU0BVo1lqQ2oBbIRH+BhdbiQWufyrwdsROZ5lFVTQUiQeQPN8xWBuryhWUeokiwJ1AX+V3CgyucHys4alSrMcMVI0kmhPV+Mg2IFz92gO\\/a5BB4rjrnN4slpK2vMkcS0lPJPMPLD+XTLGWexvYG50jexuQALYdBKQqUmvCpvHLruTPM0\\/6G6efXT0ju1bLTsGWZ+CqgDYAbHffvYKFxUGcVdDkEEr08OuOIKgRwFjecXKxnWLelQAWCllKlr7MMJRZ5mk8FRXzyAGpElVLp3E1QdKpZCVY6QGABvpKH1XY2heqHGb1lPSx0sMYpofJ3csKupmYNKWYsVBAlI2tYcbqcP8AFR0fRPpykrq6KozYHWjl7rOEWJo7WFw1hpd2RmAYsEgYWYkDEvC8JjjgF\\/LpywZSwhHkoQ6yMwT0yOzEnTYA6wd9QXWpipqOhjiy5JzJeOONU3SZ3W8gVLMWs2kkBiupSSupGV2GeV65blztNBvHolqNExdHdAD9nFhpUBmQgi4ux97CU6J+9BV4fzNnXiZkdGWklgoD9qrgBb7wK7xllGwNypY2sWKkflA7d6fmpzEhVw1xqBtx7fvtjhPwnr6fL85r+ohWQy19NTRQzOCTGpmCEsWF10sYgoI02VDfm+LSynxb6ip2ny\\/LJ2qJ7FCIoNYU6bp3FztvuLXNwcVOVGU9I1eE4whcjqfMcoosxUSvErOBcH\\/b\\/nPa+A+bpWOlqg9MioACfSLYiugvGWmzpoMozlJKKusI9M8RjEhta4B4JNttxdguonbFgGSmq4zJDIrq+6sNw3yD3+uKankx6ZccIZFcSQ6OneOIQvqVgLHm99thcnbFk5dVhoxud7n9MVhksscUhXnn627jBvlVULAlhuNr7b4OT7bZME4sMIpFA2O1sbGcAG5N8MaeS8Y9WxGNaqX06QBcjbFR\\/wAqZZscPmaxnSzEYXps0ikFwwO\\/OAXqGsuTGrgW5P14v+mBn\\/qLOcun8uBdYZvSx\\/kNhsL8\\/wCdhxi3HEmrK88jRedPXRva7AADc32GHqur2RR6j2A74oik8RszppwZDFJEbj7tWupDb7D123AvpHbBHk3iZFKBJUrDG4\\/DpJPmrydPe5se1u3O5Z+OytLJZa0kdluCpP8AjhnISfj22wJL4gUTvdpTo4a62Fu7XPtcc2vb9MSK9R0rWC1ETF9VgB7Hf9Rff6X2F8IyYW0Mxzpj+osAxbdRvv3tv\\/liErYjJFJTiw1bBrcbbH+uH65rTzloZPTrBG19r\\/1Hf9vpdKsKuvmgA3UEcgW5xUlCUPS9GSkBtWqTRoiPogqgGswFvWLBfpdl+mm\\/fasOu6KSjPm0kFkdHCdzqGooB3vYAe\\/q27Wtmq83TpZ1jcyFUKAHTcnQLf8A0JwB9V0jT5coQaiEWRGJ0gtsw2\\/8lX98dF1shoqjNaUyUFTKpWQTsxj1rypNk5uLXUb27HvbFA9d5WKR6dgpPqtKvJD2Dalt2sR33P8ATorKhFPA9Mmp\\/LVETVsAVUMg42J1En2Kj23qfxPycQRPemXQCU8xAd49\\/L+AQoUW\\/wCG7gyftRn8mH62c\\/51E8bCRQpu2pG7SEBbnce4I\\/Ud72ifLhmpzTfaFJkjmRIixOkABo7XPBII\\/TBPmMV1eORDLY6gAx33BZfrYt+v9BbMBLSRxVDExNHpZApIAKluN+zb\\/v8Apo9vsypRoYZPUPFOI5kPlOAXKLsihiGPa+xbvtqHzi5MhWip+nlzTPJI6Cjimgl9bGSaca2ZDDChVqjeIqCGjW40tLFqJNL1iTZdVmuoGbyo65liLnQSCFlXVbjkat\\/i+CCWrlrMvqLyS1COYnWRla5LEuztzbVfUb\\/Fu92xlWyvVBF4ieIr55SDpbpuOPLMjSctUQ0arG2ZSE7SVUiqGnYNbSrekKoO8heWQb8Pui36mq562snhoshopIo66oMiXWSa\\/l08aFhrmkKsFUbbMW0qpYRUVJX5vnNPlVPDNVVVXNFDTQwpqkmdj6AigepidgBvfYb4vfprLMvXMqXovIqOP7F0rTLH1Dm7MG8mvkCitgpypIlLlBCZUsZEgjRGWLzpapuOLyS2C3SLl8BajMFkhyWXLEhy+oYfZ3WX7QsKKupUDj0SSbMHZd\\/Wy7aTq6MyTp6HRGFprPJpUXXVYsADYk3FgQP3+mKe8FOgIcoros2yKnmpKSUBJoyoa9gxRtYADjSwF7Dj6Y6GoZ4cro4oKedpqmTU2t9\\/SLAH\\/Pni3GL38VRX9ZJU1KIqaQBgsKswUjhm7799\\/f8A1xDVNbA8nlwypZdybBrk\\/X\\/L2xLZnX\\/Z8shpCbl0DSMNtItv9LXIGBapr6bL3vND944F41tZB7bn\\/PC472zm6NKSVbPPVuwaQ6HAVQJBzZibWA1Abcj+axOMNRU1KGloXgjlBBvrNwRewb4GkDVcj9tmcBe4IneIxoSpmOpWBBAv21DntbSd\\/Zt5Vekb3c6Gk1kPpBZiQbXJbc7HUNhte\\/GMCjRv7FJmaqLyREqx0SrGoLG25IA23BuL9u22wb0dSrTDzYYisMLFlZQhjGon1Cw1BbbD3PPbG0tHUxsGE0apZmlViSmw5ubC9vcm247kYxopWeaKFNCMPU7XtpJOzBbgkj22G\\/via+jr1Y8qalJCZ6WGcDUVfUQQtip0jSQL+o9zfTttyzWsgSoMkhZn1BlvGNzvtZtvbe9rX47OJ4qiaAh5EjjLK9mUBmI08kmx9JPH8x5FrI1MMhoIpJJAwc61LE3ZdgNxcWAtz3BxKSIEKytjqVkUlUcOrBFAGlrXsLHfvYBt\\/nG8NYyhNVHHYIC7smgq5ANrX9QAQ22t325GlTAXiFPrhVHUNaTYILgqCRud7Hb6nY49kqY\\/LAkZZXjkUAAg2JFwS2w4Gkk7n45HUBbYP9T10OXI+Y0rwrKsLQuT93JK4KeQbgk6VedtXbSx53AoXx0zRMr8IPPWV5KvqOtiRJJItbQqrmaOMAoDqYoszIy3DahvcA2p1xIsvUHT\\/TtPVEwVs1RWVFME85nhhsCrKukgn7RqDbgGIbYqX+0XnNZnOVdLZglVGtKtTLPOYqcyQny4mkdls3qQCMAqbXVwB3s2KZGrKe6uy2ny+Oly\\/Lkd6CmpY6yK4WSX7IY2mOiQ7PvUTWO99QOnsIChhkp5JayuVxImmYyCIr96VvIRa4bTrt9CCRtgkzahgq+of4RTshpo0hiJWQ6WYGIFUawKKyglR2LDETNBOiiNcwQmtkmqZnEaxs4LFnJ0knXqHIs2prAbDD\\/oNJEBmGYPRU8Uws9dWTlYI2P8\\/lrYgtZxpEZtIWVjoFnUtaMzKtiigip5hOfsIBLzkea00h+71SKebxO4axAIQMCMPM0rH86prqdTHKsf2amhWUEqxHlkaF020q7bWI8yVnXbYSWSdGV3iBnOWdMUv2gwyVMtS9aZNX3KMoDFdrW1Srbm+i9t8Q3QcMbm6j6x94bdC57nWRVGb0CLE3UNQVRGUgeQGYAWGwGoyC38qi22O1P7Pnhfk\\/Q9PI1VBTVNWQsbzFQCAFF1+uotc9\\/0GAUdFS0xon6eijp48uiWOCFIx+EKFW3tYAbc87YsfpfOhlskq5mWo5pgZnIkvG1vxE3FlO4J+vOE480fzbNfmcCUOGow9+wC\\/tRdf5LmuZN0XlOUUCpRkrPU+Qpk1gkXVtitiGAsRwTfcASXg\\/1D1FUZNBk3V9DXU9ZHTRVlHNVU7QjMKKQusVRGCAGW8boSm3pB21DFReJmVVadYZlHWOzM87yRSBSwkQsSCT8gqe\\/PxbE74SZ71PmPXGRZZm+bVtbRxUFTQUsEs5kWlg0mYqik2RdaKbAWxpfKQx5KhjV0k7X\\/ANMn4pTxRuT9bTX\\/AIdA0dVprgnGu4798HOVTEsBbjja+AOkpmevQblkJBtv9cWPlGXyGNHVQQR298ee7aN5a9J+GpKra1iO3bDaqqS5sWBGFDFZL25HfviPq5liQkWsDYn\\/ADwp7djltEdmEazsSb7bm+GLUVOxv5Y39Jv\\/AM+Bj2arMkhsRYE9+cbwsSdx3552wayNAvEmMJemI6h9VJFpk3u97Em1hxxt\\/wA7YY1nhxm0kKzQvTylgAUdArXU8353Bta\\/vvzg5y5UXSW3sRexvY\\/XBDQ6VfSm5IHfne+CjyXYmXHi3opWaj6gykoZ6KaNGayk6nZRcd+dzci2w52IuHNF1FX0pMMkUpKBXidWFtSn1abb3Y9gLAk22YAXe2TUmaQlZaRWUbi2n9TwTgd6h6FpqylsreoCwLOQNuFuNvpb4xYWZMR+OgNyvreGd42k1INghUWJYWDKFG4Bs3awOk74MqfO4qinMLTKzJdWPc7Xt9bW\\/fFW5t0fmmVzu8JJbVuQp9XFmvt7WHG9ht3ZZZnOYZJUTGUP5ZAikVmuUcEEXtt+YX99Qt2GBnjWRaCg3As+q0ySTosa2kXWCPxObaTt9AtvnA1mIaqgdmUp62AJA1BSbggdrG4H\\/jh1QZuK6GKZnLFG2W+9u5\\/YG3zjSqjEFW8aqilr3IUktf1Asx4sS4AF+RihOPVlpStFSxwtT9Q5hDMllLJPpkB0ovEmnb+8wuOxXgDAd4p5UdE0MgsSCUuFOp7HckC+4Wx7ej6HFoZll6jO6iv0x+W6pT3e5Uelg3Yi12Ta2+kDvsKeINDNmXS\\/nIH86mFt\\/U5HpBXkC4YAbmxCg7g2x2OTjIXkj2izjrPZkj+0B1CxrTuQrbm123P6i36Ygs6giqYYtTOlZ5TuUKkhwHYBf\\/Lbfi\\/yfxT2epLDnL06pYiRoSxbb1sdBvyRdW\\/e+Adsyqa2spmSUDzFsum6hWJcjSb7C5QgD97nGtidoxcqpjbM18\\/L0MZcqt5fwj7xz5UbbjsArW+ow9yavg+ysxleWMWSfzmJJZkUKi\\/ygFLD4uRe1g2lKTSxzLZRMrtIiiwVwtyttrbaWsNhrsOMLZZTVRmhkoqOaokMiwaIIi0kpd10hQFb1aiw73uABfl6kqKsk\\/Bzl7ZpNUT5dkZDSVsJpmeyKY4XAaUmQ7RDQHDuGUeWXVjoZr9V5U2WmjzX+H5an8KosxnqXOh1OY5lJKxeoc7N5Ufq0qLWGi\\/qdsc4LShMtk6N6YpIs4zjMZSmY5hRKZ3dUsRS0uk2eMWLSSgfeMiqh8tS9R2l01kTdF9OZZTVZFRW0EC1c0Ck6lq51W5cb+oMoXSDt5fc7C9xl6Vsxanh8y5VldFA0ZE1H9xOikoBI4UMrEk3IPpuSR6dsWpkuWxV2Zx1ESEQVChlB5Rrbr88DFTdJ1GWyR5hQU1UaiWhq6ejklU3YSmOSSUq1iHXUCO9l3F9sX70ZlQGXNWODE8akadiobglT7bn9QbdsOyaFQ9BTrdocqaVYreZEFUN82ubfrf9sVTWz1VbKZqgm5\\/CTuLfrixer2mzOuaOCMhL6tRFgFuePr\\/hgd\\/g1FKuiavhVk\\/KUbb9hzg8apbJbtjMfZFb76dnViWJEamVtxa1uG72vfbv3dJNlUkq1JjkkE49elFaO+m2x3v6b3uRxwcNKV1UpLLJI0ZhJ0qNTEgEkruAPf44sdyVZmiVYyssvluoZgVWzabgagFG\\/Y\\/7DHnnpmkxRzFJULL5yPG1uEDEuCdVgALc+3AJ+nqCKWaKOkpo7OBqsAdz6iCX\\/Ew4tfsbc7JCGZ6SZWJLQlzEVBVjp1MpKm++q\\/FhYe4woZydcMTKqhSUDOdZJAFj7Eb2HIPcbnHAN1o0kd4pHiedaiJh+NmK6m1MFvxY+9x72vwFXjjWd5Vey+bpdV9bMy25B\\/usb2P+yT1CfaYZYhoVVuoewYXJJJF7C3bb2HtZaZ5pI3Xz5IroYnug39wCVF9hvzwB844hmMsFKQ8SMxkJEd0\\/BcNcEc77C3z8DEdUxwQSa\\/KJYsTpAZgwvsDyRt2PyDhYZZD5Dy+a2uSRxrIXSu4Fyo23G4Hbb3xpPC0JTW4vceYsq7WtbkfiuAewHAve+Ji6IYAZ5RRv10ubU09QXpKWOnCyw+htRlkuG4awUXFrWHziu\\/GjJKdfDF4KmjNbBTzCneRVCNEVRTdhYj8UaobdzY84s7PMxrKXPKSKigikoZqgOsu4JlDNAzkj0gqukhQbHWeBgV8VEp63Ic0yOmhhZqpkhoLKCpkdWQM1je6OsjX1fym4Jvh8dgeHMMtfHmVc2ZnR5LwgB5I0VSwKAuBuF3jABHBX3F8MWhkqoV852iAl0yOF06QrE72NgPT8AlTbcYk8\\/iy9aGipslACtDLAGZCbFSp0uSbki+kna5JIPYN2RqbK5J9URqKops2phu7BgLWB454u3thiTGp6K4rX+2ZrpMk\\/lUoaOISOQsMZLEkXIGpxqY7Aeo9zt1h\\/Z98O3ynp2DN8xWRanMgZBEYwvkoSWEdvy2LSEjsWtvYYpjws6EXOuqkStpmmpow1XUJ5etZ44gPuyD3L+WO9wrcEY7f6ZyD7Dl1NTmTzJIkUM5BGp7bm3yd8Vs8uqo2\\/isCcvyv6GsHTxIWSE6HUFWA4Ow\\/yxs+W1iBkqqESqwt6dri\\/f9LjBrSZaCOL3+MScWV04HrTfvjN677G3PLFKvQDosmhnURy5OnlsCLSIGuON9t++HdP0tlWU1MlfSZLRU9TIhVpYoFRrWsRqAuTYW\\/S2Dl4oYY9kFgDiOWjmziqEEYPuSPbDlOdVeilNwbutkb03kbVVUZXBZdz9MWTRZWqRiNFBC7Xvj3I8iioqdYtANgb22xPxwiFdvy7i\\/fAsU0Qlfl5EfovqI2uLi2ArqEyU9w622N78\\/viyK3XOp03uN7C2ALq+lN3Vh+FTIzdgBvfAJpjEqdAgaiNTqNgePjDSfqWgo4pJWnuIdmWNS5B+dNyDgQranq3qIznJMsFPQo1vNnkszd\\/w6rgcbfOHOXeF+e5jCwrupq+P8S2pGWEC44NhuO1z2GHYsLzSqBObJHjR7ZGElJ4l5YJlj8ur83zUhGujkALNpPOnjS1\\/p+2LB6b6lyXMgklLXRN6wlhKLhr6Tt9bY5t8TehqrwyqKLPYetppK4yioFLVBZSTaNdbFQLHTFZRbm9+5xD9I+LaGSnPU1LXB46qWWeenpnMyKImKINJuQWJay+kkb34w7P8byOLH8mSP6v7+hHG5\\/F5jrHLf8AX2dsUeYrTsRZfSSCNf0Fje2\\/H78Yd1FXFIrSS2GtSSDwb84oHpXxRaSpiFXXx1NCyWSr8xNQdifQ+k8XFhIPSd9lNxi0qfNxUpa5Grm24\\/f\\/AGxTWi1PE4u2PMyy6lqkuFBYC3NrqeR8Yq\\/q\\/ppI43qoIyXXY2uTwf2NvriyzWiRSLD335PziLzGmjqo21cspBPt7cYKM3CQqUEyssqrpctrDRvENAYIDq\\/I29x\\/zv8AqSaZWqKZwu7xOGjRLC4Cr6e3xv2BGI3Osi1q0sAtMilY2tcbg7fO\\/wDzbD3L6pJsp82RF82NDrFuWA2\\/ptccjb3GIyrsrAUa0QYpRURvMSrxMJ5vQdmDFWUj3uoNv0OB7qWBqjKp0msC0Lw+ZYKPQCNrkbekkAL\\/ADDvuYUkKxxrRSvdISIGVQboLsq78kWIN\\/pfA51GqzI6CLQjOrq1+W06jb9Qp+v0xVumT9HE3ijl0lN1HVRRL\\/3JmEii1w5VwdhzvuPjVin8xjaOpYQxOQsl6ZUBLFCTpAA3J0oD774vrxpp\\/I6gqKtSysVCglRqDAMe1xzYcnjFEZ5TiZKWofWyyQOjKQfu7AhQP\\/1B7Y1OPK0Y\\/Jjux+YMspczlo2q2q9qkstOyhLeVIAUmsytpa1woKMoBDm9xPZBUZt1NN\\/03kOQU9JBVQFa2ajV9SxINJnmnkdjFEGYeYQyxekFgNIOB7L6X7ZVUddKVEb5ZO0rstkTy6R7oL7MABGSvfzNzvhap6jzGuoosup5xS5Z5xeOlicIjFD6WZlC65B58i+Y4LEbcaQLyX2UdvZZvhb\\/ANOdO9X5ZluTv\\/Hc9rKyKOnqYUIpqJgQPuhu1RNuAJFsqWbyzIzRzJ2BR1CZf1HPm6ZUWy2KpEUUkM9ppp20s8oYizRwL5QX1ABmhJ\\/+VwePPBOOXJfK6yQyyZ1nVaMk6diWQCSWqmktPVBVGpEiiJVW9P300RU2SQY6l6nmir8ujSmBGWdMV6JJFCPVOi7l+PUCwci+opqRdwLY0ePqJUzvZK0nTuddD15psozqmULXSzyq9aieoBQCZfSE03a2x2t8Y7AyGXMavwvhq5o4qasqIwLagybnTyu1rH8pI4AJFifn919ndd1BIKHKEqsvSvyE5hA1QFaWIJIHSV1W\\/MKuxAubA2BbTjuHoHqjJs68I8lgyfM554Ep41bTEY9TBb2II3BJU7E3BHzfsycqoGDS9EM2yaqykvHFWR1VRNvIVva9rW\\/Tj9MN6PpVp6VJQg18O+rRdv8An\\/NsS1HWRySNUVa6i8lyVXv7WwjnOdmQx09NURwBPVpIuRf449t+dsEm1ogqhmFU8TRJMjEuqRlLkgbah2H5dt+DxwNVFVU1LVEaRtJCAH0Cy6fyg2AubD24HAwss8dFDEr1AMZkCltIsBpGq1hfbUeR225sU8vpyK4RUbSAbSM1gpVbXJJF+BY82txuAMYVml6bROgqGzAaLlFQOyWQsACf8bck2+thvDNTyxosFNLJPG3m60bQdOpge34fne9xxbHsVPC0i08kyRtGG03JvpAsF723Ptb62thwslNN\\/wBvRRNrjRmjMe1gpBtzYgbHi3xxjmgZKz2nhSWGN5rRyFhd1Y34IsoAsOxG+q+E4Gc62jqBBcEgNZWKlri\\/zuD7fuThBKipnYUU7o6iT72QLYi502AFgBfi2wtySNlJ5NOvzZlaQTWUalut+eDvwOx79zvFAtUI01RUw+WArmJLPpdiATcW23FgGBttsfqD5XJGyOQdZe7LxcC5uQF3G\\/btvsbG+rJFNRqkKqJ9XIJC2I1XJPO3OnbcHmwKDiTy2CMZ3N\\/OaVQu1z9S19ue3GOSIBLqKI5hLlmZl1gWna6yIdJQOLW3G\\/5r7cgG1xcDHUwE+aUlHJRy1FTl8rVPkSrZZVEZJDLxuzyG9tyqncg2sZmpDUTS1gczSaLpJsPS3pJUWNgD2J\\/CObbgXWNHVrWpWxveaLLKpy0dtLBQgY7fhJM\\/a2ynYbjFmDSVASs5g6vrCmbZYlQJkSl877S4JHmPJMVUqebsSdr3A2G2x8SBZXp1rpX8gK2p41KkaYyLnT\\/48ixubdrYddUZVmGd9dplWV0NXXz0dXol+wwGSSTTK5VmVbsV1EljvbWzEg2OLAo\\/A7xJOVLIOjayJBCb6J4mYXD7+XrL3GoenT7bHDFOMXtjljnKOkTXgZ0utNG2ZzpG1RmVcHkmQWZ9G9m7GzK5B9iB2GOncupwqgW4xT\\/hZks+WUOVUVdQzUtWh8yaGRDG0TFSSCp3H4u+Lto4SEu1gwH74o8h3K0em4y\\/HiUR3CoUAD3w4uwF2a30ONIkACjGkrPI4p4VJkJsP9cISsmbd6G8zzVMq00C6pG9jx9cF+RZMmXwBSS0j+pmt3wj0\\/kUdGPNYFpG\\/EbYI1i0lbmw4398RKSQCT9YtSgRg7b2tuMKvuotwecarp3Orj2xtc82tc74C7Bp3bETGFJugA97fOBTPqNpatpNAIIYHY8W2H03wZFBb1b\\/ANMRmY0cT3JjUkN7cWwppphxdspmpepop6iOkncNKNE+l\\/VIuq4v+3+ve73prN2aMUlU8auDydtQ34\\/Y\\/T33xK9TdO1K1TVFJpWTlTcEDfi3BH+VsC1dRVskaRwxxichV0yPZWIO51WNrAE3HxzfFnDk\\/C+yDz8ePKxOL9Of\\/wC0JXZpV9SZhWzyEqZCsY3UaRcLsbcqF\\/piv+p\\/Eyp6p6e6X6dk6cyagHS6TRw1lBB5VVVCRr6p3B9ZW3pIA\\/E973OOkOufDmLqF5ZpnrIpIyFLRIZFIVA3qF9RIU273sfbFYv\\/AGeTmErVfTuf5XPSn1h6hmiZ19woDXHa\\/vj02b5PHzceNQn16pJp\\/wDqMHB8Vl40pXG7dpoCujPEjOuk6orKJly2WY6lhhGgbAKBcWAKrupsNr8mx6a8NusaavoIJctqTPRuoNrbU5O\\/lgjZktbSRtb9Lgs\\/hPldD0T\\/ANNNItRVSSmWaUIWPmfCkbAW7\\/3j9ITKOmetvD6pauyxxU5WxCMDGSH3ud72HccbkHnGDz1g\\/M3g\\/ien+O\\/LPCsXI\\/kdPRZikiao2BLdr3\\/943aq8xfS2n3APftis+muu6KshQSh4JAAGV1IN8GWX5pHUm0bg7A3+bYoWvWOycSUfofvDdbMl73sCPg8Yh2giXXTIQilQpBN7AtYm3zsbf6DBDESRte5F\\/jjERV0ySVZDEIr6QvuSL3PxyB+mOck40Z84OLIuujkD+VIAGMOnSp9Mt9m+SLBfpf2OBjNWvGgtsiMHBHqRhpuAPY7D6e+DXNYBIFZgCE2Av3Nrn9ADgDzxZYnqI4CX9KgqGCsw9RO52\\/NzcDj64rtbAlaWzlrx9iSLM\\/tCAnSrudh+MFAL\\/8AO2OeMwSLyZE1M4il84r20vdST776P3PGOj\\/G1PtlawVWKtJYGxGokkAG\\/HJ\\/UAY50qjBFmYFUC0bhhIQt9C2sCN7FgpuBcC9samBUkZPIdvQ0yKL+IZlRUETACWWKFgG9SxyN5TqNrG6vqv7R4mOk8j\\/AI1mkdDNOtKgk+0VlUQpFPSRo0s81iQSEjUyW21WsN8QeViuyrqOKSnUCoy1\\/tBQPs6wRs7pqBsQwBGx3uffB9kVDlGT9MNlGZVRom6mhV5JdKmWLKonLnTGGKmSWZLKrFCPJZWYLKGxdgtWZ71dBhk+YR5rS1HU9GHyd6YHK+naNoElFJRxrpkdgi+r7t5VZtKs008kq3KSY6I8PshrJeo+pKXNqnzaXOqWeb0OiyQrdZbopJ9R0ErqAuGUMBcgcy+Guc0Wf9YpUVzRZbRFloaKGVm8vL4DHNpZgunWFdtb2UeYzyOQGYnHY\\/TNTnGVeI0eUUdPBHkyZN5caRr5chKUIUtZQUYkqDYEWI2GNTFK42illuMqGnS3h\\/mOb9QUmbZ\\/X08cNLSVeVGKNNEfkyTzTaApJKLpqWW26gRoPyi\\/S\\/RsLGrYhI46Ziwp4lSwCFSFsO3AKgGw1WAFhanabPKuKpp6AoAFZ5VlFth6QGta5B02HA42POLC6fzTMRDFBFrYNJ5jOB6jew57WsPphskCmEXXVBX5V5eb5VJ91URF3jN7H1SXO391Af1+cV5V5h1LXVPlrdZdPmehgmteNQPtx3we5nm0cuTimq5VlZVfRFf8SrFIxs1uPWvPthjJRZbnH2Q0j7LSiwcamNmKk8bi9h+1sRHS2SAtTUpVSEu5EYUAXQEtbk3I2NrHcgEm3vfyj8mMAPJIdP3wIaw0XIAAFhvZRvf345TjzCnSocI\\/mahoA9JQgD02sLgnji\\/HucTnT2V+fIJahDoDXWMG4BJv39rn98eZyZFiVs1sGGWXSGBoZpkU0tNIDpLSBQzKzkgXB0+19r8jsScIzQy07hJxUKFLPEWiO2\\/tbYlrfsOOMWhFBFBDpkVQANhiMzKSmUlyQLe\\/tikvkG3VF9fHJr0CnalbXSIiVMhOp3ZdLBrexGx\\/Fta1\\/cY1p0jQGkWXWtQWRmQWJ7AKbXNrm\\/ttzaxl5IaGrJip6Ay+ZcMYlO9jte23742PTOZTkFoZUj32ciw+lt8WI8yP2ivP4+f+lg88lPBECZPMlDDkW1X1XAsR7m23xyb40kqmkh1ga4ksAAw9d+Rtbcm3v\\/XYto\\/D2MAvW5jq1XIATj66iQf2xN0vTmU0bAhPNe+xc33729sFLm44\\/wAVYEfj8rf7OgBpOn6zMU0JT2Ughy4sGBFz6e1zY9u\\/O1n1P4bZZUmNsygFUQksZV\\/wlJGBdSvBB0jkHv7nFlU+VxomkWA9gO2H0GWpazDbnFSfLyTetGlh4ePHtoEco6Hyyjh8mhy+KCLUWCogVbncmw2398TH8FihXSIVtawso\\/qMT5WOnUgWNsM6qvpY7mSULpXc343\\/APeFqTfpbS\\/or\\/qjJKSKRavyx5yGwY\\/y8EfQA4Sp2sgI54t+l8TGZ1MWbQTTRg+XuEt3Xi+\\/zxgfyuVZIPLFy0TFHG\\/I+fkWP64sY52qD60PKirWlg897k3Cqt92J4tiWyOlFhKwBd\\/Ve2K7zrOkqM7hpEl1JTkrpA2LDYn97j9MHPTecrCqiZlZbCxw269GQxOa7BnA3loLr22tjcTk3JNh332w0hq4quLXGx9N7bG\\/OMLgm9\\/0+cJlpgyjRIq5tcNhxC4KEbD3OI4TBVG23JwskxUnT37YlMU42Py1xpA+L4TmQMVIJBJsT\\/nhIyG3P9MKBg0d\\/j9sSL8IPNKQTqbAC7agSL23\\/wB8QxyeJmKyRJYCynTxbvv+mCqaNWGnf9MM5KfTcDcD2GOTHJteA1Bk8iuzL96p9SiQ2N97b2ve\\/wD7wN1fhxQWmvQzRB20xPCbMvrkYaSD6bagBbi3ttiw1UA2a9h8Y3O6FWs+4IHFrdjiVHRYx5JRdlM0fQeYUlN5YqzIy30tIh1LtuR8E72J4ba3aUo+nsxpj9laKN6XvTs91KlQbXHAOkXt8+9sWVVQJYWUMFHtx2wxdAQANK2NtsBKKjuy\\/DO5LxFfw9C08UxqYqNQhOoKTcj6n\\/TnBDQ5FFEiny9A9vYfGJ4Ot7KPTz\\/wY8LLbTuMDKfYXNzbGMsKxJoTc8b2xFzxKainDksqXI+oK2v73v8A0xNTMxudQt233xD1EbtUL97ZTexHY6Tf\\/EYGPpTyRrZG5ypEcaeZbU7cD+42ADO50p2mqZALvYMSQbALx87XOLBzBY5FjGohUuy\\/O1v\\/APQxWfXFRBDFJTyuEVpC5buLWN7dwLgfrgowuWzOzSaTOa\\/GmoeWkiqo2Os3YkSW\\/E1wQO7AowH6DHNWdSH7Y8drhLsguGuVPe\\/6fOwx0f17K2d5O7KXBhaXzlKn08twD6iFVrE7bX32xzjW5NmFTPH9mo95GEsRL3YqT5b29yXBP0DHgY1scHFGNOdsd5FDlVdJPmGdzTRUlLRKtQ0LoksqK8aiOMH87qCgsrab629IYjemzuv6ozF8yrdK1iESwLG2mOGIWSOniX8scYAWNAbKoCgG+G2a1cNPl8WVZVUJPSLLeWXyin2mSNSCxB9Rj+8YJqAIUE2RmZQzoYRDVRmFi4JcAae9r\\/Qna\\/8Aw4Y3qkJat2WR09keaVucQJQRmvpsxaFp6WldnkVVA1K0Ys+mwtq0+WGNgSdh3V0rIKnqvOhJV6ZKeleopw0gvGTQgBm0ksgLHTvY3HB2OOFMszrPqKknNNnE1NGIvUkf3Szf9xG6mXR\\/8mkE2Lhj2+MdXdEdcmLw\\/puuGr6vK5s6jpMnuA09PGlMxeolZACSUjhjkNhcoSvb1X+JJOLiVs8GmmX\\/AJYYJHpI5qSOWGGkC+aVF\\/xFtN+W5O39N8F9NkFTUQU8iotMs8iJ5ItewuS2wPC3P1PYWArfoPOIuostoqxI3Uz6q6GPzNdoHQFrH3QoQQeRc2AuFtrL82Saoo3aYrCgDrdd9TFffcLZbfGLUitWwZq56Gnz9EnRwpV6ZluASQlmH1OsC3098NZ8+OWaqHNoSKeFykHkHSCBwRq5BBPHf3vt71Q1DFAc8Zn8oVk8yvGAHiIQkt7uvo435BPY4bU81XX06VNAsU1RCBHubLoIG9jsTZEG3Gk+9sSkSQGS0b19T5qIyxC27ADTsOw2vb\\/XkgCw8rijpUCxiwC4h8roIqWMRxLpA5+cSyAkWAtfHhc2SWV2z2WKEMS6xFquucKRfsd8NKXKnzI+fWyHyR2vz+mHkVIHbVP+Ab6QefjEvldG1TJ5jppQCwHGFLXgcmxxl9DBDCsdLTqo5vbnDiSldluUUfOJGngCDgWGNnjDekAbd8R1bdgqVMhI6SRmIv6cPIqJUHpB\\/fDp4xCpcJf+6BzjyWpSJfSw25NsMqw77eG8QjjBZva++G1XmtPSoTrAN9sD+e9TU9FAzST+43NuBirOqPFOgpUkqKnMY0iG5u4AH78c4mkOx4nIs\\/NepUW+iRRyD8YAM76terq0yijlYzVLaGKH8KD8Rv224+bYoHrj+0jBTxyU+QUctfJ\\/+TVoQe9m7n6C3zgn8I55s\\/px1DXVwkesAb0n8nNvgb4Jb0i4sKhG2X5lssbxrBAp8uMaRb6cfO2IKaQ5Pmc4sQk8eob\\/AJhzb5II\\/RcS+VSxQwKkZA23u1rm39MRfVCXjhqlKjTKtjfgHY\\/0JwyK6vZXce10U3nWb1SV8ec0ravsNS61MRG7R3N\\/1s1x8jFg9PdUUdVCk8MuuN1DKwN9jxhPM+kqXM5AaRQjyj7zSNm+v74FJfDXrPpOSSpypmqqNyXaDjRc3urfW5I4+mG5F1lY7jZo9er0XVkmexs4+8AU7GzfPtgyVUKeapBHxvvjlt8g8YKqoTNelczlgVDqNLUU6GKS35W21j9GB+cWl4XeJcufxz5LneXyZVndCR9ropjewPEkZ\\/Mh4uODsRxdTbl4Dnimriy0DOo9LEj\\/ADwok4ZrKbD6YaB0k9QIN8eBwJAFIufbDYxVbKblRK67nm\\/64XjYBCCBbn3wyjN309sOUNtr4hP6OaTNivYWsOB8Ybvq1W39sLmUD8VvfCUj+nUAONrYJxomNrY3Kqz2HJPPucemK+9rEbWxoZDfVe3a+NBMQGGskHvg0qHxTYnOpA0lm277XxGzuuvSB3\\/bDqonsdWu45se+I2aUF2K9\\/64Tk2i9hiqNNbAEg6TjwyHchr3thBpRY3+hGNDORclha37YWHkFZZDa198RrlNakD8RJJ9u3+WNp6lCCNYHOGU1QLRsSF7kD9zgop+lLM9CVZPGI9tIK+jjgAkWxSPibmX\\/dBlayFJRbe2sabX\\/VTi1M2r20SGPtuL8n5\\/fHPXi1mjeTM0UgEg1m3yQP8AXFnFH9kY\\/IemUp1FnVRR1zayrrJHrdCb6mB06iOxsV\\/RifbERTdPrX01QmWRQRCb06wDeJGWxjS\\/4Qw5IsSrEAhWYM664ippqQ5pGsRPrYqWvckMSXvwuna3uBiX6b6hpoctq1vTxTTeXVoiXtdfuio41C6f1v7YuZcnVUjMx47nsrPM+j3pXSaOMNHAQ1KHkIaS7amW\\/Ia7AXH735JGy3ITktPV5TBl9THoSpMVXK6GUIGtA2kBlKyM6lUa7ERkmxUqbUnSWYdW0upa6KGIhmjTc2c31Kzfl5P0v9MQsnQlV07L\\/FKOoZ6d3\\/7glHdoZQQSTa5ud1Yf3QdyjhUxyNvRZngjEiRXZJneXtJDlwp2YM3lQhyhsWI3kZjcG1yb\\/wBN70paSkofD7pfoGppqWuXMfs0rLadpaoTiSoZI0jaMmZA0YMgdI7K0ZYuCmADojI+lOnupqKLqCtp5o5pZayOBEfyKeKInzY5iV9ToEYeSBcuulrbBjSbMs0pMo\\/6hqYVruocxkq5qSWl9SiorWK08ccTKdd1p47JZWjhmFkK3I0+JcXcihnSao6E8PqqhpJKjKcmkWKkymRYkZdWpZV067BixsLE7te4GLRizuigRxBIkTFkYO4usbatIXixUG67g+55OKE8ODlXh9kOV9MZhNTx1NKBTVUrynXNPMjmWcqbsY0jRrEAFlhD20uhc0Oemtp69Kcx1CinhrYG\\/CX1opkj32supDYcfFwRpeqzOlpkl1hnVJQwtTVEMlMacee+hGkhNjYagTq1EpqBRjwRp7YGKLqbNOja2R6Gsp\\/4bURgU5kqokAN9TBfMKax6l3HBDAgXuVepMzy0Zxl9ZU5j5UlRSCrSy+qanZUlkA9Js+moUi9\\/wAD8EWarJvFqLpHOanI+rMvglEKjyZoGZLC9wp\\/CwurKwB9zcDa\\/NpLZCVnV9JEAbMMScFN5hACAd8eUNAzNcrucTlNSJGAdNzjwMtntEqGcOX6ra7kd74mKKEQj0iy\\/ONkiC7BcKiwHGITvRD2KrLbvY42EijfYH5w0LWNwMZJNZSdr\\/ODVgtGtZViNSxawwF9VdWRZfASZADYnTf42P8Ajhbq7P1y2leXzN0GoAd7Y5M8Y\\/FyqnZstyOqBndjqcrfy0sd\\/qb7Dfbf2wzo16W8MO\\/hNeJ3jDLHRyxQyqXkJgRi1kD9ySewxSk81TnhWevzIzKWAVi+oaje1gNt7Hj2OBap6UzLqLz2qPNlNQLSM7HU4uDa\\/Ntl+Nh7Yk6lsg6K6ZyzLTl0WXSSVYhqY4pHLNdo7z33Kg6hc3A9KgfhN24sSyK72Fn5cuK0uug56X8P4M0lX7QG0m2xHqI7k+wxa3h54fU2WQyLDWVsSiaRdAmIW1+w4Hfi3fC\\/hd07R0dGXijZTJZnkkZnd9jbc32wadKpElMZQ\\/pmleRdvys1x\\/jiUko7L2BPLkYSZFkOXRaNck0jAcSzySAn\\/wASSMNesJljozBGAdTiNERQFuxtwPriYicRQEh4bW4K7t\\/\\/ADiqfEPreniz6kySmq0Eqf8AczBLHSm6ptzYnUQbfkOBk6Wi\\/j4bz5FBFu9NZdHaOaV4xfi\\/I2274J83MAohS04j1y+km2+KW6f6yeeFDPK4VSArK24P64PskzRcyZNWYFjuArHfn\\/3gFPs7ZX5nw+Ti7XgX5NSR00YBQEWPe99ucD3XXS6V1RBn1FRRx5jSEmOREtrU\\/iRrcg\\/PBAPbBRRSWVU4P4bHckYfgo9tSgjkXHOGwl\\/ZiN7srXLOq1jURVYMci7Mrc4KMnnXMn8+EMYh+a2xOJWpyDJaycT1GV00kv8AO0alv3th2lPHTr5ccYVV4C7AYY5IhxT8EtBXcfix6zbg3sT842kFlw3Zzf6YWlb2Gn1FWlU2HPvhF5j3aw+MJPIQLm18N5JSRew2w5KhkY2jd5Teym+99x2vhvLPZb6t\\/bCUsotqBvhlLLvcMccWIxFZJhe2q9+18MZZFUbNbCMtSfy8n3wxmnYFvUbnAyjY1SoVmnUmyncYaS1b+qzHDeWc6ySNvcYZVEt7kN7DEdAHlX2Ly1dywDWAHP6YbVdcAEAYck2\\/Qgf1OGUs2q\\/q2O3thjmFXpU7273vaxwcYUUM+a0RHVOetR00yxMoZho1H8t9u31xQPVtUmZVZpTZ2l1LvwARb3+Riy+sa5lDKP8A4oQWYjvyBf8Ar++ArL8ilq62F5oz501RAqG1zd3F\\/wDBRhsV02ZWWTZU8uVy1dZSZa8JiUPKhZwCQtjuAdr2awv7cYj\\/AA36ZzGvzhMuqCJZqeVqOVQw0wII9ajUNm3Rh8G+Lgz3pHyM+hpfKRAtSzyMSACC8Tn3sN3Sxtw2JGTp2h6X8WoM7rVWkpc9y\\/7RBdz95WJJCrxRqpudMRlkbt94ebYFtzdDMeOopr0hcl6OmyiOQU9w0MjICLjcHa9\\/6\\/XEwIAJo6+rlljjCgSSLFG4Kcg3NiFtsfbkcA4tCbpdV1qYQDZSdvzEEm\\/zuMQ9XlgyfLp6uSGJUjD21WOkKTY7\\/Hz\\/AKFUXTL04qUSpV8PqTK6qomjjqFyGoaCCOGoYwh5vMjYUvpDuImdUHmKV0lQGkChSXGeeI1Dleb5hmOVPSeZlsLUlLNM6zPNDIQvmUwptKQs0S6gpdXGgK0hRAhfZ3NPlWQ1\\/V\\/UlaRPPRuEMs+pzRndr2OoFkuo2baUtYMUYUHUVWfVmf09RlqRUq5ixipGrNEVNq1BCjmf7oHzBrAYgBhdTcKcamLK6pIxM2NJ22dCVPVFM0iZfBU5lNQUuQvT1Ly1kMdE1fNPBQsk8EQju8RmpEZzM9rM0fpNyf8ATXiLl9dTZLXwFYYcxyk09NSPSP6VfNfLUytq1FmgkgA3vYHjUNPM+UdWdIzdNnpvMXTL1nllEkeXPUypPUKgijeeR3KpG6s6s0LSlw\\/4UKqQS0ed57RZZmNRmFfS1MqZbDPSy0yaaNbV1F5aUxH4oViijQA2sVdCLrc6WLLfpmZIUXj1vUU9XlOUZishgSGZo6erhIP2eRJZI11XuCgEHqKg6NBaxXUVDuusj6Y6nkp5ermOSyxs8YEamZqedbfaKeSOzfidlqEYcCocMd1AlerqySp6IfKa3NYftNJn8iQVcKeVFBWx1NZpVCwU+XYIhf0lSlwfSQwlkHiVQ0KT9NeIk8FO9JoSOrraVpD5kRaNoJIw0RLqCoEha9lZTqAXQ6UkvRUYn0HpafTyv7YfLGFFwMeRRlcKMSNgMeDbs9hKW9CZax3\\/AKY88y5OPJD\\/AK4TY32IxKVAtmwNzud8Na2UJESDv2wo0gBHPtxiFzmvSGJr3BtYe4w6C+yFspfxo6nagoq7y7aoqeSUAH+RSf6kAfrjlnK8omzaUSSOzFtyWNyT9Ti9fF1KfOVnyuozA0c2cyxUVPMIvMtKNU+m1xe4jItcX4FzYGmsnpM56czyfKc4aNJaWXQyqbKw2Nx33UhhfswuORh3R12+jRw5oRf4\\/ssbozpSN0EPkg3HPbf\\/AIcBv9orw9ggyWk6gemL\\/wAPlLkglQLo2m9iNi4ReeGOxNsX70VlkE9JHPTxFVa1t\\/8Am2F\\/GDoEdV+H2bZMI7vUUzqhOwD2uv8AW31wyLSoTysbyRZE+E+atmvQ+U506IGrKCCobS\\/GuMNa\\/HfE30c6yZbTDzCxCAWJ4sMUX\\/Zqq+ssy6GlikMMVHSVMtNTM1wwW+oppHZdVgbj207amu\\/oLpzqdFlSviSGISMYmO7MCb3sOObb77YVPWi58dNxj+R\\/YQdXZ9lvTPTdXm+ZVAipaSFppn50oASTbv8ATHDcfiZVZ31PWdTZjO0YzGoJWM8Qw7CNB2FgN7bElm\\/Nju3qjw5yPqjKpMp6ogatpJwA8QleNWsbi+gg9uL9sAzeAvhHlkIy6i6Hy3SQSfMVnKj4LEn+t8R17Ro2uH8h\\/jZlKOyrck6nFPSRPDU+ZG3qtfj2P+WDjp3rSETKySlLKCANgO57\\/TAt154S5L0\\/lsg6IjND5IaRadpnkjY7bDUSVG1wBYc7bnFLZP11nWWZm+XVtP5Txek6fUG3sbe3HHfFd4nD09dHmcTnY0p\\/q3\\/Z9CujOqKfPqFZBIvnRgK9u+3OC1ZV1bHuL2OOTPCDxISnzKNDNeGaysL8jHT1NXRTQrNE2oNuDfkYfj\\/ZHz35rh\\/4PJ\\/Vfq\\/CeSW+9v1GPXclecR0E+ptyQtucOhIrbXNsc4tGVFqWxOVw179sNJXYG+\\/74WlYBmF8M5ZBc4KL6+kmNMdg1jfDWWXTyP0xkkmk7e22Gk0w5JOHBqdM1kkAFyLWwwqJdrhrWGN5pgQRfa3fDORh7YJbD\\/L1EpZCO4w1kJJJPfCk0gPPGGzydhiQJ5XISkcW0gEHEdUMwv2+nvh1NMdNrYYTuLHUdgN\\/nHCJToYvI278b2GIjMp3MTeUAfSQvySNv8ALD+pn1bC\\/BBPv+mIiqmVl8y1rr7YOK3ZTnK3sDc6hSqqo6YteJWM0jEcgf627\\/GHGRrBT09Z1DmDiClpKyEIXXa1oybe99X+mNY6d80rmjBtE5BlZP5V4F\\/mwwUR9Gtn2X1FRm+uKgp54J4abhSq+WGZvoqkjC+Rk6rQGOHaW\\/Cu88zWnzirqqylpgP4kHo4GkFvKLRuPM4NjpkYgH2wn4uZxTjIeh+ostV3SlqpIomaTywWng+7ZiSPSCUY9vSLnFqdW9PdH5BR1MlTmMFNHThKrUrldN9EV7j2DN9O3GOefETNKjOfD\\/J4Sk0CUOXxeTOQQs0iRR3Uc+omPVzwp991Yp+MtSSjdHYgySOnRq\\/Np4aeJlDyanBYERpYW\\/8AtufbvfFV9WVlN1c7Q5eqw5JQyM1RO2yzaWPpH8wuNz+nxgxqOl8kocs\\/6h6\\/6oaZYIFklDTiKBAq2LEGwtdW3PxjmPxY8ZIPEGnPS\\/SMSZd0tuJpPUhqwp9SgbaYRZib7uO2kEOeDFPLOkjuRyIYYdpMrXxa8Savq\\/PoqTp6olXKMrmDw2JP8Q0izkki7L+Le4FlY76kKwVfQBcvSrpSjU4ZUKiUsY2A0kKT6iPzb7jV3vc+\\/YYJc1jq0gCJTmWWSTUCFVirgDtclWtbuCBbG9xFK1PSxU6CuhDRqY2a0igAcWJLMNBa9rFyNwLa\\/wCJQVHn5ZXll2YLRWizhI5HVLwxFtAI+7CgA2PBul7bXtY23tZmR5nVZdkcWXKKZkIdpIJj5sT6D3H8xWwDD1i6lSAbEFzDJZKXO0dqgu8bskbOBqitZPLK\\/mN2v2BtJxpNjWGGE5L\\/ABRVFRPSeYs0MR3VElKhwVF2A2vtsCL2AAMwTiDLfpbdPnGXdQ9NZnmFFWU8dTWZsMwjp5XsYJZVeWUCRrBEDSsbkaQiONTb4E85\\/gldS09P1lTTQBbGhrY6RKjXAqhBGUd0WRVIOiTXqRQY\\/WmjyxzLs4TLmeKGmpzRVkZSVg8plV11Dy5Ig+kgF29gyvbYNfD6szjP4PLzLJK+qhSZFiKwERtsL2m06Vdwb2cgEjVwdarZc+y2J69T6qqvHxjxktvjcDHj2KkXx4\\/\\/AIPTiEmG5uOOMOHAIse2ESlibWvjiavQ2muVuTz79sD2d5bVVkLBFJIINxbf3Fu\\/+2CoIGG5vfbbHnljgCw77YKMkhsI\\/wBnLXjr0pU\\/Y6GtpNaBq+KcSLs0UyRuFYHkHi3zv2wAsyZzmFPmdZRxrUTAU1UqiyidLFWAP8wNxa9lVRe4Nu1cz6ayTPKaSkzSginimsHBHNjsbjcH5GBJ\\/ALw8kleSChqYWdlf01LkBlvYjVe3Nvkc4tLPGmmdKP7Ka9QLdDUOilhUupVgt99hsBbjsf8MGGYCnnpJaaMfaJbFREhBN\\/k8L+v9cT+X+HeR5fGIYo5WUDgyHf6+\\/64mqfJcvpUUJTooXiwthLmvosSzRaoqvoPwuy7o7L3osuo1HnVM9YxkbUVklkaRgtgAAC1gBwoANzck+pcpigFnRdVubWxNeTElgoG9+3OG1VPHCwJ98A5N+kRnXgN52iQp6zYHcA9zbjFY9U5q1IomjksAdJF\\/rb\\/AJ84sPq7MESjc+kMmy+5Ixzj4m9ZQ5bQaWZneVwI40trkbkBQeSbH\\/YAnDMX67LXFbnlSQl1b1SPs+j8csx0ovJZj2H7ftc4rOt8Oo5EmzgIZ6qpHmS7m\\/AsqdtIOogWDXc3vsATdG5XVVlUuZ9SPE1bOp0Rj1R0qWFlGqxY7bkC7EAACygFuZUkMkgjo5lklMRe3mA2IIuWFgFFgTzwDsO65ZpKVrw+m8b4TicnjKOa+z+19FBZdW5p025rX1J5btcFjYWJ\\/S\\/Y+9sdTeDvjFR9Q0MVBJVDzVAAu19u2Ky6j6Gos6pp4Mxy8kpKYZNDaSW0Fr+k72CtftsMBFD4WdV9J5otb0pUTn7O1mppZr3I30gqtwdxtvzhmLIr0YvyvwXIlhcMklKK8d7\\/AOzu+grlmAYNcHcb84lY5lYf5YqHwu6mrMyyamlr0KyFArAmxVu4I9wcWRHVnYdzzfjD3s+b7xTcJfRJzyCxAO+GMsth2ONZKk9zhrJOGvvxtzgFoY5WeyS3N++Gc8o4x5NMLc\\/1wxlnBJF\\/2w5L+wbNnmB4OGc0gvcm+NZZvm2G8kwtzbBM5y2eyOAbkfGG8sw3N7D5xrJJtYYaTS7knfHAOWzJJQGNiCDiNrZiAy+25wrNUWNr4hq6uQKyk7D+u2JoS5WNqysWM6FN7cEmwvgTzfODIBSwklmIVt9iTtp5\\/wBsZ1Dn0VJC8skgVV3JPY29u+KK6s656hzF5oOl4nRFFvtV7FTfcr+1gf8ATaXJLYm70dgeHPQUH8PTMMwKs0nr0f4XxO55lcLwNQxSNGGSTdeyWaw\\/dhj58Zf\\/AGrvF\\/oFBlSZnHmgj2CViMxPt6lIJ4PNzglpP7dnWM2mCToqGWaUeW0q17AJfuAVPGxt\\/XFWXHy5X2Xg6HIxYV1k9nRfXvQ1NW0Vc9RUiorHyutnip3mAD20FV\\/Um378Yorq3r3KaTpzJMok8vMU8qkf7GoKSRJGIS9u2rUsw35UgXwE9ReO\\/ix1xXCOSaHKTJGaP7Nl6EyN5jktGWa9+APSBzYe+BvKGFbmNNXieIoDHJ5hXSXS1kJGzbpa+1xY\\/OLeDiytJlfNzVTcS2euetOpevdNT1NWl6OnVmiyuJiINGkaHYneVxqDBjcBgbAEEmBajpaKngp40RJoPJpvU7Inre4B20tdbAqW28wcX32pp54af+JTwrNLM4WOBpS6xMQ2pASLlQwkA2FxYWOkDDHNp5IaaSiaSRvV5s0mwDDWpDg2C3LGwIt+G1uMbcMcMWooxp5JZncmQ+VrJPl60xQLM0UJmG911XKp6rNsA+7Htve+GMkkubNSt5iTRmpnp6Zo2b0hGCgWYWLlpdfsN7W7v87qP4PlVRFGUE6xnWA5GmR2txey2BUWPt749yaKMy5ZLHBPrpq9iwOxBIIFxYGxWJRtvc2+i5bCj+oyip3TPamtq50jSsq2EkVz+URAHdjc6JHTSSDYq2km742oazNMnymLy3BqaCFpZxIupG8x7kG4NwFV7qezH5s\\/zChpsvrcsSOMWWjnnkmkbSvmPqIvq9IBCjYn8o7agZV6VXyqGsFAxmzIss8LC7I7FiUIFrFfNAsN9t\\/zDAtMlysiKTNKekr2qqSoVqbN4kq4IJULRRiw82IBuVTUmoKVYLKXBbhJqCup80JELPSuFV2jIV\\/UbhypYjbUL7i41WFtJuFpl8EeSwM9DWwNLJUCuhJVpI0iCOrgEAFlViCDa\\/qX03LYc0Mj\\/azQZumpvLMjVFmkBkGkN+F4ydQZW1arHuDZdAqf0R1s+yDHSLDvhPc2xmMx5Wj068NXGr9MJ6b7nGYzAt7omJgULtcnGyoOb4zGYJINydGwVRYDnGwbTsGtfGYzHAW2bfalHJw0qMxSPe9x8YzGY4lKmRlXnqoCqmxHfApm\\/Uqj7x5goBDXxmMw2CRN26AXqXrTKYaGeur61VjhSR3aRtKKLEljf6d8crVtL1h4kZ+\\/UWXI9NSwSf8AYIUuQg4dge7ckdr23tc5jMWFFS9GRnLEu0fQmpc\\/raSRKHqiily6qDaUnVT5MpA\\/ofg\\/oe2CqgqJpmDQ1QlVhYkNe\\/xf9cZjMJnjSZ7T4f5nlSxKMnZNx5bXVax0ZrHVBcaFX8RIYG9rHhiPofbBjkfSFUxT7fVytEoOwAQtve5737bdrDGYzBQgls75j5PkRx9U\\/f8AYM6LLaaiiEdPEqrbsOcSsMzKtrCw2xmMw708FNW7NmqTfe2EJan1d8ZjMT6cmNJZxc74Zyzbcn\\/PGYzDIr6IbYyeQg7NfbjDd6hgLEkd8ZjMELbEGkvwThpPLcEKxBI2xmMwBEnXhDZhWhY29W3+O2K86o61pstjkRplJKk2Jt+n02xmMwUXQpvRUeb5xX9W1LRxmQUl7uwB1Sf3fgb4XzjLaSgycIY41QxElpUsoFj+FfzHgW+BxjMZgPWDeii+pcsSvq5Fo6Qh5vQrPdVUG12PFtgebbE+18KUGSxZLSCsggZq5gqQs6FiZXNhYLax0ltKrsCL7aRfMZjT48V1MvK22TuRdNPPI0dfSrO2nW8LNr1yMNtt7X7sNgoDHSUY4laimiyWqnkad3kiuxUaXEszXLuN9grbDg6tLC4ucZjMWYJLYmWyTpisPlTVjaC41qG3Kj03c339Vt+9woN7G6dDVSVNTJmT1TRxxTNc6blttWplIIZbE7b20i3JbGYzBN6OSQL5zWrmGa0WXgErPVISxIJECx+aq7j1D0hbkavT2xM5HNTyRz1\\/pl8hqaRNViQdBZWFu92ue179ztmMwCeyWL9fQrDJTyQyIW9NOGt6EV5VUFhbdV1E7+w7E4munqqKsy6iESlKuCSOMqRZxqBdQlzcEBSLb2Cge2MxmDewbojRlVM\\/2pKqJolJUrVC7K8dmDWO1uQD3O3wMC8VFDF5lHnlNWSIxWohUFRIgYHhmNipOpiBwxPBJxmMxXa2Njs\\/\\/9k=\",\"link\":\"1\",\"is_show\":\"on\",\"_token\":\"aaUNfuHsrvMysVKjYsJCbzRpSzIDkmup5jD8wGfH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/banners\"}', '2020-09-27 03:14:27', '2020-09-27 03:14:27');
INSERT INTO `admin_operation_log` VALUES ('287', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-09-27 03:14:28', '2020-09-27 03:14:28');
INSERT INTO `admin_operation_log` VALUES ('288', '1', 'admin/articles', 'GET', '127.0.0.1', '[]', '2020-09-28 00:26:08', '2020-09-28 00:26:08');
INSERT INTO `admin_operation_log` VALUES ('289', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-28 00:26:14', '2020-09-28 00:26:14');
INSERT INTO `admin_operation_log` VALUES ('290', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-11 23:42:03', '2020-10-11 23:42:03');
INSERT INTO `admin_operation_log` VALUES ('291', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-11 23:42:08', '2020-10-11 23:42:08');
INSERT INTO `admin_operation_log` VALUES ('292', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4efb\\u52a1\",\"icon\":\"fa-tasks\",\"uri\":\"tasks\",\"roles\":[null],\"permission\":null,\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\"}', '2020-10-11 23:42:32', '2020-10-11 23:42:32');
INSERT INTO `admin_operation_log` VALUES ('293', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-11 23:42:33', '2020-10-11 23:42:33');
INSERT INTO `admin_operation_log` VALUES ('294', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-11 23:42:34', '2020-10-11 23:42:34');
INSERT INTO `admin_operation_log` VALUES ('295', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-11 23:42:36', '2020-10-11 23:42:36');
INSERT INTO `admin_operation_log` VALUES ('296', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-11 23:44:00', '2020-10-11 23:44:00');
INSERT INTO `admin_operation_log` VALUES ('297', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-11 23:44:02', '2020-10-11 23:44:02');
INSERT INTO `admin_operation_log` VALUES ('298', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2020-10-11 23:55:34', '2020-10-11 23:55:34');
INSERT INTO `admin_operation_log` VALUES ('299', '1', 'admin/tasks', 'POST', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"HELIUS\\/\\u8d6b\\u4e3d\\u5c14\\u65af\\u6c28\\u57fa\\u9178\\u6d01\\u989c\\u871c\\u5973\\u6d17\\u9762\\u5976\",\"good_source\":\"0\",\"buy_address\":\"https:\\/\\/detail.tmall.com\\/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711\",\"good_price\":\"209\",\"coupon\":\"100\",\"reward\":\"60\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 00:11:42', '2020-10-12 00:11:42');
INSERT INTO `admin_operation_log` VALUES ('300', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:11:43', '2020-10-12 00:11:43');
INSERT INTO `admin_operation_log` VALUES ('301', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:18:17', '2020-10-12 00:18:17');
INSERT INTO `admin_operation_log` VALUES ('302', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:20:20', '2020-10-12 00:20:20');
INSERT INTO `admin_operation_log` VALUES ('303', '1', 'admin/tasks', 'POST', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"AHC\\u6c34\\u4e73\\u5957\\u88c5\\u62a4\\u80a4\\u54c1\",\"good_source\":\"1\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?tbpm=1&spm=a230r.1.14.30.74ef4a8b9Ue3cW&id=569083676891&ns=1&abbucket=9\",\"good_price\":\"148\",\"coupon\":\"100\",\"reward\":\"50\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 00:21:08', '2020-10-12 00:21:08');
INSERT INTO `admin_operation_log` VALUES ('304', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:21:09', '2020-10-12 00:21:09');
INSERT INTO `admin_operation_log` VALUES ('305', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:28:26', '2020-10-12 00:28:26');
INSERT INTO `admin_operation_log` VALUES ('306', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7535\\u5546\\u5e73\\u53f0\",\"icon\":\"fa-shopping-bag\",\"uri\":\"good-sources\",\"roles\":[null],\"permission\":null,\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\"}', '2020-10-12 00:29:33', '2020-10-12 00:29:33');
INSERT INTO `admin_operation_log` VALUES ('307', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-12 00:29:33', '2020-10-12 00:29:33');
INSERT INTO `admin_operation_log` VALUES ('308', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-12 00:29:36', '2020-10-12 00:29:36');
INSERT INTO `admin_operation_log` VALUES ('309', '1', 'admin/good-sources', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:29:38', '2020-10-12 00:29:38');
INSERT INTO `admin_operation_log` VALUES ('310', '1', 'admin/good-sources/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:30:37', '2020-10-12 00:30:37');
INSERT INTO `admin_operation_log` VALUES ('311', '1', 'admin/good-sources', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:30:39', '2020-10-12 00:30:39');
INSERT INTO `admin_operation_log` VALUES ('312', '1', 'admin/good-sources', 'GET', '127.0.0.1', '[]', '2020-10-12 00:32:20', '2020-10-12 00:32:20');
INSERT INTO `admin_operation_log` VALUES ('313', '1', 'admin/good-sources/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:32:22', '2020-10-12 00:32:22');
INSERT INTO `admin_operation_log` VALUES ('314', '1', 'admin/good-sources/create', 'GET', '127.0.0.1', '[]', '2020-10-12 00:32:35', '2020-10-12 00:32:35');
INSERT INTO `admin_operation_log` VALUES ('315', '1', 'admin/good-sources', 'POST', '127.0.0.1', '{\"name\":\"\\u6dd8\\u5b9d\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/good-sources\"}', '2020-10-12 00:32:42', '2020-10-12 00:32:42');
INSERT INTO `admin_operation_log` VALUES ('316', '1', 'admin/good-sources', 'GET', '127.0.0.1', '[]', '2020-10-12 00:32:43', '2020-10-12 00:32:43');
INSERT INTO `admin_operation_log` VALUES ('317', '1', 'admin/good-sources/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:32:44', '2020-10-12 00:32:44');
INSERT INTO `admin_operation_log` VALUES ('318', '1', 'admin/good-sources', 'POST', '127.0.0.1', '{\"name\":\"\\u5929\\u732b\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/good-sources\"}', '2020-10-12 00:32:48', '2020-10-12 00:32:48');
INSERT INTO `admin_operation_log` VALUES ('319', '1', 'admin/good-sources', 'GET', '127.0.0.1', '[]', '2020-10-12 00:32:49', '2020-10-12 00:32:49');
INSERT INTO `admin_operation_log` VALUES ('320', '1', 'admin/good-sources/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:32:51', '2020-10-12 00:32:51');
INSERT INTO `admin_operation_log` VALUES ('321', '1', 'admin/good-sources', 'POST', '127.0.0.1', '{\"name\":\"\\u4eac\\u4e1c\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/good-sources\"}', '2020-10-12 00:32:58', '2020-10-12 00:32:58');
INSERT INTO `admin_operation_log` VALUES ('322', '1', 'admin/good-sources', 'GET', '127.0.0.1', '[]', '2020-10-12 00:32:59', '2020-10-12 00:32:59');
INSERT INTO `admin_operation_log` VALUES ('323', '1', 'admin/good-sources/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:33:00', '2020-10-12 00:33:00');
INSERT INTO `admin_operation_log` VALUES ('324', '1', 'admin/good-sources', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:33:09', '2020-10-12 00:33:09');
INSERT INTO `admin_operation_log` VALUES ('325', '1', 'admin/good-sources/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:33:10', '2020-10-12 00:33:10');
INSERT INTO `admin_operation_log` VALUES ('326', '1', 'admin/good-sources', 'POST', '127.0.0.1', '{\"name\":\"\\u82cf\\u5b81\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/good-sources\"}', '2020-10-12 00:33:14', '2020-10-12 00:33:14');
INSERT INTO `admin_operation_log` VALUES ('327', '1', 'admin/good-sources', 'GET', '127.0.0.1', '[]', '2020-10-12 00:33:14', '2020-10-12 00:33:14');
INSERT INTO `admin_operation_log` VALUES ('328', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:33:17', '2020-10-12 00:33:17');
INSERT INTO `admin_operation_log` VALUES ('329', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:33:19', '2020-10-12 00:33:19');
INSERT INTO `admin_operation_log` VALUES ('330', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2020-10-12 00:36:18', '2020-10-12 00:36:18');
INSERT INTO `admin_operation_log` VALUES ('331', '1', 'admin/virtuals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:36:26', '2020-10-12 00:36:26');
INSERT INTO `admin_operation_log` VALUES ('332', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:36:31', '2020-10-12 00:36:31');
INSERT INTO `admin_operation_log` VALUES ('333', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:36:34', '2020-10-12 00:36:34');
INSERT INTO `admin_operation_log` VALUES ('334', '1', 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"HELIUS\\/\\u8d6b\\u4e3d\\u5c14\\u65af\\u6c28\\u57fa\\u9178\\u6d01\\u989c\\u871c\\u5973\\u6d17\\u9762\\u5976\",\"good_source\":\"1\",\"buy_address\":\"https:\\/\\/detail.tmall.com\\/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711\",\"good_price\":\"209\",\"coupon\":\"100\",\"reward\":\"60\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 00:37:10', '2020-10-12 00:37:10');
INSERT INTO `admin_operation_log` VALUES ('335', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:37:10', '2020-10-12 00:37:10');
INSERT INTO `admin_operation_log` VALUES ('336', '1', 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:37:14', '2020-10-12 00:37:14');
INSERT INTO `admin_operation_log` VALUES ('337', '1', 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"AHC\\u6c34\\u4e73\\u5957\\u88c5\\u62a4\\u80a4\\u54c1\",\"good_source\":\"2\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?tbpm=1&spm=a230r.1.14.30.74ef4a8b9Ue3cW&id=569083676891&ns=1&abbucket=9\",\"good_price\":\"148\",\"coupon\":\"100\",\"reward\":\"50\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 00:37:17', '2020-10-12 00:37:17');
INSERT INTO `admin_operation_log` VALUES ('338', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:37:17', '2020-10-12 00:37:17');
INSERT INTO `admin_operation_log` VALUES ('339', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:42:29', '2020-10-12 00:42:29');
INSERT INTO `admin_operation_log` VALUES ('340', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:42:57', '2020-10-12 00:42:57');
INSERT INTO `admin_operation_log` VALUES ('341', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:43:35', '2020-10-12 00:43:35');
INSERT INTO `admin_operation_log` VALUES ('342', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:52:43', '2020-10-12 00:52:43');
INSERT INTO `admin_operation_log` VALUES ('343', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:52:45', '2020-10-12 00:52:45');
INSERT INTO `admin_operation_log` VALUES ('344', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:53:30', '2020-10-12 00:53:30');
INSERT INTO `admin_operation_log` VALUES ('345', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:53:31', '2020-10-12 00:53:31');
INSERT INTO `admin_operation_log` VALUES ('346', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:53:35', '2020-10-12 00:53:35');
INSERT INTO `admin_operation_log` VALUES ('347', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:53:36', '2020-10-12 00:53:36');
INSERT INTO `admin_operation_log` VALUES ('348', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:53:38', '2020-10-12 00:53:38');
INSERT INTO `admin_operation_log` VALUES ('349', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:53:44', '2020-10-12 00:53:44');
INSERT INTO `admin_operation_log` VALUES ('350', '1', 'admin/tasks', 'POST', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"TFIT\\u6c34\\u4e73\\u5957\\u88c5\\u6b63\\u54c1\\u8865\\u6c34\\u4fdd\\u6e7f\",\"good_source\":\"3\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9\",\"good_price\":\"168\",\"coupon\":\"30\",\"reward\":\"40\",\"task_type\":\"2\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 00:54:57', '2020-10-12 00:54:57');
INSERT INTO `admin_operation_log` VALUES ('351', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:54:58', '2020-10-12 00:54:58');
INSERT INTO `admin_operation_log` VALUES ('352', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:55:05', '2020-10-12 00:55:05');
INSERT INTO `admin_operation_log` VALUES ('353', '1', 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"HELIUS\\/\\u8d6b\\u4e3d\\u5c14\\u65af\\u6c28\\u57fa\\u9178\\u6d01\\u989c\\u871c\\u5973\\u6d17\\u9762\\u5976\",\"good_source\":\"1\",\"buy_address\":\"https:\\/\\/detail.tmall.com\\/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711\",\"good_price\":\"209\",\"coupon\":\"100\",\"reward\":\"60\",\"task_type\":\"1\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 00:55:07', '2020-10-12 00:55:07');
INSERT INTO `admin_operation_log` VALUES ('354', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:55:08', '2020-10-12 00:55:08');
INSERT INTO `admin_operation_log` VALUES ('355', '1', 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:55:10', '2020-10-12 00:55:10');
INSERT INTO `admin_operation_log` VALUES ('356', '1', 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"AHC\\u6c34\\u4e73\\u5957\\u88c5\\u62a4\\u80a4\\u54c1\",\"good_source\":\"2\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?tbpm=1&spm=a230r.1.14.30.74ef4a8b9Ue3cW&id=569083676891&ns=1&abbucket=9\",\"good_price\":\"148\",\"coupon\":\"100\",\"reward\":\"50\",\"task_type\":\"2\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 00:55:12', '2020-10-12 00:55:12');
INSERT INTO `admin_operation_log` VALUES ('357', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:55:13', '2020-10-12 00:55:13');
INSERT INTO `admin_operation_log` VALUES ('358', '1', 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:55:15', '2020-10-12 00:55:15');
INSERT INTO `admin_operation_log` VALUES ('359', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:55:19', '2020-10-12 00:55:19');
INSERT INTO `admin_operation_log` VALUES ('360', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:56:07', '2020-10-12 00:56:07');
INSERT INTO `admin_operation_log` VALUES ('361', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:56:32', '2020-10-12 00:56:32');
INSERT INTO `admin_operation_log` VALUES ('362', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:57:33', '2020-10-12 00:57:33');
INSERT INTO `admin_operation_log` VALUES ('363', '1', 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:57:43', '2020-10-12 00:57:43');
INSERT INTO `admin_operation_log` VALUES ('364', '1', 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"TFIT\\u6c34\\u4e73\\u5957\\u88c5\\u6b63\\u54c1\\u8865\\u6c34\\u4fdd\\u6e7f\",\"good_source\":\"3\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9\",\"good_price\":\"168\",\"coupon\":\"30\",\"reward\":\"40\",\"task_type\":\"3\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 00:57:45', '2020-10-12 00:57:45');
INSERT INTO `admin_operation_log` VALUES ('365', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 00:57:46', '2020-10-12 00:57:46');
INSERT INTO `admin_operation_log` VALUES ('366', '1', 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:58:45', '2020-10-12 00:58:45');
INSERT INTO `admin_operation_log` VALUES ('367', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 00:58:52', '2020-10-12 00:58:52');
INSERT INTO `admin_operation_log` VALUES ('368', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 01:05:08', '2020-10-12 01:05:08');
INSERT INTO `admin_operation_log` VALUES ('369', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 01:05:27', '2020-10-12 01:05:27');
INSERT INTO `admin_operation_log` VALUES ('370', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 01:05:51', '2020-10-12 01:05:51');
INSERT INTO `admin_operation_log` VALUES ('371', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 01:06:16', '2020-10-12 01:06:16');
INSERT INTO `admin_operation_log` VALUES ('372', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 01:06:26', '2020-10-12 01:06:26');
INSERT INTO `admin_operation_log` VALUES ('373', '1', 'admin/tasks/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 01:06:32', '2020-10-12 01:06:32');
INSERT INTO `admin_operation_log` VALUES ('374', '1', 'admin/tasks/6', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"\\u6bd4\\u4e8c\",\"good_source\":\"3\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9\",\"good_price\":\"168\",\"coupon\":\"30\",\"reward\":\"40\",\"task_type\":\"3\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 01:06:39', '2020-10-12 01:06:39');
INSERT INTO `admin_operation_log` VALUES ('375', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 01:06:39', '2020-10-12 01:06:39');
INSERT INTO `admin_operation_log` VALUES ('376', '1', 'admin/tasks/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 01:06:42', '2020-10-12 01:06:42');
INSERT INTO `admin_operation_log` VALUES ('377', '1', 'admin/tasks/7', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"\\u6bd4\\u4e09\",\"good_source\":\"3\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9\",\"good_price\":\"168\",\"coupon\":\"30\",\"reward\":\"40\",\"task_type\":\"3\",\"_token\":\"tuYsL6cE03NMqnBGSDeNH8nCKxSGoL8aXyibn0Wh\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 01:06:49', '2020-10-12 01:06:49');
INSERT INTO `admin_operation_log` VALUES ('378', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 01:06:49', '2020-10-12 01:06:49');
INSERT INTO `admin_operation_log` VALUES ('379', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 01:07:51', '2020-10-12 01:07:51');
INSERT INTO `admin_operation_log` VALUES ('380', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 03:34:30', '2020-10-12 03:34:30');
INSERT INTO `admin_operation_log` VALUES ('381', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4efb\\u52a1\\u7c7b\\u578b\",\"icon\":\"fa-balance-scale\",\"uri\":\"require-types\",\"roles\":[null],\"permission\":null,\"_token\":\"2Y6tiRawEEzEdDH10HX6wk2f9H43dsgVhXHHGIFx\"}', '2020-10-12 03:34:51', '2020-10-12 03:34:51');
INSERT INTO `admin_operation_log` VALUES ('382', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-12 03:34:51', '2020-10-12 03:34:51');
INSERT INTO `admin_operation_log` VALUES ('383', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-12 03:34:54', '2020-10-12 03:34:54');
INSERT INTO `admin_operation_log` VALUES ('384', '1', 'admin/require-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 03:34:57', '2020-10-12 03:34:57');
INSERT INTO `admin_operation_log` VALUES ('385', '1', 'admin/require-types', 'GET', '127.0.0.1', '[]', '2020-10-12 03:35:29', '2020-10-12 03:35:29');
INSERT INTO `admin_operation_log` VALUES ('386', '1', 'admin/require-types/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 03:35:31', '2020-10-12 03:35:31');
INSERT INTO `admin_operation_log` VALUES ('387', '1', 'admin/require-types/create', 'GET', '127.0.0.1', '[]', '2020-10-12 03:36:08', '2020-10-12 03:36:08');
INSERT INTO `admin_operation_log` VALUES ('388', '1', 'admin/require-types', 'POST', '127.0.0.1', '{\"title\":\"\\u5c0f\\u7ea2\\u4e66\\u6587\\u7ae0\",\"_token\":\"2Y6tiRawEEzEdDH10HX6wk2f9H43dsgVhXHHGIFx\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/require-types\"}', '2020-10-12 03:36:19', '2020-10-12 03:36:19');
INSERT INTO `admin_operation_log` VALUES ('389', '1', 'admin/require-types', 'GET', '127.0.0.1', '[]', '2020-10-12 03:36:19', '2020-10-12 03:36:19');
INSERT INTO `admin_operation_log` VALUES ('390', '1', 'admin/require-types/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 03:36:21', '2020-10-12 03:36:21');
INSERT INTO `admin_operation_log` VALUES ('391', '1', 'admin/require-types', 'POST', '127.0.0.1', '{\"title\":\"\\u6296\\u97f3\\u77ed\\u89c6\\u9891\",\"_token\":\"2Y6tiRawEEzEdDH10HX6wk2f9H43dsgVhXHHGIFx\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/require-types\"}', '2020-10-12 03:36:27', '2020-10-12 03:36:27');
INSERT INTO `admin_operation_log` VALUES ('392', '1', 'admin/require-types', 'GET', '127.0.0.1', '[]', '2020-10-12 03:36:27', '2020-10-12 03:36:27');
INSERT INTO `admin_operation_log` VALUES ('393', '1', 'admin/require-types/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 03:36:29', '2020-10-12 03:36:29');
INSERT INTO `admin_operation_log` VALUES ('394', '1', 'admin/require-types', 'POST', '127.0.0.1', '{\"title\":\"\\u76f4\\u64ad\",\"_token\":\"2Y6tiRawEEzEdDH10HX6wk2f9H43dsgVhXHHGIFx\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/require-types\"}', '2020-10-12 03:36:34', '2020-10-12 03:36:34');
INSERT INTO `admin_operation_log` VALUES ('395', '1', 'admin/require-types', 'GET', '127.0.0.1', '[]', '2020-10-12 03:36:34', '2020-10-12 03:36:34');
INSERT INTO `admin_operation_log` VALUES ('396', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 03:36:41', '2020-10-12 03:36:41');
INSERT INTO `admin_operation_log` VALUES ('397', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 03:36:46', '2020-10-12 03:36:46');
INSERT INTO `admin_operation_log` VALUES ('398', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2020-10-12 03:38:38', '2020-10-12 03:38:38');
INSERT INTO `admin_operation_log` VALUES ('399', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2020-10-12 03:39:34', '2020-10-12 03:39:34');
INSERT INTO `admin_operation_log` VALUES ('400', '1', 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"HELIUS\\/\\u8d6b\\u4e3d\\u5c14\\u65af\\u6c28\\u57fa\\u9178\\u6d01\\u989c\\u871c\\u5973\\u6d17\\u9762\\u5976\",\"good_source\":\"1\",\"buy_address\":\"https:\\/\\/detail.tmall.com\\/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711\",\"good_price\":\"209\",\"coupon\":\"100\",\"reward\":\"60\",\"require_type\":\"2\",\"task_desc\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" title=\\\"\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" alt=\\\"qrcode_demo.jpg\\\"\\/><\\/p><p>\\u53eb\\u6211\\u5fae\\u4fe1\\u4e86\\u89e3\\u8be6\\u60c5<\\/p>\",\"task_type\":\"1\",\"_token\":\"2Y6tiRawEEzEdDH10HX6wk2f9H43dsgVhXHHGIFx\",\"_method\":\"PUT\"}', '2020-10-12 03:41:24', '2020-10-12 03:41:24');
INSERT INTO `admin_operation_log` VALUES ('401', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2020-10-12 03:41:25', '2020-10-12 03:41:25');
INSERT INTO `admin_operation_log` VALUES ('402', '1', 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"HELIUS\\/\\u8d6b\\u4e3d\\u5c14\\u65af\\u6c28\\u57fa\\u9178\\u6d01\\u989c\\u871c\\u5973\\u6d17\\u9762\\u5976\",\"good_source\":\"1\",\"buy_address\":\"https:\\/\\/detail.tmall.com\\/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711\",\"good_price\":\"209\",\"coupon\":\"100\",\"reward\":\"60\",\"require_type\":\"2\",\"task_desc\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" title=\\\"\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" alt=\\\"qrcode_demo.jpg\\\"\\/><\\/p><p>\\u53eb\\u6211\\u5fae\\u4fe1\\u4e86\\u89e3\\u8be6\\u60c5<\\/p>\",\"task_type\":\"1\",\"_token\":\"2Y6tiRawEEzEdDH10HX6wk2f9H43dsgVhXHHGIFx\",\"_method\":\"PUT\"}', '2020-10-12 03:42:49', '2020-10-12 03:42:49');
INSERT INTO `admin_operation_log` VALUES ('403', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2020-10-12 03:42:50', '2020-10-12 03:42:50');
INSERT INTO `admin_operation_log` VALUES ('404', '1', 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"HELIUS\\/\\u8d6b\\u4e3d\\u5c14\\u65af\\u6c28\\u57fa\\u9178\\u6d01\\u989c\\u871c\\u5973\\u6d17\\u9762\\u5976\",\"good_source\":\"1\",\"buy_address\":\"https:\\/\\/detail.tmall.com\\/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711\",\"good_price\":\"209\",\"coupon\":\"100\",\"reward\":\"60\",\"require_type\":\"2\",\"task_desc\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" title=\\\"\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" alt=\\\"qrcode_demo.jpg\\\"\\/><\\/p><p>\\u53eb\\u6211\\u5fae\\u4fe1\\u4e86\\u89e3\\u8be6\\u60c5<\\/p>\",\"task_type\":\"1\",\"_token\":\"2Y6tiRawEEzEdDH10HX6wk2f9H43dsgVhXHHGIFx\",\"_method\":\"PUT\"}', '2020-10-12 03:43:10', '2020-10-12 03:43:10');
INSERT INTO `admin_operation_log` VALUES ('405', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 03:43:10', '2020-10-12 03:43:10');
INSERT INTO `admin_operation_log` VALUES ('406', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 03:52:19', '2020-10-12 03:52:19');
INSERT INTO `admin_operation_log` VALUES ('407', '1', 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"HELIUS\\/\\u8d6b\\u4e3d\\u5c14\\u65af\\u6c28\\u57fa\\u9178\\u6d01\\u989c\\u871c\\u5973\\u6d17\\u9762\\u5976\",\"good_source\":\"1\",\"buy_address\":\"https:\\/\\/detail.tmall.com\\/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711\",\"good_price\":\"209\",\"coupon\":\"100\",\"reward\":\"60\",\"require_type_id\":\"2\",\"task_desc\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" title=\\\"\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" alt=\\\"qrcode_demo.jpg\\\"\\/><\\/p><p>\\u53eb\\u6211\\u5fae\\u4fe1\\u4e86\\u89e3\\u8be6\\u60c5<\\/p>\",\"task_type\":\"1\",\"_token\":\"2Y6tiRawEEzEdDH10HX6wk2f9H43dsgVhXHHGIFx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-12 03:52:28', '2020-10-12 03:52:28');
INSERT INTO `admin_operation_log` VALUES ('408', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-12 03:52:28', '2020-10-12 03:52:28');
INSERT INTO `admin_operation_log` VALUES ('409', '1', 'admin/about/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 12:23:12', '2020-10-12 12:23:12');
INSERT INTO `admin_operation_log` VALUES ('410', '1', 'admin/articles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 12:23:13', '2020-10-12 12:23:13');
INSERT INTO `admin_operation_log` VALUES ('411', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 12:23:14', '2020-10-12 12:23:14');
INSERT INTO `admin_operation_log` VALUES ('412', '1', 'admin/good-sources', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 12:23:15', '2020-10-12 12:23:15');
INSERT INTO `admin_operation_log` VALUES ('413', '1', 'admin/require-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 12:23:17', '2020-10-12 12:23:17');
INSERT INTO `admin_operation_log` VALUES ('414', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 12:23:18', '2020-10-12 12:23:18');
INSERT INTO `admin_operation_log` VALUES ('415', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 15:22:34', '2020-10-12 15:22:34');
INSERT INTO `admin_operation_log` VALUES ('416', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 15:23:22', '2020-10-12 15:23:22');
INSERT INTO `admin_operation_log` VALUES ('417', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 15:24:30', '2020-10-12 15:24:30');
INSERT INTO `admin_operation_log` VALUES ('418', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"IgEc4Bw0UKOlCx4yVB7ZHaIpGVItbwjPxkmouhyn\"}', '2020-10-12 15:24:49', '2020-10-12 15:24:49');
INSERT INTO `admin_operation_log` VALUES ('419', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-12 15:24:49', '2020-10-12 15:24:49');
INSERT INTO `admin_operation_log` VALUES ('420', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-12 15:24:51', '2020-10-12 15:24:51');
INSERT INTO `admin_operation_log` VALUES ('421', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 15:24:52', '2020-10-12 15:24:52');
INSERT INTO `admin_operation_log` VALUES ('422', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-10-12 15:25:27', '2020-10-12 15:25:27');
INSERT INTO `admin_operation_log` VALUES ('423', '1', 'admin/users/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 15:25:33', '2020-10-12 15:25:33');
INSERT INTO `admin_operation_log` VALUES ('424', '1', 'admin/users/4', 'PUT', '127.0.0.1', '{\"name\":\"188****5594\",\"email\":null,\"password\":null,\"remember_token\":null,\"mobile\":\"18825155594\",\"openid\":null,\"nickname\":null,\"gender\":\"off\",\"role\":\"on\",\"is_player\":\"off\",\"intro\":\"\\u8fd9\\u4e2a\\u4eba\\u5f88\\u61d2\\uff0c\\u8fd8\\u6ca1\\u6709\\u81ea\\u6211\\u4ecb\\u7ecd\",\"_token\":\"IgEc4Bw0UKOlCx4yVB7ZHaIpGVItbwjPxkmouhyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/users\"}', '2020-10-12 15:25:41', '2020-10-12 15:25:41');
INSERT INTO `admin_operation_log` VALUES ('425', '1', 'admin/users/4/edit', 'GET', '127.0.0.1', '[]', '2020-10-12 15:25:41', '2020-10-12 15:25:41');
INSERT INTO `admin_operation_log` VALUES ('426', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 15:25:47', '2020-10-12 15:25:47');
INSERT INTO `admin_operation_log` VALUES ('427', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-10-12 15:26:04', '2020-10-12 15:26:04');
INSERT INTO `admin_operation_log` VALUES ('428', '1', 'admin/users/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 15:26:08', '2020-10-12 15:26:08');
INSERT INTO `admin_operation_log` VALUES ('429', '1', 'admin/users/7', 'PUT', '127.0.0.1', '{\"name\":null,\"email\":null,\"password\":null,\"remember_token\":null,\"mobile\":null,\"openid\":\"oIm-n5HrFnFbP7cwQ3GU3LMymNj4\",\"nickname\":\"Hwan\\u65ed\",\"gender\":\"on\",\"role\":\"on\",\"is_player\":\"off\",\"intro\":\"\\u8fd9\\u4e2a\\u4eba\\u5f88\\u61d2\\uff0c\\u8fd8\\u6ca1\\u6709\\u81ea\\u6211\\u4ecb\\u7ecd\",\"_token\":\"IgEc4Bw0UKOlCx4yVB7ZHaIpGVItbwjPxkmouhyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/users\"}', '2020-10-12 15:26:14', '2020-10-12 15:26:14');
INSERT INTO `admin_operation_log` VALUES ('430', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-10-12 15:26:14', '2020-10-12 15:26:14');
INSERT INTO `admin_operation_log` VALUES ('431', '1', 'admin/users/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-12 15:26:29', '2020-10-12 15:26:29');
INSERT INTO `admin_operation_log` VALUES ('432', '1', 'admin/users/7', 'PUT', '127.0.0.1', '{\"name\":null,\"email\":null,\"password\":null,\"remember_token\":null,\"mobile\":null,\"openid\":\"oIm-n5HrFnFbP7cwQ3GU3LMymNj4\",\"nickname\":\"Hwan\\u65ed\",\"gender\":\"on\",\"role\":\"on\",\"is_player\":\"on\",\"intro\":\"\\u8fd9\\u4e2a\\u4eba\\u5f88\\u61d2\\uff0c\\u8fd8\\u6ca1\\u6709\\u81ea\\u6211\\u4ecb\\u7ecd\",\"_token\":\"IgEc4Bw0UKOlCx4yVB7ZHaIpGVItbwjPxkmouhyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/users\"}', '2020-10-12 15:26:35', '2020-10-12 15:26:35');
INSERT INTO `admin_operation_log` VALUES ('433', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-10-12 15:26:35', '2020-10-12 15:26:35');
INSERT INTO `admin_operation_log` VALUES ('434', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-13 10:38:32', '2020-10-13 10:38:32');
INSERT INTO `admin_operation_log` VALUES ('435', '1', 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-13 10:38:48', '2020-10-13 10:38:48');
INSERT INTO `admin_operation_log` VALUES ('436', '1', 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"HELIUS\\/\\u8d6b\\u4e3d\\u5c14\\u65af\\u6c28\\u57fa\\u9178\\u6d01\\u989c\\u871c\\u5973\\u6d17\\u9762\\u5976\",\"good_source\":\"1\",\"buy_address\":\"https:\\/\\/detail.tmall.com\\/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711\",\"good_price\":\"209\",\"coupon\":\"100\",\"reward\":\"60\",\"require_type_id\":\"2\",\"task_desc\":\"<p><img src=\\\"http:\\/\\/cdn.lzhnb.com\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" title=\\\"\\/uploads\\/image\\/2020\\/10\\/12\\/560c0ecd59ea1a79181ef60a9e1754f3.jpg\\\" alt=\\\"qrcode_demo.jpg\\\"\\/><\\/p><p>\\u53eb\\u6211\\u5fae\\u4fe1\\u4e86\\u89e3\\u8be6\\u60c5<\\/p>\",\"task_type\":\"1\",\"limit_number\":\"4\",\"_token\":\"9MOeZ1KJqsMVtefmv0k7kt6BUhaozUdGsRFRTGQs\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-13 10:39:07', '2020-10-13 10:39:07');
INSERT INTO `admin_operation_log` VALUES ('437', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-13 10:39:07', '2020-10-13 10:39:07');
INSERT INTO `admin_operation_log` VALUES ('438', '1', 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-13 11:25:47', '2020-10-13 11:25:47');
INSERT INTO `admin_operation_log` VALUES ('439', '1', 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"AHC\\u6c34\\u4e73\\u5957\\u88c5\\u62a4\\u80a4\\u54c1\",\"good_source\":\"2\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?tbpm=1&spm=a230r.1.14.30.74ef4a8b9Ue3cW&id=569083676891&ns=1&abbucket=9\",\"good_price\":\"148\",\"coupon\":\"100\",\"reward\":\"50\",\"require_type_id\":null,\"task_desc\":null,\"task_type\":\"2\",\"limit_number\":\"10\",\"_token\":\"9MOeZ1KJqsMVtefmv0k7kt6BUhaozUdGsRFRTGQs\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-13 11:25:55', '2020-10-13 11:25:55');
INSERT INTO `admin_operation_log` VALUES ('440', '1', 'admin/tasks/2/edit', 'GET', '127.0.0.1', '[]', '2020-10-13 11:25:55', '2020-10-13 11:25:55');
INSERT INTO `admin_operation_log` VALUES ('441', '1', 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"AHC\\u6c34\\u4e73\\u5957\\u88c5\\u62a4\\u80a4\\u54c1\",\"good_source\":\"2\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?tbpm=1&spm=a230r.1.14.30.74ef4a8b9Ue3cW&id=569083676891&ns=1&abbucket=9\",\"good_price\":\"148\",\"coupon\":\"100\",\"reward\":\"50\",\"require_type_id\":\"2\",\"task_desc\":\"<p>\\u62cd\\u4e2a\\u77ed\\u89c6\\u9891\\u5c31\\u597d\\u5566<\\/p>\",\"task_type\":\"2\",\"limit_number\":\"10\",\"_token\":\"9MOeZ1KJqsMVtefmv0k7kt6BUhaozUdGsRFRTGQs\",\"_method\":\"PUT\"}', '2020-10-13 11:26:23', '2020-10-13 11:26:23');
INSERT INTO `admin_operation_log` VALUES ('442', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-13 11:26:23', '2020-10-13 11:26:23');
INSERT INTO `admin_operation_log` VALUES ('443', '1', 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-13 11:28:00', '2020-10-13 11:28:00');
INSERT INTO `admin_operation_log` VALUES ('444', '1', 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"TFIT\\u6c34\\u4e73\\u5957\\u88c5\\u6b63\\u54c1\\u8865\\u6c34\\u4fdd\\u6e7f\",\"good_source\":\"3\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9\",\"good_price\":\"168\",\"coupon\":\"30\",\"reward\":\"40\",\"require_type_id\":\"1\",\"task_desc\":\"<p>123<\\/p>\",\"task_type\":\"3\",\"limit_number\":\"4\",\"_token\":\"9MOeZ1KJqsMVtefmv0k7kt6BUhaozUdGsRFRTGQs\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-13 11:28:12', '2020-10-13 11:28:12');
INSERT INTO `admin_operation_log` VALUES ('445', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-13 11:28:13', '2020-10-13 11:28:13');
INSERT INTO `admin_operation_log` VALUES ('446', '1', 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-13 11:28:26', '2020-10-13 11:28:26');
INSERT INTO `admin_operation_log` VALUES ('447', '1', 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"user_id\":\"0\",\"good_name\":\"TFIT\\u6c34\\u4e73\\u5957\\u88c5\\u6b63\\u54c1\\u8865\\u6c34\\u4fdd\\u6e7f\",\"good_source\":\"3\",\"buy_address\":\"https:\\/\\/detail.tmall.hk\\/hk\\/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9\",\"good_price\":\"168\",\"coupon\":\"30\",\"reward\":\"40\",\"require_type_id\":\"1\",\"task_desc\":\"<p>123<\\/p>\",\"task_type\":\"3\",\"limit_number\":\"6\",\"_token\":\"9MOeZ1KJqsMVtefmv0k7kt6BUhaozUdGsRFRTGQs\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/tasks\"}', '2020-10-13 11:28:31', '2020-10-13 11:28:31');
INSERT INTO `admin_operation_log` VALUES ('448', '1', 'admin/tasks', 'GET', '127.0.0.1', '[]', '2020-10-13 11:28:31', '2020-10-13 11:28:31');
INSERT INTO `admin_operation_log` VALUES ('449', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-14 16:52:38', '2020-10-14 16:52:38');
INSERT INTO `admin_operation_log` VALUES ('450', '1', 'admin/require-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:52:44', '2020-10-14 16:52:44');
INSERT INTO `admin_operation_log` VALUES ('451', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:52:45', '2020-10-14 16:52:45');
INSERT INTO `admin_operation_log` VALUES ('452', '1', 'admin/good-sources', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:52:56', '2020-10-14 16:52:56');
INSERT INTO `admin_operation_log` VALUES ('453', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:52:57', '2020-10-14 16:52:57');
INSERT INTO `admin_operation_log` VALUES ('454', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:53:03', '2020-10-14 16:53:03');
INSERT INTO `admin_operation_log` VALUES ('455', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5e73\\u53f0\\u8bbe\\u7f6e\",\"icon\":\"fa-gears\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\"}', '2020-10-14 16:54:07', '2020-10-14 16:54:07');
INSERT INTO `admin_operation_log` VALUES ('456', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:54:08', '2020-10-14 16:54:08');
INSERT INTO `admin_operation_log` VALUES ('457', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:54:12', '2020-10-14 16:54:12');
INSERT INTO `admin_operation_log` VALUES ('458', '1', 'admin/require-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:54:19', '2020-10-14 16:54:19');
INSERT INTO `admin_operation_log` VALUES ('459', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:54:21', '2020-10-14 16:54:21');
INSERT INTO `admin_operation_log` VALUES ('460', '1', 'admin/require-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:54:23', '2020-10-14 16:54:23');
INSERT INTO `admin_operation_log` VALUES ('461', '1', 'admin/good-sources', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:54:24', '2020-10-14 16:54:24');
INSERT INTO `admin_operation_log` VALUES ('462', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:54:25', '2020-10-14 16:54:25');
INSERT INTO `admin_operation_log` VALUES ('463', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:54:29', '2020-10-14 16:54:29');
INSERT INTO `admin_operation_log` VALUES ('464', '1', 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:54:36', '2020-10-14 16:54:36');
INSERT INTO `admin_operation_log` VALUES ('465', '1', 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"17\",\"title\":\"\\u7535\\u5546\\u5e73\\u53f0\",\"icon\":\"fa-shopping-bag\",\"uri\":\"good-sources\",\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/auth\\/menu\"}', '2020-10-14 16:54:43', '2020-10-14 16:54:43');
INSERT INTO `admin_operation_log` VALUES ('466', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:54:43', '2020-10-14 16:54:43');
INSERT INTO `admin_operation_log` VALUES ('467', '1', 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:54:47', '2020-10-14 16:54:47');
INSERT INTO `admin_operation_log` VALUES ('468', '1', 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"17\",\"title\":\"\\u4efb\\u52a1\\u7c7b\\u578b\",\"icon\":\"fa-balance-scale\",\"uri\":\"require-types\",\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/auth\\/menu\"}', '2020-10-14 16:54:54', '2020-10-14 16:54:54');
INSERT INTO `admin_operation_log` VALUES ('469', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:54:54', '2020-10-14 16:54:54');
INSERT INTO `admin_operation_log` VALUES ('470', '1', 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:55:08', '2020-10-14 16:55:08');
INSERT INTO `admin_operation_log` VALUES ('471', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:55:13', '2020-10-14 16:55:13');
INSERT INTO `admin_operation_log` VALUES ('472', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4efb\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa-product-hunt\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\"}', '2020-10-14 16:55:50', '2020-10-14 16:55:50');
INSERT INTO `admin_operation_log` VALUES ('473', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:55:50', '2020-10-14 16:55:50');
INSERT INTO `admin_operation_log` VALUES ('474', '1', 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:55:57', '2020-10-14 16:55:57');
INSERT INTO `admin_operation_log` VALUES ('475', '1', 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"13\",\"title\":\"\\u5546\\u5bb6\\u4efb\\u52a1\",\"icon\":\"fa-tasks\",\"uri\":\"tasks\",\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/auth\\/menu\"}', '2020-10-14 16:56:19', '2020-10-14 16:56:19');
INSERT INTO `admin_operation_log` VALUES ('476', '1', 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '[]', '2020-10-14 16:56:19', '2020-10-14 16:56:19');
INSERT INTO `admin_operation_log` VALUES ('477', '1', 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"18\",\"title\":\"\\u5546\\u5bb6\\u4efb\\u52a1\",\"icon\":\"fa-tasks\",\"uri\":\"tasks\",\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_method\":\"PUT\"}', '2020-10-14 16:56:26', '2020-10-14 16:56:26');
INSERT INTO `admin_operation_log` VALUES ('478', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:56:26', '2020-10-14 16:56:26');
INSERT INTO `admin_operation_log` VALUES ('479', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:56:31', '2020-10-14 16:56:31');
INSERT INTO `admin_operation_log` VALUES ('480', '1', 'admin/cash', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:56:45', '2020-10-14 16:56:45');
INSERT INTO `admin_operation_log` VALUES ('481', '1', 'admin/cash/10', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_method\":\"PUT\"}', '2020-10-14 16:56:49', '2020-10-14 16:56:49');
INSERT INTO `admin_operation_log` VALUES ('482', '1', 'admin/cash/10', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_method\":\"PUT\"}', '2020-10-14 16:56:50', '2020-10-14 16:56:50');
INSERT INTO `admin_operation_log` VALUES ('483', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:56:53', '2020-10-14 16:56:53');
INSERT INTO `admin_operation_log` VALUES ('484', '1', 'admin/articles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:56:54', '2020-10-14 16:56:54');
INSERT INTO `admin_operation_log` VALUES ('485', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:56:55', '2020-10-14 16:56:55');
INSERT INTO `admin_operation_log` VALUES ('486', '1', 'admin/about/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:56:56', '2020-10-14 16:56:56');
INSERT INTO `admin_operation_log` VALUES ('487', '1', 'admin/virtuals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:56:58', '2020-10-14 16:56:58');
INSERT INTO `admin_operation_log` VALUES ('488', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:57:09', '2020-10-14 16:57:09');
INSERT INTO `admin_operation_log` VALUES ('489', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\",\"icon\":\"fa-connectdevelop\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\"}', '2020-10-14 16:57:27', '2020-10-14 16:57:27');
INSERT INTO `admin_operation_log` VALUES ('490', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:57:27', '2020-10-14 16:57:27');
INSERT INTO `admin_operation_log` VALUES ('491', '1', 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:57:39', '2020-10-14 16:57:39');
INSERT INTO `admin_operation_log` VALUES ('492', '1', 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"\\u6d3b\\u52a8\\u8f6e\\u64ad\\u56fe\",\"icon\":\"fa-photo\",\"uri\":\"banners\",\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/auth\\/menu\"}', '2020-10-14 16:57:47', '2020-10-14 16:57:47');
INSERT INTO `admin_operation_log` VALUES ('493', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 16:57:48', '2020-10-14 16:57:48');
INSERT INTO `admin_operation_log` VALUES ('494', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_order\":\"[{\\\"id\\\":8},{\\\"id\\\":10},{\\\"id\\\":16},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":12},{\\\"id\\\":11}]},{\\\"id\\\":17,\\\"children\\\":[{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":13}]},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-10-14 16:58:04', '2020-10-14 16:58:04');
INSERT INTO `admin_operation_log` VALUES ('495', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 16:58:04', '2020-10-14 16:58:04');
INSERT INTO `admin_operation_log` VALUES ('496', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 17:01:19', '2020-10-14 17:01:19');
INSERT INTO `admin_operation_log` VALUES ('497', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u4efb\\u52a1\",\"icon\":\"fa-check-circle\",\"uri\":\"task-users\",\"roles\":[null],\"permission\":null,\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\"}', '2020-10-14 17:08:29', '2020-10-14 17:08:29');
INSERT INTO `admin_operation_log` VALUES ('498', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 17:08:29', '2020-10-14 17:08:29');
INSERT INTO `admin_operation_log` VALUES ('499', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 17:08:33', '2020-10-14 17:08:33');
INSERT INTO `admin_operation_log` VALUES ('500', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 17:08:37', '2020-10-14 17:08:37');
INSERT INTO `admin_operation_log` VALUES ('501', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"e4JxdeRD8nlJpgztYr6ZGGG2G3vAcF7zZ0SWAj9R\",\"_order\":\"[{\\\"id\\\":8},{\\\"id\\\":10},{\\\"id\\\":16},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":12},{\\\"id\\\":11}]},{\\\"id\\\":17,\\\"children\\\":[{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":13}]},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-10-14 17:08:45', '2020-10-14 17:08:45');
INSERT INTO `admin_operation_log` VALUES ('502', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 17:08:45', '2020-10-14 17:08:45');
INSERT INTO `admin_operation_log` VALUES ('503', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-14 17:08:46', '2020-10-14 17:08:46');
INSERT INTO `admin_operation_log` VALUES ('504', '1', 'admin/task-users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 17:08:49', '2020-10-14 17:08:49');
INSERT INTO `admin_operation_log` VALUES ('505', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 17:29:08', '2020-10-14 17:29:08');
INSERT INTO `admin_operation_log` VALUES ('506', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 17:29:17', '2020-10-14 17:29:17');
INSERT INTO `admin_operation_log` VALUES ('507', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 17:33:04', '2020-10-14 17:33:04');
INSERT INTO `admin_operation_log` VALUES ('508', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 17:36:11', '2020-10-14 17:36:11');
INSERT INTO `admin_operation_log` VALUES ('509', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 17:45:10', '2020-10-14 17:45:10');
INSERT INTO `admin_operation_log` VALUES ('510', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 17:50:46', '2020-10-14 17:50:46');
INSERT INTO `admin_operation_log` VALUES ('511', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-14 23:33:25', '2020-10-14 23:33:25');
INSERT INTO `admin_operation_log` VALUES ('512', '1', 'admin/task-users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 23:33:28', '2020-10-14 23:33:28');
INSERT INTO `admin_operation_log` VALUES ('513', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 23:34:22', '2020-10-14 23:34:22');
INSERT INTO `admin_operation_log` VALUES ('514', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 23:41:02', '2020-10-14 23:41:02');
INSERT INTO `admin_operation_log` VALUES ('515', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-14 23:42:49', '2020-10-14 23:42:49');
INSERT INTO `admin_operation_log` VALUES ('516', '1', 'admin/task_user/clear/1', 'GET', '127.0.0.1', '[]', '2020-10-14 23:44:47', '2020-10-14 23:44:47');
INSERT INTO `admin_operation_log` VALUES ('517', '1', 'admin/task-users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-14 23:44:47', '2020-10-14 23:44:47');
INSERT INTO `admin_operation_log` VALUES ('518', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-15 00:36:39', '2020-10-15 00:36:39');
INSERT INTO `admin_operation_log` VALUES ('519', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-15 00:40:23', '2020-10-15 00:40:23');
INSERT INTO `admin_operation_log` VALUES ('520', '1', 'admin/task-users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 00:40:26', '2020-10-15 00:40:26');
INSERT INTO `admin_operation_log` VALUES ('521', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-15 01:08:53', '2020-10-15 01:08:53');
INSERT INTO `admin_operation_log` VALUES ('522', '1', 'admin/task_user/clear/1', 'GET', '127.0.0.1', '[]', '2020-10-15 01:08:58', '2020-10-15 01:08:58');
INSERT INTO `admin_operation_log` VALUES ('523', '1', 'admin/task-users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 01:08:58', '2020-10-15 01:08:58');
INSERT INTO `admin_operation_log` VALUES ('524', '1', 'admin/task_user/clear/1', 'GET', '127.0.0.1', '[]', '2020-10-15 01:09:04', '2020-10-15 01:09:04');
INSERT INTO `admin_operation_log` VALUES ('525', '1', 'admin/task-users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 01:09:04', '2020-10-15 01:09:04');
INSERT INTO `admin_operation_log` VALUES ('526', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-15 01:10:55', '2020-10-15 01:10:55');
INSERT INTO `admin_operation_log` VALUES ('527', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-15 01:11:34', '2020-10-15 01:11:34');
INSERT INTO `admin_operation_log` VALUES ('528', '1', 'admin/task-users', 'GET', '127.0.0.1', '[]', '2020-10-15 01:13:02', '2020-10-15 01:13:02');
INSERT INTO `admin_operation_log` VALUES ('529', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 01:22:05', '2020-10-15 01:22:05');
INSERT INTO `admin_operation_log` VALUES ('530', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 01:22:08', '2020-10-15 01:22:08');
INSERT INTO `admin_operation_log` VALUES ('531', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:26:23', '2020-10-15 01:26:23');
INSERT INTO `admin_operation_log` VALUES ('532', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:26:49', '2020-10-15 01:26:49');
INSERT INTO `admin_operation_log` VALUES ('533', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:27:05', '2020-10-15 01:27:05');
INSERT INTO `admin_operation_log` VALUES ('534', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:27:16', '2020-10-15 01:27:16');
INSERT INTO `admin_operation_log` VALUES ('535', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:43:46', '2020-10-15 01:43:46');
INSERT INTO `admin_operation_log` VALUES ('536', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:52:50', '2020-10-15 01:52:50');
INSERT INTO `admin_operation_log` VALUES ('537', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:52:54', '2020-10-15 01:52:54');
INSERT INTO `admin_operation_log` VALUES ('538', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:53:08', '2020-10-15 01:53:08');
INSERT INTO `admin_operation_log` VALUES ('539', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '[]', '2020-10-15 01:53:43', '2020-10-15 01:53:43');
INSERT INTO `admin_operation_log` VALUES ('540', '1', 'admin/banners/3', 'PUT', '127.0.0.1', '{\"image_src\":\"http:\\/\\/cdn.lzhnb.com\\/images\\/75968b76ca5ed8ee69790bc709be4e2e.jpeg\",\"link_type\":\"1\",\"link\":\"\\/pages\\/match\\/match\",\"is_show\":\"on\",\"_token\":\"7HXbwWNiuXnzR8R1xFYSfU74v7FATPCkxpeTOJuE\",\"_method\":\"PUT\"}', '2020-10-15 02:03:31', '2020-10-15 02:03:31');
INSERT INTO `admin_operation_log` VALUES ('541', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-10-15 02:03:31', '2020-10-15 02:03:31');
INSERT INTO `admin_operation_log` VALUES ('542', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-10-15 02:04:08', '2020-10-15 02:04:08');
INSERT INTO `admin_operation_log` VALUES ('543', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:04:25', '2020-10-15 02:04:25');
INSERT INTO `admin_operation_log` VALUES ('544', '1', 'admin/banners/3', 'PUT', '127.0.0.1', '{\"image_src\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQAAAQABAAD\\/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD\\/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD\\/wAARCACYAV4DASIAAhEBAxEB\\/8QAHQAAAAcBAQEAAAAAAAAAAAAAAAECAwQFBgcICf\\/EAD0QAAEDAwMCBAQEAwYGAwAAAAECAxEABCEFEjEGQQcTIlEyYXGBCBSRoSNCsRUWUnLB0SRiguHw8TM0kv\\/EABoBAAIDAQEAAAAAAAAAAAAAAAABAgQFAwb\\/xAAtEQACAQQCAQIFAwUBAAAAAAAAAQIDESExBBJBBRMGIlFhcRZCoRQjMpGxUv\\/aAAwDAQACEQMRAD8AiJA37p5FSmIjjNMIT\\/MYqSyjEzIFew3swHslJ+EDue1OhsQJFIbHBjinoMxBpIkgJ528Z5p1ABO4mJFJAJxSkgACVTUvwSHmwOY4pWM\\/1oNwMK4ikkEKJBIHFQW8kXsQUxGfrSFZkjvT5ggwBTa0HJA+4qSd3Ya+ozmYikLAKSBk04Zn2ptUQPem1YV8kZQ3SoqiaiOJTEVNdTKZAioLgMRPPekNbIjqQfaAag3QBJSeIqwdUlUxykVX3HBWox2pSGtFc+IyaqnyZx3FW1zt2nM1V3CQDM8cVyZ0ikVGoYbIJrO3e6OcTWg1MgIM9qz92qE8c1R5N2XKKsik1MgNk\\/KqJlMqJnvVzqJBSs9vnVIl5tlBcWqACf8A1VN4LP4LK2MgE4+tPHUbJr\\/5bhAjnNUptnLtk3V\\/dLZbA9Fu3kke6iKqkXq7i4RYJt0LSpWxA2wSfnXKVdRJxg2axXVXT7aiDqCQB32mrKzv7G\\/RvtX0Og9wa53reiqRcpZbtVsuuQPKPCT3+1MHTr\\/Rtj9reLbdT6pQcT\\/rUVXd9EXHwdUEJOKUF5ArN9KdTjW0KtrzYi8ayoDAWPcD+taVCArMxVmMlPKINNbHRBiaSUyY3DFL29pn5UkD1fWnYA+BgTQCZzuiaBHaaKBEmn4DyN\\/WiVyKUUnJFEqSANtDDAggd6KZpe33ANEUgn2+lHgLXGiIEe1EfnThFJUB3qIxhYMxEj60naEZOSfanVEDgUn0zFK4vIyRJwKbUNquIxUhwbVQME96bUnPFNDEEiaZX6gBup4oB7RSDBMRxTC56Ra2\\/Ce9TGEASMxURISSNhxOam2\\/BNbt8GG94JKAAkEck\\/pTySCqfvTTUDBzUkJSTJGYqKZIJMHIMUfl7QNwnPvS0hJzFH5cEEE54mppj3gU2CUD6xzRRvJA7Ec0sA5jijPwx2GajphYQpPoG3JFNE+kbsEU6JyBSHUk4jvR9hjKu8jNNKG4cRTrkhWBIFJUJMg8VJ6EtkR1W0BGAJ7VEeQlScEyKlvKT8JEkdqivCCdpxH6Ug8le6SMgYmKivpkKFTVCCaiPkqA4BilIkireSkBU9qq7vPFWlwEkqBFVdzEmMCuTyTiUWpqVJxM1RXnAFXmpb5VnA4rP3hJ4NUeQ1cu03gotSVDSwfaqOxYbuXTcXC9jLJ9IiSs\\/IfrVnrr4QgNJkrdO0AUptpjSNOVcPNpce4bSRWdVlktJFLrur3Lafy9qyllr3UZJ+p\\/2ql05y4GotPJJUtLiVSBPetj0V4adUeJ+s+Tplq46jd\\/FcHwpzwPpXqfoH8Hel6aG7vWFhx1MK2qAIn2rOq14t2RoUeHUlaWjgvjXbI0m60jUmbUoOoaUw+VBMSozJ+vArjV3qLq1FTiznivo7154F6P1VpzFnqtshSbNnymSgwQkcCvHnjL+HnVuinXr7SEu3NkhBcOJKR\\/2qFLkx\\/wZ0r8KavOOTird49aXSL21WW3WzuSR711zprWmdd0xu8RAcEJdR\\/hX3rirqlIVtUCK13htqv5fWTYLV6LtJCf84Ej9pFXePU6zt9TMmrnVe896TPcp4pYAiT9qAEmtE4WS2JWAZjFFEpjH6UtVFgCgaGyCkgZNAEzB70pQJGKKAYPeh2Esq40QQrmiUDzTpCe4pCgCqQYowSvYakzkUSsjApZEHmaSfak0F2xkj3FEIBmKcUnE+9IgyaTxsEIcBUQTnPFJRIUU+1OlJio8kKJBzSWRgWYJxTZE0sj3pJxjv3psSzg9JJTISkftUtoQQkDj51GbEQJqUwkgAJA+ZrcesmIsskogFJjjFSgAfVG2RUdIB7fpUgIhP1pLBIW0sTEHFLJTgSMcUhCDukdqUUKNSAWPmMGl7QUJwMzMftSUpUBChj6Utc7QAMRBpMGIUkAfSmVyDuORT5ALZzn2ppYJTxQsElkjqImZplUxxTym1E5EZmmzkEVKWsC8kV1MrIn9qiPCBA7nNSnSRKf3qK6rsE\\/WjNsh5IThglKvb2qFcGE7gJNTnyIg81BeAB9RwaiyRWXfAJ71V3JgkRM1aXaSDM4qpujC936VyZJFHfqkn6Gs9ergkJI4q+1BQTujP3rJ65eCytXbhQHpBiTye1Z\\/Iai7s0KK7YMw\\/eC51hT07m2f4aPr3P7VMtXDq9x+VaIMwhGOVqwKyD98psKSgwXJzNbXwjRb3\\/WFkxcKPlsQ8sJBJJnAjvx+9YdWt8rZpUKSqVYwPc34fegGOmOmLJpNuhKyhKln58n967gm2UAABXLeluqtZ03T7cW3QmqONhPxLWhs\\/WCcCt3pnVb2pj1WDlsscoczH6VlQxvZ6Fq+ide2e9Jn9JrB9W9PWN9ZuoftkuJcSQQUzOKtepte1ta\\/wAlpLjDKlSFuvAkIHyA5Nce1\\/rXw\\/e1Q6Rrfi65fagVbPIt3S2ykzBAUkbecSDSaT0JYWTzN+IPwIGgNL6m6ctleQVFT7aAfQPeK8\\/6Tdq07VLW8SraWXUq+05\\/avotqOkW+o6JcWaLl69tlNqSFPOeYSIjnvXhyw8LdY6l1zWbeyftrRuwWraq4UUhxe6EtpgcnP6VZ49fqm5vRl8ziOU17Sy\\/B0pl1LzKHEKCkrAII7giloGcmqfo65Vc9O2TjmVhvYfqn0\\/6VdBKu4r0kH2j2RhyVmBUE8UIScEUINCDQARAApo\\/EYBAp44yabX8v\\/dMY2rg+80lfAEUo5yRSSIPM0\\/AkwlJGIPam1U5SFCBSHcQRPeiITODFKpJHtUGCCkSR7UyUgT6Z70+UkdqRtIpK6ZJjRAUJiDTRBSTIp0hQIigpG8nFS2RWD0e2E7p+9TGilPwk5qK2nAIzUtgBW445rb2jGX0HkkQRmexFSEFcQe1NpQAMYI4qQgDbEZowkOwtEQZMTS\\/0pCBB96WDgHt3oxsaD7RxNKGBHvQJSfVIPyoKUYn5zSYbEqAIxg0wsx8Jk+wp1ZBgwRTbiU9jTSEhsK3e9MKJ7gA8RTpUrsKZUrvMxUtD0R3ElSjK+KhvgSYPfNS1KKp2jNQHVSII5oDRFeg+oEmOahXECTzFTHlgJIAzVbcLHvFRk7jIF27MiKqbtZiIFWN2oDkyap7x2JEYrjJ20dYLJSag4lKSSPnXJ+tNeTeXP5a3XuZaPqI4Kq3\\/WF6q20p5TaoWsFIM1xrUDtRAPKiTWDz6rv0Rr8an8vYZt3FOuKeX2MAewrp\\/wCGObvxRbk7lJaKkD3MgVyi1Wf4gJ4OK3\\/4b9bZ0Pxh0U3J2tXjyrVR9irI\\/cCsmqn0aLvFklXg39T25r+g+MfVSb5endSO6K1bqb\\/I2bLqm0XCRIUXVt+ueCADGM811Hwl6f6m0nS7S36u1j+1LxlCEu3WyCtcersJE8GMjmtbpKLW5smloCVEpBkVZbG7cpSIEnJ9qqR0k\\/Bvzt2bXkyvVOgWmoX9\\/p7hWG3xt9JgxOR9xj6E1zu5\\/Dx0Zdane6ojQLNh\\/UD\\/ABy3u2xuCjtRwiSATtAzXReuNXtLXVW1W180ha078n4yAMfWrdjUmHtNRcIGXEBXHuKfazaTIRi7JtHK+pNJ0rpjRhp9m0G0NpIweMfOvJF1eN9Iar1H1MhpBSGn3WkKThT49bQP\\/Ukj6E16o8R7xy4auJVAhQivHfjh1b0\\/\\/d5PSmn3SnNXRfKcukAKCW0QeTAEmU4k9+K4Rj3l0SwyVaaow7t5yU\\/h4CemmVK5Li8\\/etMJmBms70Agt9M24J+IqUPuTWilU166krQR4+f+TDxMTQoEgUK6CBHM5psgAZpavrSCYMc0C0NkbQcA0hcEyKcXyPnREGYqQDRHGaSU4OeKeKQOaQQIOeKjIaQzREA0Znd8jQqAwpk0nnHypUZmgY4mhbB4Q2pI5j5U1uATG480+SAYgmmyQf5RTF9z0k3zsjHyqUygcRFR2vUqY7GpbQOBHFbdzHWCQkAqBAgDFPJGOKaQZO3ANOLB2iOaQ8Ic3CZigDmYx86SkKgA80tBVthQ4poEAgHIGaBOYKo+VDEYJBoAJyVGkxXswlfFCQYP6VHKSZV3mpClCBKcCkelUwmmhrA2o44icVGdwlRjNSFAD1A+1R1wZCjmm34HbFiI6SUkAAziRUJ8lsTGanqWlIIHb5VAeXJKlcRQH2K90qI3Ad5qsuknJnmrN6AkbjkCaq7tXKpBA\\/pUG\\/I1sqb1bkFIPaqO+eKv5p7zNXN4sQZArPX7olSRVacrHeCyYvrZanGW2p+Ik1zC8YWpwNHkkf1rp\\/U5S75Sif59tYh5hI1RDboEbxJPtXnuW71W2btCL9tFM5pT1qyoqSNxVFQbe5udH1S31C2WW3rZ1LzSh2UkyP3FarSH0avfFtyA3uWQT7Cs\\/riWlKBbSJC1D6iq9kxzi4pNH1N8C\\/ECy6+6D0nqKxfCvzDIDqQcocThST8woGularpVpr+mO2N08pCXQAVIVtI+9fMX8LPj+\\/4SdRq0DWn1f3f1ZxIUTkWzxMBcf4TwfsfevfuqCy8QOnl2o1K5at7lolLtlcFsmRg7k8gz96zaydN2ZucWuuQk27eH9is6y0XobTVs3OrdT2Msq2tpXdBShHxCAZqf0\\/1p0\\/rFg7aaFqTF4m0htamVbkpPYSMdq5k94aXFkyvTU2ThBSpBWHVbFpPdSeVfQ1oemtCR0no6dNRtbCdy1kAJknvVSFVyk\\/lsjb5nF49Cmvbq95fb6f6KjxM1i007Sr3Urp1KWbZpx5Z9kpEn9hXzw1nUndd12\\/1h0EG8uFvbZ4BUYH2ECvXn4jr97VehNXYsdymmW0rWUdwlQKuO0A147sWlPuoQnKlrSkAdyTWhwrTTmeW9Uk04wf5OydLsG20SyaAyGUk\\/cTVsARyaYs2\\/Jtm2YACUgQPpT3cfWvTQxGxhSWRVCjPNFU\\/BFiVURGZpeCM8UhRJPGBxRvQJXG1JkyZxxRK7ACJpayY\\/WkhQTQxZEEQabOAadKjNNqJiDS8EkIPI+lJPNKJ7d6Sc0tDvcFEf3pSRmaCo70lZA9DZ3TkRSDu7AGnDzSFwDSI6PSKZGOJqWwscDn6VFQpRGTipjIgiAOK3THiPJ3BQ2gEnk04FKkzBikIKgr1RFOn1CI5Hao2yAtJMJURSgSBikiTifpR5Ge1Ow7iiBBVRbVbeYoT8zREmOM0wau7g2mDOaaJATAOYp1ScTnnPzpAQE5MKPfFLDBDDilAhPYCorogEk57VJXBUREdwKYWdo95qT0CZEeBK4T3qHciRgiOKlLnbnsKg3CgUQO3NDGskG4KUyOcRVVdwB\\/pVjckc+9VF8qATx9a4zdiaRT6g4kiAIJrNam6BuUSQBV1qToE5\\/asrrJu7lpVtYMl25d9CEjJk4FZ9aooptl2jBykrGA17XPzGs7W1Tb2w2q9irv8AWKz+sagtu5ccRkOpKkq5HEVuet\\/B\\/q3o\\/QFanr4tNNYSQ24X3v46nT\\/IEASD7+x5g4rmNretPAaa+ouQf4bhHw+4+kCvOyn7jcjeUVBKJI0i8dtLcvNq2mFJH3xUa5KnXiFGSFTTwtlt26WVYHmQf60w7P5two43k\\/vSWxyjg6B4Q9Caf1NryVaq6hLNuZKFGN0jGfka9l+G69V0fpywf0C6KmS0lXkOmUjGQD2rzh4Hac6blu4u9HL9i+CytSTCp2EmD7gCa9Y+F+ipR01ZszuSltIz9Kz+a3KyRocJKCZpLfxCt1MhjVdPetnwM+jcFfQistr+t3WrurZtGltNKEFZEGK2lxoKFonaJHGBVPc6QUycQPlVB93i5oKcPocc6\\/0JzUeltU0hhHrubR5kT\\/iUggV440\\/R9X0XVre11vTbmyeLra0ofbKNw3cpnkYOR\\/vXvzVbJtbjyVEJSlJJJqb1r4LaH4h9MWf5q3SkrbS4y6E+ppwo9C0q7ZAkcEc+9X\\/T5WbiZ3qVFVUqnk8toOIHelbTIp680fVtEcFrrFg\\/aujADqCndHMTyKar10bNXPMO93cM0CIMUAAcGiqSwAD70mlEjjOaTSEhK0lQxTce4p6k7BM5oTIpYGgPVPb2pChImDTyxIPypBg+9N5GmxiAJkiaTEU7BIyTzSSAOKg8DiEniiMdxRiSeMUZM0kiTGl5JIpCuwPanF\\/SkH6TSEkej2yDGDBqc3jM4iojaTyeeYqUgyIAxW6Y6H2yorASRB+VSEwrERFRUEpUDxTzapWZOKLC0hYVB2+9OD5n5U1vCSD7GeKcQe5GY4oEmKVtIwYpKDBycjExQxEcUXuDA+cUA7+AvMxCjj3olH045J7+1DaCNs8cUlAI4iAaVhoYdkLJkGozyiBJFSHACoqnmozxxjPvUiSyRXnDlUVCfM4IiflUtz04jvUK47kq+lALJWXZIkAxzVHfmD6jxVzdnnPNUOprSSAAar1HZXOkclDqWZVuSAMkkwEj3rrHhD4RaenSXOvetrBabVTRNi0p0ocBJOxwpAM7ox7Az8jzbo\\/TFdbddWHTrNup+zS55l3t4UhJGD8iYH0mvS\\/iTqltomkXLalOobZZSGXkKMHajAj2CeBnNeT9Q5Lq3UNI9Pw+F1gu+3\\/w8Yfil6gv+rer3\\/zb+630tsNMNBZKGx\\/mOVHOfnNcF0dC39TQpB9KSAT8ya3vitrDmp377gVAecKyJnHastolktthpaUy489I+if\\/AA1To3jCzLdeEPdSgsInXyYZ3nAKt0\\/b\\/sagWNm\\/qN0gWzJKlqz3781Iv3zeLZ05kFShhW0Sc8\\/XvXYeluhrPp\\/SrW4IauL67AfdG4JLLAIxJ4UZASBKiSMQqpTqKKCEVN50dz8EuiXrXpnRFKStLjqnr1eBBSlBQAQex3H9K7f4f6Je6Zo7DThCkBIPEGD7Vz3wR13qnqO\\/6idf6fTaaNo1k7ZouUKG238oEJSgEKCiVTOeQog4iu2dFqD2ks7hJ2D+lVqkeyTLFKqpXUSQthtTQKQYI4NVd3piXLZxYHAJrVO26CkpjBIGB703\\/ZqUEpJG1Qgg1x6ryWb2OGdT6ReptX3m2lSUKxE9q6l00\\/pv9wdCcU+kvL0q22s75XIbTjb7ymPtVs909YvIKXGgUnkECKXqXRqL\\/pjTjplybNrTVFY2GEqSncNpjJGSfqJ7VY4MHGUkjnz616aSWjn3UfRln1MhVqu2YuG03ak3G4gyiTgSCJkpTMYB7Vitf\\/Cvouqtqu+ktae01\\/k29ynzWZ9gcKT9930rsN9o90xrNqzZvItbV0+c+UoCvPG0pjI9PbODgZzWh061ColZJdAJ+a+FfuK0oVJ03hmPGlCeZRyeIuqvBDxJ6Q3v33Tzl1atz\\/xNkQ+iPchPqA+oFYRQgkV9HNUsn27fy7dILrqvLaBiN0E98dq5rq\\/gNp\\/Vt8q76w0+z2uNq828tFeW\\/wCYIDYTjkj4idyTHEnFiPOakoyjf7lerxkn8h4sk0RGK3Hi54cu+G\\/VTmksl5zTnk+bZvO5UpPCkqIAG4HsOxT71hzFaKkpK6Kbj1wxJpIVgE0lQkkUYjiaZELJkzg0g7Rx7UDyaPgwJyKQ0N5ye00RB5IijoK4iDNG0CwEInFERBpScdqSrmojyNnPNERFKPNEO9ErPQJWPRqSoKB+9S25UJJA+1RWzCsiR3qQhOcEmtsxiRIKf3pbYxPuKQgkxPzowoyYEjgQOKeWH5HkqAMHk0sKE4gGOIpgZ4FKQSDuPMRxS2LY7uzBTnmgNxPqgc4ppTioMnvH\\/n6UA4UjKqBilLIBCEwRSNwgyOaV5gIxme9NLV2j70LIljCGlETgwKYWpMkAZGadWsR9DUZxRJIEzjtUrXJ+MEdxSiNxjmagXCgSrE9qlOQZMwJzUJ9UAmc9qiCK279CSOTWR6o1A2FooJgOOkNoJ7T3itTfE5JnjFc86nbd1C783cUtMFSAkqyVQcge3H61k+q8n2KLtt4NX0vif1NdX0snY\\/ws6Pb29nq\\/WNyIUpJ8v0yQhGEgTycYHJjvNRfxC9Ws22kW2iuqW246PPdbUsEtg5yRwYSPuce52vgmLjR+gWkaewy2lppanX1TDahELOeEyI9yT9a8yeM\\/UqeotWu7ll4rYQoobkk7o5Uex9z8zXlY\\/Mkj1NXDcl4OM6447qupJCW5U+5In+Uf7AVIvXG7VtwWzRUbZsWrCQPjeWCP2TP707YtBtTmpuwFIHpJGEntAq16E0FzrLqiy0yyStaW3A2iEyS84qN2OYyf1qcmto4Qi1vbNx4ceDV85p+lXdrYjU9e1RS7pNqRKfJAhCTkQFKO6fYD3r1t4afhu09np1rp\\/Wlm51rUXzeajdpIhvgBIxBCSCQO6vkK2nhH4XWfS2lv6u4yDcOIRZMgJy2yjHlo+ZMye\\/Ndo6f0ZOmtJlKUuKA3kDHHH0qNOg6z7T0TqyhTwjL9U9I2XR3hde6L0q21ZW7LBKytBWpxMeoEzyRie37VQ9FsKTpjO2RKRXRutGrHUumtT0d94hxyzcWAgmUwCUkxwJHfByK510RdtO6Yw4ysLSUJKT2Ijmp8mCTSRxoS63NQ2FJ9Kk896G1LqQUERTkqWc8U6htSjEVV6X2W1UITqYbIV+1M6Drzp0290q3tVvqs1hJSI3ErUSogewCk5MDn2qzubRXl1ITpjGn6A2+hhKHn1F0qSBuO7iT7RVnhpxm2ceU06aRT6yhK7ayvRBCJbXjEYH9QKp9Ru9WtlN6P02q3RfrtzdtuXKVvpQd8qlAUk5SVlMrAlI7CFW2sMqd6M1DY8plbKFOJcSJKSFBU\\/tWH6M6t1K46duNZfSh3UAG7dF4Uep633EoUpKUwgwqSAD29jVqs1F3ZlV+QqMFFsutEfea6rTaamq51PVGm1vXN2loIYaGxJQwgSUJUUrCiAonIJPtpb3VluNuqat1bR\\/Ct5UBKzgKHMnn6AfOs107q971BrJU7a3DCWkuNIDsJKpKRv2g4MhYmBiOea0Fqy2V+Y4oG305GVThSwPUr\\/QVxpz7JMOM5VKafg4P+JLp+xT0AlVs0d2iXLCQtRlYK0hKwfruSSe8CvLBEmCa9YfiBvNOT4bXrtxchF5rV4h3b\\/jUlSSkGMAhCQPsK8nEAg\\/0rZ4r\\/ALZV5Fu9kEvanikd+e9BURAEUWB2qwclgLEERmiJiSKMgJIVM5olSRxQMJAkyaSo94zSpgUSkmY96AT+oUg8UlRPFLCDFIV7\\/akkOQ2ZBM0UnmBRrOaQSAKWgR6OgkAgwalNKSCI71Vv3jdm3vXmTgDk1Ad1O+ucNqLKfZPP61a5nqdDhYm7v6Iq8P0yvzfmirL6s1O8JEqUEiTk4FNOXlqkKCbloKgxKhE1k1NuuZcWpaj3JpP5YnkVky+JY6jD+TXj8Ov90\\/4Nb\\/algMG8aA\\/zUZ1bTgQBfMnGYVWPVbEc8UktFOAagviNr9qJ\\/pyH\\/pmyVqmnKyLxlR4+KiOp6eR\\/9tqBx6qxZSR3pog8kU18RN\\/tQpfD0VjszcjULFSNou2p7esUk39vkfmGz\\/1isMYHakLVGB+tT\\/UVsOH8kf08vE3\\/AKNs7dslJKXkRH+IVFXdJ2lYcBP+YVjt+MimysAe1TXxHHzD+SD+H2tT\\/g1zj3oKlH5k1BdfRGSBWcU6vncRTK3nSTBVI+dP9Q02sxE\\/QZ+JE7VrlxNustH1xCT7HialdV+H7rmkaULbf\\/A6ftrhsJEqW444+sz2gQPnECs5cvLQkuLUqE5281680PpfSHvDbS3eqS1YPnRbNxaLlaUFgpYQQhUnB3rMj\\/mPzrM53LXqLTgrJI0uDx16bG9R3ucn1dVv4ffh+f8A7QSkXV8hFswQqSrcmVgpPsVLAP0MDv491l93UQplkeY6pSlqjjeZMfQD967l+KLru91Ww0no7SkLKNKQUurSnDikgyqe8gJPtIrmHhp0je66wLcI\\/wCIeK0K3D4e5P02xVHsorBbg\\/fd\\/DOZ9R21xYIatVlSEIZLoz8RJgH9ya7n+Efwr1DqTVbrVrfW39KTZJU8XWmkLcMFICUlWEqM4VBieKynit0m6vWk2NuyUthltlIA4CcTH1r0z+EPTxp\\/SrTwASu7uPIdAElBSUkz8vSDQpJpIcadpNnrnp3S27TT7O33lwWjYSFKyVuRClE\\/qP196u2gd0fOmNPbShhITER\\/rUguIaKZGVKCMe5rVhHqsGZUblK5kvFwsaV0DrvUto023qNlZOPtPpG1QKElXqI+IQCNpkGub+Fd2zqfRth1JpToutNuElLbgTtUkJUU+pIPp+HjtxVr+KHXb6z6De6fsFhLus2twwgTtK1kttBJV2H8efsPao\\/gT0srw68MND6cedW+hSHLhxTyNqz5zinMp\\/lML4zHGear8nrFJyOUa7hUf0wa5u8QoAJIPfmrnTgXfVFVV5o6ErTd6UpKkmCWZ7e6ff6VYtajaaNboOolxtTm3agNlSlE4EAfMHmqqg09F6VSPVSuWLlsVw2kCV4E0vqTy7TT0NBcIZ2gqWftmsj0j4kaX4gai9p2i2uo2i7F\\/wAq\\/bvGvJfthCiCQlXpC4ASoHk+4NVXWHR9xod7ddWaXqmvao1b2lx5mk3OqPPIWvanYGw4og4CwSskyoQcRVmnF0oOVslSryYTtFGq00Naho9ywBuQ55jRnvkpP7g1yrorRdT0HqzVLFu6W9pt0DfFK2wAyt1xQLcjkAAgHtBrcdDJ1C\\/0tjU72\\/CmL5pu8bZtiptCFrG8hSgdyjuJn4UqMykxVSjUdOsdb1OwU80i8SyHEo3QpTKVrgj5An96Xb3oXlg58rj066UW\\/I3fdU3\\/AEZpd5qXUOnJduVvN2VijTSbl59TqzhKdiCFBIkjIA75ExPEvq89PaDptt05pz+pXLrf5p63bWEBVuUkNlRPCS5sB+QUeBWZc6b6l8QXLvqvUtX1Gxs7pR03Sba2dDSLSzXtVcXjsAFbqm24QFE7dyUwD8NU4nVm+sGm2EptWH7i4Sbdhg\\/wtPtrdoIt21HmUoQkxkEk5MQQgmrFTlcj+lo9ILBnPG3QdU0fw4sta6ncbvdR1B9LXkW2\\/wAiwQUqVuSlfqnclCSSBzXnFWFAgfFzXqD8Qutvah4b2t\\/f2aLdeouKFvGTtS43j7pTMycfLny6o4+L9q0+Fb2yvRalHskNrMH70mTSiRBHMGkk+rirh0FJJmkqBGDmlCJORQJJkEiKAEiIgikHNOekYOaQuAcCgFkWj4RTKsg\\/WnUmBFMuDuDie1Ky8j8DZA3x+1IJzQX8cgxTbioOSf0pMSSWjtrt8m\\/uN7c+UnCZ7\\/P7\\/wCw+ZmW7RXIBE9jHAoUK8ZVqSqTcpO7Z7KjCNOnaJYM2gcAITkYIparIAcH60KFc5RVrgpO5HctRBz+tRHGRNChVd4LMWNFueDTC2oFChQmyL2RVpgTTCz2FChU02RvYaWriPemjmhQpXYrCVdqvNE6J1TV0ou3lJs7V4gNuOfE5MxtSeRjnAoUKven0Y16vWeitzKkqULx2VnXvU3hz4ZO29pe2l9rGoONIuQEbQzBOASccpP8p4ish1D+KvUdfe\\/Ms9Oqde83z1Lvr5b0u4hRCQnIgd6FCvQe1CCtFWPO1Ks3LLuWWi9XXHi\\/dr1Trexs9BFuyUjVlj8vpq0bFJ8pxxwwlcKKgZJJEQOa3\\/4XOlV3t2\\/eM31lqmktM3DbF2y6HAXpS2QCO2FkEgYg8EUKFUK9KKaaL3GqyeGb\\/XPCm213VfOuLZAdQ66ylzafUk+oT9CkxWw8DvC57oi68hh1blmrznleaAFBYUEoVA4lJNChVaMF7sUXKk5JHf29yGwkHkfpTV028+G\\/IcCVtvNuGTgpChuH\\/wCZ+8UKFbUFdGPWm46OQ+Puqp1k6T0tpNoi71R66Uotn1eXapSDcEx2U2fJI5\\/4hJ7CbzTOs9D6l00NWjwYvWZactnFALQpIlSY9wBMRMCfeBQrD5dWUqjg9Ge6snWlDw0TdNv1O2jS21ejhMd6utdvnLPSBeW2kqvroKbab2M+YpG45VgEwOfaaFCrcH8i\\/BqPNNL7GYvLbVLDqXR7hpu2b1PUWLhQUhBQlSm0jahSE4XAeWvJEBtWQSTU+71q2DzjF1e299p60qUrcEhCgWo8ttQ9JEpdkKJIkZihQrjUbgm0zk0oxsin6b6l03p68b6OdS5Lt28ph2CQQv8AiDf\\/ADFSipZkApwogwmaxnXvTesan4gWVxpxZTaPkW+oKUPX5G5JhCplKvWoyP8ADQoV0hJulb6M6Tiukfyv+nVFJQ4w1ZJhtnd5jkkAf8oJ\\/f8ASsZqPSWhax1Zaatca6u2NpdqZSWmy0pnc0VYcIiN6DBHdZmewoUOXV2RHmWbjFpNHLvxrvtts9K6UwshCPzLiQFFUhIbGSefi7+9eXDuxA4oUK6T5VWk+sHgvUuJSqU02hBJHKaBX3KaFCu8ObVeyE+FSWhKVgk4ilFaSJmhQqxDkzm8lWfGhHQW4TIoE7jQoVcjNsqTppaFEQDTDqiSRMR2oUKltkFtIjurCTAGa33RXg\\/qfWmhp19Os2liw46tpAebWoqKYk+kcZ\\/ahQp2E\\/lWD\\/\\/Z\",\"link_type\":\"1\",\"link\":\"\\/pages\\/match\\/match\",\"is_show\":\"on\",\"_token\":\"7HXbwWNiuXnzR8R1xFYSfU74v7FATPCkxpeTOJuE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/banners\"}', '2020-10-15 02:04:43', '2020-10-15 02:04:43');
INSERT INTO `admin_operation_log` VALUES ('545', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-10-15 02:04:44', '2020-10-15 02:04:44');
INSERT INTO `admin_operation_log` VALUES ('546', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:05:13', '2020-10-15 02:05:13');
INSERT INTO `admin_operation_log` VALUES ('547', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:15:25', '2020-10-15 02:15:25');
INSERT INTO `admin_operation_log` VALUES ('548', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:15:29', '2020-10-15 02:15:29');
INSERT INTO `admin_operation_log` VALUES ('549', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:15:32', '2020-10-15 02:15:32');
INSERT INTO `admin_operation_log` VALUES ('550', '1', 'admin/banners/3', 'PUT', '127.0.0.1', '{\"image_src\":\"http:\\/\\/cdn.lzhnb.com\\/images\\/c2a0e047f5062eb9b32e9cfe83853498.jpeg\",\"link_type\":\"1\",\"link\":\"pages\\/match\\/match\",\"is_show\":\"on\",\"_token\":\"7HXbwWNiuXnzR8R1xFYSfU74v7FATPCkxpeTOJuE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/banners\"}', '2020-10-15 02:15:51', '2020-10-15 02:15:51');
INSERT INTO `admin_operation_log` VALUES ('551', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-10-15 02:15:52', '2020-10-15 02:15:52');
INSERT INTO `admin_operation_log` VALUES ('552', '1', 'admin/banners/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:16:06', '2020-10-15 02:16:06');
INSERT INTO `admin_operation_log` VALUES ('553', '1', 'admin/banners/3', 'PUT', '127.0.0.1', '{\"image_src\":\"http:\\/\\/cdn.lzhnb.com\\/images\\/c2a0e047f5062eb9b32e9cfe83853498.jpeg\",\"link_type\":\"1\",\"link\":\"\\/pages\\/match\\/match\",\"is_show\":\"on\",\"_token\":\"7HXbwWNiuXnzR8R1xFYSfU74v7FATPCkxpeTOJuE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/banners\"}', '2020-10-15 02:20:16', '2020-10-15 02:20:16');
INSERT INTO `admin_operation_log` VALUES ('554', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-10-15 02:20:16', '2020-10-15 02:20:16');
INSERT INTO `admin_operation_log` VALUES ('555', '1', 'admin/banners/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:20:47', '2020-10-15 02:20:47');
INSERT INTO `admin_operation_log` VALUES ('556', '1', 'admin/banners/4', 'PUT', '127.0.0.1', '{\"image_src\":\"http:\\/\\/cdn.lzhnb.com\\/images\\/285141fd66f031a851fbc6bc5f6cda2a.jpeg\",\"link_type\":\"2\",\"article_id\":\"1\",\"is_show\":\"on\",\"_token\":\"7HXbwWNiuXnzR8R1xFYSfU74v7FATPCkxpeTOJuE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/vmiao.me\\/admin\\/banners\"}', '2020-10-15 02:20:50', '2020-10-15 02:20:50');
INSERT INTO `admin_operation_log` VALUES ('557', '1', 'admin/banners', 'GET', '127.0.0.1', '[]', '2020-10-15 02:20:51', '2020-10-15 02:20:51');
INSERT INTO `admin_operation_log` VALUES ('558', '1', 'admin/banners/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:20:52', '2020-10-15 02:20:52');
INSERT INTO `admin_operation_log` VALUES ('559', '1', 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-15 02:20:54', '2020-10-15 02:20:54');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', 'Tab-dashboard', 'tabs.dashboard', null, '/dashboard', '2019-04-18 14:25:30', '2019-04-18 14:25:30');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2019-04-18 03:17:16', '2019-04-18 03:17:16');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$MCMh0Nf/ss2Gj79G/KtaYOPNeuz8ZCF5vPb2.ZjxhAJ6Sj3FfDq1O', 'Administrator', 'images/IMG_7105.JPG', 'wGpj4pYBczo7JejBZiTdvYn6CyTvqhalm0ang2FtKagLj6334xJnfB7GFm3W', '2019-04-18 03:17:16', '2019-04-18 14:16:08', '1');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', '预售活动大酬宾', '火爆预定中……', '<p>这是图文内容</p><p><img src=\"http://cdn.lzhnb.com/uploads/image/2019/07/08/65374e6a3ff4e10af88871dbb001a2a8.jpeg\" title=\"/uploads/image/2019/07/08/65374e6a3ff4e10af88871dbb001a2a8.jpeg\" alt=\"timg (2).jpeg\"/></p>', '2019-07-08 15:33:27', '2019-07-08 15:33:43');

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_src` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `link_type` tinyint(4) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES ('3', 'http://cdn.lzhnb.com/images/c2a0e047f5062eb9b32e9cfe83853498.jpeg', '/pages/match/match', '1', '2020-09-27 00:04:53', '2020-10-15 02:20:16', '1', null);
INSERT INTO `banners` VALUES ('4', 'http://cdn.lzhnb.com/images/285141fd66f031a851fbc6bc5f6cda2a.jpeg', '1', '1', '2020-09-27 01:48:45', '2020-10-15 02:20:50', '2', '1');

-- ----------------------------
-- Table structure for cashes
-- ----------------------------
DROP TABLE IF EXISTS `cashes`;
CREATE TABLE `cashes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cashes
-- ----------------------------
INSERT INTO `cashes` VALUES ('1', '142623430000000005', '旭', 'ali@as.com', '2019-07-05 14:26:23', '2019-07-05 14:26:23');
INSERT INTO `cashes` VALUES ('2', '144539230000000005', '哈', 'jief', '2019-07-05 14:45:39', '2019-07-05 14:45:39');
INSERT INTO `cashes` VALUES ('3', '131703950000000006', '测试', 'whuanxu@163.com', '2019-07-12 13:17:03', '2019-07-12 13:17:03');

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wechat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('1', '0', '888888', 'V喵官方', 'vmiao', '2020-10-13 15:17:42', '2020-10-13 15:17:44');

-- ----------------------------
-- Table structure for good_sources
-- ----------------------------
DROP TABLE IF EXISTS `good_sources`;
CREATE TABLE `good_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of good_sources
-- ----------------------------
INSERT INTO `good_sources` VALUES ('1', '淘宝', '2020-10-12 00:32:42', '2020-10-12 00:32:42');
INSERT INTO `good_sources` VALUES ('2', '天猫', '2020-10-12 00:32:48', '2020-10-12 00:32:48');
INSERT INTO `good_sources` VALUES ('3', '京东', '2020-10-12 00:32:58', '2020-10-12 00:32:58');
INSERT INTO `good_sources` VALUES ('4', '苏宁', '2020-10-12 00:33:14', '2020-10-12 00:33:14');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '1');
INSERT INTO `migrations` VALUES ('4', '2019_01_02_050524_table_enabled_into_admin_user', '2');
INSERT INTO `migrations` VALUES ('5', '2019_04_28_190636_create_sms_codes_table', '3');
INSERT INTO `migrations` VALUES ('6', '2019_04_28_202025_change_columns_for_users_table', '4');
INSERT INTO `migrations` VALUES ('7', '2019_07_02_121904_create_orders_table', '5');
INSERT INTO `migrations` VALUES ('8', '2019_07_02_135221_add_type_for_orders_table', '6');
INSERT INTO `migrations` VALUES ('9', '2019_07_02_165125_create_virtuals_table', '7');
INSERT INTO `migrations` VALUES ('10', '2019_07_02_171703_add_thumb_for_virtuals_table', '8');
INSERT INTO `migrations` VALUES ('11', '2019_07_02_172955_add_name_for_virtuals_table', '9');
INSERT INTO `migrations` VALUES ('12', '2019_07_03_100449_create_abouts_table', '10');
INSERT INTO `migrations` VALUES ('13', '2019_07_03_163020_add_ship_for_orders_table', '11');
INSERT INTO `migrations` VALUES ('14', '2019_07_05_141022_create_cashes_table', '12');
INSERT INTO `migrations` VALUES ('15', '2019_07_05_171506_create_addresses_table', '13');
INSERT INTO `migrations` VALUES ('16', '2019_07_05_171842_add_user_id_for_address_tables', '14');
INSERT INTO `migrations` VALUES ('17', '2019_07_08_144154_create_banners_table', '15');
INSERT INTO `migrations` VALUES ('18', '2019_07_08_151332_create_articles_table', '16');
INSERT INTO `migrations` VALUES ('19', '2020_10_11_230714_create_tasks_table', '17');
INSERT INTO `migrations` VALUES ('20', '2020_10_12_002331_create_good_sources_table', '18');
INSERT INTO `migrations` VALUES ('21', '2020_10_12_004754_add_task_type_for_tasks_table', '19');
INSERT INTO `migrations` VALUES ('22', '2020_10_12_033058_add_require_type_for_tasks_table', '20');
INSERT INTO `migrations` VALUES ('23', '2020_10_12_033320_create_require_types_table', '21');
INSERT INTO `migrations` VALUES ('24', '2020_10_12_034236_add_require_type_for_tasks_table', '22');
INSERT INTO `migrations` VALUES ('25', '2020_10_12_122836_add_wx_info_for_users_table', '23');
INSERT INTO `migrations` VALUES ('26', '2020_10_12_151017_add_profile_info_for_users_table', '24');
INSERT INTO `migrations` VALUES ('27', '2020_10_12_154926_add_social_info_for_users_table', '25');
INSERT INTO `migrations` VALUES ('28', '2020_10_12_162516_add_reward_info_for_users_table', '26');
INSERT INTO `migrations` VALUES ('29', '2020_10_13_001130_create_opuses_table', '27');
INSERT INTO `migrations` VALUES ('30', '2020_10_13_014123_add_thumb_for_opuses_table', '28');
INSERT INTO `migrations` VALUES ('31', '2020_10_13_103446_add_limit_number_for_tasks_table', '29');
INSERT INTO `migrations` VALUES ('32', '2020_10_13_104507_create_task_users_table', '30');
INSERT INTO `migrations` VALUES ('33', '2020_10_13_151103_create_contacts_table', '31');
INSERT INTO `migrations` VALUES ('34', '2020_10_13_213455_add_order_info_for_task_users_table', '32');
INSERT INTO `migrations` VALUES ('35', '2020_10_14_121812_add_release_info_for_task_users_table', '33');
INSERT INTO `migrations` VALUES ('36', '2020_10_14_170322_add_clear_info_for_task_users_table', '34');
INSERT INTO `migrations` VALUES ('37', '2020_10_15_004139_create_reward_records_table', '35');
INSERT INTO `migrations` VALUES ('38', '2020_10_15_014152_add_link_type_for_banners_table', '36');
INSERT INTO `migrations` VALUES ('39', '2020_10_15_014424_add_article_id_for_banners_table', '37');

-- ----------------------------
-- Table structure for opuses
-- ----------------------------
DROP TABLE IF EXISTS `opuses`;
CREATE TABLE `opuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `uri` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of opuses
-- ----------------------------
INSERT INTO `opuses` VALUES ('3', '7', 'http://cdn.lzhnb.com/opus5f8496b18da91', 'image', '2020-10-13 01:47:31', '2020-10-13 01:47:31', '');
INSERT INTO `opuses` VALUES ('5', '7', 'http://cdn.lzhnb.com/opus5f8497507274e', 'video', '2020-10-13 01:50:12', '2020-10-13 01:50:12', 'http://cdn.lzhnb.com/opus5f8497507274e-poster');
INSERT INTO `opuses` VALUES ('7', '7', 'http://cdn.lzhnb.com/opus5f8497c1bdfdc', 'image', '2020-10-13 01:52:02', '2020-10-13 01:52:02', '');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `damai_order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` double(8,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '订单类型,1为实物,2位虚拟商品',
  `ship_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('7', '5', '165103640000000005', 'V201907031651035510154', '2.00', '1', '2019-07-03 16:51:04', '2019-07-03 16:51:04', '2', null, null);
INSERT INTO `orders` VALUES ('8', '5', '165232410000000005', 'V201907031652324854489', '2.00', '1', '2019-07-03 16:52:32', '2019-07-03 16:52:32', '2', null, null);
INSERT INTO `orders` VALUES ('10', '5', '142623430000000005', '142623430000000005', '1.00', '2', '2019-07-05 14:26:23', '2020-10-14 16:56:50', '3', null, null);
INSERT INTO `orders` VALUES ('11', '5', '143417470000000005', 'R201907081434189749994', '6.00', '1', '2019-07-08 14:34:18', '2019-07-08 14:34:18', '1', null, null);
INSERT INTO `orders` VALUES ('12', '6', '131703950000000006', '131703950000000006', '100.00', '2', '2019-07-12 13:17:03', '2019-07-12 13:17:29', '3', null, null);

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
-- Table structure for require_types
-- ----------------------------
DROP TABLE IF EXISTS `require_types`;
CREATE TABLE `require_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of require_types
-- ----------------------------
INSERT INTO `require_types` VALUES ('1', '小红书文章', '2020-10-12 03:36:19', '2020-10-12 03:36:19');
INSERT INTO `require_types` VALUES ('2', '抖音短视频', '2020-10-12 03:36:27', '2020-10-12 03:36:27');
INSERT INTO `require_types` VALUES ('3', '直播', '2020-10-12 03:36:34', '2020-10-12 03:36:34');

-- ----------------------------
-- Table structure for reward_records
-- ----------------------------
DROP TABLE IF EXISTS `reward_records`;
CREATE TABLE `reward_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of reward_records
-- ----------------------------
INSERT INTO `reward_records` VALUES ('1', '1', '60', '2020-10-15 01:08:58', '2020-10-15 01:08:58');

-- ----------------------------
-- Table structure for sms_codes
-- ----------------------------
DROP TABLE IF EXISTS `sms_codes`;
CREATE TABLE `sms_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sms_codes
-- ----------------------------
INSERT INTO `sms_codes` VALUES ('1', '18825155594', '1743', '2019-04-29 10:25:59', '2019-07-12 12:16:14');
INSERT INTO `sms_codes` VALUES ('2', '1234698745', '1234', '2019-07-01 20:23:29', '2019-07-01 20:23:31');
INSERT INTO `sms_codes` VALUES ('3', '13692192441', '1234', '2019-07-12 13:14:20', '2019-07-12 13:14:22');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `good_img` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `good_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `good_source` int(11) NOT NULL,
  `buy_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `good_price` decimal(8,2) NOT NULL,
  `coupon` int(11) NOT NULL,
  `reward` int(8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `task_type` int(11) NOT NULL COMMENT '任务类型：1为体验2为会员3为比赛',
  `require_type_id` int(11) NOT NULL,
  `task_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('1', '0', 'images/微信图片_20201012001044.png', 'HELIUS/赫丽尔斯氨基酸洁颜蜜女洗面奶', '1', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711', '209.00', '100', '60', '2020-10-12 00:11:42', '2020-10-13 10:39:07', '1', '2', '<p><img src=\"http://cdn.lzhnb.com/uploads/image/2020/10/12/560c0ecd59ea1a79181ef60a9e1754f3.jpg\" title=\"/uploads/image/2020/10/12/560c0ecd59ea1a79181ef60a9e1754f3.jpg\" alt=\"qrcode_demo.jpg\"/></p><p>叫我微信了解详情</p>', '4');
INSERT INTO `tasks` VALUES ('2', '0', 'images/6608696432a4f7f75946b8940a591d52.png', 'AHC水乳套装护肤品', '2', 'https://detail.tmall.hk/hk/item.htm?tbpm=1&spm=a230r.1.14.30.74ef4a8b9Ue3cW&id=569083676891&ns=1&abbucket=9', '148.00', '100', '50', '2020-10-12 00:21:09', '2020-10-13 11:26:23', '2', '2', '<p>拍个短视频就好啦</p>', '10');
INSERT INTO `tasks` VALUES ('3', '0', 'images/1629b0d0ff9c93202410613fa8bc19a1.png', 'TFIT水乳套装正品补水保湿', '3', 'https://detail.tmall.hk/hk/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9', '168.00', '30', '40', '2020-10-12 00:54:58', '2020-10-13 11:28:31', '3', '1', '<p>123</p>', '6');
INSERT INTO `tasks` VALUES ('4', '0', 'images/微信图片_20201012001044.png', '二', '1', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711', '209.00', '100', '60', null, null, '1', '0', '', '0');
INSERT INTO `tasks` VALUES ('5', '0', 'images/微信图片_20201012001044.png', '三', '1', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.14.74ef4a8b9Ue3cW&id=564588721964&cm_id=140105335569ed55e27b&abbucket=9&skuId=3568316652711', '209.00', '100', '60', null, null, '1', '0', '', '0');
INSERT INTO `tasks` VALUES ('6', '0', 'images/1629b0d0ff9c93202410613fa8bc19a1.png', '比二', '3', 'https://detail.tmall.hk/hk/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9', '168.00', '30', '40', null, '2020-10-12 01:06:39', '3', '0', '', '0');
INSERT INTO `tasks` VALUES ('7', '0', 'images/1629b0d0ff9c93202410613fa8bc19a1.png', '比三', '3', 'https://detail.tmall.hk/hk/item.htm?spm=a230r.1.14.115.74ef4a8b9Ue3cW&id=627254475223&ns=1&abbucket=9', '168.00', '30', '40', null, '2020-10-12 01:06:49', '3', '0', '', '0');

-- ----------------------------
-- Table structure for task_users
-- ----------------------------
DROP TABLE IF EXISTS `task_users`;
CREATE TABLE `task_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shot` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_shot` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_data_shot` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clear_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '结算类型：默认0商家确认1后台确认',
  `is_clear` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of task_users
-- ----------------------------
INSERT INTO `task_users` VALUES ('1', '7', '1', '4', '2020-10-13 16:30:34', '2020-10-15 01:08:58', 'http://cdn.lzhnb.com/order5f85b8f8c9c43', '654654654', 'https://v.douyin.com/JfDR1cq/', 'http://cdn.lzhnb.com/live5f86c29882e0e', 'http://cdn.lzhnb.com/live_data_5f86c29d96219', '1', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `is_player` tinyint(4) NOT NULL DEFAULT '0',
  `intro` text COLLATE utf8mb4_unicode_ci,
  `red_book_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `douyin_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `red_book_fans` int(11) DEFAULT '0',
  `douyin_fans` int(11) NOT NULL DEFAULT '0',
  `wechat_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reward` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_mobile_unique` (`mobile`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('4', '188****5594', null, null, null, '2019-07-01 19:46:46', '2019-07-01 19:46:46', '18825155594', '', '', '', '0', '0', '0', null, null, '', '0', '0', '', '0.00');
INSERT INTO `users` VALUES ('5', '123****745', null, null, null, '2019-07-01 20:34:16', '2019-07-01 20:34:16', '1234698745', '', '', '', '0', '0', '0', null, null, '', '0', '0', '', '0.00');
INSERT INTO `users` VALUES ('6', '136****2441', null, null, null, '2019-07-12 13:14:39', '2019-07-12 13:14:39', '13692192441', '', '', '', '0', '0', '0', null, null, '', '0', '0', '', '0.00');
INSERT INTO `users` VALUES ('7', null, null, null, null, '2020-10-12 12:41:31', '2020-10-15 01:08:58', '123123', 'oIm-n5HrFnFbP7cwQ3GU3LMymNj4', '旭91', 'http://cdn.lzhnb.com/avatar5f84896e060e0', '1', '0', '0', '这个人很懒，还没有自我介绍', 'https://www.xiaohongshu.com/user/profile/5cb329d9000000001602bb9c?xhsshare=CopyLink&appuid=5cb329d9000000001602bb9c&apptime=1602516166', 'https://v.douyin.com/Jf8k5MS/', '12341234', '232323', 'xuge1991', '60.00');

-- ----------------------------
-- Table structure for virtuals
-- ----------------------------
DROP TABLE IF EXISTS `virtuals`;
CREATE TABLE `virtuals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of virtuals
-- ----------------------------
INSERT INTO `virtuals` VALUES ('1', '50', '1', '2019-07-02 17:18:47', '2019-07-02 17:31:21', 'images/timg.jpeg', '50元京东E卡');
INSERT INTO `virtuals` VALUES ('2', '18', '7_2', '2019-07-02 17:27:45', '2019-07-02 17:31:31', 'images/615780383d2409ca326b86ecc47a5181.jpeg', '爱奇艺月卡');

-- ----------------------------
-- Table structure for wx_users
-- ----------------------------
DROP TABLE IF EXISTS `wx_users`;
CREATE TABLE `wx_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wx_users
-- ----------------------------
