/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : timecontroller

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 06/05/2023 10:42:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_memory
-- ----------------------------
DROP TABLE IF EXISTS `app_memory`;
CREATE TABLE `app_memory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userAccount` int NULL DEFAULT NULL,
  `projectName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `timeLength` int NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `weekNumber` int NULL DEFAULT NULL,
  `submitTime` date NULL DEFAULT NULL,
  `leaderId` int NULL DEFAULT NULL,
  `saveTime` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_memory
-- ----------------------------
INSERT INTO `app_memory` VALUES (46, 2, '测试账号02', 4, '其他项目', '未审核', 2, '2023-05-05', 19, NULL);
INSERT INTO `app_memory` VALUES (48, 2, '测试项目002', 20, '主要项目', '已驳回', 2, '2023-05-05', 22, '2023-05-05');
INSERT INTO `app_memory` VALUES (49, 2, '一个测试项目', 3, '其他项目', '未审核', 2, '2023-05-05', 19, NULL);
INSERT INTO `app_memory` VALUES (71, 10099388, '测试项目002', 2, '主要项目', '未审核', 2, '2023-05-06', 22, '2023-05-02');
INSERT INTO `app_memory` VALUES (80, 10099388, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-06', 19, '2023-05-04');
INSERT INTO `app_memory` VALUES (83, 10099388, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-06', 19, '2023-05-01');
INSERT INTO `app_memory` VALUES (84, 10099388, '测试项目001', 2, '主要项目', '未审核', 2, '2023-05-06', 19, '2023-05-02');
INSERT INTO `app_memory` VALUES (85, 10099388, '测试项目001', 2, '主要项目', '未审核', 2, '2023-05-06', 19, '2023-05-03');
INSERT INTO `app_memory` VALUES (86, 10099388, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-06', 19, '2023-05-05');
INSERT INTO `app_memory` VALUES (87, 10099388, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-06', 19, '2023-05-06');
INSERT INTO `app_memory` VALUES (88, 10099388, '测试项目001', 2, '主要项目', '未审核', 2, '2023-05-06', 19, '2023-05-07');
INSERT INTO `app_memory` VALUES (103, 2, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-05', 19, '2023-05-01');
INSERT INTO `app_memory` VALUES (104, 2, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-05', 19, '2023-05-02');
INSERT INTO `app_memory` VALUES (105, 2, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-05', 19, '2023-05-03');
INSERT INTO `app_memory` VALUES (106, 2, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-05', 19, '2023-05-04');
INSERT INTO `app_memory` VALUES (107, 2, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-05', 19, '2023-05-05');
INSERT INTO `app_memory` VALUES (108, 2, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-05', 19, '2023-05-06');
INSERT INTO `app_memory` VALUES (109, 2, '测试项目001', 0, '主要项目', '未审核', 2, '2023-05-05', 19, '2023-05-07');
INSERT INTO `app_memory` VALUES (110, 2, '测试项目002', 0, '主要项目', '已驳回', 2, '2023-05-05', 22, '2023-05-01');
INSERT INTO `app_memory` VALUES (111, 2, '测试项目002', 6, '主要项目', '已驳回', 2, '2023-05-05', 22, '2023-05-02');
INSERT INTO `app_memory` VALUES (112, 2, '测试项目002', 4, '主要项目', '已驳回', 2, '2023-05-05', 22, '2023-05-03');
INSERT INTO `app_memory` VALUES (113, 2, '测试项目002', 10, '主要项目', '已驳回', 2, '2023-05-05', 22, '2023-05-04');
INSERT INTO `app_memory` VALUES (114, 2, '测试项目002', 20, '主要项目', '已驳回', 2, '2023-05-05', 22, '2023-05-06');
INSERT INTO `app_memory` VALUES (115, 2, '测试项目002', 2, '主要项目', '已驳回', 2, '2023-05-05', 22, '2023-05-07');
INSERT INTO `app_memory` VALUES (116, 10099388, '测试项目002', 0, '主要项目', '未审核', 2, '2023-05-06', 22, '2023-05-01');
INSERT INTO `app_memory` VALUES (117, 10099388, '测试项目002', 0, '主要项目', '未审核', 2, '2023-05-06', 22, '2023-05-03');
INSERT INTO `app_memory` VALUES (118, 10099388, '测试项目002', 0, '主要项目', '未审核', 2, '2023-05-06', 22, '2023-05-04');
INSERT INTO `app_memory` VALUES (119, 10099388, '测试项目002', 0, '主要项目', '未审核', 2, '2023-05-06', 22, '2023-05-05');
INSERT INTO `app_memory` VALUES (120, 10099388, '测试项目002', 0, '主要项目', '未审核', 2, '2023-05-06', 22, '2023-05-06');
INSERT INTO `app_memory` VALUES (121, 10099388, '测试项目002', 90, '主要项目', '未审核', 2, '2023-05-06', 22, '2023-05-07');
INSERT INTO `app_memory` VALUES (122, 4, '测试项目050506', 0, '主要项目', '已保存', 2, '2023-05-06', 22, '2023-05-01');
INSERT INTO `app_memory` VALUES (123, 4, '测试项目050506', 0, '主要项目', '已保存', 2, '2023-05-06', 22, '2023-05-02');
INSERT INTO `app_memory` VALUES (124, 4, '测试项目050506', 0, '主要项目', '已保存', 2, '2023-05-06', 22, '2023-05-03');
INSERT INTO `app_memory` VALUES (125, 4, '测试项目050506', 0, '主要项目', '已保存', 2, '2023-05-06', 22, '2023-05-04');
INSERT INTO `app_memory` VALUES (126, 4, '测试项目050506', 2, '主要项目', '已保存', 2, '2023-05-06', 22, '2023-05-05');
INSERT INTO `app_memory` VALUES (127, 4, '测试项目050506', 0, '主要项目', '已保存', 2, '2023-05-06', 22, '2023-05-06');
INSERT INTO `app_memory` VALUES (128, 4, '测试项目050506', 0, '主要项目', '已保存', 2, '2023-05-06', 22, '2023-05-07');
INSERT INTO `app_memory` VALUES (129, 10099388, '测试项目050506', 0, '主要项目', '已审核', 2, '2023-05-06', 22, '2023-05-01');
INSERT INTO `app_memory` VALUES (130, 10099388, '测试项目050506', 0, '主要项目', '已审核', 2, '2023-05-06', 22, '2023-05-02');
INSERT INTO `app_memory` VALUES (131, 10099388, '测试项目050506', 0, '主要项目', '已审核', 2, '2023-05-06', 22, '2023-05-03');
INSERT INTO `app_memory` VALUES (132, 10099388, '测试项目050506', 0, '主要项目', '已审核', 2, '2023-05-06', 22, '2023-05-04');
INSERT INTO `app_memory` VALUES (133, 10099388, '测试项目050506', 2, '主要项目', '已审核', 2, '2023-05-06', 22, '2023-05-05');
INSERT INTO `app_memory` VALUES (134, 10099388, '测试项目050506', 3, '主要项目', '已审核', 2, '2023-05-06', 22, '2023-05-06');
INSERT INTO `app_memory` VALUES (135, 10099388, '测试项目050506', 3, '主要项目', '已审核', 2, '2023-05-06', 22, '2023-05-07');

-- ----------------------------
-- Table structure for app_project
-- ----------------------------
DROP TABLE IF EXISTS `app_project`;
CREATE TABLE `app_project`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `leaderId` int NULL DEFAULT NULL,
  `numbering` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `leaderName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_project
-- ----------------------------
INSERT INTO `app_project` VALUES (6, '测试项目001', '主要项目', 19, 'CS001', '测试账号1-领导1');
INSERT INTO `app_project` VALUES (7, '测试项目002', '主要项目', 22, 'CS002', '测试账号2-领导2');
INSERT INTO `app_project` VALUES (8, '测试项目050506', '主要项目', 22, '测试项目0505', '测试账号2-领导2');

-- ----------------------------
-- Table structure for app_users
-- ----------------------------
DROP TABLE IF EXISTS `app_users`;
CREATE TABLE `app_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `apartment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `account` int NULL DEFAULT NULL,
  `password` int NULL DEFAULT NULL,
  `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `workAccount` int NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_users
-- ----------------------------
INSERT INTO `app_users` VALUES (1, 'admin', '主管部', 10099388, 10099388, NULL, 10099388, '2');
INSERT INTO `app_users` VALUES (19, '测试账号1-领导1', '技术部', 1, 1, '', 1, '1');
INSERT INTO `app_users` VALUES (20, '测试账号-员工1', '技术部', 2, 2, '19', 2, '0');
INSERT INTO `app_users` VALUES (21, '测试账号-员工2', '技术部', 3, 3, '19', 3, '0');
INSERT INTO `app_users` VALUES (22, '测试账号2-领导2', '市场部', 4, 4, '', 4, '1');
INSERT INTO `app_users` VALUES (23, '测试账号-员工3', '市场部', 5, 5, '22', 5, '0');
INSERT INTO `app_users` VALUES (24, '测试账号-员工4', '技术部', 101, 101, '19', 101, '0');

-- ----------------------------
-- Table structure for app_usertoproject
-- ----------------------------
DROP TABLE IF EXISTS `app_usertoproject`;
CREATE TABLE `app_usertoproject`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `projectId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_usertoproject
-- ----------------------------
INSERT INTO `app_usertoproject` VALUES (16, 20, 6);
INSERT INTO `app_usertoproject` VALUES (17, 21, 6);
INSERT INTO `app_usertoproject` VALUES (20, 20, 7);
INSERT INTO `app_usertoproject` VALUES (21, 23, 7);
INSERT INTO `app_usertoproject` VALUES (22, 1, 6);
INSERT INTO `app_usertoproject` VALUES (23, 1, 7);
INSERT INTO `app_usertoproject` VALUES (38, 1, 8);
INSERT INTO `app_usertoproject` VALUES (39, 22, 8);
INSERT INTO `app_usertoproject` VALUES (40, 23, 8);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add users', 7, 'add_users');
INSERT INTO `auth_permission` VALUES (26, 'Can change users', 7, 'change_users');
INSERT INTO `auth_permission` VALUES (27, 'Can delete users', 7, 'delete_users');
INSERT INTO `auth_permission` VALUES (28, 'Can view users', 7, 'view_users');
INSERT INTO `auth_permission` VALUES (29, 'Can add project', 8, 'add_project');
INSERT INTO `auth_permission` VALUES (30, 'Can change project', 8, 'change_project');
INSERT INTO `auth_permission` VALUES (31, 'Can delete project', 8, 'delete_project');
INSERT INTO `auth_permission` VALUES (32, 'Can view project', 8, 'view_project');
INSERT INTO `auth_permission` VALUES (33, 'Can add user to project', 9, 'add_usertoproject');
INSERT INTO `auth_permission` VALUES (34, 'Can change user to project', 9, 'change_usertoproject');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user to project', 9, 'delete_usertoproject');
INSERT INTO `auth_permission` VALUES (36, 'Can view user to project', 9, 'view_usertoproject');
INSERT INTO `auth_permission` VALUES (37, 'Can add memory', 10, 'add_memory');
INSERT INTO `auth_permission` VALUES (38, 'Can change memory', 10, 'change_memory');
INSERT INTO `auth_permission` VALUES (39, 'Can delete memory', 10, 'delete_memory');
INSERT INTO `auth_permission` VALUES (40, 'Can view memory', 10, 'view_memory');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (10, 'app', 'memory');
INSERT INTO `django_content_type` VALUES (8, 'app', 'project');
INSERT INTO `django_content_type` VALUES (7, 'app', 'users');
INSERT INTO `django_content_type` VALUES (9, 'app', 'usertoproject');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-04-27 09:02:44.352421');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-04-27 09:02:44.606856');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-04-27 09:02:44.668672');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-04-27 09:02:44.674642');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-27 09:02:44.679625');
INSERT INTO `django_migrations` VALUES (6, 'app', '0001_initial', '2023-04-27 09:02:44.691764');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2023-04-27 09:02:44.725608');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2023-04-27 09:02:44.749528');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2023-04-27 09:02:44.764478');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2023-04-27 09:02:44.770469');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2023-04-27 09:02:44.793390');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2023-04-27 09:02:44.797369');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2023-04-27 09:02:44.802359');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2023-04-27 09:02:44.827269');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2023-04-27 09:02:44.854182');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2023-04-27 09:02:44.865141');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2023-04-27 09:02:44.871122');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2023-04-27 09:02:44.898031');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2023-04-27 09:02:44.918077');
INSERT INTO `django_migrations` VALUES (20, 'app', '0002_users_leader_alter_users_account_and_more', '2023-04-29 03:18:01.572567');
INSERT INTO `django_migrations` VALUES (21, 'app', '0003_users_workaccount', '2023-04-29 03:21:27.762752');
INSERT INTO `django_migrations` VALUES (22, 'app', '0004_project_usertoproject_users_type_alter_users_id', '2023-04-30 08:33:21.047401');
INSERT INTO `django_migrations` VALUES (23, 'app', '0005_memory', '2023-04-30 08:41:48.539995');
INSERT INTO `django_migrations` VALUES (24, 'app', '0006_memory_weeknumber', '2023-04-30 08:45:52.999840');
INSERT INTO `django_migrations` VALUES (25, 'app', '0007_users_submittimt', '2023-05-02 07:59:29.836742');
INSERT INTO `django_migrations` VALUES (26, 'app', '0008_rename_submittimt_users_submittime', '2023-05-02 07:59:47.950326');
INSERT INTO `django_migrations` VALUES (27, 'app', '0009_remove_users_submittime_memory_submittime', '2023-05-02 08:05:17.448332');
INSERT INTO `django_migrations` VALUES (28, 'app', '0010_project_numbering', '2023-05-03 02:27:52.054131');
INSERT INTO `django_migrations` VALUES (29, 'app', '0011_project_leadername', '2023-05-03 02:33:32.768495');
INSERT INTO `django_migrations` VALUES (30, 'app', '0012_memory_leaderid', '2023-05-03 23:20:50.707662');
INSERT INTO `django_migrations` VALUES (31, 'app', '0013_memory_savetime', '2023-05-05 01:36:30.202143');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
