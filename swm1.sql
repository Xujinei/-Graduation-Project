-- MySQL dump 10.10
--
-- Host: localhost    Database: swm1
-- ------------------------------------------------------
-- Server version	5.0.18-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) NOT NULL auto_increment COMMENT '账号编号',
  `username` varchar(50) default NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL default '' COMMENT '密码',
  `employeeId` int(10) default NULL COMMENT '员工编号',
  `lastLoginTime` timestamp NULL default CURRENT_TIMESTAMP COMMENT '最近登录时间',
  `status` int(10) default '1' COMMENT '状态',
  `promission` int(10) default NULL COMMENT '账号权限',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account_username_uindex` (`username`),
  KEY `account_employeeId_index` (`employeeId`),
  KEY `account_accountstatus_id_fk` (`status`),
  KEY `account_promission_id_fk` (`promission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--


/*!40000 ALTER TABLE `account` DISABLE KEYS */;
LOCK TABLES `account` WRITE;
INSERT INTO `account` VALUES (1,'admin','admin',1,'2018-02-25 04:21:53',1,NULL),(2,'testes','testes',2,'2018-02-25 04:22:16',1,NULL),(3,'测试','测试',2,'2018-02-25 04:22:32',1,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

--
-- Table structure for table `accountstatus`
--

DROP TABLE IF EXISTS `accountstatus`;
CREATE TABLE `accountstatus` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL default '',
  `addTime` date default NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `accountStatus_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accountstatus`
--


/*!40000 ALTER TABLE `accountstatus` DISABLE KEYS */;
LOCK TABLES `accountstatus` WRITE;
INSERT INTO `accountstatus` VALUES (0,'有效',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `accountstatus` ENABLE KEYS */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `name` varchar(30) default NULL,
  `id` int(10) NOT NULL auto_increment COMMENT '编号',
  `leaderId` int(10) default NULL COMMENT '领导编号',
  `remark` varchar(250) default NULL COMMENT '备注',
  `createTime` date default NULL COMMENT '成立时间',
  `introduction` varchar(225) default NULL COMMENT '介绍',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `department_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--


/*!40000 ALTER TABLE `department` DISABLE KEYS */;
LOCK TABLES `department` WRITE;
INSERT INTO `department` VALUES ('人事部',1,1,'无',NULL,'管人'),('测试',3,NULL,'测试发送给和',NULL,'第三方'),('打开了父',4,NULL,'规范的发给',NULL,'但是发是');
UNLOCK TABLES;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

--
-- Table structure for table `employeeinfo`
--

DROP TABLE IF EXISTS `employeeinfo`;
CREATE TABLE `employeeinfo` (
  `id` int(10) NOT NULL auto_increment COMMENT '员工信息编号',
  `name` varchar(30) NOT NULL default '' COMMENT '员工姓名',
  `sex` varchar(20) default NULL COMMENT '员工性别',
  `brithday` timestamp NULL default CURRENT_TIMESTAMP COMMENT '生日',
  `telPhone` varchar(30) NOT NULL default '' COMMENT '联系电话',
  `email` varchar(30) default NULL COMMENT '邮箱地址',
  `address` varchar(50) default NULL COMMENT '地址',
  `identificationId` varchar(30) NOT NULL default '' COMMENT '身份证号',
  `education` varchar(30) default NULL COMMENT '学历',
  `school` varchar(30) default NULL COMMENT '毕业院校',
  `profession` varchar(30) default NULL COMMENT '专业',
  `politicalStatus` varchar(30) default NULL COMMENT '政治面貌',
  `entryTime` timestamp NULL default '0000-00-00 00:00:00' COMMENT '入职时间',
  `expireDate` timestamp NULL default '0000-00-00 00:00:00' COMMENT '合同到期时间',
  `departmentId` int(10) NOT NULL COMMENT '部门编号',
  `positionId` int(10) default NULL COMMENT '职务编码',
  `baseSalary` double NOT NULL COMMENT '基本工资',
  `positionSalary` double default '0' COMMENT '职务工资',
  `subsidy` double default '0' COMMENT '基本补贴',
  `insuranceStandard` int(10) default NULL COMMENT '五险一金标准,外检',
  `employeeStatus` int(10) NOT NULL default '1' COMMENT '员工状态,外检，默认在职',
  `hoursSalary` double(10,0) NOT NULL COMMENT '小时工资',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeeinfo`
--


/*!40000 ALTER TABLE `employeeinfo` DISABLE KEYS */;
LOCK TABLES `employeeinfo` WRITE;
INSERT INTO `employeeinfo` VALUES (2,'大幅度','女','2018-01-19 16:00:00','18874489766','1293630493@qq.com','dfddf','4330255636363696','dfdfjdkslj','jldj','发动机','二大姐夫','2018-01-17 16:00:00','2018-01-10 16:00:00',4,1,4520,5456,546,NULL,1,249),(3,'测试','女','2018-02-17 16:00:00','18874489766','1293630493@qq.com','广场','460223199705602536',' 订酒店','砥砺奋进的','大幅度','就砥砺奋进','2018-02-10 16:00:00','2018-02-28 16:00:00',1,4,4566,1229,456,NULL,1,145);
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeeinfo` ENABLE KEYS */;

--
-- Table structure for table `employeestatus`
--

DROP TABLE IF EXISTS `employeestatus`;
CREATE TABLE `employeestatus` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL default '',
  `addTime` date default NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeestatus`
--


/*!40000 ALTER TABLE `employeestatus` DISABLE KEYS */;
LOCK TABLES `employeestatus` WRITE;
INSERT INTO `employeestatus` VALUES (1,'测试','2018-01-02');
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeestatus` ENABLE KEYS */;

--
-- Table structure for table `employeesubsidy`
--

DROP TABLE IF EXISTS `employeesubsidy`;
CREATE TABLE `employeesubsidy` (
  `employeeId` int(10) default NULL COMMENT '员工编号',
  `workData` date NOT NULL COMMENT '时间',
  `subsidyId` int(10) NOT NULL auto_increment COMMENT '补贴id',
  `subsidyAmount` int(10) default NULL COMMENT '补贴金额',
  PRIMARY KEY  (`subsidyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeesubsidy`
--


/*!40000 ALTER TABLE `employeesubsidy` DISABLE KEYS */;
LOCK TABLES `employeesubsidy` WRITE;
INSERT INTO `employeesubsidy` VALUES (1,'2018-01-02',1,34);
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeesubsidy` ENABLE KEYS */;

--
-- Table structure for table `insurancestandard`
--

DROP TABLE IF EXISTS `insurancestandard`;
CREATE TABLE `insurancestandard` (
  `id` int(10) NOT NULL COMMENT '编号',
  `name` varchar(30) NOT NULL default '' COMMENT '名称',
  `pension` int(10) default NULL COMMENT '养老保险(%)',
  `medical` int(10) default NULL COMMENT '医疗保险',
  `unemployment` int(10) default NULL COMMENT '失业保险',
  `injury` int(10) default NULL COMMENT '工伤保险',
  `maternity` int(10) default NULL COMMENT '生育保险',
  `housing` int(10) default NULL COMMENT '住房公积金',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurancestandard`
--


/*!40000 ALTER TABLE `insurancestandard` DISABLE KEYS */;
LOCK TABLES `insurancestandard` WRITE;
INSERT INTO `insurancestandard` VALUES (0,'1',3,4,3,4,5,1),(5,'劜545',3,3,2,3,4,3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `insurancestandard` ENABLE KEYS */;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) NOT NULL,
  `recipientId` int(10) default NULL COMMENT '接收人编号',
  `content` mediumtext COMMENT '通知内容',
  `noticeTime` datetime default NULL COMMENT '通知时间',
  `status` int(10) default NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--


/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
LOCK TABLES `notice` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(10) NOT NULL auto_increment COMMENT '职务编号',
  `name` varchar(250) NOT NULL default '' COMMENT '职务名称',
  `remark` varchar(250) default NULL COMMENT '备注',
  `duty` varchar(225) default NULL COMMENT '职责',
  `required` varchar(225) default NULL COMMENT '需求',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--


/*!40000 ALTER TABLE `position` DISABLE KEYS */;
LOCK TABLES `position` WRITE;
INSERT INTO `position` VALUES (1,'助理','任然',' 助理',' 漂亮啦'),(4,'测试','测试12','测试','测试好'),(5,'劜gd ','fghj','fghn','fdghjm');
UNLOCK TABLES;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;

--
-- Table structure for table `promission`
--

DROP TABLE IF EXISTS `promission`;
CREATE TABLE `promission` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promission`
--


/*!40000 ALTER TABLE `promission` DISABLE KEYS */;
LOCK TABLES `promission` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `promission` ENABLE KEYS */;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `employeeId` int(10) NOT NULL default '0' COMMENT '员工编号',
  `workData` date NOT NULL COMMENT '工作周期(2017-11-01)',
  `baseSalary` double NOT NULL COMMENT '基本工资',
  `positionSalary` double default NULL COMMENT '职务工资',
  `baseSubsidy` int(10) default NULL COMMENT '基本补贴',
  `total` double(10,0) NOT NULL COMMENT '其他补贴',
  `tax` double NOT NULL COMMENT '税收',
  `insurance` double NOT NULL COMMENT '五险一金',
  `status` int(10) NOT NULL COMMENT '工资状态',
  `approver` int(10) NOT NULL COMMENT '审批人',
  `payTime` datetime NOT NULL COMMENT '发放时间',
  `workHours` double NOT NULL,
  `departementId` int(11) default NULL,
  `positionId` int(11) default NULL,
  PRIMARY KEY  (`workData`,`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salary`
--


/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
LOCK TABLES `salary` WRITE;
INSERT INTO `salary` VALUES (2,'2018-02-01',4520,5456,546,9806,740.2,40,0,0,'2018-03-23 00:00:00',40,4,1),(3,'2018-02-01',4566,1229,456,6152,124.5,20,0,0,'2018-03-23 00:00:00',40,1,4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;

--
-- Table structure for table `salarystatus`
--

DROP TABLE IF EXISTS `salarystatus`;
CREATE TABLE `salarystatus` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL default '',
  `addTime` date default NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salarystatus`
--


/*!40000 ALTER TABLE `salarystatus` DISABLE KEYS */;
LOCK TABLES `salarystatus` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `salarystatus` ENABLE KEYS */;

--
-- Table structure for table `subsidytype`
--

DROP TABLE IF EXISTS `subsidytype`;
CREATE TABLE `subsidytype` (
  `id` int(10) NOT NULL auto_increment COMMENT '编号',
  `name` varchar(30) NOT NULL default '' COMMENT '名称',
  `remark` varchar(250) default NULL COMMENT '备注',
  `addTime` date default NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subsidytype`
--


/*!40000 ALTER TABLE `subsidytype` DISABLE KEYS */;
LOCK TABLES `subsidytype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `subsidytype` ENABLE KEYS */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(225) default NULL,
  `name` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--


/*!40000 ALTER TABLE `test` DISABLE KEYS */;
LOCK TABLES `test` WRITE;
INSERT INTO `test` VALUES (1,'测试');
UNLOCK TABLES;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

--
-- Table structure for table `workinghours`
--

DROP TABLE IF EXISTS `workinghours`;
CREATE TABLE `workinghours` (
  `id` int(10) NOT NULL auto_increment COMMENT '员工编号',
  `workData` date NOT NULL COMMENT '时间周期（2017-11-01）data',
  `workHours` int(10) NOT NULL COMMENT '总工时',
  `overTime` int(10) default '0' COMMENT '总加班时长',
  `empId` int(20) NOT NULL COMMENT '员工编号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workinghours`
--


/*!40000 ALTER TABLE `workinghours` DISABLE KEYS */;
LOCK TABLES `workinghours` WRITE;
INSERT INTO `workinghours` VALUES (27,'2018-02-01',40,2,3),(28,'2018-02-01',40,4,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `workinghours` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

