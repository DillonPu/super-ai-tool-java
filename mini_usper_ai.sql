/*
 Navicat Premium Data Transfer

 Source Server         : mini_usper_ai
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Schema         : mini_usper_ai

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 31/05/2023 19:49:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-22 10:23:51', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-22 10:23:51', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-22 10:23:51', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-03-22 10:23:51', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-03-22 10:23:51', 'admin', '2023-03-25 03:41:14', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-22 10:23:51', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'lbpqdl', 0, '阿来', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-22 10:23:49', 'admin', '2023-03-25 03:44:48');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-22 10:23:49', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '微信小程序', 1, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-25 03:45:11', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '申通快递', 'STO', 'express_code', NULL, 'default', 'N', '0', 'admin', '2023-03-28 02:34:31', 'admin', '2023-03-28 02:37:05', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '圆通速递', 'YTO', 'express_code', NULL, 'default', 'N', '0', 'admin', '2023-03-28 02:36:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '百世快递', 'HTKY', 'express_code', NULL, 'default', 'N', '0', 'admin', '2023-03-28 02:36:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '签到', '1', 'point_from', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:08:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '看广告视频', '2', 'point_from', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:08:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '充值兑换', '3', 'point_from', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:09:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, 'AI聊天【消耗】', '1', 'point_to', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:10:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, 'AI绘画【消耗】', '2', 'point_to', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:10:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '快递查询【消耗】', '3', 'point_to', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:10:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '水果蔬菜识别【消耗】', '4', 'point_to', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:10:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '植物识别【消耗】', '5', 'point_to', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:11:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '微信充值', '1', 'money_from', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:13:16', 'admin', '2023-03-31 03:18:55', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '支付宝充值', '2', 'money_from', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:13:23', 'admin', '2023-03-31 03:19:08', NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, 'AI聊天', '1', 'chat_msg_origin', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:15:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, 'AI作画', '2', 'chat_msg_origin', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:15:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '兑换积分', '1', 'money_to', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:20:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 0, '文字', '1', 'chat_msg_type', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:27:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 0, '图片', '2', 'chat_msg_type', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:27:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '无', '0', 'point_from', NULL, 'default', 'N', '0', 'admin', '2023-03-31 03:59:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 0, '无', '0', 'point_to', NULL, 'default', 'N', '0', 'admin', '2023-03-31 04:00:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 0, 'AI聊天', '1', 'feedback_question_type', NULL, 'default', 'N', '0', 'admin', '2023-04-03 02:36:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 0, 'AI绘画', '2', 'feedback_question_type', NULL, 'default', 'N', '0', 'admin', '2023-04-03 02:36:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 0, '快递查询', '3', 'feedback_question_type', NULL, 'default', 'N', '0', 'admin', '2023-04-03 02:36:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 0, '果蔬识别', '4', 'feedback_question_type', NULL, 'default', 'N', '0', 'admin', '2023-04-03 02:37:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 0, '充值', '5', 'feedback_question_type', NULL, 'default', 'N', '0', 'admin', '2023-04-03 02:37:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 0, '积分', '6', 'feedback_question_type', NULL, 'default', 'N', '0', 'admin', '2023-04-03 02:37:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 0, '宝贵建议', '0', 'feedback_question_type', NULL, 'default', 'N', '0', 'admin', '2023-04-03 02:38:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-22 10:23:51', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '快递公司编码', 'express_code', '0', 'admin', '2023-03-28 02:33:30', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '积分来源', 'point_from', '0', 'admin', '2023-03-31 03:07:08', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '积分去向', 'point_to', '0', 'admin', '2023-03-31 03:10:09', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '余额来源', 'money_from', '0', 'admin', '2023-03-31 03:13:01', 'admin', '2023-03-31 03:18:38', NULL);
INSERT INTO `sys_dict_type` VALUES (104, '聊天消息来源', 'chat_msg_origin', '0', 'admin', '2023-03-31 03:15:03', 'admin', '2023-03-31 03:26:30', NULL);
INSERT INTO `sys_dict_type` VALUES (105, '余额去向', 'money_to', '0', 'admin', '2023-03-31 03:19:53', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '聊天消息类型', 'chat_msg_type', '0', 'admin', '2023-03-31 03:26:45', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '反馈问题类型', 'feedback_question_type', '0', 'admin', '2023-04-03 02:35:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2037 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-03-22 10:23:49', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-03-22 10:23:49', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-03-22 10:23:49', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, '', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-03-22 10:23:49', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-03-22 10:23:49', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-03-22 10:23:49', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-03-22 10:23:49', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-03-22 10:23:49', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-03-22 10:23:49', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-03-22 10:23:49', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-03-22 10:23:49', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-03-22 10:23:49', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-03-22 10:23:49', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-03-22 10:23:49', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-03-22 10:23:49', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-03-22 10:23:49', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-03-22 10:23:49', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-03-22 10:23:49', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-03-22 10:23:49', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-03-22 10:23:49', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-03-22 10:23:49', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-03-22 10:23:49', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-03-22 10:23:49', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-03-22 10:23:49', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-03-22 10:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '微信用户', 0, 2, 'weixin', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2023-03-23 10:05:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '充值消费记录', 2000, 1, 'wxUserMoneyLog', 'weixin/wxUserMoneyLog/index', NULL, 1, 0, 'C', '0', '0', 'weixin:wxUserMoneyLog:list', '#', 'admin', '2023-03-23 10:20:19', 'admin', '2023-03-31 09:10:20', '微信用户充值消费记录菜单');
INSERT INTO `sys_menu` VALUES (2008, '微信用户充值消费记录查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserMoneyLog:query', '#', 'admin', '2023-03-23 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '微信用户充值消费记录新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserMoneyLog:add', '#', 'admin', '2023-03-23 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '微信用户充值消费记录修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserMoneyLog:edit', '#', 'admin', '2023-03-23 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '微信用户充值消费记录删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserMoneyLog:remove', '#', 'admin', '2023-03-23 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '微信用户充值消费记录导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserMoneyLog:export', '#', 'admin', '2023-03-23 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '积分记录', 2000, 1, 'wxUserPointLog', 'weixin/wxUserPointLog/index', NULL, 1, 0, 'C', '0', '0', 'weixin:wxUserPointLog:list', '#', 'admin', '2023-03-23 10:20:26', 'admin', '2023-03-31 09:10:33', '微信用户充值记录菜单');
INSERT INTO `sys_menu` VALUES (2014, '微信用户充值记录查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserPointLog:query', '#', 'admin', '2023-03-23 10:20:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '微信用户充值记录新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserPointLog:add', '#', 'admin', '2023-03-23 10:20:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '微信用户充值记录修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserPointLog:edit', '#', 'admin', '2023-03-23 10:20:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '微信用户充值记录删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserPointLog:remove', '#', 'admin', '2023-03-23 10:20:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '微信用户充值记录导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxUserPointLog:export', '#', 'admin', '2023-03-23 10:20:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, 'AI对话记录', 2000, 1, 'wxAiMsgLog', 'weixin/wxAiMsgLog/index', NULL, 1, 0, 'C', '0', '0', 'weixin:wxAiMsgLog:list', '#', 'admin', '2023-03-31 03:53:39', 'admin', '2023-03-31 09:10:45', 'ai对话记录菜单');
INSERT INTO `sys_menu` VALUES (2020, 'ai对话记录查询', 2019, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAiMsgLog:query', '#', 'admin', '2023-03-31 03:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, 'ai对话记录新增', 2019, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAiMsgLog:add', '#', 'admin', '2023-03-31 03:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, 'ai对话记录修改', 2019, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAiMsgLog:edit', '#', 'admin', '2023-03-31 03:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, 'ai对话记录删除', 2019, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAiMsgLog:remove', '#', 'admin', '2023-03-31 03:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, 'ai对话记录导出', 2019, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAiMsgLog:export', '#', 'admin', '2023-03-31 03:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '问题反馈', 2000, 1, 'wxFeedbackLog', 'weixin/wxFeedbackLog/index', NULL, 1, 0, 'C', '0', '0', 'weixin:wxFeedbackLog:list', '#', 'admin', '2023-04-03 02:43:37', '', NULL, '问题反馈菜单');
INSERT INTO `sys_menu` VALUES (2026, '问题反馈查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxFeedbackLog:query', '#', 'admin', '2023-04-03 02:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '问题反馈新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxFeedbackLog:add', '#', 'admin', '2023-04-03 02:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '问题反馈修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxFeedbackLog:edit', '#', 'admin', '2023-04-03 02:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '问题反馈删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxFeedbackLog:remove', '#', 'admin', '2023-04-03 02:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '问题反馈导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxFeedbackLog:export', '#', 'admin', '2023-04-03 02:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '答非所问单词', 2000, 1, 'wxAbnormalWord', 'weixin/wxAbnormalWord/index', NULL, 1, 0, 'C', '0', '0', 'weixin:wxAbnormalWord:list', '#', 'admin', '2023-04-17 18:22:22', '', NULL, '答非所问单词菜单');
INSERT INTO `sys_menu` VALUES (2032, '答非所问单词查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAbnormalWord:query', '#', 'admin', '2023-04-17 18:22:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '答非所问单词新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAbnormalWord:add', '#', 'admin', '2023-04-17 18:22:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '答非所问单词修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAbnormalWord:edit', '#', 'admin', '2023-04-17 18:22:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '答非所问单词删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAbnormalWord:remove', '#', 'admin', '2023-04-17 18:22:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '答非所问单词导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'weixin:wxAbnormalWord:export', '#', 'admin', '2023-04-17 18:22:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.superai.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_point_log,wx_user_money_log,wx_user_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-23 10:00:16', 790);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_info,wx_user_money_log,wx_user_point_log\"}', NULL, 0, NULL, '2023-03-23 10:00:51', 241);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.superai.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-23 10:01:28', 21);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.superai.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"微信用户\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"weixin\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-23 10:05:59', 35);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserInfo\",\"className\":\"WxUserInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Unionid\",\"columnComment\":\"微信unionid\",\"columnId\":2,\"columnName\":\"unionid\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"unionid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Openid\",\"columnComment\":\"微信openid\",\"columnId\":3,\"columnName\":\"openid\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"openid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"昵称\",\"columnId\":4,\"columnName\":\"nickname\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-23 10:11:18', 316);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserMoneyLog\",\"className\":\"WxUserMoneyLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"租户号\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":15,\"columnName\":\"user_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MoneyFrom\",\"columnComment\":\"金额来源1微信充值，2转账，3初始\",\"columnId\":16,\"columnName\":\"money_from\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"moneyFrom\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MoneyTo\",\"columnComment\":\"金额去向1、兑换积分，2、使用产品\",\"columnId\":17,\"columnName\":\"money_to\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"moneyTo\",\"javaType\":\"String\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-23 10:11:53', 219);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserPointLog\",\"className\":\"WxUserPointLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"租户号\",\"columnId\":24,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":25,\"columnName\":\"user_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PointFrom\",\"columnComment\":\"积分来源，1签到，2看视频，3充值兑换\",\"columnId\":26,\"columnName\":\"point_from\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pointFrom\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PointTo\",\"columnComment\":\"积分去向\",\"columnId\":27,\"columnName\":\"point_to\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pointTo\",\"javaType\":\"String\",\"list\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-23 10:12:16', 218);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_info,wx_user_money_log,wx_user_point_log\"}', NULL, 0, NULL, '2023-03-23 10:12:19', 235);
INSERT INTO `sys_oper_log` VALUES (108, '微信用户信息', 1, 'com.superai.web.controller.weixin.WxUserInfoController.add()', 'POST', 1, 'admin', NULL, '/weixin/wxUserInfo', '127.0.0.1', '内网IP', '{\"avatarUrl\":\"1\",\"createTime\":\"2023-03-23 18:33:02\",\"level\":1,\"nickname\":\"1\",\"openid\":\"1\",\"params\":{},\"totalMoney\":1,\"totalPoint\":1,\"unionid\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projects-study\\openai\\super-ai-java\\superai-weixin\\target\\classes\\mapper\\weixin\\WxUserInfoMapper.xml]\r\n### The error may involve com.superai.weixin.mapper.WxUserInfoMapper.insertWxUserInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into wx_user_info          ( unionid,             openid,             nickname,             avatarUrl,             total_money,             total_point,             level,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-03-23 10:33:02', 113);
INSERT INTO `sys_oper_log` VALUES (109, '参数管理', 2, 'com.superai.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-03-22 10:23:51\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:41:14', 51);
INSERT INTO `sys_oper_log` VALUES (110, '角色管理', 1, 'com.superai.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018],\"params\":{},\"roleId\":100,\"roleKey\":\"wxMiniProgramUser\",\"roleName\":\"微信小程序用户\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:43:04', 121);
INSERT INTO `sys_oper_log` VALUES (111, '角色管理', 2, 'com.superai.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-25 03:43:03\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"wxMiniProgramUser\",\"roleName\":\"微信小程序用户\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:43:29', 73);
INSERT INTO `sys_oper_log` VALUES (112, '角色管理', 3, 'com.superai.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{}', NULL, 1, '普通角色已分配,不能删除', '2023-03-25 03:43:36', 54);
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 3, 'com.superai.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:43:46', 91);
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 3, 'com.superai.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:43:51', 111);
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 3, 'com.superai.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:44:00', 51);
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 3, 'com.superai.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:44:03', 50);
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 3, 'com.superai.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:44:05', 47);
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 3, 'com.superai.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:44:07', 46);
INSERT INTO `sys_oper_log` VALUES (119, '部门管理', 3, 'com.superai.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:44:09', 49);
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 3, 'com.superai.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:44:11', 46);
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 3, 'com.superai.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:44:13', 46);
INSERT INTO `sys_oper_log` VALUES (122, '部门管理', 3, 'com.superai.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-03-25 03:44:19', 24);
INSERT INTO `sys_oper_log` VALUES (123, '部门管理', 2, 'com.superai.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"lbpqdl\",\"email\":\"ry@qq.com\",\"leader\":\"阿来\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:44:48', 57);
INSERT INTO `sys_oper_log` VALUES (124, '部门管理', 1, 'com.superai.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"微信小程序\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 03:45:11', 44);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.superai.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-03-25 06:26:55', 16);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.superai.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 06:26:58', 68);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.superai.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 06:27:00', 48);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.superai.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 06:27:03', 52);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.superai.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 06:27:05', 47);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 3, 'com.superai.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 06:27:07', 48);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 3, 'com.superai.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 06:27:10', 46);
INSERT INTO `sys_oper_log` VALUES (132, '用户管理', 1, 'com.superai.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"nickName\":\"AL\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":100,\"userName\":\"pudonglai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-25 06:37:31', 172);
INSERT INTO `sys_oper_log` VALUES (133, '字典类型', 1, 'com.superai.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"快递公司编码\",\"dictType\":\"express_code\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 02:33:30', 53);
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"申通\",\"dictSort\":0,\"dictType\":\"express_code\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 02:34:31', 37);
INSERT INTO `sys_oper_log` VALUES (135, '字典数据', 2, 'com.superai.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 02:34:31\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"申通\",\"dictSort\":0,\"dictType\":\"express_code\",\"dictValue\":\"ZTO\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 02:35:57', 35);
INSERT INTO `sys_oper_log` VALUES (136, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"圆通速递\",\"dictSort\":0,\"dictType\":\"express_code\",\"dictValue\":\"YTO\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 02:36:20', 34);
INSERT INTO `sys_oper_log` VALUES (137, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"百世快递\",\"dictSort\":0,\"dictType\":\"express_code\",\"dictValue\":\"HTKY\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 02:36:39', 33);
INSERT INTO `sys_oper_log` VALUES (138, '字典数据', 2, 'com.superai.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 02:34:31\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"申通快递\",\"dictSort\":0,\"dictType\":\"express_code\",\"dictValue\":\"STO\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 02:37:06', 34);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 6, 'com.superai.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_ai_msg_log\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 02:56:50', 440);
INSERT INTO `sys_oper_log` VALUES (140, '字典类型', 1, 'com.superai.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"积分来源\",\"dictType\":\"point_from\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:07:08', 47);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"签到\",\"dictSort\":0,\"dictType\":\"point_from\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:08:31', 47);
INSERT INTO `sys_oper_log` VALUES (142, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"看广告视频\",\"dictSort\":0,\"dictType\":\"point_from\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:08:54', 47);
INSERT INTO `sys_oper_log` VALUES (143, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"充值兑换\",\"dictSort\":0,\"dictType\":\"point_from\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:09:10', 35);
INSERT INTO `sys_oper_log` VALUES (144, '字典类型', 1, 'com.superai.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"积分去向\",\"dictType\":\"point_to\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:10:09', 33);
INSERT INTO `sys_oper_log` VALUES (145, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"AI聊天【消耗】\",\"dictSort\":0,\"dictType\":\"point_to\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:10:32', 35);
INSERT INTO `sys_oper_log` VALUES (146, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"AI绘画【消耗】\",\"dictSort\":0,\"dictType\":\"point_to\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:10:39', 34);
INSERT INTO `sys_oper_log` VALUES (147, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"快递查询【消耗】\",\"dictSort\":0,\"dictType\":\"point_to\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:10:46', 35);
INSERT INTO `sys_oper_log` VALUES (148, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"水果蔬菜识别【消耗】\",\"dictSort\":0,\"dictType\":\"point_to\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:10:57', 34);
INSERT INTO `sys_oper_log` VALUES (149, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"植物识别【消耗】\",\"dictSort\":0,\"dictType\":\"point_to\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:11:05', 37);
INSERT INTO `sys_oper_log` VALUES (150, '字典类型', 1, 'com.superai.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"余额\",\"dictType\":\"money\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:13:01', 42);
INSERT INTO `sys_oper_log` VALUES (151, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"充值\",\"dictSort\":0,\"dictType\":\"money\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:13:16', 34);
INSERT INTO `sys_oper_log` VALUES (152, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"兑换\",\"dictSort\":0,\"dictType\":\"money\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:13:23', 34);
INSERT INTO `sys_oper_log` VALUES (153, '字典类型', 1, 'com.superai.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"聊天消息来源\",\"dictType\":\"chat_origin\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:15:03', 49);
INSERT INTO `sys_oper_log` VALUES (154, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"AI聊天\",\"dictSort\":0,\"dictType\":\"chat_origin\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:15:16', 41);
INSERT INTO `sys_oper_log` VALUES (155, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"AI作画\",\"dictSort\":0,\"dictType\":\"chat_origin\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:15:29', 51);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 3, 'com.superai.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:16:06', 134);
INSERT INTO `sys_oper_log` VALUES (157, '字典类型', 2, 'com.superai.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 03:13:01\",\"dictId\":103,\"dictName\":\"余额来源\",\"dictType\":\"money_from\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:18:38', 134);
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 2, 'com.superai.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 03:13:16\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"微信充值\",\"dictSort\":0,\"dictType\":\"money_from\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:18:55', 35);
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 2, 'com.superai.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 03:13:23\",\"default\":false,\"dictCode\":112,\"dictLabel\":\"支付宝充值\",\"dictSort\":0,\"dictType\":\"money_from\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:19:08', 35);
INSERT INTO `sys_oper_log` VALUES (160, '字典类型', 1, 'com.superai.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"余额去向\",\"dictType\":\"money_to\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:19:53', 33);
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"兑换积分\",\"dictSort\":0,\"dictType\":\"money_to\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:20:08', 34);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserMoneyLog\",\"className\":\"WxUserMoneyLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"租户号\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-23 10:11:52\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":15,\"columnName\":\"user_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-23 10:11:53\",\"usableColumn\":false},{\"capJavaField\":\"MoneyFrom\",\"columnComment\":\"金额来源\",\"columnId\":16,\"columnName\":\"money_from\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"money_from\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"moneyFrom\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-23 10:11:53\",\"usableColumn\":false},{\"capJavaField\":\"MoneyTo\",\"columnComment\":\"金额去向\",\"columnId\":17,\"columnName\":\"money_to\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"money_to\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:22:24', 275);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserMoneyLog\",\"className\":\"WxUserMoneyLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"租户号\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:22:24\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":15,\"columnName\":\"user_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:22:24\",\"usableColumn\":false},{\"capJavaField\":\"MoneyFrom\",\"columnComment\":\"金额来源\",\"columnId\":16,\"columnName\":\"money_from\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"money_from\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"moneyFrom\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:22:24\",\"usableColumn\":false},{\"capJavaField\":\"MoneyTo\",\"columnComment\":\"金额去向\",\"columnId\":17,\"columnName\":\"money_to\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"money_to\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:23:00', 291);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserPointLog\",\"className\":\"WxUserPointLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"租户号\",\"columnId\":24,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-23 10:12:15\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":25,\"columnName\":\"user_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-23 10:12:15\",\"usableColumn\":false},{\"capJavaField\":\"PointFrom\",\"columnComment\":\"积分来源\",\"columnId\":26,\"columnName\":\"point_from\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"point_from\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pointFrom\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-23 10:12:15\",\"usableColumn\":false},{\"capJavaField\":\"PointTo\",\"columnComment\":\"积分去向\",\"columnId\":27,\"columnName\":\"point_to\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"point_to\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:23:44', 238);
INSERT INTO `sys_oper_log` VALUES (165, '字典类型', 2, 'com.superai.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 03:15:03\",\"dictId\":104,\"dictName\":\"聊天消息来源\",\"dictType\":\"chat_msg_origin\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:26:30', 159);
INSERT INTO `sys_oper_log` VALUES (166, '字典类型', 1, 'com.superai.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"聊天消息类型\",\"dictType\":\"chat_msg_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:26:45', 38);
INSERT INTO `sys_oper_log` VALUES (167, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"文字\",\"dictSort\":0,\"dictType\":\"chat_msg_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:27:02', 42);
INSERT INTO `sys_oper_log` VALUES (168, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"图片\",\"dictSort\":0,\"dictType\":\"chat_msg_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:27:15', 57);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxAiMsgLog\",\"className\":\"WxAiMsgLog\",\"columns\":[{\"capJavaField\":\"MsgId\",\"columnComment\":\"消息id\",\"columnId\":34,\"columnName\":\"msg_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"msgId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":35,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Tojid\",\"columnComment\":\"接收方\",\"columnId\":36,\"columnName\":\"tojid\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"tojid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Jid\",\"columnComment\":\"发送方\",\"columnId\":37,\"columnName\":\"jid\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"jid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"q', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:27:43', 356);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxAiMsgLog\",\"className\":\"WxAiMsgLog\",\"columns\":[{\"capJavaField\":\"MsgId\",\"columnComment\":\"消息id\",\"columnId\":34,\"columnName\":\"msg_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"msgId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:27:43\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":35,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:27:43\",\"usableColumn\":false},{\"capJavaField\":\"Tojid\",\"columnComment\":\"接收方\",\"columnId\":36,\"columnName\":\"tojid\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"tojid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:27:43\",\"usableColumn\":false},{\"capJavaField\":\"Jid\",\"columnComment\":\"发送方\",\"columnId\":37,\"columnName\":\"jid\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:28:15', 344);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_money_log,wx_user_point_log,wx_ai_msg_log\"}', NULL, 0, NULL, '2023-03-31 03:28:26', 211);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_money_log,wx_user_point_log,wx_ai_msg_log\"}', NULL, 0, NULL, '2023-03-31 03:28:42', 97);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserMoneyLog\",\"className\":\"WxUserMoneyLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"租户号\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:22:59\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":15,\"columnName\":\"user_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:22:59\",\"usableColumn\":false},{\"capJavaField\":\"MoneyFrom\",\"columnComment\":\"金额来源\",\"columnId\":16,\"columnName\":\"money_from\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"money_from\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"moneyFrom\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:22:59\",\"usableColumn\":false},{\"capJavaField\":\"MoneyTo\",\"columnComment\":\"金额去向\",\"columnId\":17,\"columnName\":\"money_to\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"money_to\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:38:48', 227);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_money_log,wx_user_point_log,wx_ai_msg_log\"}', NULL, 0, NULL, '2023-03-31 03:38:51', 86);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserMoneyLog\",\"className\":\"WxUserMoneyLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"租户号\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:38:48\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":15,\"columnName\":\"user_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:38:48\",\"usableColumn\":false},{\"capJavaField\":\"MoneyFrom\",\"columnComment\":\"金额来源\",\"columnId\":16,\"columnName\":\"money_from\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"money_from\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"moneyFrom\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:38:48\",\"usableColumn\":false},{\"capJavaField\":\"MoneyTo\",\"columnComment\":\"金额去向\",\"columnId\":17,\"columnName\":\"money_to\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"money_to\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:44:10', 248);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxUserPointLog\",\"className\":\"WxUserPointLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"租户号\",\"columnId\":24,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:23:44\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":25,\"columnName\":\"user_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:23:44\",\"usableColumn\":false},{\"capJavaField\":\"PointFrom\",\"columnComment\":\"积分来源\",\"columnId\":26,\"columnName\":\"point_from\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"point_from\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pointFrom\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:23:44\",\"usableColumn\":false},{\"capJavaField\":\"PointTo\",\"columnComment\":\"积分去向\",\"columnId\":27,\"columnName\":\"point_to\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-23 10:00:15\",\"dictType\":\"point_to\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:44:19', 242);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxAiMsgLog\",\"className\":\"WxAiMsgLog\",\"columns\":[{\"capJavaField\":\"MsgId\",\"columnComment\":\"消息id\",\"columnId\":34,\"columnName\":\"msg_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"msgId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:28:14\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":35,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:28:14\",\"usableColumn\":false},{\"capJavaField\":\"Tojid\",\"columnComment\":\"接收方\",\"columnId\":36,\"columnName\":\"tojid\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"tojid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 03:28:14\",\"usableColumn\":false},{\"capJavaField\":\"Jid\",\"columnComment\":\"发送方\",\"columnId\":37,\"columnName\":\"jid\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 02:56:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:44:32', 270);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_money_log,wx_user_point_log,wx_ai_msg_log\"}', NULL, 0, NULL, '2023-03-31 03:44:55', 95);
INSERT INTO `sys_oper_log` VALUES (179, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"无\",\"dictSort\":0,\"dictType\":\"point_from\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 03:59:59', 56);
INSERT INTO `sys_oper_log` VALUES (180, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"无\",\"dictSort\":0,\"dictType\":\"point_to\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 04:00:19', 40);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.superai.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"weixin/wxUserMoneyLog/index\",\"createTime\":\"2023-03-23 10:20:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"充值消费记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"wxUserMoneyLog\",\"perms\":\"weixin:wxUserMoneyLog:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 09:10:20', 58);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.superai.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"weixin/wxUserPointLog/index\",\"createTime\":\"2023-03-23 10:20:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"积分记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"wxUserPointLog\",\"perms\":\"weixin:wxUserPointLog:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 09:10:33', 32);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.superai.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"weixin/wxAiMsgLog/index\",\"createTime\":\"2023-03-31 03:53:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"AI对话记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"wxAiMsgLog\",\"perms\":\"weixin:wxAiMsgLog:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 09:10:45', 33);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 6, 'com.superai.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_feedback_log\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:33:53', 286);
INSERT INTO `sys_oper_log` VALUES (185, '字典类型', 1, 'com.superai.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"反馈问题类型\",\"dictType\":\"feedback_question_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:35:48', 38);
INSERT INTO `sys_oper_log` VALUES (186, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"AI聊天\",\"dictSort\":0,\"dictType\":\"feedback_question_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:36:28', 31);
INSERT INTO `sys_oper_log` VALUES (187, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"AI绘画\",\"dictSort\":0,\"dictType\":\"feedback_question_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:36:37', 29);
INSERT INTO `sys_oper_log` VALUES (188, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"快递查询\",\"dictSort\":0,\"dictType\":\"feedback_question_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:36:56', 31);
INSERT INTO `sys_oper_log` VALUES (189, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"果蔬识别\",\"dictSort\":0,\"dictType\":\"feedback_question_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:37:19', 29);
INSERT INTO `sys_oper_log` VALUES (190, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"充值\",\"dictSort\":0,\"dictType\":\"feedback_question_type\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:37:32', 31);
INSERT INTO `sys_oper_log` VALUES (191, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"积分\",\"dictSort\":0,\"dictType\":\"feedback_question_type\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:37:44', 30);
INSERT INTO `sys_oper_log` VALUES (192, '字典数据', 1, 'com.superai.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"宝贵建议\",\"dictSort\":0,\"dictType\":\"feedback_question_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:38:22', 3354);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxFeedbackLog\",\"className\":\"WxFeedbackLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"消息id\",\"columnId\":47,\"columnName\":\"id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 02:33:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"反馈用户id\",\"columnId\":48,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 02:33:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionTitle\",\"columnComment\":\"问题标题\",\"columnId\":49,\"columnName\":\"question_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 02:33:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"questionTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionDesc\",\"columnComment\":\"问题描述\",\"columnId\":50,\"columnName\":\"question_desc\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 02:33:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"questionDesc\",\"javaType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 02:42:32', 204);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_feedback_log\"}', NULL, 0, NULL, '2023-04-03 02:42:43', 261);
INSERT INTO `sys_oper_log` VALUES (195, '个人信息', 2, 'com.superai.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/miniai/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-17 18:15:25', 397);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 3, 'com.superai.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/miniai/tool/gen/2,3,4,5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-17 18:17:30', 45);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 6, 'com.superai.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/miniai/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_abnormal_word\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-17 18:19:13', 90);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/miniai/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxAbnormalWord\",\"className\":\"WxAbnormalWord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":57,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-17 18:19:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"主语\",\"columnId\":58,\"columnName\":\"subject\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-17 18:19:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Predicate\",\"columnComment\":\"谓语\",\"columnId\":59,\"columnName\":\"predicate\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-17 18:19:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"predicate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Object\",\"columnComment\":\"宾语\",\"columnId\":60,\"columnName\":\"object\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-17 18:19:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"object\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-17 18:20:04', 90);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/miniai/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_abnormal_word\"}', NULL, 0, NULL, '2023-04-17 18:20:07', 316);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.superai.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/miniai/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxAbnormalWord\",\"className\":\"WxAbnormalWord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":57,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-17 18:19:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-17 18:20:04\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"主语\",\"columnId\":58,\"columnName\":\"subject\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-17 18:19:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-17 18:20:04\",\"usableColumn\":false},{\"capJavaField\":\"Predicate\",\"columnComment\":\"谓语\",\"columnId\":59,\"columnName\":\"predicate\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-17 18:19:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"predicate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-17 18:20:04\",\"usableColumn\":false},{\"capJavaField\":\"Object\",\"columnComment\":\"宾语\",\"columnId\":60,\"columnName\":\"object\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-17 18:19:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuer', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-17 18:20:43', 67);
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 8, 'com.superai.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/miniai/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_abnormal_word\"}', NULL, 0, NULL, '2023-04-17 18:20:52', 85);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-03-22 10:23:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-03-22 10:23:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-22 10:23:49', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2023-03-22 10:23:49', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '微信小程序用户', 'wxMiniProgramUser', 0, '5', 1, 1, '0', '0', 'admin', '2023-03-25 03:43:03', '', '2023-03-25 03:43:29', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `unionid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信unionid',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信openid',
  `total_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `total_point` int NULL DEFAULT 0 COMMENT '积分',
  `level` int NULL DEFAULT 0 COMMENT '等级',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', '', '15888888888', '1', '', '$2a$10$X.fLm1orKhggsWnamyk0temnUaWYLaSrl/XRPYYDeVIKy26BO3rxu', '0', '0', '127.0.0.1', '2023-05-08 17:37:22', 'admin', '2023-03-22 10:23:49', '', '2023-05-08 17:37:21', '管理员', NULL, NULL, 0.00, 100, 0);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for wx_abnormal_word
-- ----------------------------
DROP TABLE IF EXISTS `wx_abnormal_word`;
CREATE TABLE `wx_abnormal_word`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '主语',
  `predicate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '谓语',
  `object` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '宾语',
  `attribute` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '定语',
  `adverbial` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '状语',
  `complement` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '补语',
  `complete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '完整句子',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '答非所问单词表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wx_abnormal_word
-- ----------------------------
INSERT INTO `wx_abnormal_word` VALUES (1, '你', '好', '帅', NULL, NULL, '阅读是一种宝贵的习惯，它可以拓宽我们的视野、增加我们的知识和理解力。', '阅读是一种宝贵的习惯，它可以拓宽我们的视野、增加我们的知识和理解力。');
INSERT INTO `wx_abnormal_word` VALUES (2, '他', '打', '人', NULL, NULL, '在生活中，积极乐观的态度和坚韧不拔的精神是成功的关键因素。', '在生活中，积极乐观的态度和坚韧不拔的精神是成功的关键因素。');
INSERT INTO `wx_abnormal_word` VALUES (3, '她', '总是', '很大', NULL, NULL, '爱和尊重他人是构建健康关系的重要基石，它可以促进友谊、信任和合作。', '爱和尊重他人是构建健康关系的重要基石，它可以促进友谊、信任和合作。');
INSERT INTO `wx_abnormal_word` VALUES (4, '它', '把', '工作做好', NULL, NULL, '科技的发展为我们带来了无限的可能性和便利，但也需要我们保持警觉和谨慎。', '科技的发展为我们带来了无限的可能性和便利，但也需要我们保持警觉和谨慎。');
INSERT INTO `wx_abnormal_word` VALUES (5, '我们', NULL, NULL, NULL, NULL, '环保是我们的责任和义务，我们应该采取行动来保护我们的地球和未来的世代。', '环保是我们的责任和义务，我们应该采取行动来保护我们的地球和未来的世代。');
INSERT INTO `wx_abnormal_word` VALUES (6, NULL, NULL, NULL, NULL, NULL, '健康的生活方式包括良好的饮食习惯、适量的运动和充足的睡眠，它有助于我们保持身体和心理的健康。', '健康的生活方式包括良好的饮食习惯、适量的运动和充足的睡眠，它有助于我们保持身体和心理的健康。');
INSERT INTO `wx_abnormal_word` VALUES (7, NULL, NULL, NULL, NULL, NULL, '学习是一生的事业，我们应该持续地学习和成长，以适应不断变化的社会和工作环境。', '学习是一生的事业，我们应该持续地学习和成长，以适应不断变化的社会和工作环境。');
INSERT INTO `wx_abnormal_word` VALUES (8, NULL, NULL, NULL, NULL, NULL, '人际关系的管理和沟通技巧是成功的重要组成部分，它可以帮助我们更好地与他人交流和合作。', '人际关系的管理和沟通技巧是成功的重要组成部分，它可以帮助我们更好地与他人交流和合作。');
INSERT INTO `wx_abnormal_word` VALUES (9, NULL, NULL, NULL, NULL, NULL, '梦想和目标是我们前进的动力和方向，它们可以激励我们克服困难和迎接挑战。', '梦想和目标是我们前进的动力和方向，它们可以激励我们克服困难和迎接挑战。');
INSERT INTO `wx_abnormal_word` VALUES (10, NULL, NULL, NULL, NULL, NULL, '信仰和精神信念是人类追求意义和目的的核心，它可以带给我们安慰、力量和希望。', '信仰和精神信念是人类追求意义和目的的核心，它可以带给我们安慰、力量和希望。');
INSERT INTO `wx_abnormal_word` VALUES (11, NULL, NULL, NULL, NULL, NULL, '创造力和想象力是人类的独特天赋，它可以激发我们的创造力和创新能力。', '创造力和想象力是人类的独特天赋，它可以激发我们的创造力和创新能力。');
INSERT INTO `wx_abnormal_word` VALUES (12, NULL, NULL, NULL, NULL, NULL, '经验和教训是我们成长和发展的重要来源，它们可以帮助我们更好地应对未来的挑战。', '经验和教训是我们成长和发展的重要来源，它们可以帮助我们更好地应对未来的挑战。');
INSERT INTO `wx_abnormal_word` VALUES (13, NULL, NULL, NULL, NULL, NULL, '善良和同情心是人类最美好的品质之一，它可以激励我们为他人和社会作出贡献。', '善良和同情心是人类最美好的品质之一，它可以激励我们为他人和社会作出贡献。');
INSERT INTO `wx_abnormal_word` VALUES (14, NULL, NULL, NULL, NULL, NULL, '内在平衡和情绪管理是保持心理健康的关键，它可以帮助我们更好地应对生活中的压力和挑战。', '内在平衡和情绪管理是保持心理健康的关键，它可以帮助我们更好地应对生活中的压力和挑战。');
INSERT INTO `wx_abnormal_word` VALUES (15, NULL, NULL, NULL, NULL, NULL, '人类的多样性和包容性是我们共同的财富，它可以促进理解、尊重和和谐的社会关系。', '人类的多样性和包容性是我们共同的财富，它可以促进理解、尊重和和谐的社会关系。');
INSERT INTO `wx_abnormal_word` VALUES (16, NULL, NULL, NULL, NULL, NULL, '知识和技能是我们的财富和竞争力，它们可以帮助我们获得成功和实现自我价值。', '知识和技能是我们的财富和竞争力，它们可以帮助我们获得成功和实现自我价值。');
INSERT INTO `wx_abnormal_word` VALUES (17, NULL, NULL, NULL, NULL, NULL, '时间是珍贵的资源，我们应该学会管理时间，以充分利用它为我们的目标和梦想努力。', '时间是珍贵的资源，我们应该学会管理时间，以充分利用它为我们的目标和梦想努力。');
INSERT INTO `wx_abnormal_word` VALUES (18, NULL, NULL, NULL, NULL, NULL, '成功和失败是人类经历的常态，我们应该从中汲取经验和教训，不断学习和成长。', '成功和失败是人类经历的常态，我们应该从中汲取经验和教训，不断学习和成长。');
INSERT INTO `wx_abnormal_word` VALUES (19, NULL, NULL, NULL, NULL, NULL, '社会责任感和参与是我们的义务和责任，我们应该积极参与社会和公益事业，为社会作出贡献。', '社会责任感和参与是我们的义务和责任，我们应该积极参与社会和公益事业，为社会作出贡献。');
INSERT INTO `wx_abnormal_word` VALUES (20, NULL, NULL, NULL, NULL, NULL, '沉寂的山谷里，飘荡着薄雾，仿佛置身于一个梦境般的世界。', '沉寂的山谷里，飘荡着薄雾，仿佛置身于一个梦境般的世界。');
INSERT INTO `wx_abnormal_word` VALUES (21, NULL, NULL, NULL, NULL, NULL, '晨曦中，橙红色的太阳缓缓升起，照亮了整个城市。', '晨曦中，橙红色的太阳缓缓升起，照亮了整个城市。');
INSERT INTO `wx_abnormal_word` VALUES (22, NULL, NULL, NULL, NULL, NULL, '他的笑容温暖而真诚，让人不由自主地被感染。', '他的笑容温暖而真诚，让人不由自主地被感染。');
INSERT INTO `wx_abnormal_word` VALUES (23, NULL, NULL, NULL, NULL, NULL, '漫天的烟火绽放，点缀着黑暗的夜空，璀璨夺目。', '漫天的烟火绽放，点缀着黑暗的夜空，璀璨夺目。');
INSERT INTO `wx_abnormal_word` VALUES (24, NULL, NULL, NULL, NULL, NULL, '金黄色的麦田在微风中轻轻摇曳，像是一片无边的金色海洋。', '金黄色的麦田在微风中轻轻摇曳，像是一片无边的金色海洋。');
INSERT INTO `wx_abnormal_word` VALUES (25, NULL, NULL, NULL, NULL, NULL, '空气中弥漫着清新的花香，令人心旷神怡。', '空气中弥漫着清新的花香，令人心旷神怡。');
INSERT INTO `wx_abnormal_word` VALUES (26, NULL, NULL, NULL, NULL, NULL, '深邃的湖水清澈见底，倒映出周围的山峦和树木。', '深邃的湖水清澈见底，倒映出周围的山峦和树木。');
INSERT INTO `wx_abnormal_word` VALUES (27, NULL, NULL, NULL, NULL, NULL, '灰蒙蒙的天空中，密密麻麻的雨滴不停地落下，打湿了大地。', '灰蒙蒙的天空中，密密麻麻的雨滴不停地落下，打湿了大地。');
INSERT INTO `wx_abnormal_word` VALUES (28, NULL, NULL, NULL, NULL, NULL, '静谧的教堂内，古老的器乐声缓缓响起，给人带来一种神圣的感觉。', '静谧的教堂内，古老的器乐声缓缓响起，给人带来一种神圣的感觉。');
INSERT INTO `wx_abnormal_word` VALUES (29, NULL, NULL, NULL, NULL, NULL, '巨大的瀑布悬挂在悬崖上，水花四溅，轰鸣声震耳欲聋。', '巨大的瀑布悬挂在悬崖上，水花四溅，轰鸣声震耳欲聋。');
INSERT INTO `wx_abnormal_word` VALUES (30, NULL, NULL, NULL, NULL, NULL, '青山绿水环绕着这个小村庄，宛如一幅美丽的画卷。', '青山绿水环绕着这个小村庄，宛如一幅美丽的画卷。');
INSERT INTO `wx_abnormal_word` VALUES (31, NULL, NULL, NULL, NULL, NULL, '黄昏时分，夕阳的余晖洒在湖面上，像是一片金色的海洋。', '黄昏时分，夕阳的余晖洒在湖面上，像是一片金色的海洋。');
INSERT INTO `wx_abnormal_word` VALUES (32, NULL, NULL, NULL, NULL, NULL, '星空璀璨，数不尽的星星在黑暗的夜空中闪烁着，宛如一张美丽的星图。', '星空璀璨，数不尽的星星在黑暗的夜空中闪烁着，宛如一张美丽的星图。');
INSERT INTO `wx_abnormal_word` VALUES (33, NULL, NULL, NULL, NULL, NULL, '高耸入云的山峰，巍峨壮观，让人感到无比渺小。', '高耸入云的山峰，巍峨壮观，让人感到无比渺小。');
INSERT INTO `wx_abnormal_word` VALUES (34, NULL, NULL, NULL, NULL, NULL, '茂密的森林中，鸟儿的啼鸣和昆虫的嗡嗡声交织成一曲美妙的交响乐。', '茂密的森林中，鸟儿的啼鸣和昆虫的嗡嗡声交织成一曲美妙的交响乐。');
INSERT INTO `wx_abnormal_word` VALUES (35, NULL, NULL, NULL, NULL, NULL, '漫步在宽阔的海滩上，阳光、沙滩和海水交织在一起，形成了一幅美丽的画卷。', '漫步在宽阔的海滩上，阳光、沙滩和海水交织在一起，形成了一幅美丽的画卷。');
INSERT INTO `wx_abnormal_word` VALUES (36, NULL, NULL, NULL, NULL, NULL, '红色的枫叶在秋天里变得格外鲜艳，仿佛整个世界都被点染成了红色。', '红色的枫叶在秋天里变得格外鲜艳，仿佛整个世界都被点染成了红色。');
INSERT INTO `wx_abnormal_word` VALUES (37, NULL, NULL, NULL, NULL, NULL, '巨大的冰川在阳光下闪耀着蓝色的光芒，它的壮丽和美丽难以言表。', '巨大的冰川在阳光下闪耀着蓝色的光芒，它的壮丽和美丽难以言表。');
INSERT INTO `wx_abnormal_word` VALUES (38, NULL, NULL, NULL, NULL, NULL, '远处的风车随着风的轻抚，缓缓地旋转着，它们的旋转声像是一首美妙的歌曲。', '远处的风车随着风的轻抚，缓缓地旋转着，它们的旋转声像是一首美妙的歌曲。');
INSERT INTO `wx_abnormal_word` VALUES (39, NULL, NULL, NULL, NULL, NULL, '草原的边缘有一片沙漠，沙漠中的沙子犹如黄金般闪闪发光。', '草原的边缘有一片沙漠，沙漠中的沙子犹如黄金般闪闪发光。');
INSERT INTO `wx_abnormal_word` VALUES (40, NULL, NULL, NULL, NULL, NULL, '雪花缓缓飘落，白茫茫的大地上洒满了洁白的绒毛。', '雪花缓缓飘落，白茫茫的大地上洒满了洁白的绒毛。');
INSERT INTO `wx_abnormal_word` VALUES (41, NULL, NULL, NULL, NULL, NULL, '天空中，云朵像是一群慵懒的羊群，悠闲地漫步着。', '天空中，云朵像是一群慵懒的羊群，悠闲地漫步着。');
INSERT INTO `wx_abnormal_word` VALUES (42, NULL, NULL, NULL, NULL, NULL, '在静谧的湖面上，水鸟翩翩起舞，给这个美丽的景色增添了灵动的气息。', '在静谧的湖面上，水鸟翩翩起舞，给这个美丽的景色增添了灵动的气息。');
INSERT INTO `wx_abnormal_word` VALUES (43, NULL, NULL, NULL, NULL, NULL, '红色的玫瑰在阳光下绽放，芬芳四溢，令人心旷神怡。', '红色的玫瑰在阳光下绽放，芬芳四溢，令人心旷神怡。');
INSERT INTO `wx_abnormal_word` VALUES (44, NULL, NULL, NULL, NULL, NULL, '夏日的清晨，绿茵茵的草地上，露珠闪耀，煞是好看。', '夏日的清晨，绿茵茵的草地上，露珠闪耀，煞是好看。');
INSERT INTO `wx_abnormal_word` VALUES (45, NULL, NULL, NULL, NULL, NULL, '巨大的洞穴里，形态各异的钟乳石和石柱好似魔幻世界的装饰品。', '巨大的洞穴里，形态各异的钟乳石和石柱好似魔幻世界的装饰品。');
INSERT INTO `wx_abnormal_word` VALUES (46, NULL, NULL, NULL, NULL, NULL, '古老的城墙上，时间的印记清晰可见，让人感受到岁月的长河。', '古老的城墙上，时间的印记清晰可见，让人感受到岁月的长河。');
INSERT INTO `wx_abnormal_word` VALUES (47, NULL, NULL, NULL, NULL, NULL, NULL, '你喜欢吃冰淇淋吗？');
INSERT INTO `wx_abnormal_word` VALUES (48, NULL, NULL, NULL, NULL, NULL, NULL, '你今天几点起床？');
INSERT INTO `wx_abnormal_word` VALUES (49, NULL, NULL, NULL, NULL, NULL, NULL, '你在哪里工作？');
INSERT INTO `wx_abnormal_word` VALUES (50, NULL, NULL, NULL, NULL, NULL, NULL, '你觉得这个颜色怎么样？');
INSERT INTO `wx_abnormal_word` VALUES (51, NULL, NULL, NULL, NULL, NULL, NULL, '你会游泳吗？');
INSERT INTO `wx_abnormal_word` VALUES (52, NULL, NULL, NULL, NULL, NULL, NULL, '你喜欢吃饭吗？');
INSERT INTO `wx_abnormal_word` VALUES (53, NULL, NULL, NULL, NULL, NULL, NULL, '你觉得今天天气怎么样？');
INSERT INTO `wx_abnormal_word` VALUES (54, NULL, NULL, NULL, NULL, NULL, NULL, '你喜欢喝咖啡还是茶？');
INSERT INTO `wx_abnormal_word` VALUES (55, NULL, NULL, NULL, NULL, NULL, NULL, '你会弹吉他吗？');
INSERT INTO `wx_abnormal_word` VALUES (56, NULL, NULL, NULL, NULL, NULL, NULL, '你觉得这本书好看吗？');
INSERT INTO `wx_abnormal_word` VALUES (57, NULL, NULL, NULL, NULL, NULL, NULL, '你今天开心吗？');
INSERT INTO `wx_abnormal_word` VALUES (58, NULL, NULL, NULL, NULL, NULL, NULL, '你觉得这个电影怎么样？');
INSERT INTO `wx_abnormal_word` VALUES (59, NULL, NULL, NULL, NULL, NULL, NULL, '你喜欢这个城市吗？');
INSERT INTO `wx_abnormal_word` VALUES (60, NULL, NULL, NULL, NULL, NULL, NULL, '你今天累吗？');
INSERT INTO `wx_abnormal_word` VALUES (61, NULL, NULL, NULL, NULL, NULL, NULL, '你觉得这首歌怎么样？');
INSERT INTO `wx_abnormal_word` VALUES (62, NULL, NULL, NULL, NULL, NULL, NULL, '我家的猫咪昨天生了一窝小猫。');
INSERT INTO `wx_abnormal_word` VALUES (63, NULL, NULL, NULL, NULL, NULL, NULL, '你说的那个电影我没看过。');
INSERT INTO `wx_abnormal_word` VALUES (64, NULL, NULL, NULL, NULL, NULL, NULL, '我的梦想是成为一名宇航员。');
INSERT INTO `wx_abnormal_word` VALUES (65, NULL, NULL, NULL, NULL, NULL, NULL, '我最喜欢的电影是《肖申克的救赎》。');
INSERT INTO `wx_abnormal_word` VALUES (66, NULL, NULL, NULL, NULL, NULL, NULL, '我今天在路上看到了一只可爱的小狗。');
INSERT INTO `wx_abnormal_word` VALUES (67, NULL, NULL, NULL, NULL, NULL, NULL, '我正在看一本非常有趣的小说。');
INSERT INTO `wx_abnormal_word` VALUES (68, NULL, NULL, NULL, NULL, NULL, NULL, '我最喜欢的歌手是Taylor Swift。');
INSERT INTO `wx_abnormal_word` VALUES (69, NULL, NULL, NULL, NULL, NULL, NULL, '我昨天去逛了一家很棒的艺术展。');
INSERT INTO `wx_abnormal_word` VALUES (70, NULL, NULL, NULL, NULL, NULL, NULL, '我最喜欢的运动是足球。');
INSERT INTO `wx_abnormal_word` VALUES (71, NULL, NULL, NULL, NULL, NULL, NULL, '我最喜欢的食物是意大利面。');
INSERT INTO `wx_abnormal_word` VALUES (72, NULL, NULL, NULL, NULL, NULL, NULL, '我家的狗狗昨天吃了一只老鼠。');
INSERT INTO `wx_abnormal_word` VALUES (73, NULL, NULL, NULL, NULL, NULL, NULL, '我正在学习一门新的语言。');
INSERT INTO `wx_abnormal_word` VALUES (74, NULL, NULL, NULL, NULL, NULL, NULL, '我最喜欢的乐器是小提琴。');
INSERT INTO `wx_abnormal_word` VALUES (75, NULL, NULL, NULL, NULL, NULL, NULL, '我最喜欢的节日是圣诞节。');
INSERT INTO `wx_abnormal_word` VALUES (76, NULL, NULL, NULL, NULL, NULL, NULL, '我喜欢去海边散步。');

-- ----------------------------
-- Table structure for wx_ai_msg_log
-- ----------------------------
DROP TABLE IF EXISTS `wx_ai_msg_log`;
CREATE TABLE `wx_ai_msg_log`  (
  `msg_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '消息id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `tojid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '接收方，customer，server',
  `jid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '发送方，customer，server',
  `msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '聊天消息',
  `msg_origin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '消息来源，1-ai聊天，2ai作画',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '类型，1:消息，2:图片',
  `isread` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否已读',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `timestamp_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'ai对话记录' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for wx_feedback_log
-- ----------------------------
DROP TABLE IF EXISTS `wx_feedback_log`;
CREATE TABLE `wx_feedback_log`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '消息id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '反馈用户id',
  `question_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '问题标题',
  `question_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '问题描述',
  `question_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '问题分类',
  `answer` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '答复',
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系方式',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '问题反馈表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for wx_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_money_log`;
CREATE TABLE `wx_user_money_log`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '租户号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `money_from` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '金额来源1微信充值，2转账，3初始',
  `money_to` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '金额去向1兑换积分，2使用产品',
  `money` decimal(4, 1) NULL DEFAULT NULL COMMENT '金额',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '微信用户充值消费记录表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for wx_user_point_log
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_point_log`;
CREATE TABLE `wx_user_point_log`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '租户号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `point_from` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '积分来源，1签到，2看视频，3充值兑换',
  `point_to` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '积分去向',
  `point` int NULL DEFAULT NULL COMMENT '积分',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '微信用户充值记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Procedure structure for insert_numbers
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_numbers`;
delimiter ;;
CREATE PROCEDURE `insert_numbers`()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 326 DO
        INSERT INTO wx_abnormal_word  (complete) VALUES ("-");
        SET i = i + 1;
    END WHILE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
