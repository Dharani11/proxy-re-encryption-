/*
SQLyog Community v11.52 (32 bit)
MySQL - 5.5.30 : Database - proxyenc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proxyenc` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `proxyenc`;

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `fid` int(200) DEFAULT NULL,
  `fname` varchar(1000) DEFAULT NULL,
  `filedata` blob,
  `owner` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `proxyreencrypt` */

DROP TABLE IF EXISTS `proxyreencrypt`;

CREATE TABLE `proxyreencrypt` (
  `sno` int(200) NOT NULL AUTO_INCREMENT,
  `fid` varchar(200) DEFAULT NULL,
  `sender_id` varchar(1000) DEFAULT NULL,
  `receiver_id` varchar(1000) DEFAULT NULL,
  `reencrypt` blob,
  `fname` varchar(500) DEFAULT NULL,
  `aces` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `sno` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `no` int(100) DEFAULT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `unm` varchar(1000) DEFAULT NULL,
  `pwd` varchar(1000) DEFAULT NULL,
  `gen` varchar(1000) DEFAULT NULL,
  `eid` varchar(1000) DEFAULT NULL,
  `cno` varchar(1000) DEFAULT NULL,
  `dept` varchar(500) DEFAULT NULL,
  `subdept` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `temp` */

DROP TABLE IF EXISTS `temp`;

CREATE TABLE `temp` (
  `d` varchar(500) DEFAULT NULL,
  `sd` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
