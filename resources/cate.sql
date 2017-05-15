# Host: 127.0.0.1  (Version 5.6.11)
# Date: 2017-04-22 14:04:35
# Generator: MySQL-Front 6.0  (Build 1.82)


#
# Structure for table "banner"
#

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_NUMBER` int(2) DEFAULT NULL COMMENT '排序序号',
  `IMG_URL` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `LINK_URL` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `IS_ONSHELVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架',
  `ONSHELVE_TIME` datetime NOT NULL DEFAULT '2017-04-04 18:15:34' COMMENT '上架时间',
  `OFFSHELVE_TIME` datetime DEFAULT '2017-04-04 18:15:34' COMMENT '下架时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

#
# Data for table "banner"
#


#
# Structure for table "food"
#

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CLASSIFY` varchar(10) NOT NULL DEFAULT 'meishi',
  `SCORE` float(2,1) NOT NULL DEFAULT '5.0',
  `UPDATE_TIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LONGITUDE` float(10,7) DEFAULT '0.0000000',
  `LATITUDE` float(10,7) DEFAULT '0.0000000',
  `ADDRESS` varchar(30) DEFAULT NULL,
  `DETAIL_ADDRESS` varchar(30) DEFAULT NULL,
  `VIEW` int(6) DEFAULT '0',
  `IMG_URL` varchar(255) NOT NULL DEFAULT '',
  `NAME` varchar(30) NOT NULL DEFAULT '',
  `PRICE` float(6,1) DEFAULT '0.0',
  `REACH_PRICE` float(7,1) DEFAULT '0.0',
  `FAVORABLE_PRICE` float(4,1) DEFAULT '0.0',
  `OTHER_FAVORABLE` varchar(30) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

#
# Data for table "food"
#


#
# Structure for table "hibernate_sequence"
#

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "hibernate_sequence"
#

INSERT INTO `hibernate_sequence` VALUES (55);
