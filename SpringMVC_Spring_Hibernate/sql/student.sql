/*
Navicat MySQL Data Transfer

Source Server         : new
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : pagination

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2017-04-23 13:07:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `chinese` int(11) DEFAULT NULL,
  `math` int(11) DEFAULT NULL,
  `english` int(11) DEFAULT NULL,
  `physics` int(11) DEFAULT NULL,
  `chemistry` int(11) DEFAULT NULL,
  `sxpd` int(11) DEFAULT NULL,
  `history` int(11) DEFAULT NULL,
  `geography` int(11) DEFAULT NULL,
  `biology` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf-8;
