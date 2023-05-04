/*
 Navicat Premium Data Transfer

 Source Server         : 47.97.153.205_3306
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : 47.97.153.205:3306
 Source Schema         : yanxuetong

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 04/05/2023 17:11:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 
course
-- ----------------------------
DROP TABLE IF EXISTS `
course`;
CREATE TABLE `
course`  (
  `course_id` int NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `
course_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程名',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 
course
-- ----------------------------

-- ----------------------------
-- Table structure for daily_report
-- ----------------------------
DROP TABLE IF EXISTS `daily_report`;
CREATE TABLE `daily_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `statue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '每日状态',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打卡时间',
  `judge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自我评定',
  `passage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2109784109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '每日一报' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of daily_report
-- ----------------------------
INSERT INTO `daily_report` VALUES (2109784067, '2022611011040', '刘正丰', '上课|', '2023-03-09 16:41:44', '优秀', '上课');
INSERT INTO `daily_report` VALUES (2109784068, '2022611011040', '刘正丰', '读文献|出差|', '2023-03-09 16:41:59', '优秀', '读文献');
INSERT INTO `daily_report` VALUES (2109784069, '2022611011012', '杜栖钰', '上课|读文献|', '2023-03-09 16:42:00', '良好', '');
INSERT INTO `daily_report` VALUES (2109784070, '2022611011012', '杜栖钰', '上课|', '2023-03-09 16:42:34', '', '');
INSERT INTO `daily_report` VALUES (2109784071, '2022611011040', '刘正丰', '上课|', '2023-03-09 17:14:42', '优秀', '今天在上课');
INSERT INTO `daily_report` VALUES (2109784072, '2022611011040', '刘正丰', '读文献|其他|', '2023-03-09 17:15:02', '良好', '其他');
INSERT INTO `daily_report` VALUES (2109784073, '2022611011041', '吕旭煌 ', NULL, '2023-03-12 16:47:46', NULL, NULL);
INSERT INTO `daily_report` VALUES (2109784074, '2022611011012', '杜栖钰', '上课|', '2023-03-12 18:42:50', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784075, '2022611011040', '刘正丰', '上课|', '2023-03-12 20:00:22', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784076, '2022611011012', '杜栖钰', '读文献|', '2023-03-12 20:05:25', '良好', '');
INSERT INTO `daily_report` VALUES (2109784077, '2022611011040', '刘正丰', '上课|', '2023-03-12 20:07:46', '优秀', '学习');
INSERT INTO `daily_report` VALUES (2109784078, '2022611011041', '吕旭煌 ', '上课|读文献|做实验|写论文|出差|其他|', '2023-03-19 12:16:59', '普通', '');
INSERT INTO `daily_report` VALUES (2109784079, '1', '胡军国', '上课|出差|', '2023-03-19 12:17:04', '优秀', '工作');
INSERT INTO `daily_report` VALUES (2109784080, '2022611011012', '杜栖钰', '读文献|做实验|', '2023-03-19 13:49:44', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784081, '2022611011012', '杜栖钰', '写论文|', '2023-03-23 19:44:02', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784082, '2022611011012', '杜栖钰', '上课|读文献|', '2023-03-24 21:56:56', '良好', '');
INSERT INTO `daily_report` VALUES (2109784083, '2022611011012', '杜栖钰', '上课|读文献|', '2023-03-25 15:40:27', '优秀', '写代码');
INSERT INTO `daily_report` VALUES (2109784084, '2022', '测1', '读文献|出差|', '2023-03-25 19:40:00', '优秀', '11111');
INSERT INTO `daily_report` VALUES (2109784085, '1', '胡军国', '', '2023-03-26 11:01:48', '', '');
INSERT INTO `daily_report` VALUES (2109784086, '2022611011012', '杜栖钰', '读文献|做实验|', '2023-03-29 22:17:21', '优秀', '上课');
INSERT INTO `daily_report` VALUES (2109784087, '2022611011012', '杜栖钰', '上课|', '2023-03-30 15:02:45', '优秀', '暂无');
INSERT INTO `daily_report` VALUES (2109784088, '2022611011012', '杜栖钰', '上课|读文献|', '2023-04-07 16:22:20', '优秀', '做实验');
INSERT INTO `daily_report` VALUES (2109784089, '202105010415', '郑智阳', '上课|', '2023-04-09 14:22:31', '优秀', '上课');
INSERT INTO `daily_report` VALUES (2109784090, '202105010415', '郑智阳', '上课|读文献|做实验|', '2023-04-09 14:27:21', '优秀', '认真完成');
INSERT INTO `daily_report` VALUES (2109784091, '1', '胡军国', '上课|读文献|', '2023-04-21 16:25:55', '良好', '上课');
INSERT INTO `daily_report` VALUES (2109784092, '2022611011012', '杜栖钰', '上课|', '2023-04-22 14:16:15', '优秀', '开会');
INSERT INTO `daily_report` VALUES (2109784093, '1', '胡军国', '读文献|', '2023-04-22 15:02:50', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784094, '2022611011012', '杜栖钰', '上课|', '2023-04-22 15:07:03', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784095, '1', '胡军国', '上课|', '2023-04-23 11:48:22', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784096, '2022611011012', '杜栖钰', '读文献|', '2023-04-27 11:58:37', '良好', '做实验');
INSERT INTO `daily_report` VALUES (2109784097, '1', '胡军国', '读文献|', '2023-04-28 10:35:07', '良好', '');
INSERT INTO `daily_report` VALUES (2109784098, '1', '胡军国', '读文献|', '2023-04-28 11:18:00', '良好', '');
INSERT INTO `daily_report` VALUES (2109784099, '2022611011012', '杜栖钰', '读文献|', '2023-04-28 11:18:20', '良好', '');
INSERT INTO `daily_report` VALUES (2109784100, '1', '胡军国', '读文献|', '2023-04-28 11:18:48', '良好', '');
INSERT INTO `daily_report` VALUES (2109784101, '1', '胡军国', '做实验|', '2023-04-28 11:18:56', '良好', '');
INSERT INTO `daily_report` VALUES (2109784102, '2022611011040', '刘正丰', '上课|', '2023-04-28 11:19:22', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784103, '2022611011041', '吕旭煌', '', '2023-04-28 12:43:41', '', '');
INSERT INTO `daily_report` VALUES (2109784104, '2022611011041', '吕旭煌', '', '2023-04-28 12:43:49', '', '');
INSERT INTO `daily_report` VALUES (2109784105, '1', '胡军国', '上课|', '2023-04-29 17:29:35', '优秀', '学习');
INSERT INTO `daily_report` VALUES (2109784106, '2022611011012', '杜栖钰', '上课|', '2023-05-01 14:12:21', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784107, '2022611011012', '杜栖钰', '上课|', '2023-05-03 11:34:19', '优秀', '');
INSERT INTO `daily_report` VALUES (2109784108, '2022611011012', '杜栖钰', '上课|', '2023-05-03 11:34:20', '优秀', '');

-- ----------------------------
-- Table structure for daily_sign
-- ----------------------------
DROP TABLE IF EXISTS `daily_sign`;
CREATE TABLE `daily_sign`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `number` bigint NULL DEFAULT NULL COMMENT '学号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打卡时间',
  `address1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经度',
  `address2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '每日打卡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of daily_sign
-- ----------------------------

-- ----------------------------
-- Table structure for daka
-- ----------------------------
DROP TABLE IF EXISTS `daka`;
CREATE TABLE `daka`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `consquence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2076262480 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daka
-- ----------------------------
INSERT INTO `daka` VALUES (1, '刘正丰', 'success', '2023-03-09 16:41:46', '2022611011040');
INSERT INTO `daka` VALUES (2, '刘正丰', 'success', '2023-03-09 16:41:46', '2022611011040');
INSERT INTO `daka` VALUES (3, '刘正丰', 'success', '2023-03-09 16:41:47', '2022611011040');
INSERT INTO `daka` VALUES (4, '刘正丰', 'success', '2023-03-09 16:41:47', '2022611011040');
INSERT INTO `daka` VALUES (5, '刘正丰', 'success', '2023-03-09 16:41:47', '2022611011040');
INSERT INTO `daka` VALUES (6, '杜栖钰', 'success', '2023-03-09 16:41:52', '2022611011012');
INSERT INTO `daka` VALUES (7, '刘正丰', 'success', '2023-03-09 16:42:01', '2022611011040');
INSERT INTO `daka` VALUES (2076262409, '刘正丰', 'success', '2023-03-09 17:14:15', '2022611011040');
INSERT INTO `daka` VALUES (2076262410, '刘正丰', 'success', '2023-03-09 17:14:20', '2022611011040');
INSERT INTO `daka` VALUES (2076262411, '刘正丰', 'success', '2023-03-09 17:14:20', '2022611011040');
INSERT INTO `daka` VALUES (2076262412, '刘正丰', 'success', '2023-03-09 17:14:20', '2022611011040');
INSERT INTO `daka` VALUES (2076262413, '刘正丰', 'success', '2023-03-09 17:14:20', '2022611011040');
INSERT INTO `daka` VALUES (2076262414, '刘正丰', 'success', '2023-03-09 17:14:21', '2022611011040');
INSERT INTO `daka` VALUES (2076262415, '刘正丰', 'success', '2023-03-09 17:14:21', '2022611011040');
INSERT INTO `daka` VALUES (2076262416, '刘正丰', 'success', '2023-03-09 17:14:21', '2022611011040');
INSERT INTO `daka` VALUES (2076262417, '刘正丰', 'success', '2023-03-09 17:14:28', '2022611011040');
INSERT INTO `daka` VALUES (2076262418, '刘正丰', 'success', '2023-03-09 17:14:28', '2022611011040');
INSERT INTO `daka` VALUES (2076262419, '刘正丰', 'success', '2023-03-09 17:14:28', '2022611011040');
INSERT INTO `daka` VALUES (2076262420, '刘正丰', 'success', '2023-03-09 17:14:28', '2022611011040');
INSERT INTO `daka` VALUES (2076262421, '刘正丰', 'success', '2023-03-09 17:14:28', '2022611011040');
INSERT INTO `daka` VALUES (2076262422, '刘正丰', 'success', '2023-03-09 17:14:28', '2022611011040');
INSERT INTO `daka` VALUES (2076262423, '刘正丰', 'success', '2023-03-12 20:25:26', '2022611011040');
INSERT INTO `daka` VALUES (2076262424, '韩康来', 'success', '2023-03-16 10:16:44', '2022611011020');
INSERT INTO `daka` VALUES (2076262425, '吕旭煌', 'success', '2023-03-18 15:32:14', '2022611011041');
INSERT INTO `daka` VALUES (2076262426, '杜栖钰', 'success', '2023-03-19 13:49:46', '2022611011012');
INSERT INTO `daka` VALUES (2076262427, '杜栖钰', 'success', '2023-03-19 13:49:47', '2022611011012');
INSERT INTO `daka` VALUES (2076262428, '胡军国', 'success', '2023-03-19 16:42:04', '1');
INSERT INTO `daka` VALUES (2076262429, '刘正丰', 'success', '2023-03-19 16:43:01', '2022611011040');
INSERT INTO `daka` VALUES (2076262430, '刘正丰', 'success', '2023-03-19 16:43:01', '2022611011040');
INSERT INTO `daka` VALUES (2076262431, '李艳宏', 'success', '2023-03-20 11:07:31', '2022611012033');
INSERT INTO `daka` VALUES (2076262432, '杜栖钰', 'success', '2023-03-23 19:44:04', '2022611011012');
INSERT INTO `daka` VALUES (2076262433, '吕旭煌', 'success', '2023-03-24 19:32:08', '2022611011041');
INSERT INTO `daka` VALUES (2076262434, '杜栖钰', 'success', '2023-03-24 21:56:49', '2022611011012');
INSERT INTO `daka` VALUES (2076262435, '测1', 'success', '2023-03-25 19:39:52', '2022');
INSERT INTO `daka` VALUES (2076262436, '刘正丰', 'success', '2023-03-26 10:22:46', '2022611011040');
INSERT INTO `daka` VALUES (2076262437, '刘正丰', 'success', '2023-03-25 08:22:46', '2022611011040');
INSERT INTO `daka` VALUES (2076262438, '刘正丰', 'success', '2023-03-26 08:22:46', '2022611011040');
INSERT INTO `daka` VALUES (2076262439, '刘正丰', 'success', '2023-03-24 08:22:46', '2022611011040');
INSERT INTO `daka` VALUES (2076262440, '刘正丰', 'success', '2023-03-23 08:22:46', '2022611011040');
INSERT INTO `daka` VALUES (2076262441, '刘正丰', 'success', '2023-03-22 08:22:46', '2022611011040');
INSERT INTO `daka` VALUES (2076262442, '刘正丰', 'success', '2023-03-21 08:22:46', '2022611011040');
INSERT INTO `daka` VALUES (2076262443, '刘正丰', 'success', '2023-03-20 08:22:46', '2022611011040');
INSERT INTO `daka` VALUES (2076262444, '乐杨', 'success', '2023-03-26 13:29:13', '2020611011023');
INSERT INTO `daka` VALUES (2076262445, '吕旭煌', 'success', '2023-03-26 14:08:29', '2022611011041');
INSERT INTO `daka` VALUES (2076262446, '测1', 'success', '2023-03-26 14:11:56', '2022611011041');
INSERT INTO `daka` VALUES (2076262447, '张明凯', 'success', '2023-03-26 16:48:05', '2021611011025');
INSERT INTO `daka` VALUES (2076262448, '胡军国', 'success', '2023-03-26 16:51:28', '1');
INSERT INTO `daka` VALUES (2076262449, '吕旭煌', 'success', '2023-03-26 17:22:11', '2022611011041');
INSERT INTO `daka` VALUES (2076262450, '吕旭煌', 'success', '2023-03-26 17:22:15', '2022611011041');
INSERT INTO `daka` VALUES (2076262451, '吕旭煌', 'success', '2023-03-26 17:26:13', '2022611011041');
INSERT INTO `daka` VALUES (2076262452, '吕旭煌', 'success', '2023-03-26 17:26:21', '2022611011041');
INSERT INTO `daka` VALUES (2076262453, '吕旭煌', 'success', '2023-03-26 17:26:23', '2022611011041');
INSERT INTO `daka` VALUES (2076262454, '吕旭煌', 'success', '2023-03-26 17:26:27', '2022611011041');
INSERT INTO `daka` VALUES (2076262455, '吕旭煌', 'success', '2023-03-26 17:26:38', '2022611011041');
INSERT INTO `daka` VALUES (2076262456, '吕旭煌', 'success', '2023-03-26 17:26:42', '2022611011041');
INSERT INTO `daka` VALUES (2076262457, '吕旭煌', 'success', '2023-03-26 17:26:49', '2022611011041');
INSERT INTO `daka` VALUES (2076262458, '吕旭煌', 'success', '2023-03-26 17:26:52', '2022611011041');
INSERT INTO `daka` VALUES (2076262459, '吕旭煌', 'success', '2023-03-26 17:26:56', '2022611011041');
INSERT INTO `daka` VALUES (2076262460, '测1', 'success', '2023-03-26 21:34:20', '2022611011041');
INSERT INTO `daka` VALUES (2076262461, '测1', 'success', '2023-03-26 21:37:10', '2022611011041');
INSERT INTO `daka` VALUES (2076262462, '吕旭煌', 'success', '2023-03-27 15:49:05', '2022611011041');
INSERT INTO `daka` VALUES (2076262463, '杜栖钰', 'success', '2023-03-28 10:28:54', '2022611011012');
INSERT INTO `daka` VALUES (2076262464, '吕旭煌', 'success', '2023-03-28 12:44:10', '2022611011041');
INSERT INTO `daka` VALUES (2076262465, '吕旭煌', 'success', '2023-03-28 15:00:57', '2022611011041');
INSERT INTO `daka` VALUES (2076262466, '刘正丰', 'success', '2023-03-29 18:56:56', '2022611011040');
INSERT INTO `daka` VALUES (2076262467, '刘正丰', 'success', '2023-03-30 21:18:06', '2022611011040');
INSERT INTO `daka` VALUES (2076262468, '吕旭煌', 'success', '2023-03-30 21:20:05', '2022611011041');
INSERT INTO `daka` VALUES (2076262469, '吕旭煌', 'success', '2023-04-04 18:05:48', '2022611011041');
INSERT INTO `daka` VALUES (2076262470, '吕旭煌', 'success', '2023-04-08 18:22:13', '2022611011041');
INSERT INTO `daka` VALUES (2076262471, '韩康来', 'success', '2023-04-10 09:54:30', '2022611011020');
INSERT INTO `daka` VALUES (2076262472, '韩康来', 'success', '2023-04-10 09:54:30', '2022611011020');
INSERT INTO `daka` VALUES (2076262473, '胡军国', 'success', '2023-04-21 16:26:15', '1');
INSERT INTO `daka` VALUES (2076262474, '杜栖钰', 'success', '2023-04-21 22:09:49', '2022611011012');
INSERT INTO `daka` VALUES (2076262475, '吕旭煌', 'success', '2023-04-22 14:08:04', '2022611011041');
INSERT INTO `daka` VALUES (2076262476, '杜栖钰', 'success', '2023-04-22 14:16:03', '2022611011012');
INSERT INTO `daka` VALUES (2076262477, '胡军国', 'success', '2023-04-26 23:41:21', '1');
INSERT INTO `daka` VALUES (2076262478, '杜栖钰', 'success', '2023-04-27 11:58:24', '2022611011012');
INSERT INTO `daka` VALUES (2076262479, '胡军国', 'success', '2023-04-28 10:34:48', '1');

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart`  (
  `depart_id` int NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`depart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES (1, '测试部门');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img`  (
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/吕旭煌20221211200810.jpg');
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/吕旭煌20221211202415.jpg');
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/测试20221211202710.png');
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/测试20221211203635.jpg');
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/测试20221211204943.jpg');
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/测试20221211210621.png');
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/测试20221211211636.png');
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/测试20221211211659.png');
INSERT INTO `img` VALUES ('https://zafuyxt.cn:8090https://www.zafuyxt.cn:8090/data/img/测试20221211212423.png');

-- ----------------------------
-- Table structure for stu_info
-- ----------------------------
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE `stu_info`  (
  `id` int NOT NULL,
  `stu_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `stu_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学号',
  `stu_class` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班级',
  `stu_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `stu_phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `stu_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `garde` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '判断是不是老师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_info
-- ----------------------------
INSERT INTO `stu_info` VALUES (1, '陈冰雨', '2022611012004', '数计研', '男', '15075121891', '1', '1');
INSERT INTO `stu_info` VALUES (3, '李彤', '2022611011031', '数计研', '男', '18875765492', '1', '1');
INSERT INTO `stu_info` VALUES (4, '韩康来', '2022611011020', '数计研', '男', '17800301052', '1', '1');
INSERT INTO `stu_info` VALUES (5, '尹朝阳', '2022611011067', '数计研', '男', '13293312837', '1', '1');
INSERT INTO `stu_info` VALUES (6, '张煊爽', '2022611012076', '数计研', '男', '18306803988', '1', '1');
INSERT INTO `stu_info` VALUES (7, '桑晨浩', '2022611011047', '数计研', '男', '15735959218', '1', '1');
INSERT INTO `stu_info` VALUES (8, '张昕彤', '2022611012075', '数计研', '男', '15635168610', '1', '1');
INSERT INTO `stu_info` VALUES (9, '常乐', '2022611012003', '数计研', '男', '13233449553', '1', '1');
INSERT INTO `stu_info` VALUES (10, '马纯馨', '2022611011042', '数计研', '男', '17326085658', '1', '1');
INSERT INTO `stu_info` VALUES (11, '梁俊杰', '2022811011034', '数计研', '男', '15834001446', '1', '1');
INSERT INTO `stu_info` VALUES (12, '郝瑾艺', '2022611012021', '数计研', '男', '13233254428', '1', '1');
INSERT INTO `stu_info` VALUES (13, '马聪丽', '2022611012043', '数计研', '男', '15121731322', '1', '1');
INSERT INTO `stu_info` VALUES (14, '李启鹏', '2022611011030', '数计研', '男', '13162952812', '1', '1');
INSERT INTO `stu_info` VALUES (15, '邵伟', '2022611011048', '数计研', '男', '15150663785', '1', '1');
INSERT INTO `stu_info` VALUES (16, '崔欣雨', '2022611012009', '数计研', '男', '19157925176', '1', '1');
INSERT INTO `stu_info` VALUES (17, '陈馨', '2022611011006', '数计研', '男', '13754320271', '1', '1');
INSERT INTO `stu_info` VALUES (18, '杜栖钰', '2022611011012', '数计研', '男', '15262027442', '1', '2');
INSERT INTO `stu_info` VALUES (19, '马帅', '2022611011044', '数计研', '男', '13583918803', '1', '1');
INSERT INTO `stu_info` VALUES (20, '姚琴娟', '2022611012066', '数计研', '男', '13771397207', '1', '1');
INSERT INTO `stu_info` VALUES (21, '沈蓝欣', '2022611012049', '数计研', '男', '19558172960', '1', '1');
INSERT INTO `stu_info` VALUES (22, '濮胜伟', '2022611011046', '数计研', '男', '18961132287', '1', '1');
INSERT INTO `stu_info` VALUES (23, '宋帅', '2022611011051', '数计研', '男', '15555523582', '1', '1');
INSERT INTO `stu_info` VALUES (24, '张帅杰', '2022611011074', '数计研', '男', '17739740905', '1', '1');
INSERT INTO `stu_info` VALUES (25, '苏航', '2022611011053', '数计研', '男', '15807277001', '1', '1');
INSERT INTO `stu_info` VALUES (26, '吴婷婷', '2022611012062', '数计研', '男', '13476645130', '1', '1');
INSERT INTO `stu_info` VALUES (27, '刘霜', '2022611012039', '数计研', '男', '15575085921', '1', '1');
INSERT INTO `stu_info` VALUES (28, '王永祥', '2022611011060', '数计研', '男', '15179698167', '1', '1');
INSERT INTO `stu_info` VALUES (29, '王杰', '2022611011058', '数计研', '男', '13288838694', NULL, '1');
INSERT INTO `stu_info` VALUES (30, '宋悦', '2022611012052', '数计研', '男', '17816603263', NULL, '1');
INSERT INTO `stu_info` VALUES (31, '李艳宏', '2022611012033', '数计研', '男', '13541157892', NULL, '1');
INSERT INTO `stu_info` VALUES (32, '黄帮俊', '2022611011027', '数计研', '男', '15892233050', NULL, '1');
INSERT INTO `stu_info` VALUES (33, '张枫伟', '2022611011071', '数计研', '男', '19906839503', NULL, '1');
INSERT INTO `stu_info` VALUES (34, '方浩远', '2022811011014', '数计研', '男', '13735467963', NULL, '1');
INSERT INTO `stu_info` VALUES (35, '方斌', '2022811011013', '数计研', '男', '15268187858', NULL, '1');
INSERT INTO `stu_info` VALUES (36, '郑世安', '2022611011081', '数计研', '男', '15158789821', NULL, '1');
INSERT INTO `stu_info` VALUES (37, '鲍高宏', '2022611011001', '数计研', '男', '18258406639', NULL, '1');
INSERT INTO `stu_info` VALUES (38, '胡云昊', '2022611011026', '数计研', '男', '15990191356', NULL, '1');
INSERT INTO `stu_info` VALUES (39, '王雅洁', '2022611012059', '数计研', '男', '19858166369', NULL, '1');
INSERT INTO `stu_info` VALUES (40, '何磊', '2022611011022', '数计研', '男', '15858247654', NULL, '1');
INSERT INTO `stu_info` VALUES (41, '余喆', '2022611011070', '数计研', '男', '19957012267', NULL, '1');
INSERT INTO `stu_info` VALUES (42, '丁奇沣', '2022611011011', '数计研', '男', '17857019002', NULL, '1');
INSERT INTO `stu_info` VALUES (43, '梁子乐', '2022611012035', '数计研', '男', '13753097865', NULL, '1');
INSERT INTO `stu_info` VALUES (44, '章志欣', '2022611011077', '数计研', '男', '15990196297', NULL, '1');
INSERT INTO `stu_info` VALUES (45, '单凌啸', '2022611011010', '数计研', '男', '13906643392', NULL, '1');
INSERT INTO `stu_info` VALUES (46, '张嘉俊', '2022611011072', '数计研', '男', '187678703233', NULL, '1');
INSERT INTO `stu_info` VALUES (47, '姚俊伟', '2022611011065', '数计研', '男', '13429162373', NULL, '1');
INSERT INTO `stu_info` VALUES (48, '梁梓源', '2022611011036', '数计研', '男', '16678647764', NULL, '1');
INSERT INTO `stu_info` VALUES (49, '周炜翔', '2022611011084', '数计研', '男', '19975270202', NULL, '1');
INSERT INTO `stu_info` VALUES (50, '陶征宇', '2022611011056', '数计研', '男', '18767187413', NULL, '1');
INSERT INTO `stu_info` VALUES (51, '沈域', '2022611011050', '数计研', '男', '19858166817', NULL, '1');
INSERT INTO `stu_info` VALUES (52, '赵泽雨', '2022611011079', '数计研', '男', '18058811228', NULL, '1');
INSERT INTO `stu_info` VALUES (53, '高威芳', '2022611012018', '数计研', '男', '18968153365', NULL, '1');
INSERT INTO `stu_info` VALUES (54, '郭礼俊', '2022611011019', '数计研', '男', '15959436373', NULL, '1');
INSERT INTO `stu_info` VALUES (55, '祝心雨', '2022611012087', '数计研', '男', '13687931035', NULL, '1');
INSERT INTO `stu_info` VALUES (56, '李兴隆', '2022611011032', '数计研', '男', '18370221965', NULL, '1');
INSERT INTO `stu_info` VALUES (57, '陈志超', '2022611011008', '数计研', '男', '15166047726', NULL, '1');
INSERT INTO `stu_info` VALUES (58, '郑哲', '2022611012082', '数计研', '男', '18264229952', NULL, '1');
INSERT INTO `stu_info` VALUES (59, '王成凤', '2022611012057', '数计研', '男', '15864434192', NULL, '1');
INSERT INTO `stu_info` VALUES (60, '魏静', '2022811012061', '数计研', '男', '18678050975', NULL, '1');
INSERT INTO `stu_info` VALUES (61, '刘正丰', '2022611011040', '数计研', '男', '13012458029', NULL, '2');
INSERT INTO `stu_info` VALUES (62, '朱奕锟', '2022611012085', '数计研', '男', '15356181931', NULL, '1');
INSERT INTO `stu_info` VALUES (63, '刘海龙', '2022611011038', '数计研', '男', '17861900302', NULL, '1');
INSERT INTO `stu_info` VALUES (64, '张妙妙', '2022611012073', '数计研', '男', '15067514042', NULL, '1');
INSERT INTO `stu_info` VALUES (65, '高飞鹏', '2022611011017', '数计研', '男', '15868827385', NULL, '1');
INSERT INTO `stu_info` VALUES (66, '陈懿', '2022611012007', '数计研', '男', '19305852621', NULL, '1');
INSERT INTO `stu_info` VALUES (67, '吕旭煌', '2022611011041', '数计研', '男', '19817435400', NULL, '2');
INSERT INTO `stu_info` VALUES (68, '苏新元', '2022611011054', '数计研', '男', '13868381118', NULL, '1');
INSERT INTO `stu_info` VALUES (69, '蔡行行', '2022611011002', '数计研', '男', '15549418810', NULL, '1');
INSERT INTO `stu_info` VALUES (70, '祝望进', '2022611011086', '数计研', '男', '18357461120', NULL, '1');
INSERT INTO `stu_info` VALUES (71, '钟康源', '2022611011083', '数计研', '男', '18967517805', NULL, '1');
INSERT INTO `stu_info` VALUES (72, '金啸辰', '2022611011029', '数计研', '男', '13757334803', NULL, '1');
INSERT INTO `stu_info` VALUES (73, '杨彦鹏', '2022611011064', '数计研', '男', '13754323200', NULL, '1');
INSERT INTO `stu_info` VALUES (74, '钮俊奇', '2022611011045', '数计研', '男', '17858142713', NULL, '1');
INSERT INTO `stu_info` VALUES (75, '余国春', '2022611011068', '数计研', '男', '19805657823', NULL, '1');
INSERT INTO `stu_info` VALUES (76, '胡宇阔', '2022811011025', '数计研', '男', '15005784297', NULL, '1');
INSERT INTO `stu_info` VALUES (77, '陈婷', '2022611012005', '数计研', '男', '15395781575', NULL, '1');
INSERT INTO `stu_info` VALUES (78, '吴志威', '2022611011063', '数计研', '男', '18067148124', NULL, '1');
INSERT INTO `stu_info` VALUES (79, '郑明伟', '2022611011080', '数计研', '男', '15990690621', NULL, '1');
INSERT INTO `stu_info` VALUES (80, '胡淇钧', '2022611011023', '数计研', '男', '13750906531', NULL, '1');
INSERT INTO `stu_info` VALUES (81, '冯玲霞', '2022611012015', '数计研', '男', '18167063279', NULL, '1');
INSERT INTO `stu_info` VALUES (82, '林董静', '2022611012037', '数计研', '男', '13216573506', NULL, '1');
INSERT INTO `stu_info` VALUES (83, '赵科杰', '2022611011078', '数计研', '男', '17605848344', NULL, '1');
INSERT INTO `stu_info` VALUES (84, '苏信通', '2022611011055', '数计研', '男', '18969799589', NULL, '1');
INSERT INTO `stu_info` VALUES (85, '余寿杰\r\n', '2022611011069', '数计研', '男', '13656658551', NULL, '1');
INSERT INTO `stu_info` VALUES (101, '黄雷君', '20100005', '数计研', '男', '13706506169', NULL, '2');
INSERT INTO `stu_info` VALUES (102, '顾清', '20212241', '数计研', '男', '18058762449', NULL, '2');
INSERT INTO `stu_info` VALUES (103, '胡军国', '20010056', '数计研', '男', '13758291023', NULL, '2');
INSERT INTO `stu_info` VALUES (104, '徐爱俊', '20020023', '数计研', '男', '13868024658', NULL, '2');
INSERT INTO `stu_info` VALUES (105, '楼雄伟', '20030074', '数计研', '男', '13588228755', NULL, '2');
INSERT INTO `stu_info` VALUES (106, '莫路锋', '20040093', '数计研', '男', '13868019133', NULL, '2');
INSERT INTO `stu_info` VALUES (107, '吴达胜', '19940019', '数计研', '男', '13968023105', NULL, '2');
INSERT INTO `stu_info` VALUES (108, '冯海林', '20070102', '数计研', '男', '13777368991', NULL, '2');
INSERT INTO `stu_info` VALUES (109, '胡彦蓉', '20160017', '数计研', '男', '18506827867', NULL, '2');
INSERT INTO `stu_info` VALUES (112, '徐达宇', '20140021', '数计研', '男', '15968118425', NULL, '2');
INSERT INTO `stu_info` VALUES (113, '曾松伟', '19970017', '数计研', '男', '13758280718', NULL, '2');
INSERT INTO `stu_info` VALUES (114, '叶宏宝', '20212340', '数计研', '男', '13588734927', NULL, '2');
INSERT INTO `stu_info` VALUES (116, '夏芳', '20200016', '数计研', '男', '13957150104', NULL, '2');
INSERT INTO `stu_info` VALUES (119, '阮耀平', '20182018', '数计研', '男', '13506818858', NULL, '2');
INSERT INTO `stu_info` VALUES (120, '吴剑', '20140063', '数计研', '男', '13735550460', NULL, '2');
INSERT INTO `stu_info` VALUES (121, '郑辛煜', '20180011', '数计研', '男', '13735557675', NULL, '2');
INSERT INTO `stu_info` VALUES (122, '杜晓晨', '20060031', '数计研', '男', '13685773166', NULL, '2');
INSERT INTO `stu_info` VALUES (123, '戴丹', '20010093', '数计研', '男', '13588228916', NULL, '2');
INSERT INTO `stu_info` VALUES (125, '童孟军', '20130035', '数计研', '男', '18668195217', NULL, '2');
INSERT INTO `stu_info` VALUES (127, '刘洪久', '20160016', '数计研', '男', '18758041587', NULL, '2');
INSERT INTO `stu_info` VALUES (128, '方陆明', '19820004', '数计研', '男', '18968156768', NULL, '2');
INSERT INTO `stu_info` VALUES (131, '易晓梅', '20020081', '数计研', '男', '13758295296', NULL, '2');
INSERT INTO `stu_info` VALUES (132, '夏凯', '20050050', '数计研', '男', '13336010699', NULL, '2');
INSERT INTO `stu_info` VALUES (133, '汪杭军', '19970016', '数计研', '男', '18958169169', NULL, '2');
INSERT INTO `stu_info` VALUES (137, '李颜娥', '20190082', '数计研', '男', '13989833848', NULL, '2');
INSERT INTO `stu_info` VALUES (140, '孔汶汶', '20150016', '数计研', '男', '18072861096', NULL, '2');
INSERT INTO `stu_info` VALUES (141, '周厚奎', '20060024', '数计研', '男', '18058419618', NULL, '2');
INSERT INTO `stu_info` VALUES (144, '李剑', '20070079', '数计研', '男', '13018903800', NULL, '2');
INSERT INTO `stu_info` VALUES (146, '徐流畅', '20200052', '数计研', '男', '15267057518', NULL, '2');
INSERT INTO `stu_info` VALUES (148, '惠国华', '20150011', '数计研', '男', '13588015625', NULL, '2');
INSERT INTO `stu_info` VALUES (162, '董晨', '20160014', '数计研', '男', '15867180919', NULL, '2');
INSERT INTO `stu_info` VALUES (172, '吴鹏', '20020041', '数计研', '男', '13868016453', NULL, '2');
INSERT INTO `stu_info` VALUES (174, '杨洁', '20180019', '数计研', '男', '18457588266', NULL, '2');
INSERT INTO `stu_info` VALUES (175, '杨垠晖', '20170045', '数计研', '男', '13732297585', NULL, '2');
INSERT INTO `stu_info` VALUES (184, '刘同存', '20190086', '数计研', '男', '18511897896', NULL, '2');
INSERT INTO `stu_info` VALUES (193, '陈文辉', '20030021', '数计研', '男', '13666639823', NULL, '2');
INSERT INTO `stu_info` VALUES (201, '付志威', '2021611011002', '数计研', '男', '17354360027', NULL, '1');
INSERT INTO `stu_info` VALUES (202, '侯津京', '2021611011003', '数计研', '男', '15522921566', NULL, '1');
INSERT INTO `stu_info` VALUES (203, '冯源', '2021611011005', '数计研', '男', '18506850103', NULL, '1');
INSERT INTO `stu_info` VALUES (204, '冯财博', '2021611011006', '数计研', '男', '15936415254', NULL, '1');
INSERT INTO `stu_info` VALUES (205, '刘伟东', '2021611011007', '数计研', '男', '15205256704', NULL, '1');
INSERT INTO `stu_info` VALUES (206, '刘伟立', '2021611011008', '数计研', '男', '15552107700', NULL, '1');
INSERT INTO `stu_info` VALUES (207, '刘昊', '2021611011009', '数计研', '男', '13657964482', NULL, '1');
INSERT INTO `stu_info` VALUES (208, '吕力健', '2021611011012', '数计研', '男', '15156377565', NULL, '1');
INSERT INTO `stu_info` VALUES (209, '吕嘉铭', '2021611011013', '数计研', '男', '15968368464', NULL, '1');
INSERT INTO `stu_info` VALUES (210, '周通', '2021611011017', '数计研', '男', '15988282893', NULL, '1');
INSERT INTO `stu_info` VALUES (211, '夏众一', '2021611011018', '数计研', '男', '18360803786', NULL, '1');
INSERT INTO `stu_info` VALUES (212, '孙微海', '2021611011021', '数计研', '男', '19157923282', NULL, '1');
INSERT INTO `stu_info` VALUES (213, '孙麒淞', '2021611011022', '数计研', '男', '18346876069', NULL, '1');
INSERT INTO `stu_info` VALUES (214, '尹文杰', '2021611011023', '数计研', '男', '17851550231', NULL, '1');
INSERT INTO `stu_info` VALUES (215, '康浩愉', '2021611011024', '数计研', '男', '17326088655', NULL, '1');
INSERT INTO `stu_info` VALUES (216, '张明凯', '2021611011025', '数计研', '男', '15224255737', NULL, '1');
INSERT INTO `stu_info` VALUES (217, '张春磊', '2021611011026', '数计研', '男', '15306573682', NULL, '1');
INSERT INTO `stu_info` VALUES (218, '张金星', '2021611011027', '数计研', '男', '17326086078', NULL, '1');
INSERT INTO `stu_info` VALUES (219, '徐寅', '2021611011029', '数计研', '男', '15306572539', NULL, '1');
INSERT INTO `stu_info` VALUES (220, '徐金辉', '2021611011032', '数计研', '男', '15990188251', NULL, '1');
INSERT INTO `stu_info` VALUES (221, '方耿盛', '2021611011033', '数计研', '男', '13682753937', NULL, '1');
INSERT INTO `stu_info` VALUES (222, '施冰', '2021611011034', '数计研', '男', '18892688121', NULL, '1');
INSERT INTO `stu_info` VALUES (223, '朱宇浩', '2021611011035', '数计研', '男', '18757138490', NULL, '1');
INSERT INTO `stu_info` VALUES (224, '李尚阳', '2021611011038', '数计研', '男', '15397062275', NULL, '1');
INSERT INTO `stu_info` VALUES (225, '李波', '2021611011039', '数计研', '男', '17562472616', NULL, '1');
INSERT INTO `stu_info` VALUES (226, '李骋', '2021611011040', '数计研', '男', '18888715430', NULL, '1');
INSERT INTO `stu_info` VALUES (227, '林上钦', '2021611011041', '数计研', '男', '18158661902', NULL, '1');
INSERT INTO `stu_info` VALUES (228, '楼晓俊', '2021611011043', '数计研', '男', '15356178707', NULL, '1');
INSERT INTO `stu_info` VALUES (229, '沈家辉', '2021611011046', '数计研', '男', '15058148833', NULL, '1');
INSERT INTO `stu_info` VALUES (230, '潘辰昕', '2021611011047', '数计研', '男', '17757582239', NULL, '1');
INSERT INTO `stu_info` VALUES (231, '王东东', '2021611011048', '数计研', '男', '13191038460', NULL, '1');
INSERT INTO `stu_info` VALUES (232, '王广科', '2021611011051', '数计研', '男', '15990172910', NULL, '1');
INSERT INTO `stu_info` VALUES (233, '程嘉瑜', '2021611011057', '数计研', '男', '13167180853', NULL, '1');
INSERT INTO `stu_info` VALUES (234, '罗文显', '2021611011058', '数计研', '男', '15079702937', NULL, '1');
INSERT INTO `stu_info` VALUES (235, '范坤', '2021611011059', '数计研', '男', '19550178551', NULL, '1');
INSERT INTO `stu_info` VALUES (236, '范胜杭', '2021611011060', '数计研', '男', '15867171749', NULL, '1');
INSERT INTO `stu_info` VALUES (237, '董煌滔', '2021611011061', '数计研', '男', '13757138070', NULL, '1');
INSERT INTO `stu_info` VALUES (238, '袁煜博', '2021611011063', '数计研', '男', '13379060960', NULL, '1');
INSERT INTO `stu_info` VALUES (239, '谢荣倡', '2021611011064', '数计研', '男', '13763919769', NULL, '1');
INSERT INTO `stu_info` VALUES (240, '赖煌', '2021611011065', '数计研', '男', '18870489698', NULL, '1');
INSERT INTO `stu_info` VALUES (241, '郭文杰', '2021611011067', '数计研', '男', '15356181665', NULL, '1');
INSERT INTO `stu_info` VALUES (242, '郭旭东', '2021611011068', '数计研', '男', '17326088278', NULL, '1');
INSERT INTO `stu_info` VALUES (243, '金京', '2021611011069', '数计研', '男', '19157738617', NULL, '1');
INSERT INTO `stu_info` VALUES (244, '金晨', '2021611011070', '数计研', '男', '17326082867', NULL, '1');
INSERT INTO `stu_info` VALUES (245, '钟意', '2021611011071', '数计研', '男', '18692186570', NULL, '1');
INSERT INTO `stu_info` VALUES (246, '陈佳豪', '2021611011073', '数计研', '男', '19157923680', NULL, '1');
INSERT INTO `stu_info` VALUES (247, '陈威', '2021611011074', '数计研', '男', '18671657580', NULL, '1');
INSERT INTO `stu_info` VALUES (248, '陈罕宇', '2021611011075', '数计研', '男', '17858153856', NULL, '1');
INSERT INTO `stu_info` VALUES (249, '陈雨博', '2021611011076', '数计研', '男', '18858576105', NULL, '1');
INSERT INTO `stu_info` VALUES (250, '鲁承浩', '2021611011079', '数计研', '男', '15968151632', NULL, '1');
INSERT INTO `stu_info` VALUES (251, '黄志杰', '2021611011080', '数计研', '男', '13847844506', NULL, '1');
INSERT INTO `stu_info` VALUES (252, '黄炯炯', '2021611011081', '数计研', '男', '15990186990', NULL, '1');
INSERT INTO `stu_info` VALUES (253, '龚宇浩', '2021611011082', '数计研', '男', '18789371733', NULL, '1');
INSERT INTO `stu_info` VALUES (254, '丁鋆', '2021611012001', '数计研', '男', '19157925396', NULL, '1');
INSERT INTO `stu_info` VALUES (255, '俞淑燕', '2021611012004', '数计研', '男', '19157922931', NULL, '1');
INSERT INTO `stu_info` VALUES (256, '吴珊', '2021611012014', '数计研', '男', '13735315050', NULL, '1');
INSERT INTO `stu_info` VALUES (257, '周怡银', '2021611012015', '数计研', '男', '19157925990', NULL, '1');
INSERT INTO `stu_info` VALUES (258, '周月', '2021611012016', '数计研', '男', '19550178573', NULL, '1');
INSERT INTO `stu_info` VALUES (259, '姜彤', '2021611012020', '数计研', '男', '13967635370', NULL, '1');
INSERT INTO `stu_info` VALUES (260, '张靖渝', '2021611012028', '数计研', '男', '18232178682', NULL, '1');
INSERT INTO `stu_info` VALUES (261, '朱润青', '2021611012036', '数计研', '男', '17326085377', NULL, '1');
INSERT INTO `stu_info` VALUES (262, '柯晨晨', '2021611012042', '数计研', '男', '18968027469', NULL, '1');
INSERT INTO `stu_info` VALUES (263, '王娇萍', '2021611012050', '数计研', '男', '15258827342', NULL, '1');
INSERT INTO `stu_info` VALUES (264, '王思阳', '2021611012052', '数计研', '男', '17857332722', NULL, '1');
INSERT INTO `stu_info` VALUES (265, '王雨莹', '2021611012054', '数计研', '男', '13819668070', NULL, '1');
INSERT INTO `stu_info` VALUES (267, '王颖', '2021611012055', '数计研', '男', '13932450334', NULL, '1');
INSERT INTO `stu_info` VALUES (268, '薛悦平', '2021611012062', '数计研', '男', '13362361815', NULL, '1');
INSERT INTO `stu_info` VALUES (269, '赵欢欢', '2021611012066', '数计研', '男', '17767061965', NULL, '1');
INSERT INTO `stu_info` VALUES (270, '钱梦婷', '2021611012072', '数计研', '男', '19157923865', NULL, '1');
INSERT INTO `stu_info` VALUES (271, '高叶凡', '2021611012077', '数计研', '男', '15162808679', NULL, '1');
INSERT INTO `stu_info` VALUES (272, '鲁嘉滢', '2021611012078', '数计研', '男', '15925865352', NULL, '1');
INSERT INTO `stu_info` VALUES (273, '徐磊', '2021811011031', '数计研', '男', '15995827444', NULL, '1');
INSERT INTO `stu_info` VALUES (274, '朱锋', '2021811011037', '数计研', '男', '13588432907', NULL, '1');
INSERT INTO `stu_info` VALUES (275, '毛华敏', '2021811011044', '数计研', '男', '13606503331', NULL, '1');
INSERT INTO `stu_info` VALUES (276, '江会权', '2021811011045', '数计研', '男', '18321212424', NULL, '1');
INSERT INTO `stu_info` VALUES (277, '王声亮', '2021811011049', '数计研', '男', '13301611102', NULL, '1');
INSERT INTO `stu_info` VALUES (278, '徐小燕', '2021811012030', '数计研', '男', '17816853049', NULL, '1');
INSERT INTO `stu_info` VALUES (279, '王莲', '2021811012053', '数计研', '男', '15380890107', NULL, '1');
INSERT INTO `stu_info` VALUES (280, '卢炜凌', '2021611011010', '数计研', '男', '15757135987', NULL, '1');
INSERT INTO `stu_info` VALUES (281, '古海博', '2021611011011', '数计研', '男', '18736643215', NULL, '1');

-- ----------------------------
-- Table structure for stu_info1111
-- ----------------------------
DROP TABLE IF EXISTS `stu_info1111`;
CREATE TABLE `stu_info1111`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `stu_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学号',
  `stu_class` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班级',
  `stu_sex` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `stu_phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `stu_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `garde` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '判断是不是老师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11112 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_info1111
-- ----------------------------
INSERT INTO `stu_info1111` VALUES (121, '吕旭煌', '2022611011041', '研221', '男', '19817435400', '1', '2');
INSERT INTO `stu_info1111` VALUES (131, '高威芳', '2022611012018', '研221', '女', '18968153365', '1', '1');
INSERT INTO `stu_info1111` VALUES (141, '康浩愉', '2021611011024', '研221', '男', '17326088655', '1', '1');
INSERT INTO `stu_info1111` VALUES (151, '潘辰昕', '2021611011047', '研221', '男', '17757582239', '1', '1');
INSERT INTO `stu_info1111` VALUES (161, '冯玲霞', '2022611012015', '研221', '女', '17816732089 ', '1', '1');
INSERT INTO `stu_info1111` VALUES (171, '姜俊杰', '2020611011021', '研221', '男', '19157735883', '1', '1');
INSERT INTO `stu_info1111` VALUES (181, '梁子乐', '2022611012035', '研221', '男', '19550152735', '1', '1');
INSERT INTO `stu_info1111` VALUES (191, '张明凯', '2021611011025', '研221', '男', '15224255737', '1', '1');
INSERT INTO `stu_info1111` VALUES (201, '李耀', '2020611011028', '研221', '男', '13588781126', '1', '1');
INSERT INTO `stu_info1111` VALUES (211, '尹文杰', '2021611011023', '研221', '男', '17851550231', '1', '1');
INSERT INTO `stu_info1111` VALUES (221, '吴志威 ', '2022611011063    ', '研221', '男', '18067148124', '1', '1');
INSERT INTO `stu_info1111` VALUES (231, '乐杨', '2020611011023', '研221', '男', '13588779800', '1', '1');
INSERT INTO `stu_info1111` VALUES (241, '陈思伟', '2020611011006', '研221', '男', '19157736087 ', '1', '1');
INSERT INTO `stu_info1111` VALUES (251, '李艳宏', '2022611012033', '研221', '女', '19906839038 ', '1', '1');
INSERT INTO `stu_info1111` VALUES (261, '孙麒淞', '2021611011022', '研221', '男', '18346876069 ', '1', '1');
INSERT INTO `stu_info1111` VALUES (271, '胡军国', '1', '老师', '男', '13758291023', '1', '2');
INSERT INTO `stu_info1111` VALUES (281, '冯海林', '2', '老师', '男', '13777368991', '1', '2');
INSERT INTO `stu_info1111` VALUES (311, '郑智阳', '202105010415', '计算机214', '男', '15057318339', '1', '1');
INSERT INTO `stu_info1111` VALUES (321, '徐振秦', '202105010425', '计算机214', '男', '15825491987', '1', '1');
INSERT INTO `stu_info1111` VALUES (331, '蒋建鹏', '3', '老师', '男', '13166260802', '1', '2');
INSERT INTO `stu_info1111` VALUES (1011, '韩康来', '2022611011020', '研221', '男', '17816880275 ', '1', '1');
INSERT INTO `stu_info1111` VALUES (1111, '刘正丰', '2022611011040', '研221', '男', '13012458029', '1', '2');
INSERT INTO `stu_info1111` VALUES (1112, '郭旭东', '2021611011068', '研221', '男', '17326088278', '1', '1');
INSERT INTO `stu_info1111` VALUES (9111, '杜栖钰', '2022611011012', '研221', '男', '15262027442', '1', '2');

-- ----------------------------
-- Table structure for stu_info_copy1
-- ----------------------------
DROP TABLE IF EXISTS `stu_info_copy1`;
CREATE TABLE `stu_info_copy1`  (
  `stu_id` int NOT NULL,
  `stu_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `stu_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学号',
  `stu_depart` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学院',
  `stu_class` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班级',
  `stu_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `stu_phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `stu_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `garde` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '判断是不是老师',
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_info_copy1
-- ----------------------------
INSERT INTO `stu_info_copy1` VALUES (1, '陈冰雨', '2022611012004', '数学与计算机科学学院', '', '男', '15075121891', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (3, '李彤', '2022611011031', '数学与计算机科学学院', '', '男', '18875765492', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (4, '韩康来', '2022611011020', '数学与计算机科学学院', '', '女', '17800301052', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (5, '尹朝阳', '2022611011067', '数学与计算机科学学院', '', '男', '13293312837', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (6, '张煊爽', '2022611012076', '数学与计算机科学学院', '', '男', '18306803988', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (7, '桑晨浩', '2022611011047', '数学与计算机科学学院', '', '男', '15735959218', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (8, '张昕彤', '2022611012075', '数学与计算机科学学院', '', '男', '15635168610', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (9, '常乐', '2022611012003', '数学与计算机科学学院', '', '男', '13233449553', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (10, '马纯馨', '2022611011042', '数学与计算机科学学院', '', '男', '17326085658', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (11, '梁俊杰', '2022811011034', '数学与计算机科学学院', '', '男', '15834001446', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (12, '郝瑾艺', '2022611012021', '数学与计算机科学学院', '', '男', '13233254428', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (13, '马聪丽', '2022611012043', '数学与计算机科学学院', '', '女', '15121731322', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (14, '李启鹏', '2022611011030', '数学与计算机科学学院', '', '男', '13162952812', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (15, '邵伟', '2022611011048', '数学与计算机科学学院', '', '男', '15150663785', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (16, '崔欣雨', '2022611012009', '数学与计算机科学学院', '', '女', '19157925176', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (17, '陈馨', '2022611011006', '数学与计算机科学学院', '', '男', '13754320271', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (18, '杜栖钰', '2022611011012', '数学与计算机科学学院', '', '男', '15262027442', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (19, '马帅', '2022611011044', '数学与计算机科学学院', '', '男', '13583918803', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (20, '姚琴娟', '2022611012066', '数学与计算机科学学院', '', '男', '13771397207', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (21, '沈蓝欣', '2022611012049', '数学与计算机科学学院', '', '男', '19558172960', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (22, '濮胜伟', '2022611011046', '数学与计算机科学学院', '', '男', '18961132287', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (23, '宋帅', '2022611011051', '数学与计算机科学学院', '', '男', '15555523582', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (24, '张帅杰', '2022611011074', '数学与计算机科学学院', '', '男', '17739740905', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (25, '苏航', '2022611011053', '数学与计算机科学学院', '', '女', '15807277001', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (26, '吴婷婷', '2022611012062', '数学与计算机科学学院', '', '男', '13476645130', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (27, '刘霜', '2022611012039', '数学与计算机科学学院', '', '男', '15575085921', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (28, '王永祥', '2022611011060', '数学与计算机科学学院', '', '男', '15179698167', '1', '1');
INSERT INTO `stu_info_copy1` VALUES (29, '王杰', '2022611011058', '数学与计算机科学学院', '', NULL, '13288838694', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (30, '宋悦', '2022611012052', '数学与计算机科学学院', '', NULL, '17816603263', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (31, '李艳宏', '2022611012033', '数学与计算机科学学院', '', NULL, '13541157892', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (32, '黄帮俊', '2022611011027', '数学与计算机科学学院', '', NULL, '15892233050', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (33, '张枫伟', '2022611011071', '数学与计算机科学学院', '', NULL, '19906839503', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (34, '方浩远', '2022811011014', '数学与计算机科学学院', '', NULL, '13735467963', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (35, '方斌', '2022811011013', '数学与计算机科学学院', '', NULL, '15268187858', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (36, '郑世安', '2022611011081', '数学与计算机科学学院', '', NULL, '15158789821', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (37, '鲍高宏', '2022611011001', '数学与计算机科学学院', '', NULL, '18258406639', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (38, '胡云昊', '2022611011026', '数学与计算机科学学院', '', NULL, '15990191356', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (39, '王雅洁', '2022611012059', '数学与计算机科学学院', '', NULL, '19858166369', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (40, '何磊', '2022611011022', '数学与计算机科学学院', '', NULL, '15858247654', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (41, '余喆', '2022611011070', '数学与计算机科学学院', '', NULL, '19957012267', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (42, '丁奇沣', '2022611011011', '数学与计算机科学学院', '', NULL, '17857019002', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (43, '梁子乐', '2022611012035', '数学与计算机科学学院', '', NULL, '13753097865', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (44, '章志欣', '2022611011077', '数学与计算机科学学院', '', NULL, '15990196297', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (45, '单凌啸', '2022611011010', '数学与计算机科学学院', '', NULL, '13906643392', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (46, '张嘉俊', '2022611011072', '数学与计算机科学学院', '', NULL, '187678703233', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (47, '姚俊伟', '2022611011065', '数学与计算机科学学院', '', NULL, '13429162373', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (48, '梁梓源', '2022611011036', '数学与计算机科学学院', '', NULL, '16678647764', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (49, '周炜翔', '2022611011084', '数学与计算机科学学院', '', NULL, '19975270202', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (50, '陶征宇', '2022611011056', '数学与计算机科学学院', '', NULL, '18767187413', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (51, '沈域', '2022611011050', '数学与计算机科学学院', '', NULL, '19858166817', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (52, '赵泽雨', '2022611011079', '数学与计算机科学学院', '', NULL, '18058811228', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (53, '高威芳', '2022611012018', '数学与计算机科学学院', '', NULL, '18968153365', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (54, '郭礼俊', '2022611011019', '数学与计算机科学学院', '', NULL, '15959436373', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (55, '祝心雨', '2022611012087', '数学与计算机科学学院', '', NULL, '13687931035', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (56, '李兴隆', '2022611011032', '数学与计算机科学学院', '', NULL, '18370221965', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (57, '陈志超', '2022611011008', '数学与计算机科学学院', '', NULL, '15166047726', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (58, '郑哲', '2022611012082', '数学与计算机科学学院', '', NULL, '18264229952', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (59, '王成凤', '2022611012057', '数学与计算机科学学院', '', NULL, '15864434192', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (60, '魏静', '2022811012061', '数学与计算机科学学院', '', NULL, '18678050975', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (61, '刘正丰', '2022611011040', '数学与计算机科学学院', '', NULL, '13012458029', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (62, '朱奕锟', '2022611012085', '数学与计算机科学学院', '', NULL, '15356181931', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (63, '刘海龙', '2022611011038', '数学与计算机科学学院', '', NULL, '17861900302', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (64, '张妙妙', '2022611012073', '数学与计算机科学学院', '', NULL, '15067514042', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (65, '高飞鹏', '2022611011017', '数学与计算机科学学院', '', NULL, '15868827385', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (66, '陈懿', '2022611012007', '数学与计算机科学学院', '', NULL, '19305852621', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (67, '吕旭煌', '2022611011041', '数学与计算机科学学院', '', NULL, '19817435400', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (68, '苏新元', '2022611011054', '数学与计算机科学学院', '', NULL, '13868381118', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (69, '蔡行行', '2022611011002', '数学与计算机科学学院', '', NULL, '15549418810', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (70, '祝望进', '2022611011086', '数学与计算机科学学院', '', NULL, '18357461120', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (71, '钟康源', '2022611011083', '数学与计算机科学学院', '', NULL, '18967517805', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (72, '金啸辰', '2022611011029', '数学与计算机科学学院', '', NULL, '13757334803', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (73, '杨彦鹏', '2022611011064', '数学与计算机科学学院', '', NULL, '13754323200', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (74, '钮俊奇', '2022611011045', '数学与计算机科学学院', '', NULL, '17858142713', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (75, '余国春', '2022611011068', '数学与计算机科学学院', '', NULL, '19805657823', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (76, '胡宇阔', '2022811011025', '数学与计算机科学学院', '', NULL, '15005784297', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (77, '陈婷', '2022611012005', '数学与计算机科学学院', '', NULL, '15395781575', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (78, '吴志威', '2022611011063', '数学与计算机科学学院', '', NULL, '18067148124', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (79, '郑明伟', '2022611011080', '数学与计算机科学学院', '', NULL, '15990690621', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (80, '胡淇钧', '2022611011023', '数学与计算机科学学院', '', NULL, '13750906531', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (81, '冯玲霞', '2022611012015', '数学与计算机科学学院', '', NULL, '18167063279', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (82, '林董静', '2022611012037', '数学与计算机科学学院', '', NULL, '13216573506', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (83, '赵科杰', '2022611011078', '数学与计算机科学学院', '', NULL, '17605848344', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (84, '苏信通', '2022611011055', '数学与计算机科学学院', '', NULL, '18969799589', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (85, '余寿杰\r\n', '2022611011069', '数学与计算机科学学院', '', NULL, '13656658551', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (101, '黄雷君', '20100005', NULL, NULL, NULL, '13706506169', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (102, '顾清', '20212241', NULL, NULL, NULL, '18058762449', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (103, '胡军国', '20010056', NULL, NULL, NULL, '13758291023', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (104, '徐爱俊', '20020023', NULL, NULL, NULL, '13868024658', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (105, '楼雄伟', '20030074', NULL, NULL, NULL, '13588228755', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (106, '莫路锋', '20040093', NULL, NULL, NULL, '13868019133', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (107, '吴达胜', '19940019', NULL, NULL, NULL, '13968023105', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (108, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (109, '胡彦蓉', '20160017', NULL, NULL, NULL, '18506827867', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (110, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (111, '徐爱俊', '20020023', NULL, NULL, NULL, '13868024658', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (112, '徐达宇', '20140021', NULL, NULL, NULL, '15968118425', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (113, '曾松伟', '19970017', NULL, NULL, NULL, '13758280718', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (114, '叶宏宝', '20212340', NULL, NULL, NULL, '13588734927', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (115, '莫路锋', '20040093', NULL, NULL, NULL, '13868019133', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (116, '夏芳', '20200016', NULL, NULL, NULL, '13957150104', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (117, '胡军国', '20010056', NULL, NULL, NULL, '13758291023', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (118, '楼雄伟', '20030074', NULL, NULL, NULL, '13588228755', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (119, '阮耀平', '20182018', NULL, NULL, NULL, '13506818858', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (120, '吴剑', '20140063', NULL, NULL, NULL, '13735550460', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (121, '郑辛煜', '20180011', NULL, NULL, NULL, '13735557675', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (122, '杜晓晨', '20060031', NULL, NULL, NULL, '13685773166', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (123, '戴丹', '20010093', NULL, NULL, NULL, '13588228916', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (124, '莫路锋', '20040093', NULL, NULL, NULL, '13868019133', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (125, '童孟军', '20130035', NULL, NULL, NULL, '18668195217', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (126, '楼雄伟', '20030074', NULL, NULL, NULL, '13588228755', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (127, '刘洪久', '20160016', NULL, NULL, NULL, '18758041587', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (128, '方陆明', '19820004', NULL, NULL, NULL, '18968156768', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (129, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (130, '戴丹', '20010093', NULL, NULL, NULL, '13588228916', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (131, '易晓梅', '20020081', NULL, NULL, NULL, '13758295296', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (132, '夏凯', '20050050', NULL, NULL, NULL, '13336010699', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (133, '汪杭军', '19970016', NULL, NULL, NULL, '18958169169', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (134, '吴达胜', '19940019', NULL, NULL, NULL, '13968023105', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (135, '胡彦蓉', '20160017', NULL, NULL, NULL, '18506827867', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (136, '曾松伟', '19970017', NULL, NULL, NULL, '13758280718', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (137, '李颜娥', '20190082', NULL, NULL, NULL, '13989833848', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (138, '胡彦蓉', '20160017', NULL, NULL, NULL, '18506827867', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (139, '吴达胜', '19940019', NULL, NULL, NULL, '13968023105', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (140, '孔汶汶', '20150016', NULL, NULL, NULL, '18072861096', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (141, '周厚奎', '20060024', NULL, NULL, NULL, '18058419618', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (142, '戴丹', '20010093', NULL, NULL, NULL, '13588228916', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (143, '刘洪久', '20160016', NULL, NULL, NULL, '18758041587', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (144, '李剑', '20070079', NULL, NULL, NULL, '13018903800', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (145, '戴丹', '20010093', NULL, NULL, NULL, '13588228916', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (146, '徐流畅', '20200052', NULL, NULL, NULL, '15267057518', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (147, '徐爱俊', '20020023', NULL, NULL, NULL, '13868024658', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (148, '惠国华', '20150011', NULL, NULL, NULL, '13588015625', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (158, '孔汶汶', '20150016', NULL, NULL, NULL, '18072861096', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (160, '徐爱俊', '20020023', NULL, NULL, NULL, '13868024658', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (161, '李剑', '20070079', NULL, NULL, NULL, '13018903800', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (162, '董晨', '20160014', NULL, NULL, NULL, '15867180919', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (163, '阮耀平', '20182018', NULL, NULL, NULL, '13506818858', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (164, '徐达宇', '20140021', NULL, NULL, NULL, '15968118425', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (165, '刘洪久', '20160016', NULL, NULL, NULL, '18758041587', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (166, '李颜娥', '20190082', NULL, NULL, NULL, '13989833848', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (167, '夏凯', '20050050', NULL, NULL, NULL, '13336010699', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (168, '李颜娥', '20190082', NULL, NULL, NULL, '13989833848', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (169, '刘洪久', '20160016', NULL, NULL, NULL, '18758041587', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (170, '胡军国', '20010056', NULL, NULL, NULL, '13758291023', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (171, '刘洪久', '20160016', NULL, NULL, NULL, '18758041587', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (172, '吴鹏', '20020041', NULL, NULL, NULL, '13868016453', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (173, '吴剑', '20140063', NULL, NULL, NULL, '13735550460', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (174, '杨洁', '20180019', NULL, NULL, NULL, '18457588266', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (175, '杨垠晖', '20170045', NULL, NULL, NULL, '13732297585', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (176, '胡军国', '20010056', NULL, NULL, NULL, '13758291023', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (177, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (178, '胡军国', '20010056', NULL, NULL, NULL, '13758291023', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (179, '夏凯', '20050050', NULL, NULL, NULL, '13336010699', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (180, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (181, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (182, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (183, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (184, '刘同存', '20190086', NULL, NULL, NULL, '18511897896', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (185, '刘同存', '20190086', NULL, NULL, NULL, '18511897896', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (186, '冯海林', '20070102', NULL, NULL, NULL, '13777368991', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (187, '胡军国', '20010056', NULL, NULL, NULL, '13758291023', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (188, '吴达胜', '19940019', NULL, NULL, NULL, '13968023105', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (189, '阮耀平', '20182018', NULL, NULL, NULL, '13506818858', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (190, '胡军国', '20010056', NULL, NULL, NULL, '13758291023', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (191, '吴剑', '20140063', NULL, NULL, NULL, '13735550460', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (192, '方陆明', '19820004', NULL, NULL, NULL, '18968156768', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (193, '陈文辉', '20030021', NULL, NULL, NULL, '13666639823', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (194, '杨垠晖', '20170045', NULL, NULL, NULL, '13732297585', NULL, '2');
INSERT INTO `stu_info_copy1` VALUES (201, '付志威', '2021611011002', NULL, NULL, NULL, '17354360027', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (202, '侯津京', '2021611011003', NULL, NULL, NULL, '15522921566', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (203, '冯源', '2021611011005', NULL, NULL, NULL, '18506850103', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (204, '冯财博', '2021611011006', NULL, NULL, NULL, '15936415254', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (205, '刘伟东', '2021611011007', NULL, NULL, NULL, '15205256704', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (206, '刘伟立', '2021611011008', NULL, NULL, NULL, '15552107700', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (207, '刘昊', '2021611011009', NULL, NULL, NULL, '13657964482', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (208, '吕力健', '2021611011012', NULL, NULL, NULL, '15156377565', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (209, '吕嘉铭', '2021611011013', NULL, NULL, NULL, '15968368464', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (210, '周通', '2021611011017', NULL, NULL, NULL, '15988282893', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (211, '夏众一', '2021611011018', NULL, NULL, NULL, '18360803786', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (212, '孙微海', '2021611011021', NULL, NULL, NULL, '19157923282', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (213, '孙麒淞', '2021611011022', NULL, NULL, NULL, '18346876069', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (214, '尹文杰', '2021611011023', NULL, NULL, NULL, '17851550231', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (215, '康浩愉', '2021611011024', NULL, NULL, NULL, '17326088655', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (216, '张明凯', '2021611011025', NULL, NULL, NULL, '15224255737', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (217, '张春磊', '2021611011026', NULL, NULL, NULL, '15306573682', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (218, '张金星', '2021611011027', NULL, NULL, NULL, '17326086078', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (219, '徐寅', '2021611011029', NULL, NULL, NULL, '15306572539', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (220, '徐金辉', '2021611011032', NULL, NULL, NULL, '15990188251', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (221, '方耿盛', '2021611011033', NULL, NULL, NULL, '13682753937', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (222, '施冰', '2021611011034', NULL, NULL, NULL, '18892688121', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (223, '朱宇浩', '2021611011035', NULL, NULL, NULL, '18757138490', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (224, '李尚阳', '2021611011038', NULL, NULL, NULL, '15397062275', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (225, '李波', '2021611011039', NULL, NULL, NULL, '17562472616', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (226, '李骋', '2021611011040', NULL, NULL, NULL, '18888715430', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (227, '林上钦', '2021611011041', NULL, NULL, NULL, '18158661902', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (228, '楼晓俊', '2021611011043', NULL, NULL, NULL, '15356178707', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (229, '沈家辉', '2021611011046', NULL, NULL, NULL, '15058148833', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (230, '潘辰昕', '2021611011047', NULL, NULL, NULL, '17757582239', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (231, '王东东', '2021611011048', NULL, NULL, NULL, '13191038460', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (232, '王广科', '2021611011051', NULL, NULL, NULL, '15990172910', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (233, '程嘉瑜', '2021611011057', NULL, NULL, NULL, '13167180853', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (234, '罗文显', '2021611011058', NULL, NULL, NULL, '15079702937', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (235, '范坤', '2021611011059', NULL, NULL, NULL, '19550178551', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (236, '范胜杭', '2021611011060', NULL, NULL, NULL, '15867171749', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (237, '董煌滔', '2021611011061', NULL, NULL, NULL, '13757138070', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (238, '袁煜博', '2021611011063', NULL, NULL, NULL, '13379060960', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (239, '谢荣倡', '2021611011064', NULL, NULL, NULL, '13763919769', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (240, '赖煌', '2021611011065', NULL, NULL, NULL, '18870489698', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (241, '郭文杰', '2021611011067', NULL, NULL, NULL, '15356181665', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (242, '郭旭东', '2021611011068', NULL, NULL, NULL, '17326088278', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (243, '金京', '2021611011069', NULL, NULL, NULL, '19157738617', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (244, '金晨', '2021611011070', NULL, NULL, NULL, '17326082867', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (245, '钟意', '2021611011071', NULL, NULL, NULL, '18692186570', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (246, '陈佳豪', '2021611011073', NULL, NULL, NULL, '19157923680', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (247, '陈威', '2021611011074', NULL, NULL, NULL, '18671657580', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (248, '陈罕宇', '2021611011075', NULL, NULL, NULL, '17858153856', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (249, '陈雨博', '2021611011076', NULL, NULL, NULL, '18858576105', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (250, '鲁承浩', '2021611011079', NULL, NULL, NULL, '15968151632', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (251, '黄志杰', '2021611011080', NULL, NULL, NULL, '13847844506', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (252, '黄炯炯', '2021611011081', NULL, NULL, NULL, '15990186990', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (253, '龚宇浩', '2021611011082', NULL, NULL, NULL, '18789371733', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (254, '丁鋆', '2021611012001', NULL, NULL, NULL, '19157925396', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (255, '俞淑燕', '2021611012004', NULL, NULL, NULL, '19157922931', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (256, '吴珊', '2021611012014', NULL, NULL, NULL, '13735315050', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (257, '周怡银', '2021611012015', NULL, NULL, NULL, '19157925990', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (258, '周月', '2021611012016', NULL, NULL, NULL, '19550178573', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (259, '姜彤', '2021611012020', NULL, NULL, NULL, '13967635370', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (260, '张靖渝', '2021611012028', NULL, NULL, NULL, '18232178682', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (261, '朱润青', '2021611012036', NULL, NULL, NULL, '17326085377', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (262, '柯晨晨', '2021611012042', NULL, NULL, NULL, '18968027469', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (263, '王娇萍', '2021611012050', NULL, NULL, NULL, '15258827342', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (264, '王思阳', '2021611012052', NULL, NULL, NULL, '17857332722', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (265, '王雨莹', '2021611012054', NULL, NULL, NULL, '13819668070', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (267, '王颖', '2021611012055', NULL, NULL, NULL, '13932450334', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (268, '薛悦平', '2021611012062', NULL, NULL, NULL, '13362361815', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (269, '赵欢欢', '2021611012066', NULL, NULL, NULL, '17767061965', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (270, '钱梦婷', '2021611012072', NULL, NULL, NULL, '19157923865', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (271, '高叶凡', '2021611012077', NULL, NULL, NULL, '15162808679', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (272, '鲁嘉滢', '2021611012078', NULL, NULL, NULL, '15925865352', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (273, '徐磊', '2021811011031', NULL, NULL, NULL, '15995827444', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (274, '朱锋', '2021811011037', NULL, NULL, NULL, '13588432907', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (275, '毛华敏', '2021811011044', NULL, NULL, NULL, '13606503331', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (276, '江会权', '2021811011045', NULL, NULL, NULL, '18321212424', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (277, '王声亮', '2021811011049', NULL, NULL, NULL, '13301611102', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (278, '徐小燕', '2021811012030', NULL, NULL, NULL, '17816853049', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (279, '王莲', '2021811012053', NULL, NULL, NULL, '15380890107', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (280, '卢炜凌', '2021611011010', NULL, NULL, NULL, '15757135987', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (281, '古海博', '2021611011011', NULL, NULL, NULL, '18736643215', NULL, '1');
INSERT INTO `stu_info_copy1` VALUES (282, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_info_copy1` VALUES (283, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_info_copy1` VALUES (284, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_info_copy1` VALUES (285, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_info_copy1` VALUES (286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_info_copy1` VALUES (287, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_info_copy1` VALUES (288, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_info_copy1` VALUES (289, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_info_copy1` VALUES (290, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for submit
-- ----------------------------
DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投稿人',
  `contents` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投稿内容',
  `fromname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of submit
-- ----------------------------
INSERT INTO `submit` VALUES (6, '刘正丰', '我的经验', '我的sci5', '大论文');
INSERT INTO `submit` VALUES (8, '刘正丰', '我的经验', '我的sci7', '大论文');
INSERT INTO `submit` VALUES (9, '刘正丰', '我的经验', '我的sci8', '大论文');

-- ----------------------------
-- Table structure for suggest
-- ----------------------------
DROP TABLE IF EXISTS `suggest`;
CREATE TABLE `suggest`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 783736859 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suggest
-- ----------------------------
INSERT INTO `suggest` VALUES (783736836, '阿斯顿撒旦权威的请问权威的请问', '2023-03-09 17:02:43');
INSERT INTO `suggest` VALUES (783736837, '阿斯顿撒旦权威的请问权威的请问', '2023-03-09 17:02:43');
INSERT INTO `suggest` VALUES (783736838, '的撒旦撒请问的期望', '2023-03-09 17:06:15');
INSERT INTO `suggest` VALUES (783736839, '33121231', '2023-03-09 17:11:34');
INSERT INTO `suggest` VALUES (783736840, '323123', '2023-03-09 17:15:23');
INSERT INTO `suggest` VALUES (783736841, '12321', '2023-03-09 17:25:28');
INSERT INTO `suggest` VALUES (783736842, '213123113213213213123213123', '2023-03-09 17:30:43');
INSERT INTO `suggest` VALUES (783736843, '21423424', '2023-03-09 17:34:49');
INSERT INTO `suggest` VALUES (783736844, '21312', '2023-03-09 17:47:55');
INSERT INTO `suggest` VALUES (783736845, '12312321312312', '2023-03-09 17:48:33');
INSERT INTO `suggest` VALUES (783736846, '321323213', '2023-03-09 18:46:12');
INSERT INTO `suggest` VALUES (783736847, '12321123', '2023-03-12 18:42:12');
INSERT INTO `suggest` VALUES (783736848, '123213', '2023-03-12 20:23:04');
INSERT INTO `suggest` VALUES (783736849, '2222', '2023-03-12 20:25:35');
INSERT INTO `suggest` VALUES (783736850, '2345646', '2023-03-12 20:25:53');
INSERT INTO `suggest` VALUES (783736851, '11', '2023-03-25 22:43:32');
INSERT INTO `suggest` VALUES (783736852, '123', '2023-03-26 11:02:09');
INSERT INTO `suggest` VALUES (783736853, '1111', '2023-03-26 11:02:58');
INSERT INTO `suggest` VALUES (783736854, '2131', '2023-03-31 15:14:17');
INSERT INTO `suggest` VALUES (783736855, '32131321', '2023-03-31 16:17:41');
INSERT INTO `suggest` VALUES (783736856, '就会有', '2023-03-31 16:18:42');
INSERT INTO `suggest` VALUES (783736857, '213213', '2023-03-31 16:49:26');
INSERT INTO `suggest` VALUES (783736858, '123', '2023-04-01 13:34:19');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理端：权限菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '用户管理', '用户管理', '/page/end/info.html', 'info');
INSERT INTO `t_permission` VALUES (2, '角色管理', '角色管理', '/page/end/role.html', 'role');
INSERT INTO `t_permission` VALUES (3, '权限管理', '权限管理', '/page/end/permission.html', 'permission');
INSERT INTO `t_permission` VALUES (4, '论文管理', '论文管理', '/page/end/upfile.html', 'upfile');
INSERT INTO `t_permission` VALUES (16, '每日一报', '每日一报', '/page/end/report.html', 'report');
INSERT INTO `t_permission` VALUES (19, '每日打卡', '每日打卡', '/page/end/daka.html', 'daka');
INSERT INTO `t_permission` VALUES (27, '导师学生', '导师学生', '/page/end/teastu.html', 'teastu');
INSERT INTO `t_permission` VALUES (28, '账号管理', '账号管理', '/page/end/user.html', 'user');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `permission` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理端：角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', '所有权限', '[{\"id\":2,\"name\":\"角色管理\",\"path\":\"/page/end/role.html\",\"description\":null,\"flag\":\"role\"},{\"id\":3,\"name\":\"权限管理\",\"path\":\"/page/end/permission.html\",\"description\":null,\"flag\":\"permission\"},{\"id\":4,\"name\":\"论文管理\",\"path\":\"/page/end/upfile.html\",\"description\":\"论文管理\",\"flag\":\"upfile\"},{\"id\":16,\"name\":\"每日一报\",\"path\":\"/page/end/report.html\",\"description\":\"每日一报\",\"flag\":\"report\"},{\"id\":19,\"name\":\"每日打卡\",\"path\":\"/page/end/daka.html\",\"description\":\"每日打卡\",\"flag\":\"daka\"},{\"id\":1,\"name\":\"用户管理\",\"path\":\"/page/end/info.html\",\"description\":\"用户管理\",\"flag\":\"info\"},{\"id\":27,\"name\":\"导师学生\",\"path\":\"/page/end/teastu.html\",\"description\":\"导师学生\",\"flag\":\"teastu\"},{\"id\":28,\"name\":\"账号管理\",\"path\":\"/page/end/user.html\",\"description\":\"账号管理\",\"flag\":\"user\"}]');
INSERT INTO `t_role` VALUES (3, '教师', '教师', '[{\"id\":10,\"name\":\"论文管理\",\"path\":\"/page/end/upfile.html\",\"description\":\"论文管理\",\"flag\":\"upfile\"}]');
INSERT INTO `t_role` VALUES (4, '学生', '学生', '[{\"id\":27,\"name\":\"导师学生\",\"path\":\"/page/end/teastu.html\",\"description\":\"导师学生\",\"flag\":\"teastu\"},{\"id\":1,\"name\":\"用户管理\",\"path\":\"/page/end/info.html\",\"description\":\"用户管理\",\"flag\":\"info\"}]');

-- ----------------------------
-- Table structure for t_s
-- ----------------------------
DROP TABLE IF EXISTS `t_s`;
CREATE TABLE `t_s`  (
  `t_id` int NOT NULL,
  `s_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_s
-- ----------------------------
INSERT INTO `t_s` VALUES (1, 123);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理端：用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', NULL, '19817435400', '1616271662008', '[{\"id\":1,\"name\":\"超级管理员\",\"description\":null,\"permission\":null}]', NULL, NULL);
INSERT INTO `t_user` VALUES (2, '吕旭煌', '123456', NULL, '111', NULL, '[{\"id\":4,\"name\":\"学生\",\"description\":\"学生\",\"permission\":[{\"id\":8,\"name\":\"论文管理\",\"path\":\"/page/end/upfile.html\",\"description\":\"论文管理\",\"flag\":\"upfile\"}]}]', NULL, NULL);
INSERT INTO `t_user` VALUES (3, '教师11', '123456', NULL, NULL, NULL, '[{\"id\":3,\"name\":\"教师\",\"description\":\"教师\",\"permission\":[{\"id\":8,\"name\":\"论文管理\",\"path\":\"/page/end/upfile.html\",\"description\":\"论文管理\",\"flag\":\"upfile\"},{\"id\":7,\"name\":\"每日一报\",\"path\":\"/page/end/report.html\",\"description\":\"每日一报\",\"flag\":\"report\"}]}]', NULL, NULL);
INSERT INTO `t_user` VALUES (4, 'lvxuhuang', '123456', '作者', '19817435400', NULL, '[{\"id\":4,\"name\":\"学生\",\"description\":\"学生\",\"permission\":[{\"id\":10,\"name\":\"论文管理\",\"path\":\"/page/end/upfile.html\",\"description\":\"论文管理\",\"flag\":\"upfile\"}]}]', NULL, NULL);
INSERT INTO `t_user` VALUES (5, '112233', '112233', '111', '111', '111', '[{\"id\":4,\"name\":\"学生\",\"description\":\"学生\",\"permission\":[{\"id\":27,\"name\":\"导师学生\",\"path\":\"/page/end/teastu.html\",\"description\":\"导师学生\",\"flag\":\"teastu\"},{\"id\":1,\"name\":\"用户管理\",\"path\":\"/page/end/info.html\",\"description\":\"用户管理\",\"flag\":\"info\"}]}]', NULL, NULL);

-- ----------------------------
-- Table structure for tb_files
-- ----------------------------
DROP TABLE IF EXISTS `tb_files`;
CREATE TABLE `tb_files`  (
  `id` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件ID',
  `target_id` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '目标对象ID',
  `file_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件位置',
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '原始文件名',
  `suffix` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `delete_status` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理端：文件（论文）上传下载' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_files
-- ----------------------------
INSERT INTO `tb_files` VALUES ('58adf8f8b946bba38946e95a7184aefd', NULL, 'JS学习.docx', 'JS学习.docx', 'docx', '2023-03-28 16:09:13', '2023-03-28 16:09:13', 0);
INSERT INTO `tb_files` VALUES ('80c03f709e03c22796f3406cf1fa7fc7', NULL, 'VUE学习.docx', 'VUE学习.docx', 'docx', '2023-03-28 16:09:12', '2023-03-28 16:09:12', 0);
INSERT INTO `tb_files` VALUES ('80fe8a9cba44918cf57488faae818164', NULL, '新建 文本文档.txt', '新建 文本文档.txt', 'txt', '2023-04-13 16:37:44', '2023-04-13 16:37:44', 0);

-- ----------------------------
-- Table structure for tea_stu
-- ----------------------------
DROP TABLE IF EXISTS `tea_stu`;
CREATE TABLE `tea_stu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生名',
  `tname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '导师名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tea_stu
-- ----------------------------
INSERT INTO `tea_stu` VALUES (1, '陈冰雨', '黄雷君');
INSERT INTO `tea_stu` VALUES (2, '李彤', '顾清');
INSERT INTO `tea_stu` VALUES (3, '韩康来', '胡军国');
INSERT INTO `tea_stu` VALUES (4, '尹朝阳', '徐爱俊');
INSERT INTO `tea_stu` VALUES (5, '张煊爽', '楼雄伟');
INSERT INTO `tea_stu` VALUES (6, '桑晨浩', '莫路锋');
INSERT INTO `tea_stu` VALUES (7, '张昕彤', '吴达胜');
INSERT INTO `tea_stu` VALUES (8, '常乐', '冯海林');
INSERT INTO `tea_stu` VALUES (9, '马纯馨', '胡彦蓉');
INSERT INTO `tea_stu` VALUES (10, '梁俊杰', '冯海林');
INSERT INTO `tea_stu` VALUES (11, '郝瑾艺', '徐爱俊');
INSERT INTO `tea_stu` VALUES (12, '马聪丽', '徐达宇');
INSERT INTO `tea_stu` VALUES (13, '李启鹏', '曾松伟');
INSERT INTO `tea_stu` VALUES (14, '邵伟', '叶宏宝');
INSERT INTO `tea_stu` VALUES (15, '崔欣雨', '莫路锋');
INSERT INTO `tea_stu` VALUES (18, '陈馨', '夏芳');
INSERT INTO `tea_stu` VALUES (19, '杜栖钰', '胡军国');
INSERT INTO `tea_stu` VALUES (20, '马帅', '楼雄伟');
INSERT INTO `tea_stu` VALUES (21, '姚琴娟', '阮耀平');
INSERT INTO `tea_stu` VALUES (22, '沈蓝欣', '吴剑');
INSERT INTO `tea_stu` VALUES (23, '濮胜伟', '郑辛煜');
INSERT INTO `tea_stu` VALUES (24, '宋帅', '杜晓晨');
INSERT INTO `tea_stu` VALUES (25, '张帅杰', '戴丹');
INSERT INTO `tea_stu` VALUES (26, '苏航', '莫路锋');
INSERT INTO `tea_stu` VALUES (27, '吴婷婷', '童孟军');
INSERT INTO `tea_stu` VALUES (28, '刘霜', '楼雄伟');
INSERT INTO `tea_stu` VALUES (29, '王永祥', '刘洪久');
INSERT INTO `tea_stu` VALUES (30, '王杰', '方陆明');
INSERT INTO `tea_stu` VALUES (31, '宋悦', '冯海林');
INSERT INTO `tea_stu` VALUES (32, '李艳宏', '戴丹');
INSERT INTO `tea_stu` VALUES (33, '黄帮俊', '易晓梅');
INSERT INTO `tea_stu` VALUES (34, '张枫伟', '夏凯');
INSERT INTO `tea_stu` VALUES (35, '方浩远', '汪杭军');
INSERT INTO `tea_stu` VALUES (36, '方斌', '吴达胜');
INSERT INTO `tea_stu` VALUES (37, '郑世安', '胡彦蓉');
INSERT INTO `tea_stu` VALUES (38, '鲍高宏', '曾松伟');
INSERT INTO `tea_stu` VALUES (39, '胡云昊', '李颜娥');
INSERT INTO `tea_stu` VALUES (40, '王雅洁', '胡彦蓉');
INSERT INTO `tea_stu` VALUES (41, '何磊', '吴达胜');
INSERT INTO `tea_stu` VALUES (42, '余喆', '孔汶汶');
INSERT INTO `tea_stu` VALUES (43, '丁奇沣', '周厚奎');
INSERT INTO `tea_stu` VALUES (44, '梁子乐', '戴丹');
INSERT INTO `tea_stu` VALUES (45, '章志欣', '刘洪久');
INSERT INTO `tea_stu` VALUES (46, '单凌啸', '李剑');
INSERT INTO `tea_stu` VALUES (47, '张嘉俊', '戴丹');
INSERT INTO `tea_stu` VALUES (48, '姚俊伟', '徐流畅');
INSERT INTO `tea_stu` VALUES (49, '梁梓源', '徐爱俊');
INSERT INTO `tea_stu` VALUES (50, '周炜翔', '惠国华');
INSERT INTO `tea_stu` VALUES (51, '陶征宇', '孔汶汶');
INSERT INTO `tea_stu` VALUES (52, '沈域', '徐爱俊');
INSERT INTO `tea_stu` VALUES (53, '赵泽雨', '李剑');
INSERT INTO `tea_stu` VALUES (54, '高威芳', '董晨');
INSERT INTO `tea_stu` VALUES (55, '郭礼俊', '阮耀平');
INSERT INTO `tea_stu` VALUES (56, '祝心雨', '徐达宇');
INSERT INTO `tea_stu` VALUES (57, '李兴隆', '刘洪久');
INSERT INTO `tea_stu` VALUES (58, '陈志超', '李颜娥');
INSERT INTO `tea_stu` VALUES (59, '郑哲', '夏凯');
INSERT INTO `tea_stu` VALUES (60, '王成凤', '李颜娥');
INSERT INTO `tea_stu` VALUES (62, '魏静', '刘洪久');
INSERT INTO `tea_stu` VALUES (63, '刘正丰', '胡军国');
INSERT INTO `tea_stu` VALUES (64, '朱奕锟', '刘洪久');
INSERT INTO `tea_stu` VALUES (65, '刘海龙', '吴鹏');
INSERT INTO `tea_stu` VALUES (66, '张妙妙', '吴剑');
INSERT INTO `tea_stu` VALUES (67, '高飞鹏', '杨洁');
INSERT INTO `tea_stu` VALUES (68, '陈懿', '杨垠晖');
INSERT INTO `tea_stu` VALUES (69, '吕旭煌', '胡军国');
INSERT INTO `tea_stu` VALUES (70, '苏新元', '冯海林');
INSERT INTO `tea_stu` VALUES (71, '蔡行行', '胡军国');
INSERT INTO `tea_stu` VALUES (72, '祝望进', '夏凯');
INSERT INTO `tea_stu` VALUES (73, '钟康源', '冯海林');
INSERT INTO `tea_stu` VALUES (74, '金啸辰', '冯海林');
INSERT INTO `tea_stu` VALUES (75, '杨彦鹏', '冯海林');
INSERT INTO `tea_stu` VALUES (76, '钮俊奇', '冯海林');
INSERT INTO `tea_stu` VALUES (77, '余国春', '刘同存');
INSERT INTO `tea_stu` VALUES (78, '胡宇阔', '刘同存');
INSERT INTO `tea_stu` VALUES (79, '陈婷', '冯海林');
INSERT INTO `tea_stu` VALUES (80, '吴志威', '胡军国');
INSERT INTO `tea_stu` VALUES (81, '郑明伟', '吴达胜');
INSERT INTO `tea_stu` VALUES (82, '胡淇钧', '阮耀平');
INSERT INTO `tea_stu` VALUES (83, '冯玲霞', '胡军国');
INSERT INTO `tea_stu` VALUES (84, '林董静', '吴剑');
INSERT INTO `tea_stu` VALUES (85, '赵科杰', '方陆明');
INSERT INTO `tea_stu` VALUES (86, '苏信通', '陈文辉');
INSERT INTO `tea_stu` VALUES (87, '余寿杰', '杨垠晖');
INSERT INTO `tea_stu` VALUES (88, '付志威', '楼雄伟');
INSERT INTO `tea_stu` VALUES (89, '侯津京', '周厚奎');
INSERT INTO `tea_stu` VALUES (90, '冯源', '夏凯');
INSERT INTO `tea_stu` VALUES (91, '冯财博', '胡军国');
INSERT INTO `tea_stu` VALUES (92, '刘伟东', '徐爱俊');
INSERT INTO `tea_stu` VALUES (93, '刘伟立', '惠国华');
INSERT INTO `tea_stu` VALUES (94, '刘昊', '方陆明');
INSERT INTO `tea_stu` VALUES (95, '吕力健', '叶宏宝');
INSERT INTO `tea_stu` VALUES (96, '吕嘉铭', '徐达宇');
INSERT INTO `tea_stu` VALUES (97, '周通', '冯海林');
INSERT INTO `tea_stu` VALUES (98, '夏众一', '周厚奎');
INSERT INTO `tea_stu` VALUES (99, '孙微海', '阮耀平');
INSERT INTO `tea_stu` VALUES (100, '孙麒淞', '胡军国');
INSERT INTO `tea_stu` VALUES (101, '尹文杰', '胡军国');
INSERT INTO `tea_stu` VALUES (103, '康浩愉', '戴丹');
INSERT INTO `tea_stu` VALUES (104, '张明凯', '胡军国');
INSERT INTO `tea_stu` VALUES (105, '张春磊', '阮耀平');
INSERT INTO `tea_stu` VALUES (106, '张金星', '吴剑');
INSERT INTO `tea_stu` VALUES (107, '徐寅', '曾松伟');
INSERT INTO `tea_stu` VALUES (108, '徐金辉', '曾松伟');
INSERT INTO `tea_stu` VALUES (109, '方耿盛', '方陆明');
INSERT INTO `tea_stu` VALUES (110, '施冰', '莫路锋');
INSERT INTO `tea_stu` VALUES (111, '朱宇浩', '童孟军');
INSERT INTO `tea_stu` VALUES (112, '李尚阳', '方陆明');
INSERT INTO `tea_stu` VALUES (113, '李波', '阮耀平');
INSERT INTO `tea_stu` VALUES (114, '李骋', '夏凯');
INSERT INTO `tea_stu` VALUES (115, '林上钦', '吴达胜');
INSERT INTO `tea_stu` VALUES (116, '楼晓俊', '李剑');
INSERT INTO `tea_stu` VALUES (117, '沈家辉', '楼雄伟');
INSERT INTO `tea_stu` VALUES (118, '潘辰昕', '胡军国');
INSERT INTO `tea_stu` VALUES (119, '王东东', '戴丹');
INSERT INTO `tea_stu` VALUES (120, '王广科', '吴达胜');
INSERT INTO `tea_stu` VALUES (121, '程嘉瑜', '顾清');
INSERT INTO `tea_stu` VALUES (122, '罗文显', '黄雷君');
INSERT INTO `tea_stu` VALUES (123, '范坤', '刘洪久');
INSERT INTO `tea_stu` VALUES (124, '范胜杭', '李剑');
INSERT INTO `tea_stu` VALUES (125, '董煌滔', '孔汶汶');
INSERT INTO `tea_stu` VALUES (126, '袁煜博', '戴丹');
INSERT INTO `tea_stu` VALUES (127, '谢荣倡', '莫路锋');
INSERT INTO `tea_stu` VALUES (128, '赖煌', '杨垠晖');
INSERT INTO `tea_stu` VALUES (129, '郭文杰', '黄雷君');
INSERT INTO `tea_stu` VALUES (130, '郭旭东', '胡军国');
INSERT INTO `tea_stu` VALUES (131, '金京', '冯海林');
INSERT INTO `tea_stu` VALUES (132, '金晨', '吴达胜');
INSERT INTO `tea_stu` VALUES (133, '钟意', '童孟军');
INSERT INTO `tea_stu` VALUES (134, '陈佳豪', '莫路锋');
INSERT INTO `tea_stu` VALUES (135, '陈威', '张小斌');
INSERT INTO `tea_stu` VALUES (136, '陈罕宇', '易晓梅');
INSERT INTO `tea_stu` VALUES (137, '陈雨博', '冯海林');
INSERT INTO `tea_stu` VALUES (138, '鲁承浩', '吴剑');
INSERT INTO `tea_stu` VALUES (139, '黄志杰', '徐爱俊');
INSERT INTO `tea_stu` VALUES (140, '黄炯炯', '刘洪久');
INSERT INTO `tea_stu` VALUES (141, '龚宇浩', '胡彦蓉');
INSERT INTO `tea_stu` VALUES (142, '丁鋆', '徐爱俊');
INSERT INTO `tea_stu` VALUES (143, '俞淑燕', '杜晓晨');
INSERT INTO `tea_stu` VALUES (144, '吴珊', '汪杭军');
INSERT INTO `tea_stu` VALUES (145, '周怡银', '胡彦蓉');
INSERT INTO `tea_stu` VALUES (146, '周月', '易晓梅');
INSERT INTO `tea_stu` VALUES (147, '姜彤', '吴剑');
INSERT INTO `tea_stu` VALUES (148, '张靖渝', '惠国华');
INSERT INTO `tea_stu` VALUES (149, '朱润青', '刘洪久');
INSERT INTO `tea_stu` VALUES (150, '柯晨晨', '冯海林');
INSERT INTO `tea_stu` VALUES (151, '王娇萍', '易晓梅');
INSERT INTO `tea_stu` VALUES (152, '王思阳', '吴达胜');
INSERT INTO `tea_stu` VALUES (153, '王雨莹', '曾松伟');
INSERT INTO `tea_stu` VALUES (154, '王颖', '李颜娥');
INSERT INTO `tea_stu` VALUES (155, '薛悦平', '胡彦蓉');
INSERT INTO `tea_stu` VALUES (156, '赵欢欢', '冯海林');
INSERT INTO `tea_stu` VALUES (157, '钱梦婷', '徐达宇');
INSERT INTO `tea_stu` VALUES (158, '高叶凡', '徐达宇');
INSERT INTO `tea_stu` VALUES (159, '鲁嘉滢', '曾松伟');
INSERT INTO `tea_stu` VALUES (160, '徐磊', '冯海林');
INSERT INTO `tea_stu` VALUES (161, '朱锋', '孔汶汶');
INSERT INTO `tea_stu` VALUES (162, '毛华敏', '徐爱俊');
INSERT INTO `tea_stu` VALUES (163, '江会权', '徐爱俊');
INSERT INTO `tea_stu` VALUES (164, '王声亮', '易晓梅');
INSERT INTO `tea_stu` VALUES (165, '徐小燕', '方陆明');
INSERT INTO `tea_stu` VALUES (166, '王莲', '楼雄伟');
INSERT INTO `tea_stu` VALUES (167, '卢炜凌', '汪杭军');
INSERT INTO `tea_stu` VALUES (168, '古海博', '李颜娥');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tea_id` int NOT NULL,
  `tea_name` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`tea_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for teacher_re
-- ----------------------------
DROP TABLE IF EXISTS `teacher_re`;
CREATE TABLE `teacher_re`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '随手拍id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '听课人',
  `number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '学号',
  `teachername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `course` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间',
  `imgname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '照片',
  `imgpath` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1773842434 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_re
-- ----------------------------

-- ----------------------------
-- Table structure for teacher_report
-- ----------------------------
DROP TABLE IF EXISTS `teacher_report`;
CREATE TABLE `teacher_report`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '随手拍id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '听课人',
  `number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '学号',
  `teachername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `course` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2139176963 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_report
-- ----------------------------
INSERT INTO `teacher_report` VALUES (-1514061822, '测试', '1234', '123213312', '农业设施技术', '123213', '2022-12-11 20:12:17');
INSERT INTO `teacher_report` VALUES (-1484701695, '测试', '1234', '1615', '农业设施技术', '16151', '2022-12-11 20:49:43');
INSERT INTO `teacher_report` VALUES (-1425981439, '测试', '1234', '21312', '农业设施技术', '123123', '2022-12-11 21:24:22');
INSERT INTO `teacher_report` VALUES (-1254014975, '吕旭煌', '2022611011041', '123', '农业设施技术', '123', '2022-12-12 17:07:33');
INSERT INTO `teacher_report` VALUES (-1090437118, '测试', '1234', '3213', '农业设施技术', '123312', '2022-12-11 20:23:46');
INSERT INTO `teacher_report` VALUES (-952025086, '测试', '1234', '白金卡', '农业设施技术', '和进攻机会', '2022-12-11 20:22:07');
INSERT INTO `teacher_report` VALUES (-855556095, '测试', '1234', '12321', '农业设施技术', '312321', '2022-12-11 20:16:40');
INSERT INTO `teacher_report` VALUES (-658423806, '测试', '1234', '12321', '农业设施技术', '312321', '2022-12-11 20:16:33');
INSERT INTO `teacher_report` VALUES (-436125695, '吕旭煌', '2022611011041', '123', '农业设施技术', '123', '2022-12-12 03:25:57');
INSERT INTO `teacher_report` VALUES (-71221246, '吕旭煌', '2022611011041', '111', '农村发展', '111', '2022-12-12 02:05:18');
INSERT INTO `teacher_report` VALUES (109133825, '测试', '1234', '23123', '马克思', '312312', '2022-12-11 20:22:59');
INSERT INTO `teacher_report` VALUES (520175618, '测试', '1234', '3122', '农业设施技术', '12321', '2022-12-11 21:06:20');
INSERT INTO `teacher_report` VALUES (985743362, '测试', '1234', '21231', '农业设施技术', '12321', '2022-12-11 21:16:59');
INSERT INTO `teacher_report` VALUES (1069629442, '吕旭煌', '2022611011041', '吉里吉里', '农业设施技术', '吉里吉里', '2022-12-12 01:44:18');
INSERT INTO `teacher_report` VALUES (1539391490, '千山', '2022611011042', '11', '农村发展', '111', '2022-12-12 01:25:15');
INSERT INTO `teacher_report` VALUES (1564557313, '测试', '1234', '123123', '农业设施技术', '123123', '2022-12-11 20:27:10');
INSERT INTO `teacher_report` VALUES (1665220609, '测试', '1234', '123213321', '马克思', '132213', '2022-12-11 20:12:54');
INSERT INTO `teacher_report` VALUES (1673609217, '吕旭煌', '2022611011041', '123123132', '农业设施技术', '123123', '2022-12-11 20:24:14');
INSERT INTO `teacher_report` VALUES (1686192130, '测试', '1234', '12312', '农业设施技术', '1221', '2022-12-11 20:26:03');
INSERT INTO `teacher_report` VALUES (1740718082, '测试', '1234', '如何和', '农业设施技术', '大姐', '2022-12-11 20:36:35');
INSERT INTO `teacher_report` VALUES (1807826945, '测试', '1234', '12321', '农业设施技术', '312321', '2022-12-11 20:20:28');
INSERT INTO `teacher_report` VALUES (1942044674, '吕旭煌', '2022611011041', '111', '农村发展', '111', '2022-12-12 02:05:18');
INSERT INTO `teacher_report` VALUES (2004959233, '测试', '1234', '3221', '农业设施技术', '2312112', '2022-12-11 21:16:36');
INSERT INTO `teacher_report` VALUES (2139176961, '吕旭煌', '2022611011041', '123123132', '农业设施技术', '123123', '2022-12-11 20:08:10');
INSERT INTO `teacher_report` VALUES (2139176962, '杜栖钰', '2022611011012', '杜栖钰', '农业设施技术', '', '2023-03-31 16:38:14');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名-学号',
  `open_id` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '小程序openid',
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '电话',
  `user_sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_login_time` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '最近登录时间',
  `code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学号',
  `union_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `garde` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2098147573 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户登录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2098147498, '韩康来', 'oQX7j5XulFxd7sSUsuKlac-QedSI', '17816880275 ', '男', '2023-03-26 16:48:16', '2022611011020', NULL, '1');
INSERT INTO `user` VALUES (2098147540, '吕旭煌', 'oQX7j5XktQt16H50RuOLSk-6QcNA', '19817435400', '男', '2023-04-08 18:27:46', '2022611011041', NULL, '2');
INSERT INTO `user` VALUES (2098147545, '蒋建鹏', 'oQX7j5XdUw8w9V6O_lXa2NNJms_k', '13166260802', '男', '2023-04-09 14:28:47', '3', NULL, '2');
INSERT INTO `user` VALUES (2098147546, '乐杨', 'oQX7j5eTOF-mnUVCLcVmr4uEaQM8', '13588779800', '男', '2023-04-15 17:19:18', '2020611011023', NULL, '1');
INSERT INTO `user` VALUES (2098147571, '刘正丰', 'oQX7j5f7qQsxN4OJ2zFPsPNjnyXs', '13012458029', '男', '2023-05-01 14:58:45', '2022611011040', NULL, '2');
INSERT INTO `user` VALUES (2098147572, '胡军国', 'oQX7j5f00b_eI5bZz7GsCW66jJy0', '13758291023', '男', '2023-05-03 11:36:32', '20010056', NULL, '2');

-- ----------------------------
-- Table structure for week_report
-- ----------------------------
DROP TABLE IF EXISTS `week_report`;
CREATE TABLE `week_report`  (
  `w_id` int NOT NULL AUTO_INCREMENT COMMENT '每日一报id',
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓名',
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学号',
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '每日一报内容',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `publish_time` datetime NOT NULL COMMENT '填报日期',
  `remarks` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `depart_id` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`w_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of week_report
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
