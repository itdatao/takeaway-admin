/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50728
Source Host           : localhost:3309
Source Database       : takeaway

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2021-02-23 11:20:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('6', 't_order', '订单表', null, null, 'Order', 'crud', 'com.ruoyi.takeaway', 'takeaway', 'order', '订单', 'hht', '0', '/', '{\"parentMenuId\":\"2003\"}', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('57', '6', 'order_id', '订单id', 'char(19)', 'String', 'orderId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('58', '6', 'user_id', '用户id', 'char(19)', 'String', 'userId', '0', '0', null, '1', '1', null, '1', 'EQ', 'input', '', '2', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('59', '6', 'order_status', '订单状态', 'tinyint(6)', 'Integer', 'orderStatus', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'sys_order_status', '3', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('60', '6', 'nickname', '用户昵称', 'varchar(100)', 'String', 'nickname', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('61', '6', 'phone', '手机号', 'varchar(255)', 'String', 'phone', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('62', '6', 'address', '收货地址', 'varchar(255)', 'String', 'address', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('63', '6', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '7', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('64', '6', 'foods_price', '餐品总价', 'decimal(10,2)', 'BigDecimal', 'foodsPrice', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('65', '6', 'freight_price', '配送费', 'decimal(10,2)', 'BigDecimal', 'freightPrice', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('66', '6', 'order_price', '订单总费用', 'decimal(10,2)', 'BigDecimal', 'orderPrice', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('67', '6', 'pay_method', '支付id', 'varchar(60)', 'String', 'payMethod', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'sys_pay_method', '11', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('68', '6', 'pay_time', '交易时间', 'datetime', 'Date', 'payTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('69', '6', 'is_deleted', '逻辑删除', 'tinyint(4)', 'Integer', 'isDeleted', '0', '0', null, '1', '1', null, '1', 'EQ', 'input', '', '13', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('70', '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, '1', null, 'EQ', 'datetime', '', '14', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('71', '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '15', 'admin', '2021-01-30 16:26:35', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('72', '6', 'pay_status', '支付状态', 'tinyint(6)', 'Integer', 'payStatus', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'sys_pay_status', '16', 'admin', '2021-01-30 16:26:36', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('73', '6', 'sell_id', '商家ID', 'char(19)', 'String', 'sellId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '17', 'admin', '2021-01-30 16:26:36', '', '2021-01-30 16:30:59');
INSERT INTO `gen_table_column` VALUES ('74', '6', 'order_no', '订单编号', 'bigint(19)', 'Long', 'orderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '18', 'admin', '2021-01-30 16:26:36', '', '2021-01-30 16:30:59');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-01-13 16:29:08', 'admin', '2021-02-01 11:09:27', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-01-13 16:29:08', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-01-13 16:29:08', '', null, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-13 16:29:04', '', null);
INSERT INTO `sys_dept` VALUES ('110', '100', '0,100', '北京分公司', '1', '小王', '18888888888', '66666@163.com', '0', '0', 'admin', '2021-01-25 20:43:48', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-01-13 16:29:07', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-01-13 16:29:08', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-01-13 16:29:08', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-01-13 16:29:08', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-01-13 16:29:08', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-01-13 16:29:08', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-01-13 16:29:08', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-01-13 16:29:08', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-01-13 16:29:08', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '1', '正常', '0', 'sys_user_status', null, null, 'N', '0', 'admin', '2021-01-14 16:05:42', '', null, '用户正常');
INSERT INTO `sys_dict_data` VALUES ('101', '2', '停用', '1', 'sys_user_status', null, null, 'N', '0', 'admin', '2021-01-14 16:06:02', '', null, '用户停用');
INSERT INTO `sys_dict_data` VALUES ('102', '0', '未删除', '0', 'sys_logic_delete', null, null, 'N', '0', 'admin', '2021-01-25 20:41:13', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('103', '0', '已删除', '1', 'sys_logic_delete', null, null, 'N', '0', 'admin', '2021-01-25 20:41:20', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('104', '0', '上架', '0', 'sys_food_status', null, null, 'N', '0', 'admin', '2021-01-27 11:46:37', '', null, '餐品上架');
INSERT INTO `sys_dict_data` VALUES ('105', '1', '下架', '1', 'sys_food_status', null, null, 'N', '0', 'admin', '2021-01-27 11:46:56', '', null, '餐品下架');
INSERT INTO `sys_dict_data` VALUES ('106', '0', '已审核', '1', 'sys_comment_status', null, null, 'N', '0', 'admin', '2021-01-29 21:26:37', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('107', '1', '未审核', '0', 'sys_comment_status', null, null, 'N', '0', 'admin', '2021-01-29 21:26:51', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('108', '0', '已下单', '0', 'sys_order_status', null, null, 'N', '0', 'admin', '2021-01-30 16:15:27', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('109', '0', '已取消', '-1', 'sys_order_status', null, null, 'N', '0', 'admin', '2021-01-30 16:15:44', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('110', '0', '已审核', '1', 'sys_order_status', null, null, 'N', '0', 'admin', '2021-01-30 16:16:02', 'admin', '2021-01-30 16:22:37', null);
INSERT INTO `sys_dict_data` VALUES ('111', '0', '配送中', '2', 'sys_order_status', null, null, 'N', '0', 'admin', '2021-01-30 16:16:21', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('112', '0', '已完成', '3', 'sys_order_status', null, null, 'N', '0', 'admin', '2021-01-30 16:16:41', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('113', '0', '已支付', '1', 'sys_pay_status', null, null, 'N', '0', 'admin', '2021-01-30 16:17:47', 'admin', '2021-01-30 16:18:10', null);
INSERT INTO `sys_dict_data` VALUES ('114', '0', '未支付', '0', 'sys_pay_status', null, null, 'N', '0', 'admin', '2021-01-30 16:18:03', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('115', '0', '支付宝', '0', 'sys_pay_method', null, null, 'N', '0', 'admin', '2021-01-30 16:18:57', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('116', '0', '当面付', '1', 'sys_pay_method', null, null, 'N', '0', 'admin', '2021-01-30 16:19:15', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2021-01-13 16:29:07', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2021-01-13 16:29:07', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2021-01-13 16:29:07', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2021-01-13 16:29:07', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2021-01-13 16:29:07', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2021-01-13 16:29:07', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2021-01-13 16:29:07', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2021-01-13 16:29:07', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2021-01-13 16:29:07', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2021-01-13 16:29:07', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '用户状态', 'sys_user_status', '0', 'admin', '2021-01-14 16:05:04', '', null, '用户状态');
INSERT INTO `sys_dict_type` VALUES ('101', '逻辑删除', 'sys_logic_delete', '0', 'admin', '2021-01-25 20:40:47', '', null, '逻辑删除');
INSERT INTO `sys_dict_type` VALUES ('102', '餐品状态', 'sys_food_status', '0', 'admin', '2021-01-27 11:45:56', 'admin', '2021-01-27 11:47:28', '餐品状态');
INSERT INTO `sys_dict_type` VALUES ('103', '评论审核状态', 'sys_comment_status', '0', 'admin', '2021-01-29 21:26:06', '', null, '评论审核状态 0未审核，1已审核');
INSERT INTO `sys_dict_type` VALUES ('104', '订单状态', 'sys_order_status', '0', 'admin', '2021-01-30 15:49:32', '', null, '订单状态');
INSERT INTO `sys_dict_type` VALUES ('105', '支付状态', 'sys_pay_status', '0', 'admin', '2021-01-30 16:17:22', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('106', '支付方式', 'sys_pay_method', '0', 'admin', '2021-01-30 16:18:38', '', null, null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-13 20:31:10');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 11:35:53');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 12:07:52');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 14:40:14');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 14:44:14');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 15:04:26');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-14 15:29:16');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 15:29:22');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-14 15:29:22');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 15:30:22');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 15:48:57');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 17:05:26');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 20:45:13');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-24 21:39:16');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-25 11:27:50');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-25 13:58:41');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-25 14:35:46');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-25 20:26:22');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-25 22:07:34');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-26 15:04:11');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-26 15:51:32');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-26 17:14:56');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-26 19:29:13');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-26 22:15:27');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-27 11:36:52');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-27 12:04:01');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-27 14:20:22');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-27 15:58:58');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-27 16:35:43');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-27 20:09:40');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-27 21:49:54');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-28 16:10:33');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-28 20:46:56');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-28 21:51:41');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-28 22:19:26');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-29 10:50:19');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-29 14:19:56');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-29 17:46:42');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-29 17:46:48');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-29 20:35:51');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-29 21:41:27');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-30 14:24:48');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-30 15:47:22');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Firefox 8', 'Windows 10', '1', '验证码错误', '2021-01-30 16:53:49');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Firefox 8', 'Windows 10', '0', '登录成功', '2021-01-30 16:53:53');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Firefox 8', 'Windows 10', '0', '登录成功', '2021-01-30 19:55:37');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Firefox 8', 'Windows 10', '0', '登录成功', '2021-01-31 15:15:07');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-31 15:32:21');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-31 15:32:24');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-31 22:50:07');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-01 11:04:28');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-01 15:37:40');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-01 16:02:13');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Firefox 8', 'Windows 10', '0', '登录成功', '2021-02-03 17:56:07');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-06 16:59:14');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-13 17:28:33');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-13 17:33:52');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-23 11:10:25');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2040 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '1', '0', 'M', '0', '0', '', 'system', 'admin', '2021-01-13 16:29:04', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2021-01-13 16:29:04', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2021-01-13 16:29:04', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '后台账户管理', '1', '1', 'user', 'system/user/index', '1', '0', 'C', '0', '0', 'system:user:list', 'people', 'admin', '2021-01-13 16:29:04', 'admin', '2021-02-01 12:00:51', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '后台角色管理', '1', '2', 'role', 'system/role/index', '1', '0', 'C', '0', '0', 'system:role:list', 'row', 'admin', '2021-01-13 16:29:04', 'admin', '2021-02-01 12:01:07', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-01-13 16:29:04', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-01-13 16:29:04', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-01-13 16:29:04', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2021-01-13 16:29:04', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-01-13 16:29:04', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-01-13 16:29:04', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-01-13 16:29:04', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-01-13 16:29:04', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', 'build', 'tool/build/index', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-01-13 16:29:04', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', 'gen', 'tool/gen/index', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-01-13 16:29:04', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-01-13 16:29:04', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-01-13 16:29:04', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-01-13 16:29:04', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-01-13 16:29:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-01-13 16:29:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-01-13 16:29:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-01-13 16:29:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-01-13 16:29:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-01-13 16:29:05', 'admin', '2021-01-13 20:48:07', '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '115', '1', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '115', '2', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '115', '3', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '115', '2', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '115', '4', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '115', '5', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-01-13 16:29:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '用户管理', '0', '4', 'user', '', '1', '0', 'M', '0', '0', null, 'user', 'admin', '2021-01-13 20:36:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '餐品管理', '0', '5', 'food', null, '1', '0', 'M', '0', '0', null, 'list', 'admin', '2021-01-13 20:39:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('2002', '评论管理', '0', '6', 'comment', null, '1', '0', 'M', '0', '0', null, 'message', 'admin', '2021-01-13 20:41:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '订单管理', '0', '7', 'order', null, '1', '0', 'M', '0', '0', null, 'money', 'admin', '2021-01-13 20:41:58', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '文件管理', '0', '9', 'file', null, '1', '0', 'M', '0', '0', null, 'pdf', 'admin', '2021-01-13 20:45:58', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '前台客户菜单', '2000', '1', 'user', 'takeaway/user/index', '1', '0', 'C', '0', '0', 'takeaway:user:list', 'peoples', 'admin', '2021-01-14 15:23:20', 'admin', '2021-02-01 11:58:21', '用户菜单');
INSERT INTO `sys_menu` VALUES ('2013', '用户查询', '2012', '1', '#', '', '1', '0', 'F', '0', '0', 'takeaway:user:query', '#', 'admin', '2021-01-14 15:23:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '用户新增', '2012', '2', '#', '', '1', '0', 'F', '0', '0', 'takeaway:user:add', '#', 'admin', '2021-01-14 15:23:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '用户修改', '2012', '3', '#', '', '1', '0', 'F', '0', '0', 'takeaway:user:edit', '#', 'admin', '2021-01-14 15:23:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '用户删除', '2012', '4', '#', '', '1', '0', 'F', '0', '0', 'takeaway:user:remove', '#', 'admin', '2021-01-14 15:23:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '用户导出', '2012', '5', '#', '', '1', '0', 'F', '0', '0', 'takeaway:user:export', '#', 'admin', '2021-01-14 15:23:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '餐品分类', '2001', '1', 'category', 'takeaway/category/index', '1', '0', 'C', '0', '0', 'takeaway:category:list', 'tree', 'admin', '2021-01-25 20:55:42', 'admin', '2021-02-01 16:03:32', '餐品分类');
INSERT INTO `sys_menu` VALUES ('2019', '餐品分类查询', '2018', '1', '#', '', '1', '0', 'F', '0', '0', 'takeaway:category:query', '#', 'admin', '2021-01-25 21:01:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '餐品分类新增', '2018', '2', '#', '', '1', '0', 'F', '0', '0', 'takeaway:category:add', '#', 'admin', '2021-01-25 21:01:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '餐品分类修改', '2018', '3', '#', '', '1', '0', 'F', '0', '0', 'takeaway:category:edit', '#', 'admin', '2021-01-25 21:01:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '餐品分类删除', '2018', '4', '#', '', '1', '0', 'F', '0', '0', 'takeaway:category:remove', '#', 'admin', '2021-01-25 21:01:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '餐品分类导出', '2018', '5', '#', '', '1', '0', 'F', '0', '0', 'takeaway:category:export', '#', 'admin', '2021-01-25 21:01:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '餐品列表', '2001', '1', 'food', 'takeaway/food/index', '1', '0', 'C', '0', '0', 'takeaway:food:list', 'job', 'admin', '2021-01-27 11:56:54', 'admin', '2021-02-01 16:03:57', '餐品菜单');
INSERT INTO `sys_menu` VALUES ('2025', '餐品查询', '2024', '1', '#', '', '1', '0', 'F', '0', '0', 'takeaway:food:query', '#', 'admin', '2021-01-27 11:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '餐品新增', '2024', '2', '#', '', '1', '0', 'F', '0', '0', 'takeaway:food:add', '#', 'admin', '2021-01-27 11:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2027', '餐品修改', '2024', '3', '#', '', '1', '0', 'F', '0', '0', 'takeaway:food:edit', '#', 'admin', '2021-01-27 11:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2028', '餐品删除', '2024', '4', '#', '', '1', '0', 'F', '0', '0', 'takeaway:food:remove', '#', 'admin', '2021-01-27 11:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2029', '餐品导出', '2024', '5', '#', '', '1', '0', 'F', '0', '0', 'takeaway:food:export', '#', 'admin', '2021-01-27 11:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2030', '文件列表', '2005', '1', 'file', 'takeaway/file/index', '1', '0', 'C', '0', '0', 'takeaway:file:list', 'excel', 'admin', '2021-01-28 16:09:21', 'admin', '2021-02-01 16:04:53', '文件列表');
INSERT INTO `sys_menu` VALUES ('2031', '评论列表', '2002', '1', 'comment', 'takeaway/comment/index', '1', '0', 'C', '0', '0', 'takeaway:comment:list', 'people', 'admin', '2021-01-29 15:17:20', 'admin', '2021-01-29 15:17:54', '评论列表');
INSERT INTO `sys_menu` VALUES ('2034', '订单列表', '2003', '1', 'order', 'takeaway/order/index', '1', '0', 'C', '0', '0', 'takeaway:order:list', 'documentation', 'admin', '2021-01-30 16:38:00', 'admin', '2021-02-01 16:04:19', '订单菜单');
INSERT INTO `sys_menu` VALUES ('2035', '订单查询', '2034', '1', '#', '', '1', '0', 'F', '0', '0', 'takeaway:order:query', '#', 'admin', '2021-01-30 16:38:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2036', '订单新增', '2034', '2', '#', '', '1', '0', 'F', '0', '0', 'takeaway:order:add', '#', 'admin', '2021-01-30 16:38:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2037', '订单修改', '2034', '3', '#', '', '1', '0', 'F', '0', '0', 'takeaway:order:edit', '#', 'admin', '2021-01-30 16:38:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2038', '订单删除', '2034', '4', '#', '', '1', '0', 'F', '0', '0', 'takeaway:order:remove', '#', 'admin', '2021-01-30 16:38:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2039', '订单导出', '2034', '5', '#', '', '1', '0', 'F', '0', '0', 'takeaway:order:export', '#', 'admin', '2021-01-30 16:38:00', '', null, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 16:33:55');
INSERT INTO `sys_oper_log` VALUES ('101', '字典类型', '3', 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', '1', 'admin', null, '/system/dict/data/3', '127.0.0.1', '内网IP', '{dictCodes=3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 20:32:53');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-01-13 20:34:40');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"4\",\"menuName\":\"用户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"user\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 20:36:46');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"5\",\"menuName\":\"餐品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"food\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 20:39:43');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"6\",\"menuName\":\"评论管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"comment\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 20:41:05');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"7\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"order\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 20:41:59');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"8\",\"menuName\":\"日志管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"log\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 20:44:57');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"pdf\",\"orderNum\":\"9\",\"menuName\":\"文件管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"file\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 20:45:58');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"操作查询\",\"params\":{},\"parentId\":500,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1610526545000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1040,\"menuType\":\"F\",\"perms\":\"monitor:operlog:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 20:48:07');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(25)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1610526835000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Openid\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"openid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"openid\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610526835000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"openid\"},{\"capJavaField\":\"Nickname\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"昵称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610526835000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"nickname\"},{\"capJavaField\":\"Sex\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sex\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"性别\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"bit(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610526835000,\"is', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 21:42:54');
INSERT INTO `sys_oper_log` VALUES ('111', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1610545374000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(25)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1610526835000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Openid\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"openid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"openid\",\"isQuery\":\"1\",\"updateTime\":1610545374000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610526835000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"openid\"},{\"capJavaField\":\"Nickname\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"昵称\",\"isQuery\":\"1\",\"updateTime\":1610545374000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610526835000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"nickname\"},{\"capJavaField\":\"Sex\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sex\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"性别\",\"isQuery\":\"1\",\"updateTime\":1610545374000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-13 21:53:48');
INSERT INTO `sys_oper_log` VALUES ('112', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-14 14:44:29');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/takeaway/tool/gen/importTable', '127.0.0.1', '内网IP', 't_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-14 14:46:02');
INSERT INTO `sys_oper_log` VALUES ('114', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(25)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1610606762000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Openid\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"openid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"openid\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610606762000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"openid\"},{\"capJavaField\":\"Nickname\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"昵称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610606762000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"nickname\"},{\"capJavaField\":\"Sex\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sex\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"性别\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"bit(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610606762000', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-14 14:46:51');
INSERT INTO `sys_oper_log` VALUES ('115', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/takeaway/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-01-14 14:46:55');
INSERT INTO `sys_oper_log` VALUES ('116', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/takeaway/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-01-14 14:53:02');
INSERT INTO `sys_oper_log` VALUES ('117', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"用户状态\",\"remark\":\"用户状态\",\"params\":{},\"dictType\":\"sys_user_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-14 16:05:04');
INSERT INTO `sys_oper_log` VALUES ('118', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"用户正常\",\"params\":{},\"dictType\":\"sys_user_status\",\"dictLabel\":\"正常\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-14 16:05:42');
INSERT INTO `sys_oper_log` VALUES ('119', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":2,\"remark\":\"用户停用\",\"params\":{},\"dictType\":\"sys_user_status\",\"dictLabel\":\"停用\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-14 16:06:02');
INSERT INTO `sys_oper_log` VALUES ('120', '用户', '5', 'com.ruoyi.web.controller.takeaway.UserController.export()', 'GET', '1', 'admin', null, '/takeaway/takeaway/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"f09caad7-3bf4-4abb-a2c7-8184c75533f2_user.xlsx\",\"code\":200}', '0', null, '2021-01-14 17:14:54');
INSERT INTO `sys_oper_log` VALUES ('121', '用户', '3', 'com.ruoyi.web.controller.takeaway.UserController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/user/173095730760', '127.0.0.1', '内网IP', '{ids=173095730760}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-15 20:49:02');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"hht\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1610606811000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(25)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1610606762000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Openid\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"openid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"openid\",\"isQuery\":\"1\",\"updateTime\":1610606811000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610606762000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"openid\"},{\"capJavaField\":\"Nickname\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"昵称\",\"isQuery\":\"1\",\"updateTime\":1610606811000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1610606762000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"nickname\"},{\"capJavaField\":\"Sex\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_user_sex\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sex\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"性别\",\"isQuery\":\"1\",\"updateTime\":1610606811000,\"sort\":4,\"list\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-15 21:17:05');
INSERT INTO `sys_oper_log` VALUES ('123', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/takeaway/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-01-15 21:19:20');
INSERT INTO `sys_oper_log` VALUES ('124', '用户', '3', 'com.ruoyi.web.controller.takeaway.UserController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/user/173850285034', '127.0.0.1', '内网IP', '{ids=173850285034}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-15 21:33:08');
INSERT INTO `sys_oper_log` VALUES ('125', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"1\",\"sex\":0,\"updateTime\":1610718314927,\"params\":{},\"isDisable\":0,\"password\":\"1\",\"createTime\":1610718314926,\"phone\":\"1\",\"nickname\":\"1\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-15 21:45:14');
INSERT INTO `sys_oper_log` VALUES ('126', '用户', '3', 'com.ruoyi.web.controller.takeaway.UserController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/user/1350076581600100354', '127.0.0.1', '内网IP', '{ids=1350076581600100354}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-15 21:45:21');
INSERT INTO `sys_oper_log` VALUES ('127', '用户', '3', 'com.ruoyi.web.controller.takeaway.UserController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/user/173850285034', '127.0.0.1', '内网IP', '{ids=173850285034}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-24 21:58:45');
INSERT INTO `sys_oper_log` VALUES ('128', '用户', '3', 'com.ruoyi.web.controller.takeaway.UserController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/user/173095730760', '127.0.0.1', '内网IP', '{ids=173095730760}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-24 21:58:47');
INSERT INTO `sys_oper_log` VALUES ('129', '用户', '3', 'com.ruoyi.web.controller.takeaway.UserController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/user/1350076581600100354', '127.0.0.1', '内网IP', '{ids=1350076581600100354}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-24 21:58:51');
INSERT INTO `sys_oper_log` VALUES ('130', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"洛阳\",\"sex\":0,\"updateTime\":1611498507939,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/9a9dea89-7c3c-4406-8174-50e7ba78b532.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611417600000,\"password\":\"123456\",\"createTime\":1611498507937,\"phone\":\"12345678901\",\"nickname\":\"小胡\",\"id\":\"1353348948271144962\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-24 22:28:27');
INSERT INTO `sys_oper_log` VALUES ('131', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"1\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611502292869,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611417600000,\"password\":\"123456\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678901\",\"nickname\":\"test01\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-24 23:31:32');
INSERT INTO `sys_oper_log` VALUES ('132', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611502325857,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611417600000,\"password\":\"123456\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678901\",\"nickname\":\"test01\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-24 23:32:05');
INSERT INTO `sys_oper_log` VALUES ('133', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611545326728,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611545323000,\"password\":\"123456\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678901\",\"nickname\":\"test01\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 11:28:46');
INSERT INTO `sys_oper_log` VALUES ('134', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"杭州\",\"sex\":1,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/25/71a8456f-7616-42c8-bc56-2752ae221939.png\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611547014000,\"password\":\"123456\",\"phone\":\"13345678910\",\"nickname\":\"test01\"}', '{\"msg\":\"新增用户\'test01\'失败，用户昵称已存在\",\"code\":500}', '0', null, '2021-01-25 11:57:19');
INSERT INTO `sys_oper_log` VALUES ('135', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"杭州\",\"sex\":1,\"updateTime\":1611547052817,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/25/71a8456f-7616-42c8-bc56-2752ae221939.png\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611547014000,\"password\":\"$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2\",\"createTime\":1611547052817,\"phone\":\"13345678910\",\"nickname\":\"测试2\",\"id\":\"1353552560251273218\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 11:57:32');
INSERT INTO `sys_oper_log` VALUES ('136', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"洛阳\",\"sex\":0,\"updateTime\":1611498508000,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/9a9dea89-7c3c-4406-8174-50e7ba78b532.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611498612000,\"password\":\"123456\",\"isDeleted\":0,\"createTime\":1611498508000,\"phone\":\"12345678901\",\"nickname\":\"小胡\",\"id\":\"1353348948271144962\"}', '{\"msg\":\"修改用户\'小胡\'失败，用户昵称已存在\",\"code\":500}', '0', null, '2021-01-25 11:57:42');
INSERT INTO `sys_oper_log` VALUES ('137', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"洛阳\",\"sex\":0,\"updateTime\":1611498508000,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/9a9dea89-7c3c-4406-8174-50e7ba78b532.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611498612000,\"password\":\"123456\",\"isDeleted\":0,\"createTime\":1611498508000,\"phone\":\"12345678901\",\"nickname\":\"小胡\",\"id\":\"1353348948271144962\"}', '{\"msg\":\"修改用户\'小胡\'失败，用户昵称已存在\",\"code\":500}', '0', null, '2021-01-25 11:57:51');
INSERT INTO `sys_oper_log` VALUES ('138', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"洛阳\",\"sex\":0,\"updateTime\":1611498508000,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/9a9dea89-7c3c-4406-8174-50e7ba78b532.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611498612000,\"password\":\"123456\",\"isDeleted\":0,\"createTime\":1611498508000,\"phone\":\"12345678901\",\"nickname\":\"小凉\",\"id\":\"1353348948271144962\"}', '{\"msg\":\"修改用户\'小凉\'失败，手机号码已存在\",\"code\":500}', '0', null, '2021-01-25 11:58:12');
INSERT INTO `sys_oper_log` VALUES ('139', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"洛阳\",\"sex\":0,\"updateTime\":1611547104634,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/9a9dea89-7c3c-4406-8174-50e7ba78b532.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611498612000,\"password\":\"123456\",\"isDeleted\":0,\"createTime\":1611498508000,\"phone\":\"18838849734\",\"nickname\":\"小凉\",\"id\":\"1353348948271144962\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 11:58:24');
INSERT INTO `sys_oper_log` VALUES ('140', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611545327000,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611545323000,\"password\":\"$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678901\",\"nickname\":\"test01\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"修改用户\'test01\'失败，用户昵称已存在\",\"code\":500}', '0', null, '2021-01-25 12:03:22');
INSERT INTO `sys_oper_log` VALUES ('141', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611556556871,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611545323000,\"password\":\"$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678901\",\"nickname\":\"test01\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 14:35:56');
INSERT INTO `sys_oper_log` VALUES ('142', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611556565845,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611545323000,\"password\":\"$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678902\",\"nickname\":\"test01\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 14:36:05');
INSERT INTO `sys_oper_log` VALUES ('143', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611556566000,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611545323000,\"password\":\"$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"13345678910\",\"nickname\":\"test01\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"修改用户\'test01\'失败，手机号码已存在\",\"code\":500}', '0', null, '2021-01-25 14:36:26');
INSERT INTO `sys_oper_log` VALUES ('144', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611556590904,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611545323000,\"password\":\"$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678902\",\"nickname\":\"test01\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 14:36:30');
INSERT INTO `sys_oper_log` VALUES ('145', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611557163560,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611545323000,\"password\":\"$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678902\",\"nickname\":\"test\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 14:46:03');
INSERT INTO `sys_oper_log` VALUES ('146', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"openid\":\"fhdsfdsfjks\",\"sex\":0,\"updateTime\":1611557257451,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611545323000,\"password\":\"$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2\",\"isDeleted\":0,\"createTime\":1610718315000,\"phone\":\"12345678902\",\"nickname\":\"test\",\"id\":\"1350076581600100354\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 14:47:37');
INSERT INTO `sys_oper_log` VALUES ('147', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"上海\",\"sex\":1,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/25/77c0863a-134e-49eb-b613-8a7e84fbd7bd.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611557427000,\"phone\":\"19939324567\",\"nickname\":\"test\"}', '{\"msg\":\"新增用户\'test\'失败，用户昵称已存在\",\"code\":500}', '0', null, '2021-01-25 14:51:00');
INSERT INTO `sys_oper_log` VALUES ('148', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"上海\",\"sex\":1,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/25/77c0863a-134e-49eb-b613-8a7e84fbd7bd.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611557427000,\"phone\":\"19939324567\",\"nickname\":\"大白\"}', 'null', '1', 'rawPassword cannot be null', '2021-01-25 14:51:12');
INSERT INTO `sys_oper_log` VALUES ('149', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"上海\",\"sex\":1,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/25/77c0863a-134e-49eb-b613-8a7e84fbd7bd.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611557427000,\"phone\":\"19939324567\",\"nickname\":\"大白\"}', 'null', '1', 'rawPassword cannot be null', '2021-01-25 14:52:30');
INSERT INTO `sys_oper_log` VALUES ('150', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"sex\":1,\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611557792000,\"phone\":\"19939325698\",\"nickname\":\"大白\"}', 'null', '1', 'rawPassword cannot be null', '2021-01-25 14:56:38');
INSERT INTO `sys_oper_log` VALUES ('151', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"sex\":1,\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611557792000,\"phone\":\"19939325698\",\"nickname\":\"大白\"}', 'null', '1', 'rawPassword cannot be null', '2021-01-25 15:09:28');
INSERT INTO `sys_oper_log` VALUES ('152', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"sex\":1,\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611557792000,\"phone\":\"19939325698\",\"nickname\":\"大白\"}', 'null', '1', 'rawPassword cannot be null', '2021-01-25 15:09:44');
INSERT INTO `sys_oper_log` VALUES ('153', '用户', '1', 'com.ruoyi.web.controller.takeaway.UserController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"sex\":1,\"updateTime\":1611558881831,\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611557792000,\"createTime\":1611558881830,\"phone\":\"19939325698\",\"nickname\":\"大白\",\"id\":\"1353602174731997185\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 15:14:41');
INSERT INTO `sys_oper_log` VALUES ('154', '用户', '2', 'com.ruoyi.web.controller.takeaway.UserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/user', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"sex\":1,\"updateTime\":1611558902353,\"avatar\":\"http://localhost:8080/takeaway/profile/upload/2021/01/25/1c37b9f2-82fe-4d45-bb0f-3f4739e5f0df.jpg\",\"params\":{},\"isDisable\":0,\"lastLoginTime\":1611557792000,\"isDeleted\":0,\"createTime\":1611558882000,\"phone\":\"19939325698\",\"nickname\":\"大白\",\"id\":\"1353602174731997185\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 15:15:02');
INSERT INTO `sys_oper_log` VALUES ('155', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 20:30:50');
INSERT INTO `sys_oper_log` VALUES ('156', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/takeaway/tool/gen/importTable', '127.0.0.1', '内网IP', 't_category', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 20:31:24');
INSERT INTO `sys_oper_log` VALUES ('157', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"逻辑删除\",\"remark\":\"逻辑删除\",\"params\":{},\"dictType\":\"sys_logic_delete\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 20:40:47');
INSERT INTO `sys_oper_log` VALUES ('158', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_logic_delete\",\"dictLabel\":\"不删除\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 20:41:13');
INSERT INTO `sys_oper_log` VALUES ('159', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_logic_delete\",\"dictLabel\":\"删除\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 20:41:20');
INSERT INTO `sys_oper_log` VALUES ('160', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"hht\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"分类id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611577883000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"select\",\"edit\":true,\"query\":false,\"columnComment\":\"父类id\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611577883000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"Sort\",\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sort\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"排序\",\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611577883000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"sort\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品类别名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611577883000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 20:41:54');
INSERT INTO `sys_oper_log` VALUES ('161', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"hht\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"分类id\",\"updateTime\":1611578514000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611577883000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"select\",\"edit\":true,\"query\":false,\"columnComment\":\"父类id\",\"updateTime\":1611578514000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611577883000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"Sort\",\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sort\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"排序\",\"updateTime\":1611578514000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611577883000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"sort\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品类别名称\",\"isQuery\":\"1\",\"updateTime\":1611578514000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 20:42:04');
INSERT INTO `sys_oper_log` VALUES ('162', '部门管理', '1', 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"北京分公司\",\"leader\":\"小王\",\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"phone\":\"18888888888\",\"ancestors\":\"0,100\",\"email\":\"66666@163.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-25 20:43:48');
INSERT INTO `sys_oper_log` VALUES ('163', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/takeaway/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-01-25 20:57:58');
INSERT INTO `sys_oper_log` VALUES ('164', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611645498336,\"updateTime\":1611645498337,\"sort\":1,\"params\":{},\"title\":\"湘菜\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/takeaway/mapper/FoodCategoryMapper.java (best guess)\r\n### The error may involve com.ruoyi.takeaway.mapper.FoodCategoryMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_category  ( sort, title, create_time, update_time )  VALUES  ( ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-01-26 15:18:18');
INSERT INTO `sys_oper_log` VALUES ('165', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611645583385,\"updateTime\":1611645583387,\"id\":\"1353965827410964482\",\"sort\":1,\"params\":{},\"title\":\"湘菜\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 15:19:43');
INSERT INTO `sys_oper_log` VALUES ('166', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611645722082,\"updateTime\":1611645722082,\"id\":\"1353966409169317889\",\"sort\":1,\"params\":{},\"title\":\"川菜\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 15:22:02');
INSERT INTO `sys_oper_log` VALUES ('167', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611647590473,\"updateTime\":1611647590475,\"id\":\"1353974245739745281\",\"sort\":1,\"params\":{},\"title\":\"酸辣白菜\",\"parentId\":\"1353965827410964500\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 15:53:10');
INSERT INTO `sys_oper_log` VALUES ('168', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611647971053,\"updateTime\":1611647971053,\"id\":\"1353975842033127426\",\"sort\":2,\"params\":{},\"title\":\"酸菜\",\"parentId\":\"1353965827410964482\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 15:59:31');
INSERT INTO `sys_oper_log` VALUES ('169', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611648963623,\"updateTime\":1611648963624,\"id\":\"1353980005148315650\",\"sort\":1,\"params\":{},\"title\":\"面食\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 16:16:03');
INSERT INTO `sys_oper_log` VALUES ('170', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611649253794,\"updateTime\":1611649253794,\"id\":\"1353981222243061761\",\"sort\":1,\"params\":{},\"title\":\"将面条\",\"parentId\":\"1353980005148315650\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 16:20:53');
INSERT INTO `sys_oper_log` VALUES ('171', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611649326066,\"updateTime\":1611649326066,\"id\":\"1353981525369606146\",\"params\":{},\"title\":\"酒多肉多\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 16:22:06');
INSERT INTO `sys_oper_log` VALUES ('172', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611649341658,\"updateTime\":1611649341658,\"id\":\"1353981590771388417\",\"sort\":1,\"params\":{},\"title\":\"杜康\",\"parentId\":\"1353981525369606146\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 16:22:21');
INSERT INTO `sys_oper_log` VALUES ('173', '餐品分类', '3', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/category/1353981222243061761', '127.0.0.1', '内网IP', '{ids=1353981222243061761}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 16:43:38');
INSERT INTO `sys_oper_log` VALUES ('174', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611653243849,\"updateTime\":1611653243849,\"id\":\"1353997957742460930\",\"sort\":2,\"params\":{},\"title\":\"水煮\",\"parentId\":\"1353996683189944321\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 17:27:23');
INSERT INTO `sys_oper_log` VALUES ('175', '餐品分类', '5', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.export()', 'GET', '1', 'admin', null, '/takeaway/takeaway/category/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"13721955-5edf-4c84-8191-33845fba2946_category.xlsx\",\"code\":200}', '0', null, '2021-01-26 17:28:23');
INSERT INTO `sys_oper_log` VALUES ('176', '餐品分类', '5', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.export()', 'GET', '1', 'admin', null, '/takeaway/takeaway/category/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"c06e09a7-3209-4efd-b1da-586c21960d41_category.xlsx\",\"code\":200}', '0', null, '2021-01-26 17:29:18');
INSERT INTO `sys_oper_log` VALUES ('177', '餐品分类', '3', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/category/1353975842033127426', '127.0.0.1', '内网IP', '{ids=1353975842033127426}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 17:42:34');
INSERT INTO `sys_oper_log` VALUES ('178', '餐品分类', '3', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/category/1353975842033127426', '127.0.0.1', '内网IP', '{ids=1353975842033127426}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 17:43:04');
INSERT INTO `sys_oper_log` VALUES ('179', '餐品分类', '3', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/category/1354029361238921217', '127.0.0.1', '内网IP', '{ids=1354029361238921217}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 19:32:17');
INSERT INTO `sys_oper_log` VALUES ('180', '餐品分类', '3', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/category/1353966409169317862', '127.0.0.1', '内网IP', '{ids=1353966409169317862}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 22:27:49');
INSERT INTO `sys_oper_log` VALUES ('181', '餐品分类', '3', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/category/1353966409169317862', '127.0.0.1', '内网IP', '{ids=1353966409169317862}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 22:28:31');
INSERT INTO `sys_oper_log` VALUES ('182', '餐品分类', '3', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/category/1353981222243061761', '127.0.0.1', '内网IP', '{ids=1353981222243061761}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 22:47:37');
INSERT INTO `sys_oper_log` VALUES ('183', '餐品分类', '3', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/category/1353981222243061761', '127.0.0.1', '内网IP', '{ids=1353981222243061761}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 22:49:01');
INSERT INTO `sys_oper_log` VALUES ('184', '餐品分类', '1', 'com.ruoyi.web.controller.takeaway.FoodCategoryController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/category', '127.0.0.1', '内网IP', '{\"createTime\":1611672619911,\"updateTime\":1611672619911,\"id\":\"1354079226841038849\",\"sort\":3,\"params\":{},\"title\":\"鸡腿\",\"parentId\":\"1353981525369606146\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 22:50:19');
INSERT INTO `sys_oper_log` VALUES ('185', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 23:08:44');
INSERT INTO `sys_oper_log` VALUES ('186', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/takeaway/tool/gen/importTable', '127.0.0.1', '内网IP', 't_food', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 23:09:07');
INSERT INTO `sys_oper_log` VALUES ('187', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"餐品id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611673747000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611673747000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Describe\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"describe\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品描述\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611673747000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"describe\"},{\"capJavaField\":\"Sale\",\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sale\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"销量\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-26 23:10:50');
INSERT INTO `sys_oper_log` VALUES ('188', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 11:43:13');
INSERT INTO `sys_oper_log` VALUES ('189', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/takeaway/tool/gen/importTable', '127.0.0.1', '内网IP', 't_food', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 11:43:21');
INSERT INTO `sys_oper_log` VALUES ('190', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"hht\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"餐品id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611719001000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611719001000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Describe\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"describe\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品描述\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611719001000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"describe\"},{\"capJavaField\":\"Sale\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sale\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"销量\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 11:45:16');
INSERT INTO `sys_oper_log` VALUES ('191', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"餐品状态\",\"params\":{},\"dictType\":\"sys_food_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 11:45:56');
INSERT INTO `sys_oper_log` VALUES ('192', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"remark\":\"餐品上架\",\"params\":{},\"dictType\":\"sys_food_status\",\"dictLabel\":\"上架\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 11:46:37');
INSERT INTO `sys_oper_log` VALUES ('193', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"餐品下架\",\"params\":{},\"dictType\":\"sys_food_status\",\"dictLabel\":\"下架\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 11:46:56');
INSERT INTO `sys_oper_log` VALUES ('194', '字典类型', '2', 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1611719156000,\"updateBy\":\"admin\",\"dictName\":\"餐品状态\",\"remark\":\"餐品状态\",\"dictId\":102,\"params\":{},\"dictType\":\"sys_food_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 11:47:28');
INSERT INTO `sys_oper_log` VALUES ('195', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"hht\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"餐品id\",\"updateTime\":1611719116000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611719001000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品名称\",\"isQuery\":\"1\",\"updateTime\":1611719116000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611719001000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Describe\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"describe\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品描述\",\"isQuery\":\"1\",\"updateTime\":1611719116000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611719001000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"describe\"},{\"capJavaField\":\"Sale\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sale\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"销量\",\"isQuery\":\"1\",\"updateTime\":1611719116000,\"sort\":4,\"list', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 11:47:48');
INSERT INTO `sys_oper_log` VALUES ('196', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/takeaway/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-01-27 11:51:19');
INSERT INTO `sys_oper_log` VALUES ('197', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"hht\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"餐品id\",\"updateTime\":1611719268000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611719001000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品名称\",\"isQuery\":\"1\",\"updateTime\":1611719268000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611719001000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Describe\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"describe\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品描述\",\"isQuery\":\"1\",\"updateTime\":1611719268000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611719001000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"describe\"},{\"capJavaField\":\"Sale\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sale\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"销量\",\"isQuery\":\"1\",\"updateTime\":1611719268000,\"sort\":4,\"list', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 12:07:28');
INSERT INTO `sys_oper_log` VALUES ('198', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"hht\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"餐品id\",\"updateTime\":1611720448000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611719001000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品名称\",\"isQuery\":\"1\",\"updateTime\":1611720448000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611719001000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Describe\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"describe\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"餐品描述\",\"isQuery\":\"1\",\"updateTime\":1611720448000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611719001000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"describe\"},{\"capJavaField\":\"Sale\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sale\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"销量\",\"isQuery\":\"1\",\"updateTime\":1611720448000,\"sort\":4,\"list', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 12:09:37');
INSERT INTO `sys_oper_log` VALUES ('199', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"updateTime\":1611734766867,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/a64f1f8a-f870-4e5d-b65c-b88d69111488.jpg\",\"createTime\":1611734766865,\"price\":10,\"name\":\"素馅饺子\",\"describe\":\"手工饺\",\"id\":\"1354339890025238529\",\"categoryId\":\"1353980005148315600\",\"status\":0}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3\r\n### The error may exist in com/ruoyi/takeaway/mapper/FoodMapper.java (best guess)\r\n### The error may involve com.ruoyi.takeaway.mapper.FoodMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_food  ( id, name, describe,  category_id, cover, price,  create_time, update_time,  status )  VALUES  ( ?, ?, ?,  ?, ?, ?,  ?, ?,  ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3', '2021-01-27 16:06:06');
INSERT INTO `sys_oper_log` VALUES ('200', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"updateTime\":1611735346728,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/a64f1f8a-f870-4e5d-b65c-b88d69111488.jpg\",\"createTime\":1611735346690,\"price\":10,\"name\":\"素馅饺子\",\"describe\":\"手工饺\",\"id\":\"1354342321509453825\",\"categoryId\":\"1353980005148315600\",\"status\":0}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3\r\n### The error may exist in com/ruoyi/takeaway/mapper/FoodMapper.java (best guess)\r\n### The error may involve com.ruoyi.takeaway.mapper.FoodMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_food  ( id, name, describe,  category_id, cover, price,  create_time, update_time,  status )  VALUES  ( ?, ?, ?,  ?, ?, ?,  ?, ?,  ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3', '2021-01-27 16:17:01');
INSERT INTO `sys_oper_log` VALUES ('201', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"updateTime\":1611736152666,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/a64f1f8a-f870-4e5d-b65c-b88d69111488.jpg\",\"createTime\":1611736152665,\"price\":10,\"name\":\"素馅饺子\",\"describe\":\"手工饺\",\"id\":\"1354345702504304641\",\"categoryId\":\"1353980005148315600\",\"status\":0}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3\r\n### The error may exist in com/ruoyi/takeaway/mapper/FoodMapper.java (best guess)\r\n### The error may involve com.ruoyi.takeaway.mapper.FoodMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_food  ( id, name, describe,  category_id, cover, price,  create_time, update_time,  status )  VALUES  ( ?, ?, ?,  ?, ?, ?,  ?, ?,  ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\ncover,\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALU\' at line 3', '2021-01-27 16:29:12');
INSERT INTO `sys_oper_log` VALUES ('202', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"updateTime\":1611736181595,\"params\":{},\"createTime\":1611736181595,\"price\":1,\"name\":\"测试\",\"describe\":\"测试\",\"id\":\"1354345823866490882\",\"categoryId\":\"1353966409169318000\",\"status\":0}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\n\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALUES  ( \' at line 3\r\n### The error may exist in com/ruoyi/takeaway/mapper/FoodMapper.java (best guess)\r\n### The error may involve com.ruoyi.takeaway.mapper.FoodMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_food  ( id, name, describe,  category_id,  price,  create_time, update_time,  status )  VALUES  ( ?, ?, ?,  ?,  ?,  ?, ?,  ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\n\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALUES  ( \' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n\ncategory_id,\n\nprice,\n\ncreate_time,\nupdate_time,\n\nstatus )  VALUES  ( \' at line 3', '2021-01-27 16:29:41');
INSERT INTO `sys_oper_log` VALUES ('203', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"updateTime\":1611736663624,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/19a5c704-143f-4703-ab92-06ac5fb23638.jpg\",\"createTime\":1611736663622,\"price\":0.5,\"name\":\"包子\",\"id\":\"1354347845613355009\",\"categoryId\":\"1353980005148315600\",\"status\":0}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'food_describe\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/takeaway/mapper/FoodMapper.java (best guess)\r\n### The error may involve com.ruoyi.takeaway.mapper.FoodMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_food  ( id, name,   category_id, cover, price,  create_time, update_time,  status )  VALUES  ( ?, ?,   ?, ?, ?,  ?, ?,  ? )\r\n### Cause: java.sql.SQLException: Field \'food_describe\' doesn\'t have a default value\n; Field \'food_describe\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'food_describe\' doesn\'t have a default value', '2021-01-27 16:37:43');
INSERT INTO `sys_oper_log` VALUES ('204', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"包子\",\"updateTime\":1611737066572,\"params\":{},\"createTime\":1611737066572,\"price\":0.5,\"name\":\"包子\",\"id\":\"1354349535724929025\",\"categoryId\":\"1353980005148315600\",\"status\":0}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'cover\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/takeaway/mapper/FoodMapper.java (best guess)\r\n### The error may involve com.ruoyi.takeaway.mapper.FoodMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_food  ( id, name, food_describe,  category_id,  price,  create_time, update_time,  status )  VALUES  ( ?, ?, ?,  ?,  ?,  ?, ?,  ? )\r\n### Cause: java.sql.SQLException: Field \'cover\' doesn\'t have a default value\n; Field \'cover\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'cover\' doesn\'t have a default value', '2021-01-27 16:44:26');
INSERT INTO `sys_oper_log` VALUES ('205', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"包子\",\"updateTime\":1611737106898,\"params\":{},\"createTime\":1611737106898,\"price\":0.5,\"name\":\"包子\",\"id\":\"1354349704868626434\",\"categoryId\":\"1353980005148315600\",\"status\":0}', 'null', '1', '', '2021-01-27 16:45:06');
INSERT INTO `sys_oper_log` VALUES ('206', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"1\",\"updateTime\":1611737141736,\"params\":{},\"createTime\":1611737141736,\"price\":1,\"name\":\"1\",\"id\":\"1354349850989789185\",\"categoryId\":\"1353966409169318000\",\"status\":0}', 'null', '1', '', '2021-01-27 16:45:41');
INSERT INTO `sys_oper_log` VALUES ('207', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"1\",\"updateTime\":1611737411183,\"params\":{},\"createTime\":1611737411182,\"price\":1,\"name\":\"1\",\"id\":\"1354350981111427073\",\"categoryId\":\"1353966409169318000\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 16:50:11');
INSERT INTO `sys_oper_log` VALUES ('208', '餐品', '3', 'com.ruoyi.web.controller.takeaway.FoodController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/food/1354350981111427073', '127.0.0.1', '内网IP', '{ids=1354350981111427073}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 17:11:17');
INSERT INTO `sys_oper_log` VALUES ('209', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"好吃的肉包\",\"updateTime\":1611739426045,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg\",\"createTime\":1611739426044,\"price\":0.5,\"name\":\"包子\",\"id\":\"1354359432050950145\",\"categoryId\":\"面食\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 17:23:46');
INSERT INTO `sys_oper_log` VALUES ('210', '餐品', '2', 'com.ruoyi.web.controller.takeaway.FoodController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"辣子鸡，辣自己，不辣不要钱\",\"updateTime\":1611739508859,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg\",\"sale\":0,\"isDeleted\":0,\"createTime\":1611737411000,\"price\":1,\"name\":\"辣子鸡\",\"id\":\"1354350981111427073\",\"categoryId\":\"1353966409169318000\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 17:25:08');
INSERT INTO `sys_oper_log` VALUES ('211', '餐品', '2', 'com.ruoyi.web.controller.takeaway.FoodController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"辣子鸡，辣自己，不辣不要钱\",\"updateTime\":1611740121288,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg\",\"sale\":0,\"isDeleted\":0,\"createTime\":1611737411000,\"price\":1,\"name\":\"辣子鸡\",\"id\":\"1354350981111427073\",\"categoryId\":\"川菜\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 17:35:21');
INSERT INTO `sys_oper_log` VALUES ('212', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"猪肉顿粉条，管到饱\",\"updateTime\":1611752412601,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg\",\"createTime\":1611752412600,\"price\":10,\"name\":\"猪肉炖粉条\",\"id\":\"1354413901602152450\",\"categoryId\":\"1353981525369606146\",\"status\":0}', 'null', '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'file_name\' in \'where clause\'\r\n### The error may exist in file [E:\\gitee_project\\RuoYi-Vue-Plus\\takeaway-service\\target\\classes\\mapper\\FileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(1) from t_file where file_name=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'file_name\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'file_name\' in \'where clause\'', '2021-01-27 21:00:12');
INSERT INTO `sys_oper_log` VALUES ('213', '餐品', '1', 'com.ruoyi.web.controller.takeaway.FoodController.add()', 'POST', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"猪肉顿粉条，管到饱\",\"updateTime\":1611752469190,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg\",\"createTime\":1611752469189,\"price\":10,\"name\":\"猪肉炖粉条\",\"id\":\"1354414138974617601\",\"categoryId\":\"1353981525369606146\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 21:01:09');
INSERT INTO `sys_oper_log` VALUES ('214', '餐品', '2', 'com.ruoyi.web.controller.takeaway.FoodController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"猪肉顿粉条，管到饱\",\"updateTime\":1611752490299,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg\",\"score\":0,\"sale\":0,\"isDeleted\":0,\"createTime\":1611752469000,\"price\":10,\"name\":\"猪肉炖粉条\",\"id\":\"1354414138974617601\",\"categoryId\":\"1353981525369606146\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 21:01:30');
INSERT INTO `sys_oper_log` VALUES ('215', '餐品', '2', 'com.ruoyi.web.controller.takeaway.FoodController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"猪肉顿粉条，管到饱，配蒜，配辣椒\",\"updateTime\":1611756145542,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg\",\"score\":0,\"sale\":0,\"isDeleted\":0,\"createTime\":1611752469000,\"price\":10,\"name\":\"猪肉炖粉条\",\"id\":\"1354414138974617601\",\"categoryId\":\"1353981525369606146\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 22:02:25');
INSERT INTO `sys_oper_log` VALUES ('216', '餐品', '2', 'com.ruoyi.web.controller.takeaway.FoodController.edit()', 'PUT', '1', 'admin', null, '/takeaway/takeaway/food', '127.0.0.1', '内网IP', '{\"foodDescribe\":\"猪肉顿粉条，管到饱，配蒜，配辣椒\",\"updateTime\":1611756567359,\"params\":{},\"cover\":\"http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg\",\"score\":0,\"sale\":0,\"isDeleted\":0,\"createTime\":1611752469000,\"price\":10,\"name\":\"猪肉炖粉条\",\"id\":\"1354414138974617601\",\"categoryId\":\"1353981525369606146\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-27 22:09:27');
INSERT INTO `sys_oper_log` VALUES ('217', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2021-01-29 14:50:10');
INSERT INTO `sys_oper_log` VALUES ('218', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/1020', '127.0.0.1', '内网IP', '{menuId=1020}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-01-29 14:50:28');
INSERT INTO `sys_oper_log` VALUES ('219', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 14:50:55');
INSERT INTO `sys_oper_log` VALUES ('220', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2021-01-29 14:51:42');
INSERT INTO `sys_oper_log` VALUES ('221', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"评论列表\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"comment\",\"component\":\"takeaway/comment/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"takeaway:comment:index\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 15:17:20');
INSERT INTO `sys_oper_log` VALUES ('222', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"评论列表\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"comment\",\"component\":\"takeaway/comment/index\",\"children\":[],\"createTime\":1611904640000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"takeaway:comment:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 15:17:54');
INSERT INTO `sys_oper_log` VALUES ('223', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"1\",\"menuName\":\"收银订单\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"takeaway/order/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"takeaway:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 15:22:25');
INSERT INTO `sys_oper_log` VALUES ('224', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"2\",\"menuName\":\"退款订单\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"refund\",\"component\":\"takeaway/order/refund/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"takeaway:refund:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 15:26:44');
INSERT INTO `sys_oper_log` VALUES ('225', '登录日志', '3', 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/monitor/logininfor/133,132', '127.0.0.1', '内网IP', '{infoIds=133,132}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 20:50:51');
INSERT INTO `sys_oper_log` VALUES ('226', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"评论审核状态\",\"remark\":\"评论审核状态 0未审核，1已审核\",\"params\":{},\"dictType\":\"sys_comment_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 21:26:06');
INSERT INTO `sys_oper_log` VALUES ('227', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_comment_status\",\"dictLabel\":\"已审核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 21:26:37');
INSERT INTO `sys_oper_log` VALUES ('228', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"params\":{},\"dictType\":\"sys_comment_status\",\"dictLabel\":\"未审核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 21:26:51');
INSERT INTO `sys_oper_log` VALUES ('229', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', '1', 'admin', null, '/takeaway/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1610526544000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"sell@163.com\",\"nickName\":\"王老吉\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1610526544000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 22:40:02');
INSERT INTO `sys_oper_log` VALUES ('230', '定时任务', '3', 'com.ruoyi.quartz.controller.SysJobController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/monitor/job/3,2,1', '127.0.0.1', '内网IP', '{jobIds=3,2,1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-29 22:41:30');
INSERT INTO `sys_oper_log` VALUES ('231', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单状态\",\"remark\":\"订单状态\",\"params\":{},\"dictType\":\"sys_order_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 15:49:32');
INSERT INTO `sys_oper_log` VALUES ('232', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_order_status\",\"dictLabel\":\"已下单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:15:27');
INSERT INTO `sys_oper_log` VALUES ('233', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"-1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_order_status\",\"dictLabel\":\"已取消\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:15:44');
INSERT INTO `sys_oper_log` VALUES ('234', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_order_status\",\"dictLabel\":\"待审核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:16:02');
INSERT INTO `sys_oper_log` VALUES ('235', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_order_status\",\"dictLabel\":\"配送中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:16:21');
INSERT INTO `sys_oper_log` VALUES ('236', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_order_status\",\"dictLabel\":\"已完成\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:16:41');
INSERT INTO `sys_oper_log` VALUES ('237', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"支付状态\",\"params\":{},\"dictType\":\"sys_pay_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:17:22');
INSERT INTO `sys_oper_log` VALUES ('238', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_pay_status\",\"dictLabel\":\"已支付\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:17:47');
INSERT INTO `sys_oper_log` VALUES ('239', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_pay_status\",\"dictLabel\":\"未支付\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:18:03');
INSERT INTO `sys_oper_log` VALUES ('240', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_pay_status\",\"dictLabel\":\"已支付\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1611994667000,\"dictCode\":113,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:18:10');
INSERT INTO `sys_oper_log` VALUES ('241', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"支付方式\",\"params\":{},\"dictType\":\"sys_pay_method\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:18:38');
INSERT INTO `sys_oper_log` VALUES ('242', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_pay_method\",\"dictLabel\":\"支付宝\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:18:57');
INSERT INTO `sys_oper_log` VALUES ('243', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_pay_method\",\"dictLabel\":\"当面付\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:19:15');
INSERT INTO `sys_oper_log` VALUES ('244', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_order_status\",\"dictLabel\":\"已审核\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1611994562000,\"dictCode\":110,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:22:37');
INSERT INTO `sys_oper_log` VALUES ('245', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:26:11');
INSERT INTO `sys_oper_log` VALUES ('246', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/takeaway/tool/gen/importTable', '127.0.0.1', '内网IP', 't_order', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:26:36');
INSERT INTO `sys_oper_log` VALUES ('247', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"OrderId\",\"usableColumn\":false,\"columnId\":57,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"订单id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611995195000,\"tableId\":6,\"pk\":true,\"columnName\":\"order_id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":58,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611995195000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"OrderStatus\",\"usableColumn\":false,\"columnId\":59,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_order_status\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderStatus\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"订单状态\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"tinyint(6)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611995195000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"order_status\"},{\"capJavaField\":\"Nickname\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户昵称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"creat', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:30:33');
INSERT INTO `sys_oper_log` VALUES ('248', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/takeaway/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"hht\",\"columns\":[{\"capJavaField\":\"OrderId\",\"usableColumn\":false,\"columnId\":57,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"订单id\",\"updateTime\":1611995433000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1611995195000,\"tableId\":6,\"pk\":true,\"columnName\":\"order_id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":58,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1611995433000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(19)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611995195000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"OrderStatus\",\"usableColumn\":false,\"columnId\":59,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_order_status\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderStatus\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"订单状态\",\"isQuery\":\"1\",\"updateTime\":1611995433000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"tinyint(6)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1611995195000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"order_status\"},{\"capJavaField\":\"Nickname\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户昵称\",\"isQuery\":\"1\",\"updateTime\":1611995433000,', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:30:59');
INSERT INTO `sys_oper_log` VALUES ('249', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/takeaway/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-01-30 16:31:07');
INSERT INTO `sys_oper_log` VALUES ('250', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/2032', '127.0.0.1', '内网IP', '{menuId=2032}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:37:20');
INSERT INTO `sys_oper_log` VALUES ('251', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/2033', '127.0.0.1', '内网IP', '{menuId=2033}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-30 16:37:23');
INSERT INTO `sys_oper_log` VALUES ('252', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567', '127.0.0.1', '内网IP', '{orderIds=1234567}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:17:13');
INSERT INTO `sys_oper_log` VALUES ('253', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567', '127.0.0.1', '内网IP', '{orderIds=1234567}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:17:42');
INSERT INTO `sys_oper_log` VALUES ('254', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567', '127.0.0.1', '内网IP', '{orderIds=1234567}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:23:09');
INSERT INTO `sys_oper_log` VALUES ('255', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567', '127.0.0.1', '内网IP', '{orderIds=1234567}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:32:33');
INSERT INTO `sys_oper_log` VALUES ('256', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567', '127.0.0.1', '内网IP', '{orderIds=1234567}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:33:06');
INSERT INTO `sys_oper_log` VALUES ('257', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567', '127.0.0.1', '内网IP', '{orderIds=1234567}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: update  t_order_detail set is_deleted = 1 where order_id in (?) where is_deleted = 0\r\n### The error may exist in file [E:\\gitee_project\\RuoYi-Vue-Plus\\takeaway-service\\target\\classes\\mapper\\OrderItemMapper.xml]\r\n### The error may involve com.ruoyi.takeaway.mapper.OrderItemMapper.deleteByOrderIds\r\n### The error occurred while executing an update\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: update  t_order_detail set is_deleted = 1 where order_id in (?) where is_deleted = 0', '2021-01-31 15:34:59');
INSERT INTO `sys_oper_log` VALUES ('258', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567', '127.0.0.1', '内网IP', '{orderIds=1234567}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:37:14');
INSERT INTO `sys_oper_log` VALUES ('259', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/2', '127.0.0.1', '内网IP', '{orderIds=2}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:39:27');
INSERT INTO `sys_oper_log` VALUES ('260', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567', '127.0.0.1', '内网IP', '{orderIds=1234567}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:44:01');
INSERT INTO `sys_oper_log` VALUES ('261', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567,2', '127.0.0.1', '内网IP', '{orderIds=1234567,2}', '{\"msg\":\"操作失败\",\"code\":500}', '0', null, '2021-01-31 15:46:20');
INSERT INTO `sys_oper_log` VALUES ('262', '订单', '3', 'com.ruoyi.web.controller.takeaway.OrderController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/takeaway/order/1234567,2', '127.0.0.1', '内网IP', '{orderIds=1234567,2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-01-31 15:52:04');
INSERT INTO `sys_oper_log` VALUES ('263', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/user/2', '127.0.0.1', '内网IP', '{userIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:06:35');
INSERT INTO `sys_oper_log` VALUES ('264', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"主框架页-默认皮肤样式名称\",\"configKey\":\"sys.index.skinName\",\"createBy\":\"admin\",\"createTime\":1610526548000,\"updateBy\":\"admin\",\"configId\":1,\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"configType\":\"Y\",\"configValue\":\"skin-blue\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:09:27');
INSERT INTO `sys_oper_log` VALUES ('265', '通知公告', '3', 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/notice/1', '127.0.0.1', '内网IP', '{noticeIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:09:35');
INSERT INTO `sys_oper_log` VALUES ('266', '通知公告', '3', 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/notice/2', '127.0.0.1', '内网IP', '{noticeIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:09:38');
INSERT INTO `sys_oper_log` VALUES ('267', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2021-02-01 11:12:15');
INSERT INTO `sys_oper_log` VALUES ('268', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-02-01 11:12:20');
INSERT INTO `sys_oper_log` VALUES ('269', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-02-01 11:12:45');
INSERT INTO `sys_oper_log` VALUES ('270', '岗位管理', '3', 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/post/4', '127.0.0.1', '内网IP', '{postIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:17:50');
INSERT INTO `sys_oper_log` VALUES ('271', '岗位管理', '3', 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/post/3', '127.0.0.1', '内网IP', '{postIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:17:53');
INSERT INTO `sys_oper_log` VALUES ('272', '岗位管理', '3', 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/post/2', '127.0.0.1', '内网IP', '{postIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:17:57');
INSERT INTO `sys_oper_log` VALUES ('273', '岗位管理', '3', 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/takeaway/system/post/1', '127.0.0.1', '内网IP', '{postIds=1}', 'null', '1', '董事长已分配,不能删除', '2021-02-01 11:18:00');
INSERT INTO `sys_oper_log` VALUES ('274', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"2\",\"menuName\":\"角色管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"role\",\"component\":\"system/role/index\",\"children\":[],\"createTime\":1610526544000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":101,\"menuType\":\"C\",\"perms\":\"system:role:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:36:54');
INSERT INTO `sys_oper_log` VALUES ('275', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"1\",\"menuName\":\"用户菜单\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"takeaway/user/index\",\"children\":[],\"createTime\":1610609000000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"C\",\"perms\":\"takeaway:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:37:55');
INSERT INTO `sys_oper_log` VALUES ('276', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"2\",\"menuName\":\"角色管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"role\",\"component\":\"system/role/index\",\"children\":[],\"createTime\":1610526544000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":101,\"menuType\":\"C\",\"perms\":\"system:role:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:38:56');
INSERT INTO `sys_oper_log` VALUES ('277', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"后台账户管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1610526544000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:56:49');
INSERT INTO `sys_oper_log` VALUES ('278', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"1\",\"menuName\":\"前台客户菜单\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"takeaway/user/index\",\"children\":[],\"createTime\":1610609000000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"C\",\"perms\":\"takeaway:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:58:21');
INSERT INTO `sys_oper_log` VALUES ('279', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"2\",\"menuName\":\"后台角色管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"role\",\"component\":\"system/role/index\",\"children\":[],\"createTime\":1610526544000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":101,\"menuType\":\"C\",\"perms\":\"system:role:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 11:58:35');
INSERT INTO `sys_oper_log` VALUES ('280', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"后台账户管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1610526544000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 12:00:51');
INSERT INTO `sys_oper_log` VALUES ('281', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"2\",\"menuName\":\"后台角色管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"role\",\"component\":\"system/role/index\",\"children\":[],\"createTime\":1610526544000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":101,\"menuType\":\"C\",\"perms\":\"system:role:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 12:01:07');
INSERT INTO `sys_oper_log` VALUES ('282', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/takeaway/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1610526544000,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"deptIds\":[],\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员角色', '2021-02-01 15:45:35');
INSERT INTO `sys_oper_log` VALUES ('283', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1610526544000,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,2000,2012,2013,2014,2015,2016,2017,2001,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2002,2031,2003,2034,2035,2036,2037,2038,2039,2005,2030],\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员角色', '2021-02-01 15:45:50');
INSERT INTO `sys_oper_log` VALUES ('284', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/takeaway/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"status\":\"1\"}', 'null', '1', '不允许操作超级管理员角色', '2021-02-01 15:45:59');
INSERT INTO `sys_oper_log` VALUES ('285', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1610526544000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"sell@163.com\",\"nickName\":\"王老吉\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1610526544000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2021-02-01 15:46:29');
INSERT INTO `sys_oper_log` VALUES ('286', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', '1', 'admin', null, '/takeaway/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":true,\"password\":\"admin\",\"params\":{},\"userId\":1}', 'null', '1', '不允许操作超级管理员用户', '2021-02-01 15:46:41');
INSERT INTO `sys_oper_log` VALUES ('287', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/takeaway/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/02/01/89d2111c-806d-4aeb-8afe-2a9644546eb0.jpeg\",\"code\":200}', '0', null, '2021-02-01 15:56:47');
INSERT INTO `sys_oper_log` VALUES ('288', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', '1', 'admin', null, '/takeaway/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1610526544000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"sell@163.com\",\"nickName\":\"王老吉\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1610526544000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 15:56:55');
INSERT INTO `sys_oper_log` VALUES ('289', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1610526544000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"sell@163.com\",\"nickName\":\"王老吉\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"/profile/avatar/2021/02/01/89d2111c-806d-4aeb-8afe-2a9644546eb0.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1610526544000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2021-02-01 15:57:11');
INSERT INTO `sys_oper_log` VALUES ('290', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', '1', 'admin', null, '/takeaway/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"userId\":1,\"status\":\"1\"}', 'null', '1', '不允许操作超级管理员用户', '2021-02-01 15:59:02');
INSERT INTO `sys_oper_log` VALUES ('291', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"餐品分类\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"category\",\"component\":\"takeaway/category/index\",\"children\":[],\"createTime\":1611579342000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"C\",\"perms\":\"takeaway:category:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 16:03:32');
INSERT INTO `sys_oper_log` VALUES ('292', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"1\",\"menuName\":\"餐品列表\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"food\",\"component\":\"takeaway/food/index\",\"children\":[],\"createTime\":1611719814000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2024,\"menuType\":\"C\",\"perms\":\"takeaway:food:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 16:03:57');
INSERT INTO `sys_oper_log` VALUES ('293', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"1\",\"menuName\":\"订单列表\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"takeaway/order/index\",\"children\":[],\"createTime\":1611995880000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2034,\"menuType\":\"C\",\"perms\":\"takeaway:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 16:04:19');
INSERT INTO `sys_oper_log` VALUES ('294', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/takeaway/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":\"1\",\"menuName\":\"文件列表\",\"params\":{},\"parentId\":2005,\"isCache\":\"0\",\"path\":\"file\",\"component\":\"takeaway/file/index\",\"children\":[],\"createTime\":1611821361000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2030,\"menuType\":\"C\",\"perms\":\"takeaway:file:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-02-01 16:04:53');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2021-01-13 16:29:04', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2021-01-13 16:29:04', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2021-01-13 16:29:04', '', null, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '王老吉', '00', 'sell@163.com', '15888888888', '0', '/profile/avatar/2021/02/01/89d2111c-806d-4aeb-8afe-2a9644546eb0.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-01-13 16:29:04', 'admin', '2021-01-13 16:29:04', '', '2021-02-01 15:56:55', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2021-01-13 16:29:04', 'admin', '2021-01-13 16:29:04', '', null, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `id` char(19) NOT NULL COMMENT '购物车id',
  `user_id` char(19) DEFAULT NULL COMMENT '用户id',
  `food_id` char(19) DEFAULT NULL COMMENT '餐品id',
  `food_price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `amount` int(11) DEFAULT '0' COMMENT '数量',
  `food_name` varchar(100) DEFAULT NULL COMMENT '餐品名称',
  `food_url` varchar(100) DEFAULT NULL COMMENT '餐品图片',
  `total_price` decimal(10,2) DEFAULT '0.00' COMMENT '总金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `checked` tinyint(1) DEFAULT '0' COMMENT '是否选中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车';

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES ('1358711350844030977', '1357594749054844929', '1354414138974617601', '10.00', '1', '猪肉炖粉条', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg', '10.00', '2021-02-08 17:36:44', '2021-02-08 17:36:44', '1', '0');
INSERT INTO `t_cart` VALUES ('1358712867248504834', '1357594749054844929', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-08 17:42:46', '2021-02-08 17:42:46', '1', '0');
INSERT INTO `t_cart` VALUES ('1358718530846556161', '1357594749054844929', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-08 18:05:16', '2021-02-08 18:05:16', '0', '0');
INSERT INTO `t_cart` VALUES ('1358718633380511746', '1357594749054844929', '1354350981111427073', '1.00', '1', '辣子鸡', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '1.00', '2021-02-08 18:05:41', '2021-02-08 18:05:41', '0', '0');
INSERT INTO `t_cart` VALUES ('1358786438943571970', '1357595593036890113', '1354350981111427073', '1.00', '1', '辣子鸡', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '1.00', '2021-02-08 22:35:07', '2021-02-08 22:35:07', '1', '0');
INSERT INTO `t_cart` VALUES ('1358795319400812545', '1357595593036890113', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-08 23:10:24', '2021-02-08 23:10:24', '1', '0');
INSERT INTO `t_cart` VALUES ('1359052941995626498', '1357595593036890113', '1354350981111427073', '1.00', '1', '辣子鸡', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '1.00', '2021-02-09 16:14:06', '2021-02-09 16:14:06', '1', '0');
INSERT INTO `t_cart` VALUES ('1359053099571433473', '1357595593036890113', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-09 16:14:44', '2021-02-09 16:14:44', '1', '0');
INSERT INTO `t_cart` VALUES ('1359055827466997761', '1357595593036890113', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-09 16:25:34', '2021-02-09 16:25:34', '1', '0');
INSERT INTO `t_cart` VALUES ('1359056387117174785', '1357595593036890113', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-09 16:27:47', '2021-02-09 16:27:47', '1', '0');
INSERT INTO `t_cart` VALUES ('1359056449410977793', '1357595593036890113', '1354414138974617601', '10.00', '1', '猪肉炖粉条', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg', '10.00', '2021-02-09 16:28:02', '2021-02-09 16:28:02', '1', '0');
INSERT INTO `t_cart` VALUES ('1359056718177783810', '1357595593036890113', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-09 16:29:06', '2021-02-09 16:29:06', '1', '0');
INSERT INTO `t_cart` VALUES ('1359081483923976193', '1357595593036890113', '1354350981111427073', '1.00', '1', '辣子鸡', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '1.00', '2021-02-09 18:07:31', '2021-02-09 18:07:31', '1', '0');
INSERT INTO `t_cart` VALUES ('1359527850798530561', '1357595593036890113', '1354350981111427073', '1.00', '1', '辣子鸡', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '1.00', '2021-02-10 23:41:13', '2021-02-10 23:41:13', '1', '0');
INSERT INTO `t_cart` VALUES ('1359527877616910337', '1357595593036890113', '1354414138974617601', '10.00', '1', '猪肉炖粉条', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg', '10.00', '2021-02-10 23:41:19', '2021-02-10 23:41:19', '1', '0');
INSERT INTO `t_cart` VALUES ('1359880651064012801', '1359875487787700226', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-11 23:03:07', '2021-02-11 23:03:07', '1', '0');
INSERT INTO `t_cart` VALUES ('1360500668143030274', '1360476640531492865', '1354350981111427073', '1.00', '1', '辣子鸡', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '1.00', '2021-02-13 16:06:51', '2021-02-13 16:06:51', '1', '0');
INSERT INTO `t_cart` VALUES ('1360503855822454785', '1360502419801817090', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-13 16:19:31', '2021-02-13 16:19:31', '1', '0');
INSERT INTO `t_cart` VALUES ('1360509861814112258', '1360502419801817090', '1354414138974617601', '10.00', '1', '猪肉炖粉条', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg', '10.00', '2021-02-13 16:43:23', '2021-02-13 16:43:23', '1', '0');
INSERT INTO `t_cart` VALUES ('1360528892063457282', '1360502419801817090', '1354359432050950145', '0.50', '1', '包子', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '2021-02-13 17:59:00', '2021-02-13 17:59:00', '1', '0');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` char(19) NOT NULL COMMENT '分类id',
  `parent_id` char(19) NOT NULL DEFAULT '0' COMMENT '父类id',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `title` varchar(60) NOT NULL COMMENT '餐品类别名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='餐品分类';

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1353965827410964482', '0', '1', '湘菜', '2021-01-26 15:19:43', '2021-01-26 15:19:43', '0');
INSERT INTO `t_category` VALUES ('1353966409169317862', '1353966409169317889', '0', '四川火锅', '2021-01-26 15:23:22', '2021-01-26 15:23:25', '0');
INSERT INTO `t_category` VALUES ('1353966409169317889', '0', '1', '川菜', '2021-01-26 15:22:02', '2021-01-26 15:22:02', '0');
INSERT INTO `t_category` VALUES ('1353974245739745281', '1353965827410964482', '1', '酸辣白菜', '2021-01-26 15:53:10', '2021-01-26 15:53:10', '0');
INSERT INTO `t_category` VALUES ('1353975842033127426', '1353965827410964482', '2', '酸菜', '2021-01-26 15:59:31', '2021-01-26 15:59:31', '0');
INSERT INTO `t_category` VALUES ('1353980005148315650', '0', '1', '面食', '2021-01-26 16:16:04', '2021-01-26 16:16:04', '0');
INSERT INTO `t_category` VALUES ('1353981222243061761', '1353980005148315650', '1', '将面条', '2021-01-26 16:20:54', '2021-01-26 16:20:54', '0');
INSERT INTO `t_category` VALUES ('1353981525369606146', '0', '0', '酒多肉多', '2021-01-26 16:22:06', '2021-01-26 16:22:06', '0');
INSERT INTO `t_category` VALUES ('1353981590771388417', '1353981525369606146', '1', '杜康', '2021-01-26 16:22:22', '2021-01-26 16:22:22', '0');
INSERT INTO `t_category` VALUES ('1353996683189944321', '0', '0', '水席', '2021-01-26 17:22:20', '2021-01-26 17:22:20', '0');
INSERT INTO `t_category` VALUES ('1353997957742460930', '1353996683189944321', '2', '水煮', '2021-01-26 17:27:24', '2021-01-26 17:27:24', '0');
INSERT INTO `t_category` VALUES ('1354028781170872321', '1353980005148315650', '0', '面条', '2021-01-26 19:29:53', '2021-01-26 19:29:53', '0');
INSERT INTO `t_category` VALUES ('1354029361238921217', '1353966409169317889', '0', '辣条', '2021-01-26 19:32:11', '2021-01-26 19:32:11', '0');
INSERT INTO `t_category` VALUES ('1354029545570193409', '1353966409169317889', '0', '酸菜汤', '2021-01-26 19:32:55', '2021-01-26 19:32:55', '0');
INSERT INTO `t_category` VALUES ('1354031037261828097', '', '0', '凉菜', '2021-01-26 19:38:51', '2021-01-26 19:38:51', '0');
INSERT INTO `t_category` VALUES ('1354031175824855042', '1354031037261828097', '0', '黄瓜', '2021-01-26 19:39:24', '2021-01-26 19:39:24', '0');
INSERT INTO `t_category` VALUES ('1354031228387872770', '0', '0', '甜汤', '2021-01-26 19:39:36', '2021-01-26 19:39:36', '0');
INSERT INTO `t_category` VALUES ('1354079042107113474', '1353980005148315650', '0', '馒头', '2021-01-26 22:49:36', '2021-01-26 22:49:36', '0');
INSERT INTO `t_category` VALUES ('1354079226841038849', '1353981525369606146', '3', '鸡腿', '2021-01-26 22:50:20', '2021-01-26 22:50:20', '0');

-- ----------------------------
-- Table structure for t_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate`;
CREATE TABLE `t_evaluate` (
  `id` char(19) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(100) NOT NULL COMMENT '用户头像',
  `food_name` varchar(50) DEFAULT NULL COMMENT '餐品ID',
  `level` int(3) NOT NULL DEFAULT '1' COMMENT '评价等级',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `content` text NOT NULL COMMENT '评论内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评价表';

-- ----------------------------
-- Records of t_evaluate
-- ----------------------------
INSERT INTO `t_evaluate` VALUES ('123456', 'test1', 'http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg', 'test', '5', '2021-01-29 17:45:33', '2021-01-29 17:45:35', '0', '真好吃', '0');
INSERT INTO `t_evaluate` VALUES ('123465', 'test2', 'http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg', 'test2', '2', '2021-01-29 17:46:21', '2021-01-29 17:46:25', '0', '不好吃', '0');
INSERT INTO `t_evaluate` VALUES ('1359432434979487745', '小黑123', 'http://localhost:8080/takeaway/profile/avatar/2021/02/08/9774a01f-6b69-4f28-86c0-e8ae4eb320b7.png', '包子', '4', '2021-02-10 17:22:04', '2021-02-10 17:22:04', '0', '不要在出错了', '0');
INSERT INTO `t_evaluate` VALUES ('1359432435117899778', '小黑123', 'http://localhost:8080/takeaway/profile/avatar/2021/02/08/9774a01f-6b69-4f28-86c0-e8ae4eb320b7.png', '辣子鸡', '4', '2021-02-10 17:22:04', '2021-02-10 17:22:04', '0', '不要在出错了', '0');
INSERT INTO `t_evaluate` VALUES ('1359434457913270274', '小黑123', 'http://localhost:8080/takeaway/profile/avatar/2021/02/08/9774a01f-6b69-4f28-86c0-e8ae4eb320b7.png', '包子', '3', '2021-02-10 17:30:06', '2021-02-10 17:30:06', '0', '包子一般般', '0');
INSERT INTO `t_evaluate` VALUES ('1359444267543040001', '小黑123', 'http://localhost:8080/takeaway/profile/avatar/2021/02/08/9774a01f-6b69-4f28-86c0-e8ae4eb320b7.png', '包子', '4', '2021-02-10 18:09:05', '2021-02-10 18:09:05', '0', '儿儿儿儿', '0');
INSERT INTO `t_evaluate` VALUES ('1359445343574986754', '小黑123', 'http://localhost:8080/takeaway/profile/avatar/2021/02/08/9774a01f-6b69-4f28-86c0-e8ae4eb320b7.png', '包子', '3', '2021-02-10 18:13:22', '2021-02-10 18:13:22', '0', '实惠', '0');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` char(19) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `name` varchar(100) NOT NULL COMMENT '文件名',
  `url` varchar(255) DEFAULT NULL COMMENT '图片所在地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_file
-- ----------------------------
INSERT INTO `t_file` VALUES ('1354359432109670402', '2021-01-27 17:23:46', '2021-01-27 17:23:46', '3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg');
INSERT INTO `t_file` VALUES ('1354359779448373250', '2021-01-27 17:25:09', '2021-01-27 17:25:09', '129486e1-4a09-4257-8869-30a84ac68e14.jpg', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg');
INSERT INTO `t_file` VALUES ('1354414139062697985', '2021-01-27 21:01:09', '2021-01-27 21:01:09', '43e219df-fd60-4360-9c63-c26a8edab75d.jpg', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg');

-- ----------------------------
-- Table structure for t_food
-- ----------------------------
DROP TABLE IF EXISTS `t_food`;
CREATE TABLE `t_food` (
  `id` char(19) NOT NULL COMMENT '餐品id',
  `name` varchar(100) NOT NULL COMMENT '餐品名称',
  `food_describe` text NOT NULL COMMENT '餐品描述',
  `sale` bigint(20) DEFAULT '0' COMMENT '销量',
  `category_id` char(19) NOT NULL COMMENT '所属分类',
  `cover` varchar(100) NOT NULL DEFAULT '' COMMENT '图片url',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `score` smallint(10) DEFAULT '0' COMMENT '评分',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `status` tinyint(1) DEFAULT '0' COMMENT '餐品状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='餐品表';

-- ----------------------------
-- Records of t_food
-- ----------------------------
INSERT INTO `t_food` VALUES ('1354350981111427073', '辣子鸡', '辣子鸡，辣自己，不辣不要钱', '101', '1353966409169317889', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '1.00', '4', '2021-01-27 16:50:11', '2021-02-13 16:09:51', '0', '0');
INSERT INTO `t_food` VALUES ('1354359432050950145', '包子', '好吃的肉包', '207', '1353980005148315650', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '0.50', '5', '2021-01-27 17:23:46', '2021-02-13 18:00:44', '0', '0');
INSERT INTO `t_food` VALUES ('1354414138974617601', '猪肉炖粉条', '猪肉顿粉条，管到饱，配蒜，配辣椒', '122', '1353981525369606146', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg', '10.00', '1', '2021-01-27 21:01:09', '2021-02-13 16:43:38', '0', '0');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` char(19) NOT NULL COMMENT '订单id',
  `user_id` char(19) DEFAULT NULL COMMENT '用户id',
  `order_status` tinyint(6) DEFAULT '0' COMMENT '订单状态',
  `nickname` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `foods_price` decimal(10,2) DEFAULT '0.00' COMMENT '餐品总价',
  `freight_price` decimal(10,2) DEFAULT '5.00' COMMENT '配送费',
  `order_price` decimal(10,2) DEFAULT '0.00' COMMENT '订单总费用',
  `pay_method` varchar(60) DEFAULT '0' COMMENT '支付方式',
  `pay_time` datetime DEFAULT NULL COMMENT '交易时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `pay_status` tinyint(6) DEFAULT '0' COMMENT '支付状态',
  `sell_id` char(19) NOT NULL COMMENT '商家ID',
  `order_no` varchar(19) DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1234567', null, '-1', 'test', '12345678901', 'test', 'test1234567890', '0.00', '5.00', '5.00', '0', '2021-01-30 20:06:18', '0', '2021-01-30 20:06:21', '2021-01-30 20:06:25', '1', '1', '12345678901');
INSERT INTO `t_order` VALUES ('1358963919747149826', '1357595593036890113', '0', '小黑123', '19929247098', '河南省洛阳市孟津县麻屯镇水泉村委会bb', '多放点辣', '1.50', '2.00', '3.50', '0', null, '0', '2021-02-09 10:20:21', '2021-02-09 10:20:21', '0', '1001', 'a2c8b19b6b4a2');
INSERT INTO `t_order` VALUES ('1359055894382923778', '1357595593036890113', '0', '小黑123', '19929247098', '河南省洛阳市孟津县麻屯镇水泉村委会bb', '多多', '0.50', '2.00', '2.50', '0', null, '0', '2021-02-09 16:25:50', '2021-02-09 16:25:50', '0', '1001', 'bf952736f5029');
INSERT INTO `t_order` VALUES ('1359056089837490177', '1357595593036890113', '0', '小黑123', '19929247098', '河南省洛阳市孟津县麻屯镇水泉村委会bb', '', '0.50', '2.00', '2.50', '0', null, '0', '2021-02-09 16:26:37', '2021-02-09 16:26:37', '0', '1001', '41b272afea418');
INSERT INTO `t_order` VALUES ('1359056520139526146', '1357595593036890113', '0', '小黑123', '19929247098', '河南省洛阳市孟津县麻屯镇水泉村委会bb', '测试', '10.50', '2.00', '12.50', '0', null, '0', '2021-02-09 16:28:19', '2021-02-09 16:28:19', '0', '1001', 'ebe60e9d3cfa9');
INSERT INTO `t_order` VALUES ('1359056855448965122', '1357595593036890113', '0', '小黑123', '19929247098', '河南省洛阳市孟津县麻屯镇水泉村委会bb', '测试', '0.50', '2.00', '2.50', '0', null, '0', '2021-02-09 16:29:39', '2021-02-09 16:29:39', '1', '1001', '0dd9ff9b872f2');
INSERT INTO `t_order` VALUES ('1359081545181786114', '1357595593036890113', '0', '小黑123', '19929247098', '河南省洛阳市孟津县麻屯镇水泉村委会bb', '测试', '1.00', '2.00', '3.00', '0', null, '0', '2021-02-09 18:07:46', '2021-02-09 18:07:46', '1', '1001', 'cd26a1fd27f58');
INSERT INTO `t_order` VALUES ('1359530019052371969', '1357595593036890113', '0', '小黑123', '19929247098', '河南省洛阳市孟津县麻屯镇水泉村委会bb', '送瓶水，给好评', '11.00', '2.00', '13.00', '0', '2021-02-10 23:50:15', '0', '2021-02-10 23:49:50', '2021-02-10 23:50:15', '1', '1001', '90b7adcb9f408');
INSERT INTO `t_order` VALUES ('1359880750997499906', '1359875487787700226', '0', '大涛669', null, '河南省洛阳市伊川县城关镇世纪坛路荆山森林公园16号', '多多滴，快快滴', '0.50', '2.00', '2.50', '0', '2021-02-11 23:03:57', '0', '2021-02-11 23:03:31', '2021-02-11 23:03:57', '1', '1001', '358b6f2f1a5e5');
INSERT INTO `t_order` VALUES ('1360501423218413569', '1360476640531492865', '0', '大涛', '13526774922', '河南省洛阳市新安县磁涧镇310国道附近', '多放点辣', '1.00', '2.00', '3.00', '0', '2021-02-13 16:10:08', '0', '2021-02-13 16:09:51', '2021-02-13 16:10:08', '1', '1001', 'cb5e605839323');
INSERT INTO `t_order` VALUES ('1360503927767351298', '1360502419801817090', '0', '心之所向便是光', '19939399087', '河南省洛阳市洛龙区庞村镇聚丰工业园左边', '多送一个呗', '1.50', '2.00', '3.50', '0', '2021-02-13 16:20:07', '0', '2021-02-13 16:19:48', '2021-02-13 16:20:07', '1', '1001', 'ca6b2e064a114');
INSERT INTO `t_order` VALUES ('1360509926699995137', '1360502419801817090', '0', '心之所向便是光', '19939399087', '河南省洛阳市洛龙区庞村镇聚丰工业园左边', '取消订单测试', '10.00', '2.00', '12.00', '0', null, '0', '2021-02-13 16:43:38', '2021-02-13 16:43:38', '0', '1001', '4aa0dad8f5277');
INSERT INTO `t_order` VALUES ('1360529329311260674', '1360502419801817090', '0', '心之所向便是光', '19939399087', '河南省洛阳市洛龙区庞村镇聚丰工业园左边', '带水，带土', '1.50', '2.00', '3.50', '0', '2021-02-13 18:01:46', '0', '2021-02-13 18:00:44', '2021-02-13 18:01:46', '1', '1001', 'c4c05a5ffa2a9');
INSERT INTO `t_order` VALUES ('2', null, '1', 'test2', '123', 'test', 'test', '0.00', '5.00', '5.00', '0', '2021-01-30 23:17:23', '0', '2021-01-30 23:17:31', '2021-01-30 23:17:28', '1', '1', '312434');

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `detail_id` char(19) NOT NULL COMMENT '订单详情表',
  `order_id` char(19) DEFAULT NULL COMMENT '订单id',
  `food_cover` varchar(255) DEFAULT NULL COMMENT '餐品图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `food_price` decimal(10,2) DEFAULT NULL COMMENT '餐品单价',
  `number` int(10) DEFAULT NULL COMMENT '餐品数量',
  `food_name` varchar(255) DEFAULT NULL COMMENT '餐品名称',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户名',
  `total` decimal(10,2) DEFAULT NULL COMMENT '餐品总价',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单详情表';

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES ('1', '1234567', 'https://images.pexels.com/photos/359558/pexels-photo-359558.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500', '2021-01-31 23:07:40', '2021-01-31 23:07:48', '0', '10.00', '1', 'test', 'test', '10.00');
INSERT INTO `t_order_detail` VALUES ('1358963919835230209', '1358963919747149826', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '2021-02-09 10:20:21', '2021-02-09 10:20:21', '0', '1.00', '1', '辣子鸡', '小黑123', '1.00');
INSERT INTO `t_order_detail` VALUES ('1358963919860396034', '1358963919747149826', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-09 10:20:21', '2021-02-09 10:20:21', '0', '0.50', '1', '包子', '小黑123', '0.50');
INSERT INTO `t_order_detail` VALUES ('1359053264176893954', '1359053264147533825', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '2021-02-09 16:15:23', '2021-02-09 16:15:23', '0', '1.00', '1', '辣子鸡', '小黑123', '1.00');
INSERT INTO `t_order_detail` VALUES ('1359053264202059778', '1359053264147533825', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-09 16:15:23', '2021-02-09 16:15:23', '0', '0.50', '1', '包子', '小黑123', '0.50');
INSERT INTO `t_order_detail` VALUES ('1359054608090550274', '1359054608010858498', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '2021-02-09 16:20:43', '2021-02-09 16:20:43', '0', '1.00', '1', '辣子鸡', '小黑123', '1.00');
INSERT INTO `t_order_detail` VALUES ('1359054608128299009', '1359054608010858498', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-09 16:20:43', '2021-02-09 16:20:43', '0', '0.50', '1', '包子', '小黑123', '0.50');
INSERT INTO `t_order_detail` VALUES ('1359055894399700993', '1359055894382923778', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-09 16:25:50', '2021-02-09 16:25:50', '0', '0.50', '1', '包子', '小黑123', '0.50');
INSERT INTO `t_order_detail` VALUES ('1359056089858461697', '1359056089837490177', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-09 16:26:37', '2021-02-09 16:26:37', '0', '0.50', '1', '包子', '小黑123', '0.50');
INSERT INTO `t_order_detail` VALUES ('1359056520194052098', '1359056520139526146', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-09 16:28:19', '2021-02-09 16:28:19', '0', '0.50', '1', '包子', '小黑123', '0.50');
INSERT INTO `t_order_detail` VALUES ('1359056520210829314', '1359056520139526146', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg', '2021-02-09 16:28:19', '2021-02-09 16:28:19', '0', '10.00', '1', '猪肉炖粉条', '小黑123', '10.00');
INSERT INTO `t_order_detail` VALUES ('1359056855469936641', '1359056855448965122', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-09 16:29:39', '2021-02-09 16:29:39', '0', '0.50', '1', '包子', '小黑123', '0.50');
INSERT INTO `t_order_detail` VALUES ('1359081545206951937', '1359081545181786114', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '2021-02-09 18:07:46', '2021-02-09 18:07:46', '0', '1.00', '1', '辣子鸡', '小黑123', '1.00');
INSERT INTO `t_order_detail` VALUES ('1359530019069149186', '1359530019052371969', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '2021-02-10 23:49:50', '2021-02-10 23:49:50', '0', '1.00', '1', '辣子鸡', '小黑123', '1.00');
INSERT INTO `t_order_detail` VALUES ('1359530019077537793', '1359530019052371969', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg', '2021-02-10 23:49:50', '2021-02-10 23:49:50', '0', '10.00', '1', '猪肉炖粉条', '小黑123', '10.00');
INSERT INTO `t_order_detail` VALUES ('1359880751031054338', '1359880750997499906', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-11 23:03:31', '2021-02-11 23:03:31', '0', '0.50', '1', '包子', '大涛669', '0.50');
INSERT INTO `t_order_detail` VALUES ('1360501423251968002', '1360501423218413569', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/129486e1-4a09-4257-8869-30a84ac68e14.jpg', '2021-02-13 16:09:51', '2021-02-13 16:09:51', '0', '1.00', '1', '辣子鸡', '大涛', '1.00');
INSERT INTO `t_order_detail` VALUES ('1360503927784128514', '1360503927767351298', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-13 16:19:48', '2021-02-13 16:19:48', '0', '0.50', '3', '包子', '心之所向便是光', '1.50');
INSERT INTO `t_order_detail` VALUES ('1360509926725160962', '1360509926699995137', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/43e219df-fd60-4360-9c63-c26a8edab75d.jpg', '2021-02-13 16:43:38', '2021-02-13 16:43:38', '0', '10.00', '1', '猪肉炖粉条', '心之所向便是光', '10.00');
INSERT INTO `t_order_detail` VALUES ('1360529329328037890', '1360529329311260674', 'http://localhost:8080/takeaway/profile/upload/2021/01/27/3bad4237-eac6-4761-ae56-9bb3a8e3f5ed.jpg', '2021-02-13 18:00:44', '2021-02-13 18:00:44', '0', '0.50', '3', '包子', '心之所向便是光', '1.50');
INSERT INTO `t_order_detail` VALUES ('2', '1234567', 'https://images.pexels.com/photos/359558/pexels-photo-359558.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500', '2021-01-31 23:07:46', '2021-01-31 23:07:51', '0', '10.00', '1', 'test', 'test', '10.00');
INSERT INTO `t_order_detail` VALUES ('3', '2', 'https://images.pexels.com/photos/359558/pexels-photo-359558.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500', '2021-01-31 23:07:42', '2021-01-31 23:07:54', '0', '10.00', '1', 'test', 'test', '10.00');

-- ----------------------------
-- Table structure for t_sell
-- ----------------------------
DROP TABLE IF EXISTS `t_sell`;
CREATE TABLE `t_sell` (
  `sell_id` char(19) NOT NULL COMMENT '商家ID',
  `sell_name` varchar(255) DEFAULT NULL COMMENT '商户名称',
  `sell_address` varchar(255) DEFAULT NULL COMMENT '门店地址',
  `work_time` varchar(100) DEFAULT NULL COMMENT '营业时间',
  `sell_avatar` varchar(255) DEFAULT NULL COMMENT '门户头像',
  `sell_score` smallint(2) DEFAULT NULL COMMENT '平均得分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `phone_number` char(11) DEFAULT NULL COMMENT '联系方式',
  `delivery_fee` decimal(19,0) DEFAULT '0' COMMENT '商家配送费',
  PRIMARY KEY (`sell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sell
-- ----------------------------
INSERT INTO `t_sell` VALUES ('1001', '1+1餐饮', '南阳市宛城区长江路18号小破街', '周一至周日7:00-23:00', 'https://blb.ismy.wang/imgs/shop_logos/huangmenji.jpg', '5', '2021-02-02 16:34:18', '2021-02-02 16:34:20', '0', '188888888', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` char(25) NOT NULL,
  `openid` varchar(128) DEFAULT NULL COMMENT 'openid',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `sex` bit(1) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `city` varchar(50) DEFAULT NULL COMMENT '所在城市',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '用户状态',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `password` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1350076581600100354', 'fhdsfdsfjks', 'test', '\0', 'http://localhost:8080/takeaway/profile/upload/2021/01/24/31062f4b-fcc6-4f89-b77f-d2035599fe3c.jpg', '北京', '0', '2021-01-25 11:28:43', '0', '2021-01-15 21:45:15', '2021-01-25 14:47:37', '$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2', '12345678902');
INSERT INTO `t_user` VALUES ('1353348948271144962', null, '小凉', '\0', 'http://localhost:8080/takeaway/profile/upload/2021/01/24/9a9dea89-7c3c-4406-8174-50e7ba78b532.jpg', '洛阳', '0', '2021-01-24 22:30:12', '0', '2021-01-24 22:28:28', '2021-01-25 11:58:25', '$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2', '18838849734');
INSERT INTO `t_user` VALUES ('1353552560251273218', null, '测试2', '', 'http://localhost:8080/takeaway/profile/upload/2021/01/25/71a8456f-7616-42c8-bc56-2752ae221939.png', '杭州', '0', '2021-01-25 11:56:54', '0', '2021-01-25 11:57:33', '2021-01-25 11:57:33', '$2a$10$/V2kL/FtkdGAvAyYofdCnOePS76yzUFedladIzd2/NeU98SmHr1M2', '13345678910');
INSERT INTO `t_user` VALUES ('1353602174731997185', null, '大白', '', 'http://localhost:8080/takeaway/profile/upload/2021/01/25/1c37b9f2-82fe-4d45-bb0f-3f4739e5f0df.jpg', '北京', '0', '2021-01-25 14:56:32', '0', '2021-01-25 15:14:42', '2021-01-25 15:15:02', '', '19939325698');
INSERT INTO `t_user` VALUES ('1357590750406656002', null, '1024程序节123', '\0', 'http://localhost:8080/takeaway/profile/avatar/2021/02/06/211a1720-1e4a-4b1d-9fb7-19e3ba1fdfa4.jpg', 'string', '0', '2021-02-06 15:23:05', '0', '2021-02-05 15:23:52', '2021-02-06 15:33:51', '$2a$10$NDA5/kr4fmMwHg6wUYOw..kWiecVYzd4jLqQhsPoGyM7zB1BSHrja', '18838800178');
INSERT INTO `t_user` VALUES ('1357594749054844929', null, '大胖', '\0', 'http://localhost:8080/takeaway/profile/avatar/2021/02/06/c3af41a5-d261-45db-8506-52d9cdac191c.png', '河南省洛阳市洛龙区丰李镇甘河桥户口村', '0', '2021-02-08 17:16:03', '0', '2021-02-05 15:39:46', '2021-02-06 18:09:02', '$2a$10$m8aCLEZGGRuq9gBn1CT7kOHQJlc1eg3RIH6ticgNNrGIRyOr8BxpK', '15627893290');
INSERT INTO `t_user` VALUES ('1357595593036890113', null, '小黑123', '', 'http://localhost:8080/takeaway/profile/avatar/2021/02/08/9774a01f-6b69-4f28-86c0-e8ae4eb320b7.png', '河南省洛阳市孟津县麻屯镇水泉村委会bb', '0', '2021-02-11 10:10:28', '0', '2021-02-05 15:43:07', '2021-02-08 12:17:21', '$2a$10$.i/LstBELCkKLN26v5MOL.fK0NR.rav3DPeV2kJD6NfTjoC92yvCK', '19929247098');
INSERT INTO `t_user` VALUES ('1357596127626100737', null, '小白条', '\0', 'http://localhost:8080/takeaway/profile/avatar/2021/02/07/e462adc4-1c81-47f2-ba17-e345e8012994.jpg', '河南省洛阳市洛龙区丰李镇福胜禅寺(暂停营业)555', '0', '2021-02-08 22:34:11', '0', '2021-02-05 15:45:14', '2021-02-08 00:36:15', '$2a$10$QaVCirsFMP7byigllNA4d.1jq5L/rq3Yqme/YbYeEsCQHi4IO48Ui', '13978654391');
INSERT INTO `t_user` VALUES ('1360502419801817090', 'o3_SC54G94-KOMewJLMDYNzYfFDM', '心之所向便是光', '\0', 'https://thirdwx.qlogo.cn/mmopen/vi_32/rJ9JYxIde7RIcRIROxZqCzGXAf1icPvuNUBwq7vBb54taPZlgsib8K2K2ylTVXwxWpa3aodgNV7OmFc04k41oZ4A/132', '河南省洛阳市洛龙区庞村镇聚丰工业园左边', '0', null, '0', '2021-02-13 16:13:48', '2021-02-13 16:15:07', '$2a$10$.6rWK2y19Fii.XeMzlFqxOecpAfoOncaXZCSFkR21h6di0JgRVwC6', '19939399087');
