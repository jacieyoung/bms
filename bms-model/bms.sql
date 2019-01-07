CREATE DATABASE IF NOT EXISTS bms DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use bms;
/*
Navicat MySQL Data Transfer

Source Server         : 177
Source Server Version : 50618
Source Host           : 10.19.105.177:3306
Source Database       : foundation

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2016-08-09 17:58:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cip_admin_access_ctrl
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_access_ctrl`;
CREATE TABLE `cip_admin_access_ctrl` (
  `sys_id` varchar(20) NOT NULL COMMENT '系统id',
  `access_flag` char(1) NOT NULL COMMENT '访问标识',
  `access_type` varchar(6) DEFAULT NULL COMMENT '访问类型',
  `access_ip` varchar(32) DEFAULT NULL COMMENT '访问ip',
  `auth_code` varchar(50) DEFAULT NULL COMMENT '访问授权码',
  `other_params` varchar(200) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL COMMENT '操作备注',
  `create_time` datetime DEFAULT NULL COMMENT '系统时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`sys_id`,`access_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统访问控制';

-- ----------------------------
-- Records of cip_admin_access_ctrl
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_access_rel
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_access_rel`;
CREATE TABLE `cip_admin_access_rel` (
  `sys_id` varchar(20) NOT NULL COMMENT '系统id',
  `resource_id` varchar(50) NOT NULL COMMENT '资源id',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`sys_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统与资源关系配置';

-- ----------------------------
-- Records of cip_admin_access_rel
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_access_res
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_access_res`;
CREATE TABLE `cip_admin_access_res` (
  `resource_id` varchar(50) NOT NULL COMMENT '资源id',
  `access_flag` char(1) NOT NULL COMMENT '访问标识',
  `resource_name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `resource_desc` varchar(300) DEFAULT NULL COMMENT '资源描述',
  `sys_uri` varchar(150) DEFAULT NULL COMMENT '访问URI',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  `icon_id` varchar(20) DEFAULT NULL COMMENT '图标id',
  PRIMARY KEY (`resource_id`,`access_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统访问资源配置';

-- ----------------------------
-- Records of cip_admin_access_res
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_auth_act2obj
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_auth_act2obj`;
CREATE TABLE `cip_admin_auth_act2obj` (
  `root_node_id` varchar(50) NOT NULL COMMENT '资源根节点',
  `resource_id` varchar(50) NOT NULL COMMENT '行为资源id',
  `obj_id` varchar(32) NOT NULL COMMENT '权限对象id',
  `obj_attr_id` varchar(32) NOT NULL COMMENT '权限对象属性id',
  `attr_value` varchar(150) DEFAULT NULL COMMENT '权限对象属性值',
  `val_src_type` char(1) DEFAULT NULL COMMENT '属性值来源',
  `incl_sub_flag` char(1) DEFAULT NULL COMMENT '包含属性下级标识',
  `field_id` varchar(50) DEFAULT NULL COMMENT '表字段id',
  PRIMARY KEY (`root_node_id`,`resource_id`,`obj_id`,`obj_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/权限对象授权配置';

-- ----------------------------
-- Records of cip_admin_auth_act2obj
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_auth_attr
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_auth_attr`;
CREATE TABLE `cip_admin_auth_attr` (
  `obj_id` varchar(32) NOT NULL COMMENT '权限对象id',
  `obj_attr_id` varchar(32) NOT NULL COMMENT '权限对象属性id',
  `obj_attr_name` varchar(50) DEFAULT NULL COMMENT '权限对象属性描述',
  `attr_val_table` varchar(50) DEFAULT NULL COMMENT '属性取值表',
  `sup_col_id` varchar(32) DEFAULT NULL COMMENT '上级字段id',
  `sub_col_id` varchar(32) DEFAULT NULL COMMENT '下级字段id',
  `rel_col_id` varchar(255) DEFAULT NULL COMMENT '层级关联字段id',
  PRIMARY KEY (`obj_id`,`obj_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/权限对象属性信息';

-- ----------------------------
-- Records of cip_admin_auth_attr
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_auth_obj
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_auth_obj`;
CREATE TABLE `cip_admin_auth_obj` (
  `auth_obj_id` varchar(32) NOT NULL COMMENT '权限对象id',
  `auth_obj_name` varchar(50) DEFAULT NULL COMMENT '权限对象描述',
  PRIMARY KEY (`auth_obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/权限对象信息';

-- ----------------------------
-- Records of cip_admin_auth_obj
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_auth_role`;
CREATE TABLE `cip_admin_auth_role` (
  `auth_role_id` varchar(32) NOT NULL COMMENT '角色Id',
  `auth_attr_id` varchar(32) NOT NULL COMMENT '权限属性id',
  `auth_attr_val` varchar(32) DEFAULT NULL COMMENT '权限属性值',
  PRIMARY KEY (`auth_role_id`,`auth_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/角色权限值配置';

-- ----------------------------
-- Records of cip_admin_auth_role
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_auth_user`;
CREATE TABLE `cip_admin_auth_user` (
  `user_attr_id` varchar(32) NOT NULL COMMENT '权限属性id',
  `auth_attr_name` varchar(32) DEFAULT NULL COMMENT '权限属性名称',
  `auth_attr_id` varchar(32) DEFAULT NULL COMMENT '权限字段id',
  PRIMARY KEY (`user_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/用户权限字段配置';

-- ----------------------------
-- Records of cip_admin_auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_codes
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_codes`;
CREATE TABLE `cip_admin_codes` (
  `domain_id` varchar(32) NOT NULL COMMENT '数据域id',
  `code_type` varchar(32) NOT NULL COMMENT '编码类型',
  `code_name` varchar(50) DEFAULT NULL COMMENT '编码名称',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`domain_id`,`code_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/数据编码';

-- ----------------------------
-- Records of cip_admin_codes
-- ----------------------------
REPLACE INTO `cip_admin_codes` VALUES ('access_flag', 'E', '远程访问', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('access_flag', 'I', '本地注册', '2016-07-22 10:28:03', '2016-07-22 10:36:44', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('as_type', 'W', 'Weblogic', '2015-09-25 13:33:03', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('audit_flag', 'A', '审核通过', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('audit_flag', 'R', '审核回退', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('ctrl_status', 'L', '锁定', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('ctrl_status', 'U', '解锁', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_fmt_type', 'free', '自由格式', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_fmt_type', 'json', 'json格式', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_fmt_type', 'xml', 'xml格式', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'BIGINT', '大数值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'CHAR', '固定字符', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'DATE', '日期', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'DATETIME', '时间戳', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'DECIMAL', '金额数值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'INT', '数值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'MEDIUMINT', '中数值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'SMALLINT', '短数值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'TINYINT', '超短数值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('data_type', 'VARCHAR', '变长字符', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('domain_type', '1', '类型属性', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('domain_type', '2', '描述属性', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('domain_type', '3', '流水号属性', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('domain_type', '4', '量化属性', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('ds_driver', 'com.mysql.jdbc.Driver', 'com.mysql.jdbc.Driver', '2015-10-28 09:55:33', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('ds_driver', 'oracle.jdbc.driver.OracleDriver', 'oracle.jdbc.driver.OracleDriver', '2016-02-01 13:44:08', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('ds_type', 'mysql', 'mysql数据库', '2015-11-11 09:48:01', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('ds_type', 'oracle', 'oracle数据库', '2015-11-11 09:48:35', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '0', '打包任务成功', null, '2015-08-18 11:29:00', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '1', '获取源码错误', '2015-08-18 11:20:49', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '10', '部署任务成功', '2015-08-18 11:28:50', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '11', '获取源包出错', '2015-08-18 11:29:45', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '12', '执行部署错误', '2015-08-18 11:30:18', '2015-08-18 11:31:02', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '14', '执行任务错误', '2015-08-19 09:55:21', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '19', '无法回滚', '2015-08-20 11:06:19', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '2', '执行打包错误', '2015-08-18 11:21:46', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '20', '回滚成功', '2015-08-20 11:04:31', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '21', '回滚失败', '2015-08-20 11:05:13', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '3', '上传war包失败', '2015-08-18 11:23:01', '2015-12-07 20:08:51', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('error_code', '4', '测试未通过', '2015-12-07 20:09:23', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('expect_type', 'ERROR', '操作验证', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('expect_type', 'NORMAL', '数据验证', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('field_use_type', '1', '码表字段', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('field_use_type', '2', '文本字段', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('field_use_type', '3', '度量属性', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('field_use_type', '4', '日期属性', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('field_use_type', '5', '时间戳属性', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('field_use_type', '6', '其他类型', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('field_use_type', '7', '敏感属性', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('fullpubl_flag', 'F', '全量部署', '2015-12-08 16:48:14', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('fullpubl_flag', 'N', '部署回退', '2015-12-08 16:51:31', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('fullpubl_flag', 'P', '正向增量部署', '2015-12-08 16:50:43', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('handle_flag', '0', '未解决', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('handle_flag', '1', '已解决', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('incl_sub_flag', 'A', '所有下级层级值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('incl_sub_flag', 'D', '直接下级', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('incl_sub_flag', 'S', '当前用户值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('is_null_flag', '0', '否', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('is_null_flag', '1', '是', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('key_flag', '0', '非主键', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('key_flag', '1', '主键字段', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('lang_type', 'EN', '英文', null, '2016-08-01 16:15:21', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('lang_type', 'ZH', '中文', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('leaf_flag', '0', '否', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('leaf_flag', '1', '是', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('meta_job_type', 'DELTA', '数据库变更', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('meta_job_type', 'DSBACK', '数据结构回版', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('meta_job_type', 'DSDIFF', '数据结构比对', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('meta_job_type', 'DSGEN', '数据结构生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('meta_job_type', 'INIT', '数据库初始化', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('meta_job_type', 'ROLLBA', '数据库版本回滚', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('mvc_admin_flag', '', '不生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('mvc_admin_flag', 'X', '生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('mvc_all_table_flag', '', '不生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('mvc_all_table_flag', 'X', '生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('null_flag', '0', '非空值 ', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('null_flag', '1', '空值', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'A', '审核通过', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'D', '删除', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'E', '导出Excel', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'F', '导入Excel', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'I', '新增', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'L', '锁定', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'M', '修改', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'N', '登录', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'Q', '查看', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'R', '审核回退', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'S', '查询', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'T', '退出', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('op_type', 'U', '解锁', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('os_type', 'L', 'Linux系统', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pack_flag', '0', '尚未打包', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pack_flag', '1', '任务正在进行...', null, '2015-08-21 13:46:40', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('pack_flag', '2', '打包错误', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pack_flag', '3', '打包完成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pack_flag', '4', '脚本调用出错未执行', '2015-09-10 16:06:50', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('pack_type', 'jar', 'jar包', '2015-09-06 13:27:52', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('pack_type', 'war', 'war包', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pagination', '0', '否', '2016-08-04 19:43:51', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('pagination', '1', '是', '2016-08-04 19:44:01', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('publ_flag', '0', '未发布', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('publ_flag', '1', '正在执行...', null, '2015-08-21 17:14:30', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('publ_flag', '2', '发布错误', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('publ_flag', '3', '发布完成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('publ_type', 'weblog', 'weblogic', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pwd_init_flag', '0', '非初始化', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pwd_init_flag', '1', '初始化', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pwd_reset_flag', '0', '否', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('pwd_reset_flag', '1', '是', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('queston_type', 'B', '业务流程类', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('queston_type', 'P', '界面UI类', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('queston_type', 'T', '技术BUG类', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('queue_flag', '0', '未提取', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('queue_flag', '1', '已提取', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('resource_type', 'A', '菜单项', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('resource_type', 'B', '动作', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('resource_type', 'F', '菜单组', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('resource_type', 'P', '页面', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('resource_type', 'R', '菜单根节点', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('res_gen_flag', ' ', '不生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('res_gen_flag', 'X', '生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('root_flag', '0', '否', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('root_flag', '1', '是', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('run_db_status', '0', '未生成', '2015-09-28 16:02:40', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('run_db_status', '1', '生成中...', '2015-09-28 16:03:46', '2015-09-28 16:04:30', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('run_db_status', '2', '生成失败', '2015-09-28 16:04:43', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('run_db_status', '3', '上传SVN失败', '2015-09-28 16:05:01', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('run_db_status', '4', '导入失败', '2015-09-28 16:05:20', '2015-09-28 16:11:28', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('run_db_status', '5', '生成成功', '2015-09-28 16:05:40', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('run_type', 'G', '程序生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('run_type', 'P', '程序打包', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('run_type', 'R', '程序部署', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('run_type', 'U', '程序更新', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('search_flag', '0', '非查询字段', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('search_flag', '1', '查询字段', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('singleRec', '0', '否', '2016-08-04 19:45:32', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('singleRec', '1', '是', '2016-08-04 19:45:38', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('str_data_type', 'DM', '数据域', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('str_data_type', 'MDM', '主数据类型', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('str_data_type', 'TECH', '辅助数据(log等)', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('str_data_type', 'TRANS', '事务类型', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('str_type', 'DATA', '检索结构', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('str_type', 'PO', '持久层类型', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('str_type', 'TABLE', '数据表', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('str_type', 'VIEW', '视图', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('str_type', 'VO', '接口类型', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('svn_role', 'developer', '开发人员', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('svn_role', 'operationer', '运维人员', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('svn_role', 'pmoer', '项目管理人员', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('svn_role', 'productor', '产品人员', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('svn_role', 'tester', '测试人员', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('svn_rw', 'r', '读', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('svn_rw', 'rw', '读写', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('sys_cat', 'N', 'meta架构', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('sys_cat', 'O', '非meta架构', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '01', '办公研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '02', '财金研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '03', '仓储研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '04', '创新研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '05', '订单研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '06', '给数中心', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '07', '客服研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '08', '跨境研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '09', '软件基础部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '10', '数据研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '11', '移动研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '12', '运单研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', '13', '运输研发部', null, null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'CB', '跨境研发部', '2016-05-16 10:26:47', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'CTS', '客服研发部', '2016-05-16 10:26:06', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'DD', '数据研发部', '2016-05-16 10:28:15', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'DSC', '给数中心', '2016-05-16 10:25:44', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'FISC', '财金研发部', '2016-05-16 10:23:44', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'MD', '移动研发部', '2016-05-16 10:28:47', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'NID', '创新研发部', '2016-05-16 10:24:51', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'OA', '办公研发部', '2016-05-16 10:23:16', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'OEM', '订单研发部', '2016-05-16 10:25:22', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'RD', '软件基础部', '2016-05-16 10:27:49', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'ST', '仓储研发部', '2016-05-16 10:24:11', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'TP', '运输研发部', '2016-05-16 10:29:42', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_resp_org', 'WB', '运单研发部', '2016-05-16 10:29:14', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_status', 'D', '开发', '2016-01-14 14:28:05', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_status', 'F', '在线维护', '2016-01-14 14:29:34', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_status', 'N', '新建', '2016-01-14 14:27:25', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_status', 'T', '测试', '2016-01-14 14:28:18', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_status', 'U', 'UAT', '2016-01-14 14:28:50', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_status', 'W', '注销', '2016-01-14 17:47:09', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_tech_back', 'java', 'java语言', '2015-12-10 14:22:26', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_tech_back', 'php', 'php语言', '2015-12-10 14:23:35', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_tech_front', 'delphiUI', 'delphiUI', '2016-01-05 10:41:49', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_tech_front', 'html', 'html', '2016-01-05 10:40:53', null, 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_type', 'DEV', '开发环境', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('sys_type', 'PRT', '生产环境', null, '2015-09-06 14:01:17', 'root');
REPLACE INTO `cip_admin_codes` VALUES ('sys_type', 'SIT', '测试环境', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('sys_type', 'UAT', '仿真环境', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('test_acpt_flag', '0', '错误', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('test_acpt_flag', '1', '成功', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('test_req_type', '0', '非必须', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('test_req_type', '1', '必须', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('ui_admin_flag', '', '不生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('ui_admin_flag', 'X', '生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('ui_all_table_flag', '', '不生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('ui_all_table_flag', 'X', '生成', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('user_status', '0', '正常', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('user_status', '1', '关停', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('user_type', '1', '企业用户', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('val_src_type', 'C', '配置', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('val_src_type', 'R', '角色', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('val_src_type', 'S', '用户设置', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('val_src_type', 'U', '用户', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('visitor_type', 'L', '本地访问', null, null, null);
REPLACE INTO `cip_admin_codes` VALUES ('visitor_type', 'R', '远程访问', null, null, null);

-- ----------------------------
-- Table structure for cip_admin_commonquery
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_commonquery`;
CREATE TABLE `cip_admin_commonquery` (
  `queryId` varchar(50) NOT NULL COMMENT '查询id',
  `description` varchar(100) DEFAULT NULL COMMENT '查询说明',
  `paramlist` varchar(300) DEFAULT NULL COMMENT '查询参数列表',
  `statement` text NOT NULL COMMENT '查询语句',
  `count_statement` text COMMENT '统计语句',
  `pagination` char(1) DEFAULT NULL COMMENT '是否分页',
  `singleRec` char(1) NOT NULL COMMENT '是否多条',
  PRIMARY KEY (`queryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/通用查询配置表';

-- ----------------------------
-- Records of cip_admin_commonquery
-- ----------------------------
REPLACE INTO `cip_admin_commonquery` VALUES ('110', 'www', 'root_node_id,', 'select * from cip_admin_resource_2_resource where root_node_id=:root_node_id', 'select count(1) from cip_admin_resource_2_resource where root_node_id=:root_node_id', '1', '0');

-- ----------------------------
-- Table structure for cip_admin_domain
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_domain`;
CREATE TABLE `cip_admin_domain` (
  `domain_id` varchar(32) NOT NULL COMMENT '数据域id',
  `domain_name` varchar(50) DEFAULT NULL COMMENT '数据域名称',
  `domain_type` int(1) DEFAULT NULL COMMENT '数据域类型',
  `is_null_flag` int(1) DEFAULT NULL COMMENT '允许为空标识',
  `data_length` int(2) DEFAULT NULL COMMENT '数据长度',
  `default_value` varchar(32) DEFAULT NULL COMMENT '默认值',
  `float_length` int(1) DEFAULT NULL COMMENT '小数位长度',
  `data_type` varchar(18) DEFAULT NULL COMMENT '数据类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  `resp_id` varchar(20) DEFAULT NULL COMMENT '责任人',
  `domain_desc` varchar(300) DEFAULT NULL COMMENT '数据域描述',
  `ref_table_id` varchar(32) DEFAULT NULL COMMENT '参考引用数据表',
  `ref_domain_id` varchar(32) DEFAULT NULL COMMENT '引用数据域id',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/数据域信息';

-- ----------------------------
-- Records of cip_admin_domain
-- ----------------------------
REPLACE INTO `cip_admin_domain` VALUES ('access_flag', '访问标识', '1', '0', '1', 'I', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '访问标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('access_type', '访问类型', '1', '0', '1', '', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '访问类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('as_type', '应用服务器类型', '1', '0', '1', '', '0', 'CHAR', '2015-09-25 13:32:11', null, 'root', '', '应用服务器类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('audit_flag', '审核状态', '1', '0', '1', 'A', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '审核状态', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('ctrl_status', '控制状态', '1', '0', '1', 'L', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '控制状态', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('data_fmt_type', '测试数据格式', '1', '0', '6', 'json', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '测试数据格式', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('data_type', '数据类型', '1', '0', '18', 'VARCHAR', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '数据类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('domain_type', '数据域类型', '1', '0', '1', '1', '0', 'INT', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '数据域类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('error_code', '结果码', '1', '1', '6', '0', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '结果码', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('expect_type', '测试期望类型', '1', '0', '6', 'NORMAL', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '测试期望类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('field_use_type', '字段使用类型', '1', '0', '1', '1', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '字段使用类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('handle_flag', '处理标志', '1', '0', '1', '0', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'root', 'root', '处理标志', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('incl_sub_flag', '包含属性下级标识', '1', '0', '1', 'E', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '包含属性下级标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('is_null_flag', '为空标识', '1', '0', '1', '1', '0', 'INT', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '为空标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('key_flag', '主键标识', '1', '0', '1', '0', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '主键标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('lang_type', '语言类型', '1', '0', '6', 'ZH', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '语言类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('leaf_flag', '叶节点标识', '1', '0', '1', '0', '0', 'INT', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '叶节点标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('meta_job_type', '元数据作业类型', '1', '0', '6', '', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '元数据作业类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('mvc_admin_flag', '管理mvc生成标识', '1', '1', '1', '', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '管理mvc生成标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('mvc_all_table_flag', '是否mvc操作所有表', '1', '1', '1', 'X', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '是否mvc操作所有表', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('null_flag', '空值标识', '1', '0', '1', '1', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '空值标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('op_type', '操作类型', '1', '0', '1', '', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '操作类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('os_type', '服务器操作系统', '1', '1', '1', 'L', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '服务器操作系统', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('pack_flag', '打包标识', '1', '1', '1', '0', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '打包标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('pack_type', '打包类型', '1', '1', '6', 'war', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '打包类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('pagination', '是否分页标识', '1', '1', '1', '1', '0', 'INT', '2016-08-04 19:43:10', null, 'root', 'hqs', '是否分页标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('publ_flag', '发布标识', '1', '1', '1', '0', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '发布标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('publ_type', '部署类型', '1', '1', '6', 'weblog', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '部署类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('pwd_init_flag', '初始密码标识', '1', '0', '1', '0', '0', 'INT', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '初始密码标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('pwd_reset_flag', '密码重置标识', '1', '0', '1', '0', '0', 'INT', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '密码重置标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('queston_type', '问题类型', '1', '0', '1', 'T', '0', 'CHAR', '2015-04-29 23:13:43', '2016-01-13 12:20:56', 'root', 'root', '问题类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('queue_flag', '队列标识', '1', '0', '1', '0', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '队列标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('queue_type', '队列类型', '1', '0', '6', '', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '队列类型', 'cip_admin_queue_type_dm', '');
REPLACE INTO `cip_admin_domain` VALUES ('resource_type', '资源类型', '1', '0', '1', 'R', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '资源类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('res_gen_flag', '生成mvc资源标识', '1', '1', '1', 'X', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '生成mvc资源标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('root_flag', '根节点标识', '1', '0', '1', '0', '0', 'INT', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '根节点标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('run_db_status', '实例数据库状态', '1', '0', '1', '0', '0', 'CHAR', '2015-09-28 16:01:39', '2015-09-28 16:02:09', 'root', '', '实例数据库状态', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('run_type', '操作类型', '1', '1', '1', '', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '操作类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('search_flag', '查询标识', '1', '0', '1', '0', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '查询标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('singleRec', '是否多条标识', '1', '0', '1', '0', '0', 'INT', '2016-08-04 19:45:15', null, 'root', 'hqs', '是否多条标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('str_data_type', '结构数据类型', '1', '0', '6', 'MDM', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '结构数据类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('str_type', '结构类型', '1', '0', '1', 'PO', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '结构类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('svn_role', 'SVN角色', '1', '1', '20', '', '0', 'VARCHAR2', '2015-08-06 23:13:47', '2015-08-06 23:13:47', '', '', 'SVN角色', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('svn_rw', 'SVN权限', '1', '1', '2', 'r', '0', 'CHAR', '2015-08-06 23:13:47', '2015-08-06 23:13:47', '', '', 'SVN权限', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('sys_type', '系统类型', '1', '1', '3', 'dev', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '系统类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('test_acpt_flag', '测试通过标识', '1', '0', '1', '1', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '测试通过标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('test_req_type', '必须测试标识', '1', '0', '1', '1', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '必须测试标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('ui_admin_flag', '管理UI生成标识', '1', '1', '1', '', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '管理UI生成标识', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('ui_all_table_flag', '是否ui操作所有表', '1', '1', '1', 'X', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '是否ui操作所有表', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('user_status', '用户状态', '1', '0', '1', '0', '0', 'INT', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '用户状态', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('user_type', '用户类型', '1', '0', '1', '1', '0', 'INT', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '用户类型', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('val_src_type', '属性值来源', '1', '1', '1', 'R', '0', 'VARCHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '属性值来源', 'cip_admin_codes', '');
REPLACE INTO `cip_admin_domain` VALUES ('visitor_type', '访问类型', '1', '0', '1', 'L', '0', 'CHAR', '2015-04-29 23:13:43', '2015-04-29 23:13:43', 'hqs', 'hqs', '访问类型', 'cip_admin_codes', '');

-- ----------------------------
-- Table structure for cip_admin_log_access
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_log_access`;
CREATE TABLE `cip_admin_log_access` (
  `log_id` bigint(19) NOT NULL COMMENT '日志id',
  `resource_id` varchar(50) DEFAULT NULL COMMENT '系统资源id',
  `visitor_id` varchar(11) DEFAULT NULL COMMENT '访问对象id',
  `visitor_type` char(1) DEFAULT NULL COMMENT '访问对象类型',
  `occur_time` datetime DEFAULT NULL COMMENT '记录时间',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `remark` varchar(300) DEFAULT NULL COMMENT '访问备注',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/本地日志-系统访问';

-- ----------------------------
-- Records of cip_admin_log_access
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_log_job
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_log_job`;
CREATE TABLE `cip_admin_log_job` (
  `log_id` bigint(19) NOT NULL COMMENT '日志id',
  `task_id` varchar(32) DEFAULT NULL COMMENT '批量任务id',
  `step_id` int(3) DEFAULT NULL COMMENT '步骤id',
  `step_msg` varchar(300) DEFAULT NULL COMMENT '步骤信息',
  `error_code` int(11) DEFAULT NULL COMMENT '错误代码',
  `occur_time` datetime DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/本地日志-作业日志';

-- ----------------------------
-- Records of cip_admin_log_job
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_log_mdm
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_log_mdm`;
CREATE TABLE `cip_admin_log_mdm` (
  `log_id` bigint(19) NOT NULL COMMENT '日志id',
  `table_id` varchar(32) DEFAULT NULL COMMENT '数据表id',
  `record_id` varchar(50) DEFAULT NULL COMMENT '记录id',
  `old_values` varchar(300) DEFAULT NULL COMMENT '原始值',
  `new_values` varchar(300) DEFAULT NULL COMMENT '新设置值',
  `user_id` varchar(20) DEFAULT NULL COMMENT '变更人',
  `operate_type` char(1) DEFAULT NULL COMMENT '操作类型',
  `occur_time` datetime DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/本地日志-主数据变更';

-- ----------------------------
-- Records of cip_admin_log_mdm
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_meta_str
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_meta_str`;
CREATE TABLE `cip_admin_meta_str` (
  `str_id` varchar(32) NOT NULL COMMENT '数据结构id',
  `str_name` varchar(50) DEFAULT NULL COMMENT '数据结构名称',
  `str_memo` varchar(100) DEFAULT NULL COMMENT '数据结构备注',
  `str_type` varchar(6) DEFAULT NULL COMMENT '数据结构类型',
  `str_prefix` varchar(100) DEFAULT NULL COMMENT '结构前缀',
  `str_module` varchar(10) DEFAULT NULL COMMENT '结构模块id',
  `func_set_id` varchar(32) DEFAULT NULL COMMENT '功能集id',
  `ref_str_id` varchar(32) DEFAULT NULL COMMENT '参考结构id',
  `str_data_type` varchar(6) DEFAULT NULL COMMENT '存储数据类型',
  `prd_date` date DEFAULT NULL COMMENT '落地时间',
  `form_template` varchar(32) DEFAULT NULL COMMENT '表单模板',
  `list_template` varchar(32) DEFAULT NULL COMMENT '列表模板',
  `src_sys_id` varchar(6) DEFAULT NULL COMMENT '源系统id',
  `resp_id` varchar(11) DEFAULT NULL COMMENT '责任人',
  `resp_org` varchar(15) DEFAULT NULL COMMENT '责任部门id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`str_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='元数据管理/系统数据结构表';

-- ----------------------------
-- Records of cip_admin_meta_str
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_op_log
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_op_log`;
CREATE TABLE `cip_admin_op_log` (
  `op_seq_no` bigint(19) NOT NULL COMMENT '操作流水号',
  `op_table_id` varchar(32) DEFAULT NULL COMMENT '操作对象类型',
  `op_obj_id` varchar(32) DEFAULT NULL COMMENT '操作对象id',
  `op_type` char(1) DEFAULT NULL COMMENT '操作类型',
  `remark` varchar(100) DEFAULT NULL COMMENT '操作备注',
  `create_time` datetime DEFAULT NULL COMMENT '系统时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`op_seq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统操作日志';

-- ----------------------------
-- Records of cip_admin_op_log
-- ----------------------------
REPLACE INTO `cip_admin_op_log` VALUES ('1470209288260', 'login', null, 'T', '用户root退出系统', '2016-08-03 15:28:08', 'root');
REPLACE INTO `cip_admin_op_log` VALUES ('1470388517612', 'login', null, 'T', '用户root退出系统', '2016-08-05 17:15:18', 'root');
REPLACE INTO `cip_admin_op_log` VALUES ('1470539692256', 'login', null, 'T', '用户root退出系统', '2016-08-07 11:14:52', 'root');
REPLACE INTO `cip_admin_op_log` VALUES ('1470731819423', 'login', null, 'T', '用户root退出系统', '2016-08-09 16:36:59', 'root');

-- ----------------------------
-- Table structure for cip_admin_question
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_question`;
CREATE TABLE `cip_admin_question` (
  `question_id` varchar(20) NOT NULL COMMENT '问题ID',
  `question_title` varchar(20) DEFAULT NULL COMMENT '问题标题',
  `queston_type` char(1) DEFAULT NULL COMMENT '问题类型',
  `question_desc` varchar(500) DEFAULT NULL COMMENT '问题描述',
  `creater` varchar(10) DEFAULT NULL COMMENT '提出人',
  `question_reply` varchar(500) DEFAULT NULL COMMENT '问题答复',
  `handle_flag` char(1) DEFAULT NULL COMMENT '处理标志',
  `update_time` datetime DEFAULT NULL COMMENT '操作时间',
  `operater` varchar(10) DEFAULT NULL COMMENT '操作人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生成时间',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统问题反馈';

-- ----------------------------
-- Records of cip_admin_question
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_queue
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_queue`;
CREATE TABLE `cip_admin_queue` (
  `queue_type` varchar(6) NOT NULL COMMENT '队列类型',
  `queue_id` bigint(19) NOT NULL COMMENT '队列流水号',
  `queue_data` varchar(1000) DEFAULT NULL COMMENT '队列数据',
  `queue_flag` char(1) DEFAULT NULL COMMENT '数据提取标识',
  `create_time` datetime DEFAULT NULL COMMENT '系统时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`queue_type`,`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统队列信息';

-- ----------------------------
-- Records of cip_admin_queue
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_queue_type_dm
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_queue_type_dm`;
CREATE TABLE `cip_admin_queue_type_dm` (
  `queue_type` varchar(6) NOT NULL COMMENT '队列类型',
  `queue_type_name` varchar(50) DEFAULT NULL COMMENT '队列名称',
  `pojo_class` varchar(50) DEFAULT NULL COMMENT '队列类',
  PRIMARY KEY (`queue_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统队列配置';

-- ----------------------------
-- Records of cip_admin_queue_type_dm
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_resource
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_resource`;
CREATE TABLE `cip_admin_resource` (
  `resource_id` varchar(50) NOT NULL COMMENT '资源id',
  `resource_name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `resource_desc` varchar(300) DEFAULT NULL COMMENT '资源描述',
  `sys_uri` varchar(150) DEFAULT NULL COMMENT '访问URI',
  `resource_type` char(1) DEFAULT NULL COMMENT '资源类型',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  `icon_id` varchar(20) DEFAULT NULL COMMENT '图标id',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统资源信息';

-- ----------------------------
-- Records of cip_admin_resource
-- ----------------------------
REPLACE INTO `cip_admin_resource` VALUES ('auth_object', '权限对象管理', '', '', 'F', '2015-09-02 14:15:58', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_access', '访问管理', '', '', 'F', '2015-09-02 13:23:13', '2016-06-21 19:45:19', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin', '系统管理', '', '', 'F', '2015-08-26 20:45:47', '2016-08-03 17:43:01', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_ctrl_addData', '新增系统访问控制', '', '/actions/admin_access_ctrl/addData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_ctrl_deleteData', '删除系统访问控制', '', '/actions/admin_access_ctrl/deleteData.do', 'B', '2015-08-18 14:49:22', '2016-06-22 11:01:41', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_ctrl_exportEntities', '导出系统访问控制', '', '/actions/admin_access_ctrl/exportEntities.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_ctrl_form', '系统访问控制 表单', '', 'ui/view/admin/cip_admin_access_ctrl_form.html?actionId=cip_admin_access_ctrl_form', 'P', '2015-08-18 14:49:21', '2015-08-18 14:49:21', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_ctrl_getData', '获取系统访问控制', '', '/actions/admin_access_ctrl/getData.do', 'B', '2015-08-18 14:49:22', '2016-06-22 11:03:24', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_ctrl_list', '系统访问控制', '', 'ui/view/admin/cip_admin_access_ctrl_list.html?actionId=cip_admin_access_ctrl_list', 'A', '2015-08-18 14:49:21', '2016-07-08 17:14:08', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_ctrl_searchData', '检索系统访问控制', '', '/actions/admin_access_ctrl/searchData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_ctrl_updateData', '修改系统访问控制', '', '/actions/admin_access_ctrl/updateData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_rel_addData', '新增系统与资源关系配置', '', '/actions/admin_access_rel/addData.do', 'B', '2015-08-20 21:11:16', '2015-08-20 21:11:16', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_rel_deleteData', '删除系统与资源关系配置', '', '/actions/admin_access_rel/deleteData.do', 'B', '2015-08-20 21:11:16', '2016-06-22 11:01:48', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_rel_exportEntities', '导出系统与资源关系配置', '', '/actions/admin_access_rel/exportEntities.do', 'B', '2015-08-20 21:11:16', '2015-08-20 21:11:16', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_rel_form', '系统与资源关系配置 表单', '', 'ui/view/admin/cip_admin_access_rel_form.html?actionId=cip_admin_access_rel_form', 'P', '2015-08-20 21:11:15', '2015-08-20 21:11:15', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_rel_getData', '获取系统与资源关系配置', '', '/actions/admin_access_rel/getData.do', 'B', '2015-08-20 21:11:16', '2016-06-22 11:03:33', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_rel_list', '系统与资源关系配置', '', 'ui/view/admin/cip_admin_access_rel_list.html?actionId=cip_admin_access_rel_list', 'A', '2015-08-20 21:11:15', '2015-08-20 21:11:15', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_rel_searchData', '检索系统与资源关系配置', '', '/actions/admin_access_rel/searchData.do', 'B', '2015-08-20 21:11:16', '2015-08-20 21:11:16', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_rel_updateData', '修改系统与资源关系配置', '', '/actions/admin_access_rel/updateData.do', 'B', '2015-08-20 21:11:16', '2015-08-20 21:11:16', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_res_addData', '新增系统访问资源配置', '', '/actions/admin_access_res/addData.do', 'B', '2015-08-20 21:11:16', '2015-08-20 21:11:16', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_res_deleteData', '删除系统访问资源配置', '', '/actions/admin_access_res/deleteData.do', 'B', '2015-08-20 21:11:16', '2016-06-22 11:01:55', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_res_exportEntities', '导出系统访问资源配置', '', '/actions/admin_access_res/exportEntities.do', 'B', '2015-08-20 21:11:16', '2015-08-20 21:11:16', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_res_form', '系统访问资源配置 表单', '', 'ui/view/admin/cip_admin_access_res_form.html?actionId=cip_admin_access_res_form', 'P', '2015-08-20 21:11:15', '2015-08-20 21:11:15', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_res_getData', '获取系统访问资源配置', '', '/actions/admin_access_res/getData.do', 'B', '2015-08-20 21:11:16', '2016-06-22 11:03:41', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_res_list', '系统访问资源配置', '', 'ui/view/admin/cip_admin_access_res_list.html?actionId=cip_admin_access_res_list', 'A', '2015-08-20 21:11:15', '2015-08-20 21:11:15', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_res_searchData', '检索系统访问资源配置', '', '/actions/admin_access_res/searchData.do', 'B', '2015-08-20 21:11:16', '2015-08-20 21:11:16', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_access_res_updateData', '修改系统访问资源配置', '', '/actions/admin_access_res/updateData.do', 'B', '2015-08-20 21:11:16', '2015-08-20 21:11:16', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_addBtn_form', '添加动作资源', '', 'ui/view/admin/cip_admin_addBtn_form.html?actionId=cip_admin_addBtn_form', 'P', '2016-06-28 17:05:38', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_addMegroup_form', '添加菜单组', '', 'ui/view/admin/cip_admin_addMegroup_form.html?actionId=cip_admin_addMegroup_form', 'P', '2016-06-28 17:21:51', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_addMenu_form', '添加菜单项', '', 'ui/view/admin/cip_admin_addMenu_form.html?actionId=cip_admin_addMenu_form', 'P', '2016-06-28 17:20:50', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_addPage_form', '添加页面资源', '', 'ui/view/admin/cip_admin_addPage_form.html?actionId=cip_admin_addPage_form', 'P', '2016-06-28 16:47:54', '2016-06-29 18:32:05', 'ROOT', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_act2obj_addData', '新增权限对象授权配置', '', '/actions/admin_auth_act2obj/addData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:54:21', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_act2obj_deleteData', '删除权限对象授权配置', '', '/actions/admin_auth_act2obj/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:02:02', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_act2obj_exportEntities', '导出权限对象授权配置', '', '/actions/admin_auth_act2obj/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_act2obj_form', '权限对象授权配置 表单', '', 'ui/view/admin/cip_admin_auth_act2obj_form.html?actionId=cip_admin_auth_act2obj_form', 'P', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_act2obj_getData', '获取权限对象授权配置', '', '/actions/admin_auth_act2obj/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:03:47', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_act2obj_list', '权限对象授权配置', '', 'ui/view/admin/cip_admin_auth_act2obj_list.html?actionId=cip_admin_auth_act2obj_list', 'A', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_act2obj_searchData', '检索权限对象授权配置', '', '/actions/admin_auth_act2obj/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_act2obj_updateData', '修改权限对象授权配置', '', '/actions/admin_auth_act2obj/updateData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:54:31', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_attr_addData', '新增', '', '/actions/admin_auth_attr/addData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:12:34', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_attr_deleteData', '删除', '', '/actions/admin_auth_attr/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 10:41:53', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_attr_exportEntities', '导出权限对象属性信息', '', '/actions/admin_auth_attr/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_attr_form', '权限对象属性信息 表单', '', 'ui/view/admin/cip_admin_auth_attr_form.html?actionId=cip_admin_auth_attr_form', 'P', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_attr_getData', '查看', '', '/actions/admin_auth_attr/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:18:55', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_attr_list', '权限对象属性信息', '', 'ui/view/admin/cip_admin_auth_attr_list.html?actionId=cip_admin_auth_attr_list', 'A', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_attr_searchData', '检索权限对象属性信息', '', '/actions/admin_auth_attr/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_attr_updateData', '修改', '', '/actions/admin_auth_attr/updateData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:12:10', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_new_attr_form', '新 权限对象属性信息 表单', '', 'ui/view/admin/cip_admin_auth_new_attr_form.html?actionId=cip_admin_auth_new_attr_form', 'P', '2016-06-15 09:45:27', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_new_attr_list', '新 权限对象属性信息', '', 'ui/view/admin/cip_admin_auth_new_attr_list.html?actionId=cip_admin_auth_new_attr_list', 'P', '2016-06-15 09:41:50', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_obj_addData', '新增', '', '/actions/admin_auth_obj/addData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:11:11', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_obj_deleteData', '删除', '', '/actions/admin_auth_obj/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 10:42:00', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_obj_exportEntities', '导出权限对象信息', '', '/actions/admin_auth_obj/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_obj_form', '权限对象信息 表单', '', 'ui/view/admin/cip_admin_auth_obj_form.html?actionId=cip_admin_auth_obj_form', 'P', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_obj_getData', '查看', '', '/actions/admin_auth_obj/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:19:03', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_obj_list', '权限对象信息', '', 'ui/view/admin/cip_admin_auth_obj_list.html?actionId=cip_admin_auth_obj_list', 'A', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_obj_searchData', '检索权限对象信息', '', '/actions/admin_auth_obj/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_obj_updateData', '修改', '', '/actions/admin_auth_obj/updateData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:11:31', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_perTree_removePreTree', '删除已选资源', '', '/actions/admin_auth_perTree/removePreTree.do', 'B', '2016-06-20 14:19:13', '2016-06-22 11:02:08', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_perTree_savePreTree', '保存数据资源树', '', '/actions/admin_auth_perTree/savePreTree.do', 'B', '2016-06-16 19:09:45', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_perTree_searchSource', '查询分配属性来源的权限对象', '', '/actions/admin_auth_perTree/searchSource.do', 'B', '2016-06-23 13:28:33', '2016-06-23 13:47:33', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_perTree_setSource', '分配数据属性值来源', '', '/actions/admin_auth_perTree/setSource.do', 'B', '2016-06-22 13:08:01', null, 'root', 'icon-set');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_perTree_updataAct2objSource', '更新数据', '', '/actions/admin_auth_perTree/updataAct2objSource.do', 'B', '2016-06-23 13:23:29', '2016-06-23 13:26:57', 'ROOT', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_perTree_updataSource', '修改属性值配置', '', '/actions/admin_auth_perTree/updataSource.do', 'B', '2016-06-23 09:17:32', '2016-06-23 19:53:47', 'root', 'icon-it');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_preTree_getActionTreeData', '获得权限配置树', '', '/actions/admin_auth_perTree/getActionTree.do', 'B', '2016-06-16 11:41:35', '2016-06-16 11:47:03', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_preTree_getSearchTree', '条件查询动作树', '', '/actions/admin_auth_perTree/getSearchTree.do', 'B', '2016-06-20 16:57:51', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_preTree_uncheckResTreeData', '获得未分配资源树', '', '/actions/admin_auth_perTree/uncheckResTree.do', 'B', '2016-06-20 12:27:56', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_role_addData', '新增角色权限值配置', '', '/actions/admin_auth_role/addData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:48:41', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_role_deleteData', '删除角色权限值配置', '', '/actions/admin_auth_role/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:02:17', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_role_exportEntities', '导出角色权限值配置', '', '/actions/admin_auth_role/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_role_form', '角色权限值配置 表单', '', 'ui/view/admin/cip_admin_auth_role_form.html?actionId=cip_admin_auth_role_form', 'P', '2015-05-18 13:03:53', '2016-06-29 18:54:51', 'ROOT', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_role_getData', '获取角色权限值配置', '', '/actions/admin_auth_role/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:03:54', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_role_list', '角色权限值配置', '', 'ui/view/admin/cip_admin_auth_role_list.html?actionId=cip_admin_auth_role_list', 'A', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_role_searchData', '检索角色权限值配置', '', '/actions/admin_auth_role/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_role_updateData', '修改角色权限值配置', '', '/actions/admin_auth_role/updateData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:48:50', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_rootResource_addData', '新增', '', '/actions/admin_roles/addData.do', 'B', '2016-07-05 13:05:44', null, 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_rootResource_deleteData', '删除', '', '/actions/admin_roles/deleteData.do', 'B', '2016-07-05 13:08:42', null, 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_rootResource_form', '新 资源根节点表单', '', 'ui/view/admin/cip_admin_auth_rootResource_form.html?actionId=cip_admin_auth_rootResource_form', 'P', '2016-06-22 10:23:53', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_rootResource_getData', '查看', '', '/actions/admin_roles/getData.do', 'B', '2016-07-05 13:07:28', null, 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_rootResource_list', '新 资源根节点', '', 'ui/view/admin/cip_admin_auth_rootResource_list.html?actionId=cip_admin_auth_rootResource_list', 'P', '2016-06-15 11:15:39', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_rootResource_updateData', '修改', '', '/actions/admin_roles/updateData.do', 'B', '2016-07-05 13:09:53', null, 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_setSource_form', '修改分配来源 表单', '', 'ui/view/admin/cip_admin_auth_setSource_form.html?actionId=cip_admin_auth_setSource_form', 'P', '2016-06-23 09:24:39', '2016-06-23 09:48:26', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_setSource_list', '分配数据属性来源 页面', '', 'ui/view/admin/cip_admin_auth_setSource_list.html?actionId=cip_admin_auth_setSource_list', 'P', '2016-06-22 13:21:17', '2016-06-22 13:50:24', 'ROOT', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_user_addData', '新增用户权限字段配置', '', '/actions/admin_auth_user/addData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:51:37', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_user_deleteData', '删除用户权限字段配置', '', '/actions/admin_auth_user/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:02:23', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_user_exportEntities', '导出用户权限字段配置', '', '/actions/admin_auth_user/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_user_form', '用户权限字段配置 表单', '', 'ui/view/admin/cip_admin_auth_user_form.html?actionId=cip_admin_auth_user_form', 'P', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_user_getData', '获取用户权限字段配置', '', '/actions/admin_auth_user/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:04:00', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_user_list', '用户权限字段配置', '', 'ui/view/admin/cip_admin_auth_user_list.html?actionId=cip_admin_auth_user_list', 'A', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_user_searchData', '检索用户权限字段配置', '', '/actions/admin_auth_user/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_auth_user_updateData', '修改用户权限字段配置', '', '/actions/admin_auth_user/updateData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:51:46', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_change_password', '修改密码 页面', '', 'admin/cip_admin_change_password.html', 'P', '2015-12-28 10:49:06', '2016-08-03 17:42:22', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_codes_addData', '新增数据编码', '', '/actions/admin_codes/addData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:41:43', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_codes_deleteData', '删除数据编码', '', '/actions/admin_codes/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:02:32', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_codes_exportEntities', '导出数据编码', '', '/actions/admin_codes/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_codes_form', '数据编码 表单', '', 'ui/view/admin/cip_admin_codes_form.html?actionId=cip_admin_codes_form', 'P', '2015-05-18 13:03:53', '2016-06-21 20:41:53', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_codes_getData', '获取数据编码', '', '/actions/admin_codes/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:04:21', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_codes_list', '数据编码', '', 'ui/view/admin/cip_admin_codes_list.html?actionId=cip_admin_codes_list', 'A', '2015-05-18 13:03:53', '2015-05-18 13:03:53', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_codes_searchData', '检索数据编码', '', '/actions/admin_codes/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_codes_updateData', '修改数据编码', '', '/actions/admin_codes/updateData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:55:22', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_addData', '新增通用查询配置表', '', '/actions/admin_commonquery/addData.do', 'B', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_deleteData', '删除通用查询配置表', '', '/actions/admin_commonquery/deleteData.do', 'B', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_exportEntities', '导出通用查询配置表', '', '/actions/admin_commonquery/exportEntities.do', 'B', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_form', '通用查询配置表 表单', '', 'ui/view/admin/cip_admin_commonquery_form.html?actionId=cip_admin_commonquery_form', 'P', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_getData', '获取通用查询配置表', '', '/actions/admin_commonquery/getData.do', 'B', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_list', '通用查询配置表', '', 'ui/view/admin/cip_admin_commonquery_list.html?actionId=cip_admin_commonquery_list', 'A', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_param_form', '通用查询配置参数 表单', '', 'ui/view/admin/cip_admin_commonquery_param_form.html?actionId=cip_admin_commonquery_param_form', 'P', '2016-08-05 14:25:40', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_searchData', '检索通用查询配置表', '', '/actions/admin_commonquery/searchData.do', 'B', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_commonquery_updateData', '修改通用查询配置表', '', '/actions/admin_commonquery/updateData.do', 'B', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_domain_addData', '新增数据域信息', '', '/actions/admin_domain/addData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:40:35', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_domain_deleteData', '删除数据域信息', '', '/actions/admin_domain/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:02:38', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_domain_exportEntities', '导出数据域信息', '', '/actions/admin_domain/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_domain_form', '数据域信息 表单', '', 'ui/view/admin/cip_admin_domain_form.html?actionId=cip_admin_domain_form', 'P', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_domain_getData', '获取数据域信息', '', '/actions/admin_domain/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:04:33', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_domain_list', '数据域信息', '', 'ui/view/admin/cip_admin_domain_list.html?actionId=cip_admin_domain_list', 'A', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_domain_searchData', '检索数据域信息', '', '/actions/admin_domain/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_domain_updateData', '修改数据域信息', '', '/actions/admin_domain/updateData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:54:48', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_access_addData', '新增本地日志-系统访问', '', '/actions/admin_log_access/addData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_access_deleteData', '删除本地日志-系统访问', '', '/actions/admin_log_access/deleteData.do', 'B', '2015-08-26 20:45:49', '2016-06-22 11:02:44', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_access_exportEntities', '导出本地日志-系统访问', '', '/actions/admin_log_access/exportEntities.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_access_form', '本地日志-系统访问 表单', '', 'ui/view/admin/cip_admin_log_access_form.html?actionId=cip_admin_log_access_form', 'P', '2015-08-26 20:45:48', '2015-08-26 20:45:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_access_getData', '获取本地日志-系统访问', '', '/actions/admin_log_access/getData.do', 'B', '2015-08-26 20:45:49', '2016-06-22 11:04:39', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_access_list', '本地日志-系统访问', '', 'ui/view/admin/cip_admin_log_access_list.html?actionId=cip_admin_log_access_list', 'A', '2015-08-26 20:45:48', '2015-08-26 20:45:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_access_searchData', '检索本地日志-系统访问', '', '/actions/admin_log_access/searchData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_access_updateData', '修改本地日志-系统访问', '', '/actions/admin_log_access/updateData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_job_addData', '新增本地日志-作业日志', '', '/actions/admin_log_job/addData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_job_deleteData', '删除本地日志-作业日志', '', '/actions/admin_log_job/deleteData.do', 'B', '2015-08-26 20:45:49', '2016-06-22 11:02:50', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_job_exportEntities', '导出本地日志-作业日志', '', '/actions/admin_log_job/exportEntities.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_job_form', '本地日志-作业日志 表单', '', 'ui/view/admin/cip_admin_log_job_form.html?actionId=cip_admin_log_job_form', 'P', '2015-08-26 20:45:48', '2015-08-26 20:45:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_job_getData', '获取本地日志-作业日志', '', '/actions/admin_log_job/getData.do', 'B', '2015-08-26 20:45:49', '2016-06-22 11:04:45', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_job_list', '本地日志-作业日志', '', 'ui/view/admin/cip_admin_log_job_list.html?actionId=cip_admin_log_job_list', 'A', '2015-08-26 20:45:48', '2015-08-26 20:45:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_job_searchData', '检索本地日志-作业日志', '', '/actions/admin_log_job/searchData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_job_updateData', '修改本地日志-作业日志', '', '/actions/admin_log_job/updateData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_mdm_addData', '新增本地日志-主数据变更', '', '/actions/admin_log_mdm/addData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_mdm_deleteData', '删除本地日志-主数据变更', '', '/actions/admin_log_mdm/deleteData.do', 'B', '2015-08-26 20:45:49', '2016-06-22 11:02:58', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_mdm_exportEntities', '导出本地日志-主数据变更', '', '/actions/admin_log_mdm/exportEntities.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_mdm_form', '本地日志-主数据变更 表单', '', 'ui/view/admin/cip_admin_log_mdm_form.html?actionId=cip_admin_log_mdm_form', 'P', '2015-08-26 20:45:48', '2015-08-26 20:45:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_mdm_getData', '获取本地日志-主数据变更', '', '/actions/admin_log_mdm/getData.do', 'B', '2015-08-26 20:45:49', '2016-06-22 11:04:51', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_mdm_list', '本地日志-主数据变更', '', 'ui/view/admin/cip_admin_log_mdm_list.html?actionId=cip_admin_log_mdm_list', 'A', '2015-08-26 20:45:48', '2015-08-26 20:45:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_mdm_searchData', '检索本地日志-主数据变更', '', '/actions/admin_log_mdm/searchData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_log_mdm_updateData', '修改本地日志-主数据变更', '', '/actions/admin_log_mdm/updateData.do', 'B', '2015-08-26 20:45:49', '2015-08-26 20:45:49', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_new_codes_form', '新增数据编码 表单', '', 'ui/view/admin/cip_admin_new_codes_form.html?actionId=cip_admin_new_codes_form\r\n\r\n', 'P', '2016-06-13 16:08:05', '2016-06-13 16:45:04', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_new_codes_list', '新增编辑', '', 'ui/view/admin/cip_admin_new_codes_list.html?actionId=cip_admin_new_codes_list', 'P', '2016-06-08 11:30:18', '2016-06-27 15:16:11', 'ROOT', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_new_role_resource_addResource', '分配资源', '', '/actions/admin_resource_2_resource/addResources.do', 'B', '2016-06-29 17:12:07', '2016-06-29 17:27:29', 'root', 'icon-set');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_new_role_resource_form', '系统资源信息 表单', '', 'ui/view/admin/cip_admin_resource_form.html?actionId=cip_admin_resource_form', 'P', '2016-07-05 13:16:33', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_new_role_resource_getResource', '查询根节点角色下未分配的资源', '', '/actions/admin_roles/getResources.do', 'P', '2016-06-29 16:30:29', null, 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_new_role_resource_list', '角色未分配的资源信息添加 页面', '', 'ui/view/admin/cip_admin_new_role_resource_list.html?actionId=cip_admin_new_role_resource_list', 'P', '2016-06-29 16:12:27', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_new_role_resource_updateData', '修改', '', '/actions/admin_resource/updateData.do', 'B', '2016-07-05 13:19:50', null, 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_operateRoles_list', '角色信息操作', '', 'ui/view/admin/cip_admin_operateRoles_list.html?actionId=cip_admin_operateRoles_list', 'A', '2016-06-30 10:06:46', null, 'root', 'icon-menu');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_op_log_exportEntities', '导出系统操作日志', '', '/actions/admin_op_log/exportEntities.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:56:29', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_op_log_form', '系统操作日志 表单', '', 'ui/view/admin/cip_admin_op_log_form.html?actionId=cip_admin_op_log_form', 'P', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_op_log_list', '系统操作日志', '', 'ui/view/admin/cip_admin_op_log_list.html?actionId=cip_admin_op_log_list', 'A', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_op_log_searchData', '检索系统操作日志', '', '/actions/admin_op_log/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_addData', '新增系统问题反馈', '', '/actions/admin_question/addData.do', 'B', '2015-12-25 13:45:43', '2016-07-21 16:51:57', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_deleteData', '删除系统问题反馈', '', '/actions/admin_question/deleteData.do', 'B', '2015-12-25 13:45:43', '2016-06-22 11:03:04', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_exportEntities', '导出系统问题反馈', '', '/actions/admin_question/exportEntities.do', 'B', '2015-12-25 13:45:43', '2015-12-25 13:45:43', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_form', '系统问题反馈 表单', '', 'ui/view/admin/cip_admin_question_form.html?actionId=cip_admin_question_form', 'P', '2015-12-25 13:45:43', '2015-12-25 13:45:43', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_getData', '获取系统问题反馈', '', '/actions/admin_question/getData.do', 'B', '2015-12-25 13:45:43', '2016-06-22 11:04:57', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_handleData', '回复', '', '/actions/admin_question/handleData.do', 'B', '2015-12-25 13:45:43', '2016-07-21 16:52:29', 'root', 'icon-redo');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_list', '系统问题反馈', '', 'ui/view/admin/cip_admin_question_list.html?actionId=cip_admin_question_list', 'A', '2015-12-25 13:45:43', '2015-12-25 13:45:43', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_searchData', '检索系统问题反馈', '', '/actions/admin_question/searchData.do', 'B', '2015-12-25 13:45:43', '2015-12-25 13:45:43', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_question_updateData', '修改系统问题反馈', '', '/actions/admin_question/updateData.do', 'B', '2015-12-25 13:45:43', '2016-07-21 16:53:00', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_addData', '新增系统队列信息', '', '/actions/admin_queue/addData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_deleteData', '删除系统队列信息', '', '/actions/admin_queue/deleteData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_exportEntities', '导出系统队列信息', '', '/actions/admin_queue/exportEntities.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_form', '系统队列信息 表单', '', 'ui/view/admin/cip_admin_queue_form.html?actionId=cip_admin_queue_form', 'P', '2015-08-18 14:49:21', '2015-08-18 14:49:21', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_getData', '获取系统队列信息', '', '/actions/admin_queue/getData.do', 'B', '2015-08-18 14:49:22', '2016-06-22 11:05:29', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_list', '系统队列信息', '', 'ui/view/admin/cip_admin_queue_list.html?actionId=cip_admin_queue_list', 'A', '2015-08-18 14:49:21', '2015-08-18 14:49:21', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_searchData', '检索系统队列信息', '', '/actions/admin_queue/searchData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_type_dm_addData', '新增系统队列配置', '', '/actions/admin_queue_type_dm/addData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_type_dm_deleteData', '删除系统队列配置', '', '/actions/admin_queue_type_dm/deleteData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_type_dm_exportEntities', '导出系统队列配置', '', '/actions/admin_queue_type_dm/exportEntities.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_type_dm_form', '系统队列配置 表单', '', 'ui/view/admin/cip_admin_queue_type_dm_form.html?actionId=cip_admin_queue_type_dm_form', 'P', '2015-08-18 14:49:21', '2015-08-18 14:49:21', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_type_dm_getData', '获取系统队列配置', '', '/actions/admin_queue_type_dm/getData.do', 'B', '2015-08-18 14:49:22', '2016-06-22 11:05:36', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_type_dm_list', '系统队列配置', '', 'ui/view/admin/cip_admin_queue_type_dm_list.html?actionId=cip_admin_queue_type_dm_list', 'A', '2015-08-18 14:49:21', '2015-08-18 14:49:21', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_type_dm_searchData', '检索系统队列配置', '', '/actions/admin_queue_type_dm/searchData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_type_dm_updateData', '修改系统队列配置', '', '/actions/admin_queue_type_dm/updateData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_queue_updateData', '修改系统队列信息', '', '/actions/admin_queue/updateData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_addData', '新增Redis数据概要', '', '/actions/admin_redis/addData.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:44:45', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_deleteData', '删除Redis数据概要', '', '/actions/admin_redis/deleteData.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:44:52', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_exportEntities', '导出Redis数据概要', '', '/actions/admin_redis/exportEntities.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:57:15', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_form', 'Redis数据概要 表单', '', 'ui/view/admin/cip_admin_redis_form.html?actionId=cip_admin_redis_form', 'P', '2015-08-29 10:57:45', '2015-08-29 10:57:45', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_getData', '获取Redis数据概要', '', '/actions/admin_redis/getData.do', 'B', '2015-08-29 10:57:46', '2016-06-22 11:05:43', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_list', 'Redis数据概要', '', 'ui/view/admin/cip_admin_redis_list.html?actionId=cip_admin_redis_list', 'A', '2015-08-29 10:57:45', '2015-08-29 10:57:45', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_reloadData', '刷新redis数据', '', '/actions/admin_redis/reloadData.do', 'B', '2016-08-02 16:55:19', '2016-08-03 09:28:21', 'root', 'icon-reload');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_searchData', '检索Redis数据概要', '', '/actions/admin_redis/searchData.do', 'B', '2015-08-29 10:57:46', '2015-08-29 10:57:46', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_updateData', '修改Redis数据概要', '', '/actions/admin_redis/updateData.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:45:11', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_val_addData', '新增Redis数据明细', '', '/actions/admin_redis_val/addData.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:45:26', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_val_deleteData', '删除Redis数据明细', '', '/actions/admin_redis_val/deleteData.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:45:34', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_val_exportEntities', '导出Redis数据明细', '', '/actions/admin_redis_val/exportEntities.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:57:01', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_val_form', 'Redis数据明细 表单', '', 'ui/view/admin/cip_admin_redis_val_form.html?actionId=cip_admin_redis_val_form', 'P', '2015-08-29 10:57:45', '2015-08-29 10:57:45', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_val_getData', '获取Redis数据明细', '', '/actions/admin_redis_val/getData.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:45:52', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_val_list', 'Redis数据明细', '', 'ui/view/admin/cip_admin_redis_val_list.html?actionId=cip_admin_redis_val_list', 'A', '2015-08-29 10:57:45', '2015-08-29 10:57:45', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_val_searchData', '检索Redis数据明细', '', '/actions/admin_redis_val/searchData.do', 'B', '2015-08-29 10:57:46', '2015-08-29 10:57:46', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_redis_val_updateData', '修改Redis数据明细', '', '/actions/admin_redis_val/updateData.do', 'B', '2015-08-29 10:57:46', '2016-07-21 16:46:05', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_addAndConfigRes', '添加系统资源', '', '/actions/admin_resource_2_resource/addAndConfigRes.do', 'B', '2016-06-28 15:18:50', '2016-06-29 18:39:26', 'ROOT', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_addData', '新增资源与资源关系', '', '/actions/admin_resource_2_resource/addData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:47:23', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_deleteData', '删除资源与资源关系', '', '/actions/admin_resource_2_resource/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:47:30', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_exportEntities', '导出资源与资源关系', '', '/actions/admin_resource_2_resource/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_form', '资源与资源关系 表单', '', 'ui/view/admin/cip_admin_resource_2_resource_form.html?actionId=cip_admin_resource_2_resource_form', 'P', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_getData', '获取资源与资源关系', '', '/actions/admin_resource_2_resource/getData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:47:43', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_list', '资源与资源关系', '', 'ui/view/admin/cip_admin_resource_2_resource_list.html?actionId=cip_admin_resource_2_resource_list', 'A', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_searchData', '检索资源与资源关系', '', '/actions/admin_resource_2_resource/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_2_resource_updateData', '修改资源与资源关系', '', '/actions/admin_resource_2_resource/updateData.do', 'B', '2015-05-21 13:59:48', '2016-07-21 16:47:53', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_addButton', '动作按钮', '', '/actions/admin_resource/addData.do', 'B', '2016-06-03 11:04:32', '2016-06-03 16:37:23', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_addData', '新增系统资源信息', '', '/actions/admin_resource/addData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_addGroupMenu', '菜单组', '', '/actions/admin_resource/addData.do', 'B', '2016-06-03 11:25:12', '2016-06-03 16:37:51', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_addMenu', '菜单项', '', '/actions/admin_resource/addData.do', 'B', '2016-06-03 11:01:23', '2016-06-13 13:11:41', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_addPage', '页面', '', '/actions/admin_resource/addData.do', 'B', '2016-06-03 11:06:47', '2016-06-03 17:11:33', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_add_form', '新增系统资源信息 表单', '', 'ui/view/admin/cip_admin_resource_add_form.html?actionId=cip_admin_resource_add_form', 'P', '2016-06-03 09:55:29', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_deleteData', '删除', '', '/actions/admin_resource/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:13:08', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_exportEntities', '导出系统资源信息', '', '/actions/admin_resource/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_form', '系统资源信息 表单', '', 'ui/view/admin/cip_admin_resource_form.html?actionId=cip_admin_resource_form', 'P', '2015-05-18 13:03:54', '2016-06-29 18:48:39', 'ROOT', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_getData', '查看', '', '/actions/admin_resource/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:12:07', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_list', '系统资源信息', '', 'ui/view/admin/cip_admin_resource_list.html?actionId=cip_admin_resource_list', 'A', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_searchData', '检索系统资源信息', '', '/actions/admin_resource/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_selectIcon', '新增图标', '', '/actions/admin_resource/selectIcon.do?actionId=cip_admin_resource_selectIcon', 'B', '2016-06-08 10:58:30', '2016-06-12 11:35:57', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_tree_list', '角色未分配资源树', '', 'ui/view/admin/cip_admin_resource_tree_list.html?actionId=cip_admin_resource_tree_list', 'P', '2016-06-20 09:18:04', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_updateData', '修改', '', '/actions/admin_resource/updateData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:13:31', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_rolesTree_list', '角色树定义', '', 'ui/view/admin/cip_admin_rolesTree_list.html?actionId=cip_admin_rolesTree_list', 'A', '2016-06-27 10:33:03', '2016-06-29 18:54:09', 'ROOT', 'icon-menu');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_addData', '新增', '', '/actions/admin_roles/addData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:16:21', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_addUser', '分配用户', '', '/actions/admin_roles/updateData.do', 'B', '2016-06-06 11:04:42', '2016-06-12 16:17:18', 'root', 'icon-post');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_deleteData', '删除', '', '/actions/admin_roles/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:16:38', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_deleteRes', '删除资源', '', '/actions/admin_roles/deleteRes.do?actionId=cip_admin_roles_deleteRes', 'B', '2016-06-29 09:52:09', null, 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_exportEntities', '导出角色信息', '', '/actions/admin_roles/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_form', '角色信息 表单', '', 'ui/view/admin/cip_admin_roles_form.html?actionId=cip_admin_roles_form', 'P', '2015-05-18 13:03:54', '2016-06-29 18:49:02', 'ROOT', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_getBtn', '获得页面下的动作', '', '/actions/admin_roles/getBtn.do', 'B', '2016-06-27 18:28:23', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_getBtnAndPage', '获得菜单项下的动作和页面', '', '/actions/admin_roles/getBtnAndPage.do', 'B', '2016-06-27 16:16:44', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_getCheckData', '获取选中节点信息', '', '/actions/admin_roles/getCheckData.do', 'B', '2016-07-04 14:11:19', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_getData', '查看', '', '/actions/admin_roles/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:17:14', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_getModelTreet', '获得根节点资源树', '', '/actions/admin_roles/getModelTree.do', 'B', '2016-07-01 10:34:37', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_list', '角色信息', '', 'ui/view/admin/cip_admin_roles_list.html?actionId=cip_admin_roles_list', 'A', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_saveModelTree', '保存已选资源树', '', '/actions/admin_roles/saveModelTree.do', 'B', '2016-07-01 11:30:59', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_saveTreeData', '保存角色资源树', '', '/actions/admin_roles/saveTree.do', 'P', '2015-07-16 14:24:15', '2015-07-16 17:13:56', '29999235', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_searchData', '检索角色信息', '', '/actions/admin_roles/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_updateData', '修改', '', '/actions/admin_roles/updateData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:16:49', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_roles_users_form', '新增角色用户表单', '', 'ui/view/admin/cip_admin_roles_users_form.html?actionId=cip_admin_roles_users_form', 'P', '2016-06-06 11:28:21', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_2_user_addUser', '添加角色用户', '', '/actions/admin_role_2_user/addUser.do?actionId=cip_admin_role_2_user_addUser', 'B', '2016-06-06 21:10:48', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_2_user_move', '移除角色用户', '', '/actions/admin_role_2_user/moveUser.do?actionId=cip_admin_role_2_user_move', 'B', '2016-06-06 20:07:51', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_2_user_searchData', '查询角色用户', '', '/actions/admin_role_2_user/searchData.do?actionId=cip_admin_role_2_user_searchData', 'B', '2016-06-06 16:29:50', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_2_user_searchUser', '查询未添加角色用户', '', '/actions/admin_role_2_user/searchUser.do?actionId=cip_admin_role_2_user_searchUser', 'B', '2016-06-06 17:07:09', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_getDefaultTreeData', '获取根节点default的资源树', '', '/actions/admin_roles/getDefaultTree.do', 'P', '2016-06-27 14:16:33', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_getMaxLevel', '获得最大层级数', '', '/actions/admin_roles/getMaxLevel.do', 'B', '2016-07-06 09:47:23', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_getResTreeData', '获取角色资源树', '', '/actions/admin_roles/getResTree.do', 'P', '2015-07-15 16:11:58', null, '29999235', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_resource_addData', '分配角色资源', '', '/actions/admin_roles/addResources.do', 'B', '2015-07-16 16:03:17', '2015-07-16 16:05:32', '29999235', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_resource_list', '角色未分配资源信息', '', 'ui/view/admin/cip_admin_role_resource_list.html', 'P', '2015-07-16 11:34:58', null, '29999235', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_resource_searchData', '检索角色未分配资源', '', '/actions/admin_roles/searchResources.do', 'B', '2015-07-16 17:25:47', null, '29999235', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_role_searchNodeId', '查询已有资源', '', '/actions/admin_roles/searchNodeId.do', 'B', '2016-06-30 14:10:03', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_run_log_getLogData', '获取系统运行日志信息', '', '/actions/admin_op_log/getLogData.do', 'P', '2016-07-07 13:26:14', null, 'root', 'icon-accept');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_run_log_getLogMessage', '查看运行日志详情', '', '/actions/admin_op_log/getLogMessage.do', 'P', '2016-07-07 16:01:05', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_run_log_list', '系统运行日志', '记录系统运行的日志，赋予查看功能', 'ui/view/admin/cip_admin_run_log_list.html?actionId=cip_admin_run_log_list', 'A', '2016-07-07 11:03:49', null, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_text_addData', '新增系统文本管理', '', '/actions/admin_text/addData.do', 'B', '2015-08-18 14:49:22', '2016-07-21 16:43:36', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_text_deleteData', '删除系统文本管理', '', '/actions/admin_text/deleteData.do', 'B', '2015-08-18 14:49:22', '2016-07-21 16:43:12', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_text_exportEntities', '导出系统文本管理', '', '/actions/admin_text/exportEntities.do', 'B', '2015-08-18 14:49:22', '2016-07-21 16:55:44', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_text_form', '系统文本管理 表单', '', 'ui/view/admin/cip_admin_text_form.html?actionId=cip_admin_text_form', 'P', '2015-08-18 14:49:21', '2015-08-18 14:49:21', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_text_getData', '获取系统文本管理', '', '/actions/admin_text/getData.do', 'B', '2015-08-18 14:49:22', '2016-07-21 16:42:46', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_text_list', '系统文本管理', '', 'ui/view/admin/cip_admin_text_list.html?actionId=cip_admin_text_list', 'A', '2015-08-18 14:49:21', '2015-08-18 14:49:21', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_text_searchData', '检索系统文本管理', '', '/actions/admin_text/searchData.do', 'B', '2015-08-18 14:49:22', '2015-08-18 14:49:22', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_text_updateData', '修改系统文本管理', '', '/actions/admin_text/updateData.do', 'B', '2015-08-18 14:49:22', '2016-07-21 16:44:11', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_updataResource_form', '修改资源信息表单', '', 'ui/view/admin/cip_admin_updataResource_form.html?actionId=cip_admin_updataResource_form', 'P', '2016-06-29 18:38:23', null, 'ROOT', 'icon-log');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_2_roles_addData', '新增', '', '/actions/admin_user_2_roles/addData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:09:58', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_2_roles_deleteData', '删除', '', '/actions/admin_user_2_roles/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:08:32', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_2_roles_exportEntities', '导出用户角色关联', '', '/actions/admin_user_2_roles/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_2_roles_form', '用户角色关联 表单', '', 'ui/view/admin/cip_admin_user_2_roles_form.html?actionId=cip_admin_user_2_roles_form', 'P', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_2_roles_getData', '获取', '', '/actions/admin_user_2_roles/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:08:08', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_2_roles_list', '用户角色关联', '', 'ui/view/admin/cip_admin_user_2_roles_list.html?actionId=cip_admin_user_2_roles_list', 'A', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_2_roles_searchData', '检索用户角色关联', '', '/actions/admin_user_2_roles/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_2_roles_updateData', '修改', '', '/actions/admin_user_2_roles/updateData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 11:10:54', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_addData', '新增', '', '/actions/admin_user/addData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:24:56', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_changepwd', '修改密码', '', '/actions/admin_user/setpasswdData.do', 'B', '2016-06-03 14:16:23', '2016-06-13 10:43:23', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_changepwdData', '修改密码', '', '/actions/admin_user/changepwdData.do', 'B', '2016-06-03 14:09:18', '2016-06-03 14:33:37', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_changepwd_form', '修改用户密码 表单', '', 'ui/view/admin/cip_admin_user_changepwd_form.html?actionId=cip_admin_user_changepwd_form', 'P', '2016-06-03 13:31:39', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_changeusername', '修改名称', '', '/actions/admin_user/updateData.do', 'B', '2016-06-03 14:41:29', '2016-06-13 10:43:47', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_cutroleData', '移除角色用户关联', '', '/actions/admin_user/cutroleData.do', 'B', '2016-06-12 09:34:07', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_deleteData', '删除', '', '/actions/admin_user/deleteData.do', 'B', '2015-05-21 13:59:48', '2016-06-22 10:42:09', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_exportEntities', '导出用户信息', '', '/actions/admin_user/exportEntities.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_form', '用户信息 表单', '', 'ui/view/admin/cip_admin_user_form.html?actionId=cip_admin_user_form', 'P', '2015-05-18 13:03:54', '2015-05-18 13:03:54', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_getData', '查看', '', '/actions/admin_user/getData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:24:36', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_getoldroleData', '获取已分配角色信息', '', '/actions/admin_user/getoldroleData.do', 'B', '2016-06-08 10:10:25', '2016-06-12 14:28:59', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_list', '用户信息', '', 'ui/view/admin/cip_admin_user_list.html?actionId=cip_admin_user_list', 'A', '2015-05-18 13:03:54', '2016-06-29 18:50:46', 'ROOT', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_searchData', '检索用户信息', '', '/actions/admin_user/searchData.do', 'B', '2015-05-21 13:59:48', '2015-05-21 13:59:48', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_searchroleData', '获取未分配角色信息', '', '/actions/admin_user/searchroleData.do', 'B', '2016-06-06 12:33:29', '2016-06-12 14:27:00', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setrole', '分配角色', '', '/actions/admin_user/setrole.do', 'B', '2016-06-06 13:00:44', '2016-06-12 15:48:50', 'root', 'icon-role');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setroleData', '新增', '', '/actions/admin_user/setroleData.do', 'B', '2016-06-06 17:00:31', '2016-06-22 11:09:14', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setrole_form', '分配角色 表单', '', 'ui/view/admin/cip_admin_user_setrole_form.html?actionId=cip_admin_user_setrole_form', 'P', '2016-06-06 09:44:58', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setting_addData', '新增用户信息设置', '', '/actions/admin_user_setting/addData.do', 'B', '2015-07-27 13:50:24', '2016-07-21 16:50:38', 'root', 'icon-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setting_deleteData', '删除用户信息设置', '', '/actions/admin_user_setting/deleteData.do', 'B', '2015-07-27 13:50:24', '2016-07-21 16:50:45', 'root', 'icon-remove');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setting_exportEntities', '导出用户信息设置', '', '/actions/admin_user_setting/exportEntities.do', 'B', '2015-07-27 13:50:24', '2015-07-27 13:50:24', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setting_form', '用户信息设置 表单', '', 'ui/view/admin/cip_admin_user_setting_form.html?actionId=cip_admin_user_setting_form', 'P', '2015-07-27 14:53:26', '2015-07-27 14:53:26', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setting_getData', '获取用户信息设置', '', '/actions/admin_user_setting/getData.do', 'B', '2015-07-27 13:50:24', '2016-07-21 16:50:58', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setting_list', '用户信息设置', '', 'ui/view/admin/cip_admin_user_setting_list.html?actionId=cip_admin_user_setting_list', 'A', '2015-07-27 14:53:26', '2015-07-27 14:53:26', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setting_searchData', '检索用户信息设置', '', '/actions/admin_user_setting/searchData.do', 'B', '2015-07-27 13:50:24', '2015-07-27 13:50:24', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_setting_updateData', '修改用户信息设置', '', '/actions/admin_user_setting/updateData.do', 'B', '2015-07-27 13:50:24', '2016-07-21 16:51:07', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user_updateData', '修改其他信息', '', '/actions/admin_user/updateData.do', 'B', '2015-05-21 13:59:48', '2016-06-21 20:26:39', 'root', 'icon-edit');
REPLACE INTO `cip_admin_resource` VALUES ('cip_log', '日志管理', '', '', 'F', '2015-09-02 14:08:32', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_mdm_bigareas_getBigareas', '获取大区信息', '获取大区基本信息', '/actions/mdm/bigareas.do', 'B', '2016-07-25 16:20:12', '2016-07-25 16:21:07', 'root', 'icon-mini-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_mdm_bigarea_provinces_getProvsByBigarea', '根据大区获取省信息', '', '/actions/mdm/bigarea/provinces.do', 'B', '2016-07-25 16:22:13', null, 'root', 'icon-mini-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_mdm_cities_getCities', '获取省下辖市信息', '', '/actions/mdm/cities.do', 'B', '2016-07-25 16:26:25', null, 'root', 'icon-mini-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_mdm_counties_getCounties', '获取市下属区县信息', '', '/actions/mdm/counties.do', 'B', '2016-07-25 16:27:46', null, 'root', 'icon-mini-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_mdm_orgs_getOrgs', '获取指定城市下属网点和服务部列表', '', '/actions/mdm/orgs.do', 'B', '2016-07-25 16:28:46', null, 'root', 'icon-mini-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_mdm_provinces_getProvinces', '获取省信息', '', '/actions/mdm/provinces.do', 'B', '2016-07-25 16:25:26', null, 'root', 'icon-mini-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_mdm_province_orgs_getOrgsByProv', '获取指定省机构列表', '', '/actions/mdm/province/orgs.do', 'B', '2016-07-25 16:29:23', null, 'root', 'icon-mini-add');
REPLACE INTO `cip_admin_resource` VALUES ('cip_query', '查询语句管理', '', '', 'F', '2016-08-04 13:17:07', '2016-08-04 13:17:07', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_queue', '队列管理', '', '', 'F', '2015-09-02 14:14:54', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_redis', 'Redis管理', '', '', 'F', '2015-09-02 14:06:01', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_resource', '资源管理', '', '', 'F', '2015-09-02 14:13:41', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_role', '角色管理', '', '', 'F', '2015-09-02 14:13:17', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_text', '文本管理', '', '', 'F', '2015-09-02 14:18:59', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_user', '用户管理', '', '', 'F', '2015-09-02 14:04:00', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('data_dictionary', '数据字典', '', '', 'F', '2015-09-02 14:10:29', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('default', '系统菜单全集', '', '', 'R', '2015-04-27 16:21:08', '2015-04-27 16:21:08', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('system_change_password', '修改密码', '', '/actions/common/user/changePwd.do', 'B', '2016-01-05 14:30:05', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('system_commonquery', '通用配置查询接口', '', '/actions/common/query.do', 'P', '2016-08-08 09:17:51', '2016-08-08 09:18:49', 'root', 'icon-mini-add');
REPLACE INTO `cip_admin_resource` VALUES ('system_countquery', '通用查询统计接口', '', '/actions/common/countquery.do', 'P', '2016-08-08 14:06:10', '2016-08-08 14:11:44', 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('system_getDomains', '获取数据域', '', '/actions/common/domain/getDomains.do', 'B', '2015-04-26 18:53:51', '2015-04-26 18:53:56', 'system', '');
REPLACE INTO `cip_admin_resource` VALUES ('system_getResources', '获取资源信息', '', '/actions/common/user/getResources.do', 'B', '2015-04-26 18:53:51', '2015-04-26 18:53:56', 'system', '');
REPLACE INTO `cip_admin_resource` VALUES ('system_getUserProfile', '获取用户信息', '', 'actions/common/user/getUserProfile.do', 'B', '2015-11-25 17:15:06', null, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('system_logout', '退出系统', '', '/actions/common/user/logout.do', 'B', '2015-04-26 18:53:51', '2015-04-26 18:53:56', 'system', '');
REPLACE INTO `cip_admin_resource` VALUES ('system_refreshResources', '刷新角色资源', '', '/actions/common/user/refreshResources.do', 'B', '2015-05-19 10:14:05', '2016-06-21 20:17:32', 'root', 'icon-reload');

-- ----------------------------
-- Table structure for cip_admin_resource_2_resource
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_resource_2_resource`;
CREATE TABLE `cip_admin_resource_2_resource` (
  `root_node_id` varchar(50) NOT NULL COMMENT '根节点',
  `res_node_id` varchar(50) NOT NULL COMMENT '资源节点id',
  `res_node_sup` varchar(50) NOT NULL COMMENT '资源上级节点id',
  `node_order` int(11) DEFAULT NULL COMMENT '同级节点序列',
  `root_flag` int(11) DEFAULT NULL COMMENT '根节点标识',
  `res_level` int(11) DEFAULT NULL COMMENT '层级数',
  `leaf_flag` int(11) DEFAULT NULL COMMENT '叶节点标识',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`res_node_id`,`res_node_sup`,`root_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/资源与资源关系';

-- ----------------------------
-- Records of cip_admin_resource_2_resource
-- ----------------------------
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'auth_object', 'cip_admin', '3', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin', 'default', '1', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_addBtn_form', 'cip_admin_rolesTree_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_addMegroup_form', 'cip_admin_rolesTree_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_addMenu_form', 'cip_admin_rolesTree_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_addPage_form', 'cip_admin_rolesTree_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_act2obj_addData', 'cip_admin_auth_act2obj_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_act2obj_deleteData', 'cip_admin_auth_act2obj_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_act2obj_exportEntities', 'cip_admin_auth_act2obj_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_act2obj_form', 'cip_admin_auth_act2obj_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_act2obj_getData', 'cip_admin_auth_act2obj_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_act2obj_list', 'auth_object', '2', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_act2obj_searchData', 'cip_admin_auth_act2obj_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_act2obj_updateData', 'cip_admin_auth_act2obj_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_attr_addData', 'cip_admin_auth_attr_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_attr_deleteData', 'cip_admin_auth_attr_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_attr_exportEntities', 'cip_admin_auth_attr_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_attr_form', 'cip_admin_auth_attr_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_attr_getData', 'cip_admin_auth_attr_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_attr_list', 'auth_object', '1', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_attr_searchData', 'cip_admin_auth_attr_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_attr_updateData', 'cip_admin_auth_attr_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_new_attr_form', 'cip_admin_auth_obj_list', '8', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_new_attr_list', 'cip_admin_auth_obj_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_obj_addData', 'cip_admin_auth_obj_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_obj_deleteData', 'cip_admin_auth_obj_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_obj_exportEntities', 'cip_admin_auth_obj_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_obj_form', 'cip_admin_auth_obj_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_obj_getData', 'cip_admin_auth_obj_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_obj_list', 'auth_object', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_obj_searchData', 'cip_admin_auth_obj_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_obj_updateData', 'cip_admin_auth_obj_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_perTree_removePreTree', 'cip_admin_auth_new_attr_form', '1', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_perTree_savePreTree', 'cip_admin_resource_tree_list', '1', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_perTree_searchSource', 'cip_admin_auth_setSource_form', '1', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_perTree_setSource', 'cip_admin_auth_rootResource_form', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_perTree_updataAct2objSource', 'cip_admin_auth_setSource_form', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_perTree_updataSource', 'cip_admin_auth_setSource_list', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_preTree_getActionTreeData', 'cip_admin_auth_new_attr_form', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_preTree_getSearchTree', 'cip_admin_resource_tree_list', '2', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_preTree_uncheckResTreeData', 'cip_admin_resource_tree_list', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_role_addData', 'cip_admin_auth_role_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_role_deleteData', 'cip_admin_auth_role_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_role_exportEntities', 'cip_admin_auth_role_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_role_form', 'cip_admin_auth_role_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_role_getData', 'cip_admin_auth_role_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_role_list', 'cip_role', '1', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_role_searchData', 'cip_admin_auth_role_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_role_updateData', 'cip_admin_auth_role_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_rootResource_addData', 'cip_admin_auth_rootResource_list', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_rootResource_deleteData', 'cip_admin_auth_rootResource_list', '2', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_rootResource_form', 'cip_admin_auth_obj_list', '11', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_rootResource_getData', 'cip_admin_auth_rootResource_list', '1', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_rootResource_list', 'cip_admin_auth_obj_list', '9', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_rootResource_updateData', 'cip_admin_auth_rootResource_list', '3', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_setSource_form', 'cip_admin_auth_obj_list', '13', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_setSource_list', 'cip_admin_auth_obj_list', '12', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_user_addData', 'cip_admin_auth_user_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_user_deleteData', 'cip_admin_auth_user_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_user_exportEntities', 'cip_admin_auth_user_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_user_form', 'cip_admin_auth_user_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_user_getData', 'cip_admin_auth_user_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_user_list', 'cip_user', '3', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_user_searchData', 'cip_admin_auth_user_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_auth_user_updateData', 'cip_admin_auth_user_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_change_password', 'default', '4', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_codes_addData', 'cip_admin_codes_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_codes_deleteData', 'cip_admin_codes_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_codes_exportEntities', 'cip_admin_codes_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_codes_form', 'cip_admin_codes_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_codes_getData', 'cip_admin_codes_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_codes_list', 'data_dictionary', '1', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_codes_searchData', 'cip_admin_codes_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_codes_updateData', 'cip_admin_codes_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_addData', 'cip_admin_commonquery_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_deleteData', 'cip_admin_commonquery_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_exportEntities', 'cip_admin_commonquery_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_form', 'cip_admin_commonquery_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_getData', 'cip_admin_commonquery_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_list', 'cip_query', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_param_form', 'cip_admin_commonquery_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_searchData', 'cip_admin_commonquery_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_commonquery_updateData', 'cip_admin_commonquery_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_domain_addData', 'cip_admin_domain_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_domain_deleteData', 'cip_admin_domain_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_domain_exportEntities', 'cip_admin_domain_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_domain_form', 'cip_admin_domain_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_domain_getData', 'cip_admin_domain_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_domain_list', 'data_dictionary', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_domain_searchData', 'cip_admin_domain_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_domain_updateData', 'cip_admin_domain_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_new_codes_form', 'cip_admin_domain_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_new_codes_list', 'cip_admin_domain_list', '8', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_new_role_resource_addResource', 'cip_admin_role_getDefaultTreeData', '4', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_new_role_resource_form', 'cip_admin_rolesTree_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_new_role_resource_getResource', 'cip_admin_rolesTree_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_new_role_resource_list', 'cip_admin_rolesTree_list', '8', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_new_role_resource_updateData', 'cip_admin_role_getDefaultTreeData', '5', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_operateRoles_list', 'cip_role', '3', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_op_log_exportEntities', 'cip_admin_op_log_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_op_log_form', 'cip_admin_op_log_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_op_log_list', 'cip_log', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_op_log_searchData', 'cip_admin_op_log_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_addData', 'cip_admin_question_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_deleteData', 'cip_admin_question_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_exportEntities', 'cip_admin_question_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_form', 'cip_admin_question_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_getData', 'cip_admin_question_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_handleData', 'cip_admin_question_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_list', 'cip_user', '4', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_searchData', 'cip_admin_question_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_question_updateData', 'cip_admin_question_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_addData', 'cip_admin_redis_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_deleteData', 'cip_admin_redis_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_exportEntities', 'cip_admin_redis_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_form', 'cip_admin_redis_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_getData', 'cip_admin_redis_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_list', 'cip_redis', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_reloadData', 'cip_admin_redis_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_searchData', 'cip_admin_redis_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_updateData', 'cip_admin_redis_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_val_addData', 'cip_admin_redis_val_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_val_deleteData', 'cip_admin_redis_val_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_val_exportEntities', 'cip_admin_redis_val_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_val_form', 'cip_admin_redis_val_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_val_getData', 'cip_admin_redis_val_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_val_list', 'cip_redis', '1', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_val_searchData', 'cip_admin_redis_val_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_redis_val_updateData', 'cip_admin_redis_val_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_addAndConfigRes', 'cip_admin_role_getDefaultTreeData', '2', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_addData', 'cip_admin_resource_2_resource_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_deleteData', 'cip_admin_resource_2_resource_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_exportEntities', 'cip_admin_resource_2_resource_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_form', 'cip_admin_resource_2_resource_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_getData', 'cip_admin_resource_2_resource_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_list', 'cip_resource', '1', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_searchData', 'cip_admin_resource_2_resource_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_2_resource_updateData', 'cip_admin_resource_2_resource_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_addButton', 'cip_admin_resource_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_addGroupMenu', 'cip_admin_resource_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_addMenu', 'cip_admin_resource_list', '8', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_addPage', 'cip_admin_resource_list', '9', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_add_form', 'cip_admin_resource_list', '10', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_deleteData', 'cip_admin_resource_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_exportEntities', 'cip_admin_resource_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_form', 'cip_admin_resource_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_getData', 'cip_admin_resource_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_list', 'cip_resource', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_searchData', 'cip_admin_resource_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_selectIcon', 'cip_admin_resource_add_form', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_tree_list', 'cip_admin_auth_obj_list', '10', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_updateData', 'cip_admin_resource_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_rolesTree_list', 'cip_role', '2', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_addData', 'cip_admin_roles_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_addUser', 'cip_admin_roles_list', '11', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_deleteData', 'cip_admin_roles_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_deleteRes', 'cip_admin_role_getDefaultTreeData', '3', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_exportEntities', 'cip_admin_roles_list', '9', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_form', 'cip_admin_roles_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_getBtn', 'cip_admin_role_getDefaultTreeData', '1', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_getBtnAndPage', 'cip_admin_role_getDefaultTreeData', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_getCheckData', 'cip_admin_operateRoles_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_getData', 'cip_admin_roles_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_getModelTreet', 'cip_admin_operateRoles_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_list', 'cip_role', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_saveModelTree', 'cip_admin_operateRoles_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_saveTreeData', 'cip_admin_roles_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_searchData', 'cip_admin_roles_list', '8', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_updateData', 'cip_admin_roles_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_roles_users_form', 'cip_admin_roles_list', '12', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_2_user_addUser', 'cip_admin_roles_users_form', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_2_user_move', 'cip_admin_roles_users_form', '1', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_2_user_searchData', 'cip_admin_roles_users_form', '2', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_2_user_searchUser', 'cip_admin_roles_users_form', '3', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_getDefaultTreeData', 'cip_admin_rolesTree_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_getMaxLevel', 'cip_admin_operateRoles_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_getResTreeData', 'cip_admin_roles_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_resource_addData', 'cip_admin_role_resource_list', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_resource_list', 'cip_admin_roles_list', '10', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_resource_searchData', 'cip_admin_role_resource_list', '1', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_role_searchNodeId', 'cip_admin_operateRoles_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_run_log_getLogData', 'cip_admin_run_log_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_run_log_getLogMessage', 'cip_admin_run_log_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_run_log_list', 'cip_log', '1', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_text_addData', 'cip_admin_text_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_text_deleteData', 'cip_admin_text_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_text_exportEntities', 'cip_admin_text_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_text_form', 'cip_admin_text_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_text_getData', 'cip_admin_text_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_text_list', 'cip_text', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_text_searchData', 'cip_admin_text_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_text_updateData', 'cip_admin_text_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_updataResource_form', 'cip_admin_rolesTree_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_2_roles_addData', 'cip_admin_user_2_roles_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_2_roles_deleteData', 'cip_admin_user_2_roles_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_2_roles_exportEntities', 'cip_admin_user_2_roles_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_2_roles_form', 'cip_admin_user_2_roles_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_2_roles_getData', 'cip_admin_user_2_roles_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_2_roles_list', 'cip_user', '1', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_2_roles_searchData', 'cip_admin_user_2_roles_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_2_roles_updateData', 'cip_admin_user_2_roles_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_addData', 'cip_admin_user_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_changepwd', 'cip_admin_user_list', '7', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_changepwdData', 'cip_admin_user_changepwd_form', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_changepwd_form', 'cip_admin_user_list', '10', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_changeusername', 'cip_admin_user_list', '8', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_cutroleData', 'cip_admin_user_setrole_form', '0', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_deleteData', 'cip_admin_user_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_exportEntities', 'cip_admin_user_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_form', 'cip_admin_user_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_getData', 'cip_admin_user_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_getoldroleData', 'cip_admin_user_setrole_form', '1', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_list', 'cip_user', '0', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_searchData', 'cip_admin_user_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_searchroleData', 'cip_admin_user_setrole_form', '2', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setrole', 'cip_admin_user_list', '9', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setroleData', 'cip_admin_user_setrole_form', '3', '0', '4', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setrole_form', 'cip_admin_user_list', '11', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setting_addData', 'cip_admin_user_setting_list', '4', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setting_deleteData', 'cip_admin_user_setting_list', '2', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setting_exportEntities', 'cip_admin_user_setting_list', '6', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setting_form', 'cip_admin_user_setting_list', '0', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setting_getData', 'cip_admin_user_setting_list', '1', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setting_list', 'cip_user', '2', '0', '2', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setting_searchData', 'cip_admin_user_setting_list', '5', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_setting_updateData', 'cip_admin_user_setting_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user_updateData', 'cip_admin_user_list', '3', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_log', 'cip_admin', '8', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_mdm_bigareas_getBigareas', 'default', '7', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_mdm_bigarea_provinces_getProvsByBigarea', 'default', '8', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_mdm_cities_getCities', 'default', '9', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_mdm_counties_getCounties', 'default', '10', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_mdm_orgs_getOrgs', 'default', '11', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_mdm_provinces_getProvinces', 'default', '12', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_mdm_province_orgs_getOrgsByProv', 'default', '13', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_query', 'cip_admin', '5', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_redis', 'cip_admin', '7', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_resource', 'cip_admin', '0', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_role', 'cip_admin', '1', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_text', 'cip_admin', '6', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_user', 'cip_admin', '2', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'data_dictionary', 'cip_admin', '4', '0', '1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'default', '', '1', '0', '-1', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_change_password', 'default', '5', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_commonquery', 'cip_admin_commonquery_list', '8', '0', '3', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_countquery', 'cip_admin_commonquery_list', '9', '0', '3', '0', '2016-08-08 14:09:29', null, 'root');
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_getDomains', 'default', '0', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_getResources', 'default', '2', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_getUserProfile', 'default', '6', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_logout', 'default', '3', '0', '0', '0', null, null, null);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_refreshResources', 'cip_admin_roles_list', '1', '0', '3', '0', null, null, null);

-- ----------------------------
-- Table structure for cip_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_roles`;
CREATE TABLE `cip_admin_roles` (
  `role_id` varchar(30) NOT NULL COMMENT '角色id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `root_resource_id` varchar(32) DEFAULT NULL COMMENT '资源根节点id',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/角色信息';

-- ----------------------------
-- Records of cip_admin_roles
-- ----------------------------
REPLACE INTO `cip_admin_roles` VALUES ('superAdmin', '系统管理员', 'default', null, null, '0');

-- ----------------------------
-- Table structure for cip_admin_text
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_text`;
CREATE TABLE `cip_admin_text` (
  `lang_type` varchar(6) NOT NULL COMMENT '语言类型',
  `msg_no` int(11) NOT NULL COMMENT '文本id',
  `msg_txt` varchar(100) DEFAULT NULL COMMENT '文本内容',
  `create_time` datetime DEFAULT NULL COMMENT '系统时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`lang_type`,`msg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/系统文本管理';

-- ----------------------------
-- Records of cip_admin_text
-- ----------------------------

-- ----------------------------
-- Table structure for cip_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_user`;
CREATE TABLE `cip_admin_user` (
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名称',
  `start_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `user_pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `pwd_init_flag` int(1) DEFAULT NULL COMMENT '初始密码标识',
  `user_his1_pwd` varchar(50) DEFAULT NULL COMMENT '历史密码1',
  `user_his2_pwd` varchar(50) DEFAULT NULL COMMENT '历史密码2',
  `user_his3_pwd` varchar(50) DEFAULT NULL COMMENT '历史密码3',
  `pwd_set_time` datetime DEFAULT NULL COMMENT '密码设置时间',
  `pwd_reset_days` int(11) DEFAULT NULL COMMENT '密码重置天数',
  `pwd_reset_flag` int(1) DEFAULT NULL COMMENT '重置密码标识',
  `user_status` int(1) DEFAULT NULL COMMENT '用户状态',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型',
  `person_id` varchar(30) DEFAULT NULL COMMENT '使用人id',
  `org_id` varchar(30) DEFAULT NULL COMMENT '使用机构id',
  `position_id` varchar(30) DEFAULT NULL COMMENT '岗位id',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人',
  `lang` varchar(20) DEFAULT NULL COMMENT '语言',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/用户信息';

-- ----------------------------
-- Records of cip_admin_user
-- ----------------------------
REPLACE INTO `cip_admin_user` VALUES ('root', '系统管理员', '2015-04-26', '2099-06-30', 'tZxnvxlqR1gZHkL3ZnDOug==', '0', 'oYakx2nDICrRH40P3Aak+A==', 'ICy5YqxZB1uWSwcVLSNLcA==', 'BDiPxzITv88bSi5Q8IFwYg==', '2016-05-27 11:05:21', '150', '1', '0', '0', '', '', '', null, '2015-10-29 13:23:08', 'root', '');

-- ----------------------------
-- Table structure for cip_admin_user_2_roles
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_user_2_roles`;
CREATE TABLE `cip_admin_user_2_roles` (
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `role_id` varchar(30) NOT NULL COMMENT '角色id',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人',
  `default_flag` int(11) DEFAULT NULL COMMENT '默认角色标识',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/用户角色关联';

-- ----------------------------
-- Records of cip_admin_user_2_roles
-- ----------------------------
REPLACE INTO `cip_admin_user_2_roles` VALUES ('root', 'superAdmin', '2016-07-21 10:17:47', null, 'root', '0');

-- ----------------------------
-- Table structure for cip_admin_user_setting
-- ----------------------------
DROP TABLE IF EXISTS `cip_admin_user_setting`;
CREATE TABLE `cip_admin_user_setting` (
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `user_key` varchar(32) NOT NULL COMMENT '属性id',
  `user_value` varchar(255) DEFAULT NULL COMMENT '属性配置值',
  `remark` varchar(255) DEFAULT NULL COMMENT '属性说明',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`user_id`,`user_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/用户信息设置';

-- ----------------------------
-- Records of cip_admin_user_setting
-- ----------------------------

-- ----------------------------
-- View structure for cip_admin_access_ctrl_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_access_ctrl_v`;
CREATE  VIEW `cip_admin_access_ctrl_v` AS select `m`.`sys_id` AS `sys_id`,`m`.`access_flag` AS `access_flag`,`m`.`access_type` AS `access_type`,`m`.`access_ip` AS `access_ip`,`m`.`auth_code` AS `auth_code`,`m`.`other_params` AS `other_params`,`m`.`remark` AS `remark`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`access_flag`.`code_name` AS `access_flag_name`,`access_type`.`code_name` AS `access_type_name` from ((`cip_admin_access_ctrl` `m` left join `cip_admin_codes` `access_flag` on(((`m`.`access_flag` = `access_flag`.`code_type`) and (`access_flag`.`domain_id` = 'access_flag')))) left join `cip_admin_codes` `access_type` on(((`m`.`access_type` = `access_type`.`code_type`) and (`access_type`.`domain_id` = 'access_type')))) ;

-- ----------------------------
-- View structure for cip_admin_access_rel_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_access_rel_v`;
CREATE  VIEW `cip_admin_access_rel_v` AS select `m`.`sys_id` AS `sys_id`,`m`.`resource_id` AS `resource_id`,`m`.`create_time` AS `create_time`,`m`.`operator` AS `operator` from `cip_admin_access_rel` `m` ;

-- ----------------------------
-- View structure for cip_admin_access_res_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_access_res_v`;
CREATE  VIEW `cip_admin_access_res_v` AS select `m`.`resource_id` AS `resource_id`,`m`.`access_flag` AS `access_flag`,`m`.`resource_name` AS `resource_name`,`m`.`resource_desc` AS `resource_desc`,`m`.`sys_uri` AS `sys_uri`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`m`.`icon_id` AS `icon_id`,`access_flag`.`code_name` AS `access_flag_name` from (`cip_admin_access_res` `m` left join `cip_admin_codes` `access_flag` on(((`m`.`access_flag` = `access_flag`.`code_type`) and (`access_flag`.`domain_id` = 'access_flag')))) ;

-- ----------------------------
-- View structure for cip_admin_auth_act2obj_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_auth_act2obj_v`;
CREATE  VIEW `cip_admin_auth_act2obj_v` AS select `m`.`root_node_id` AS `root_node_id`,`m`.`resource_id` AS `resource_id`,`m`.`obj_id` AS `obj_id`,`m`.`obj_attr_id` AS `obj_attr_id`,`m`.`attr_value` AS `attr_value`,`m`.`val_src_type` AS `val_src_type`,`m`.`incl_sub_flag` AS `incl_sub_flag`,`c1`.`code_name` AS `val_src_type_name`,`m`.`field_id` AS `field_id`,`c2`.`code_name` AS `incl_sub_flag_name` from ((`cip_admin_auth_act2obj` `m` left join `cip_admin_codes` `c1` on(((`m`.`val_src_type` = `c1`.`code_type`) and (`c1`.`domain_id` = 'val_src_type')))) left join `cip_admin_codes` `c2` on(((`m`.`incl_sub_flag` = `c2`.`code_type`) and (`c2`.`domain_id` = 'incl_sub_flag')))) ;

-- ----------------------------
-- View structure for cip_admin_auth_attr_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_auth_attr_v`;
CREATE  VIEW `cip_admin_auth_attr_v` AS select `m`.`obj_id` AS `obj_id`,`m`.`obj_attr_id` AS `obj_attr_id`,`m`.`obj_attr_name` AS `obj_attr_name`,`m`.`attr_val_table` AS `attr_val_table`,`m`.`sup_col_id` AS `sup_col_id`,`m`.`sub_col_id` AS `sub_col_id`,`m`.`rel_col_id` AS `rel_col_id` from `cip_admin_auth_attr` `m` ;

-- ----------------------------
-- View structure for cip_admin_auth_obj_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_auth_obj_v`;
CREATE  VIEW `cip_admin_auth_obj_v` AS select `m`.`auth_obj_id` AS `auth_obj_id`,`m`.`auth_obj_name` AS `auth_obj_name` from `cip_admin_auth_obj` `m` ;

-- ----------------------------
-- View structure for cip_admin_auth_role_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_auth_role_v`;
CREATE  VIEW `cip_admin_auth_role_v` AS select `m`.`auth_role_id` AS `auth_role_id`,`m`.`auth_attr_id` AS `auth_attr_id`,`m`.`auth_attr_val` AS `auth_attr_val` from `cip_admin_auth_role` `m` ;

-- ----------------------------
-- View structure for cip_admin_auth_user_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_auth_user_v`;
CREATE  VIEW `cip_admin_auth_user_v` AS select `m`.`user_attr_id` AS `user_attr_id`,`m`.`auth_attr_name` AS `auth_attr_name`,`m`.`auth_attr_id` AS `auth_attr_id` from `cip_admin_auth_user` `m` ;

-- ----------------------------
-- View structure for cip_admin_codes_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_codes_v`;
CREATE  VIEW `cip_admin_codes_v` AS select `m`.`domain_id` AS `domain_id`,`m`.`code_type` AS `code_type`,`m`.`code_name` AS `code_name`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator` from `cip_admin_codes` `m` ;

-- ----------------------------
-- View structure for cip_admin_commonquery_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_commonquery_v`;
CREATE  VIEW `cip_admin_commonquery_v` AS select `m`.`queryId` AS `queryId`,`m`.`description` AS `description`,`m`.`paramlist` AS `paramlist`,`m`.`statement` AS `statement`,`m`.`count_statement` AS `count_statement`,`pagination`.`code_name` AS `is_pagination`,`singlerec`.`code_name` AS `is_singleRec`,`m`.`pagination` AS `pagination`,`m`.`singleRec` AS `singleRec` from ((`cip_admin_commonquery` `m` left join `cip_admin_codes` `pagination` on(((`m`.`pagination` = `pagination`.`code_type`) and (`pagination`.`domain_id` = 'pagination')))) left join `cip_admin_codes` `singlerec` on(((`m`.`singleRec` = `singlerec`.`code_type`) and (`singlerec`.`domain_id` = 'singleRec')))) ;

-- ----------------------------
-- View structure for cip_admin_domain_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_domain_v`;
CREATE  VIEW `cip_admin_domain_v` AS select `m`.`domain_id` AS `domain_id`,`m`.`domain_name` AS `domain_name`,`m`.`domain_type` AS `domain_type`,`m`.`is_null_flag` AS `is_null_flag`,`m`.`data_length` AS `data_length`,`m`.`default_value` AS `default_value`,`m`.`float_length` AS `float_length`,`m`.`data_type` AS `data_type`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`m`.`resp_id` AS `resp_id`,`m`.`domain_desc` AS `domain_desc`,`m`.`ref_table_id` AS `ref_table_id`,`m`.`ref_domain_id` AS `ref_domain_id`,`domain_type`.`code_name` AS `domain_type_name`,`is_null_flag`.`code_name` AS `is_null_flag_name`,`data_type`.`code_name` AS `data_type_name` from (((`cip_admin_domain` `m` left join `cip_admin_codes` `domain_type` on(((`m`.`domain_type` = `domain_type`.`code_type`) and (`domain_type`.`domain_id` = 'domain_type')))) left join `cip_admin_codes` `is_null_flag` on(((`m`.`is_null_flag` = `is_null_flag`.`code_type`) and (`is_null_flag`.`domain_id` = 'is_null_flag')))) left join `cip_admin_codes` `data_type` on(((`m`.`data_type` = `data_type`.`code_type`) and (`data_type`.`domain_id` = 'data_type')))) ;

-- ----------------------------
-- View structure for cip_admin_log_access_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_log_access_v`;
CREATE  VIEW `cip_admin_log_access_v` AS select `m`.`log_id` AS `log_id`,`m`.`resource_id` AS `resource_id`,`m`.`visitor_id` AS `visitor_id`,`m`.`visitor_type` AS `visitor_type`,`m`.`occur_time` AS `occur_time`,`m`.`ip` AS `ip`,`m`.`remark` AS `remark`,`visitor_type`.`code_name` AS `visitor_type_name` from (`cip_admin_log_access` `m` left join `cip_admin_codes` `visitor_type` on(((`m`.`visitor_type` = `visitor_type`.`code_type`) and (`visitor_type`.`domain_id` = 'visitor_type')))) ;

-- ----------------------------
-- View structure for cip_admin_log_job_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_log_job_v`;
CREATE  VIEW `cip_admin_log_job_v` AS select `m`.`log_id` AS `log_id`,`m`.`task_id` AS `task_id`,`m`.`step_id` AS `step_id`,`m`.`step_msg` AS `step_msg`,`m`.`error_code` AS `error_code`,`m`.`occur_time` AS `occur_time`,`error_code`.`code_name` AS `error_code_name` from (`cip_admin_log_job` `m` left join `cip_admin_codes` `error_code` on(((`m`.`error_code` = `error_code`.`code_type`) and (`error_code`.`domain_id` = 'error_code')))) ;

-- ----------------------------
-- View structure for cip_admin_log_mdm_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_log_mdm_v`;
CREATE  VIEW `cip_admin_log_mdm_v` AS select `m`.`log_id` AS `log_id`,`m`.`table_id` AS `table_id`,`m`.`record_id` AS `record_id`,`m`.`old_values` AS `old_values`,`m`.`new_values` AS `new_values`,`m`.`user_id` AS `user_id`,`m`.`operate_type` AS `operate_type`,`m`.`occur_time` AS `occur_time` from `cip_admin_log_mdm` `m` ;

-- ----------------------------
-- View structure for cip_admin_op_log_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_op_log_v`;
CREATE  VIEW `cip_admin_op_log_v` AS select `m`.`op_seq_no` AS `op_seq_no`,`m`.`op_table_id` AS `op_table_id`,`m`.`op_obj_id` AS `op_obj_id`,`m`.`op_type` AS `op_type`,`m`.`remark` AS `remark`,`m`.`create_time` AS `create_time`,`m`.`operator` AS `operator`,`op_type`.`code_name` AS `op_type_name` from (`cip_admin_op_log` `m` left join `cip_admin_codes` `op_type` on(((`m`.`op_type` = `op_type`.`code_type`) and (`op_type`.`domain_id` = 'op_type')))) ;

-- ----------------------------
-- View structure for cip_admin_question_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_question_v`;
CREATE VIEW `cip_admin_question_v` AS select `m`.`question_id` AS `question_id`,`m`.`question_title` AS `question_title`,`m`.`queston_type` AS `queston_type`,`m`.`question_desc` AS `question_desc`,`m`.`creater` AS `creater`,`m`.`question_reply` AS `question_reply`,`m`.`handle_flag` AS `handle_flag`,`m`.`update_time` AS `update_time`,`m`.`operater` AS `operater`,`m`.`create_time` AS `create_time`,`queston_type`.`code_name` AS `queston_type_name`,`handle_flag`.`code_name` AS `handle_flag_name` from ((`cip_admin_question` `m` left join `cip_admin_codes` `queston_type` on(((`m`.`queston_type` = `queston_type`.`code_type`) and (`queston_type`.`domain_id` = 'queston_type')))) left join `cip_admin_codes` `handle_flag` on(((`m`.`handle_flag` = `handle_flag`.`code_type`) and (`handle_flag`.`domain_id` = 'handle_flag')))) ;

-- ----------------------------
-- View structure for cip_admin_queue_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_queue_v`;
CREATE  VIEW `cip_admin_queue_v` AS select `m`.`queue_type` AS `queue_type`,`m`.`queue_id` AS `queue_id`,`m`.`queue_data` AS `queue_data`,`m`.`queue_flag` AS `queue_flag`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`queue_type`.`queue_type_name` AS `queue_type_name`,`queue_flag`.`code_name` AS `queue_flag_name` from ((`cip_admin_queue` `m` left join `cip_admin_queue_type_dm` `queue_type` on((`m`.`queue_type` = `queue_type`.`queue_type`))) left join `cip_admin_codes` `queue_flag` on(((`m`.`queue_flag` = `queue_flag`.`code_type`) and (`queue_flag`.`domain_id` = 'queue_flag')))) ;

-- ----------------------------
-- View structure for cip_admin_resource_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_resource_v`;
CREATE  VIEW `cip_admin_resource_v` AS select `m`.`resource_id` AS `resource_id`,`m`.`resource_name` AS `resource_name`,`m`.`resource_desc` AS `resource_desc`,`m`.`sys_uri` AS `sys_uri`,`m`.`resource_type` AS `resource_type`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`m`.`icon_id` AS `icon_id`,`resource_type`.`code_name` AS `resource_type_name` from (`cip_admin_resource` `m` left join `cip_admin_codes` `resource_type` on(((`m`.`resource_type` = `resource_type`.`code_type`) and (`resource_type`.`domain_id` = 'resource_type')))) ;

-- ----------------------------
-- View structure for cip_admin_res_2_res_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_res_2_res_v`;
CREATE  VIEW `cip_admin_res_2_res_v` AS select `m`.`root_node_id` AS `root_node_id`,`m`.`res_node_id` AS `res_node_id`,`m`.`res_node_sup` AS `res_node_sup`,`m`.`node_order` AS `node_order`,`m`.`root_flag` AS `root_flag`,`m`.`res_level` AS `res_level`,`m`.`leaf_flag` AS `leaf_flag`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`root_flag`.`code_name` AS `root_flag_name`,`leaf_flag`.`code_name` AS `leaf_flag_name` from ((`cip_admin_resource_2_resource` `m` left join `cip_admin_codes` `root_flag` on(((`m`.`root_flag` = `root_flag`.`code_type`) and (`root_flag`.`domain_id` = 'root_flag')))) left join `cip_admin_codes` `leaf_flag` on(((`m`.`leaf_flag` = `leaf_flag`.`code_type`) and (`leaf_flag`.`domain_id` = 'leaf_flag')))) ;

-- ----------------------------
-- View structure for cip_admin_roles_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_roles_v`;
CREATE  VIEW `cip_admin_roles_v` AS select `m`.`role_id` AS `role_id`,`m`.`role_name` AS `role_name`,`m`.`root_resource_id` AS `root_resource_id`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator` from `cip_admin_roles` `m` ;

-- ----------------------------
-- View structure for cip_admin_text_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_text_v`;
CREATE  VIEW `cip_admin_text_v` AS select `m`.`lang_type` AS `lang_type`,`m`.`msg_no` AS `msg_no`,`m`.`msg_txt` AS `msg_txt`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`lang_type`.`code_name` AS `lang_type_name` from (`cip_admin_text` `m` left join `cip_admin_codes` `lang_type` on(((`m`.`lang_type` = `lang_type`.`code_type`) and (`lang_type`.`domain_id` = 'lang_type')))) ;

-- ----------------------------
-- View structure for cip_admin_user_2_roles_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_user_2_roles_v`;
CREATE  VIEW `cip_admin_user_2_roles_v` AS select `m`.`user_id` AS `user_id`,`m`.`role_id` AS `role_id`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`m`.`default_flag` AS `default_flag`,`default_flag`.`code_name` AS `default_flag_name` from (`cip_admin_user_2_roles` `m` left join `cip_admin_codes` `default_flag` on(((`m`.`default_flag` = `default_flag`.`code_type`) and (`default_flag`.`domain_id` = 'default_flag')))) ;

-- ----------------------------
-- View structure for cip_admin_user_setting_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_user_setting_v`;
CREATE  VIEW `cip_admin_user_setting_v` AS select `m`.`user_id` AS `user_id`,`m`.`user_key` AS `user_key`,`m`.`user_value` AS `user_value`,`m`.`remark` AS `remark`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator` from `cip_admin_user_setting` `m` ;

-- ----------------------------
-- View structure for cip_admin_user_v
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_user_v`;
CREATE  VIEW `cip_admin_user_v` AS select `m`.`user_id` AS `user_id`,`m`.`user_name` AS `user_name`,`m`.`start_date` AS `start_date`,`m`.`end_date` AS `end_date`,`m`.`user_pwd` AS `user_pwd`,`m`.`pwd_init_flag` AS `pwd_init_flag`,`m`.`user_his1_pwd` AS `user_his1_pwd`,`m`.`user_his2_pwd` AS `user_his2_pwd`,`m`.`user_his3_pwd` AS `user_his3_pwd`,`m`.`pwd_set_time` AS `pwd_set_time`,`m`.`pwd_reset_days` AS `pwd_reset_days`,`m`.`pwd_reset_flag` AS `pwd_reset_flag`,`m`.`user_status` AS `user_status`,`m`.`user_type` AS `user_type`,`m`.`person_id` AS `person_id`,`m`.`org_id` AS `org_id`,`m`.`position_id` AS `position_id`,`m`.`create_time` AS `create_time`,`m`.`update_time` AS `update_time`,`m`.`operator` AS `operator`,`pwd_reset_flag`.`code_name` AS `pwd_reset_flag_name`,`user_status`.`code_name` AS `user_status_name`,`user_type`.`code_name` AS `user_type_name`,`m`.`lang` AS `lang` from (((`cip_admin_user` `m` left join `cip_admin_codes` `pwd_reset_flag` on(((`m`.`pwd_reset_flag` = `pwd_reset_flag`.`code_type`) and (`pwd_reset_flag`.`domain_id` = 'pwd_reset_flag')))) left join `cip_admin_codes` `user_status` on(((`m`.`user_status` = `user_status`.`code_type`) and (`user_status`.`domain_id` = 'user_status')))) left join `cip_admin_codes` `user_type` on(((`m`.`user_type` = `user_type`.`code_type`) and (`user_type`.`domain_id` = 'user_type')))) ;

-- ----------------------------
-- View structure for cip_admin_view_resources
-- ----------------------------
DROP VIEW IF EXISTS `cip_admin_view_resources`;
CREATE  VIEW `cip_admin_view_resources` AS select `res`.`resource_id` AS `resource_id`,`res`.`resource_name` AS `resource_name`,`res`.`sys_uri` AS `sys_uri`,`res`.`resource_type` AS `resource_type`,`rel`.`res_node_sup` AS `res_node_sup`,`rel`.`root_node_id` AS `root_node_id`,`rel`.`root_flag` AS `root_flag`,`rel`.`leaf_flag` AS `leaf_flag`,`rel`.`res_level` AS `res_level`,`res`.`icon_id` AS `icon` from (`cip_admin_resource_2_resource` `rel` left join `cip_admin_resource` `res` on((`rel`.`res_node_id` = `res`.`resource_id`))) order by `rel`.`res_level`,`rel`.`node_order` ;



DROP TABLE IF EXISTS `cip_admin_user2res`;
CREATE TABLE `cip_admin_user2res` (
  `resource_id` varchar(50) NOT NULL COMMENT '资源id',
  `resource_name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `resource_image` varchar(255) DEFAULT NULL COMMENT '资源背景图',
  `user_id` varchar(50) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`resource_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/主页快速工具表';

DROP VIEW IF EXISTS `cip_admin_user2res_v`;
CREATE VIEW `cip_admin_user2res_v` AS select `cip_admin_user2res`.`resource_id` AS `resource_id`,`cip_admin_user2res`.`resource_name` AS `resource_name`,`cip_admin_user2res`.`resource_image` AS `resource_image`,`cip_admin_user2res`.`user_id` AS `user_id` from `cip_admin_user2res` ;

REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_resource_getToolData', '获取主页常用工具信息', '', '/actions/admin_user2res/getToolData.do', 'B', '2016-09-01 09:10:18', '2016-09-01 10:03:35', 'root', 'icon-search');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_addData', '新增主页快速工具表', '', '/actions/admin_user2res/addData.do', 'B', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_deleteData', '删除主页快速工具表', '', '/actions/admin_user2res/deleteData.do', 'B', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_exportEntities', '导出主页快速工具表', '', '/actions/admin_user2res/exportEntities.do', 'B', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_form', '主页快速工具表 表单', '', 'ui/view/admin/cip_admin_user2res_form.html?actionId=cip_admin_user2res_form', 'P', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_getData', '获取主页快速工具表', '', '/actions/admin_user2res/getData.do', 'B', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_getResMenu', '获取系统资源角色树', '', '/actions/admin_user2res/getResMenu.do', 'B', '2016-09-05 10:35:45', NULL, 'root', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_list', '主页快速工具表', '', 'ui/view/admin/cip_admin_user2res_list.html?actionId=cip_admin_user2res_list', 'A', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_searchData', '检索主页快速工具表', '', '/actions/admin_user2res/searchData.do', 'B', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_admin_user2res_updateData', '修改主页快速工具表', '', '/actions/admin_user2res/updateData.do', 'B', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('cip_tool', '快速工具管理', '', '', 'F', '2016-08-31 16:49:06', '2016-08-31 16:49:06', 'admin', '');
REPLACE INTO `cip_admin_resource` VALUES ('system_getDealThingsCount', '获取角色待办事宜数量', '', '/actions/common/user/getDealThingsCount.do', 'B', '2016-08-31 13:41:12', NULL, 'root', '');

REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_resource_getToolData', 'cip_admin_user2res_form', '0', '0', '4', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_addData', 'cip_admin_user2res_list', '4', '0', '3', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_deleteData', 'cip_admin_user2res_list', '2', '0', '3', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_exportEntities', 'cip_admin_user2res_list', '6', '0', '3', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_form', 'cip_admin_user2res_list', '1', '0', '3', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_getData', 'cip_admin_user2res_list', '0', '0', '3', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_getResMenu', 'cip_admin_user2res_form', '1', '0', '4', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_list', 'cip_tool', '0', '0', '2', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_searchData', 'cip_admin_user2res_list', '5', '0', '3', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_admin_user2res_updateData', 'cip_admin_user2res_list', '3', '0', '3', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'cip_tool', 'cip_admin', '8', '0', '1', '0', NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource` VALUES ('default', 'system_getDealThingsCount', 'default', '14', '0', '0', '0', NULL, NULL, NULL);



drop table if exists cip_admin_sql;

/*==============================================================*/
/* Table: cip_admin_sql                                         */
/*==============================================================*/
create table cip_admin_sql
(
   object_id            varchar(50) not null comment '对象id',
   sql_id               varchar(50) not null comment '语句id',
   dao_sql              varchar(9000) comment 'sql语句',
   create_time          datetime comment '新建时间',
   create_user          varchar(20) comment '生成人员',
   update_time          timestamp default CURRENT_TIMESTAMP comment '更新时间',
   op_user_id           varchar(20) comment '操作人员',
   primary key (object_id, sql_id)
);

alter table cip_admin_sql comment '系统管理/系统sql语句';

drop table if exists cip_admin_role_2_resource;

/*==============================================================*/
/* Table: cip_admin_role_2_resource                                         */
/*==============================================================*/
CREATE TABLE `cip_admin_role_2_resource` (
  `root_node_id` varchar(50) NOT NULL COMMENT '根节点',
  `res_node_id` varchar(50) NOT NULL COMMENT '资源节点id',
  `res_node_sup` varchar(50) NOT NULL COMMENT '资源上级节点id',
  `node_order` int(11) DEFAULT NULL COMMENT '同级节点序列',
  `root_flag` int(11) DEFAULT NULL COMMENT '根节点标识',
  `res_level` int(11) DEFAULT NULL COMMENT '层级数',
  `leaf_flag` int(11) DEFAULT NULL COMMENT '叶节点标识',
  `create_time` datetime DEFAULT NULL COMMENT '系统生成时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`root_node_id`,`res_node_id`,`res_node_sup`) USING BTREE,
  KEY `idx_res_node_sup` (`res_node_sup`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理/资源与资源关系';

CREATE VIEW `cip_admin_role_2_resource_view` AS select `res`.`resource_id` AS `resource_id`,`res`.`resource_name` AS `resource_name`,`res`.`sys_uri` AS `sys_uri`,`res`.`resource_type` AS `resource_type`,`mem`.`res_node_sup` AS `res_node_sup`,`mem`.`root_node_id` AS `root_node_id`,`mem`.`root_flag` AS `root_flag`,`mem`.`leaf_flag` AS `leaf_flag`,`mem`.`res_level` AS `res_level`,`res`.`icon_id` AS `icon` from (`cip_admin_role_2_resource` `mem` join `cip_admin_resource` `res` on((`mem`.`res_node_id` = `res`.`resource_id`))) order by `mem`.`res_level`,`mem`.`node_order`;

REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_rolesTree_list_new', '角色树定义（新）', '', 'ui/view/admin/cip_admin_rolesTree_list_new.html?actionId=cip_admin_rolesTree_list_new', 'A', '2016-06-27 10:33:03', '2016-06-29 18:54:09', 'ROOT', 'icon-menu');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_addBtn_form_new', '添加动作资源', '', 'ui/view/admin/cip_admin_addBtn_form_new.html?actionId=cip_admin_addBtn_form_new', 'P', '2016-06-28 17:05:38', NULL, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_addMegroup_form_new', '添加菜单组', '', 'ui/view/admin/cip_admin_addMegroup_form_new.html?actionId=cip_admin_addMegroup_form_new', 'P', '2016-06-28 17:21:51', NULL, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_addMenu_form_new', '添加菜单项', '', 'ui/view/admin/cip_admin_addMenu_form_new.html?actionId=cip_admin_addMenu_form_new', 'P', '2016-06-28 17:20:50', NULL, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_addPage_form_new', '添加页面资源', '', 'ui/view/admin/cip_admin_addPage_form_new.html?actionId=cip_admin_addPage_form_new', 'P', '2016-06-28 16:47:54', '2016-06-29 18:32:05', 'ROOT', 'icon-log');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_new_role_resource_form_new', '系统资源信息 表单', '', 'ui/view/admin/cip_admin_resource_form_new.html?actionId=cip_admin_resource_form_new', 'P', '2016-07-05 13:16:33', NULL, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_new_role_resource_getResource_new', '查询根节点角色下未分配的资源', '', '/actions/admin_roles/getResourcesNew.do', 'P', '2016-06-29 16:30:29', NULL, 'root', 'icon-search');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_new_role_resource_list_new', '角色未分配的资源信息添加 页面', '', 'ui/view/admin/cip_admin_new_role_resource_list_new.html?actionId=cip_admin_new_role_resource_list_new', 'P', '2016-06-29 16:12:27', NULL, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_role_getDefaultTreeData_new', '获取根节点default的资源树', '', '/actions/admin_roles/getDefaultTreeNew.do', 'P', '2016-06-27 14:16:33', NULL, 'root', 'icon-log');
REPLACE INTO `cip_admin_resource`(`resource_id`, `resource_name`, `resource_desc`, `sys_uri`, `resource_type`, `create_time`, `update_time`, `operator`, `icon_id`) VALUES ('cip_admin_operateRoles_list_new', '角色信息操作（新）', '', 'ui/view/admin/cip_admin_operateRoles_list_new.html?actionId=cip_admin_operateRoles_list_new', 'A', '2016-06-30 10:06:46', NULL, 'root', 'icon-menu');


REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_operateRoles_list_new', 'cip_role', 4, 0, 2, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_addData', 'cip_admin_operateRoles_list_new', 5, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_addUser', 'cip_admin_operateRoles_list_new', 11, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_deleteData', 'cip_admin_operateRoles_list_new', 3, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_exportEntities', 'cip_admin_operateRoles_list_new', 9, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_form', 'cip_admin_operateRoles_list_new', 0, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_getData', 'cip_admin_operateRoles_list_new', 2, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_saveTreeData', 'cip_admin_operateRoles_list_new', 7, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_searchData', 'cip_admin_operateRoles_list_new', 8, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_updateData', 'cip_admin_operateRoles_list_new', 4, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_roles_users_form', 'cip_admin_operateRoles_list_new', 12, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_role_getResTreeData', 'cip_admin_operateRoles_list_new', 6, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_role_resource_list', 'cip_admin_operateRoles_list_new', 10, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'system_refreshResources', 'cip_admin_operateRoles_list_new', 1, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_rolesTree_list_new', 'cip_role', 2, 0, 2, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_addBtn_form_new', 'cip_admin_rolesTree_list_new', 2, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_addMegroup_form_new', 'cip_admin_rolesTree_list_new', 4, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_addMenu_form_new', 'cip_admin_rolesTree_list_new', 3, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_addPage_form_new', 'cip_admin_rolesTree_list_new', 1, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_new_role_resource_form_new', 'cip_admin_rolesTree_list_new', 6, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_new_role_resource_getResource_new', 'cip_admin_rolesTree_list_new', 7, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_new_role_resource_list_new', 'cip_admin_rolesTree_list_new', 8, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_role_getDefaultTreeData_new', 'cip_admin_rolesTree_list_new', 0, 0, 3, 0, NULL, NULL, NULL);
REPLACE INTO `cip_admin_resource_2_resource`(`root_node_id`, `res_node_id`, `res_node_sup`, `node_order`, `root_flag`, `res_level`, `leaf_flag`, `create_time`, `update_time`, `operator`) VALUES ('default', 'cip_admin_updataResource_form', 'cip_admin_rolesTree_list_new', 5, 0, 3, 0, NULL, NULL, NULL);

insert into cip_admin_roles (role_id,role_name,root_resource_id,create_time,update_time,operator) values ('role_v2_superAdmin','系统管理员','default',now(),now(),'0');
update cip_admin_user_2_roles set role_id='role_v2_superAdmin' where role_id='superAdmin';
drop table if exists bms_statement_borrowing;

create table bms_statement_borrowing(
    lcbh                 varchar(32) comment '流程编号',
    sqrq                 date comment '申请日期',
    sqr                  varchar(20) comment '申请人',
    sqrgh                varchar(20) comment '申请人工号',
    sqrzw                varchar(20) comment '申请人职位',
    sqbm                 varchar(20) comment '申请部门',
    jzlx                 char(20) comment '借支类型',
    jtlx                 char(20) comment '具体类型',
    fkfs                 char(20) default '银行卡'  comment '付款方式',
    khhmc                varchar(255) comment '开户行名称',
    yhzh                 varchar(255) comment '银行账号',
    skrqc                varchar(20) comment '收款人全称',
    jzje                 decimal default 0  comment '借支金额',
    hkje                 decimal default 0  comment '还款金额',
    syje                 decimal default 0  comment '剩余金额',
    cnsprq               date comment '出纳审批日期',
    delete_flag          char(1) comment '删除标志',
    remark               varchar(255) comment '备注',
    op_user_id           varchar(20) comment '操作人id',
    op_user_name         varchar(20) comment '操作人',
    update_time          datetime comment '操作时间',
    creator              varchar(20) comment '创建人id',
    creator_name         varchar(20) comment '创建人',
    create_time          datetime comment '创建时间',
	primary key (lcbh)
);

alter table bms_statement_borrowing comment '借支管理报表';

drop table if exists bms_statement_repayment;

create table bms_statement_repayment(
    serial_no            varchar(32) comment '流水号',
    lcbh                 varchar(32) comment '流程编号',
    hkrq                 date comment '还款日期',
    hkfs                 varchar(20) comment '还款方式',
    hkje                 decimal default 0  comment '还款金额',
    syje                 decimal default 0  comment '剩余金额',
    hxr                  varchar(20) comment '核销人',
    cjzgzl               varchar(32) comment '冲借支工作流',
    delete_flag          char(1) comment '删除标志',
    remark               varchar(255) comment '备注',
    op_user_id           varchar(20) comment '操作人id',
    op_user_name         varchar(20) comment '操作人',
    update_time          datetime comment '操作时间',
    creator              varchar(20) comment '创建人id',
    creator_name         varchar(20) comment '创建人',
    create_time          datetime comment '创建时间',
	primary key (serial_no)
);

alter table bms_statement_repayment comment '还款报表';


DELETE FROM cip_admin_domain WHERE domain_id ='jzlx';
INSERT INTO cip_admin_domain (domain_id,domain_name,domain_type,is_null_flag,data_length,default_value,float_length,data_type,ref_table_id,ref_domain_id,create_time,update_time,operator) VALUES('jzlx','借支类型','1','0','32','','0','VARCHAR','cip_admin_codes','',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
DELETE FROM cip_admin_domain WHERE domain_id ='fkfs';
INSERT INTO cip_admin_domain (domain_id,domain_name,domain_type,is_null_flag,data_length,default_value,float_length,data_type,ref_table_id,ref_domain_id,create_time,update_time,operator) VALUES('fkfs','付款方式','1','0','32','','0','VARCHAR','cip_admin_codes','',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '1';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','1','运输成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '2';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','2','营销成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '3';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','3','物料成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '4';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','4','人力成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '5';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','5','管理成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '6';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','6','场地成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '7';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','7','财税成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '8';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','8','押金、保证金',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='jzlx' and code_type = '9';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','9','备用金申请',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='fkfs' and code_type = '1';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('fkfs','1','银行卡',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_codes where domain_id='fkfs' and code_type = '2';
insert into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('fkfs','2','现金',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');

delete from cip_admin_sql where object_id='bms_statement_borrowing' and sql_id='searchData';
insert into cip_admin_sql(object_id,sql_id,dao_sql,create_time,update_time,create_user)  VALUES ('bms_statement_borrowing','searchData','SELECT main.*,
    jzlx.code_name AS jzlx_name,
    fkfs.code_name AS fkfs_name
FROM bms_statement_borrowing main
    LEFT JOIN 
    cip_admin_codes jzlx ON
    jzlx.domain_id = \'jzlx\' AND 
    main.jzlx = jzlx.code_type
    LEFT JOIN 
    cip_admin_codes fkfs ON
    fkfs.domain_id = \'fkfs\' AND 
    main.fkfs = fkfs.code_type

',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_sql where object_id='bms_statement_borrowing' and sql_id='export';
insert into cip_admin_sql(object_id,sql_id,dao_sql,create_time,update_time,create_user)  VALUES ('bms_statement_borrowing','export','SELECT \'流程编号\', \'申请日期\', \'申请人\', \'申请人工号\', \'申请人职位\', \'申请部门\', \'借支类型\', \'具体类型\', \'付款方式\', \'开户行名称\', \'银行账号\', \'收款人全称\', \'借支金额\', \'还款金额\', \'剩余金额\', \'出纳审批日期\', \'删除标志\', \'备注\', \'操作人id\', \'操作人\', \'操作时间\', \'创建人id\', \'创建人\', \'创建时间\', \'借支类型名称\', \'付款方式名称\'
UNION
 SELECT main.*,
    jzlx.code_name AS jzlx_name,
    fkfs.code_name AS fkfs_name
FROM bms.bms_statement_borrowing main
    LEFT JOIN 
    bms.cip_admin_codes jzlx ON
    jzlx.domain_id = \'jzlx\' AND 
    main.jzlx = jzlx.code_type
    LEFT JOIN 
    bms.cip_admin_codes fkfs ON
    fkfs.domain_id = \'fkfs\' AND 
    main.fkfs = fkfs.code_type

',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_sql where object_id='bms_statement_repayment' and sql_id='searchData';
insert into cip_admin_sql(object_id,sql_id,dao_sql,create_time,update_time,create_user)  VALUES ('bms_statement_repayment','searchData','SELECT main.*
FROM bms_statement_repayment main

',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_sql where object_id='bms_statement_repayment' and sql_id='export';
insert into cip_admin_sql(object_id,sql_id,dao_sql,create_time,update_time,create_user)  VALUES ('bms_statement_repayment','export','SELECT \'流水号\', \'流程编号\', \'还款日期\', \'还款方式\', \'还款金额\', \'剩余金额\', \'核销人\', \'冲借支工作流\', \'删除标志\', \'备注\', \'操作人id\', \'操作人\', \'操作时间\', \'创建人id\', \'创建人\', \'创建时间\'
UNION
 SELECT main.*
FROM bms.bms_statement_repayment main

',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');


insert into cip_admin_role_2_resource select * from cip_admin_resource_2_resource where root_node_id='default'; 