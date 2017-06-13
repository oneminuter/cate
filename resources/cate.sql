# Host: 127.0.0.1  (Version 5.6.11)
# Date: 2017-06-13 21:12:21
# Generator: MySQL-Front 6.0  (Build 1.182)


#
# Structure for table "address"
#

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `PROVINCE` varchar(30) DEFAULT NULL COMMENT '省市区',
  `DETAIL_ADDRESS` varchar(30) DEFAULT NULL COMMENT '详细地址',
  `RECEIVER_NAME` varchar(10) DEFAULT NULL COMMENT '收款人姓名',
  `RECEIVER_GENDER` int(1) DEFAULT '1' COMMENT '收货人性别，0 女， 1 性别',
  `PHONE` varchar(11) DEFAULT NULL COMMENT '收货人手机号码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

#
# Data for table "address"
#

INSERT INTO `address` VALUES (289,287,'太原理工大学-明向校区','3号楼603','林廷勇',1,'13546712752'),(290,287,'酒仙桥路10号富空间','夸克实验室1楼','小林',1,'18310433237'),(393,287,'贵州平塘','中山路供销社','林廷勇',1,'13546712752');

#
# Structure for table "banner"
#

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_NUMBER` int(2) DEFAULT NULL COMMENT '排序序号',
  `IMG_URL` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `LINK_URL` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `IS_ONSHELVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架',
  `ONSHELVE_TIME` datetime NOT NULL DEFAULT '2017-04-04 18:15:34' COMMENT '上架时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COMMENT='banner表';

#
# Data for table "banner"
#

INSERT INTO `banner` VALUES (369,0,'/cateUploadFile/2017/06/10\\14970419047077.jpeg','index/test',1,'2017-06-10 04:58:24'),(370,0,'/cateUploadFile/2017/06/10\\14970419091549.jpeg','index/test',1,'2017-06-10 04:58:29'),(372,0,'/cateUploadFile/2017/06/10\\14970420316881.jpeg','index/test',1,'2017-06-10 05:00:31'),(400,0,'/cateUploadFile/2017/06/13\\14973323414413.jpeg','index/test',1,'2017-06-13 13:39:01');

#
# Structure for table "collection"
#

DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `FOOD_ID` int(11) DEFAULT '0' COMMENT '食物id',
  `RECOMMENT_ID` int(11) DEFAULT NULL COMMENT '推荐表对应的id',
  `COMMUNITY_ID` int(11) DEFAULT NULL COMMENT '社区话题id',
  `IS_COllECTE` int(2) DEFAULT NULL COMMENT '收藏标志，1 收藏，0 取消收藏',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8 COMMENT='收藏表';

#
# Data for table "collection"
#

INSERT INTO `collection` VALUES (349,287,296,0,0,1),(350,287,0,0,332,0),(399,291,0,0,394,0);

#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `TOPIC_ID` int(11) NOT NULL DEFAULT '0' COMMENT '话题id',
  `TIME` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '评论时间',
  `CONTENT` text NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8 COMMENT='评论表';

#
# Data for table "comment"
#

INSERT INTO `comment` VALUES (382,287,381,'2017-06-11 15:55:21','沙发沙发的撒范德萨发'),(383,287,381,'2017-06-11 15:55:25','双方撒地方都是'),(395,287,394,'2017-06-13 13:34:05','第三方第三方司法所'),(396,287,394,'2017-06-13 13:34:11','问过氛围感染卫生费'),(397,291,394,'2017-06-13 13:34:40','说萨芬撒飞洒发'),(398,291,394,'2017-06-13 13:34:47','无法萨阿迪飞'),(405,287,384,'2017-06-13 19:38:52','抢沙发');

#
# Structure for table "community"
#

DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `CLASSIFY` varchar(10) DEFAULT NULL COMMENT '来自话题分类',
  `TITLE` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `CONTENT` text NOT NULL COMMENT '内容',
  `INTRODUCE` varchar(255) DEFAULT NULL COMMENT '摘要',
  `VIEW` int(8) DEFAULT NULL COMMENT '浏览量',
  `PUBLISH_DATE` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `IS_DELETE` int(2) DEFAULT '0' COMMENT '是否删除标志，1 删除，0 没有删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8 COMMENT='社区表';

#
# Data for table "community"
#

INSERT INTO `community` VALUES (329,287,'美食','你吃过的最好吃的罐头是什么？','正畸的时候，牙套把牙齿勒得不行。\n\n满口牙就像棉花一样柔软无力，插在嘴巴里。\n\n别说吃硬的了，就是吃软的都有点咬不住。\n\n硬邦邦的铁丝还会不停的勾破嘴巴里的黏膜。\n\n话说口腔黏膜的修复能力真是修复中的战斗机。\n\n新伤没消停过，旧疤蹭蹭的好。\n\n待到后来做正颌手术，刚下手术台那阵子，整个嘴巴简直彻底失去了咀嚼功能。\n\n后来我老爹就犯了愁。\n\n这小姑娘天天吸溜鸡蛋羹喝白米粥也不是个事啊。\n\n给你整点改善伙食的吧。\n\n哼哧哼哧淘宝了一只巨大的榨汁机，很多部件，塞满了整整一箱子。\n\n\n爱吃黄瓜吧？爱吃番茄吧？\n\n给你整个番茄黄瓜汁！\n\n星星眼等待果汁出炉，喝了一口，脸色惨白。\n\n强忍住恶心，说，我想去喝口水。\n\n我妈来尝了一下。\n\n然后她吐了。\n\n榨汁失败。\n\n部件实在太多，最后这只榨汁机被束之高阁，因为没人愿意洗。\n\n想起来以前有红果罐头，酸甜可口。\n\n老爹一拍大腿，我来做！\n\n哼哧哼哧买了一堆山楂，拿盐水搓洗干净，拿小刀一个个细细的去了蒂挖了核，酸酸溜溜的装了一锅，加水煮，沸水下冰糖，烧开晾凉放冰箱。\n迫不及待舀了一碗，简直是人间极品。\n\n老爹啊，为什么我以前吃的红果罐头没你这个好吃？\n\n你以为每个厨子都会拿细细的纱布给你反复滤两遍渣？\n\n哦...\n\n好的，这就是我吃过的最好的罐头了。','正畸的时候，牙套把牙齿勒得不行。\n\n满口牙就像棉花一样柔软无力，插在嘴巴里。\n\n别说吃硬的了，就是吃软的都有点咬不住。\n\n',2,'2017-06-07 14:59:11',0),(330,287,'美食','有哪些不为人知的适合油炸的东西？','油炸榴莲！！！！！\n谁炸谁知道。\n榴莲的美味经过热油分子的激荡，也是没Sei了。\n自从上次老婆表妹家的14岁熊孩子拆了我的乐高星球大战还搞丢几个部件后我就偷偷告诉了他这道菜。从那以后，我们两家就没啥来往了。','油炸榴莲！！！！！\n谁炸谁知道。\n榴莲的美味经过热油分子的激荡，也是没Sei了。\n自从上次老婆表妹家的14岁熊孩子拆了我的',0,'2017-06-07 14:59:56',0),(332,287,'美食','有没有什么传统的菜，随着生活水平的提高渐渐消失了的？','是的，随着生活水平的提高，这道菜成了国宴菜了。1992年日本天皇访华时还吃过，回了日本还点过，同和居现在还这么有名，主要就是因为这菜当年是他们家做的。谁叫日本人长寿呢，短命的精日吃了就折寿10年，当然在蚂蚱的世界渐渐消失了。\n另外这道菜产地并不确定，冀鲁豫都有，某省本着“凡是中国的我省有一半分红”的芳草连天精神自己给自己脸上贴金我建议各位谨慎看待，毕竟人类都是从非洲滚出来的，但只有黑叔们混的最差。\n目前来讲，这道菜的菜系分类可以大致归为鲁菜。目前有一些北菜南做的迷踪菜厨子将这玩意再油炸一次，在我看来属于画蛇添足，脱了裤子放P比。\n\n总之作为国宴菜，这道菜对于烹饪技巧的考验远高于对食材的考究。价格上也比较亲民，三天两头老吃肯定是不行，但我历次回国去同和居都要吃一次，算是值得一尝的特色菜品。','是的，随着生活水平的提高，这道菜成了国宴菜了。1992年日本天皇访华时还吃过，回了日本还点过，同和居现在还这么有名，主要就',6,'2017-06-07 15:03:16',0),(384,287,'美食','有什么地方让你觉得「哪怕只为了吃都值得特地跑一趟」？','翻遍了排名前五十的回答，竟然没有人提到沙县！今年去了福建才知道，原来遍布大街小巷的“神烦”沙县小吃，根本就是假沙县。在当地人神秘又自信的推荐下，我第一次在沙县看到超级多不一般的小吃，果然如他预料一样，我完全的懵逼震惊，感觉之前吃的完全就是快餐和水货。↵↵如果我哪天又去了福建还会去一趟沙县，而且那一定是为了吃特地跑一趟的。↵第一道菜：扁肉↵↵在沙县，是没有馄饨这一说法的，正宗的沙县小吃更喜欢叫馄饨为扁肉，扁肉的馅筋道有嚼头，都是因为当地人在处理肉馅的时候通常会用很复杂的工艺，所以才有如此口感的扁肉。而且扁肉的皮一定是爽滑透薄。↵推荐店铺：↵↵在沙县有两家的扁肉不相上下，口味极好！一家是宝珠小吃店，另一家则是庙门扁肉。↵来自蚂蜂窝用户 糖小色↵来自蚂蜂窝用户 庄庄kaka↵↵宝珠小吃店地址：三明沙县府前中路91号。↵庙门扁肉店地址：三明沙县建国路3幢23号。↵// 第二道菜：米冻皮↵↵米冻皮类似于北方的凉皮，沙县人喜欢称之为写米冻，是指在烧开的水中加入米浆搅拌花圈，最后冷却后就可以食用啦。口感和形态和广东的肠粉也有些相近。↵推荐店铺：↵↵这家阿素米冻皮是当地人还爱吃的小吃，一桶白色清爽的米冻皮，一桶红色喜果。夏天吃米冻皮真的很有必要，口感凉爽，非常美味！↵第三道菜：烧麦↵↵不同于北京烧麦的肉馅，江南烧麦的糯米馅，具有古早味的沙县烧麦，里面应该是包裹着粉丝，肉丁、笋丁、香菇丁混合而成的，沾上当地特有的豆豉油，又甜又咸，味道鲜美，绝对正宗！↵蚂蜂窝用户：黄英俊↵↵包馅是一门绝活，小小的皮中，被塞了大大的馅，而且动作极快，转眼间一屉屉的烧麦便层层叠摞起来。与常见的烧麦不同，沙县烧麦上收口是朝下的↵推荐店铺：↵↵1. 阿狗烧麦是一家店面很小的摊子，商标注册证上面的注册名很可爱~大家可以留心看一下。他家的烧麦皮薄个大，味道清淡，特别适合当点心吃。而且他家的金包银也便宜好吃~','翻遍了排名前五十的回答，竟然没有人提到沙县！今年去了福建才知道，原来遍布大街小巷的“神烦”沙县小吃，根本就是假沙县。在当地',4,'2017-06-11 16:37:49',0);

#
# Structure for table "food"
#

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CLASSIFY` varchar(10) NOT NULL DEFAULT 'meishi' COMMENT '分类',
  `SCORE` float(2,1) DEFAULT '5.0' COMMENT '评分',
  `UPDATE_TIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `LONGITUDE` float(10,7) DEFAULT '0.0000000' COMMENT '经度',
  `LATITUDE` float(10,7) DEFAULT '0.0000000' COMMENT '纬度',
  `ADDRESS` varchar(30) DEFAULT NULL COMMENT '省市区',
  `DETAIL_ADDRESS` varchar(30) DEFAULT NULL COMMENT '详细地址',
  `VIEW` int(6) DEFAULT '0' COMMENT '浏览量',
  `IMG_URL` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `NAME` varchar(30) NOT NULL DEFAULT '' COMMENT '食物名称',
  `PRICE` float(6,1) DEFAULT '0.0' COMMENT '价格',
  `REACH_PRICE` float(7,1) DEFAULT '0.0' COMMENT '优惠满足价格',
  `FAVORABLE_PRICE` float(4,1) DEFAULT '0.0' COMMENT '优惠价格',
  `OTHER_FAVORABLE` varchar(30) DEFAULT '' COMMENT '其他优惠说明',
  `CONTENT` text COMMENT '食物内容介绍',
  `STORE_NAME` varchar(20) DEFAULT NULL COMMENT '店名',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8 COMMENT='食物表';

#
# Data for table "food"
#

INSERT INTO `food` VALUES (17,'meishi',5.0,'2017-04-30 19:55:24',0.0000000,0.0000000,'','酒仙桥',0,'/cateUploadFile/2017/04/30\\14935533239607.png','重庆小面',16.0,20.0,3.0,'没有',NULL,'朝阳酒仙桥店'),(18,'meishi',5.0,'2017-04-30 19:56:05',0.0000000,0.0000000,'','将台',0,'/cateUploadFile/2017/04/30\\14935533655803.png','重庆鸡公煲',35.0,40.0,2.0,'没有',NULL,'朝阳酒仙桥店'),(19,'meishi',5.0,'2017-04-30 19:56:43',0.0000000,0.0000000,'','卡布奇诺',0,'/cateUploadFile/2017/04/30\\14935534030382.png','披萨',40.0,50.0,3.0,'没有',NULL,'朝阳酒仙桥店'),(20,'meishi',5.0,'2017-04-30 19:57:25',0.0000000,0.0000000,'','大山子',0,'/cateUploadFile/2017/04/30\\14935534456070.png','烤鱼',65.0,80.0,5.0,'没有',NULL,'朝阳酒仙桥店'),(30,'shicai',6.5,'2017-05-02 16:20:31',0.0000000,0.0000000,'朝阳.酒仙桥','大山子',0,'/cateUploadFile/2017/05/02\\14937132318054.jpeg','重庆鸡公煲',0.0,0.0,0.0,NULL,'<p><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">喜欢吃辣的朋友一定都品尝过重庆鸡公煲。它是一道重口味，令人一吃就难以忘怀的新名菜，同时结合了火锅长盛不衰的经营精华，又具有吃不腻、不厌，同时又给人带来越吃越丰富的感受。重庆鸡公煲色泽红润，口味香醇，是一道丰餐美食，吃后令人留有一种难以忘怀的味觉享受。重庆鸡公煲具有香味浓郁，鲜嫩适口，百吃不厌，百吃不腻，是美食市场的新亮点。</span><br/><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">在这乍暖还寒的季节里，吃上一锅香气四溢、辣得过瘾的重庆鸡公煲是一件再过瘾不过的事情了，嘿嘿！</span><br/><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">这道美味的传统做法比较复杂和讲究，不仅要用到很多香料，还要有红油（老油），过程比较复杂。</span><br/><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">这次啊，我用了个懒人的做法，简简单单几个步骤，就做出了和传统做法味道非常相似的重庆鸡公煲。</span><br/><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">其实，刚做出来的时候要比这个照片漂亮，由于我当时有事没能及时拍片，后来又加了点水加热了一下下，导致汤汁、鸡肉整体颜色变的有点淡。稍微有点遗憾，但是丝毫不影响口感，吃着，依然是辣的过瘾！</span></p><p><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\"><br/></span></p>',NULL),(32,'shicai',6.0,'2017-05-02 16:28:55',0.0000000,0.0000000,'朝阳.酒仙桥','将台路',0,'/cateUploadFile/2017/05/02\\14937137350779.jpeg','海带排骨汤',0.0,0.0,0.0,NULL,'<p><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">海带排骨汤， 是一道非常易做又美味的家常汤，海带含有丰富的钙。</span></p>',NULL),(34,'shicai',6.6,'2017-05-02 16:34:13',0.0000000,0.0000000,NULL,NULL,0,'/cateUploadFile/2017/05/02\\14937140529997.jpeg','糖醋鲤鱼',0.0,0.0,0.0,NULL,'<p><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">“糖醋鲤鱼”是山东济南的传统名菜。济南北临黄河，黄河鲤鱼不仅肥嫩鲜美，而且金鳞赤尾，形态可 爱，是宴会上的佳肴。《济南府志》上早有“黄河之鲤，南阳之蟹，且入食谱”的记载。</span></p>',NULL),(36,'shipu',5.3,'2017-05-02 16:53:29',0.0000000,0.0000000,NULL,NULL,0,'/cateUploadFile/2017/05/02\\14937152092630.jpeg','洋葱炒鸡蛋',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; white-space: normal; background-color: rgb(255, 255, 255);\">洋葱炒鸡蛋的做法步骤</h3><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715085916056472.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：1\"/></p><p>1</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">准备好鸡蛋、洋葱。</span></p><p></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715113030032442.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：2\"/></span></p><p>2</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">鸡蛋打入碗中。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715130028033548.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：3\"/></span></p><p>3</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">洋葱剥去外皮，洗净，切细丝。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715142276016018.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：4\"/></span></p><p>4</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">与蛋液混合，加入少许料酒、盐调味，搅拌均匀。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715150908088642.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：5\"/></span></p><p>5</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">锅中倒少许油，6成热时倒入洋葱蛋糊。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715172172051542.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：6\"/></span></p><p>6</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">待蛋液稍定型，翻炒一下。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715187726099332.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：7\"/></span></p><p>7</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">不断翻炒片刻。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715195974001799.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：8\"/></span></p><p>8</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">见洋葱变软，鸡蛋上色即可。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715202850043689.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：9\"/></span></p><p>9</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">装入盘中，简单好吃的菜肴哦~</span></p><p><br/></p>',NULL),(37,'shipu',5.4,'2017-05-02 17:00:54',0.0000000,0.0000000,NULL,NULL,0,'/cateUploadFile/2017/05/02\\14937156548680.jpeg','干锅菜花',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">干锅菜花的做法步骤</h3><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715646993068101.jpg\" alt=\"干锅菜花的做法步骤：1\"/></p><p>&nbsp;</p><p>1</p><p>腊肉用温水洗净，上锅蒸约20分钟至肥肉透明。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647034081472.jpg\" alt=\"干锅菜花的做法步骤：2\"/></p><p>&nbsp;</p><p>2</p><p>取出腊肉切厚薄均匀的片。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647133046517.jpg\" alt=\"干锅菜花的做法步骤：3\"/></p><p>&nbsp;</p><p>3</p><p>红辣椒洗净斜切成片、蒜切片；菜花掰成小朵，用淡盐水浸泡5分钟沥干。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647189018202.jpg\" alt=\"干锅菜花的做法步骤：4\"/></p><p>&nbsp;</p><p>4</p><p>锅置火上适量油烧热，爆香蒜片、红辣椒。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647213099161.jpg\" alt=\"干锅菜花的做法步骤：5\"/></p><p>&nbsp;</p><p>5</p><p>放入腊肉翻炒出油，并滗去多余的油。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647267034747.jpg\" alt=\"干锅菜花的做法步骤：6\"/></p><p>&nbsp;</p><p>6</p><p>下入菜花翻炒片刻。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647283005876.jpg\" alt=\"干锅菜花的做法步骤：7\"/></p><p>&nbsp;</p><p>7</p><p>调入生抽、蚝油、白糖，翻炒均匀。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647323071460.jpg\" alt=\"干锅菜花的做法步骤：8\"/></p><p>&nbsp;</p><p>8</p><p>转至干锅，点上酒精灯便可边热边吃。</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">小窍门</h3><p>1、一般腊肉都经过腌制风干而成，水份少，且质地干硬，建议先将腊肉用温水泡软蒸熟，就容易切成薄片了。<br/><br/><br/><br/>2、腊肉煸出油后倒出锅内的余油，再放入菜花翻炒，以免成菜过于油腻。<br/><br/><br/><br/>3、菜花的热量低，富含高食物纤维，具有抗癌作用，还有助于解除水肿，改善便秘。<br/><br/><br/><br/>4、散菜花相对圆头菜花更嫩，烹饪时间也更短，大火炒制3-4分钟左右就熟。</p><p>使用的厨具：平底锅</p><p><br/></p>',NULL),(39,'shipu',7.0,'2017-05-02 17:03:24',0.0000000,0.0000000,'贵州.平塘','休闲广场',0,'/cateUploadFile/2017/05/02\\14937158049243.jpeg','酸辣粉',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">酸辣粉的做法步骤</h3><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787127083649.jpg\" alt=\"酸辣粉的做法步骤：1\"/></p><p>&nbsp;</p><p>1</p><p>辣椒面和花椒粒放进耐热容器中，大一点儿，否色溢出来就不好了；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787489069288.jpg\" alt=\"酸辣粉的做法步骤：2\"/></p><p>&nbsp;</p><p>2</p><p>烧热玉米油至6成热——何为6成热？把手掌放在油锅上，掌心微微发热，油面稍有动静就差不过——关火，晃晃油锅，再略降降温；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787555001798.jpg\" alt=\"酸辣粉的做法步骤：3\"/></p><p>&nbsp;</p><p>3</p><p>将一半的热油倒进辣椒面中，搅拌均匀；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787612091470.jpg\" alt=\"酸辣粉的做法步骤：4\"/></p><p>&nbsp;</p><p>4</p><p>等半分钟到一分钟的样子，再把剩余的热油倒进辣椒面里，搅拌均匀；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787636006687.jpg\" alt=\"酸辣粉的做法步骤：5\"/></p><p>&nbsp;</p><p>5</p><p>加入生抽，</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787660022497.jpg\" alt=\"酸辣粉的做法步骤：6\"/></p><p>&nbsp;</p><p>6</p><p>加入芝麻酱和芝麻油，搅拌均匀。油辣椒即成。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787769079610.jpg\" alt=\"酸辣粉的做法步骤：7\"/></p><p>&nbsp;</p><p>7</p><p>红薯粉，用50——60度的水泡发10分钟至微软（此微软非彼”微软“，哈哈~）</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787801030111.jpg\" alt=\"酸辣粉的做法步骤：8\"/></p><p>&nbsp;</p><p>8</p><p>锅中入水，烧至沸腾后，下入泡软的粉条煮30秒（半分钟）；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788243051670.jpg\" alt=\"酸辣粉的做法步骤：9\"/></p><p>&nbsp;</p><p>9</p><p>立即捞出粉条，过凉水并沥干水分备用；（切切：如果这时粉条仍然发硬，可以将粉条再次入沸水中煮30秒，再次捞出过凉，直到粉条熟透，非常柔软，而且呈透明状。如果煮两次还发硬，还可以继续反复煮和冲水，每次煮的时间以30秒为佳，过度煮会是粉条黏软失去弹性。反复煮和冲水过凉，不仅可以是粉条熟软筋道，还可以去除粉条的腥气。我不能提供准确的煮、冲的次数，因为干粉条本身的含水量是不一样的，不同的品牌、不同的地域、不同的季节，粉条吃水的情况都不一样）</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788300094358.jpg\" alt=\"酸辣粉的做法步骤：10\"/></p><p>&nbsp;</p><p>10</p><p>用煮过粉条的开水，乘势烫烫青菜，并过凉水沥干备用。（讲究些，也可以重新烧开水烫蔬菜，我又偷懒了）</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788371074966.jpg\" alt=\"酸辣粉的做法步骤：11\"/></p><p>&nbsp;</p><p>11</p><p>锅中入油，小火爆香豆瓣酱，至出红油；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788420083472.jpg\" alt=\"酸辣粉的做法步骤：12\"/></p><p>&nbsp;</p><p>12</p><p>加入姜蒜末，煸炒出香味；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788465009665.jpg\" alt=\"酸辣粉的做法步骤：13\"/></p><p>&nbsp;</p><p>13</p><p>下入鸡汤，量自己控制，宽一点儿好；没有鸡汤就用开水；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788493018599.jpg\" alt=\"酸辣粉的做法步骤：14\"/></p><p>&nbsp;</p><p>14</p><p>大火煮开后，加入1大勺油辣椒，关火。汤底即成！</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788577099267.jpg\" alt=\"酸辣粉的做法步骤：15\"/></p><p>&nbsp;</p><p>15</p><p>花生米和凉油一起入锅，开小火慢慢炸熟；放凉变酥脆后，粗粗压碎备用。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788913018477.jpg\" alt=\"酸辣粉的做法步骤：16\"/></p><p>&nbsp;</p><p>16</p><p>碗底加入酱油、醋、糖、花椒粉、胡椒粉，并1小勺油辣椒；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715789029032258.jpg\" alt=\"酸辣粉的做法步骤：17\"/></p><p>&nbsp;</p><p>17</p><p>铺上烫过的青菜，放上处理好的红薯粉；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715789080030133.jpg\" alt=\"酸辣粉的做法步骤：18\"/></p><p>&nbsp;</p><p>18</p><p>冲入足量的汤（不建议用这样的小碗，用大碗，汤量足足的，把粉粉和调味料都冲散，还有留出足够的空间放那些碎末末。我不是为了”泡死“拍照嘛！）</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715789185017363.jpg\" alt=\"酸辣粉的做法步骤：19\"/></p><p>&nbsp;</p><p>19</p><p>最后，撒上香菜碎、香葱碎、芹菜末、榨菜末，花生碎（酥豆）、红椒圈，即可。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715789225019714.jpg\" alt=\"酸辣粉的做法步骤：20\"/></p><p>&nbsp;</p><p>20</p><p>与油辣椒和香醋碗一起上桌！谁要觉得还不够辣、不够酸，自己动手吧！</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">小窍门</h3><p>不敢说正宗，但是口味地道，不信就尝尝吧！</p><p>使用的厨具：煮锅、炒锅</p><p><br/></p>',NULL),(40,'shipu',6.0,'2017-05-02 17:28:53',0.0000000,0.0000000,NULL,NULL,0,'/cateUploadFile/2017/05/02\\14937173332125.jpeg','芒果黑米捞',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">芒果黑米捞的做法步骤</h3><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493717327957063775.jpg\" alt=\"芒果黑米捞的做法步骤：1\"/></p><p>&nbsp;</p><p>1</p><p>黑米提前四小时泡水泡好后捞出倒电饭煲跟煮饭一样按煮饭键就可以了，</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493717328018067667.jpg\" alt=\"芒果黑米捞的做法步骤：2\"/></p><p>&nbsp;</p><p>2</p><p>芒果 草莓洗净 草莓切对半 芒果切小块将煮好的黑米盛到饭碗</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493717328048049500.jpg\" alt=\"芒果黑米捞的做法步骤：3\"/></p><p>&nbsp;</p><p>3</p><p>将盛好的黑米倒入大一些的碗在将切好的芒果草莓放入黑米旁边倒上椰汁 即可享用了 喜欢冰冻的可放冰箱冰后在吃 喜欢吃甜些的可以加蜂蜜或白糖 我个人觉得刚刚好因为水果是甜的椰汁也是甜的，</p></li></ul><p><br/></p>',NULL),(41,'other',6.3,'2017-05-02 17:40:25',0.0000000,0.0000000,'贵州.平塘','满仙桥',0,'/cateUploadFile/2017/05/02\\14937180250750.jpeg','凉拌鸡爪',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">香辣凉拌鸡爪的做法步骤</h3><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597139089541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：1\"/></p><p>&nbsp;</p><p>1</p><p>准备鸡爪10只</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597175029541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：2\"/></p><p>&nbsp;</p><p>2</p><p>将鸡爪放入锅中，加入一勺料酒、葱段、花椒。煮开后上盖转小火煮10-12分钟</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597202249541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：3\"/></p><p>&nbsp;</p><p>3</p><p>煮熟的鸡爪用清水冲洗干净，盛出放凉备用</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597306029541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：4\"/></p><p>&nbsp;</p><p>4</p><p>其他配料如图，姜蒜切碎，干辣椒、香菜、葱分别切段</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597438209541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：5\"/></p><p>&nbsp;</p><p>5</p><p>放凉的鸡爪对半切开</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597501339541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：6\"/></p><p>&nbsp;</p><p>6</p><p>锅内加一点油，下入姜、蒜、干辣椒小火炒出香味后关火</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597601259541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：7\"/></p><p>&nbsp;</p><p>7</p><p>待锅内的配料降温后，放入鸡爪、调入一勺生抽、一勺香醋、一勺香辣酱、一点盐、鸡粉、芝麻油</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597668029541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：8\"/></p><p>&nbsp;</p><p>8</p><p>将锅内食材拌均匀</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597729369541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：9\"/></p><p>&nbsp;</p><p>9</p><p>最后加入香菜和葱段拌一下</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932603468959541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：10\"/></p><p>&nbsp;</p><p>10</p><p>成品图</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">小窍门</h3><p>1、鸡爪煮的时间不宜过长10-12分钟为宜，才能保证煮熟后鸡爪中的筋有点脆的口感<br/>2、下锅凉拌时加入一勺香辣酱和一勺香醋，味道好不少。调料随个人喜欢也可以做成麻辣味的</p><p>使用的厨具：炒锅</p><p><br/></p>',NULL),(296,'shicai',5.5,'2017-06-04 14:49:16',0.0000000,0.0000000,'酒仙桥路','肯德基店',0,'/cateUploadFile/2017/06/04\\14965589561540.jpeg','黄油吐司脆条',0.0,0.0,0.0,NULL,'<p style=\"text-align: center;\">将黄油融化，用刷子均匀的刷在吐司表面，再均匀的撒上少许白砂糖。</p><p style=\"text-align: center;\">切成条状铺在烤盘里。</p><p style=\"text-align: center;\">烤盘放在烤箱中层，用190度烤8分钟左右，至表面金黄色即可。</p><p style=\"text-align: center;\">&nbsp;趁热享用，外表香甜酥脆，里面松软，美味极了。</p><p style=\"text-align: center;\">使用的厨具：电烤箱&quot;</p><p><br/></p>',NULL);

#
# Structure for table "hibernate_sequence"
#

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "hibernate_sequence"
#

INSERT INTO `hibernate_sequence` VALUES (406),(406);

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` varchar(64) NOT NULL DEFAULT '' COMMENT '订单id',
  `FOOD_ID` int(11) NOT NULL DEFAULT '0' COMMENT '关联的食物id',
  `USER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `CASH` float(4,1) DEFAULT NULL COMMENT '代金券',
  `STORE_NAME` varchar(20) DEFAULT NULL COMMENT '店铺名',
  `FOOD_NAME` varchar(30) NOT NULL DEFAULT '' COMMENT '食物名称',
  `PRICE` float(6,1) NOT NULL DEFAULT '0.0' COMMENT '单价',
  `FOOD_COST` float(6,1) NOT NULL DEFAULT '0.0' COMMENT '食物花费',
  `BUY_NUMBER` int(2) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `PACK_FEE` float(3,1) DEFAULT '1.5' COMMENT '包装费',
  `FREIGHT` float(3,1) DEFAULT NULL COMMENT '运送费',
  `FAVORABLE_PRICE` float(3,1) DEFAULT NULL COMMENT '满减优惠价',
  `TOTAL_COST` float(7,1) NOT NULL DEFAULT '0.0' COMMENT '总花费，不算用代金券抵扣',
  `PAYMENT` float(7,1) DEFAULT NULL COMMENT '待支付',
  `PEOPLE_NUMBER` int(2) DEFAULT '1' COMMENT '用餐人数',
  `OTHER` varchar(30) DEFAULT NULL COMMENT '备注（口味，偏好）',
  `STATE` int(1) DEFAULT '0' COMMENT '订单状态，0未支付，1已支付，-1取消订单',
  `ORDER_DATE` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '下单日期',
  `RECEIVER_ADDRESS` varchar(50) DEFAULT NULL COMMENT '收货地址',
  `PAY_METHOD` varchar(10) DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 COMMENT='订单表';

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (353,'ed01f591-1074-4544-b0a2-4e3409c00de8',18,287,2.0,'朝阳酒仙桥店','重庆鸡公煲',35.0,35.0,1,1.5,5.0,4.0,37.5,35.5,2,'多放辣',1,'2017-06-07 18:20:44','酒仙桥路10号富空间\t夸克实验室1楼\n小林\t先生\t18310433237','在线支付'),(390,'ec027ff6-b826-4cf1-aed9-3ded0fd28eea',17,287,2.0,'朝阳酒仙桥店','重庆小面',16.0,80.0,5,1.5,5.0,4.0,82.5,80.5,2,'不吃辣 不吃香菜',1,'2017-06-13 13:27:51','酒仙桥路10号富空间\t夸克实验室1楼\n小林\t先生\t18310433237','微信支付');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PHONE` varchar(11) NOT NULL DEFAULT '' COMMENT '电话',
  `PASSWORD` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `UERNAME` varchar(15) DEFAULT NULL COMMENT '用户名',
  `CASH` float(4,1) DEFAULT NULL COMMENT '代金券',
  `GENDER` int(1) DEFAULT '0' COMMENT '性别，1 男，0 女',
  `DEFAULT_ADDRESS_ID` int(11) DEFAULT NULL COMMENT '默认地址id',
  `BALANCE` float(5,2) DEFAULT '0.00' COMMENT '余额',
  `ICON` varchar(255) DEFAULT 'img/user.svg' COMMENT '头像',
  `INTEGRAL` int(6) DEFAULT '0' COMMENT '积分',
  `IS_ADMIN` tinyint(1) DEFAULT '0' COMMENT '是否是管理员',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "user"
#

INSERT INTO `user` VALUES (287,'13546712752','827ccb0eea8a706c4c34a16891f84e7b','oneminuter',3.0,1,0,52.00,'/cateUploadFile/2017/06/13\\14973579084622.jpeg',234,1),(404,'18310433238','827ccb0eea8a706c4c34a16891f84e7b','小林',13.5,0,0,234.00,'/cateUploadFile/2017/06/13\\14973579163527.jpeg',345,0);
