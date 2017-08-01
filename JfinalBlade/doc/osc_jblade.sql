/*
MySQL Data Transfer
Source Host: localhost
Source Database: osc_jblade
Target Host: localhost
Target Database: osc_jblade
Date: 2016/11/17 9:29:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for tb_tfw_blog
-- ----------------------------
CREATE TABLE `tb_tfw_blog` (
  `f_it_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `f_it_del` int(11) DEFAULT '0' COMMENT '状态',
  `f_it_seq` int(11) DEFAULT '0' COMMENT '排序',
  `f_it_content` text COMMENT '内容',
  `f_it_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `f_it_createtime` date DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`f_it_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_tfw_tzgg
-- ----------------------------
CREATE TABLE `tb_tfw_tzgg` (
  `F_IT_XL` int(11) NOT NULL AUTO_INCREMENT,
  `F_VC_BT` varchar(255) DEFAULT NULL,
  `F_IT_LX` int(11) DEFAULT NULL,
  `F_TX_NR` text,
  `F_DT_FBSJ` datetime DEFAULT NULL,
  `F_DT_CJSJ` datetime DEFAULT NULL,
  `F_IT_CJR` int(11) DEFAULT NULL,
  `F_IT_TP` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`F_IT_XL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_attach
-- ----------------------------
CREATE TABLE `tfw_attach` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `URL` text,
  `STATUS` int(11) DEFAULT NULL,
  `CREATER` int(11) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_dept
-- ----------------------------
CREATE TABLE `tfw_dept` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `SIMPLENAME` varchar(45) DEFAULT NULL,
  `FULLNAME` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_dict
-- ----------------------------
CREATE TABLE `tfw_dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `NUM` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_generate
-- ----------------------------
CREATE TABLE `tfw_generate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `REALPATH` varchar(255) DEFAULT NULL,
  `PACKAGENAME` varchar(255) DEFAULT NULL,
  `MODELNAME` varchar(255) DEFAULT NULL,
  `TABLENAME` varchar(255) DEFAULT NULL,
  `PKNAME` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_login_log
-- ----------------------------
CREATE TABLE `tfw_login_log` (
  `ID` int(65) NOT NULL AUTO_INCREMENT,
  `LOGNAME` varchar(255) DEFAULT NULL,
  `USERID` varchar(255) DEFAULT NULL,
  `CLASSNAME` varchar(255) DEFAULT NULL,
  `METHOD` text,
  `CREATETIME` datetime DEFAULT NULL,
  `SUCCEED` varchar(255) DEFAULT NULL,
  `MESSAGE` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_menu
-- ----------------------------
CREATE TABLE `tfw_menu` (
  `ID` int(65) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `PCODE` varchar(255) DEFAULT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `NUM` int(65) DEFAULT NULL,
  `LEVELS` int(65) DEFAULT NULL,
  `SOURCE` text,
  `PATH` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `STATUS` int(65) DEFAULT NULL,
  `ISOPEN` varchar(255) DEFAULT NULL,
  `ISTEMPLATE` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_operation_log
-- ----------------------------
CREATE TABLE `tfw_operation_log` (
  `ID` int(65) NOT NULL AUTO_INCREMENT,
  `LOGNAME` varchar(255) DEFAULT NULL,
  `USERID` varchar(255) DEFAULT NULL,
  `CLASSNAME` varchar(255) DEFAULT NULL,
  `METHOD` text,
  `CREATETIME` datetime DEFAULT NULL,
  `SUCCEED` varchar(255) DEFAULT NULL,
  `MESSAGE` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_parameter
-- ----------------------------
CREATE TABLE `tfw_parameter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `NUM` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARA` text,
  `TIPS` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_relation
-- ----------------------------
CREATE TABLE `tfw_relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MENUID` int(11) DEFAULT NULL,
  `ROLEID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_role
-- ----------------------------
CREATE TABLE `tfw_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DEPTID` int(11) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_role_ext
-- ----------------------------
CREATE TABLE `tfw_role_ext` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(255) DEFAULT NULL,
  `ROLEIN` text,
  `ROLEOUT` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tfw_user
-- ----------------------------
CREATE TABLE `tfw_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `SALT` varchar(45) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `SEX` int(11) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `ROLEID` varchar(255) DEFAULT NULL,
  `DEPTID` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Function structure for queryChildren
-- ----------------------------
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryChildren`(rootid VARCHAR(500),tabname VARCHAR(500)) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);
DECLARE icount INTEGER;
DECLARE tname VARCHAR(500);

SET sTemp = '$';
SET sTempChd = rootid;
set tname=tabname;

if INSTR(tname,'tfw_dept')>0 then
select count(1) into icount from tfw_dept where id=sTempChd;
if icount>0 then
WHILE sTempChd is not NULL DO
if sTempChd <> rootid then 
SET sTemp = CONCAT(sTemp,',',sTempChd);
end if;
SELECT group_concat(id) INTO sTempChd FROM tfw_dept where FIND_IN_SET(pid,sTempChd)>0;
END WHILE;
RETURN SUBSTRING(sTemp,3);
ELSE
RETURN null;
end if;
end if;
if INSTR(tname,'tfw_role')>0 then
select count(1) into icount from tfw_role where id=sTempChd;
if icount>0 then
WHILE sTempChd is not NULL DO
if sTempChd <> rootid then 
SET sTemp = CONCAT(sTemp,',',sTempChd);
end if;
SELECT group_concat(id) INTO sTempChd FROM tfw_role where FIND_IN_SET(pid,sTempChd)>0;
END WHILE;
RETURN SUBSTRING(sTemp,3);
ELSE
RETURN null;
end if;
end if;


END;;
DELIMITER ;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `tb_tfw_blog` VALUES ('1', '1', '1', 'jfinalblade go', 'jfinalblade', '2016-10-08', '2');
INSERT INTO `tb_tfw_blog` VALUES ('3', '1', '2', '<p style=\"text-align: center;\">112</p>', '测试', '2016-10-10', '1');
INSERT INTO `tb_tfw_blog` VALUES ('4', '1', '3', '<p><img src=\"/upload/image/20161010/1476091111051005215.jpg\" style=\"\" title=\"1476091111051005215.jpg\"/></p><p><img src=\"/upload/image/20161010/1476091111054037337.jpg\" style=\"\" title=\"1476091111054037337.jpg\"/></p><p><img src=\"/upload/image/20161010/1476091111051097841.jpg\" style=\"\" title=\"1476091111051097841.jpg\"/></p><p><br/></p>', '测试1', '2016-10-10', '0');
INSERT INTO `tb_tfw_blog` VALUES ('5', '1', '4', '<p><img src=\"http://ikkong.qiniudn.com/upload/image/20161011/1476170956158098341.jpg\" title=\"1476170956158098341\" alt=\"3 (12).jpg\"/></p>', '测试qiniu', '2016-10-11', '0');
INSERT INTO `tb_tfw_tzgg` VALUES ('2', '漂亮的大风车', '10', '<p>\r\n	啊啊啊\r\n</p>\r\n<p>\r\n	<img src=\"/kindeditor/renderFile/303\" title=\"303\" alt=\"303\" />\r\n</p>', '2016-09-30 00:00:00', null, null, null, '0');
INSERT INTO `tb_tfw_tzgg` VALUES ('3', '好多图', '1', '<img src=\"/kindeditor/renderFile/304\" title=\"304\" alt=\"304\" /><img src=\"/kindeditor/renderFile/305\" title=\"305\" alt=\"305\" /><img src=\"/kindeditor/renderFile/306\" title=\"306\" alt=\"306\" />', '2016-09-30 00:00:00', null, null, null, '0');
INSERT INTO `tfw_attach` VALUES ('303', null, '2 (14).jpg', '/upload\\20160930\\1475222724826.jpg', '1', '1', '2016-09-30 16:05:25');
INSERT INTO `tfw_attach` VALUES ('304', null, '2.jpg', '/upload\\20160930\\1475222803894.jpg', '1', '1', '2016-09-30 16:06:44');
INSERT INTO `tfw_attach` VALUES ('305', null, '3 (11).jpg', '/upload\\20160930\\1475222803929.jpg', '1', '1', '2016-09-30 16:06:44');
INSERT INTO `tfw_attach` VALUES ('306', null, '3 (12).jpg', '/upload\\20160930\\1475222804029.jpg', '1', '1', '2016-09-30 16:06:44');
INSERT INTO `tfw_attach` VALUES ('307', null, '3 (13).jpg', '/upload\\20161011\\1476171059172.jpg', '1', '1', '2016-10-11 15:30:59');
INSERT INTO `tfw_dept` VALUES ('1', '0', '0', 'IKKONG', 'IKKONG', null, '2');
INSERT INTO `tfw_dept` VALUES ('2', '1', '1', '江苏空空', '江苏空空信息技术有限公司', null, '2');
INSERT INTO `tfw_dept` VALUES ('3', '1', '2', '技服部', '技术服务部', null, '1');
INSERT INTO `tfw_dept` VALUES ('4', '2', '2', '客服部', '客户服务部', null, '1');
INSERT INTO `tfw_dept` VALUES ('5', '3', '2', '销售部', '销售部', null, '1');
INSERT INTO `tfw_dept` VALUES ('6', '4', '2', '综合管理部', '综合管理部', null, '1');
INSERT INTO `tfw_dept` VALUES ('7', '2', '1', '常州空空', '常州空空软件技术有限公司', null, '4');
INSERT INTO `tfw_dept` VALUES ('8', '1', '7', '产品部', '产品部', null, '1');
INSERT INTO `tfw_dept` VALUES ('9', '2', '7', '研发部', '研发部', null, '1');
INSERT INTO `tfw_dept` VALUES ('10', '3', '7', '项目部', '项目部', null, '1');
INSERT INTO `tfw_dept` VALUES ('11', '4', '7', '运维部', '运维部', null, '1');
INSERT INTO `tfw_dept` VALUES ('12', '5', '7', '销售部', '销售部', null, '1');
INSERT INTO `tfw_dept` VALUES ('13', '6', '7', '行政部', '行政部', null, '1');
INSERT INTO `tfw_dict` VALUES ('1', '101', '0', '0', '性别', null, '0');
INSERT INTO `tfw_dict` VALUES ('2', '101', '1', '1', '男', null, '1');
INSERT INTO `tfw_dict` VALUES ('3', '101', '2', '1', '女', null, '0');
INSERT INTO `tfw_dict` VALUES ('5', '901', '0', '0', '账号状态', null, '0');
INSERT INTO `tfw_dict` VALUES ('6', '901', '1', '5', '启用', null, '0');
INSERT INTO `tfw_dict` VALUES ('7', '901', '2', '5', '冻结', null, '0');
INSERT INTO `tfw_dict` VALUES ('8', '901', '3', '5', '待审核', null, '0');
INSERT INTO `tfw_dict` VALUES ('9', '901', '4', '5', '审核拒绝', null, '0');
INSERT INTO `tfw_dict` VALUES ('10', '901', '5', '5', '已删除', null, '0');
INSERT INTO `tfw_dict` VALUES ('11', '902', '0', '0', '状态', null, '0');
INSERT INTO `tfw_dict` VALUES ('12', '902', '1', '11', '启用', null, '0');
INSERT INTO `tfw_dict` VALUES ('13', '902', '2', '11', '禁用', null, '0');
INSERT INTO `tfw_dict` VALUES ('14', '102', '0', '0', '公告类型', null, '0');
INSERT INTO `tfw_dict` VALUES ('15', '102', '10', '14', '通知公告', null, '0');
INSERT INTO `tfw_dict` VALUES ('16', '102', '9', '14', '发布计划', null, '0');
INSERT INTO `tfw_dict` VALUES ('17', '903', '0', '0', '审核状态', null, '0');
INSERT INTO `tfw_dict` VALUES ('18', '903', '1', '17', '待审核', null, '0');
INSERT INTO `tfw_dict` VALUES ('19', '903', '2', '17', '审核拒绝', null, '0');
INSERT INTO `tfw_dict` VALUES ('20', '903', '3', '17', '审核通过', null, '0');
INSERT INTO `tfw_dict` VALUES ('41', '102', '6', '16', '测试', null, '0');
INSERT INTO `tfw_dict` VALUES ('44', '102', '1', '14', '发布测试', null, '0');
INSERT INTO `tfw_dict` VALUES ('45', '102', '2', '16', '测试222', null, '1');
INSERT INTO `tfw_generate` VALUES ('2', 'blog', 'E:\\gen', 'com.ikkong.platform', 'Blog', 'tb_tfw_blog', 'f_it_id', null);
INSERT INTO `tfw_login_log` VALUES ('69', '12', '2', null, '12', '2016-02-01 00:00:00', '0', '12');
INSERT INTO `tfw_login_log` VALUES ('70', '登录', '1', null, '[sessionID]: ci6ww7e3bmsx7hibkvfgeol3 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 10:18:38', '1', null);
INSERT INTO `tfw_login_log` VALUES ('71', '登录', '1', null, '[sessionID]: xtkaw8f6kqarvg8j2trpk48q [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 11:05:17', '1', null);
INSERT INTO `tfw_login_log` VALUES ('72', '登录', '1', null, '[sessionID]: 1314dfrltipbd1l62vt9jjhepl [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 11:10:29', '1', null);
INSERT INTO `tfw_login_log` VALUES ('73', '登录', '1', null, '[sessionID]: 97sixu4mubk9xfeykmsvr899 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 11:25:29', '1', null);
INSERT INTO `tfw_login_log` VALUES ('74', '登录', '1', null, '[sessionID]: 7f1obhumq9o7r40ee8x9bzue [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 11:32:52', '1', null);
INSERT INTO `tfw_login_log` VALUES ('75', '登录', '1', null, '[sessionID]: 1u59ybo0da3881lb4anxa2eley [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 13:26:45', '1', null);
INSERT INTO `tfw_login_log` VALUES ('76', '登录', '1', null, '[sessionID]: 7967t66pd1tcl7j8755ktokz [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 13:49:15', '1', null);
INSERT INTO `tfw_login_log` VALUES ('77', '登录', '1', null, '[sessionID]: tqik4h5jshis10afc10s7feq5 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 13:58:45', '1', null);
INSERT INTO `tfw_login_log` VALUES ('78', '登录', '1', null, '[sessionID]: 1oh89iui1mget1ey6a48wcu9gi [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 14:02:23', '1', null);
INSERT INTO `tfw_login_log` VALUES ('79', '登录', '1', null, '[sessionID]: gmzgug1wa6za13e6p5pr22kqd [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 16:13:41', '1', null);
INSERT INTO `tfw_login_log` VALUES ('80', '登录', '1', null, '[sessionID]: roobkbkfa8c6q765ghb0vem8 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 16:31:17', '1', null);
INSERT INTO `tfw_login_log` VALUES ('81', '登录', '1', null, '[sessionID]: 1n80pzkdlvo7qg756vgbowbw5 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 17:06:17', '1', null);
INSERT INTO `tfw_login_log` VALUES ('82', '登录', '1', null, '[sessionID]: sfd5cuocbwoe1dqit52tmdcad [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-23 17:23:06', '1', null);
INSERT INTO `tfw_login_log` VALUES ('83', '登录', '1', null, '[sessionID]: yvf4h16zp00t1n1pe0zmlj8sw [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-27 08:40:10', '1', null);
INSERT INTO `tfw_login_log` VALUES ('84', '登录', '1', null, '[sessionID]: z6pm1tslakbat7y3nq2b5hrh [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-27 08:44:44', '1', null);
INSERT INTO `tfw_login_log` VALUES ('85', '登录', '1', null, '[sessionID]: e5gli35jxfwwaf2me02fh4yy [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-27 08:50:57', '1', null);
INSERT INTO `tfw_login_log` VALUES ('86', '登录', '1', null, '[sessionID]: 1drnwjvg008xjp5n8vmaeocx3 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-28 16:57:38', '1', null);
INSERT INTO `tfw_login_log` VALUES ('87', '登录', '1', null, '[sessionID]: wrbrzmxbrrvl8vytok697ygr [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-28 17:01:00', '1', null);
INSERT INTO `tfw_login_log` VALUES ('88', '登录', '1', null, '[sessionID]: 1esel2896m8k1gohohwexvfel [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-28 17:05:06', '1', null);
INSERT INTO `tfw_login_log` VALUES ('89', '登录', '1', null, '[sessionID]: 1e62ele5wc4sv57vf8t4jopjt [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-28 17:37:58', '1', null);
INSERT INTO `tfw_login_log` VALUES ('90', '登录', '1', null, '[sessionID]: mp5bj4n2zzxm1kgjd9y86xkva [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 08:52:52', '1', null);
INSERT INTO `tfw_login_log` VALUES ('91', '登录', '1', null, '[sessionID]: pbyjb5bfidruwwjlfkit39t3 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 09:24:42', '1', null);
INSERT INTO `tfw_login_log` VALUES ('92', '登录', '1', null, '[sessionID]: zliag84emt7hxzckymgba657 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 09:39:30', '1', null);
INSERT INTO `tfw_login_log` VALUES ('93', '登录', '1', null, '[sessionID]: 1dnu4fw2hj97b1f706bytxtoac [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 10:41:42', '1', null);
INSERT INTO `tfw_login_log` VALUES ('94', '登录', '1', null, '[sessionID]: ketaeot20pb3m8umwdckb3s [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 13:46:22', '1', null);
INSERT INTO `tfw_login_log` VALUES ('95', '登录', '1', null, '[sessionID]: dxa2zge7ad5l18jozf8aamesm [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 14:27:12', '1', null);
INSERT INTO `tfw_login_log` VALUES ('96', '登录', '1', null, '[sessionID]: 1o1xosz8z33k1elcraeicv19x [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 14:51:46', '1', null);
INSERT INTO `tfw_login_log` VALUES ('97', '登录', '1', null, '[sessionID]: 1gjh1m3o7nvzi1f0j3e4czduoz [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 15:06:09', '1', null);
INSERT INTO `tfw_login_log` VALUES ('98', '登录', '1', null, '[sessionID]: ptdfpj7uf67k1ezqk4epw9x8o [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 15:11:52', '1', null);
INSERT INTO `tfw_login_log` VALUES ('99', '登录', '1', null, '[sessionID]: w01jfuhrnedx1j0otbu0zd0un [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 15:15:02', '1', null);
INSERT INTO `tfw_login_log` VALUES ('100', '登录', '1', null, '[sessionID]: 19nkb5dwpgyo012wddci45xh5d [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-29 16:43:54', '1', null);
INSERT INTO `tfw_login_log` VALUES ('101', '登录', '1', null, '[sessionID]: ufyqfu3uwx201d4mneohmpv3b [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-30 10:20:46', '1', null);
INSERT INTO `tfw_login_log` VALUES ('102', '登录', '1', null, '[sessionID]: unn36ul6nrc51ql83p1zihyow [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-30 10:33:34', '1', null);
INSERT INTO `tfw_login_log` VALUES ('103', '登录', '1', null, '[sessionID]: 1u0c1hllfgqzpnosvhfw4u0ng [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-30 10:51:07', '1', null);
INSERT INTO `tfw_login_log` VALUES ('104', '登录', '1', null, '[sessionID]: jcz41hjqdi5mzuo7rnjerfev [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-30 11:12:34', '1', null);
INSERT INTO `tfw_login_log` VALUES ('105', '登录', '1', null, '[sessionID]: vb3jzam9vef1155uluv4tjc8u [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-30 14:05:38', '1', null);
INSERT INTO `tfw_login_log` VALUES ('106', '登录', '1', null, '[sessionID]: 1v4swciovr3gi1ffi7m916hhx8 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-09-30 14:22:36', '1', null);
INSERT INTO `tfw_login_log` VALUES ('107', '登录', '1', null, '[sessionID]: 1kypmsa14geji8qt0d4jiuo2a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-08 14:15:02', '1', null);
INSERT INTO `tfw_login_log` VALUES ('108', '登录', '1', null, '[sessionID]: 1tp1y6k3te3ok5dt5b4y5hxm1 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-08 15:38:38', '1', null);
INSERT INTO `tfw_login_log` VALUES ('109', '登录', '1', null, '[sessionID]: 1fimweejpdztd140lf1ybuxus2 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-08 15:53:55', '1', null);
INSERT INTO `tfw_login_log` VALUES ('110', '登录', '1', null, '[sessionID]: 52sj7rlfvtku1092uwymm78u2 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-08 15:57:24', '1', null);
INSERT INTO `tfw_login_log` VALUES ('111', '登录', '1', null, '[sessionID]: fo1lisgx2h3x1b8evktry3mxv [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-08 16:34:19', '1', null);
INSERT INTO `tfw_login_log` VALUES ('112', '登录', '1', null, '[sessionID]: 1g0vsfudl038s16vy2k5amlhb7 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-08 16:47:45', '1', null);
INSERT INTO `tfw_login_log` VALUES ('113', '登录', '1', null, '[sessionID]: 1h4x3ofj6vi3d1ihdpdcd3jq5r [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-09 09:02:27', '1', null);
INSERT INTO `tfw_login_log` VALUES ('114', '登录', '1', null, '[sessionID]: 14w46cddtz9gx11xhtio0cd4o9 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-09 10:09:28', '1', null);
INSERT INTO `tfw_login_log` VALUES ('115', '登录', '1', null, '[sessionID]: oj0oc3m9tm9k1h5ca8oobcowl [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-09 14:18:44', '1', null);
INSERT INTO `tfw_login_log` VALUES ('116', '登录', '1', null, '[sessionID]: 4ffgp6n1f3ay1o91tyn3eqfx5 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-09 14:21:09', '1', null);
INSERT INTO `tfw_login_log` VALUES ('117', '登录', '1', null, '[sessionID]: w36zwzquzjz310hwn1ggb2g2z [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-09 14:56:36', '1', null);
INSERT INTO `tfw_login_log` VALUES ('118', '登录', '1', null, '[sessionID]: dttzvn7vi8yu155hnfcv2sk93 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-09 15:30:27', '1', null);
INSERT INTO `tfw_login_log` VALUES ('119', '登录', '1', null, '[sessionID]: 1ox58z07o0bfya967s0apfjza [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-09 16:04:45', '1', null);
INSERT INTO `tfw_login_log` VALUES ('120', '登录', '1', null, '[sessionID]: qx9sorff45bm18jbflap12b9g [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-09 16:16:41', '1', null);
INSERT INTO `tfw_login_log` VALUES ('121', '登录', '1', null, '[sessionID]: 1f2wd12bby4m6nd1nwnxkgn97 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-10 15:29:55', '1', null);
INSERT INTO `tfw_login_log` VALUES ('122', '登录', '1', null, '[sessionID]: l01ztk5lzin6xmpi4y0em45e [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-10 17:17:49', '1', null);
INSERT INTO `tfw_login_log` VALUES ('123', '登录', '1', null, '[sessionID]: 117sou17w07bj1mswchbwhg5gu [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-10-11 15:27:43', '1', null);
INSERT INTO `tfw_login_log` VALUES ('124', '登录', '1', null, '[sessionID]: 1m1qay1rz6yie32yj3w6rplv2 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-11-17 09:05:39', '1', null);
INSERT INTO `tfw_login_log` VALUES ('125', '登录', '1', null, '[sessionID]: 1vt1mcq3uibc9csnrv3o449em [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000', '2016-11-17 09:14:34', '1', null);
INSERT INTO `tfw_menu` VALUES ('1', 'system', '0', null, '系统管理', 'fa-cog', null, '9', '1', null, null, null, '1', '1', '0', '3');
INSERT INTO `tfw_menu` VALUES ('2', 'role', 'system', null, '角色管理', 'fa-key', '/role/', '2', '2', null, null, null, '1', '0', null, '1');
INSERT INTO `tfw_menu` VALUES ('3', 'role_add', 'role', 'addex', '角色新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/role/add', '1', '3', null, 'role_add.html', '800*340', '1', '0', null, '2');
INSERT INTO `tfw_menu` VALUES ('4', 'role_edit', 'role', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/role/edit', '2', '3', null, 'role_edit.html', '800*340', '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('5', 'role_remove', 'role', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/role/remove', '3', '3', null, null, null, '1', '0', null, '1');
INSERT INTO `tfw_menu` VALUES ('6', 'role_view', 'role', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/role/view', '4', '3', null, 'role_view.html', '800*340', '1', null, null, '1');
INSERT INTO `tfw_menu` VALUES ('7', 'role_authority', 'role', 'authority', '权限配置', 'btn btn-xs btn-white | fa fa-wrench  bigger-120', '/role/authority', '5', '3', null, 'role_authority.html', '350*500', '1', '0', null, '2');
INSERT INTO `tfw_menu` VALUES ('8', 'user', 'system', null, '用户管理', 'fa-user', '/user/', '1', '2', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('9', 'user_add', 'user', 'add', '新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/user/add', '1', '3', null, 'user_add.html', '800*430', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('10', 'user_edit', 'user', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/user/edit', '2', '3', null, 'user_edit.html', '800*430', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('11', 'user_del', 'user', 'remove', '删除', 'btn btn-xs btn-white | fa fa fa-times bigger-120', '/user/del', '3', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('12', 'user_view', 'user', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/user/view', '4', '3', null, 'user_view.html', '800*390', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('13', 'user_audit', 'user', 'audit', '审核', 'btn btn-xs btn-white | fa fa-user  bigger-120', '{\"status\":\"3\"}', '5', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('14', 'user_audit_ok', 'user_audit', 'ok', '通过', 'btn btn-xs btn-white | fa fa-check  bigger-120', '/user/auditOk', '1', '4', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('15', 'user_audit_refuse', 'user_audit', 'refuse', '拒绝', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/user/auditRefuse', '2', '4', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('16', 'user_audit_back', 'user_audit', 'back', '返回', 'btn btn-xs btn-white | fa fa-undo  bigger-120', null, '3', '4', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('17', 'user_reset', 'user', 'reset', '重置密码', 'btn btn-xs btn-white | fa fa-key  bigger-120', '/user/reset', '6', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('18', 'user_ban', 'user', 'frozen', '冻结', 'btn btn-xs btn-white | fa fa-ban  bigger-120', '/user/ban', '7', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('19', 'user_recycle', 'user', 'recycle', '回收站', 'btn btn-xs btn-white | fa fa-recycle  bigger-120', '{\"status\":\"5\"}', '8', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('20', 'user_recycle_restore', 'user_recycle', 'restore', '还原', 'btn btn-xs btn-white | fa fa-refresh  bigger-120', '/user/restore', '1', '4', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('21', 'user_recycle_remove', 'user_recycle', 'remove', '彻底删除', 'btn btn-xs btn-white  btn-danger | fa fa fa-times bigger-120', '/user/remove', '2', '4', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('22', 'user_recycle_back', 'user_recycle', 'back', '返回', 'btn btn-xs btn-white | fa fa-undo  bigger-120', null, '3', '4', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('23', 'user_roleAssign', 'user', 'assign', '角色分配', 'btn btn-xs btn-white | fa fa-users bigger-120', '/user/roleAssign', '9', '3', null, 'user_roleAssign.html', '350*500', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('24', 'user_extrole', 'user', 'agent', '权限代理', 'btn btn-xs btn-white | fa fa-wrench  bigger-120', '/user/extrole', '10', '3', null, 'user_extrole.html', null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('25', 'menu', 'system', null, '菜单管理', 'fa-tasks', '/menu/', '3', '2', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('26', 'menu_add', 'menu', 'addex', '菜单新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/menu/add', '1', '3', null, 'menu_add.html', '800*430', '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('27', 'menu_edit', 'menu', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/menu/edit', '2', '3', null, 'menu_edit.html', '800*430', '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('28', 'menu_del', 'menu', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/menu/del', '3', '3', null, null, null, '1', '0', null, '1');
INSERT INTO `tfw_menu` VALUES ('29', 'menu_view', 'menu', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/menu/view', '4', '3', null, 'menu_view.html', '800*430', '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('30', 'menu_recycle', 'menu', 'recycle', '回收站', 'btn btn-xs btn-white | fa fa-recycle  bigger-120', '{\"status\":\"2\"}', '5', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('31', 'menu_recycle_restore', 'menu_recycle', 'restore', '还原', 'btn btn-xs btn-white | fa fa-refresh  bigger-120', '/menu/restore', '1', '4', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('32', 'menu_recycle_remove', 'menu_recycle', 'remove', '彻底删除', 'btn btn-xs btn-white  btn-danger | fa fa fa-times bigger-120', '/menu/remove', '2', '4', null, null, null, '1', '0', null, '1');
INSERT INTO `tfw_menu` VALUES ('33', 'menu_recycle_back', 'menu_recycle', 'back', '返回', 'btn btn-xs btn-white | fa fa-undo  bigger-120', null, '3', '4', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('34', 'dict', 'system', null, '字典管理', 'fa fa-book', '/dict/', '4', '2', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('35', 'dict_add', 'dict', 'addex', '字典新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/dict/add', '1', '3', null, 'dict_add.html', '800*390', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('36', 'dict_edit', 'dict', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/dict/edit', '2', '3', null, 'dict_edit.html', '800*390', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('37', 'dict_remove', 'dict', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/dict/remove', '3', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('38', 'dict_view', 'dict', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/dict/view', '4', '3', null, 'dict_view.html', '800*390', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('39', 'dept', 'system', null, '部门管理', 'fa fa-users', '/dept/', '5', '2', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('40', 'dept_add', 'dept', 'addex', '部门新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/dept/add', '1', '3', null, 'dept_add.html', '800*340', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('41', 'dept_edit', 'dept', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/dept/edit', '2', '3', null, 'dept_edit.html', '800*340', '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('42', 'dept_remove', 'dept', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/dept/remove', '3', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('43', 'dept_view', 'dept', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/dept/view', '4', '3', null, 'dept_view.html', '800*340', '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('44', 'attach', 'system', null, '附件管理', 'fa fa-paperclip', '/attach/', '6', '2', null, 'attach.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('45', 'attach_add', 'attach', 'add', '新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/attach/add', '1', '3', null, 'attach_add.html', '800*450', '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('46', 'attach_edit', 'attach', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/attach/edit', '2', '3', null, 'attach_edit.html', '800*290', '1', '0', null, '0');
INSERT INTO `tfw_menu` VALUES ('47', 'attach_remove', 'attach', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/attach/remove', '3', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('48', 'attach_view', 'attach', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/attach/view', '4', '3', null, 'attach_view.html', '800*450', '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('49', 'attach_download', 'attach', 'download', '下载', 'btn btn-xs btn-white | fa fa-paperclip bigger-120', '/attach/download', '5', '3', null, null, null, '1', null, null, '0');
INSERT INTO `tfw_menu` VALUES ('56', 'parameter', 'system', null, '参数化管理', 'fa-tags', '/parameter/', '9', '2', null, 'parameter.html', null, '1', '0', '1', '0');
INSERT INTO `tfw_menu` VALUES ('57', 'parameter_add', 'parameter', 'add', '新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/parameter/add', '1', '3', null, 'parameter_add.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('58', 'parameter_edit', 'parameter', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/parameter/edit', '2', '3', null, 'parameter_edit.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('59', 'parameter_del', 'parameter', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/parameter/del', '3', '3', null, null, null, '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('60', 'parameter_view', 'parameter', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/parameter/view', '4', '3', null, 'parameter_view.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('61', 'parameter_recycle', 'parameter', 'recycle', '回收站', 'btn btn-xs btn-white | fa fa-recycle  bigger-120', '{\"status\":\"5\"}', '5', '3', null, 'parameter_recycle.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('62', 'parameter_recycle_restore', 'parameter_recycle', 'restore', '还原', 'btn btn-xs btn-white | fa fa-refresh  bigger-120', '/parameter/restore', '1', '4', null, null, null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('63', 'parameter_recycle_remove', 'parameter_recycle', 'remove', '彻底删除', 'btn btn-xs btn-white  btn-danger | fa fa fa-times bigger-120', '/parameter/remove', '2', '4', null, null, null, '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('64', 'parameter_recycle_back', 'parameter_recycle', 'back', '返回', 'btn btn-xs btn-white | fa fa-undo  bigger-120', null, '3', '4', null, null, null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('65', 'druid', 'system', null, '连接池监视', 'fa-arrows-v', '/druid', '10', '2', null, null, null, '1', '0', null, '1');
INSERT INTO `tfw_menu` VALUES ('81', 'log', 'system', null, '日志管理', 'fa-tasks', null, '11', '2', null, null, null, '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('82', 'olog', 'log', null, '操作日志', 'fa-database', '/olog/', '1', '3', null, 'olog.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('83', 'llog', 'log', null, '登录日志', 'fa-sign-in', '/llog/', '2', '3', null, 'llog.html', null, '1', '0', '1', '0');
INSERT INTO `tfw_menu` VALUES ('84', 'olog_add', 'olog', 'add', '新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/olog/add', '1', '4', null, 'olog_add.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('85', 'olog_edit', 'olog', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/olog/edit', '2', '4', null, 'olog_edit.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('86', 'olog_remove', 'olog', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/olog/remove', '3', '4', null, null, null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('87', 'olog_view', 'olog', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/olog/view', '4', '4', null, 'olog_view.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('88', 'llog_add', 'llog', 'add', '新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/llog/add', '1', '4', null, 'llog_add.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('89', 'llog_edit', 'llog', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/llog/edit', '2', '4', null, 'llog_edit.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('90', 'llog_remove', 'llog', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/llog/remove', '3', '4', null, null, null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('91', 'llog_view', 'llog', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/llog/view', '4', '4', null, 'llog_view.html', null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('92', 'office', '0', null, '工作台', 'fa fa-desktop', null, '1', '1', null, null, null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('93', 'notice', 'office', null, '通知公告', 'fa fa-bell', '/notice/', '1', '2', null, null, null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('94', 'notice_add', 'notice', 'add', '新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/notice/add', '1', '3', null, null, '800*500', '1', '0', '0', '1');
INSERT INTO `tfw_menu` VALUES ('95', 'notice_edit', 'notice', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/notice/edit', '2', '3', null, null, '800*500', '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('96', 'notice_remove', 'notice', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/notice/remove', '3', '3', null, null, null, '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('97', 'notice_view', 'notice', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/notice/view', '4', '3', null, null, '800*500', '1', '0', '0', '0');
INSERT INTO `tfw_menu` VALUES ('98', 'online', 'system', '', '在线开发', 'fa-rocket', null, '12', '2', null, null, '800*520', '1', '0', null, '1');
INSERT INTO `tfw_menu` VALUES ('99', 'generate', 'online', null, '代码生成', 'fa-gavel', '/generate/', '1', '3', null, null, '800*520', '1', '0', null, '1');
INSERT INTO `tfw_menu` VALUES ('100', 'generate_add', 'generate', 'add', '新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/generate/add', '1', '4', null, null, '800*420', '1', '0', null, '3');
INSERT INTO `tfw_menu` VALUES ('101', 'generate_edit', 'generate', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/generate/edit', '2', '4', null, null, '800*420', '1', '0', null, '3');
INSERT INTO `tfw_menu` VALUES ('102', 'generate_remove', 'generate', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/generate/remove', '3', '4', null, null, '800*520', '1', '0', null, '0');
INSERT INTO `tfw_menu` VALUES ('103', 'generate_view', 'generate', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/generate/view', '4', '4', null, null, '800*420', '1', '0', null, '3');
INSERT INTO `tfw_menu` VALUES ('104', 'generate_gencode', 'generate', 'gencode', '代码生成', 'btn btn-xs btn-white | fa fa-gavel bigger-120', '/generate/gencode', '5', '4', null, null, '800*520', '1', '0', null, '1');
INSERT INTO `tfw_menu` VALUES ('105', 'blog', 'office', '', '博客文章', 'fa fa-coffee', '/blog/', '2', '2', null, null, '800*520', '1', '1', null, '0');
INSERT INTO `tfw_menu` VALUES ('106', 'blog_add', 'blog', 'add', '新增', 'btn btn-xs btn-white | fa fa-floppy-o bigger-120', '/blog/add', '1', '3', null, null, '800*520', '1', '0', null, '0');
INSERT INTO `tfw_menu` VALUES ('107', 'blog_edit', 'blog', 'edit', '修改', 'btn btn-xs btn-white | fa fa-pencil  bigger-120', '/blog/edit', '2', '3', null, null, '800*520', '1', '0', null, '0');
INSERT INTO `tfw_menu` VALUES ('108', 'blog_remove', 'blog', 'remove', '删除', 'btn btn-xs btn-white | fa fa-times  bigger-120', '/blog/remove', '3', '3', null, null, '800*520', '1', '0', null, '0');
INSERT INTO `tfw_menu` VALUES ('109', 'blog_view', 'blog', 'view', '查看', 'btn btn-xs btn-white | fa fa-eye bigger-120', '/blog/view', '4', '3', null, null, '800*520', '1', '0', null, '0');
INSERT INTO `tfw_operation_log` VALUES ('216', '异常日志', '1', null, 'com.sun.proxy.$Proxy27 cannot be cast to org.springframework.web.multipart.MultipartHttpServletRequest', '2016-02-17 16:26:13', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('217', '异常日志', '1', null, 'write javaBean error', '2016-02-17 16:43:12', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('218', '异常日志', '1', null, '-1', '2016-02-17 16:57:21', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('219', '异常日志', '1', null, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: ORA-01722: 无效数字\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_tfw_tzgg (f_dt_fbsj,f_vc_bt,f_it_xl) values (?,?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-01722: 无效数字\n\n; SQL []; ORA-01722: 无效数字\n; nested exception is java.sql.SQLSyntaxErrorException: ORA-01722: 无效数字\n', '2016-02-18 10:51:46', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('220', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'f_it_xl\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #3 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列类型: 1111', '2016-02-18 10:58:01', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('221', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00942: 表或视图不存在\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from TMSP_ATTACH where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00942: 表或视图不存在\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00942: 表或视图不存在\n', '2016-02-18 15:10:05', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('231', '异常日志', '1', null, '文件不存在!', '2016-02-19 08:48:49', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('232', '异常日志', '1', null, '文件不存在!', '2016-02-19 08:49:02', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('233', '异常日志', '1', null, '文件不存在!', '2016-02-19 08:49:39', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('234', '异常日志', '1', null, '文件不存在!', '2016-02-19 08:50:22', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('235', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'code\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-19 13:29:00', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('236', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'code\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-19 13:29:52', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('237', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'code\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-19 13:33:12', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('238', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE CONCAT(CONCAT(\'%\', ?), \'%\')) AND (code LIKE CONCAT(CONCAT(\'%\', ?), \'%\'))\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n', '2016-02-19 13:35:17', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('239', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'name\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #1 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列类型: 1111', '2016-02-19 13:36:31', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('240', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'name\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #1 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列类型: 1111', '2016-02-19 13:37:11', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('241', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'name\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #1 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列类型: 1111', '2016-02-19 13:40:07', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('242', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE CONCAT(CONCAT(\'%\', ?), \'%\')) AND (code LIKE CONCAT(CONCAT(\'%\', ?), \'%\'))\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n', '2016-02-19 13:42:08', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('243', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE \'%新增%\') AND (code LIKE \'%user%\')\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n', '2016-02-19 13:48:24', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('244', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM (SELECT m.*, d.name AS DIC_STATUS FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE CONCAT(CONCAT(\'%\', ?), \'%\')) AND (code LIKE CONCAT(CONCAT(\'%\', ?), \'%\'))) blade_statement\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n', '2016-02-19 13:50:40', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('245', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM (SELECT m.*, d.name AS DIC_STATUS FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE CONCAT(CONCAT(\'%\', ?), \'%\'))) blade_statement\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n', '2016-02-19 13:54:35', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('246', '异常日志', '1', null, 'Index: 0, Size: 0', '2016-02-19 14:00:39', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('247', '异常日志', '1', null, 'Index: 0, Size: 0', '2016-02-19 14:00:41', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('248', '异常日志', '1', null, 'Index: 0, Size: 0', '2016-02-19 14:01:13', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('249', '异常日志', '1', null, 'Index: 0, Size: 0', '2016-02-19 14:04:21', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('250', '异常日志', '1', null, 'Index: 0, Size: 0', '2016-02-19 14:04:58', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('251', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"R\".\"ID\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from ( select tmp_page.*, rownum row_id from ( SELECT * FROM (SELECT r.*, d.simpleName DEPTNAME, (SELECT name FROM tfw_role WHERE id = r.pId) PNAME FROM tfw_role r LEFT JOIN tfw_dept d ON r.deptId = d.id) blade_statement WHERE 1 = 1 order by r.id asc ) tmp_page where rownum <= ? ) where row_id > ?\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"R\".\"ID\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"R\".\"ID\": 标识符无效\n', '2016-02-19 14:08:19', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('252', '异常日志', '21', null, 'java.sql.SQLIntegrityConstraintViolationException: ORA-00001: 违反唯一约束条件 (TFRAMEWORK.SYS_C0041927)\n', '2016-02-19 14:10:58', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('253', '异常日志', '21', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select            bg.*,          nr.F_TX_BGNR,          u1.name DIC_F_IT_CJR,          u2.name DIC_F_IT_XGR                from           tb_tfw_gzbg bg           left join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl           left join tfw_user u1 on bg.f_it_cjr=u1.id           left join tfw_user u2 on bg.f_it_xgr=u2.id) blade_statement where 1=1  where 1=1 and bg.f_it_cjr = ?) tmp_count\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n', '2016-02-19 14:14:47', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('254', '异常日志', '21', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select            bg.*,          nr.F_TX_BGNR,          u1.name DIC_F_IT_CJR,          u2.name DIC_F_IT_XGR                from           tb_tfw_gzbg bg           left join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl           left join tfw_user u1 on bg.f_it_cjr=u1.id           left join tfw_user u2 on bg.f_it_xgr=u2.id) blade_statement where 1=1  where 1=1 and bg.f_it_cjr = ?) tmp_count\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n', '2016-02-19 14:15:23', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('255', '异常日志', '21', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select            bg.*,          nr.F_TX_BGNR,          u1.name DIC_F_IT_CJR,          u2.name DIC_F_IT_XGR                from           tb_tfw_gzbg bg           left join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl           left join tfw_user u1 on bg.f_it_cjr=u1.id           left join tfw_user u2 on bg.f_it_xgr=u2.id) blade_statement where 1=1 and bg.f_it_cjr = ? where 1=1 ) tmp_count\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n', '2016-02-19 14:17:19', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('256', '异常日志', '21', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_CJR\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM (SELECT bg.*, nr.F_TX_BGNR, u1.name DIC_F_IT_CJR, u2.name DIC_F_IT_XGR FROM tb_tfw_gzbg bg LEFT JOIN tb_tfw_gzbgnr nr ON bg.f_it_xl = nr.f_it_bgxl LEFT JOIN tfw_user u1 ON bg.f_it_cjr = u1.id LEFT JOIN tfw_user u2 ON bg.f_it_xgr = u2.id) blade_statement WHERE 1 = 1 AND bg.f_it_cjr = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_CJR\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_CJR\": 标识符无效\n', '2016-02-19 14:18:34', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('257', '异常日志', '21', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_XL\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from ( select tmp_page.*, rownum row_id from ( SELECT * FROM (SELECT bg.*, nr.F_TX_BGNR, u1.name DIC_F_IT_CJR, u2.name DIC_F_IT_XGR FROM tb_tfw_gzbg bg LEFT JOIN tb_tfw_gzbgnr nr ON bg.f_it_xl = nr.f_it_bgxl LEFT JOIN tfw_user u1 ON bg.f_it_cjr = u1.id LEFT JOIN tfw_user u2 ON bg.f_it_xgr = u2.id) blade_statement WHERE 1 = 1 AND f_it_cjr = ? order by bg.F_IT_XL desc ) tmp_page where rownum <= ? ) where row_id > ?\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_XL\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_XL\": 标识符无效\n', '2016-02-19 14:20:09', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('258', '异常日志', '1', null, 'java.sql.SQLSyntaxErrorException: ORA-00911: 无效字符\n', '2016-02-20 14:03:39', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('261', '异常日志', '1', null, 'Required String parameter \'type\' is not present', '2016-02-23 14:27:19', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('262', '异常日志', '1', null, 'Mapped Statements collection does not contain value for 0', '2016-02-23 14:27:42', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('263', '异常日志', '1', null, 'Mapped Statements collection does not contain value for 0', '2016-02-23 14:28:13', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('264', '异常日志', '1', null, 'Mapped Statements collection does not contain value for 0', '2016-02-23 14:28:33', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('265', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值\r\n### The error may involve SELECT.0\r\n### The error occurred while executing a query\r\n### SQL: \r\n### Cause: java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值\n; uncategorized SQLException for SQL []; SQL state [99999]; error code [17104]; 要执行的 SQL 语句不得为空白或空值; nested exception is java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值', '2016-02-23 14:30:08', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('266', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值\r\n### The error may involve SELECT.0\r\n### The error occurred while executing a query\r\n### SQL: \r\n### Cause: java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值\n; uncategorized SQLException for SQL []; SQL state [99999]; error code [17104]; 要执行的 SQL 语句不得为空白或空值; nested exception is java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值', '2016-02-23 14:30:35', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('267', '异常日志', '1', null, 'Mapped Statements collection does not contain value for ', '2016-02-23 15:27:09', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('268', '异常日志', '1', null, 'Mapped Statements collection does not contain value for ', '2016-02-23 15:27:25', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('269', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n', '2016-02-23 16:10:49', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('270', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n', '2016-02-23 16:10:50', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('271', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n', '2016-02-23 16:13:59', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('272', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n', '2016-02-23 16:14:03', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('273', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n', '2016-02-23 16:14:06', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('274', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n', '2016-02-23 16:19:43', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('275', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n', '2016-02-23 16:19:44', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('276', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n', '2016-02-23 16:21:50', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('277', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n', '2016-02-23 16:21:52', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('278', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n', '2016-02-23 16:23:14', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('279', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n', '2016-02-23 16:23:33', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('280', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n', '2016-02-23 16:24:34', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('281', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equal\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 16:47:44', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('282', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equal\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 16:48:25', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('283', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equal\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 16:49:58', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('284', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equ\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 16:52:15', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('285', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equal\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 16:55:44', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('286', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 16:57:31', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('287', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 16:59:17', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('288', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 16:59:38', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('289', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:00:02', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('290', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:00:20', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('291', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:02:13', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('292', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:03:19', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('293', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:03:56', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('294', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:06:42', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('295', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:07:36', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('296', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:07:50', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('297', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #1 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:11:19', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('298', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:15:33', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('299', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-23 17:15:35', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('300', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-24 08:38:32', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('301', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-24 08:38:40', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('302', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-24 08:38:43', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('303', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-24 08:41:40', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('304', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-24 08:41:48', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('305', '异常日志', '1', null, 'Expected one result (or null) to be returned by selectOne(), but found: 2', '2016-02-24 08:41:55', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('306', '异常日志', '1', null, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引', '2016-02-24 08:43:14', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('307', '异常日志', '1', null, 'Expected one result (or null) to be returned by selectOne(), but found: 2', '2016-02-24 08:45:51', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('308', '异常日志', '1', null, 'Expected one result (or null) to be returned by selectOne(), but found: 2', '2016-02-24 08:47:36', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('309', '异常日志', '1', null, 'Expected one result (or null) to be returned by selectOne(), but found: 2', '2016-02-24 08:53:09', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('310', '异常日志', '1', null, 'Expected one result (or null) to be returned by selectOne(), but found: 2', '2016-02-24 08:53:52', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('311', '异常日志', '1', null, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"USERID\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from tfw_user where userid = 1\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"USERID\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"USERID\": 标识符无效\n', '2016-02-24 09:57:54', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('312', '异常日志', '1', null, 'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'tframework.tfw_user\' doesn\'t exist', '2016-02-24 14:08:54', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('313', '异常日志', '1', null, 'java.lang.IllegalAccessException: Class org.beetl.sql.core.mapping.BeanProcessor can not access a member of class com.tonbusoft.core.toolbox.Maps with modifiers \"private\"', '2016-02-24 16:43:38', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('314', '异常日志', '1', null, 'SQL Script Error:>>04:43:48:变量未定义(VAR_NOT_DEFINED):jds 位于1行 资源:auto._gen_select * from tfw_me', '2016-02-24 16:43:48', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('315', '异常日志', '1', null, 'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1\',\'2\',\'3\',\'4\',\'5\',\'6\',\'7\',\'8\',\'9\',\'10\' \nlimit 0 , 5\' at line 1', '2016-02-24 16:44:46', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('316', '异常日志', '1', null, 'java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n', '2016-02-24 16:55:09', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('317', '异常日志', '1', null, 'java.lang.InstantiationException', '2016-02-25 13:16:46', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('318', '异常日志', '1', null, 'java.lang.InstantiationException', '2016-02-25 13:17:33', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('319', '异常日志', '1', null, 'java.lang.InstantiationException', '2016-02-25 13:18:37', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('320', '异常日志', '1', null, 'java.lang.IllegalAccessException: Class org.beetl.sql.core.mapping.BeanProcessor can not access a member of class com.tonbusoft.core.toolbox.Maps with modifiers \"private\"', '2016-02-25 13:30:23', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('321', '异常日志', '1', null, '在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.list]相关的SQL', '2016-03-19 11:17:04', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('322', '异常日志', '1', null, '在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.list]相关的SQL', '2016-03-19 11:23:52', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('324', '异常日志', '1', null, '在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL', '2016-03-19 14:43:28', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('325', '异常日志', '1', null, '在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL', '2016-03-19 15:23:03', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('326', '异常日志', '1', null, '在 /beetlsql/mysql/reportMapper.sql 和 /beetlsql/mysql/reportMapper.md 和 /beetlsql/reportMapper.sql 和 /beetlsql/reportMapper.md 和  未找到[id=reportMapper.list]相关的SQL', '2016-03-21 09:11:45', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('327', '异常日志', '1', null, '在 /beetlsql/mysql/reportMapper.sql 和 /beetlsql/mysql/reportMapper.md 和 /beetlsql/reportMapper.sql 和 /beetlsql/reportMapper.md 和  未找到[id=reportMapper.list]相关的SQL', '2016-03-21 09:16:29', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('328', '异常日志', '1', null, 'SQL Script Error:>>09:17:12:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec', '2016-03-21 09:17:12', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('329', '异常日志', '1', null, 'SQL Script Error:>>09:18:49:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec', '2016-03-21 09:18:49', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('330', '异常日志', '1', null, 'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'from\r\ntb_tfw_gzbg bg\r\nleft join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl\r\nlef\' at line 3', '2016-03-21 09:19:11', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('331', '异常日志', '1', null, 'SQL Script Error:>>09:19:54:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec', '2016-03-21 09:19:54', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('332', '异常日志', '1', null, 'SQL Script Error:>>09:20:01:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec', '2016-03-21 09:20:01', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('333', '异常日志', '1', null, 'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'from\r\ntb_tfw_gzbg bg\r\nleft join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl\r\nlef\' at line 3', '2016-03-21 09:20:49', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('334', '异常日志', '1', null, 'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'from\r\ntb_tfw_gzbg bg\r\nleft join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl\r\nlef\' at line 3', '2016-03-21 09:21:40', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('335', '异常日志', '1', null, 'SQL Script Error:>>09:22:12:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec', '2016-03-21 09:22:12', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('336', '异常日志', '1', null, 'SQL Script Error:>>09:22:21:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec', '2016-03-21 09:22:21', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('337', '异常日志', '1', null, 'SQL Script Error:>>09:23:25:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec', '2016-03-21 09:23:25', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('338', '异常日志', '1', null, 'java.util.ArrayList cannot be cast to java.util.Map', '2016-03-21 09:24:49', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('339', '异常日志', '1', null, '在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL', '2016-03-21 09:30:26', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('340', '异常日志', '1', null, '在 /beetlsql/mysql/newsMapper.sql 和 /beetlsql/mysql/newsMapper.md 和 /beetlsql/newsMapper.sql 和 /beetlsql/newsMapper.md 和  未找到[id=newsMapper.data]相关的SQL', '2016-03-21 09:35:03', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('341', '异常日志', '1', null, '在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL', '2016-03-21 10:57:21', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('342', '异常日志', '1', null, '在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL', '2016-03-21 10:57:45', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('343', '异常日志', '1', null, '在 /beetlsql/mysql/notice.sql 和 /beetlsql/mysql/notice.md 和 /beetlsql/notice.sql 和 /beetlsql/notice.md 和  未找到[id=notice.list]相关的SQL', '2016-03-21 10:58:14', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('344', '异常日志', '1', null, '删除失败！', '2016-03-30 13:35:12', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('345', '异常日志', '1', null, '删除失败！', '2016-03-30 13:35:58', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('346', '异常日志', '1', null, '未取到ID的值,无法修改!', '2016-03-31 08:56:32', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('347', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-01 11:23:21', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('348', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-01 11:30:07', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('349', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-01 12:06:47', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('350', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-01 12:08:32', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('351', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-01 12:19:34', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('352', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-05 08:40:25', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('353', '异常日志', '1', null, '数据库中此数据不存在，可能数据已经被删除，请刷新数据后在操作', '2016-04-05 08:40:33', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('354', '异常日志', '1', null, 'com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'F_CR_FBZT\' at row 1', '2016-04-07 14:08:08', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('355', '异常日志', '1', null, 'Inject [height] error!', '2016-04-07 16:27:32', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('356', '异常日志', '1', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=dept\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'', '2016-04-09 10:07:35', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('357', '异常日志', '1', null, 'Mapped Statements collection does not contain value for 0', '2016-04-09 10:08:46', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('358', '异常日志', '1', null, 'Mapped Statements collection does not contain value for 0', '2016-04-09 10:09:22', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('359', '异常日志', '1', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=dept\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'', '2016-04-09 10:11:16', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('360', '异常日志', '1', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=dept\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'', '2016-04-09 10:11:28', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('361', '异常日志', '1', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=dept\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'', '2016-04-09 10:11:58', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('362', '异常日志', '1', null, 'Mapped Statements collection does not contain value for 0', '2016-04-09 10:12:36', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('363', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 10:37:24', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('364', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 10:37:27', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('365', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-09 10:37:53', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('366', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 10:37:59', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('367', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 10:38:04', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('368', '异常日志', '1', null, '数据库中此数据不存在，可能数据已经被删除，请刷新数据后在操作', '2016-04-09 10:38:18', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('369', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 11:00:13', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('370', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 11:30:54', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('371', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 11:31:16', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('372', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 11:31:34', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('373', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 11:31:46', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('374', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 13:42:14', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('375', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 13:43:06', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('376', '异常日志', '1', null, 'Required String parameter \'where\' is not present', '2016-04-09 13:43:20', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('377', '异常日志', '1', null, 'syntax error, expect {, actual int', '2016-04-09 13:46:01', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('378', '异常日志', '1', null, 'syntax error, expect {, actual int', '2016-04-09 13:46:15', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('379', '异常日志', '1', null, 'syntax error, expect {, actual int', '2016-04-09 13:46:25', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('380', '异常日志', '1', null, 'syntax error, expect {, actual EOF', '2016-04-09 13:48:11', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('381', '异常日志', '1', null, 'syntax error, expect {, actual EOF', '2016-04-09 13:48:26', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('382', '异常日志', '1', null, '删除失败！', '2016-04-11 10:11:36', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('383', '异常日志', '1', null, '删除失败！', '2016-04-11 10:11:48', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('384', '异常日志', '1', null, 'Required String parameter \'inter\' is not present', '2016-04-12 09:24:15', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('385', '异常日志', '1', null, 'Required String parameter \'inter\' is not present', '2016-04-12 09:24:20', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('386', '异常日志', '1', null, 'Required String parameter \'inter\' is not present', '2016-04-12 09:24:59', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('387', '异常日志', '1', null, 'Required String parameter \'inter\' is not present', '2016-04-12 09:25:05', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('388', '异常日志', '1', null, 'Required String parameter \'inter\' is not present', '2016-04-12 09:27:57', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('389', '异常日志', '1', null, 'Required String parameter \'inter\' is not present', '2016-04-12 09:28:12', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('390', '异常日志', '1', null, 'Required String parameter \'intercept\' is not present', '2016-04-12 09:30:47', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('391', '异常日志', '1', null, 'Instance class [10] error!', '2016-04-12 09:32:45', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('392', '异常日志', '1', null, 'Instance class [] error!', '2016-04-12 09:34:03', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('393', '异常日志', '1', null, 'Instance class [] error!', '2016-04-12 09:34:36', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('394', '异常日志', '1', null, 'Instance class [] error!', '2016-04-12 09:35:52', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('395', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-12 16:43:40', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('396', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-12 16:44:01', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('397', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-12 16:44:11', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('398', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-12 16:45:01', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('399', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-12 16:49:38', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('400', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-04-12 16:50:08', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('401', '异常日志', '1', null, '已经有XXXX......', '2016-05-07 15:31:01', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('402', '异常日志', '1', null, 'Could not find acceptable representation', '2016-05-10 09:35:31', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('403', '异常日志', '1', null, 'Could not find acceptable representation', '2016-05-10 09:37:13', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('404', '异常日志', '1', null, 'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1\'\' at line 1', '2016-05-16 14:24:36', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('405', '异常日志', '1', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id in (1,2,3)) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select r.*,d.simpleName DEPTNAME,(select name from tfw_role where id=r.pId) PNAME from tfw_role r left join tfw_dept d on r.deptId=d.id) blade_statement where 1=1 where id in (1,2,3)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id in (1,2,3)) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id in (1,2,3)) tmp_count\' at line 1', '2016-06-03 08:45:03', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('406', '异常日志', '1', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where r.id in (1,2,3)) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select r.*,d.simpleName DEPTNAME,(select name from tfw_role where id=r.pId) PNAME from tfw_role r left join tfw_dept d on r.deptId=d.id) blade_statement where 1=1 where r.id in (1,2,3)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where r.id in (1,2,3)) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where r.id in (1,2,3)) tmp_count\' at line 1', '2016-06-03 08:46:18', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('407', '异常日志', '21', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select d.*,(select simpleName from tfw_dept  where id=d.pId) PNAME from tfw_dept d) blade_statement where 1=1 and id in (11,)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1', '2016-06-03 09:00:55', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('408', '异常日志', '21', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select d.*,(select simpleName from tfw_dept  where id=d.pId) PNAME from tfw_dept d) blade_statement where 1=1 and id in (11,)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1', '2016-06-03 09:01:16', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('409', '异常日志', '21', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select d.*,(select simpleName from tfw_dept  where id=d.pId) PNAME from tfw_dept d) blade_statement where 1=1 and id in (11,)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1', '2016-06-03 09:01:23', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('410', '异常日志', '21', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select d.*,(select simpleName from tfw_dept  where id=d.pId) PNAME from tfw_dept d) blade_statement where 1=1 and id in (11,)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1', '2016-06-03 09:02:00', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('411', '异常日志', '22', null, '当前用户无权操作!', '2016-06-03 09:34:11', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('412', '异常日志', '22', null, '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and id in (5)\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id \"id\",pId \"pId\",name as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_ROLE order by pId,num asc and id in (5)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and id in (5)\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and id in (5)\' at line 1', '2016-06-03 09:48:07', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('413', '异常日志', '1', null, 'For input string: \"administrator\"', '2016-06-03 15:04:25', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('414', '异常日志', '1', null, 'For input string: \"administrator\"', '2016-06-03 15:05:02', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('415', '异常日志', '1', null, 'For input string: \"administrator\"', '2016-06-03 15:05:45', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('416', '异常日志', '1', null, 'For input string: \"administrator\"', '2016-06-03 15:07:23', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('417', '异常日志', '1', null, 'table \"tb_yw_blog\" not exist', '2016-06-12 16:54:39', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('418', '异常日志', '1', null, 'table \"tb_yw_tzgg\" not exist', '2016-06-12 16:55:12', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('419', '异常日志', '1', null, 'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'', '2016-06-18 09:54:45', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('420', '异常日志', '1', null, 'Inject [num] error!', '2016-09-29 14:27:28', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('421', '异常日志', '1', null, 'Inject [num] error!', '2016-09-29 14:29:48', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('422', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-09-29 15:07:56', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('423', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-09-29 15:08:02', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('424', '异常日志', '1', null, 'java.lang.reflect.InvocationTargetException', '2016-09-30 10:37:54', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('425', '异常日志', '1', null, '文件不存在!', '2016-09-30 10:51:19', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('426', '异常日志', '1', null, '文件不存在!', '2016-09-30 10:53:15', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('427', '异常日志', '1', null, 'java.lang.reflect.InvocationTargetException', '2016-09-30 10:56:37', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('428', '异常日志', '1', null, 'java.lang.reflect.InvocationTargetException', '2016-09-30 10:59:43', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('429', '异常日志', '1', null, 'java.lang.reflect.InvocationTargetException', '2016-09-30 11:00:13', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('430', '异常日志', '1', null, 'java.lang.reflect.InvocationTargetException', '2016-09-30 11:00:58', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('431', '异常日志', '1', null, '文件不存在!', '2016-09-30 11:15:43', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('432', '异常日志', '1', null, 'Inject [createtime] error!', '2016-09-30 11:27:22', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('433', '异常日志', '1', null, 'Inject [createtime] error!', '2016-09-30 11:27:27', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('434', '异常日志', '1', null, '文件不存在!', '2016-09-30 11:29:37', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('435', '异常日志', '1', null, '文件不存在!', '2016-09-30 11:29:44', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('436', '异常日志', '1', null, '文件不存在!', '2016-09-30 14:08:10', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('437', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-09-30 14:17:04', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('438', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-09-30 14:22:48', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('439', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-09-30 14:24:58', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('440', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-09-30 14:37:59', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('441', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-09-30 14:47:35', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('442', '异常日志', '1', null, '表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑', '2016-09-30 15:45:41', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('445', '修改', '1', null, '[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:TFW_USER.EMAIL=&TFW_USER.PASSWORD=ab857cd259f2c40b551f448fdf553719&VERSION=4&TFW_USER.BIRTHDAY=2016-09-29 09:27:30.0&TFW_USER.NAME=阿斯顿飞过&jstime=1475907985426&password=ab857cd259f2c40b551f448fdf553719&TFW_USER.SEX=2&token_TFW_USER.DEPTID=&TFW_USER.ID=23&TFW_USER.PHONE=1', '2016-10-08 14:26:25', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('446', '删除', '1', null, '[类名]:com.ikkong.system.controller.OlogController  [方法]:remove  [参数]:ids=444', '2016-10-08 14:27:06', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('447', '新增', '1', null, '[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:TFW_USER.EMAIL=&TFW_USER.PASSWORD=&TFW_USER.BIRTHDAY=&TFW_USER.ACCOUNT=1&token_TFW_USER.SEX=&TFW_USER.NAME=&jstime=1475908214145&password=&token_TFW_USER.DEPTID=&TFW_USER.PHONE=', '2016-10-08 14:30:14', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('448', '删除', '1', null, '[类名]:com.ikkong.system.controller.GenerateController  [方法]:remove  [参数]:ids=1', '2016-10-08 15:38:55', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('449', '新增', '1', null, '[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.pkname=f_it_id&tfw_generate.realpath=E:\\gen&tfw_generate.tablename=tb_tfw_blog&jstime=1475912962932&tfw_generate.name=blog&tfw_generate.modelname=Blog&tfw_generate.packagename=com.ikkong.platform', '2016-10-08 15:49:23', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('450', '异常日志', '1', null, 'table \"tb_tfw_blog\" not exist', '2016-10-08 15:49:31', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('451', '异常日志', '1', null, 'table \"tb_tfw_blog\" not exist', '2016-10-08 15:49:45', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('452', '异常日志', '1', null, 'table \"tb_tfw_blog\" not exist', '2016-10-08 15:51:16', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('453', '异常日志', '1', null, 'table \"tb_tfw_blog\" not exist', '2016-10-08 15:53:22', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('454', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-bell&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475915788520&tfw_menu.tips=&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 16:36:29', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('455', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475915951225&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 16:39:11', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('456', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475916429415&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 16:47:09', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('457', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475916488704&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 16:48:09', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('458', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475916548600&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 16:49:09', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('459', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475916709319&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 16:51:49', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('460', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475917286506&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 17:01:27', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('461', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475917302779&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 17:01:43', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('462', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475917340295&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2', '2016-10-08 17:02:20', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('463', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.url=/blog/add&tfw_menu.name=新增&tfw_menu.isopen=0&jstime=1475917386491&tfw_menu.tips=800*520&tfw_menu.alias=add&tfw_menu.code=blog_add&tfw_menu.pcode=blog&tfw_menu.levels=3&tfw_menu.num=1', '2016-10-08 17:03:06', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('464', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.url=/blog/edit&tfw_menu.name=修改&tfw_menu.isopen=0&jstime=1475917409828&tfw_menu.tips=800*520&tfw_menu.alias=edit&tfw_menu.code=blog_edit&tfw_menu.pcode=blog&tfw_menu.levels=3&tfw_menu.num=2', '2016-10-08 17:03:30', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('465', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.url=/blog/remove&tfw_menu.name=删除&tfw_menu.isopen=0&jstime=1475917420518&tfw_menu.tips=800*520&tfw_menu.alias=remove&tfw_menu.code=blog_remove&tfw_menu.pcode=blog&tfw_menu.levels=3&tfw_menu.num=3', '2016-10-08 17:03:41', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('466', '新增', '1', null, '[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.url=/blog/view&tfw_menu.name=查看&tfw_menu.isopen=0&jstime=1475917431191&tfw_menu.tips=800*520&tfw_menu.alias=view&tfw_menu.code=blog_view&tfw_menu.pcode=blog&tfw_menu.levels=3&tfw_menu.num=4', '2016-10-08 17:03:51', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('467', '新增', '1', null, '[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:ids=92,93,94,95,96,97,105,106,107,108,109,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104&roleId=1', '2016-10-08 17:04:05', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('468', '新增', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=1&tb_tfw_blog.f_it_content=jfinalblade go&tb_tfw_blog.f_it_title=jfinalblade&jstime=1475918201047&tb_tfw_blog.f_it_createtime=2016-10-08 17:15:45&tb_tfw_blog.f_it_del=1', '2016-10-08 17:16:41', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('469', '修改', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:tb_tfw_blog.version=&tb_tfw_blog.f_it_seq=1&token_tb_tfw_blog.f_it_createtime=2016-10-08 00:00:00&tb_tfw_blog.f_it_title=jfinalblade&token_tb_tfw_blog.f_it_content=jfinalblade go&jstime=1475979016098&tb_tfw_blog.f_it_del=2&tb_tfw_blog.f_it_id=1', '2016-10-09 10:10:16', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('470', '异常日志', '1', null, 'Inject [VERSION] error!', '2016-10-09 10:10:16', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('471', '修改', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:tb_tfw_blog.version=&tb_tfw_blog.f_it_seq=1&token_tb_tfw_blog.f_it_createtime=2016-10-08 00:00:00&tb_tfw_blog.f_it_title=jfinalblade&token_tb_tfw_blog.f_it_content=jfinalblade go&jstime=1475979144831&tb_tfw_blog.f_it_del=2&tb_tfw_blog.f_it_id=1', '2016-10-09 10:12:25', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('472', '异常日志', '1', null, 'Inject [VERSION] error!', '2016-10-09 10:12:25', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('473', '修改', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:tb_tfw_blog.version=0&tb_tfw_blog.f_it_seq=1&token_tb_tfw_blog.f_it_createtime=2016-10-08 00:00:00&tb_tfw_blog.f_it_title=jfinalblade&token_tb_tfw_blog.f_it_content=jfinalblade go&jstime=1475980484071&tb_tfw_blog.f_it_del=2&tb_tfw_blog.f_it_id=1', '2016-10-09 10:34:44', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('474', '修改', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:tb_tfw_blog.version=1&tb_tfw_blog.f_it_seq=1&token_tb_tfw_blog.f_it_createtime=2016-10-08 00:00:00&tb_tfw_blog.f_it_title=jfinalblade&token_tb_tfw_blog.f_it_content=jfinalblade go&jstime=1475980516068&tb_tfw_blog.f_it_del=1&tb_tfw_blog.f_it_id=1', '2016-10-09 10:35:16', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('475', '异常日志', '1', null, '在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.mysqllist]相关的SQL', '2016-10-09 14:18:52', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('476', '异常日志', '1', null, '在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.mysqllist]相关的SQL', '2016-10-09 14:21:19', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('477', '异常日志', '1', null, '在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.mysqllist]相关的SQL', '2016-10-09 14:21:43', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('478', '异常日志', '1', null, '在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.mysqllist]相关的SQL', '2016-10-09 14:24:01', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('479', '异常日志', '1', null, 'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'jblade.tmsp_role\' doesn\'t exist', '2016-10-09 14:26:35', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('480', '异常日志', '1', null, '[Ljava.lang.Object; cannot be cast to [Ljava.lang.String;', '2016-10-09 14:32:03', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('481', '异常日志', '1', null, '[Ljava.lang.Object; cannot be cast to [Ljava.lang.String;', '2016-10-09 14:36:01', '0', null);
INSERT INTO `tfw_operation_log` VALUES ('482', '新增', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=2&tb_tfw_blog.f_it_title=测试&token_tb_tfw_blog.f_it_content=<p style=\"text-align: center;\">111<br/></p>&jstime=1476086019286&tb_tfw_blog.f_it_createtime=2016-10-10 15:52:52&tb_tfw_blog.f_it_del=1', '2016-10-10 15:53:39', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('483', '删除', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:remove  [参数]:ids=2', '2016-10-10 15:57:53', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('484', '新增', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=2&tb_tfw_blog.f_it_content=<p style=\"text-align: center;\">111</p>&tb_tfw_blog.f_it_title=测试&jstime=1476087564124&tb_tfw_blog.f_it_createtime=2016-10-10 16:18:25&tb_tfw_blog.f_it_del=1', '2016-10-10 16:19:24', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('485', '修改', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:token_tb_tfw_blog.f_it_del=1&tb_tfw_blog.version=0&tb_tfw_blog.f_it_seq=2&tb_tfw_blog.f_it_content=<p style=\"text-align: center;\">112</p>&token_tb_tfw_blog.f_it_createtime=2016-10-10 00:00:00&tb_tfw_blog.f_it_title=测试&jstime=1476089895959&tb_tfw_blog.f_it_id=3', '2016-10-10 16:58:16', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('486', '新增', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=3&tb_tfw_blog.f_it_content=<p><img src=\"/upload/image/20161010/1476091111051005215.jpg\" style=\"\" title=\"1476091111051005215.jpg\"/></p><p><img src=\"/upload/image/20161010/1476091111054037337.jpg\" style=\"\" title=\"1476091111054037337.jpg\"/></p><p><img src=\"/upload/image/20161010/1476091111051097841.jpg\" style=\"\" title=\"1476091111051097841.jpg\"/></p><p><br/></p>&tb_tfw_blog.f_it_title=测试1&jstime=1476091128165&tb_tfw_blog.f_it_createtime=2016-10-10 17:08:41&tb_tfw_blog.f_it_del=1', '2016-10-10 17:18:48', '1', null);
INSERT INTO `tfw_operation_log` VALUES ('487', '新增', '1', null, '[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=4&tb_tfw_blog.f_it_content=<p><img src=\"http://ikkong.qiniudn.com/upload/image/20161011/1476170956158098341.jpg\" title=\"1476170956158098341\" alt=\"3 (12).jpg\"/></p>&tb_tfw_blog.f_it_title=测试qiniu&jstime=1476170998189&tb_tfw_blog.f_it_createtime=2016-10-11 15:27:53&tb_tfw_blog.f_it_del=1', '2016-10-11 15:29:58', '1', null);
INSERT INTO `tfw_parameter` VALUES ('1', '101', '100', '是否开启记录日志', '1', '1:是  2:否', '1', '9');
INSERT INTO `tfw_relation` VALUES ('1244', '1', '3');
INSERT INTO `tfw_relation` VALUES ('1245', '62', '3');
INSERT INTO `tfw_relation` VALUES ('1246', '64', '3');
INSERT INTO `tfw_relation` VALUES ('1247', '72', '3');
INSERT INTO `tfw_relation` VALUES ('1248', '73', '3');
INSERT INTO `tfw_relation` VALUES ('1249', '74', '3');
INSERT INTO `tfw_relation` VALUES ('1250', '75', '3');
INSERT INTO `tfw_relation` VALUES ('1251', '76', '3');
INSERT INTO `tfw_relation` VALUES ('1252', '77', '3');
INSERT INTO `tfw_relation` VALUES ('1253', '78', '3');
INSERT INTO `tfw_relation` VALUES ('1254', '79', '3');
INSERT INTO `tfw_relation` VALUES ('1255', '80', '3');
INSERT INTO `tfw_relation` VALUES ('1384', '72', '6');
INSERT INTO `tfw_relation` VALUES ('1385', '73', '6');
INSERT INTO `tfw_relation` VALUES ('1386', '74', '6');
INSERT INTO `tfw_relation` VALUES ('1387', '75', '6');
INSERT INTO `tfw_relation` VALUES ('1388', '76', '6');
INSERT INTO `tfw_relation` VALUES ('1389', '77', '6');
INSERT INTO `tfw_relation` VALUES ('1390', '78', '6');
INSERT INTO `tfw_relation` VALUES ('1391', '79', '6');
INSERT INTO `tfw_relation` VALUES ('1392', '80', '6');
INSERT INTO `tfw_relation` VALUES ('1393', '81', '6');
INSERT INTO `tfw_relation` VALUES ('1394', '82', '6');
INSERT INTO `tfw_relation` VALUES ('1395', '84', '6');
INSERT INTO `tfw_relation` VALUES ('1396', '85', '6');
INSERT INTO `tfw_relation` VALUES ('1397', '86', '6');
INSERT INTO `tfw_relation` VALUES ('1398', '87', '6');
INSERT INTO `tfw_relation` VALUES ('1399', '83', '6');
INSERT INTO `tfw_relation` VALUES ('1400', '88', '6');
INSERT INTO `tfw_relation` VALUES ('1401', '89', '6');
INSERT INTO `tfw_relation` VALUES ('1402', '90', '6');
INSERT INTO `tfw_relation` VALUES ('1403', '91', '6');
INSERT INTO `tfw_relation` VALUES ('1524', '1', '25');
INSERT INTO `tfw_relation` VALUES ('1525', '62', '25');
INSERT INTO `tfw_relation` VALUES ('1526', '64', '25');
INSERT INTO `tfw_relation` VALUES ('1527', '72', '25');
INSERT INTO `tfw_relation` VALUES ('1528', '73', '25');
INSERT INTO `tfw_relation` VALUES ('1529', '74', '25');
INSERT INTO `tfw_relation` VALUES ('1530', '75', '25');
INSERT INTO `tfw_relation` VALUES ('1531', '76', '25');
INSERT INTO `tfw_relation` VALUES ('1532', '77', '25');
INSERT INTO `tfw_relation` VALUES ('1533', '78', '25');
INSERT INTO `tfw_relation` VALUES ('1534', '79', '25');
INSERT INTO `tfw_relation` VALUES ('1535', '80', '25');
INSERT INTO `tfw_relation` VALUES ('1668', '81', '5');
INSERT INTO `tfw_relation` VALUES ('1669', '82', '5');
INSERT INTO `tfw_relation` VALUES ('1670', '84', '5');
INSERT INTO `tfw_relation` VALUES ('1671', '85', '5');
INSERT INTO `tfw_relation` VALUES ('1672', '86', '5');
INSERT INTO `tfw_relation` VALUES ('1673', '87', '5');
INSERT INTO `tfw_relation` VALUES ('1980', '1', '4');
INSERT INTO `tfw_relation` VALUES ('1981', '2', '4');
INSERT INTO `tfw_relation` VALUES ('1982', '3', '4');
INSERT INTO `tfw_relation` VALUES ('1983', '4', '4');
INSERT INTO `tfw_relation` VALUES ('1984', '5', '4');
INSERT INTO `tfw_relation` VALUES ('1985', '6', '4');
INSERT INTO `tfw_relation` VALUES ('1986', '7', '4');
INSERT INTO `tfw_relation` VALUES ('1987', '81', '4');
INSERT INTO `tfw_relation` VALUES ('1988', '82', '4');
INSERT INTO `tfw_relation` VALUES ('1989', '84', '4');
INSERT INTO `tfw_relation` VALUES ('1990', '85', '4');
INSERT INTO `tfw_relation` VALUES ('1991', '86', '4');
INSERT INTO `tfw_relation` VALUES ('1992', '87', '4');
INSERT INTO `tfw_relation` VALUES ('1993', '83', '4');
INSERT INTO `tfw_relation` VALUES ('1994', '88', '4');
INSERT INTO `tfw_relation` VALUES ('1995', '89', '4');
INSERT INTO `tfw_relation` VALUES ('1996', '90', '4');
INSERT INTO `tfw_relation` VALUES ('1997', '91', '4');
INSERT INTO `tfw_relation` VALUES ('1998', '92', '2');
INSERT INTO `tfw_relation` VALUES ('1999', '93', '2');
INSERT INTO `tfw_relation` VALUES ('2000', '94', '2');
INSERT INTO `tfw_relation` VALUES ('2001', '95', '2');
INSERT INTO `tfw_relation` VALUES ('2002', '96', '2');
INSERT INTO `tfw_relation` VALUES ('2003', '97', '2');
INSERT INTO `tfw_relation` VALUES ('2004', '1', '2');
INSERT INTO `tfw_relation` VALUES ('2005', '8', '2');
INSERT INTO `tfw_relation` VALUES ('2006', '9', '2');
INSERT INTO `tfw_relation` VALUES ('2007', '10', '2');
INSERT INTO `tfw_relation` VALUES ('2008', '11', '2');
INSERT INTO `tfw_relation` VALUES ('2009', '12', '2');
INSERT INTO `tfw_relation` VALUES ('2010', '13', '2');
INSERT INTO `tfw_relation` VALUES ('2011', '14', '2');
INSERT INTO `tfw_relation` VALUES ('2012', '15', '2');
INSERT INTO `tfw_relation` VALUES ('2013', '16', '2');
INSERT INTO `tfw_relation` VALUES ('2014', '17', '2');
INSERT INTO `tfw_relation` VALUES ('2015', '18', '2');
INSERT INTO `tfw_relation` VALUES ('2016', '19', '2');
INSERT INTO `tfw_relation` VALUES ('2017', '20', '2');
INSERT INTO `tfw_relation` VALUES ('2018', '21', '2');
INSERT INTO `tfw_relation` VALUES ('2019', '22', '2');
INSERT INTO `tfw_relation` VALUES ('2020', '23', '2');
INSERT INTO `tfw_relation` VALUES ('2021', '24', '2');
INSERT INTO `tfw_relation` VALUES ('2022', '2', '2');
INSERT INTO `tfw_relation` VALUES ('2023', '3', '2');
INSERT INTO `tfw_relation` VALUES ('2024', '4', '2');
INSERT INTO `tfw_relation` VALUES ('2025', '5', '2');
INSERT INTO `tfw_relation` VALUES ('2026', '6', '2');
INSERT INTO `tfw_relation` VALUES ('2027', '7', '2');
INSERT INTO `tfw_relation` VALUES ('2028', '34', '2');
INSERT INTO `tfw_relation` VALUES ('2029', '35', '2');
INSERT INTO `tfw_relation` VALUES ('2030', '36', '2');
INSERT INTO `tfw_relation` VALUES ('2031', '37', '2');
INSERT INTO `tfw_relation` VALUES ('2032', '38', '2');
INSERT INTO `tfw_relation` VALUES ('2033', '39', '2');
INSERT INTO `tfw_relation` VALUES ('2034', '40', '2');
INSERT INTO `tfw_relation` VALUES ('2035', '41', '2');
INSERT INTO `tfw_relation` VALUES ('2036', '42', '2');
INSERT INTO `tfw_relation` VALUES ('2037', '43', '2');
INSERT INTO `tfw_relation` VALUES ('2038', '44', '2');
INSERT INTO `tfw_relation` VALUES ('2039', '45', '2');
INSERT INTO `tfw_relation` VALUES ('2040', '46', '2');
INSERT INTO `tfw_relation` VALUES ('2041', '47', '2');
INSERT INTO `tfw_relation` VALUES ('2042', '48', '2');
INSERT INTO `tfw_relation` VALUES ('2043', '49', '2');
INSERT INTO `tfw_relation` VALUES ('2044', '81', '2');
INSERT INTO `tfw_relation` VALUES ('2045', '82', '2');
INSERT INTO `tfw_relation` VALUES ('2046', '84', '2');
INSERT INTO `tfw_relation` VALUES ('2047', '85', '2');
INSERT INTO `tfw_relation` VALUES ('2048', '86', '2');
INSERT INTO `tfw_relation` VALUES ('2049', '87', '2');
INSERT INTO `tfw_relation` VALUES ('2050', '83', '2');
INSERT INTO `tfw_relation` VALUES ('2051', '88', '2');
INSERT INTO `tfw_relation` VALUES ('2052', '89', '2');
INSERT INTO `tfw_relation` VALUES ('2053', '90', '2');
INSERT INTO `tfw_relation` VALUES ('2054', '91', '2');
INSERT INTO `tfw_relation` VALUES ('2055', '98', '2');
INSERT INTO `tfw_relation` VALUES ('2056', '99', '2');
INSERT INTO `tfw_relation` VALUES ('2057', '100', '2');
INSERT INTO `tfw_relation` VALUES ('2058', '101', '2');
INSERT INTO `tfw_relation` VALUES ('2059', '102', '2');
INSERT INTO `tfw_relation` VALUES ('2061', '92', '1');
INSERT INTO `tfw_relation` VALUES ('2062', '93', '1');
INSERT INTO `tfw_relation` VALUES ('2063', '94', '1');
INSERT INTO `tfw_relation` VALUES ('2064', '95', '1');
INSERT INTO `tfw_relation` VALUES ('2065', '96', '1');
INSERT INTO `tfw_relation` VALUES ('2066', '97', '1');
INSERT INTO `tfw_relation` VALUES ('2067', '105', '1');
INSERT INTO `tfw_relation` VALUES ('2068', '106', '1');
INSERT INTO `tfw_relation` VALUES ('2069', '107', '1');
INSERT INTO `tfw_relation` VALUES ('2070', '108', '1');
INSERT INTO `tfw_relation` VALUES ('2071', '109', '1');
INSERT INTO `tfw_relation` VALUES ('2072', '1', '1');
INSERT INTO `tfw_relation` VALUES ('2073', '8', '1');
INSERT INTO `tfw_relation` VALUES ('2074', '9', '1');
INSERT INTO `tfw_relation` VALUES ('2075', '10', '1');
INSERT INTO `tfw_relation` VALUES ('2076', '11', '1');
INSERT INTO `tfw_relation` VALUES ('2077', '12', '1');
INSERT INTO `tfw_relation` VALUES ('2078', '13', '1');
INSERT INTO `tfw_relation` VALUES ('2079', '14', '1');
INSERT INTO `tfw_relation` VALUES ('2080', '15', '1');
INSERT INTO `tfw_relation` VALUES ('2081', '16', '1');
INSERT INTO `tfw_relation` VALUES ('2082', '17', '1');
INSERT INTO `tfw_relation` VALUES ('2083', '18', '1');
INSERT INTO `tfw_relation` VALUES ('2084', '19', '1');
INSERT INTO `tfw_relation` VALUES ('2085', '20', '1');
INSERT INTO `tfw_relation` VALUES ('2086', '21', '1');
INSERT INTO `tfw_relation` VALUES ('2087', '22', '1');
INSERT INTO `tfw_relation` VALUES ('2088', '23', '1');
INSERT INTO `tfw_relation` VALUES ('2089', '24', '1');
INSERT INTO `tfw_relation` VALUES ('2090', '2', '1');
INSERT INTO `tfw_relation` VALUES ('2091', '3', '1');
INSERT INTO `tfw_relation` VALUES ('2092', '4', '1');
INSERT INTO `tfw_relation` VALUES ('2093', '5', '1');
INSERT INTO `tfw_relation` VALUES ('2094', '6', '1');
INSERT INTO `tfw_relation` VALUES ('2095', '7', '1');
INSERT INTO `tfw_relation` VALUES ('2096', '25', '1');
INSERT INTO `tfw_relation` VALUES ('2097', '26', '1');
INSERT INTO `tfw_relation` VALUES ('2098', '27', '1');
INSERT INTO `tfw_relation` VALUES ('2099', '28', '1');
INSERT INTO `tfw_relation` VALUES ('2100', '29', '1');
INSERT INTO `tfw_relation` VALUES ('2101', '30', '1');
INSERT INTO `tfw_relation` VALUES ('2102', '31', '1');
INSERT INTO `tfw_relation` VALUES ('2103', '32', '1');
INSERT INTO `tfw_relation` VALUES ('2104', '33', '1');
INSERT INTO `tfw_relation` VALUES ('2105', '34', '1');
INSERT INTO `tfw_relation` VALUES ('2106', '35', '1');
INSERT INTO `tfw_relation` VALUES ('2107', '36', '1');
INSERT INTO `tfw_relation` VALUES ('2108', '37', '1');
INSERT INTO `tfw_relation` VALUES ('2109', '38', '1');
INSERT INTO `tfw_relation` VALUES ('2110', '39', '1');
INSERT INTO `tfw_relation` VALUES ('2111', '40', '1');
INSERT INTO `tfw_relation` VALUES ('2112', '41', '1');
INSERT INTO `tfw_relation` VALUES ('2113', '42', '1');
INSERT INTO `tfw_relation` VALUES ('2114', '43', '1');
INSERT INTO `tfw_relation` VALUES ('2115', '44', '1');
INSERT INTO `tfw_relation` VALUES ('2116', '45', '1');
INSERT INTO `tfw_relation` VALUES ('2117', '46', '1');
INSERT INTO `tfw_relation` VALUES ('2118', '47', '1');
INSERT INTO `tfw_relation` VALUES ('2119', '48', '1');
INSERT INTO `tfw_relation` VALUES ('2120', '49', '1');
INSERT INTO `tfw_relation` VALUES ('2121', '56', '1');
INSERT INTO `tfw_relation` VALUES ('2122', '57', '1');
INSERT INTO `tfw_relation` VALUES ('2123', '58', '1');
INSERT INTO `tfw_relation` VALUES ('2124', '59', '1');
INSERT INTO `tfw_relation` VALUES ('2125', '60', '1');
INSERT INTO `tfw_relation` VALUES ('2126', '61', '1');
INSERT INTO `tfw_relation` VALUES ('2127', '62', '1');
INSERT INTO `tfw_relation` VALUES ('2128', '63', '1');
INSERT INTO `tfw_relation` VALUES ('2129', '64', '1');
INSERT INTO `tfw_relation` VALUES ('2130', '65', '1');
INSERT INTO `tfw_relation` VALUES ('2131', '81', '1');
INSERT INTO `tfw_relation` VALUES ('2132', '82', '1');
INSERT INTO `tfw_relation` VALUES ('2133', '84', '1');
INSERT INTO `tfw_relation` VALUES ('2134', '85', '1');
INSERT INTO `tfw_relation` VALUES ('2135', '86', '1');
INSERT INTO `tfw_relation` VALUES ('2136', '87', '1');
INSERT INTO `tfw_relation` VALUES ('2137', '83', '1');
INSERT INTO `tfw_relation` VALUES ('2138', '88', '1');
INSERT INTO `tfw_relation` VALUES ('2139', '89', '1');
INSERT INTO `tfw_relation` VALUES ('2140', '90', '1');
INSERT INTO `tfw_relation` VALUES ('2141', '91', '1');
INSERT INTO `tfw_relation` VALUES ('2142', '98', '1');
INSERT INTO `tfw_relation` VALUES ('2143', '99', '1');
INSERT INTO `tfw_relation` VALUES ('2144', '100', '1');
INSERT INTO `tfw_relation` VALUES ('2145', '101', '1');
INSERT INTO `tfw_relation` VALUES ('2146', '102', '1');
INSERT INTO `tfw_relation` VALUES ('2147', '103', '1');
INSERT INTO `tfw_relation` VALUES ('2148', '104', '1');
INSERT INTO `tfw_role` VALUES ('1', '1', null, '超级管理员', '1', 'administrator', '0');
INSERT INTO `tfw_role` VALUES ('2', '1', '1', '管理员', '7', 'admin', '3');
INSERT INTO `tfw_role` VALUES ('3', '2', '1', '管理员1', '10', 'admin', '2');
INSERT INTO `tfw_role` VALUES ('4', '2', null, '测试', '10', 'test', '0');
INSERT INTO `tfw_role` VALUES ('5', '1', '4', '测试1', '3', 'test', '1');
INSERT INTO `tfw_role` VALUES ('7', '7', '4', '测试2', '7', 'test2', '0');
INSERT INTO `tfw_role_ext` VALUES ('27', '66', '1,44,49', '45');
INSERT INTO `tfw_role_ext` VALUES ('47', '2', '0', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24');
INSERT INTO `tfw_role_ext` VALUES ('48', '63', '0', '0');
INSERT INTO `tfw_role_ext` VALUES ('49', '72', '0', '0');
INSERT INTO `tfw_role_ext` VALUES ('50', '74', '0', '0');
INSERT INTO `tfw_role_ext` VALUES ('67', '1', '0', '0');
INSERT INTO `tfw_role_ext` VALUES ('87', '168', '92,103,104,105,106,107', '109,110,111,112,113,114,115,116,117,118,119,120,121,122');
INSERT INTO `tfw_role_ext` VALUES ('107', '189', '108,109,110,111,112,113,114,115,116,117,118,119,120,121,122', '0');
INSERT INTO `tfw_role_ext` VALUES ('127', '21', '92,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,39,40,41,42,43,98,99,100,101,102,103,104', '0');
INSERT INTO `tfw_user` VALUES ('1', 'admin', '4779e4a9903dfb08f9f877791c516a73', 'admin', '管理员', '2015-09-08 00:00:00', '1', 'admin@tonbusoft.com.cn', '111111', '1', '9', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `tfw_user` VALUES ('22', '123123', '653f21c93acdd4f03c95876824f440a7', '048wh', '213123', '2016-05-03 00:00:00', '1', '123', '1232', '2', '1', '1', '2016-05-17 18:50:15', '2');
INSERT INTO `tfw_user` VALUES ('23', 'asdfg', 'ab857cd259f2c40b551f448fdf553719', 'nsvnk', '阿斯顿飞过', '2016-09-29 09:27:30', '2', '', '1', '7', null, '1', '2016-09-29 09:27:47', '5');
