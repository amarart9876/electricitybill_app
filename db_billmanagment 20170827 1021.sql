-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.17


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema java_project
--

CREATE DATABASE IF NOT EXISTS java_project;
USE java_project;

--
-- Definition of table `bill_charges`
--

DROP TABLE IF EXISTS `bill_charges`;
CREATE TABLE `bill_charges` (
  `charge_id` int(11) DEFAULT NULL,
  `bill_no` int(11) DEFAULT NULL,
  `charge_value` int(11) DEFAULT NULL,
  KEY `charge_id` (`charge_id`),
  KEY `bill_no` (`bill_no`),
  CONSTRAINT `bill_charges_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `charges_details` (`charge_id`),
  CONSTRAINT `bill_charges_ibfk_2` FOREIGN KEY (`bill_no`) REFERENCES `bill_details` (`bill_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_charges`
--

/*!40000 ALTER TABLE `bill_charges` DISABLE KEYS */;
INSERT INTO `bill_charges` (`charge_id`,`bill_no`,`charge_value`) VALUES 
 (3321,1270,450),
 (8272,7844,784),
 (8732,7844,9),
 (8272,1270,787),
 (145,122,7888);
/*!40000 ALTER TABLE `bill_charges` ENABLE KEYS */;


--
-- Definition of table `bill_details`
--

DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE `bill_details` (
  `acc_no` mediumint(9) DEFAULT NULL,
  `bill_no` int(11) NOT NULL,
  `old_reading` mediumint(9) DEFAULT NULL,
  `new_reading` mediumint(9) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `amout` mediumint(9) DEFAULT NULL,
  `amount_after_due_date` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`bill_no`),
  KEY `acc_no` (`acc_no`),
  CONSTRAINT `bill_details_ibfk_1` FOREIGN KEY (`acc_no`) REFERENCES `list_of_connections` (`acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_details`
--

/*!40000 ALTER TABLE `bill_details` DISABLE KEYS */;
INSERT INTO `bill_details` (`acc_no`,`bill_no`,`old_reading`,`new_reading`,`issued_date`,`due_date`,`amout`,`amount_after_due_date`) VALUES 
 (1111,111,124,320,'2017-02-03','2017-03-07',0,0),
 (1001,113,7854,7996,'2016-02-03','2016-03-19',7854,8650),
 (2222,114,7854,8001,'2017-01-02','2017-03-01',7854,8547),
 (100001,115,125,302,'2017-07-27','2017-08-08',450,620),
 (1212,122,21,422,'2015-05-05','2015-06-07',0,0),
 (1111,457,457,1540,'2016-03-03','2016-04-03',0,0),
 (787,705,4578,5699,'2017-02-15','2017-03-07',0,0),
 (45789,1270,714,1203,'2017-06-27','2017-07-30',0,0),
 (2222,2022,1111,1111,'2017-08-01','2017-08-01',0,0),
 (7895,4578,4555,5998,'2017-04-03','2017-05-06',0,0),
 (2222,7844,70,1452,'2017-01-03','2017-02-04',0,0);
/*!40000 ALTER TABLE `bill_details` ENABLE KEYS */;


--
-- Definition of table `charges_details`
--

DROP TABLE IF EXISTS `charges_details`;
CREATE TABLE `charges_details` (
  `charge_id` int(11) NOT NULL,
  `charge_name` varchar(120) DEFAULT NULL,
  `charge_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`charge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charges_details`
--

/*!40000 ALTER TABLE `charges_details` DISABLE KEYS */;
INSERT INTO `charges_details` (`charge_id`,`charge_name`,`charge_value`) VALUES 
 (145,'municipal tax',23),
 (771,'ssp',47),
 (1222,'service tax',20),
 (3233,'ssdds',2122),
 (3321,'adjustment charges',11),
 (8272,'bill service',78),
 (8732,'elctricity duty charge',47),
 (45781,'meter charge',140);
/*!40000 ALTER TABLE `charges_details` ENABLE KEYS */;


--
-- Definition of table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
CREATE TABLE `divisions` (
  `state` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `circle` varchar(100) DEFAULT NULL,
  `sub_division` varchar(100) NOT NULL,
  PRIMARY KEY (`sub_division`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisions`
--

/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` (`state`,`district`,`circle`,`sub_division`) VALUES 
 ('hisar','ratia','fatehabad','aherwan'),
 ('haryana','Greater Faridabad','faridabad','Badrola'),
 ('haryana','fatehabad','hisar','bangaon'),
 ('haryana','ballabgarh','faridabad','BBMb'),
 ('haryana','badopal','fatehadab','bhattu'),
 ('haryana','badshahpur','gurgaon','ghamroj'),
 ('haryana','Nit Faridabad','faridabad','green field'),
 ('haryana','palwal','paw','madora'),
 ('haryana','hansi','hisar','namaund'),
 ('haryana','yamuna nagar','jagadhary','swe'),
 ('haryana','yamuna nagar','jagadhary','ynr');
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;


--
-- Definition of table `list_of_connections`
--

DROP TABLE IF EXISTS `list_of_connections`;
CREATE TABLE `list_of_connections` (
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(350) DEFAULT NULL,
  `acc_no` mediumint(9) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `sub_division` varchar(80) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `meter_capacity` smallint(6) DEFAULT NULL,
  `initial_reading` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`acc_no`),
  KEY `sub_division` (`sub_division`),
  CONSTRAINT `list_of_connections_ibfk_2` FOREIGN KEY (`sub_division`) REFERENCES `divisions` (`sub_division`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list_of_connections`
--

/*!40000 ALTER TABLE `list_of_connections` DISABLE KEYS */;
INSERT INTO `list_of_connections` (`name`,`address`,`acc_no`,`issued_date`,`sub_division`,`phone_no`,`meter_capacity`,`initial_reading`) VALUES 
 ('rajat','lakshmi nagar',787,NULL,'bangaon','8648789945',1,0),
 ('amar','ynr',1001,'2017-03-31','bhattu','1212121212',2,0),
 ('assd','ddd',1111,NULL,'BBMb','2222222222',2,2),
 ('ddededd','dededed',1212,NULL,'bangaon','4545454545',2,4552),
 ('fdsd','sdfgg',2222,NULL,'Badrola','4444444444',2,0),
 ('deeti sharma','jalandhar',7171,'2016-03-07','green field','4784415478',4,154),
 ('jyoti','#147 veena nagar',7895,NULL,'ynr','8059998965',1,45445),
 ('jagmohan','rishi nagar,jagadhary,haryana',8701,'2011-06-30','green field','4875963214',4,4578),
 ('rahul singh','shive nagar, yamuna nagar,haryana',9810,'2014-02-06','ynr','8059990865',2,457),
 ('raju','camp veena nagar',12455,NULL,'ghamroj','8059999086',4,0),
 ('amar','yanuabs',45789,NULL,'BBMb','8059990865',2,4587),
 ('geetika','faridabad',100001,'2017-02-02','aherwan','4545454555',2,0);
/*!40000 ALTER TABLE `list_of_connections` ENABLE KEYS */;


--
-- Definition of table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
CREATE TABLE `login_details` (
  `user_name` varchar(150) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` (`user_name`,`password`,`last_login`,`role_name`) VALUES 
 ('amarart','amarart','2017-08-08 09:58:12','admin'),
 ('user1','user1','2017-08-08 10:03:30','user');
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;


--
-- Definition of table `meter_reading`
--

DROP TABLE IF EXISTS `meter_reading`;
CREATE TABLE `meter_reading` (
  `acc_no` mediumint(9) DEFAULT NULL,
  `new_reading_date` date DEFAULT NULL,
  `old_reading_date` date DEFAULT NULL,
  `new_reading` mediumint(9) DEFAULT NULL,
  KEY `acc_no` (`acc_no`),
  CONSTRAINT `meter_reading_ibfk_1` FOREIGN KEY (`acc_no`) REFERENCES `list_of_connections` (`acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meter_reading`
--

/*!40000 ALTER TABLE `meter_reading` DISABLE KEYS */;
INSERT INTO `meter_reading` (`acc_no`,`new_reading_date`,`old_reading_date`,`new_reading`) VALUES 
 (1111,'2015-04-04','2016-02-02',21221),
 (1111,'2016-02-01','2016-01-03',32344),
 (8701,'2017-01-02','2016-11-04',45685),
 (8701,'2014-03-05','2014-04-04',4556),
 (1111,'2017-08-02','2017-07-02',1545),
 (1111,'2017-02-02','2016-07-03',4555);
/*!40000 ALTER TABLE `meter_reading` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
