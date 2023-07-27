/*
 Navicat Premium Data Transfer

 Source Server         : czn
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 21/07/2023 23:04:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `cid` int(0) NOT NULL,
  `com_profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `legal_profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `com_culture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `honour` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, '<p>    楚雄绿巨人生物科技有限公司成立于2014年4月，位于素有“迤西咽喉”之称的云南省楚雄彝族自治州，是一家集猕猴桃生产销售、苗木繁育、科普教育、实践培训和观光采摘等功能为一体的现代化农业科技公司。</p><p><br></p><p><img src=\"/imgs/honour/1689760826.png\"></p><p><br></p><p>    公司自创建以来，始终秉持绿色发展理念，致力于打造以猕猴桃为主的绿色健康生态产业，充分依托当地适宜的气候条件、土壤特性和公司雄厚的技术管理优势，在楚雄市东华镇新柳村委会小波岩、苴午村流转土地600多亩进行猕猴桃种植。公司坚持以“科学发展、科技创新”为导向，以建设“七彩云南”、“美丽楚雄”为己任，致力于创建全州乃至全省优质猕猴桃产区，以科研为先导，膨胀基地，扩大加工，狠抓营销，逐步形成科研-生产-储藏-加工-销售旅游观光等为一体的开发体系，并向社会提供优质安全生态农产品和一流的农业观光服务。</p><p><br></p><p><img src=\"/imgs/honour/1689828851.png\"></p><p><br></p><p>    公司始终坚持科技引领，创新发展，采取“公司+专家站+协会+贫困户”的经营模式及“入股+分红+劳动力投入+猕猴桃种苗扶持+科技培训”等方式，与群众建立稳定帮扶利益联结机制，通过企业和协会带动，贫困户和农户融入发展，企业充分发挥自身品牌、市场、技术、信息等方面的资源优势，通过订单方式统一规划、统一供种（苗）、统一管理、统一培训、统一回购和销售农产品，为贫困户和农户提供技术、知识和市场信息，建立密切的利益联结机制，帮助贫困户脱贫致富，帮助农户增产增收，以增加贫困户和农户收入为核心，以农业供给侧改革为主线，通过发展猕猴桃产业，推动高原特色农业产业化进程，实现企业增效与农民增收双赢。</p><p><br></p><p><img src=\"/imgs/honour/1689828976.png\"></p>', '<p>李红运，男，出生于1970年，中共党员，河南省西峡县人。2014年至今担任楚雄绿巨人生物科技有限公司总经理，先后被评为云南省科技特派员、楚雄市科技领军人才、彝州名匠、楚雄州优秀科技特派员，并受聘楚雄师范学院园艺专业学生实践实训指导老师。</p><p><br></p><p><img src=\"/imgs/honour/1689774363.png\"></p>', '<p>\n            <strong>使命、愿景:</strong>\n            为全球人类生产优质安全产品、创建国际先进国内领先的现代农业示范园。\n          </p><p>\n          </p><p>\n            <strong>企业发展目标:</strong>\n            规范化种植，标准化生产，商品化处理，品牌化销售，产业化经营。\n          </p><p>\n          </p><p>\n            <strong>经营理念:</strong>\n            坚持绿色农业理念，保护生态资源环境，实施标准化生产，发挥产业龙头带动，打造“彝运”猕猴桃品牌。\n          </p><p>\n          </p><p>\n            <strong>核心价值观:</strong>\n            以人为本，生态安全，标准管理，质量保证，科技兴企，创新发展。\n          </p><p>\n          </p><p>\n            <strong>员工行为准则:</strong>\n            持续学习，高效工作，爱岗敬业，遵章守纪，尊重他人，坦诚沟通，顾全大局，忠于企业。\n          </p><p><br></p><p><img src=\"/imgs/honour/1689774745.jpg\"></p>', '<p>公司先后被认定为国家知识产权优势企业、国家高新技术企业、国家级科技型中小企业、云南省农业产业化省级重点龙头企业、云南省科技型中小企业、云南省省级成长型中小企业、云南省知识产权优势企业、云南省专精特新“成长”企业、云南省创新型中小企业、楚雄州农业产业化经营州级重点龙头企业、楚雄市带贫企业等，成为国家猕猴桃科技创新联盟成员单位、云南省猕猴桃产业技术创新战略联盟副理事长单位。</p><p>\n          </p><p><img src=\"/imgs/honour/1689774788.png\"></p>');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` int(0) NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (1, '13638743363', '0878-3815158', '2536394977@qq.com', '云南省楚雄彝族自治州楚雄市东华镇新柳村委会小波岩村猕猴桃基地');

-- ----------------------------
-- Table structure for manageuser
-- ----------------------------
DROP TABLE IF EXISTS `manageuser`;
CREATE TABLE `manageuser`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manageuser
-- ----------------------------
INSERT INTO `manageuser` VALUES (1, 'admin', 'admin');
INSERT INTO `manageuser` VALUES (5, 'cxlvjuren', 'ljr123456');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_tm` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (2, '小嘎', '12345678996', 'hello', '2023-07-13 12:13:26');
INSERT INTO `message` VALUES (3, '小嘎', '12345678996', 'hello', '2023-07-13 12:14:10');
INSERT INTO `message` VALUES (4, '金猪兄', '15063696363', '猕猴桃怎么卖', '2023-07-13 23:13:22');
INSERT INTO `message` VALUES (5, '阿道夫', '18213406516', '噶还是觉得好贵', '2023-07-17 14:14:00');
INSERT INTO `message` VALUES (6, '啊撒打发', '18213406118', '士大夫敢死队风格', '2023-07-17 14:14:14');
INSERT INTO `message` VALUES (7, '雲殇', '15485565612', '史蒂夫噶士大夫', '2023-07-17 14:14:35');
INSERT INTO `message` VALUES (8, '阿斯蒂芬噶', '18213406119', '啊手动阀手动阀', '2023-07-17 14:14:51');
INSERT INTO `message` VALUES (9, '上帝发誓', '18213406119', '阿斯顿发射点', '2023-07-17 14:14:57');
INSERT INTO `message` VALUES (10, '供热通风', '18213406119', '爱国发的安死', '2023-07-17 14:15:03');
INSERT INTO `message` VALUES (11, '金猪兄', '18213406119', '啊嘎嘎', '2023-07-17 14:15:16');
INSERT INTO `message` VALUES (12, '金猪兄', '18213406119', '更换一台然后我', '2023-07-17 14:15:22');
INSERT INTO `message` VALUES (13, '金猪兄', '18213406119', '噶非噶二通过二', '2023-07-17 14:15:28');
INSERT INTO `message` VALUES (14, '金猪兄', '18213406119', '暗室逢灯噶法国', '2023-07-17 14:15:36');
INSERT INTO `message` VALUES (15, '寸正能', '18213406119', '啊打发士大夫', '2023-07-17 14:15:42');
INSERT INTO `message` VALUES (16, '寸正能', '18213406119', '阿法狗哈德非噶的规划', '2023-07-17 14:15:47');
INSERT INTO `message` VALUES (17, '寸正能', '18213406119', '更合适的符合双方的规划', '2023-07-17 14:15:51');
INSERT INTO `message` VALUES (18, '寸正能', '18213406119', '首个分段函数的合法的', '2023-07-17 14:15:56');
INSERT INTO `message` VALUES (19, '寸正能', '18213406119', '动画风格风格婚姻家庭', '2023-07-17 14:16:00');
INSERT INTO `message` VALUES (20, '寸正能', '18213406119', '阿特柔记得发货', '2023-07-17 14:16:04');
INSERT INTO `message` VALUES (21, '寸正能', '18213406119', '身体华盛顿国会发士大夫', '2023-07-17 14:16:09');
INSERT INTO `message` VALUES (22, '寸正能', '18213406119', '啊额的哈二哥', '2023-07-17 14:16:12');
INSERT INTO `message` VALUES (23, '寸正能', '18213406119', '就会有突然他', '2023-07-17 14:16:16');
INSERT INTO `message` VALUES (24, '寸正能', '18213406119', '啊是德国法国', '2023-07-17 16:35:41');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `nid` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `time` date NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '风华雪夜1', '科斯塔', '<p>您可以根据实际需求在这里进行文章数据的保存操作。上述示例中，我们使用名为 <code style=\"color: var(--tw-prose-code);\">news</code> 的模型来创建一条新的新闻记录，并将其保存到数据库中。您需要根据您的数据库模型和存储方式进行适当的修改。</p><p>在保存成功后，我们返回一个包含成功消息的 JSON 响应给前端。如果保存失败，则返回一个包含错误消息的 JSON 响应。</p><p><br></p><p><img src=\"/imgs/news/1689586346.png\"></p>', '2023-07-12', NULL);
INSERT INTO `news` VALUES (2, '风华虚夜阿道夫', '好莱坞', '<p><span style=\"background-color: rgb(255, 255, 255);\"> 公司自创建以来，始终秉持绿色发展理念，致力于打造以猕猴桃为主的绿色健康生态产业，充分依托当地适宜的气候条件、 土壤特性和公司雄厚的技术管理优势，在楚雄市东华镇新柳村委会小波岩、苴午村流转土地600多亩进行猕猴桃种植。 公司坚持以“科学发展、科技创新”为导向。</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255);\">以建设“七彩云南”、“美丽楚雄”为己任，致力于创建全州乃至全省 优质猕猴桃产区，以科研为先导，膨胀基地，扩大加工，狠抓营销，逐步形成科研-生产-储藏-加工-销售旅游观光等为一体的 开发体系，并向社会提供优质安全生态农产品和一流的农业观光服务。</span></p>', NULL, NULL);
INSERT INTO `news` VALUES (3, '阿斯蒂芬干哈', NULL, '<p>请检查该行代码，并确保使用的变量或函数名在该位置之前已经定义。在错误提示中，报告了一个未定义的变量 <code style=\"color: var(--tw-prose-code);\">error</code>。</p><p>可能的原因包括：</p><ul><li>变量名拼写错误：请检查变量名是否正确拼写，包括大小写。</li><li>变量未在正确的作用域内定义：确保变量在使用之前已经在正确的作用域内定义。</li></ul><p>检查并修正以上问题后，应该能够解决该错误。如果问题仍然存在，可以提供更多的代码和错误上下文，以便更好地帮助你解决问题。</p>', '2023-07-08', NULL);
INSERT INTO `news` VALUES (4, '噶啥的噶进口国', '问日', '<p>噶沙司感觉俺是个艰苦拉萨记得过来看俺是个俺是个。 啊噶士大夫噶时光， 暗杀事件黑哦入境海关。俺家帅哥卡拉就是过去啊额我如果啊。和国家暗黑界如果i哦就，格哈尔计入结果爱克斯光。</p><p>噶文件和如果i哦安徽江苏科技噶快。改好价格i我那个啊。</p><p>规划局二万人观看乃感觉。</p><p><br></p>', NULL, '1689487381.jpg');
INSERT INTO `news` VALUES (5, '昆明翠湖游玩', '翠儿', '<p>了解翠湖的历史和特点：翠湖是一座有着百年历史的人工湖泊，周围环绕着山脉和树木，湖水碧绿清澈，景色优美。了解翠湖的历史和特点，可以更好地欣赏和理解这个地方。</p><p>最佳游览时间：昆明气候宜人，翠湖四季如春，所以你可以在一年中的任何时间都能享受到美丽的风景。然而，昆明的夏季（6月至8月）会有较多降雨，建议带上一把雨伞或雨衣。另外，早上和傍晚是最佳的游览时间，这时天气较凉爽，景色也最美。</p><p>计划游览路线：翠湖周围有许多景点和活动，你可以制定一个游览路线以便更好地探索翠湖。一般来说，你可以从湖畔的步行道开始，欣赏湖水和周围的自然风光。还可以参观湖心岛、倒影楼等景点，以及湖边的花坛和雕塑。</p><p>体验湖上活动：在翠湖上还可以体验一些水上活动，如划船、踏板船和龙舟。这些活动不仅能够欣赏湖景，还能享受放松和娱乐的时光。</p><p>尝试当地美食：翠湖附近有很多餐馆和小吃摊位，可以尝试当地的云南美食。云南菜以独特的风味和新鲜的食材闻名，你可以品尝到各种美味的云南特色菜肴。</p><p>注意环保和保护：在游览翠湖时，请注意保护环境和保持公共区域的清洁卫生。遵循公园的规定和指引，不随地乱扔垃圾，爱护自然环境。</p><p>安全注意事项：在游览翠湖时要注意个人安全。尽量不要单独前往荒僻的地方，保管好个人财物，避免携带过多现金和贵重物品。如果参加水上活动，务必遵守相关安全规定，佩戴救生设备。</p><p><br></p><p><img src=\"/imgs/news/1689489978.jpg\"></p>', NULL, '1689489978.jpg');
INSERT INTO `news` VALUES (6, '就hi给你爬坡阶段给', '窗', '<p><br></p><p><img src=\"/imgs/news/1689490102.jpg\"></p><ol><li>了解翠湖的历史和特点：翠湖是一座有着百年历史的人工湖泊，周围环绕着山脉和树木，湖水碧绿清澈，景色优美。了解翠湖的历史和特点，可以更好地欣赏和理解这个地方。</li><li>最佳游览时间：昆明气候宜人，翠湖四季如春，所以你可以在一年中的任何时间都能享受到美丽的风景。然而，昆明的夏季（6月至8月）会有较多降雨，建议带上一把雨伞或雨衣。另外，早上和傍晚是最佳的游览时间，这时天气较凉爽，景色也最美。</li><li>计划游览路线：翠湖周围有许多景点和活动，你可以制定一个游览路线以便更好地探索翠湖。一般来说，你可以从湖畔的步行道开始，欣赏湖水和周围的自然风光。还可以参观湖心岛、倒影楼等景点，以及湖边的花坛和雕塑。</li><li>体验湖上活动：在翠湖上还可以体验一些水上活动，如划船、踏板船和龙舟。这些活动不仅能够欣赏湖景，还能享受放松和娱乐的时光。</li><li>尝试当地美食：翠湖附近有很多餐馆和小吃摊位，可以尝试当地的云南美食。云南菜以独特的风味和新鲜的食材闻名，你可以品尝到各种美味的云南特色菜肴。</li><li>注意环保和保护：在游览翠湖时，请注意保护环境和保持公共区域的清洁卫生。遵循公园的规定和指引，不随地乱扔垃圾，爱护自然环境。</li><li>安全注意事项：在游览翠湖时要注意个人安全。尽量不要单独前往荒僻的地方，保管好个人财物，避免携带过多现金和贵重物品。如果参加水上活动，务必遵守相关安全规定，佩戴救生设备。</li></ol><p><br></p>', '2023-07-16', '1689490102.jpg');
INSERT INTO `news` VALUES (7, 'u华南的公交卡', NULL, '<p>阿斯顿噶啥的噶噶时光阿斯顿噶啥的噶阿根达斯噶啥的噶阿斯顿噶啥的噶。</p><p><br></p><p><img src=\"/imgs/news/1689490181.jpg\"></p><p>阿斯达克宫颈癌考试的结果俺是个家属的结果阿斯达克感觉ask。</p><p>改善的结果卡萨丁。</p><p><br></p>', '2023-07-16', '1689490181.jpg');
INSERT INTO `news` VALUES (8, '改善估计快了', '阿里', '<p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。</span>	</p><h2>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“褚橙”</span>	</h2><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。</span>	</p><h2>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“云冠橙”</span>	</h2><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2015年，褚橙团队着手打造龙陵生产基地，占地10000亩，新一代褚橙人奔赴前线，采用褚橙庄园的标准化管理加因地制宜的管理体系研发新品牌“云冠橙”，2017年，省属重点的院士工作站：中国工程院院士、现代柑橘技术体系首席科学家、华中农大校长邓秀新的院士工作站正式在龙陵基地落地，以科学的种植技术助力项目推进，基地于2019年已实现产量6000吨，精选成品3000吨，成品率达到50%。</span></p>', '2023-07-17', '');
INSERT INTO `news` VALUES (9, '噶啥的噶过热', NULL, '<p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“褚橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“云冠橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2015年，褚橙团队着手打造龙陵生产基地，占地10000亩，新一代褚橙人奔赴前线，采用褚橙庄园的标准化管理加因地制宜的管理体系研发新品牌“云冠橙”，2017年，省属重点的院士工作站：中国工程院院士、现代柑橘技术体系首席科学家、华中农大校长邓秀新的院士工作站正式在龙陵基地落地，以科学的种植技术助力项目推进，基地于2019年已实现产量6000吨，精选成品3000吨，成品率达到50%。</span></p>', NULL, '');
INSERT INTO `news` VALUES (10, 'i好几个看过', '龙陵', '<p><strong><em>	</em></strong><strong style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\"><em>褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。</em></strong><strong><em>	</em></strong></p><p><strong><em>	</em></strong><strong style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\"><em>&nbsp;&nbsp;&nbsp;“褚橙”</em></strong><strong><em>	</em></strong></p><p><strong><em>	</em></strong><strong style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\"><em>2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。</em></strong><strong><em>	</em></strong></p><p><strong><em>	</em></strong><strong style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\"><em>&nbsp;&nbsp;&nbsp;“云冠橙”</em></strong><strong><em>	</em></strong></p><p><strong><em>	</em></strong><strong style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\"><em>2015年，褚橙团队着手打造龙陵生产基地，占地10000亩，新一代褚橙人奔赴前线，采用褚橙庄园的标准化管理加因地制宜的管理体系研发新品牌“云冠橙”，2017年，省属重点的院士工作站：中国工程院院士、现代柑橘技术体系首席科学家、华中农大校长邓秀新的院士工作站正式在龙陵基地落地，以科学的种植技术助力项目推进，基地于2019年已实现产量6000吨，精选成品3000吨，成品率达到50%。</em></strong></p>', '2023-07-17', '');
INSERT INTO `news` VALUES (11, '阿凡达韩国i哦阿姐法国', NULL, '<p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“褚橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“云冠橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2015年，褚橙团队着手打造龙陵生产基地，占地10000亩，新一代褚橙人奔赴前线，采用褚橙庄园的标准化管理加因地制宜的管理体系研发新品牌“云冠橙”，2017年，省属重点的院士工作站：中国工程院院士、现代柑橘技术体系首席科学家、华中农大校长邓秀新的院士工作站正式在龙陵基地落地，以科学的种植技术助力项目推进，基地于2019年已实现产量6000吨，精选成品3000吨，成品率达到50%。</span></p>', NULL, '');
INSERT INTO `news` VALUES (12, '爱的方式高的反馈结果', '水果先生', '<p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“褚橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“云冠橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2015年，褚橙团队着手打造龙陵生产基地，占地10000亩，新一代褚橙人奔赴前线，采用褚橙庄园的标准化管理加因地制宜的管理体系研发新品牌“云冠橙”，2017年，省属重点的院士工作站：中国工程院院士、现代柑橘技术体系首席科学家、华中农大校长邓秀新的院士工作站正式在龙陵基地落地，以科学的种植技术助力项目推进，基地于2019年已实现产量6000吨，精选成品3000吨，成品率达到50%。</span></p>', '2023-07-17', '');
INSERT INTO `news` VALUES (13, '阿斯顿噶发达国家离开', NULL, '<p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“褚橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“云冠橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2015年，褚橙团队着手打造龙陵生产基地，占地10000亩，新一代褚橙人奔赴前线，采用褚橙庄园的标准化管理加因地制宜的管理体系研发新品牌“云冠橙”，2017年，省属重点的院士工作站：中国工程院院士、现代柑橘技术体系首席科学家、华中农大校长邓秀新的院士工作站正式在龙陵基地落地，以科学的种植技术助力项目推进，基地于2019年已实现产量6000吨，精选成品3000吨，成品率达到50%。</span></p>', NULL, '');
INSERT INTO `news` VALUES (14, '阿法狗i加快', NULL, '<p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“褚橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“云冠橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2015年，褚橙团队着手打造龙陵生产基地，占地10000亩，新一代褚橙人奔赴前线，采用褚橙庄园的标准化管理加因地制宜的管理体系研发新品牌“云冠橙”，2017年，省属重点的院士工作站：中国工程院院士、现代柑橘技术体系首席科学家、华中农大校长邓秀新的院士工作站正式在龙陵基地落地，以科学的种植技术助力项目推进，基地于2019年已实现产量6000吨，精选成品3000吨，成品率达到50%。</span></p>', NULL, '');
INSERT INTO `news` VALUES (15, '噶非噶就', NULL, '<p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“褚橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">&nbsp;&nbsp;&nbsp;“云冠橙”</span>	</p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(136, 136, 136);\">2015年，褚橙团队着手打造龙陵生产基地，占地10000亩，新一代褚橙人奔赴前线，采用褚橙庄园的标准化管理加因地制宜的管理体系研发新品牌“云冠橙”，2017年，省属重点的院士工作站：中国工程院院士、现代柑橘技术体系首席科学家、华中农大校长邓秀新的院士工作站正式在龙陵基地落地，以科学的种植技术助力项目推进，基地于2019年已实现产量6000吨，精选成品3000吨，成品率达到50%。</span></p>', NULL, '');
INSERT INTO `news` VALUES (17, '猕猴桃奇遇', '阿斯顿', '<blockquote>猕猴桃是一种色彩鲜艳、口感独特的水果，它不仅味道可口，还富含丰富的营养物质。本文将介绍猕猴桃的起源、营养价值以及它对健康的益处。</blockquote><ol><li>起源和种类：</li><li>猕猴桃最早起源于中国，后来传入新西兰，并逐渐在全球范围内流行起来。猕猴桃通常有两种常见品种：绿色猕猴桃和金色猕猴桃，它们在外观和口感上略有不同。</li><li>营养价值：</li><li>猕猴桃是一种低热量、高纤维的水果，它富含维生素C、维生素K、维生素E、维生素B群以及矿物质如钾、铁和钙等。它也是一种天然的抗氧化剂，并含有可溶性纤维，有助于消化和促进肠道健康。</li><li>健康益处：</li></ol><ul><li>提高免疫力：猕猴桃是维生素C的良好来源，它可以增强免疫系统的功能，帮助抵御感染和疾病。</li><li>改善肠道健康：猕猴桃富含纤维，有助于保持肠道功能正常，并促进消化系统的健康。</li><li>促进心脏健康：猕猴桃中的钾有助于控制血压，并减少患心脏病的风险。</li><li>抗氧化作用：猕猴桃含有丰富的抗氧化物质，有助于中和自由基，减少氧化应激对身体的损害。</li></ul><p><img src=\"/imgs/news/1689499520.png\"></p>', '2023-07-16', '1689499520.png');
INSERT INTO `news` VALUES (18, '人工智能', 'czn', '<p>人工智能（Artificial Intelligence，简称AI）是计算机科学的一个分支，旨在使计算机系统具备模拟和执行人类智能活动的能力。人工智能的目标是开发出能够感知、理解、学习、推理和决策的机器，以便它们能够执行各种任务，甚至在某些方面超过人类的能力。</p><p>人工智能涉及多个子领域和技术，包括机器学习、深度学习、自然语言处理、计算机视觉、专家系统、机器人技术等。这些技术和方法允许计算机从大量数据中提取模式、进行推理和预测，并通过不断学习和优化改进自身的性能。</p><p>人工智能在许多领域都有广泛的应用，如语音助手（如Siri和Alexa）、自动驾驶汽车、智能家居系统、金融领域的风险评估和预测、医疗诊断和治疗、图像和语音识别、自然语言处理等。人工智能的应用不断扩展，对社会、经济和科学的许多方面都产生了重大影响。</p><p>然而，人工智能也带来了一些挑战和问题，如数据隐私和安全性、伦理和道德问题、对人类就业的潜在影响等。因此，人工智能的发展需要平衡技术进步与社会、法律和伦理考虑之间的关系，以确保其发展和应用能够造福人类社会。</p>', '2023-07-17', '');
INSERT INTO `news` VALUES (19, '21世纪的发展', 'AI', '<p>人工智能（Artificial Intelligence，简称AI）是计算机科学的一个分支，旨在使计算机系统具备模拟和执行人类智能活动的能力。人工智能的目标是开发出能够感知、理解、学习、推理和决策的机器，以便它们能够执行各种任务，甚至在某些方面超过人类的能力。</p><p>人工智能涉及多个子领域和技术，包括机器学习、深度学习、自然语言处理、计算机视觉、专家系统、机器人技术等。这些技术和方法允许计算机从大量数据中提取模式、进行推理和预测，并通过不断学习和优化改进自身的性能。</p><p>人工智能在许多领域都有广泛的应用，如语音助手（如Siri和Alexa）、自动驾驶汽车、智能家居系统、金融领域的风险评估和预测、医疗诊断和治疗、图像和语音识别、自然语言处理等。人工智能的应用不断扩展，对社会、经济和科学的许多方面都产生了重大影响。</p><p>然而，人工智能也带来了一些挑战和问题，如数据隐私和安全性、伦理和道德问题、对人类就业的潜在影响等。因此，人工智能的发展需要平衡技术进步与社会、法律和伦理考虑之间的关系，以确保其发展和应用能够造福人类社会。</p><p><br></p><p><img src=\"/imgs/news/1689592099.png\"></p>', '2023-07-17', '1689592099.png');
INSERT INTO `news` VALUES (20, '风华雪月', '雪月', '<p>\"风华雪月\"是一个词语，通常用来形容某个时期或地方的风采和美丽。它常常与优雅、浪漫、富有情调的场景、景色或氛围相关联。</p><p>\"风华\"一词表示繁荣昌盛、盛世美好的时光，强调在某个时代或地方的繁荣和辉煌。</p><p>而\"雪月\"一词则指的是雪和月亮，常用来象征冷艳、纯洁和浪漫之美。雪有白皙、纯净的特性，而月亮则寄予人们对美好、浪漫情感的向往。</p><p>综合起来，\"风华雪月\"形容了一种风貌美丽、精彩华丽、典雅浪漫的景象、氛围或时光。它可以用来形容古代的盛世，也可以用来描绘某个地点、场景或人物的优美风采。这个词语常常被用来描述文学作品、诗歌、电影、音乐等艺术形式中所呈现的美感和情调。</p>', '2023-07-18', '');
INSERT INTO `news` VALUES (21, '法人简介', '李工卡', '<p>	李红运，男，出生于1970年，中共党员，河南省西峡县人。2014年至今担任楚雄绿巨人生物科技有限公司总经理，先后被评为云南省科技特派员、楚雄市科技领军人才、彝州名匠、楚雄州优秀科技特派员，并受聘楚雄师范学院园艺专业学生实践实训指导老师。</p><p>            <img src=\"/imgs/news/1689761264.png\"></p>', '2023-07-19', '1689761264.png');
INSERT INTO `news` VALUES (22, '和施工方', '阿莎', '<p><code style=\"color: var(--tw-prose-code);\">updated()</code> 是 Vue 组件生命周期钩子函数之一。在 Vue 组件中，当组件的响应式数据更新之后，会触发 <code style=\"color: var(--tw-prose-code);\">updated()</code> 钩子函数。</p><p>具体来说，当组件的响应式数据（例如 <code style=\"color: var(--tw-prose-code);\">data</code> 中的数据）发生变化，或者父组件向子组件传递的 prop 数据发生变化时，Vue 会自动重新渲染组件，更新 DOM。在这个过程中，<code style=\"color: var(--tw-prose-code);\">updated()</code> 钩子函数会被调用，允许您在组件更新之后执行额外的操作。</p><p><br></p><p><img src=\"/imgs/news/1689762904.png\"></p><p><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\">在这个示例中，我们通过监听 </span><code style=\"background-color: rgb(247, 247, 248); color: var(--tw-prose-code);\">input</code><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\"> 元素的 </span><code style=\"background-color: rgb(247, 247, 248); color: var(--tw-prose-code);\">change</code><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\"> 事件来调用 </span><code style=\"background-color: rgb(247, 247, 248); color: var(--tw-prose-code);\">handleUpload</code><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\"> 方法。在 </span><code style=\"background-color: rgb(247, 247, 248); color: var(--tw-prose-code);\">handleUpload</code><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\"> 方法中，我们通过 </span><code style=\"background-color: rgb(247, 247, 248); color: var(--tw-prose-code);\">event.target.files[0]</code><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\"> 来获取上传的文件，并进一步处理文件的类型等信息。</span></p><p><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\"><span class=\"ql-cursor\">﻿﻿</span></span></p><p><img src=\"/imgs/news/1689762972.png\"></p>', '2023-07-19', '1689762904.png');

SET FOREIGN_KEY_CHECKS = 1;
