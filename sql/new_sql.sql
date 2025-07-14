-- ========================================
-- 图书管理系统新需求数据库建表脚本
-- 支持多语言、评论系统、推荐系统等新功能
-- ========================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS `library_management_new` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `library_management_new`;

-- ========================================
-- 1. 基础表结构（保持兼容性）
-- ========================================

-- 1.1 用户表（保持原有结构）
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `address` varchar(200) DEFAULT NULL COMMENT '地址/部门',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `role` int NOT NULL DEFAULT '2' COMMENT '角色：1-管理员，2-普通用户',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint DEFAULT '1' COMMENT '账号状态：1-正常，0-禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  KEY `idx_role` (`role`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 1.2 图书分类表（保持原有结构）
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `category_code` varchar(20) NOT NULL COMMENT '分类编码',
  `description` text COMMENT '分类描述',
  `sort_order` int DEFAULT '0' COMMENT '排序序号',
  `status` tinyint DEFAULT '1' COMMENT '状态：1-启用，0-禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_category_name` (`category_name`),
  UNIQUE KEY `uk_category_code` (`category_code`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图书分类表';


-- ========================================
-- 3. 增强的图书信息表
-- ========================================

-- 3.1 图书信息表（新增多语言支持）
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `book_number` varchar(50) NOT NULL COMMENT '图书编号（系统内部编号）',
  `isbn` varchar(20) NOT NULL COMMENT 'ISBN号',
  `name_cn` varchar(200) DEFAULT NULL COMMENT '中文书名',
  `name_id` varchar(200) DEFAULT NULL COMMENT '外语书名',
  `language` varchar(100) NOT NULL COMMENT '书的语言(中文，印尼语，英文，西班牙语等）',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `translator` varchar(100) DEFAULT NULL COMMENT '译者',
  `publisher` varchar(100) DEFAULT NULL COMMENT '出版社',
  `publish_date` date DEFAULT NULL COMMENT '出版日期',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `category_id` int DEFAULT NULL COMMENT '分类ID',
  `location` varchar(50) DEFAULT NULL COMMENT '图书位置',
  `total_quantity` int DEFAULT '1' COMMENT '总数量',
  `available_quantity` int DEFAULT '1' COMMENT '可借数量',
  `borrow_count` int DEFAULT '0' COMMENT '借阅次数',
  `status` tinyint DEFAULT '1' COMMENT '图书状态：1-正常，0-下架',
  `description` text COMMENT '图书简介',
  `cover_image` varchar(200) DEFAULT NULL COMMENT '封面图片',
  `rating_avg` decimal(3,2) DEFAULT '0.00' COMMENT '平均评分',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_book_number` (`book_number`),
  UNIQUE KEY `uk_isbn` (`isbn`),
  KEY `idx_name_cn` (`name_cn`),
  KEY `idx_name_id` (`name_id`),
  KEY `idx_author` (`author`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_status` (`status`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图书信息表';

-- ========================================
-- 4. 评论系统
-- ========================================

-- 4.1 图书评论表
DROP TABLE IF EXISTS `book_comment`;
CREATE TABLE `book_comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `book_id` int NOT NULL COMMENT '图书ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `by_person` varchar(50) DEFAULT NULL COMMENT '评论人',
  `content` text NOT NULL COMMENT '评论内容',
  `rating` tinyint DEFAULT NULL COMMENT '评分：1-5星',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图书评论表';

-- ========================================
-- 5. 推荐系统
-- ========================================

-- 5.1 图书推荐表
DROP TABLE IF EXISTS `book_recommendation`;
CREATE TABLE `book_recommendation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '推荐ID',
  `book_id` int NOT NULL COMMENT '图书ID',
  `recommend_month` varchar(7) NOT NULL COMMENT '推荐月份（YYYY-MM格式）',
  `recommend_reason` text DEFAULT NULL COMMENT '推荐理由',
  `operator_id` int NOT NULL COMMENT '操作员ID',
  `status` tinyint DEFAULT '1' COMMENT '状态：1-启用，0-禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_recommend_month` (`recommend_month`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图书推荐表';

-- ========================================
-- 6. 借阅管理（增强版）
-- ========================================

-- 6.1 借阅记录表（增强版）
DROP TABLE IF EXISTS `lend_record`;
CREATE TABLE `lend_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `reader_id` int NOT NULL COMMENT '读者ID',
  `book_id` int NOT NULL COMMENT '图书ID',
  `book_name` varchar(200) NOT NULL COMMENT '书名',
  `book_number` varchar(50) NOT NULL COMMENT '图书编号（系统内部编号）',
  `lend_time` datetime NOT NULL COMMENT '借阅时间',
  `due_time` datetime NOT NULL COMMENT '应还时间',
  `return_time` datetime DEFAULT NULL COMMENT '实际归还时间',
  `status` varchar(20) DEFAULT '已借出' COMMENT '借阅状态：已借出/已归还/逾期/丢失',
  `borrow_days` int DEFAULT '30' COMMENT '借阅天数',
  `operator_id` int DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `renewal_count` int DEFAULT '0' COMMENT '续借次数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_reader_id` (`reader_id`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_book_number` (`book_number`),
  KEY `idx_status` (`status`),
  KEY `idx_lend_time` (`lend_time`),
  KEY `idx_due_time` (`due_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='借阅记录表';

-- ========================================
-- 7. 系统统计（保持原有结构）
-- ========================================

-- 7.1 系统访问统计表
DROP TABLE IF EXISTS `system_stats`;
CREATE TABLE `system_stats` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '统计ID',
  `stat_date` date NOT NULL COMMENT '统计日期',
  `visit_count` int DEFAULT '0' COMMENT '访问次数',
  `new_users` int DEFAULT '0' COMMENT '新增用户数',
  `new_books` int DEFAULT '0' COMMENT '新增图书数',
  `lend_count` int DEFAULT '0' COMMENT '借阅次数',
  `return_count` int DEFAULT '0' COMMENT '归还次数',
  `comment_count` int DEFAULT '0' COMMENT '新增评论数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_stat_date` (`stat_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统访问统计表';

-- ========================================
-- 8. 插入模拟数据
-- ========================================

-- 8.1 插入用户数据
INSERT INTO `user` (`username`, `nick_name`, `password`, `sex`, `address`, `phone`, `role`, `status`) VALUES
('admin', '系统管理员', 'e10adc3949ba59abbe56e057f20f883e', '男', '管理部门', '13800138000', 1, 1),
('librarian', '图书管理员', 'e10adc3949ba59abbe56e057f20f883e', '女', '图书馆', '13800138001', 1, 1),
('zhangsan', '张三', 'e10adc3949ba59abbe56e057f20f883e', '男', '计算机学院', '13800138002', 2, 1),
('lisi', '李四', 'e10adc3949ba59abbe56e057f20f883e', '女', '外语学院', '13800138003', 2, 1),
('wangwu', '王五', 'e10adc3949ba59abbe56e057f20f883e', '男', '文学院', '13800138004', 2, 1),
('zhaoliu', '赵六', 'e10adc3949ba59abbe56e057f20f883e', '女', '历史学院', '13800138005', 2, 1),
('sunqi', '孙七', 'e10adc3949ba59abbe56e057f20f883e', '男', '哲学院', '13800138006', 2, 1),
('zhouba', '周八', 'e10adc3949ba59abbe56e057f20f883e', '女', '经济学院', '13800138007', 2, 1),
('wujiu', '吴九', 'e10adc3949ba59abbe56e057f20f883e', '男', '数学学院', '13800138008', 2, 1),
('zhengshi', '郑十', 'e10adc3949ba59abbe56e057f20f883e', '女', '物理学院', '13800138009', 2, 1);

-- 8.2 插入图书分类数据
INSERT INTO `book_category` (`category_name`, `category_code`, `description`, `sort_order`, `status`) VALUES
('文学', 'LIT', '文学类图书，包括小说、诗歌、散文等', 1, 1),
('科技', 'SCI', '科学技术类图书', 2, 1),
('历史', 'HIS', '历史类图书', 3, 1),
('哲学', 'PHI', '哲学类图书', 4, 1),
('经济', 'ECO', '经济管理类图书', 5, 1),
('计算机', 'CS', '计算机科学与技术', 6, 1),
('数学', 'MATH', '数学类图书', 7, 1),
('外语', 'LANG', '外语学习类图书', 8, 1),
('艺术', 'ART', '艺术类图书', 9, 1),
('教育', 'EDU', '教育类图书', 10, 1);

-- 8.3 插入图书信息数据
INSERT INTO `book` (`book_number`, `isbn`, `name_cn`, `name_id`, `language`, `author`, `translator`, `publisher`, `publish_date`, `price`, `category_id`, `location`, `total_quantity`, `available_quantity`, `borrow_count`, `status`, `description`, `cover_image`, `rating_avg`) VALUES
('BK001', '9787020002207', '红楼梦', 'Dream of the Red Chamber', '中文', '曹雪芹', NULL, '人民文学出版社', '2018-01-01', 45.00, 1, 'A区1层001', 5, 3, 15, 1, '中国古典文学四大名著之一，描写贾宝玉、林黛玉等人的爱情悲剧。', '/images/hongloumeng.jpg', 4.8),
('BK002', '9787121301234', 'Java编程思想', 'Thinking in Java', '中文', 'Bruce Eckel', '陈昊鹏', '电子工业出版社', '2019-03-15', 89.00, 6, 'B区2层015', 3, 2, 8, 1, 'Java编程经典教材，深入讲解Java语言特性和编程思想。', '/images/thinking_java.jpg', 4.6),
('BK003', '9787040123456', '高等数学', 'Advanced Mathematics', '中文', '同济大学数学系', NULL, '高等教育出版社', '2020-08-20', 56.00, 7, 'C区1层032', 10, 7, 25, 1, '高等数学教材，涵盖微积分、线性代数等内容。', '/images/gaodengshuxue.jpg', 4.2),
('BK004', '9780134685991', 'Effective Java', 'Effective Java', '英文', 'Joshua Bloch', NULL, 'Addison-Wesley', '2018-01-06', 120.00, 6, 'B区2层020', 2, 1, 12, 1, 'Java编程最佳实践指南，由Java平台架构师编写。', '/images/effective_java.jpg', 4.9),
('BK005', '9787020056789', '三国演义', 'Romance of the Three Kingdoms', '中文', '罗贯中', NULL, '人民文学出版社', '2017-05-10', 42.00, 1, 'A区1层005', 4, 2, 18, 1, '中国古典文学四大名著之一，描写三国时期的历史故事。', '/images/sanguoyanyi.jpg', 4.7),
('BK006', '9787111234567', '算法导论', 'Introduction to Algorithms', '中文', 'Thomas H. Cormen', '殷建平', '机械工业出版社', '2019-09-01', 128.00, 6, 'B区3层008', 3, 1, 6, 1, '计算机算法经典教材，被誉为算法学习的圣经。', '/images/algorithms.jpg', 4.8),
('BK007', '9787040345678', '世界历史', 'World History', '中文', '吴于廑', NULL, '高等教育出版社', '2018-12-15', 68.00, 3, 'D区1层012', 6, 4, 10, 1, '世界历史通史教材，全面介绍人类文明发展历程。', '/images/world_history.jpg', 4.3),
('BK008', '9786021234567', 'Bahasa Indonesia untuk Pemula', 'Bahasa Indonesia untuk Pemula', '印尼语', 'Sari Kemala', NULL, 'Gramedia Pustaka', '2020-02-28', 35.00, 8, 'E区2层025', 5, 5, 3, 1, '印尼语入门教材，适合初学者学习印尼语基础知识。', '/images/bahasa_indonesia.jpg', 4.1),
('BK009', '9787020067890', '西游记', 'Journey to the West', '中文', '吴承恩', NULL, '人民文学出版社', '2017-08-20', 38.00, 1, 'A区1层008', 4, 3, 22, 1, '中国古典文学四大名著之一，讲述孙悟空等人西天取经的故事。', '/images/xiyouji.jpg', 4.6),
('BK010', '9787040456789', '马克思主义哲学', 'Marxist Philosophy', '中文', '李秀林', NULL, '高等教育出版社', '2019-06-10', 52.00, 4, 'F区1层018', 8, 6, 7, 1, '马克思主义哲学基本原理教材，系统阐述马克思主义世界观和方法论。', '/images/marxist_philosophy.jpg', 4.0),
('BK011', '9787111567890', 'Python编程：从入门到实践', 'Python Crash Course', '中文', 'Eric Matthes', '袁国忠', '机械工业出版社', '2020-11-01', 79.00, 6, 'B区2层030', 6, 4, 14, 1, 'Python编程入门经典教材，通过项目实践学习Python编程。', '/images/python_crash.jpg', 4.5),
('BK012', '9787040678901', '微观经济学', 'Microeconomics', '中文', '高鸿业', NULL, '高等教育出版社', '2018-03-25', 65.00, 5, 'G区1层022', 5, 3, 9, 1, '微观经济学教材，介绍市场经济运行的基本原理。', '/images/microeconomics.jpg', 4.2),
('BK013', '9780321234567', 'The Art of Computer Programming', 'The Art of Computer Programming', '英文', 'Donald E. Knuth', NULL, 'Addison-Wesley', '2019-07-15', 200.00, 6, 'B区3层015', 2, 1, 4, 1, '计算机程序设计艺术，计算机科学领域的经典巨著。', '/images/art_programming.jpg', 5.0),
('BK014', '9787020078901', '水浒传', 'Water Margin', '中文', '施耐庵', NULL, '人民文学出版社', '2017-11-30', 40.00, 1, 'A区1层012', 4, 2, 16, 1, '中国古典文学四大名著之一，描写梁山好汉的英雄故事。', '/images/shuihuzhuan.jpg', 4.5),
('BK015', '9786022345678', 'Sejarah Indonesia', 'Indonesian History', '印尼语', 'Marwati Djoened', NULL, 'Balai Pustaka', '2019-04-12', 42.00, 3, 'E区1层008', 3, 2, 5, 1, '印尼历史教材，全面介绍印度尼西亚的历史发展。', '/images/sejarah_indonesia.jpg', 4.3);

-- 8.4 插入图书评论数据
INSERT INTO `book_comment` (`book_id`, `user_id`, `by_person`, `content`, `rating`) VALUES
(1, 3, '张三', '红楼梦是中国文学的瑰宝，曹雪芹的文笔细腻，人物刻画生动。', 5),
(1, 4, '李四', '读了很多遍，每次都有新的感悟，值得反复品味。', 5),
(1, 5, '王五', '古典文学的巅峰之作，推荐给所有喜欢文学的朋友。', 4),
(2, 3, '张三', 'Java编程思想讲解得很深入，对理解Java语言帮助很大。', 5),
(2, 6, '赵六', '作为Java程序员必读的书籍，内容丰富，例子实用。', 4),
(3, 7, '孙七', '高等数学教材编写得很好，例题丰富，适合自学。', 4),
(3, 8, '周八', '数学基础很重要，这本书讲解清晰，推荐给理工科学生。', 4),
(4, 3, '张三', 'Effective Java是Java进阶必读，Joshua Bloch的经验分享很宝贵。', 5),
(5, 5, '王五', '三国演义情节跌宕起伏，人物性格鲜明，百读不厌。', 5),
(5, 9, '吴九', '历史小说的经典，既有历史价值又有文学价值。', 4),
(6, 3, '张三', '算法导论内容全面，是学习算法的权威教材。', 5),
(6, 10, '郑十', '虽然比较厚重，但是内容扎实，值得深入学习。', 4),
(7, 6, '赵六', '世界历史脉络清晰，有助于了解人类文明发展。', 4),
(8, 4, '李四', 'Bahasa Indonesia教材很实用，适合初学者入门。', 4),
(9, 5, '王五', '西游记想象力丰富，是中国神话文学的代表作。', 5),
(10, 7, '孙七', '马克思主义哲学原理深刻，对世界观形成很有帮助。', 4),
(11, 3, '张三', 'Python编程书籍中的佳作，项目实践很有价值。', 4),
(11, 8, '周八', '适合Python初学者，从基础到实践循序渐进。', 5),
(12, 9, '吴九', '微观经济学理论体系完整，案例分析透彻。', 4),
(13, 3, '张三', 'Knuth大师的经典之作，计算机科学的圣经。', 5),
(14, 5, '王五', '水浒传英雄气概感人，是中国侠义文学的典范。', 4),
(15, 4, '李四', '印尼历史内容丰富，有助于了解东南亚文化。', 4);

-- 8.5 插入图书推荐数据
INSERT INTO `book_recommendation` (`book_id`, `recommend_month`, `recommend_reason`, `operator_id`, `status`) VALUES
(1, '2024-01', '新年推荐经典文学作品，感受中华文化的博大精深', 1, 1),
(2, '2024-01', '程序员必读书籍，提升Java编程技能', 1, 1),
(6, '2024-01', '算法学习的权威教材，计算机专业学生必备', 2, 1),
(4, '2024-02', 'Java进阶必读，学习最佳编程实践', 1, 1),
(11, '2024-02', 'Python入门首选，项目驱动学习方式', 2, 1),
(5, '2024-02', '历史文学经典，了解三国文化', 1, 1),
(9, '2024-03', '春季推荐神话文学，感受想象力的魅力', 2, 1),
(7, '2024-03', '了解世界历史，拓宽知识视野', 1, 1),
(12, '2024-03', '经济学基础理论，培养经济思维', 2, 1),
(3, '2024-04', '数学基础教材，理工科学生必备', 1, 1),
(8, '2024-04', '学习印尼语，了解东南亚文化', 2, 1),
(10, '2024-04', '哲学思维训练，提升思辨能力', 1, 1);

-- 8.6 插入借阅记录数据
INSERT INTO `lend_record` (`reader_id`, `book_id`, `book_name`, `book_number`, `lend_time`, `due_time`, `return_time`, `status`, `borrow_days`, `operator_id`, `remark`, `renewal_count`) VALUES
(3, 1, '红楼梦', 'BK001', '2024-01-15 10:30:00', '2024-02-14 23:59:59', '2024-02-10 14:20:00', '已归还', 30, 2, '正常借阅', 0),
(4, 2, 'Java编程思想', 'BK002', '2024-01-20 09:15:00', '2024-02-19 23:59:59', NULL, '已借出', 30, 2, '学习用书', 0),
(5, 3, '高等数学', 'BK003', '2024-01-25 14:45:00', '2024-02-24 23:59:59', '2024-02-20 16:30:00', '已归还', 30, 1, '考试复习', 0),
(3, 4, 'Effective Java', 'BK004', '2024-02-01 11:20:00', '2024-03-02 23:59:59', NULL, '已借出', 30, 2, '进阶学习', 1),
(6, 5, '三国演义', 'BK005', '2024-02-05 15:10:00', '2024-03-06 23:59:59', '2024-02-28 10:45:00', '已归还', 30, 1, '课外阅读', 0),
(7, 6, '算法导论', 'BK006', '2024-02-10 08:30:00', '2024-03-11 23:59:59', NULL, '已借出', 30, 2, '算法学习', 0),
(8, 7, '世界历史', 'BK007', '2024-02-15 13:25:00', '2024-03-16 23:59:59', '2024-03-10 09:15:00', '已归还', 30, 1, '历史研究', 0),
(4, 8, 'Bahasa Indonesia untuk Pemula', 'BK008', '2024-02-20 16:40:00', '2024-03-21 23:59:59', NULL, '已借出', 30, 2, '语言学习', 0),
(9, 9, '西游记', 'BK009', '2024-02-25 12:15:00', '2024-03-26 23:59:59', NULL, '已借出', 30, 1, '文学欣赏', 0),
(10, 10, '马克思主义哲学', 'BK010', '2024-03-01 10:50:00', '2024-03-31 23:59:59', NULL, '已借出', 30, 2, '哲学学习', 0),
(3, 11, 'Python编程：从入门到实践', 'BK011', '2024-03-05 14:30:00', '2024-04-04 23:59:59', NULL, '已借出', 30, 1, 'Python学习', 0),
(5, 12, '微观经济学', 'BK012', '2024-03-10 09:45:00', '2024-04-09 23:59:59', NULL, '已借出', 30, 2, '经济学课程', 0),
(6, 1, '红楼梦', 'BK001', '2024-03-12 11:20:00', '2024-04-11 23:59:59', NULL, '已借出', 30, 1, '重读经典', 0),
(7, 3, '高等数学', 'BK003', '2024-03-15 15:35:00', '2024-04-14 23:59:59', NULL, '已借出', 30, 2, '数学复习', 0),
(8, 5, '三国演义', 'BK005', '2024-03-18 13:10:00', '2024-04-17 23:59:59', NULL, '已借出', 30, 1, '历史文学', 0);

-- 8.7 插入系统统计数据
INSERT INTO `system_stats` (`stat_date`, `visit_count`, `new_users`, `new_books`, `lend_count`, `return_count`, `comment_count`) VALUES
('2024-01-01', 45, 2, 0, 0, 0, 0),
('2024-01-15', 78, 1, 5, 3, 0, 2),
('2024-01-20', 92, 0, 2, 2, 1, 3),
('2024-01-25', 67, 1, 1, 1, 1, 1),
('2024-02-01', 85, 0, 0, 2, 0, 2),
('2024-02-05', 73, 1, 3, 1, 1, 1),
('2024-02-10', 89, 0, 1, 1, 0, 2),
('2024-02-15', 95, 0, 2, 1, 1, 1),
('2024-02-20', 82, 1, 0, 1, 0, 1),
('2024-02-25', 76, 0, 1, 1, 1, 2),
('2024-03-01', 88, 0, 0, 1, 0, 1),
('2024-03-05', 91, 1, 0, 1, 1, 1),
('2024-03-10', 79, 0, 1, 1, 0, 2),
('2024-03-12', 84, 0, 0, 1, 0, 0),
('2024-03-15', 77, 0, 0, 1, 0, 1),
('2024-03-18', 86, 0, 0, 1, 0, 1);

-- 数据插入完成提示
SELECT '图书管理系统模拟数据插入完成！' as message;
SELECT '包含：10个用户、10个分类、15本图书、22条评论、9条推荐、15条借阅记录' as data_summary;

-- ========================================
-- 11. 创建索引优化
-- ========================================

-- 为多语言搜索创建复合索引
-- CREATE INDEX `idx_book_search` ON `book` (`status`, `name`, `author`);
-- CREATE INDEX `idx_book_search_cn` ON `book` (`status`, `name_cn`, `author`);
-- CREATE INDEX `idx_book_search_id` ON `book` (`status`, `name_id`, `author`);

-- 为评论查询创建复合索引
-- CREATE INDEX `idx_comment_book_status` ON `book_comment` (`book_id`, `status`, `create_time`);
-- CREATE INDEX `idx_comment_user_status` ON `book_comment` (`user_id`, `status`, `create_time`);

-- 为推荐查询创建复合索引
-- CREATE INDEX `idx_recommend_month_status` ON `book_recommendation` (`recommend_month`, `status`, `recommend_order`);

-- ========================================
-- 12. 数据完整性约束
-- ========================================

-- 添加检查约束（MySQL 8.0+）
-- ALTER TABLE `book_comment` ADD CONSTRAINT `chk_rating` CHECK (`rating` >= 1 AND `rating` <= 5);
-- ALTER TABLE `book_recommendation` ADD CONSTRAINT `chk_recommend_order` CHECK (`recommend_order` >= 1 AND `recommend_order` <= 3);
-- ALTER TABLE `book` ADD CONSTRAINT `chk_quantity` CHECK (`available_quantity` >= 0 AND `available_quantity` <= `total_quantity`);

-- 脚本执行完成提示
SELECT '图书管理系统新需求数据库创建完成！' as message;
SELECT '支持功能：多语言书名、图书评论、推荐系统、标签管理' as features;
SELECT '默认管理员账号：admin/123456, librarian/123456' as admin_info;