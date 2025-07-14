/*
 Navicat Premium Dump SQL

 Source Server         : oa
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : library_management_new

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 14/07/2025 11:16:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `book_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图书编号（系统内部编号）',
  `isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ISBN号',
  `name_cn` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中文书名',
  `name_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '外语书名',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书的语言(中文，印尼语，英文，西班牙语等）',
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `translator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '译者',
  `publisher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出版社',
  `publish_date` date NULL DEFAULT NULL COMMENT '出版日期',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `category_id` int NULL DEFAULT NULL COMMENT '分类ID',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图书位置',
  `total_quantity` int NULL DEFAULT 1 COMMENT '总数量',
  `available_quantity` int NULL DEFAULT 1 COMMENT '可借数量',
  `borrow_count` int NULL DEFAULT 0 COMMENT '借阅次数',
  `status` tinyint NULL DEFAULT 1 COMMENT '图书状态：1-正常，0-下架',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图书简介',
  `cover_image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图片',
  `rating_avg` decimal(3, 2) NULL DEFAULT 0.00 COMMENT '平均评分',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_book_number`(`book_number` ASC) USING BTREE,
  UNIQUE INDEX `uk_isbn`(`isbn` ASC) USING BTREE,
  INDEX `idx_name_cn`(`name_cn` ASC) USING BTREE,
  INDEX `idx_name_id`(`name_id` ASC) USING BTREE,
  INDEX `idx_author`(`author` ASC) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_language`(`language` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图书信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'BK001', '9787020002207', '红楼梦', 'Dream of the Red Chamber', '中文', '曹雪芹', NULL, '人民文学出版社', '2018-01-01', 45.00, 1, 'A区1层001', 5, 3, 15, 1, '中国古典文学四大名著之一，描写贾宝玉、林黛玉等人的爱情悲剧。', '/images/hongloumeng.jpg', 4.80, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (2, 'BK002', '9787121301234', 'Java编程思想', 'Thinking in Java', '中文', 'Bruce Eckel', '陈昊鹏', '电子工业出版社', '2019-03-15', 89.00, 6, 'B区2层015', 3, 2, 8, 1, 'Java编程经典教材，深入讲解Java语言特性和编程思想。', '/images/thinking_java.jpg', 4.60, '2025-07-11 08:49:52', '2025-07-14 08:54:17');
INSERT INTO `book` VALUES (3, 'BK003', '9787040123456', '高等数学', 'Advanced Mathematics', '中文', '同济大学数学系', NULL, '高等教育出版社', '2020-08-20', 56.00, 7, 'C区1层032', 10, 7, 25, 1, '高等数学教材，涵盖微积分、线性代数等内容。', '/images/gaodengshuxue.jpg', 4.20, '2025-07-11 08:49:52', '2025-07-14 08:54:13');
INSERT INTO `book` VALUES (4, 'BK004', '9780134685991', 'Effective Java', 'Effective Java', '英文', 'Joshua Bloch', NULL, 'Addison-Wesley', '2018-01-06', 120.00, 6, 'B区2层020', 2, 1, 12, 1, 'Java编程最佳实践指南，由Java平台架构师编写。', '/images/effective_java.jpg', 4.90, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (5, 'BK005', '9787020056789', '三国演义', 'Romance of the Three Kingdoms', '中文', '罗贯中', NULL, '人民文学出版社', '2017-05-10', 42.00, 1, 'A区1层005', 4, 2, 18, 1, '中国古典文学四大名著之一，描写三国时期的历史故事。', '/images/sanguoyanyi.jpg', 4.70, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (6, 'BK006', '9787111234567', '算法导论', 'Introduction to Algorithms', '中文', 'Thomas H. Cormen', '殷建平', '机械工业出版社', '2019-09-01', 128.00, 6, 'B区3层008', 3, 1, 6, 1, '计算机算法经典教材，被誉为算法学习的圣经。', '/images/algorithms.jpg', 4.80, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (7, 'BK007', '9787040345678', '世界历史', 'World History', '中文', '吴于廑', NULL, '高等教育出版社', '2018-12-15', 68.00, 3, 'D区1层012', 6, 4, 10, 1, '世界历史通史教材，全面介绍人类文明发展历程。', '/images/world_history.jpg', 4.30, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (8, 'BK008', '9786021234567', 'Bahasa Indonesia untuk Pemula', 'Bahasa Indonesia untuk Pemula', '印尼语', 'Sari Kemala', NULL, 'Gramedia Pustaka', '2020-02-28', 35.00, 8, 'E区2层025', 5, 5, 3, 1, '印尼语入门教材，适合初学者学习印尼语基础知识。', '/images/bahasa_indonesia.jpg', 4.10, '2025-07-12 08:49:52', '2025-07-14 08:54:07');
INSERT INTO `book` VALUES (9, 'BK009', '9787020067890', '西游记', 'Journey to the West', '中文', '吴承恩', NULL, '人民文学出版社', '2017-08-20', 38.00, 1, 'A区1层008', 4, 3, 22, 1, '中国古典文学四大名著之一，讲述孙悟空等人西天取经的故事。', '/images/xiyouji.jpg', 4.60, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (10, 'BK010', '9787040456789', '马克思主义哲学', 'Marxist Philosophy', '中文', '李秀林', NULL, '高等教育出版社', '2019-06-10', 52.00, 4, 'F区1层018', 8, 6, 7, 1, '马克思主义哲学基本原理教材，系统阐述马克思主义世界观和方法论。', '/images/marxist_philosophy.jpg', 4.00, '2025-07-12 08:49:52', '2025-07-14 08:54:09');
INSERT INTO `book` VALUES (11, 'BK011', '9787111567890', 'Python编程：从入门到实践', 'Python Crash Course', '中文', 'Eric Matthes', '袁国忠', '机械工业出版社', '2020-11-01', 79.00, 6, 'B区2层030', 6, 4, 14, 1, 'Python编程入门经典教材，通过项目实践学习Python编程。', '/images/python_crash.jpg', 4.50, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (12, 'BK012', '9787040678901', '微观经济学', 'Microeconomics', '中文', '高鸿业', NULL, '高等教育出版社', '2018-03-25', 65.00, 5, 'G区1层022', 5, 3, 9, 1, '微观经济学教材，介绍市场经济运行的基本原理。', '/images/microeconomics.jpg', 4.20, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (13, 'BK013', '9780321234567', 'The Art of Computer Programming', 'The Art of Computer Programming', '英文', 'Donald E. Knuth', NULL, 'Addison-Wesley', '2019-07-15', 200.00, 6, 'B区3层015', 2, 1, 4, 1, '计算机程序设计艺术，计算机科学领域的经典巨著。', '/images/art_programming.jpg', 5.00, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (14, 'BK014', '9787020078901', '水浒传', 'Water Margin', '中文', '施耐庵', NULL, '人民文学出版社', '2017-11-30', 40.00, 1, 'A区1层012', 4, 2, 16, 1, '中国古典文学四大名著之一，描写梁山好汉的英雄故事。', '/images/shuihuzhuan.jpg', 4.50, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book` VALUES (15, 'BK015', '9786022345678', 'Sejarah Indonesia', 'Indonesian History', '印尼语', 'Marwati Djoened', NULL, 'Balai Pustaka', '2019-04-12', 42.00, 3, 'E区1层008', 3, 2, 5, 1, '印尼历史教材，全面介绍印度尼西亚的历史发展。', '/images/sejarah_indonesia.jpg', 4.30, '2025-07-14 08:49:52', '2025-07-14 08:49:52');

-- ----------------------------
-- Table structure for book_category
-- ----------------------------
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类编码',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '分类描述',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序序号',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态：1-启用，0-禁用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_category_name`(`category_name` ASC) USING BTREE,
  UNIQUE INDEX `uk_category_code`(`category_code` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图书分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_category
-- ----------------------------
INSERT INTO `book_category` VALUES (1, '文学', 'LIT', '文学类图书，包括小说、诗歌、散文等', 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (2, '科技', 'SCI', '科学技术类图书', 2, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (3, '历史', 'HIS', '历史类图书', 3, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (4, '哲学', 'PHI', '哲学类图书', 4, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (5, '经济', 'ECO', '经济管理类图书', 5, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (6, '计算机', 'CS', '计算机科学与技术', 6, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (7, '数学', 'MATH', '数学类图书', 7, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (8, '外语', 'LANG', '外语学习类图书', 8, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (9, '艺术', 'ART', '艺术类图书', 9, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_category` VALUES (10, '教育', 'EDU', '教育类图书', 10, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');

-- ----------------------------
-- Table structure for book_comment
-- ----------------------------
DROP TABLE IF EXISTS `book_comment`;
CREATE TABLE `book_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `book_id` int NOT NULL COMMENT '图书ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `by_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论人',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `rating` tinyint NULL DEFAULT NULL COMMENT '评分：1-5星',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图书评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_comment
-- ----------------------------
INSERT INTO `book_comment` VALUES (1, 1, 3, '张三', '红楼梦是中国文学的瑰宝，曹雪芹的文笔细腻，人物刻画生动。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (2, 1, 4, '李四', '读了很多遍，每次都有新的感悟，值得反复品味。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (3, 1, 5, '王五', '古典文学的巅峰之作，推荐给所有喜欢文学的朋友。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (4, 2, 3, '张三', 'Java编程思想讲解得很深入，对理解Java语言帮助很大。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (5, 2, 6, '赵六', '作为Java程序员必读的书籍，内容丰富，例子实用。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (6, 3, 7, '孙七', '高等数学教材编写得很好，例题丰富，适合自学。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (7, 3, 8, '周八', '数学基础很重要，这本书讲解清晰，推荐给理工科学生。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (8, 4, 3, '张三', 'Effective Java是Java进阶必读，Joshua Bloch的经验分享很宝贵。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (9, 5, 5, '王五', '三国演义情节跌宕起伏，人物性格鲜明，百读不厌。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (10, 5, 9, '吴九', '历史小说的经典，既有历史价值又有文学价值。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (11, 6, 3, '张三', '算法导论内容全面，是学习算法的权威教材。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (12, 6, 10, '郑十', '虽然比较厚重，但是内容扎实，值得深入学习。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (13, 7, 6, '赵六', '世界历史脉络清晰，有助于了解人类文明发展。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (14, 8, 4, '李四', 'Bahasa Indonesia教材很实用，适合初学者入门。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (15, 9, 5, '王五', '西游记想象力丰富，是中国神话文学的代表作。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (16, 10, 7, '孙七', '马克思主义哲学原理深刻，对世界观形成很有帮助。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (17, 11, 3, '张三', 'Python编程书籍中的佳作，项目实践很有价值。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (18, 11, 8, '周八', '适合Python初学者，从基础到实践循序渐进。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (19, 12, 9, '吴九', '微观经济学理论体系完整，案例分析透彻。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (20, 13, 3, '张三', 'Knuth大师的经典之作，计算机科学的圣经。', 5, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (21, 14, 5, '王五', '水浒传英雄气概感人，是中国侠义文学的典范。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_comment` VALUES (22, 15, 4, '李四', '印尼历史内容丰富，有助于了解东南亚文化。', 4, '2025-07-14 08:49:52', '2025-07-14 08:49:52');

-- ----------------------------
-- Table structure for book_recommendation
-- ----------------------------
DROP TABLE IF EXISTS `book_recommendation`;
CREATE TABLE `book_recommendation`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '推荐ID',
  `book_id` int NOT NULL COMMENT '图书ID',
  `recommend_month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '推荐月份（YYYY-MM格式）',
  `recommend_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '推荐理由',
  `operator_id` int NOT NULL COMMENT '操作员ID',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态：1-启用，0-禁用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_recommend_month`(`recommend_month` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图书推荐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_recommendation
-- ----------------------------
INSERT INTO `book_recommendation` VALUES (1, 1, '2024-01', '新年推荐经典文学作品，感受中华文化的博大精深', 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (2, 2, '2024-01', '程序员必读书籍，提升Java编程技能', 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (3, 6, '2024-01', '算法学习的权威教材，计算机专业学生必备', 2, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (4, 4, '2024-02', 'Java进阶必读，学习最佳编程实践', 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (5, 11, '2024-02', 'Python入门首选，项目驱动学习方式', 2, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (6, 5, '2024-02', '历史文学经典，了解三国文化', 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (7, 9, '2024-03', '春季推荐神话文学，感受想象力的魅力', 2, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (8, 7, '2024-03', '了解世界历史，拓宽知识视野', 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (9, 12, '2024-03', '经济学基础理论，培养经济思维', 2, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (10, 3, '2024-04', '数学基础教材，理工科学生必备', 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (11, 8, '2024-04', '学习印尼语，了解东南亚文化', 2, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `book_recommendation` VALUES (12, 10, '2024-04', '哲学思维训练，提升思辨能力', 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');

-- ----------------------------
-- Table structure for lend_record
-- ----------------------------
DROP TABLE IF EXISTS `lend_record`;
CREATE TABLE `lend_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `reader_id` int NOT NULL COMMENT '读者ID',
  `book_id` int NOT NULL COMMENT '图书ID',
  `book_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书名',
  `book_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图书编号（系统内部编号）',
  `lend_time` datetime NOT NULL COMMENT '借阅时间',
  `due_time` datetime NOT NULL COMMENT '应还时间',
  `return_time` datetime NULL DEFAULT NULL COMMENT '实际归还时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '已借出' COMMENT '借阅状态：已借出/已归还/逾期/丢失',
  `borrow_days` int NULL DEFAULT 30 COMMENT '借阅天数',
  `operator_id` int NULL DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `renewal_count` int NULL DEFAULT 0 COMMENT '续借次数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reader_id`(`reader_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_book_number`(`book_number` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_lend_time`(`lend_time` ASC) USING BTREE,
  INDEX `idx_due_time`(`due_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '借阅记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_record
-- ----------------------------
INSERT INTO `lend_record` VALUES (1, 3, 1, '红楼梦', 'BK001', '2024-01-15 10:30:00', '2024-02-14 23:59:59', '2024-02-10 14:20:00', '已归还', 30, 2, '正常借阅', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (2, 4, 2, 'Java编程思想', 'BK002', '2025-07-12 09:15:00', '2024-02-19 23:59:59', NULL, '已借出', 30, 2, '学习用书', 0, '2025-07-14 08:49:52', '2025-07-14 08:55:59');
INSERT INTO `lend_record` VALUES (3, 5, 3, '高等数学', 'BK003', '2024-01-25 14:45:00', '2024-02-24 23:59:59', '2024-02-20 16:30:00', '已归还', 30, 1, '考试复习', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (4, 3, 4, 'Effective Java', 'BK004', '2024-02-01 11:20:00', '2024-03-02 23:59:59', NULL, '已借出', 30, 2, '进阶学习', 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (5, 6, 5, '三国演义', 'BK005', '2024-02-05 15:10:00', '2024-03-06 23:59:59', '2024-02-28 10:45:00', '已归还', 30, 1, '课外阅读', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (6, 7, 6, '算法导论', 'BK006', '2025-07-10 08:30:00', '2024-03-11 23:59:59', NULL, '已借出', 30, 2, '算法学习', 0, '2025-07-14 08:49:52', '2025-07-14 08:55:39');
INSERT INTO `lend_record` VALUES (7, 8, 7, '世界历史', 'BK007', '2025-07-09 13:25:00', '2024-03-16 23:59:59', '2024-03-10 09:15:00', '已归还', 30, 1, '历史研究', 0, '2025-07-14 08:49:52', '2025-07-14 08:55:44');
INSERT INTO `lend_record` VALUES (8, 4, 8, 'Bahasa Indonesia untuk Pemula', 'BK008', '2024-02-20 16:40:00', '2024-03-21 23:59:59', NULL, '已借出', 30, 2, '语言学习', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (9, 9, 9, '西游记', 'BK009', '2024-02-25 12:15:00', '2024-03-26 23:59:59', NULL, '已借出', 30, 1, '文学欣赏', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (10, 10, 10, '马克思主义哲学', 'BK010', '2025-07-12 10:50:00', '2024-03-31 23:59:59', NULL, '已借出', 30, 2, '哲学学习', 0, '2025-07-14 08:49:52', '2025-07-14 08:55:51');
INSERT INTO `lend_record` VALUES (11, 3, 11, 'Python编程：从入门到实践', 'BK011', '2024-03-05 14:30:00', '2024-04-04 23:59:59', NULL, '已借出', 30, 1, 'Python学习', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (12, 5, 12, '微观经济学', 'BK012', '2024-03-10 09:45:00', '2024-04-09 23:59:59', NULL, '已借出', 30, 2, '经济学课程', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (13, 6, 1, '红楼梦', 'BK001', '2025-07-13 11:20:00', '2024-04-11 23:59:59', NULL, '已借出', 30, 1, '重读经典', 0, '2025-07-14 08:49:52', '2025-07-14 08:55:56');
INSERT INTO `lend_record` VALUES (14, 7, 3, '高等数学', 'BK003', '2024-03-15 15:35:00', '2024-04-14 23:59:59', NULL, '已借出', 30, 2, '数学复习', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `lend_record` VALUES (15, 8, 5, '三国演义', 'BK005', '2024-03-18 13:10:00', '2024-04-17 23:59:59', NULL, '已借出', 30, 1, '历史文学', 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作用户',
  `class_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类名',
  `method_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '方法参数',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '返回结果',
  `log_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志类型（INFO / ERROR）',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常堆栈信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 531 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (289, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-14 12:00:00');
INSERT INTO `sys_log` VALUES (290, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-14 09:00:00');
INSERT INTO `sys_log` VALUES (291, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-14 06:00:00');
INSERT INTO `sys_log` VALUES (292, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-14 03:00:00');
INSERT INTO `sys_log` VALUES (293, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-14 01:00:00');
INSERT INTO `sys_log` VALUES (294, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-13 12:00:00');
INSERT INTO `sys_log` VALUES (295, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-13 09:00:00');
INSERT INTO `sys_log` VALUES (296, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-13 06:00:00');
INSERT INTO `sys_log` VALUES (297, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-13 03:00:00');
INSERT INTO `sys_log` VALUES (298, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-13 01:00:00');
INSERT INTO `sys_log` VALUES (299, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-12 12:00:00');
INSERT INTO `sys_log` VALUES (300, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-12 09:00:00');
INSERT INTO `sys_log` VALUES (301, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-12 06:00:00');
INSERT INTO `sys_log` VALUES (302, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-12 03:00:00');
INSERT INTO `sys_log` VALUES (303, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-12 01:00:00');
INSERT INTO `sys_log` VALUES (304, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-11 12:00:00');
INSERT INTO `sys_log` VALUES (305, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-11 09:00:00');
INSERT INTO `sys_log` VALUES (306, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-11 06:00:00');
INSERT INTO `sys_log` VALUES (307, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-11 03:00:00');
INSERT INTO `sys_log` VALUES (308, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-11 01:00:00');
INSERT INTO `sys_log` VALUES (309, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-10 12:00:00');
INSERT INTO `sys_log` VALUES (310, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-10 09:00:00');
INSERT INTO `sys_log` VALUES (311, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-10 06:00:00');
INSERT INTO `sys_log` VALUES (312, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-10 03:00:00');
INSERT INTO `sys_log` VALUES (313, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-10 01:00:00');
INSERT INTO `sys_log` VALUES (314, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-09 12:00:00');
INSERT INTO `sys_log` VALUES (315, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-09 09:00:00');
INSERT INTO `sys_log` VALUES (316, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-09 06:00:00');
INSERT INTO `sys_log` VALUES (317, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-09 03:00:00');
INSERT INTO `sys_log` VALUES (318, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-09 01:00:00');
INSERT INTO `sys_log` VALUES (319, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-08 12:00:00');
INSERT INTO `sys_log` VALUES (320, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-08 09:00:00');
INSERT INTO `sys_log` VALUES (321, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-08 06:00:00');
INSERT INTO `sys_log` VALUES (322, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-08 03:00:00');
INSERT INTO `sys_log` VALUES (323, 'admin', 'com.example.LogService', 'visit', '{}', 'ok', 'INFO', NULL, '2025-07-08 01:00:00');
INSERT INTO `sys_log` VALUES (352, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:09:59');
INSERT INTO `sys_log` VALUES (353, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:09:59');
INSERT INTO `sys_log` VALUES (354, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:09:59');
INSERT INTO `sys_log` VALUES (355, 'login', 'AuthController', 'login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', NULL, 'INFO', NULL, '2025-07-14 09:10:23');
INSERT INTO `sys_log` VALUES (356, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:10:28');
INSERT INTO `sys_log` VALUES (357, '1', 'StatsController', 'login', '[]', NULL, 'INFO', NULL, '2025-07-13 09:10:32');
INSERT INTO `sys_log` VALUES (358, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:10:32');
INSERT INTO `sys_log` VALUES (359, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:10:32');
INSERT INTO `sys_log` VALUES (360, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:11:03');
INSERT INTO `sys_log` VALUES (361, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:11:09');
INSERT INTO `sys_log` VALUES (362, '1', 'AuthController', 'login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', NULL, 'INFO', NULL, '2025-07-14 09:11:18');
INSERT INTO `sys_log` VALUES (363, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:11:18');
INSERT INTO `sys_log` VALUES (364, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:02');
INSERT INTO `sys_log` VALUES (365, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:02');
INSERT INTO `sys_log` VALUES (366, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:02');
INSERT INTO `sys_log` VALUES (367, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:03');
INSERT INTO `sys_log` VALUES (368, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:03');
INSERT INTO `sys_log` VALUES (369, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:03');
INSERT INTO `sys_log` VALUES (370, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:04');
INSERT INTO `sys_log` VALUES (371, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:04');
INSERT INTO `sys_log` VALUES (372, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:04');
INSERT INTO `sys_log` VALUES (373, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:05');
INSERT INTO `sys_log` VALUES (374, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:05');
INSERT INTO `sys_log` VALUES (375, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:05');
INSERT INTO `sys_log` VALUES (376, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:08');
INSERT INTO `sys_log` VALUES (377, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:08');
INSERT INTO `sys_log` VALUES (378, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:08');
INSERT INTO `sys_log` VALUES (379, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:12');
INSERT INTO `sys_log` VALUES (380, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:12');
INSERT INTO `sys_log` VALUES (381, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:12');
INSERT INTO `sys_log` VALUES (382, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:14');
INSERT INTO `sys_log` VALUES (383, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:14');
INSERT INTO `sys_log` VALUES (384, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:14');
INSERT INTO `sys_log` VALUES (385, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:24');
INSERT INTO `sys_log` VALUES (386, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:24');
INSERT INTO `sys_log` VALUES (387, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:24');
INSERT INTO `sys_log` VALUES (388, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:25');
INSERT INTO `sys_log` VALUES (389, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:25');
INSERT INTO `sys_log` VALUES (390, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:25');
INSERT INTO `sys_log` VALUES (391, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:25');
INSERT INTO `sys_log` VALUES (392, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:25');
INSERT INTO `sys_log` VALUES (393, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:25');
INSERT INTO `sys_log` VALUES (394, '1', 'BookController', 'searchBooks', '[1,10,\"\"]', NULL, 'INFO', NULL, '2025-07-14 09:14:28');
INSERT INTO `sys_log` VALUES (395, '1', 'BookCommentController', 'page', '[1,10,null]', NULL, 'INFO', NULL, '2025-07-14 09:14:30');
INSERT INTO `sys_log` VALUES (396, '1', 'BookRecommendationController', 'search', '[\"\",1,10]', NULL, 'INFO', NULL, '2025-07-14 09:14:31');
INSERT INTO `sys_log` VALUES (397, '1', 'LendRecordController', 'search', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 09:14:33');
INSERT INTO `sys_log` VALUES (398, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 09:14:35');
INSERT INTO `sys_log` VALUES (399, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 09:14:37');
INSERT INTO `sys_log` VALUES (400, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:14:40');
INSERT INTO `sys_log` VALUES (401, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:19');
INSERT INTO `sys_log` VALUES (402, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:19');
INSERT INTO `sys_log` VALUES (403, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:19');
INSERT INTO `sys_log` VALUES (404, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:33');
INSERT INTO `sys_log` VALUES (405, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:33');
INSERT INTO `sys_log` VALUES (406, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:33');
INSERT INTO `sys_log` VALUES (407, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:34');
INSERT INTO `sys_log` VALUES (408, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:34');
INSERT INTO `sys_log` VALUES (409, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:34');
INSERT INTO `sys_log` VALUES (410, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:45');
INSERT INTO `sys_log` VALUES (411, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:45');
INSERT INTO `sys_log` VALUES (412, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:45');
INSERT INTO `sys_log` VALUES (413, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:46');
INSERT INTO `sys_log` VALUES (414, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:46');
INSERT INTO `sys_log` VALUES (415, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:46');
INSERT INTO `sys_log` VALUES (416, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:48');
INSERT INTO `sys_log` VALUES (417, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:50');
INSERT INTO `sys_log` VALUES (418, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:50');
INSERT INTO `sys_log` VALUES (419, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:15:50');
INSERT INTO `sys_log` VALUES (420, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:16:11');
INSERT INTO `sys_log` VALUES (421, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:16:11');
INSERT INTO `sys_log` VALUES (422, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:16:11');
INSERT INTO `sys_log` VALUES (423, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:50');
INSERT INTO `sys_log` VALUES (424, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:50');
INSERT INTO `sys_log` VALUES (425, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:50');
INSERT INTO `sys_log` VALUES (426, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:51');
INSERT INTO `sys_log` VALUES (427, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:51');
INSERT INTO `sys_log` VALUES (428, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:51');
INSERT INTO `sys_log` VALUES (429, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:55');
INSERT INTO `sys_log` VALUES (430, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:57');
INSERT INTO `sys_log` VALUES (431, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:57');
INSERT INTO `sys_log` VALUES (432, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:19:57');
INSERT INTO `sys_log` VALUES (433, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:20:35');
INSERT INTO `sys_log` VALUES (434, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:20:35');
INSERT INTO `sys_log` VALUES (435, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:20:35');
INSERT INTO `sys_log` VALUES (436, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:20:40');
INSERT INTO `sys_log` VALUES (437, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:20:42');
INSERT INTO `sys_log` VALUES (438, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:20:42');
INSERT INTO `sys_log` VALUES (439, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:20:42');
INSERT INTO `sys_log` VALUES (440, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:27');
INSERT INTO `sys_log` VALUES (441, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:27');
INSERT INTO `sys_log` VALUES (442, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:27');
INSERT INTO `sys_log` VALUES (443, '1', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:27');
INSERT INTO `sys_log` VALUES (444, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:33');
INSERT INTO `sys_log` VALUES (445, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:33');
INSERT INTO `sys_log` VALUES (446, '1', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:33');
INSERT INTO `sys_log` VALUES (447, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:33');
INSERT INTO `sys_log` VALUES (448, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:55');
INSERT INTO `sys_log` VALUES (449, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:55');
INSERT INTO `sys_log` VALUES (450, '1', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:55');
INSERT INTO `sys_log` VALUES (451, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:21:55');
INSERT INTO `sys_log` VALUES (452, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:10');
INSERT INTO `sys_log` VALUES (453, '1', 'AuthController', 'login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', NULL, 'INFO', NULL, '2025-07-14 09:22:21');
INSERT INTO `sys_log` VALUES (454, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:21');
INSERT INTO `sys_log` VALUES (455, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:31');
INSERT INTO `sys_log` VALUES (456, '1', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:31');
INSERT INTO `sys_log` VALUES (457, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:31');
INSERT INTO `sys_log` VALUES (458, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:31');
INSERT INTO `sys_log` VALUES (459, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:33');
INSERT INTO `sys_log` VALUES (460, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:33');
INSERT INTO `sys_log` VALUES (461, '1', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:33');
INSERT INTO `sys_log` VALUES (462, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:22:33');
INSERT INTO `sys_log` VALUES (463, '1', 'AuthController', 'login', '[{\"username\":\"librarian\",\"password\":\"123456\"}]', NULL, 'INFO', NULL, '2025-07-14 09:23:05');
INSERT INTO `sys_log` VALUES (464, '2', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:05');
INSERT INTO `sys_log` VALUES (465, '2', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:17');
INSERT INTO `sys_log` VALUES (466, '2', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:17');
INSERT INTO `sys_log` VALUES (467, '2', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:17');
INSERT INTO `sys_log` VALUES (468, '2', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:17');
INSERT INTO `sys_log` VALUES (469, '2', 'AuthController', 'login', '[{\"username\":\"librarian\",\"password\":\"123456\"}]', NULL, 'INFO', NULL, '2025-07-14 09:23:36');
INSERT INTO `sys_log` VALUES (470, '2', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:36');
INSERT INTO `sys_log` VALUES (471, '2', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:52');
INSERT INTO `sys_log` VALUES (472, '2', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:52');
INSERT INTO `sys_log` VALUES (473, '2', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:52');
INSERT INTO `sys_log` VALUES (474, '2', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 09:23:52');
INSERT INTO `sys_log` VALUES (475, '2', 'AuthController', 'login', '[{\"username\":\"librarian\",\"password\":\"123456\"}]', NULL, 'INFO', NULL, '2025-07-14 10:18:50');
INSERT INTO `sys_log` VALUES (476, '2', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:18:50');
INSERT INTO `sys_log` VALUES (477, '2', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 10:18:58');
INSERT INTO `sys_log` VALUES (478, '2', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 10:18:58');
INSERT INTO `sys_log` VALUES (479, '2', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 10:18:58');
INSERT INTO `sys_log` VALUES (480, '2', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 10:18:58');
INSERT INTO `sys_log` VALUES (481, 'login', 'AuthController', 'login', '[{\"username\":\"admin\",\"password\":\"123\"}]', NULL, 'INFO', NULL, '2025-07-14 10:33:40');
INSERT INTO `sys_log` VALUES (482, 'login', 'AuthController', 'login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', NULL, 'INFO', NULL, '2025-07-14 10:33:48');
INSERT INTO `sys_log` VALUES (483, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:33:48');
INSERT INTO `sys_log` VALUES (484, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:33:52');
INSERT INTO `sys_log` VALUES (485, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"1234567\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138000\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:34:02');
INSERT INTO `sys_log` VALUES (486, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"1234567\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138000\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:34:02');
INSERT INTO `sys_log` VALUES (487, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:34:39');
INSERT INTO `sys_log` VALUES (488, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:34:43');
INSERT INTO `sys_log` VALUES (489, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"fcea920f7412b5da7be0cf42b8c93759\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138006\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:34:48');
INSERT INTO `sys_log` VALUES (490, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"fcea920f7412b5da7be0cf42b8c93759\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138006\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:34:48');
INSERT INTO `sys_log` VALUES (491, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:35:26');
INSERT INTO `sys_log` VALUES (492, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:35:33');
INSERT INTO `sys_log` VALUES (493, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"224cf2b695a5e8ecaecfb9015161fa4b\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138007\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:35:38');
INSERT INTO `sys_log` VALUES (494, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"224cf2b695a5e8ecaecfb9015161fa4b\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138007\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:35:38');
INSERT INTO `sys_log` VALUES (495, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:37:34');
INSERT INTO `sys_log` VALUES (496, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:38:04');
INSERT INTO `sys_log` VALUES (497, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"123456\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138007\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:38:10');
INSERT INTO `sys_log` VALUES (498, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"123456\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138007\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:38:10');
INSERT INTO `sys_log` VALUES (499, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:38:22');
INSERT INTO `sys_log` VALUES (500, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:38:27');
INSERT INTO `sys_log` VALUES (501, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138009\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:38:32');
INSERT INTO `sys_log` VALUES (502, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138009\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:38:32');
INSERT INTO `sys_log` VALUES (503, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:39:00');
INSERT INTO `sys_log` VALUES (504, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:41:16');
INSERT INTO `sys_log` VALUES (505, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"123456\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138009\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:41:24');
INSERT INTO `sys_log` VALUES (506, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"123456\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138009\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:41:24');
INSERT INTO `sys_log` VALUES (507, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:41:58');
INSERT INTO `sys_log` VALUES (508, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:42:02');
INSERT INTO `sys_log` VALUES (509, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138005\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:42:08');
INSERT INTO `sys_log` VALUES (510, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138005\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:42:08');
INSERT INTO `sys_log` VALUES (511, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:44:07');
INSERT INTO `sys_log` VALUES (512, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:44:20');
INSERT INTO `sys_log` VALUES (513, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"123456\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138005\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:44:26');
INSERT INTO `sys_log` VALUES (514, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"123456\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138005\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:44:26');
INSERT INTO `sys_log` VALUES (515, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:44:49');
INSERT INTO `sys_log` VALUES (516, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:44:53');
INSERT INTO `sys_log` VALUES (517, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138009\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:44:57');
INSERT INTO `sys_log` VALUES (518, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138009\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:44:57');
INSERT INTO `sys_log` VALUES (519, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:45:38');
INSERT INTO `sys_log` VALUES (520, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"123456\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138009\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:45:45');
INSERT INTO `sys_log` VALUES (521, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"123456\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138009\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:45:45');
INSERT INTO `sys_log` VALUES (522, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:45:52');
INSERT INTO `sys_log` VALUES (523, '1', 'UserController', 'currUser', '[]', NULL, 'INFO', NULL, '2025-07-14 10:45:54');
INSERT INTO `sys_log` VALUES (524, '1', 'UserServiceImpl', 'updateUser', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138006\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:45:58');
INSERT INTO `sys_log` VALUES (525, '1', 'UserController', 'update', '[{\"id\":1,\"username\":\"admin\",\"nickName\":\"系统管理员\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"sex\":\"男\",\"address\":\"管理部门\",\"phone\":\"13800138006\",\"role\":1,\"createTime\":null,\"updateTime\":null,\"status\":1}]', NULL, 'INFO', NULL, '2025-07-14 10:45:58');
INSERT INTO `sys_log` VALUES (526, '1', 'UserController', 'searchUsers', '[null,1,10]', NULL, 'INFO', NULL, '2025-07-14 10:46:07');
INSERT INTO `sys_log` VALUES (527, '1', 'StatsController', 'borrowTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 10:55:23');
INSERT INTO `sys_log` VALUES (528, '1', 'StatsController', 'getVisitTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 10:55:23');
INSERT INTO `sys_log` VALUES (529, '1', 'StatsController', 'bookTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 10:55:23');
INSERT INTO `sys_log` VALUES (530, '1', 'StatsController', 'userTrend', '[]', NULL, 'INFO', NULL, '2025-07-14 10:55:23');

-- ----------------------------
-- Table structure for system_stats
-- ----------------------------
DROP TABLE IF EXISTS `system_stats`;
CREATE TABLE `system_stats`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '统计ID',
  `stat_date` date NOT NULL COMMENT '统计日期',
  `visit_count` int NULL DEFAULT 0 COMMENT '访问次数',
  `new_users` int NULL DEFAULT 0 COMMENT '新增用户数',
  `new_books` int NULL DEFAULT 0 COMMENT '新增图书数',
  `lend_count` int NULL DEFAULT 0 COMMENT '借阅次数',
  `return_count` int NULL DEFAULT 0 COMMENT '归还次数',
  `comment_count` int NULL DEFAULT 0 COMMENT '新增评论数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_stat_date`(`stat_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_stats
-- ----------------------------
INSERT INTO `system_stats` VALUES (1, '2024-01-01', 45, 2, 0, 0, 0, 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (2, '2024-01-15', 78, 1, 5, 3, 0, 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (3, '2024-01-20', 92, 0, 2, 2, 1, 3, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (4, '2024-01-25', 67, 1, 1, 1, 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (5, '2024-02-01', 85, 0, 0, 2, 0, 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (6, '2024-02-05', 73, 1, 3, 1, 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (7, '2024-02-10', 89, 0, 1, 1, 0, 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (8, '2024-02-15', 95, 0, 2, 1, 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (9, '2024-02-20', 82, 1, 0, 1, 0, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (10, '2024-02-25', 76, 0, 1, 1, 1, 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (11, '2024-03-01', 88, 0, 0, 1, 0, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (12, '2024-03-05', 91, 1, 0, 1, 1, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (13, '2024-03-10', 79, 0, 1, 1, 0, 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (14, '2024-03-12', 84, 0, 0, 1, 0, 0, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (15, '2024-03-15', 77, 0, 0, 1, 0, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');
INSERT INTO `system_stats` VALUES (16, '2024-03-18', 86, 0, 0, 1, 0, 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址/部门',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `role` int NOT NULL DEFAULT 2 COMMENT '角色：1-管理员，2-普通用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint NULL DEFAULT 1 COMMENT '账号状态：1-正常，0-禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE,
  INDEX `idx_role`(`role` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '系统管理员', 'e10adc3949ba59abbe56e057f20f883e', '男', '管理部门', '13800138006', 1, '2025-07-14 08:49:52', '2025-07-14 10:46:05', 1);
INSERT INTO `user` VALUES (2, 'librarian', '图书管理员', 'e10adc3949ba59abbe56e057f20f883e', '女', '图书馆', '13800138001', 1, '2025-07-14 08:49:52', '2025-07-14 08:49:52', 1);
INSERT INTO `user` VALUES (3, 'zhangsan', '张三', 'e10adc3949ba59abbe56e057f20f883e', '男', '计算机学院', '13800138002', 2, '2025-07-11 08:49:52', '2025-07-14 08:54:49', 1);
INSERT INTO `user` VALUES (4, 'lisi', '李四', 'e10adc3949ba59abbe56e057f20f883e', '女', '外语学院', '13800138003', 2, '2025-07-10 08:49:52', '2025-07-14 08:54:43', 1);
INSERT INTO `user` VALUES (5, 'wangwu', '王五', 'e10adc3949ba59abbe56e057f20f883e', '男', '文学院', '13800138004', 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52', 1);
INSERT INTO `user` VALUES (6, 'zhaoliu', '赵六', 'e10adc3949ba59abbe56e057f20f883e', '女', '历史学院', '13800138005', 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52', 1);
INSERT INTO `user` VALUES (7, 'sunqi', '孙七', 'e10adc3949ba59abbe56e057f20f883e', '男', '哲学院', '13800138006', 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52', 1);
INSERT INTO `user` VALUES (8, 'zhouba', '周八', 'e10adc3949ba59abbe56e057f20f883e', '女', '经济学院', '13800138007', 2, '2025-07-11 08:49:52', '2025-07-14 08:54:46', 1);
INSERT INTO `user` VALUES (9, 'wujiu', '吴九', 'e10adc3949ba59abbe56e057f20f883e', '男', '数学学院', '13800138008', 2, '2025-07-14 08:49:52', '2025-07-14 08:49:52', 1);
INSERT INTO `user` VALUES (10, 'zhengshi', '郑十', 'e10adc3949ba59abbe56e057f20f883e', '女', '物理学院', '13800138009', 2, '2025-07-12 08:49:52', '2025-07-14 08:54:52', 1);

SET FOREIGN_KEY_CHECKS = 1;
