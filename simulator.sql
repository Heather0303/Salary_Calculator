/*
 Navicat Premium Data Transfer

 Source Server         : simulation
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : simulator

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 22/10/2019 16:04:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fields
-- ----------------------------
DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header_id` int(10) NULL DEFAULT NULL,
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 0,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `editable` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  FULLTEXT INDEX `description`(`value`)
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fields
-- ----------------------------
INSERT INTO `fields` VALUES (1, 2, 'f7', 'Type de contrat', 'CDI', NULL, 1, 'sdasd', 1);
INSERT INTO `fields` VALUES (2, 3, 'f8', 'feuille de paye', '30', '€', 0, '', 0);
INSERT INTO `fields` VALUES (3, 3, 'f9', 'Mutuelle', '20,30,40', '€', 1, 'testing', 1);
INSERT INTO `fields` VALUES (5, 3, 'f10', 'Assurance salarié', '26', '€', 0, 'asdas', 0);
INSERT INTO `fields` VALUES (6, 3, 'f11', 'Assurance ESN', '100', '€', 0, '', 0);
INSERT INTO `fields` VALUES (7, 3, 'f13', 'URSAAF', '1200', '€', 0, '', 0);
INSERT INTO `fields` VALUES (8, 3, 'f14', 'AG2R', '235', '€', 0, '', 0);
INSERT INTO `fields` VALUES (9, 3, 'f15', 'Outils', '50', '€', 0, '', 0);
INSERT INTO `fields` VALUES (10, 3, 'f16', 'Admin CDI', '200,300', '€', 1, '', 0);
INSERT INTO `fields` VALUES (11, 4, 'f24', 'Réserve salaire ratio', '0.25', 'mois', 0, '', 0);
INSERT INTO `fields` VALUES (12, 200, 'f27', 'Réserve employabilité', '400', '€', 0, '', 0);
INSERT INTO `fields` VALUES (13, 1, 'f1', 'Forfait Client jour actuel', '500', '€', 0, '<img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKAAzTzi9v0VIC--H0AUGshtLdS7eNhJ-Ce1wI1Db2Rj43v4-Evw\" width=\"300\">', 1);
INSERT INTO `fields` VALUES (14, 1, 'f4', 'Reduction Client', '12', '%', 0, '<h1>test1</h1/><iframe width=\"300\" height=\"250\" src=\"https://www.youtube.com/embed/OK_JCtrrv-c\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\"></iframe>', 0);
INSERT INTO `fields` VALUES (15, 1, 'f5', 'Forfait Client jour avec remise de base', '440', '€', 0, 'testing', 0);
INSERT INTO `fields` VALUES (16, 100, 'f18', 'Demande Spoc', NULL, NULL, 0, 'testing', 0);
INSERT INTO `fields` VALUES (17, 100, 'f20', 'Recouvrement', NULL, NULL, 0, 'testing', 0);
INSERT INTO `fields` VALUES (19, 100, 'f19', 'Remise Spoc', '500', '€\r\n', 0, 'testing', 0);
INSERT INTO `fields` VALUES (20, 100, 'f21', 'Remise recouvrement', '200', '€', 0, 'testing', 0);
INSERT INTO `fields` VALUES (21, 2, 'f6', 'Salaire mensuel actuel net', '3100', '€', 0, 'testing', 1);
INSERT INTO `fields` VALUES (22, 2, 'f2', 'Nombre de jour travaillé', '216', 'jour', 0, '<h1>test1</h1/><iframe width=\"300\" height=\"250\" src=\"https://www.youtube.com/embed/OK_JCtrrv-c\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\"></iframe>', 0);
INSERT INTO `fields` VALUES (24, 2, 'f3', 'Nombre de RTT', '11', 'jour', 0, 'testing', 1);
INSERT INTO `fields` VALUES (25, 3, 'f17', 'Fees TT', '1312.5547445255472', '€', 0, 'testing', 0);
INSERT INTO `fields` VALUES (26, 4, 'f23', 'Réserve salaire en mois', '3', 'mois', 0, '', 0);
INSERT INTO `fields` VALUES (28, 5, 'f31', 'Salaire mensuel cible après 3 mois', '13672.445255474453', '€', 0, 'testing', 0);
INSERT INTO `fields` VALUES (41, 6, 'f32', 'Forfait client jour final', '', '€', 0, '', 0);
INSERT INTO `fields` VALUES (45, 3, 'f12', 'Formation', '2200', '€', 0, 'Formation', 0);
INSERT INTO `fields` VALUES (46, 4, 'f25', 'Réserve salaire', NULL, NULL, 0, NULL, 0);
INSERT INTO `fields` VALUES (47, 200, 'f26', 'Assurance employabilité', '1', NULL, 0, 'option', 0);
INSERT INTO `fields` VALUES (48, 200, 'f34', 'Augmentation du Salaire', NULL, NULL, 0, NULL, 0);
INSERT INTO `fields` VALUES (52, 5, 'f30', 'Salaire mensuel cible initial', '', '€', 0, '', 0);

-- ----------------------------
-- Table structure for formulas
-- ----------------------------
DROP TABLE IF EXISTS `formulas`;
CREATE TABLE `formulas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `formula` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of formulas
-- ----------------------------
INSERT INTO `formulas` VALUES (1, 'f5', 'f1*(1-f4)');
INSERT INTO `formulas` VALUES (2, 'f12', '5*f5');
INSERT INTO `formulas` VALUES (3, 'f17', '0.12*f30');
INSERT INTO `formulas` VALUES (4, 'f19', '-f18*500');
INSERT INTO `formulas` VALUES (5, 'f21', '-f20*200');
INSERT INTO `formulas` VALUES (6, 'f25', 'f30*f24');
INSERT INTO `formulas` VALUES (7, 'f27', 'f26*400');
INSERT INTO `formulas` VALUES (8, 'f30', '(f33-f8-f9-f10-f11-f12-f13-f14-f15-f16-f27)/(1+0.12+f24)');
INSERT INTO `formulas` VALUES (9, 'f31', 'f33-f8-f9-f10-f11-f12-f13-f14-f15-f16-f17-f27');
INSERT INTO `formulas` VALUES (10, 'f32', 'f5-f19-f21');
INSERT INTO `formulas` VALUES (11, 'f33', 'f32*(f2-f3)/12');
INSERT INTO `formulas` VALUES (12, 'f34', '100*(f31-f6)/f6');
INSERT INTO `formulas` VALUES (13, 'f35', 'f30*2');

-- ----------------------------
-- Table structure for headercontent
-- ----------------------------
DROP TABLE IF EXISTS `headercontent`;
CREATE TABLE `headercontent`  (
  `id` int(10) NOT NULL,
  `field_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of headercontent
-- ----------------------------
INSERT INTO `headercontent` VALUES (0, '', 'This is Sample of Salary simulator. If you use this simulator you can know your state…');
INSERT INTO `headercontent` VALUES (1, 'C_1', 'Contrat entreprise');
INSERT INTO `headercontent` VALUES (2, 'C_2', 'Contrat salarié');
INSERT INTO `headercontent` VALUES (3, 'C_3', 'Frais fixe par salarié');
INSERT INTO `headercontent` VALUES (4, 'C_4', 'Frais variable par salarié');
INSERT INTO `headercontent` VALUES (5, 'C_5', 'Salaire salarié');
INSERT INTO `headercontent` VALUES (6, 'C_6', 'Forfait client jour final\r\n');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', 'admin', '0');
INSERT INTO `users` VALUES ('user', 'user', '1');

SET FOREIGN_KEY_CHECKS = 1;
