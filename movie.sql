/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : movie

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-07-27 16:57:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(255) DEFAULT NULL,
  `adminpassword` varchar(255) DEFAULT NULL,
  `adminlevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`adminid`),
  KEY `AK_Key_2` (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrator
-- ----------------------------

-- ----------------------------
-- Table structure for longreview
-- ----------------------------
DROP TABLE IF EXISTS `longreview`;
CREATE TABLE `longreview` (
  `lrid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `movieid` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `likecount` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`lrid`),
  KEY `FK_Relationship_1` (`userid`),
  KEY `FK_Relationship_4` (`movieid`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`userid`) REFERENCES `reviewer` (`userid`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of longreview
-- ----------------------------

-- ----------------------------
-- Table structure for lrlikes
-- ----------------------------
DROP TABLE IF EXISTS `lrlikes`;
CREATE TABLE `lrlikes` (
  `userid` int(11) NOT NULL,
  `lrid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`lrid`),
  KEY `FK_LRLikes2` (`lrid`),
  CONSTRAINT `FK_LRLikes` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_LRLikes2` FOREIGN KEY (`lrid`) REFERENCES `longreview` (`lrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lrlikes
-- ----------------------------

-- ----------------------------
-- Table structure for management
-- ----------------------------
DROP TABLE IF EXISTS `management`;
CREATE TABLE `management` (
  `manageid` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) DEFAULT NULL,
  `manage` text,
  PRIMARY KEY (`manageid`),
  KEY `FK_Relationship_8` (`adminid`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`adminid`) REFERENCES `administrator` (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of management
-- ----------------------------

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `moviename` varchar(255) DEFAULT NULL,
  `movietype` varchar(255) DEFAULT NULL,
  `movieregion` varchar(255) DEFAULT NULL,
  `movieprice` decimal(10,2) DEFAULT NULL,
  `ranking` decimal(1,1) DEFAULT NULL,
  `rankcount` int(11) unsigned zerofill DEFAULT NULL,
  `updatedate` date DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `AK_Key_2` (`moviename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', 'test', 'test', 'test', '10.20', null, null, '2018-07-27');

-- ----------------------------
-- Table structure for movieandtags
-- ----------------------------
DROP TABLE IF EXISTS `movieandtags`;
CREATE TABLE `movieandtags` (
  `tagid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  PRIMARY KEY (`tagid`,`movieid`),
  KEY `FK_MovieAndTags2` (`movieid`),
  CONSTRAINT `FK_MovieAndTags` FOREIGN KEY (`tagid`) REFERENCES `tags` (`tagid`),
  CONSTRAINT `FK_MovieAndTags2` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movieandtags
-- ----------------------------

-- ----------------------------
-- Table structure for reviewer
-- ----------------------------
DROP TABLE IF EXISTS `reviewer`;
CREATE TABLE `reviewer` (
  `userid` int(11) NOT NULL,
  `level` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `FK_Inheritance_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewer
-- ----------------------------

-- ----------------------------
-- Table structure for simplereview
-- ----------------------------
DROP TABLE IF EXISTS `simplereview`;
CREATE TABLE `simplereview` (
  `srid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `movieid` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `likecount` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`srid`),
  KEY `FK_Relationship_2` (`userid`),
  KEY `FK_Relationship_3` (`movieid`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of simplereview
-- ----------------------------

-- ----------------------------
-- Table structure for srlikes
-- ----------------------------
DROP TABLE IF EXISTS `srlikes`;
CREATE TABLE `srlikes` (
  `userid` int(11) NOT NULL,
  `srid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`srid`),
  KEY `FK_SRLikes2` (`srid`),
  CONSTRAINT `FK_SRLikes` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_SRLikes2` FOREIGN KEY (`srid`) REFERENCES `simplereview` (`srid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of srlikes
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', 'test');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`userid`),
  KEY `AK_Key_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test', 'test', '2', 'male', 'unknown', 'none', 'none');
INSERT INTO `user` VALUES ('2', 'test2', 'test', '99', 'male', 'unknown', 'unknown', 'null');
