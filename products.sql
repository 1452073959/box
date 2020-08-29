/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50724
Source Host           : 127.0.0.1:3306
Source Database       : collect

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-08-29 10:24:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品图片',
  `sold_count` tinyint(10) DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `promotionprice` decimal(10,2) DEFAULT NULL,
  `stock` tinyint(10) DEFAULT NULL COMMENT '库存',
  `recommended` tinyint(10) DEFAULT '1' COMMENT '推荐位1否2是',
  `status` tinyint(5) DEFAULT NULL COMMENT '状态1上架2下架',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `smallimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smalldescription` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
