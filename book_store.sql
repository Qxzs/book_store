/*
Navicat MySQL Data Transfer

Source Server         : gg
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : book_store

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-06-24 16:34:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(20) NOT NULL,
  `bookFace` varchar(30) NOT NULL,
  `bookAuthor` varchar(10) NOT NULL,
  `bookPress` varchar(20) NOT NULL,
  `bookPrice` int(10) NOT NULL,
  `bookCreate` varchar(10) NOT NULL,
  `bookImg` text,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('12', '跟任何人都聊得来', '一本好书', '老网', '清华1', '12', '2018-01-01', '/img/b1.JPG');
INSERT INTO `books` VALUES ('13', '狼道，鬼谷子', '一本好书', '老王', '清华同方', '45', '2016-08-20', '/img/b2.JPG');
INSERT INTO `books` VALUES ('14', '微信小程序', '一本好书', '老李', '人民出版社', '39', '2017-12-25', '/img/b3.JPG');
INSERT INTO `books` VALUES ('15', '微信小程序零基础', '一本好书', '刘哔', '电子工业出版社', '30', '2017-09-15', '/img/b4.JPG');
INSERT INTO `books` VALUES ('16', '微信小程序入门', '一本好书', '老胡', '武汉', '23', '2018-08-10', '/img/b5.JPG');
INSERT INTO `books` VALUES ('17', '剑指office', '一本好书', '老嘎', '清华同方', '18', '2016-11-12', '/img/b6.JPG');
INSERT INTO `books` VALUES ('18', 'javaEE', '一本好书', '老黑', '黑马', '36', '2015-06-12', '/img/b7.JPG');
INSERT INTO `books` VALUES ('19', 'javaweb', '一本好书', '小刘', '黑马', '45', '2016-08-15', '/img/b8.JPG');
INSERT INTO `books` VALUES ('20', 'java虚拟机', '一本好书', '老黄', '清华', '11', '2016-04-11', '/img/b9.JPG');
INSERT INTO `books` VALUES ('21', 'php入门', '一本好书', '胡离', '人民', '55', '2017-08-09', '/img/b10.JPG');
INSERT INTO `books` VALUES ('22', 'PHP7内部分析', '一本好书', '刘工', '电子工业', '45', '2016-11-19', '/img/b11.JPG');
INSERT INTO `books` VALUES ('23', '经典散文', '一本好书', '黄涛', '黑马', '78', '2016-10-28', '/img/b12.JPG');
INSERT INTO `books` VALUES ('24', '一只特立独行的猪1', '一本好书1', '立可1', '黑马', '11', '2015-05-04', '/img/b13.JPG');

-- ----------------------------
-- Table structure for `shopcar`
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookid` (`bookid`),
  KEY `userid` (`userid`),
  CONSTRAINT `bookid` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookId`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES ('1', '12', '1');
INSERT INTO `shopcar` VALUES ('2', '13', '1');
INSERT INTO `shopcar` VALUES ('3', '14', '1');
INSERT INTO `shopcar` VALUES ('4', '13', '1');
INSERT INTO `shopcar` VALUES ('5', '17', '1');
INSERT INTO `shopcar` VALUES ('6', '15', '1');
INSERT INTO `shopcar` VALUES ('7', '19', '1');
INSERT INTO `shopcar` VALUES ('8', '22', '1');
INSERT INTO `shopcar` VALUES ('9', '14', '1');
INSERT INTO `shopcar` VALUES ('10', '18', '27');
INSERT INTO `shopcar` VALUES ('11', '16', '1');
INSERT INTO `shopcar` VALUES ('12', '16', '1');
INSERT INTO `shopcar` VALUES ('13', '19', '28');
INSERT INTO `shopcar` VALUES ('14', '21', '1');
INSERT INTO `shopcar` VALUES ('15', '14', '29');
INSERT INTO `shopcar` VALUES ('16', '22', '29');
INSERT INTO `shopcar` VALUES ('17', '15', '1');
INSERT INTO `shopcar` VALUES ('18', '14', '34');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `userPwd` varchar(10) NOT NULL,
  `userTel` varchar(11) NOT NULL,
  `userAddress` varchar(20) NOT NULL,
  `userStatue` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'wang', '123456', '13566688', '广州', '1');
INSERT INTO `users` VALUES ('2', 'li', '123456', '15455', '珠海', '0');
INSERT INTO `users` VALUES ('3', 'lis', '123456', '138888123', '惠州', '1');
INSERT INTO `users` VALUES ('5', 'lin', '123456', '1475222', '上海', '1');
INSERT INTO `users` VALUES ('6', 'lis1', '123456', '138888123', '惠州', '1');
INSERT INTO `users` VALUES ('7', 'zwt', '123456', '1555555111', '汕尾', '1');
INSERT INTO `users` VALUES ('8', 'lbq', '123456', '111112315', '上海', '1');
INSERT INTO `users` VALUES ('9', 'huli', '123456', '123456', '广州', '1');
INSERT INTO `users` VALUES ('11', 'gy', '123456', '1475222', '汕尾', '1');
INSERT INTO `users` VALUES ('13', 'qwe', '123456', '12345', '广州', '1');
INSERT INTO `users` VALUES ('14', 'hui', '123456', '1555555111', '上海', '1');
INSERT INTO `users` VALUES ('24', 'aaa1', '123456', '1555555111', '广州', '1');
INSERT INTO `users` VALUES ('25', 'kkk', '123456', '12345678', '上海', '1');
INSERT INTO `users` VALUES ('26', 'lyp', '123456', '1475222', '广州', '1');
INSERT INTO `users` VALUES ('27', 'dfgs', '123456', '156465', '上海', '1');
INSERT INTO `users` VALUES ('28', 'hy', '123456', '1475123123', '上海', '1');
INSERT INTO `users` VALUES ('29', 'hyy', '123456', '132654489', '上海', '1');
INSERT INTO `users` VALUES ('30', 'tyr', '123456', '1475222', '上海', '1');
INSERT INTO `users` VALUES ('31', 'htt', '123456', '1475222', '上海', '1');
INSERT INTO `users` VALUES ('32', 'htts', '123456', '12345', '上海', '1');
INSERT INTO `users` VALUES ('33', 'hy', '123456', '123456', '上海', '1');
INSERT INTO `users` VALUES ('34', 'bbb', '123456', '1475222', '广州', '1');
