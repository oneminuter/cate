# Host: 127.0.0.1  (Version 5.6.11)
# Date: 2017-05-27 21:51:59
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
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

#
# Data for table "address"
#

INSERT INTO `address` VALUES (289,287,'太原理工大学-明向校区','3号楼603','林廷勇',1,'13546712752'),(290,287,'酒仙桥路10号富空间','夸克实验室1楼','小林',1,'18310433237');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='banner表';

#
# Data for table "banner"
#

INSERT INTO `banner` VALUES (1,0,'/cateUploadFile/2017/05/15\\14948634470487.jpeg','test.html',1,'2017-05-15 23:50:56'),(2,0,'/cateUploadFile/2017/05/15\\14948634712540.jpeg','test.html',1,'2017-05-15 23:51:11'),(3,0,'/cateUploadFile/2017/05/15\\14948634798382.jpeg','test.html',1,'2017-05-15 23:51:19');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

#
# Data for table "collection"
#


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

#
# Data for table "comment"
#


#
# Structure for table "community"
#

DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `TOPIC` varchar(10) DEFAULT NULL COMMENT '来自话题分类',
  `TITLE` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `CONTENT` text NOT NULL COMMENT '内容',
  `INTRODUCE` varchar(255) DEFAULT NULL COMMENT '摘要',
  `VIEW` int(8) DEFAULT NULL COMMENT '浏览量',
  `PUBLISH_DATE` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `IS_DELETE` int(2) DEFAULT '0' COMMENT '是否删除标志，1 删除，0 没有删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社区表';

#
# Data for table "community"
#

INSERT INTO `community` VALUES (1,287,'美食','你因为贪吃付出过怎样惨痛的代价','<p>\n\t\t知乎小透明第一次回答问题哈哈哈(ㅎ ̮ ㅎ)\n去年元旦的时候全家一起去吃自助餐，当时由于是快过年了去吃饭的人比较多我本来就不喜欢排队等饭然后就把包里随身带的两盒饼干一盒奶一个小蛋糕吃了嗯好吃\n谁知道立刻 听到“23号到你们了”！？？？？exo me？？于是就进去以不要钱随便吃的阔气想法扫荡全场如果早知道的话当时一定要铭记猥琐发育别浪这种话！！但是就是哥哥请客了可以随便吃啊哈哈哈\n烤肉一盘一盘又一盘蛋糕一盘一盘又一盘烤串关东煮海鲜沙拉披萨汉堡薯条骨肉相连鸡柳鸡腿寿司好了不说了上着课呢又开始饿了(つд⊂)前台一说新菜上了第一个跑过去的永远是我哈哈哈•̀.̫•́✧\n然鹅 我很快发现我的肚子好像装了10个可以大大大的金箍棒。瘫在沙发上的我像一条咸鱼一样渴望着水喝了两杯可乐后打了一个足以让旁桌的小姐姐和服务员小哥哥对我报以神秘的微笑后的嗝后，冲向了厕所。\n一阵噼里啪啦嗵的让清洁阿姨可能误以为隔间在装修的不可描述的声音后，我心满意足的提起裤子......又听话的蹲了下来安静的接受它的第二次攻击.....10分钟后终于哈哈哈站起来了哼出门\n我的妈呀呀呀呀呀呀老娘的裤子扣什么时候崩了！！！！没关系静下心来你是最可爱的小公举！！！嗯？卫衣帽子里边的挂绳好像没什么用呢。没错我真是最冰雪聪明的女孩子哼拴起我的裤腰带扭着小翘臀回到战场。果然惊喜总是接二连三的我的身体里好像有一股热流缓缓而来脸色复杂的我像偷王母娘娘的内裤一样拿起了我粉红色的小宝贝却忘了拿纸走进了卫生间。嗯最尴尬的永远在后面\n\n妈妈走了进来告诉我说我三个月的小侄子拉粑粑了忘带尿不湿了拿我一个夜用加日用exo me？？？“那我用什么”？？？“噢给你留了一个小护垫”告诉了妈妈记得给我拿纸她就头也不回的走了，终于在我的屁股要被风干的时候她来了...没关系冲冲水站起来我还是最可爱的小公举！！！嗯...除了回去的路上我两次吐到车上和餐厅里的人没有没有对我侄子屁屁上的小粉红报以礼貌的笑容的话这一定是完美的一次聚餐！\n\t</p>','你因为贪吃付出过怎样惨痛的代价你因为贪吃付出过怎样惨痛的代价你因为贪吃付出过怎样惨痛的代价你因为贪吃付出过怎样惨痛的代价你因为贪吃付出过怎样惨痛的代价你因为贪吃付出过怎样惨痛的代价',13,'2017-05-02 17:40:25',0),(2,287,'食谱','凉拌鸡爪','喜欢吃辣的朋友一定都品尝过重庆鸡公煲。它是一道重口味，令人一吃就难以忘怀的新名菜，同时结合了火锅长盛不衰的经营精华，又具有吃不腻、不厌，同时又给人带来越吃越丰富的感受。重庆鸡公煲色泽红润，口味香醇，是一道丰餐美食，吃后令人留有一种难以忘怀的味觉享受。重庆鸡公煲具有香味浓郁，鲜嫩适口，百吃不厌，百吃不腻，是美食市场的新亮点。','喜欢吃辣的朋友一定都品尝过重庆鸡公煲。它是一道重口味，令人一吃就难以忘怀的新名菜，同时结合了火锅长盛不衰的经营精华，又具有吃不腻、不厌，同时又给人带来越吃越丰富的感受',6,'2017-05-02 17:40:25',0);

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
  `CONTENT` text COMMENT '事物内容介绍',
  `STORE_NAME` varchar(20) DEFAULT NULL COMMENT '店名',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='食物表';

#
# Data for table "food"
#

INSERT INTO `food` VALUES (17,'meishi',5.0,'2017-04-30 19:55:24',0.0000000,0.0000000,'','酒仙桥',0,'/cateUploadFile/2017/04/30\\14935533239607.png','重庆小面',16.0,20.0,1.0,'没有',NULL,'朝阳酒仙桥店'),(18,'meishi',5.0,'2017-04-30 19:56:05',0.0000000,0.0000000,'','将台',0,'/cateUploadFile/2017/04/30\\14935533655803.png','重庆鸡公煲',35.0,40.0,2.0,'没有',NULL,'朝阳酒仙桥店'),(19,'meishi',5.0,'2017-04-30 19:56:43',0.0000000,0.0000000,'','卡布奇诺',0,'/cateUploadFile/2017/04/30\\14935534030382.png','披萨',40.0,50.0,3.0,'没有',NULL,'朝阳酒仙桥店'),(20,'meishi',5.0,'2017-04-30 19:57:25',0.0000000,0.0000000,'','大山子',0,'/cateUploadFile/2017/04/30\\14935534456070.png','烤鱼',65.0,80.0,5.0,'没有',NULL,'朝阳酒仙桥店'),(30,'shicai',6.5,'2017-05-02 16:20:31',0.0000000,0.0000000,'朝阳.酒仙桥','大山子',0,'/cateUploadFile/2017/05/02\\14937132318054.jpeg','重庆鸡公煲',0.0,0.0,0.0,NULL,'<p><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">喜欢吃辣的朋友一定都品尝过重庆鸡公煲。它是一道重口味，令人一吃就难以忘怀的新名菜，同时结合了火锅长盛不衰的经营精华，又具有吃不腻、不厌，同时又给人带来越吃越丰富的感受。重庆鸡公煲色泽红润，口味香醇，是一道丰餐美食，吃后令人留有一种难以忘怀的味觉享受。重庆鸡公煲具有香味浓郁，鲜嫩适口，百吃不厌，百吃不腻，是美食市场的新亮点。</span><br/><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">在这乍暖还寒的季节里，吃上一锅香气四溢、辣得过瘾的重庆鸡公煲是一件再过瘾不过的事情了，嘿嘿！</span><br/><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">这道美味的传统做法比较复杂和讲究，不仅要用到很多香料，还要有红油（老油），过程比较复杂。</span><br/><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">这次啊，我用了个懒人的做法，简简单单几个步骤，就做出了和传统做法味道非常相似的重庆鸡公煲。</span><br/><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">其实，刚做出来的时候要比这个照片漂亮，由于我当时有事没能及时拍片，后来又加了点水加热了一下下，导致汤汁、鸡肉整体颜色变的有点淡。稍微有点遗憾，但是丝毫不影响口感，吃着，依然是辣的过瘾！</span></p><p><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\"><br/></span></p>',NULL),(32,'shicai',6.0,'2017-05-02 16:28:55',0.0000000,0.0000000,'朝阳.酒仙桥','将台路',0,'/cateUploadFile/2017/05/02\\14937137350779.jpeg','海带排骨汤',0.0,0.0,0.0,NULL,'<p><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">海带排骨汤， 是一道非常易做又美味的家常汤，海带含有丰富的钙。</span></p>',NULL),(33,'shicai',5.5,'2017-05-02 16:31:14',0.0000000,0.0000000,'酒仙桥路','肯德基店',0,'/cateUploadFile/2017/05/02\\14937138743331.jpeg','黄油吐司脆条',0.0,0.0,0.0,NULL,'<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p><span style=\"font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255); font-size: 14px; color: rgb(0, 0, 0);\">将黄油融化，用刷子均匀的刷在吐司表面，再均匀的撒上少许白砂糖。</span></p></li><li><p><span style=\"font-size: 14px; color: rgb(0, 0, 0);\">切成条状铺在烤盘里。</span></p></li><li><p><span style=\"font-size: 14px; color: rgb(0, 0, 0);\">烤盘放在烤箱中层，用190度烤8分钟左右，至表面金黄色即可。<br/></span></p></li><li><p><span style=\"font-size: 14px; color: rgb(0, 0, 0);\">&nbsp;趁热享用，外表香甜酥脆，里面松软，美味极了。</span></p></li><li><p><span style=\"font-size: 14px; color: rgb(0, 0, 0);\">使用的厨具：电烤箱</span></p></li></ol>',NULL),(34,'shicai',6.6,'2017-05-02 16:34:13',0.0000000,0.0000000,NULL,NULL,0,'/cateUploadFile/2017/05/02\\14937140529997.jpeg','糖醋鲤鱼',0.0,0.0,0.0,NULL,'<p><span style=\"color: rgb(88, 88, 88); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; background-color: rgb(255, 255, 255);\">“糖醋鲤鱼”是山东济南的传统名菜。济南北临黄河，黄河鲤鱼不仅肥嫩鲜美，而且金鳞赤尾，形态可 爱，是宴会上的佳肴。《济南府志》上早有“黄河之鲤，南阳之蟹，且入食谱”的记载。</span></p>',NULL),(36,'shipu',5.3,'2017-05-02 16:53:29',0.0000000,0.0000000,NULL,NULL,0,'/cateUploadFile/2017/05/02\\14937152092630.jpeg','洋葱炒鸡蛋',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; white-space: normal; background-color: rgb(255, 255, 255);\">洋葱炒鸡蛋的做法步骤</h3><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715085916056472.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：1\"/></p><p>1</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">准备好鸡蛋、洋葱。</span></p><p></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715113030032442.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：2\"/></span></p><p>2</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">鸡蛋打入碗中。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715130028033548.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：3\"/></span></p><p>3</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">洋葱剥去外皮，洗净，切细丝。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715142276016018.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：4\"/></span></p><p>4</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">与蛋液混合，加入少许料酒、盐调味，搅拌均匀。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715150908088642.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：5\"/></span></p><p>5</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">锅中倒少许油，6成热时倒入洋葱蛋糊。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715172172051542.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：6\"/></span></p><p>6</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">待蛋液稍定型，翻炒一下。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715187726099332.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：7\"/></span></p><p>7</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">不断翻炒片刻。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715195974001799.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：8\"/></span></p><p>8</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">见洋葱变软，鸡蛋上色即可。</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\"><img src=\"../cateUploadFile/ueditor/img/20170502/1493715202850043689.jpg\" alt=\"洋葱炒鸡蛋的做法步骤：9\"/></span></p><p>9</p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Hiragino Sans GB&quot;, STHeiti, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, Arial, serif; font-size: 18px; background-color: rgb(255, 255, 255);\">装入盘中，简单好吃的菜肴哦~</span></p><p><br/></p>',NULL),(37,'shipu',5.4,'2017-05-02 17:00:54',0.0000000,0.0000000,NULL,NULL,0,'/cateUploadFile/2017/05/02\\14937156548680.jpeg','干锅菜花',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">干锅菜花的做法步骤</h3><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715646993068101.jpg\" alt=\"干锅菜花的做法步骤：1\"/></p><p>&nbsp;</p><p>1</p><p>腊肉用温水洗净，上锅蒸约20分钟至肥肉透明。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647034081472.jpg\" alt=\"干锅菜花的做法步骤：2\"/></p><p>&nbsp;</p><p>2</p><p>取出腊肉切厚薄均匀的片。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647133046517.jpg\" alt=\"干锅菜花的做法步骤：3\"/></p><p>&nbsp;</p><p>3</p><p>红辣椒洗净斜切成片、蒜切片；菜花掰成小朵，用淡盐水浸泡5分钟沥干。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647189018202.jpg\" alt=\"干锅菜花的做法步骤：4\"/></p><p>&nbsp;</p><p>4</p><p>锅置火上适量油烧热，爆香蒜片、红辣椒。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647213099161.jpg\" alt=\"干锅菜花的做法步骤：5\"/></p><p>&nbsp;</p><p>5</p><p>放入腊肉翻炒出油，并滗去多余的油。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647267034747.jpg\" alt=\"干锅菜花的做法步骤：6\"/></p><p>&nbsp;</p><p>6</p><p>下入菜花翻炒片刻。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647283005876.jpg\" alt=\"干锅菜花的做法步骤：7\"/></p><p>&nbsp;</p><p>7</p><p>调入生抽、蚝油、白糖，翻炒均匀。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715647323071460.jpg\" alt=\"干锅菜花的做法步骤：8\"/></p><p>&nbsp;</p><p>8</p><p>转至干锅，点上酒精灯便可边热边吃。</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">小窍门</h3><p>1、一般腊肉都经过腌制风干而成，水份少，且质地干硬，建议先将腊肉用温水泡软蒸熟，就容易切成薄片了。<br/><br/><br/><br/>2、腊肉煸出油后倒出锅内的余油，再放入菜花翻炒，以免成菜过于油腻。<br/><br/><br/><br/>3、菜花的热量低，富含高食物纤维，具有抗癌作用，还有助于解除水肿，改善便秘。<br/><br/><br/><br/>4、散菜花相对圆头菜花更嫩，烹饪时间也更短，大火炒制3-4分钟左右就熟。</p><p>使用的厨具：平底锅</p><p><br/></p>',NULL),(39,'shipu',7.0,'2017-05-02 17:03:24',0.0000000,0.0000000,'贵州.平塘','休闲广场',0,'/cateUploadFile/2017/05/02\\14937158049243.jpeg','酸辣粉',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">酸辣粉的做法步骤</h3><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787127083649.jpg\" alt=\"酸辣粉的做法步骤：1\"/></p><p>&nbsp;</p><p>1</p><p>辣椒面和花椒粒放进耐热容器中，大一点儿，否色溢出来就不好了；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787489069288.jpg\" alt=\"酸辣粉的做法步骤：2\"/></p><p>&nbsp;</p><p>2</p><p>烧热玉米油至6成热——何为6成热？把手掌放在油锅上，掌心微微发热，油面稍有动静就差不过——关火，晃晃油锅，再略降降温；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787555001798.jpg\" alt=\"酸辣粉的做法步骤：3\"/></p><p>&nbsp;</p><p>3</p><p>将一半的热油倒进辣椒面中，搅拌均匀；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787612091470.jpg\" alt=\"酸辣粉的做法步骤：4\"/></p><p>&nbsp;</p><p>4</p><p>等半分钟到一分钟的样子，再把剩余的热油倒进辣椒面里，搅拌均匀；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787636006687.jpg\" alt=\"酸辣粉的做法步骤：5\"/></p><p>&nbsp;</p><p>5</p><p>加入生抽，</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787660022497.jpg\" alt=\"酸辣粉的做法步骤：6\"/></p><p>&nbsp;</p><p>6</p><p>加入芝麻酱和芝麻油，搅拌均匀。油辣椒即成。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787769079610.jpg\" alt=\"酸辣粉的做法步骤：7\"/></p><p>&nbsp;</p><p>7</p><p>红薯粉，用50——60度的水泡发10分钟至微软（此微软非彼”微软“，哈哈~）</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715787801030111.jpg\" alt=\"酸辣粉的做法步骤：8\"/></p><p>&nbsp;</p><p>8</p><p>锅中入水，烧至沸腾后，下入泡软的粉条煮30秒（半分钟）；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788243051670.jpg\" alt=\"酸辣粉的做法步骤：9\"/></p><p>&nbsp;</p><p>9</p><p>立即捞出粉条，过凉水并沥干水分备用；（切切：如果这时粉条仍然发硬，可以将粉条再次入沸水中煮30秒，再次捞出过凉，直到粉条熟透，非常柔软，而且呈透明状。如果煮两次还发硬，还可以继续反复煮和冲水，每次煮的时间以30秒为佳，过度煮会是粉条黏软失去弹性。反复煮和冲水过凉，不仅可以是粉条熟软筋道，还可以去除粉条的腥气。我不能提供准确的煮、冲的次数，因为干粉条本身的含水量是不一样的，不同的品牌、不同的地域、不同的季节，粉条吃水的情况都不一样）</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788300094358.jpg\" alt=\"酸辣粉的做法步骤：10\"/></p><p>&nbsp;</p><p>10</p><p>用煮过粉条的开水，乘势烫烫青菜，并过凉水沥干备用。（讲究些，也可以重新烧开水烫蔬菜，我又偷懒了）</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788371074966.jpg\" alt=\"酸辣粉的做法步骤：11\"/></p><p>&nbsp;</p><p>11</p><p>锅中入油，小火爆香豆瓣酱，至出红油；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788420083472.jpg\" alt=\"酸辣粉的做法步骤：12\"/></p><p>&nbsp;</p><p>12</p><p>加入姜蒜末，煸炒出香味；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788465009665.jpg\" alt=\"酸辣粉的做法步骤：13\"/></p><p>&nbsp;</p><p>13</p><p>下入鸡汤，量自己控制，宽一点儿好；没有鸡汤就用开水；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788493018599.jpg\" alt=\"酸辣粉的做法步骤：14\"/></p><p>&nbsp;</p><p>14</p><p>大火煮开后，加入1大勺油辣椒，关火。汤底即成！</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788577099267.jpg\" alt=\"酸辣粉的做法步骤：15\"/></p><p>&nbsp;</p><p>15</p><p>花生米和凉油一起入锅，开小火慢慢炸熟；放凉变酥脆后，粗粗压碎备用。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715788913018477.jpg\" alt=\"酸辣粉的做法步骤：16\"/></p><p>&nbsp;</p><p>16</p><p>碗底加入酱油、醋、糖、花椒粉、胡椒粉，并1小勺油辣椒；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715789029032258.jpg\" alt=\"酸辣粉的做法步骤：17\"/></p><p>&nbsp;</p><p>17</p><p>铺上烫过的青菜，放上处理好的红薯粉；</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715789080030133.jpg\" alt=\"酸辣粉的做法步骤：18\"/></p><p>&nbsp;</p><p>18</p><p>冲入足量的汤（不建议用这样的小碗，用大碗，汤量足足的，把粉粉和调味料都冲散，还有留出足够的空间放那些碎末末。我不是为了”泡死“拍照嘛！）</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715789185017363.jpg\" alt=\"酸辣粉的做法步骤：19\"/></p><p>&nbsp;</p><p>19</p><p>最后，撒上香菜碎、香葱碎、芹菜末、榨菜末，花生碎（酥豆）、红椒圈，即可。</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493715789225019714.jpg\" alt=\"酸辣粉的做法步骤：20\"/></p><p>&nbsp;</p><p>20</p><p>与油辣椒和香醋碗一起上桌！谁要觉得还不够辣、不够酸，自己动手吧！</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">小窍门</h3><p>不敢说正宗，但是口味地道，不信就尝尝吧！</p><p>使用的厨具：煮锅、炒锅</p><p><br/></p>',NULL),(40,'shipu',6.0,'2017-05-02 17:28:53',0.0000000,0.0000000,NULL,NULL,0,'/cateUploadFile/2017/05/02\\14937173332125.jpeg','芒果黑米捞',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">芒果黑米捞的做法步骤</h3><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493717327957063775.jpg\" alt=\"芒果黑米捞的做法步骤：1\"/></p><p>&nbsp;</p><p>1</p><p>黑米提前四小时泡水泡好后捞出倒电饭煲跟煮饭一样按煮饭键就可以了，</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493717328018067667.jpg\" alt=\"芒果黑米捞的做法步骤：2\"/></p><p>&nbsp;</p><p>2</p><p>芒果 草莓洗净 草莓切对半 芒果切小块将煮好的黑米盛到饭碗</p></li><li><p><img src=\"../cateUploadFile/ueditor/img/20170502/1493717328048049500.jpg\" alt=\"芒果黑米捞的做法步骤：3\"/></p><p>&nbsp;</p><p>3</p><p>将盛好的黑米倒入大一些的碗在将切好的芒果草莓放入黑米旁边倒上椰汁 即可享用了 喜欢冰冻的可放冰箱冰后在吃 喜欢吃甜些的可以加蜂蜜或白糖 我个人觉得刚刚好因为水果是甜的椰汁也是甜的，</p></li></ul><p><br/></p>',NULL),(41,'other',6.3,'2017-05-02 17:40:25',0.0000000,0.0000000,'贵州.平塘','满仙桥',0,'/cateUploadFile/2017/05/02\\14937180250750.jpeg','凉拌鸡爪',0.0,0.0,0.0,NULL,'<h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">香辣凉拌鸡爪的做法步骤</h3><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597139089541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：1\"/></p><p>&nbsp;</p><p>1</p><p>准备鸡爪10只</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597175029541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：2\"/></p><p>&nbsp;</p><p>2</p><p>将鸡爪放入锅中，加入一勺料酒、葱段、花椒。煮开后上盖转小火煮10-12分钟</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597202249541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：3\"/></p><p>&nbsp;</p><p>3</p><p>煮熟的鸡爪用清水冲洗干净，盛出放凉备用</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597306029541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：4\"/></p><p>&nbsp;</p><p>4</p><p>其他配料如图，姜蒜切碎，干辣椒、香菜、葱分别切段</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597438209541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：5\"/></p><p>&nbsp;</p><p>5</p><p>放凉的鸡爪对半切开</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597501339541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：6\"/></p><p>&nbsp;</p><p>6</p><p>锅内加一点油，下入姜、蒜、干辣椒小火炒出香味后关火</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597601259541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：7\"/></p><p>&nbsp;</p><p>7</p><p>待锅内的配料降温后，放入鸡爪、调入一勺生抽、一勺香醋、一勺香辣酱、一点盐、鸡粉、芝麻油</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597668029541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：8\"/></p><p>&nbsp;</p><p>8</p><p>将锅内食材拌均匀</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932597729369541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：9\"/></p><p>&nbsp;</p><p>9</p><p>最后加入香菜和葱段拌一下</p></li><li><p><img src=\"http://i3.meishichina.com/attachment/recipe/2017/04/27/2017042714932603468959541848.jpg@!p320\" alt=\"香辣凉拌鸡爪的做法步骤：10\"/></p><p>&nbsp;</p><p>10</p><p>成品图</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 20px; font-weight: 400; color: rgb(51, 51, 51);\">小窍门</h3><p>1、鸡爪煮的时间不宜过长10-12分钟为宜，才能保证煮熟后鸡爪中的筋有点脆的口感<br/>2、下锅凉拌时加入一勺香辣酱和一勺香醋，味道好不少。调料随个人喜欢也可以做成麻辣味的</p><p>使用的厨具：炒锅</p><p><br/></p>',NULL);

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

INSERT INTO `hibernate_sequence` VALUES (296),(296);

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
  `STATE` int(1) DEFAULT '0' COMMENT '订单状态，0未支付，1已支付',
  `ORDER_DATE` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '下单日期',
  `RECEIVER_ADDRESS` varchar(50) DEFAULT NULL COMMENT '收货地址',
  `PAY_METHOD` varchar(10) DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COMMENT='订单表';

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (288,'0449f954-1aec-447f-911d-c0f250e86b38',20,0,2.0,'朝阳酒仙桥店','烤鱼',65.0,65.0,1,1.5,5.0,4.0,67.5,65.5,1,'多放辣',1,'2017-05-25 12:22:46','酒仙桥路10号富空间\t夸克实验室1楼\n小林\t先生\t18310433237','微信支付'),(292,'987194ce-8c0c-4a1f-a766-0aa968dc4d1b',19,0,2.0,'朝阳酒仙桥店','披萨',40.0,40.0,1,1.5,5.0,4.0,42.5,40.5,3,'多放辣 不吃葱',1,'2017-05-26 13:17:47','酒仙桥路10号富空间\t夸克实验室1楼\n小林\t先生\t18310433237','微信支付'),(293,'7a8219cb-b520-48c3-a671-943beb2d999e',20,0,2.0,'朝阳酒仙桥店','烤鱼',65.0,65.0,1,1.5,5.0,4.0,67.5,65.5,4,'少放辣',1,'2017-05-26 20:25:39','酒仙桥路10号富空间\t夸克实验室1楼\n小林\t先生\t18310433237','微信支付'),(294,'27910fd5-9310-4646-87bf-46fa0853fee9',20,0,2.0,'朝阳酒仙桥店','烤鱼',65.0,65.0,1,1.5,5.0,4.0,67.5,65.5,1,'',0,'2017-05-26 20:26:13','','微信支付'),(295,'b30c445a-633a-4194-bc9a-4b5fef551a78',20,0,2.0,'朝阳酒仙桥店','烤鱼',65.0,260.0,4,1.5,5.0,4.0,262.5,260.5,4,'少放辣 不吃香菜',1,'2017-05-26 20:26:22','太原理工大学-明向校区\t3号楼603\n林廷勇\t先生\t13546712752','在线支付');

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
  `BALABCE` float(5,2) DEFAULT '0.00' COMMENT '余额',
  `ICON` varchar(255) DEFAULT 'img/user.svg' COMMENT '头像',
  `INTEGRAL` int(6) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "user"
#

INSERT INTO `user` VALUES (287,'13546712752','827ccb0eea8a706c4c34a16891f84e7b',NULL,0.0,0,0,56.00,'img/user.svg',0),(291,'18310433237','827ccb0eea8a706c4c34a16891f84e7b',NULL,0.0,0,0,36.00,'img/user.svg',0);
