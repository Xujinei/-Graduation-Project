/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50018
Source Host           : 127.0.0.1:3306
Source Database       : swm1

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2018-04-05 12:53:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) NOT NULL auto_increment COMMENT '账号编号',
  `username` varchar(50) default NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL default '' COMMENT '密码',
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

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin', '1E4403840602BFAFC53A7D5F9653BFC0', '3', '2018-02-25 12:21:53', '1', '1');
INSERT INTO `account` VALUES ('2', 'testes', '1E4403840602BFAFC53A7D5F9653BFC0', '2', '2018-02-25 12:22:16', '1', '0');
INSERT INTO `account` VALUES ('3', 'user2', '1E4403840602BFAFC53A7D5F9653BFC0', '4', '2018-04-01 09:55:53', '1', '0');
INSERT INTO `account` VALUES ('4', 'chenxx', '1E4403840602BFAFC53A7D5F9653BFC0', '5', '2018-04-01 09:55:59', '1', '1');
INSERT INTO `account` VALUES ('5', 'chendd', '1E4403840602BFAFC53A7D5F9653BFC0', '6', null, '1', '0');

-- ----------------------------
-- Table structure for accountstatus
-- ----------------------------
DROP TABLE IF EXISTS `accountstatus`;
CREATE TABLE `accountstatus` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL default '',
  `addTime` date default NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `accountStatus_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountstatus
-- ----------------------------
INSERT INTO `accountstatus` VALUES ('0', '有效', null);

-- ----------------------------
-- Table structure for department
-- ----------------------------
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

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('人事部', '1', '2', '无', null, '管人');
INSERT INTO `department` VALUES ('测试', '3', '3', '测试发送给和', null, '第三方');
INSERT INTO `department` VALUES ('行政', '5', '5', '有穷人', null, '大幅度涣发大号');

-- ----------------------------
-- Table structure for employeeinfo
-- ----------------------------
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

-- ----------------------------
-- Records of employeeinfo
-- ----------------------------
INSERT INTO `employeeinfo` VALUES ('2', '大幅度', '女', '2018-01-20 00:00:00', '18874489766', '1293630493@qq.com', 'dfddf', '4330255636363696', 'dfdfjdkslj', 'jldj', '发动机', '二大姐夫', '2018-01-18 00:00:00', '2018-01-11 00:00:00', '4', '1', '4520', '5456', '546', null, '1', '249');
INSERT INTO `employeeinfo` VALUES ('3', '测试', '女', '2018-02-18 00:00:00', '188744897', '1293654545@qq.com', '广场非官方', '460223199705602536', ' 订酒店', '砥砺奋进的', '大幅度', '就砥砺奋进', '2018-02-11 00:00:00', '2018-03-01 00:00:00', '1', '4', '4566', '1229', '456', null, '1', '145');
INSERT INTO `employeeinfo` VALUES ('4', '的接口合肥', '男', '2004-02-17 00:00:00', '18874456363', '1293630493@qq.com', '大幅度', '453636363636363252', '大', '的给付对价', '的减肥的', '绝地反', '2018-02-13 00:00:00', '2020-02-11 00:00:00', '3', '1', '4568', '4525', '124.9', null, '1', '227');
INSERT INTO `employeeinfo` VALUES ('5', 'chenxx', '男', '2004-03-10 00:00:00', '1887442639', '1529@qq.con', '长沙', '465336363525632541', '大学', '衡阳师范', '物流', '团员', '2018-04-01 00:00:00', '2028-05-17 00:00:00', '1', '1', '2536', '4563', '145', null, '1', '177');
INSERT INTO `employeeinfo` VALUES ('6', 'chendd', '女', '2004-03-10 00:00:00', '1887442639', '152535359@qq.con', '长沙', '465336363525632541', '大学', '衡阳师范', '物流', '团员', '2018-04-01 00:00:00', '2028-05-17 00:00:00', '3', '4', '5536', '4563', '145', null, '1', '252');

-- ----------------------------
-- Table structure for employeestatus
-- ----------------------------
DROP TABLE IF EXISTS `employeestatus`;
CREATE TABLE `employeestatus` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL default '',
  `addTime` date default NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeestatus
-- ----------------------------
INSERT INTO `employeestatus` VALUES ('1', '测试', '2018-01-02');

-- ----------------------------
-- Table structure for employeesubsidy
-- ----------------------------
DROP TABLE IF EXISTS `employeesubsidy`;
CREATE TABLE `employeesubsidy` (
  `employeeId` int(10) default NULL COMMENT '员工编号',
  `workData` date NOT NULL COMMENT '时间',
  `subsidyId` int(10) NOT NULL auto_increment COMMENT '补贴id',
  `subsidyAmount` int(10) default NULL COMMENT '补贴金额',
  PRIMARY KEY  (`subsidyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeesubsidy
-- ----------------------------
INSERT INTO `employeesubsidy` VALUES ('1', '2018-01-02', '1', '34');

-- ----------------------------
-- Table structure for insurancestandard
-- ----------------------------
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

-- ----------------------------
-- Records of insurancestandard
-- ----------------------------
INSERT INTO `insurancestandard` VALUES ('0', '1', '3', '4', '3', '4', '5', '1');
INSERT INTO `insurancestandard` VALUES ('5', '劜545', '3', '3', '2', '3', '4', '3');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) NOT NULL,
  `recipientId` int(10) default NULL COMMENT '接收人编号',
  `content` mediumtext COMMENT '通知内容',
  `noticeTime` datetime default NULL COMMENT '通知时间',
  `status` int(10) default NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(10) NOT NULL auto_increment COMMENT '职务编号',
  `name` varchar(250) NOT NULL default '' COMMENT '职务名称',
  `remark` varchar(250) default NULL COMMENT '备注',
  `duty` varchar(225) default NULL COMMENT '职责',
  `required` varchar(225) default NULL COMMENT '需求',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '助理', '任然', ' 助理', ' 漂亮啦');
INSERT INTO `position` VALUES ('4', '测试', '测试12', '测试', '测试好');
INSERT INTO `position` VALUES ('5', '劜gd ', 'fghj', 'fghn', 'fdghjm');

-- ----------------------------
-- Table structure for promission
-- ----------------------------
DROP TABLE IF EXISTS `promission`;
CREATE TABLE `promission` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of promission
-- ----------------------------

-- ----------------------------
-- Table structure for salary
-- ----------------------------
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

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('2', '2018-02-01', '4520', '5456', '546', '9806', '740.2', '40', '0', '0', '2018-03-23 00:00:00', '40', '4', '1');
INSERT INTO `salary` VALUES ('3', '2018-02-01', '4566', '1229', '456', '6152', '124.5', '20', '0', '0', '2018-03-23 00:00:00', '40', '1', '4');

-- ----------------------------
-- Table structure for salarystatus
-- ----------------------------
DROP TABLE IF EXISTS `salarystatus`;
CREATE TABLE `salarystatus` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL default '',
  `addTime` date default NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salarystatus
-- ----------------------------

-- ----------------------------
-- Table structure for subsidytype
-- ----------------------------
DROP TABLE IF EXISTS `subsidytype`;
CREATE TABLE `subsidytype` (
  `id` int(10) NOT NULL auto_increment COMMENT '编号',
  `name` varchar(30) NOT NULL default '' COMMENT '名称',
  `remark` varchar(250) default NULL COMMENT '备注',
  `addTime` date default NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subsidytype
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(225) default NULL,
  `name` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '测试');

-- ----------------------------
-- Table structure for workinghours
-- ----------------------------
DROP TABLE IF EXISTS `workinghours`;
CREATE TABLE `workinghours` (
  `id` int(10) NOT NULL auto_increment COMMENT '员工编号',
  `workData` date NOT NULL COMMENT '时间周期（2017-11-01）data',
  `workHours` int(10) NOT NULL COMMENT '总工时',
  `overTime` int(10) default '0' COMMENT '总加班时长',
  `empId` int(20) NOT NULL COMMENT '员工编号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workinghours
-- ----------------------------
INSERT INTO `workinghours` VALUES ('27', '2018-02-01', '40', '2', '3');
INSERT INTO `workinghours` VALUES ('28', '2018-02-01', '40', '4', '2');
