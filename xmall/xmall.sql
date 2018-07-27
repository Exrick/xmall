/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : xmall

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-07-27 23:08:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `street_name` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES ('3', '63', 'test', '18782059038', '四川省成都市青羊区百花中心站对面', '1');
INSERT INTO `tb_address` VALUES ('5', '63', 'admin', '18782059038', '上海青浦区汇联路', '0');
INSERT INTO `tb_address` VALUES ('6', '62', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for tb_base
-- ----------------------------
DROP TABLE IF EXISTS `tb_base`;
CREATE TABLE `tb_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_name` varchar(255) DEFAULT NULL,
  `key_word` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `source_path` varchar(255) DEFAULT NULL,
  `upload_path` varchar(255) DEFAULT NULL,
  `copyright` varchar(1000) DEFAULT NULL,
  `count_code` varchar(1000) DEFAULT NULL,
  `has_log_notice` int(11) DEFAULT NULL,
  `log_notice` varchar(1000) DEFAULT NULL,
  `has_all_notice` int(11) DEFAULT NULL,
  `all_notice` varchar(1000) DEFAULT NULL,
  `notice` varchar(8000) DEFAULT NULL,
  `update_log` varchar(8000) DEFAULT NULL,
  `front_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_base
-- ----------------------------
INSERT INTO `tb_base` VALUES ('1', 'XMall后台管理系统 v1.0', 'XMall后台管理系统 v1.0,XMall,XMall购物商城后台管理系统', 'XMall后台管理系统 v1.0，是一款电商后台管理系统，适合中小型CMS后台系统。', '', '', '', '', '0', 'test login notice', '0', 'test all notice', '', '', 'http://blog.exrick.cn');

-- ----------------------------
-- Table structure for tb_dict
-- ----------------------------
DROP TABLE IF EXISTS `tb_dict`;
CREATE TABLE `tb_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict` varchar(255) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '1扩展词 0停用词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_dict
-- ----------------------------
INSERT INTO `tb_dict` VALUES ('1', 'Exrick', '1');
INSERT INTO `tb_dict` VALUES ('2', 'xmall', '1');
INSERT INTO `tb_dict` VALUES ('4', 'test', '0');

-- ----------------------------
-- Table structure for tb_express
-- ----------------------------
DROP TABLE IF EXISTS `tb_express`;
CREATE TABLE `tb_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '快递ID',
  `express_name` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of tb_express
-- ----------------------------
INSERT INTO `tb_express` VALUES ('1', '京东快递', '1', '2018-05-31 11:45:10', null);

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` bigint(20) NOT NULL COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `sell_point` varchar(100) DEFAULT NULL COMMENT '商品卖点',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
  `num` int(11) DEFAULT NULL COMMENT '库存数量',
  `limit_num` int(11) DEFAULT NULL COMMENT '售卖数量限制',
  `image` varchar(2000) DEFAULT NULL COMMENT '商品图片',
  `cid` bigint(11) DEFAULT NULL COMMENT '所属分类',
  `status` int(1) DEFAULT '1' COMMENT '商品状态 1正常 0下架',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `status` (`status`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('562379', '坚果 Pro 软胶保护套', 'TPU 环保材质、耐磨、耐油、耐久性强', '49.00', '999', '100', 'http://image.smartisanos.cn/resource/902befd5f32a8caf4ca79b55d39ee25a.jpg', '560', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('605616', '坚果 Pro 钢化玻璃保护膜（前屏用）', '高达 92% 的超强透光率、耐刮花、防指纹', '49.00', '999', '100', 'http://image.smartisanos.cn/resource/30cacf4088f7105d16452c661afd9299.jpg', '560', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('679532', 'Smartisan 原装快充充电器 18W', '18W 安全快充、支持主流 QC3.0, MTK PE+2.0 快充协议', '59.00', '999', '100', 'http://image.smartisanos.cn/resource/dc53bd870ee64d2053ecc51750ece43a.jpg', '560', '1', '2017-09-05 21:27:54', '2017-11-09 22:31:04');
INSERT INTO `tb_item` VALUES ('679533', 'Smartisan 坚果自拍杆', '通用 3.5 mm 接口、航空铝合金伸缩杆、防过敏硅胶手柄', '69.00', '999', '100', 'http://image.smartisanos.cn/resource/afe5728faa22f4b078b84d9c725c136d.jpg', '560', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('691300', 'Smartisan 快充移动电源 10000mAh', '10000mAh 双向快充、轻盈便携、高标准安全保护', '199.00', '999', '100', 'http://image.smartisanos.cn/resource/0540778097a009364f2dcbb8c5286451.jpg', '560', '1', '2017-09-05 21:27:54', '2017-11-09 22:22:53');
INSERT INTO `tb_item` VALUES ('738388', 'Smartisan 原装 Type-C 数据线', 'PTC 过温保护、凹形设计、TPE 环保材质', '39.00', '999', '100', 'http://image.smartisanos.cn/resource/c79a73ffc6f8e782160d978f49f543dc.jpg', '560', '1', '2017-09-05 21:27:54', '2017-10-22 22:15:02');
INSERT INTO `tb_item` VALUES ('741524', 'Smartisan S-100 半入耳式线控耳机', '卓越的 14.2mm 发音单元、三按键式线控', '99.00', '999', '100', 'http://image.smartisanos.cn/resource/c98abe89b5a5502ef04c30e751b2bfef.png', '560', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('816448', '极米无屏电视 CC', '720P 高清分辨率、JBL 音响、两万毫安续航力', '2799.00', '999', '100', 'http://image.smartisanos.cn/resource/41cb562a47d4831e199ed7e2057f3b61.jpg', '560', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('816753', '《索尼设计，塑造现代》', '索尼全盛时期工业设计作品首次集结成书并引进中国', '259.00', '999', '100', 'http://image.smartisanos.cn/resource/f950d9c27ef21e17374fa212b40d66a9.jpg', '76', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('830972', '《深泽直人》', '首次面向中国读者介绍其作品', '199.00', '999', '100', 'http://image.smartisanos.cn/resource/5e4e40120d09fb6791f9430f914c6f68.jpg', '560', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('832739', 'FIIL CARAT 蓝牙运动耳机', '智能计步、磁吸项链式、佩戴舒适不易掉', '499.00', '999', '100', 'http://image.smartisanos.cn/resource/61b4f3de01f00e57a664e648d6ea4721.jpg', '560', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('844022', 'FIIL CARAT LITE 蓝牙运动耳机', '线控带麦、IP65 防水、磁吸项链式', '299.00', '999', '100', 'http://image.smartisanos.cn/resource/62c1a6988de8071beef4203bedde5144.jpg', '560', '1', '2017-09-05 21:27:54', '2017-09-05 21:29:54');
INSERT INTO `tb_item` VALUES ('847276', 'FIIL Diva Pro 全场景无线降噪耳机', '智能语音交互、高清无损本地存储播放', '1499.00', '999', '100', 'http://image.smartisanos.cn/resource/804b82e4c05516e822667a23ee311f7c.jpg', '560', '1', '2017-09-05 21:27:54', '2018-04-20 22:18:11');
INSERT INTO `tb_item` VALUES ('856645', '三星 Galaxy S4 (I9500) 16G版 星空黑 联通3G手机', '年货特价来袭！三星经典旗舰机！', '1888.00', '999', '100', 'https://i.loli.net/2018/07/13/5b48b58b511dc.jpg', '560', '0', '2017-09-05 21:27:54', '2017-11-06 23:44:32');
INSERT INTO `tb_item` VALUES ('150635087972564', '支付测试商品 IPhone X 全面屏 全面绽放', '此仅为支付测试商品 拍下不会发货', '1.00', '999', '100', 'https://i.loli.net/2018/07/13/5b48ac7766d98.png,https://i.loli.net/2018/07/13/5b48ac9135c5f.png,https://i.loli.net/2018/07/13/5b48ac9c2be6c.png,https://i.loli.net/2018/07/13/5b48aca99c8b6.png,https://i.loli.net/2018/07/13/5b48a7f468bf2.png', '560', '1', '2017-09-05 21:27:54', '2018-07-13 21:59:05');
INSERT INTO `tb_item` VALUES ('150642571432835', '捐赠商品', '您的捐赠将用于本站维护 给您带来更好的体验', '1.00', '999', '100', 'https://i.loli.net/2018/07/13/5b48a7f46be51.png,https://i.loli.net/2018/07/13/5b48a952de430.png', '560', '1', '2017-09-05 21:27:54', '2018-07-13 21:38:52');
INSERT INTO `tb_item` VALUES ('150642571432836', 'Smartisan T恤 伍迪·艾伦出生', '一件内外兼修的舒适T恤', '149.00', '999', '100', 'https://resource.smartisan.com/resource/f96f0879768bc317b74e7cf9e3d96884.jpg,https://resource.smartisan.com/resource/095b46c25f9df5b13ee51f3e512d1e96.jpg,https://resource.smartisan.com/resource/0c9c397c8ac68a2ad327e1da8a5cb7d0.jpg,https://resource.smartisan.com/resource/154b35897ed3c1cb8dc1c7aae7b88f1f.jpg,https://resource.smartisan.com/resource/4a1686f2fde86e0aaac49c92395d4b32.jpg', '1184', '1', '2018-04-18 20:41:41', '2018-04-20 00:21:01');
INSERT INTO `tb_item` VALUES ('150642571432837', '坚果 3 前屏钢化玻璃保护膜', '超强透光率、耐刮花、防指纹', '49.00', '999', '100', 'https://resource.smartisan.com/resource/3a7522290397a9444d7355298248f197.jpg', '560', '1', '2018-04-19 00:34:06', '2018-04-19 23:49:38');
INSERT INTO `tb_item` VALUES ('150642571432838', '坚果 3 绒布国旗保护套', '质感精良、完美贴合、周到防护', '79.00', '999', '100', 'https://resource.smartisan.com/resource/63ea40e5c64db1c6b1d480c48fe01272.jpg,https://resource.smartisan.com/resource/4b8d00ab6ba508a977a475988e0fdb53.jpg,https://resource.smartisan.com/resource/87ea3888491d172b7d7a0e78e4294b4b.jpg,https://resource.smartisan.com/resource/8d30265188ddd1ba05e34f669c5dcf1c.jpg', '560', '1', '2018-04-19 00:35:50', '2018-04-20 00:01:08');
INSERT INTO `tb_item` VALUES ('150642571432839', '坚果 3 TPU 软胶透明保护套', '轻薄透明、完美贴合、TPU 环保材质', '29.00', '999', '100', 'https://resource.smartisan.com/resource/5e4b1feddb13639550849f12f6b2e202.jpg,https://resource.smartisan.com/resource/0477d8b177db197a0b09a18e116b2bca.jpg,https://resource.smartisan.com/resource/b66d7e832339cf240b13a9a91107abdc.jpg,https://resource.smartisan.com/resource/56db3c83cca697572fa8a1df2e3172d7.jpg', '560', '1', '2018-04-19 00:38:07', '2018-04-20 00:02:54');
INSERT INTO `tb_item` VALUES ('150642571432840', 'Smartisan 半入耳式耳机', '经典配色、专业调音、高品质麦克风', '89.00', '999', '100', 'https://resource.smartisan.com/resource/9c1d958f10a811df841298d50e1ca7c0.jpg,https://resource.smartisan.com/resource/afa4ecdb54d7f50d0b6265bbcf31d6c8.jpg,https://resource.smartisan.com/resource/eb1bf1dee365c7855e6b047d8b9c5b1e.jpg,https://resource.smartisan.com/resource/dfcc9fa16ab354a41683959398bff128.jpg', '560', '1', '2018-04-19 00:40:40', '2018-04-20 00:04:41');
INSERT INTO `tb_item` VALUES ('150642571432841', '坚果 3 TPU 软胶保护套', 'TPU 环保材质、完美贴合、周到防护', '49.00', '999', '100', 'https://resource.smartisan.com/resource/b899d9b82c4bc2710492a26af021d484.jpg,https://resource.smartisan.com/resource/bb8859032d6060ccb4e733a2c8e2f51d.jpg,https://resource.smartisan.com/resource/df5b3d3539481eb1c00333a5bc5b60b6.jpg', '560', '1', '2018-04-19 00:43:48', '2018-04-20 00:06:58');
INSERT INTO `tb_item` VALUES ('150642571432842', '坚果 3 \"足迹\"背贴 乐高创始人出生', '1891 年 4 月 7 日', '79.00', '999', '100', 'https://resource.smartisan.com/resource/abb6986430536cd9365352b434f3c568.jpg', '560', '1', '2018-04-19 00:45:14', '2018-04-20 00:08:21');
INSERT INTO `tb_item` VALUES ('150642571432843', '坚果 3', '漂亮得不像实力派', '1999.00', '999', '100', 'https://resource.smartisan.com/resource/718bcecced0df1cd23bbdb9cc1f70b7d.png', '560', '1', '2018-04-19 22:13:31', '2018-07-13 22:03:52');
INSERT INTO `tb_item` VALUES ('150642571432844', '畅呼吸智能空气净化器超级除甲醛版', '购新空净 赠价值 699 元活性炭滤芯', '2999.00', '999', '100', 'https://resource.smartisan.com/resource/71432ad30288fb860a4389881069b874.png', '560', '1', '2018-04-19 22:16:05', '2018-07-13 22:06:58');
INSERT INTO `tb_item` VALUES ('150642571432845', 'Smartisan 帆布鞋', '一双踏实、舒适的帆布鞋', '199.00', '999', '100', 'https://resource.smartisan.com/resource/2f9a0f5f3dedf0ed813622003f1b287b.jpg,https://resource.smartisan.com/resource/0cd8f107c70d002caf902745355e269a.jpg,https://resource.smartisan.com/resource/fa42dcd439e9fb990831f1d21c3f19b8.jpg', '1184', '1', '2018-04-19 22:22:02', '2018-04-20 00:19:39');
INSERT INTO `tb_item` VALUES ('150642571432846', 'Smartisan T恤 任天堂发售“红白机”', '100% 美国 SUPIMA 棉、舒适拉绒质地', '149.00', '999', '100', 'https://resource.smartisan.com/resource/804edf579887b3e1fae4e20a379be5b5.png,https://resource.smartisan.com/resource/6a92fe5ab90b379d5315c0ee2610f467.png,https://resource.smartisan.com/resource/76c811504b910e04c448dda8d47a09c3.png', '1184', '1', '2018-04-19 22:23:39', '2018-04-20 00:23:09');
INSERT INTO `tb_item` VALUES ('150642571432847', 'Smartisan Polo衫 经典款', '一件表里如一的舒适 POLO 衫', '249.00', '999', '100', 'https://resource.smartisan.com/resource/daa975651d6d700c0f886718c520ee19.jpg,https://resource.smartisan.com/resource/8b4884f04835f8de3c33817732fdcb46.jpg,https://resource.smartisan.com/resource/057f6010d6cb7afc964f812093742283.jpg,https://resource.smartisan.com/resource/3cc4b5a1e0a6136eb9725a88d6c1d3be.jpg,https://resource.smartisan.com/resource/f35c053b87dd0e1255be2a8bfa773232.jpg', '1184', '1', '2018-04-19 22:25:41', '2018-04-20 10:51:53');
INSERT INTO `tb_item` VALUES ('150642571432848', 'Smartisan 牛津纺衬衫', '一件无拘无束的舒适衬衫', '199.00', '999', '100', 'https://resource.smartisan.com/resource/a1c53b5f12dd7ef790cadec0eaeaf466.jpg,https://resource.smartisan.com/resource/dccec50aa1480c23a6d62648d2271c0a.jpg,https://resource.smartisan.com/resource/28c798c14b3cc9cfe7100567df6e5999.jpg,https://resource.smartisan.com/resource/da87105789046c13412f6f6a32032df7.jpg,https://resource.smartisan.com/resource/cf9704df83dc6d6ff5404da154388a58.jpg', '1184', '1', '2018-04-19 22:28:11', '2018-04-20 10:53:15');
INSERT INTO `tb_item` VALUES ('150642571432849', 'Smartisan 明信片', '优质卡纸、包装精致、色彩饱满', '9.90', '999', '100', 'https://resource.smartisan.com/resource/3973d009d182d8023bea6250b9a3959e.jpg,https://resource.smartisan.com/resource/1901bf9f58d83978353cf1ec58442cc6.jpg,https://resource.smartisan.com/resource/4e0b690102858fc3013ea650fb1e1a8e.jpg,https://resource.smartisan.com/resource/51765f60367d6e40e4ae6f2b9ce46a91.jpg,https://resource.smartisan.com/resource/5108b5e7448c14e5241b60ba41fafc8e.jpg', '1184', '1', '2018-04-19 22:31:09', '2018-04-21 11:26:31');
INSERT INTO `tb_item` VALUES ('150642571432850', 'ACIL E1 颈挂式蓝牙耳机', '无感佩戴，一切变得简单', '199.00', '999', '100', 'https://resource.smartisan.com/resource/406eddef8808fa5a9be9594d07ef8643.jpg,https://resource.smartisan.com/resource/548de41c48d47232b4ed541c1df57c2f.jpg,https://resource.smartisan.com/resource/aee0949bc33654bc18cedb8cd7dfbcff.jpg', '560', '1', '2018-04-19 22:32:38', '2018-04-20 11:17:31');
INSERT INTO `tb_item` VALUES ('150642571432851', '优点智能 E1 推拉式智能指纹密码锁', '推拉一下，轻松开关', '2699.00', '999', '100', 'https://resource.smartisan.com/resource/7ac3af5a92ad791c2b38bfe1e38ee334.jpg,https://resource.smartisan.com/resource/e37029b8cd3194ad9581de0ee6512acb.jpg,https://resource.smartisan.com/resource/1501eaf68c9771e5599eec45a5f6320a.jpg,https://resource.smartisan.com/resource/a8c6a41637041c576aaa2a5162d2ab56.jpg,https://resource.smartisan.com/resource/3934e0c458922c0049d311b84ddb73e0.jpg', '560', '1', '2018-04-19 22:36:50', '2018-04-20 00:13:44');
INSERT INTO `tb_item` VALUES ('150642571432852', 'FIIL Driifter 脖挂蓝牙耳机', '全天佩戴 抬手就听 HEAC稳连技术', '499.00', '999', '100', 'https://resource.smartisan.com/resource/367d93db1d58f9f3505bc0ec18efaa44.jpg,https://resource.smartisan.com/resource/8ecc94c0f0c4ebc861f06c86789a66e6.jpg,https://resource.smartisan.com/resource/58a2cdb44f722202b05dd09d6fd959de.jpg,https://resource.smartisan.com/resource/2b811a93a2915310f72291e46bd944ad.jpg,https://resource.smartisan.com/resource/8cd011adef99f9734ed974ea9732e6e7.jpg', '560', '1', '2018-06-02 19:43:12', '2018-06-02 19:43:14');

-- ----------------------------
-- Table structure for tb_item_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cat`;
CREATE TABLE `tb_item_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID=0时代表一级根分类',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `status` int(1) DEFAULT '1' COMMENT '状态 1启用 0禁用',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '是否为父分类 1为true 0为false',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1185 DEFAULT CHARSET=utf8 COMMENT='商品类目';

-- ----------------------------
-- Records of tb_item_cat
-- ----------------------------
INSERT INTO `tb_item_cat` VALUES ('-1', '0', '所有商品', '1', '0', '0', null, '不建议修改', '2017-09-24 11:10:45', '2017-11-06 23:24:33');
INSERT INTO `tb_item_cat` VALUES ('1', '0', '图书、音像、电子书刊', '1', '19', '1', null, '', '2014-10-15 18:31:55', '2017-09-24 15:50:47');
INSERT INTO `tb_item_cat` VALUES ('2', '1', '电子书刊', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('3', '2', '电子书', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('4', '2', '网络原创', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('5', '2', '数字杂志', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('6', '2', '多媒体图书', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('7', '1', '音像', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('8', '7', '音乐', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('9', '7', '影视', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('10', '7', '教育音像', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('11', '1', '英文原版', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('12', '11', '少儿', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('13', '11', '商务投资', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('14', '11', '英语学习与考试', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('15', '11', '小说', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('16', '11', '传记', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('17', '11', '励志', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('18', '1', '文艺', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('19', '18', '小说', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('20', '18', '文学', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('21', '18', '青春文学', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('22', '18', '传记', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('23', '18', '艺术', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('24', '1', '少儿', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('25', '24', '少儿', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('26', '24', '0-2岁', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('27', '24', '3-6岁', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('28', '24', '7-10岁', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('29', '24', '11-14岁', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('30', '1', '人文社科', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('31', '30', '历史', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('32', '30', '哲学', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('33', '30', '国学', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('34', '30', '政治/军事', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('35', '30', '法律', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('36', '30', '宗教', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('37', '30', '心理学', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('38', '30', '文化', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('39', '30', '社会科学', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('40', '1', '经管励志', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('41', '40', '经济', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('42', '40', '金融与投资', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('43', '40', '管理', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('44', '40', '励志与成功', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('45', '1', '生活', '1', '8', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('46', '45', '生活', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('47', '45', '健身与保健', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('48', '45', '家庭与育儿', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('49', '45', '旅游', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('50', '45', '动漫/幽默', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('51', '1', '科技', '1', '9', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('52', '51', '科技', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('53', '51', '工程', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('54', '51', '建筑', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('55', '51', '医学', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('56', '51', '科学与自然', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('57', '51', '计算机与互联网', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('58', '51', '体育/运动', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('59', '1', '教育', '1', '10', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('60', '59', '教材教辅', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('61', '59', '教育与考试', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('62', '59', '外语学习', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('63', '59', '新闻出版', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('64', '59', '语言文字', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('65', '1', '港台图书', '1', '11', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('66', '65', '艺术/设计/收藏', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('67', '65', '经济管理', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('68', '65', '文化/学术', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('69', '65', '少儿文学/国学', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('70', '1', '其它', '1', '12', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('71', '70', '工具书', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('72', '70', '影印版', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('73', '70', '套装书', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('74', '0', '家用电器', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('75', '74', '大 家 电', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('76', '75', '平板电视', '1', '1', '0', null, '', '2014-10-15 18:31:55', '2017-11-06 23:44:12');
INSERT INTO `tb_item_cat` VALUES ('77', '75', '空调', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('78', '75', '冰箱', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('79', '75', '洗衣机', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('80', '75', '家庭影院', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('81', '75', 'DVD播放机', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('82', '75', '迷你音响', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('83', '75', '烟机/灶具', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('84', '75', '热水器', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('85', '75', '消毒柜/洗碗机', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('86', '75', '酒柜/冰吧/冷柜', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('87', '75', '家电配件', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('88', '75', '家电下乡', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('89', '74', '生活电器', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('90', '89', '电风扇', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('91', '89', '冷风扇', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('92', '89', '净化器', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('93', '89', '饮水机', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('94', '89', '净水设备', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('95', '89', '挂烫机/熨斗', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('96', '89', '吸尘器', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('97', '89', '电话机', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('98', '89', '插座', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('99', '89', '收录/音机', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('100', '89', '清洁机', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('101', '89', '加湿器', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('102', '89', '除湿机', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('103', '89', '取暖电器', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('104', '89', '其它生活电器', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('105', '89', '扫地机器人', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('106', '89', '干衣机', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('107', '89', '生活电器配件', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('108', '74', '厨房电器', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('109', '108', '料理/榨汁机', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('110', '108', '豆浆机', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('111', '108', '电饭煲', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('112', '108', '电压力锅', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('113', '108', '面包机', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('114', '108', '咖啡机', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('115', '108', '微波炉', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('116', '108', '电烤箱', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('117', '108', '电磁炉', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('118', '108', '电饼铛/烧烤盘', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('119', '108', '煮蛋器', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('120', '108', '酸奶机', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('121', '108', '电炖锅', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('122', '108', '电水壶/热水瓶', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('123', '108', '多用途锅', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('124', '108', '果蔬解毒机', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('125', '108', '其它厨房电器', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('126', '74', '个护健康', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('127', '126', '剃须刀', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('128', '126', '剃/脱毛器', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('129', '126', '口腔护理', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('130', '126', '电吹风', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('131', '126', '美容器', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('132', '126', '美发器', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('133', '126', '按摩椅', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('134', '126', '按摩器', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('135', '126', '足浴盆', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('136', '126', '血压计', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('137', '126', '健康秤/厨房秤', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('138', '126', '血糖仪', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('139', '126', '体温计', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('140', '126', '计步器/脂肪检测仪', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('141', '126', '其它健康电器', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('142', '74', '五金家装', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('143', '142', '电动工具', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('144', '142', '手动工具', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('145', '142', '仪器仪表', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('146', '142', '浴霸/排气扇', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('147', '142', '灯具', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('148', '142', 'LED灯', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('149', '142', '洁身器', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('150', '142', '水槽', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('151', '142', '龙头', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('152', '142', '淋浴花洒', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('153', '142', '厨卫五金', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('154', '142', '家具五金', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('155', '142', '门铃', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('156', '142', '电气开关', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('157', '142', '插座', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('158', '142', '电工电料', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('159', '142', '监控安防', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('160', '142', '电线/线缆', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('161', '0', '电脑、办公', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('162', '161', '电脑整机', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('163', '162', '笔记本', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('164', '162', '超极本', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('165', '162', '游戏本', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('166', '162', '平板电脑', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('167', '162', '平板电脑配件', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('168', '162', '台式机', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('169', '162', '服务器/工作站', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('170', '162', '笔记本配件', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('171', '161', '电脑配件', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('172', '171', 'CPU', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('173', '171', '主板', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('174', '171', '显卡', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('175', '171', '硬盘', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('176', '171', 'SSD固态硬盘', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('177', '171', '内存', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('178', '171', '机箱', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('179', '171', '电源', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('180', '171', '显示器', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('181', '171', '刻录机/光驱', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('182', '171', '散热器', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('183', '171', '声卡/扩展卡', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('184', '171', '装机配件', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('185', '171', '组装电脑', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('186', '161', '外设产品', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('187', '186', '移动硬盘', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('188', '186', 'U盘', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('189', '186', '鼠标', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('190', '186', '键盘', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('191', '186', '鼠标垫', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('192', '186', '摄像头', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('193', '186', '手写板', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('194', '186', '外置盒', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('195', '186', '插座', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('196', '186', '线缆', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('197', '186', 'UPS电源', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('198', '186', '电脑工具', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('199', '186', '游戏设备', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('200', '186', '电玩', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('201', '186', '电脑清洁', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('202', '161', '网络产品', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('203', '202', '路由器', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('204', '202', '网卡', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('205', '202', '交换机', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('206', '202', '网络存储', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('207', '202', '4G/3G上网', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('208', '202', '网络盒子', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('209', '202', '网络配件', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('210', '161', '办公设备', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('211', '210', '投影机', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('212', '210', '投影配件', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('213', '210', '多功能一体机', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('214', '210', '打印机', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('215', '210', '传真设备', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('216', '210', '验钞/点钞机', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('217', '210', '扫描设备', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('218', '210', '复合机', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('219', '210', '碎纸机', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('220', '210', '考勤机', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('221', '210', '墨粉', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('222', '210', '收款/POS机', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('223', '210', '会议音频视频', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('224', '210', '保险柜', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('225', '210', '装订/封装机', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('226', '210', '安防监控', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('227', '210', '办公家具', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('228', '210', '白板', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('229', '161', '文具/耗材', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('230', '229', '硒鼓/墨粉', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('231', '229', '墨盒', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('232', '229', '色带', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('233', '229', '纸类', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('234', '229', '办公文具', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('235', '229', '学生文具', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('236', '229', '文件管理', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('237', '229', '财会用品', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('238', '229', '本册/便签', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('239', '229', '计算器', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('240', '229', '激光笔', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('241', '229', '笔类', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('242', '229', '画具画材', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('243', '229', '刻录碟片/附件', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('244', '161', '服务产品', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('245', '244', '上门服务', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('246', '244', '远程服务', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('247', '244', '电脑软件', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('248', '244', '京东服务', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('249', '0', '个护化妆', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('250', '249', '面部护肤', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('251', '250', '清洁', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('252', '250', '护肤', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('253', '250', '面膜', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('254', '250', '剃须', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('255', '250', '套装', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('256', '249', '身体护肤', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('257', '256', '沐浴', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('258', '256', '润肤', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('259', '256', '颈部', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('260', '256', '手足', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('261', '256', '纤体塑形', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('262', '256', '美胸', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('263', '256', '套装', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('264', '249', '口腔护理', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('265', '264', '牙膏/牙粉', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('266', '264', '牙刷/牙线', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('267', '264', '漱口水', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('268', '264', '套装', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('269', '249', '女性护理', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('270', '269', '卫生巾', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('271', '269', '卫生护垫', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('272', '269', '私密护理', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('273', '269', '脱毛膏', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('274', '249', '洗发护发', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('275', '274', '洗发', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('276', '274', '护发', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('277', '274', '染发', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('278', '274', '造型', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('279', '274', '假发', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('280', '274', '套装', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('281', '249', '香水彩妆', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('282', '281', '香水', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('283', '281', '底妆', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('284', '281', '腮红', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('285', '281', '眼部', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('286', '281', '唇部', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('287', '281', '美甲', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('288', '281', '美容工具', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('289', '281', '套装', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('290', '0', '钟表', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('291', '290', '钟表', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('292', '291', '男表', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('293', '291', '女表', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('294', '291', '儿童手表', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('295', '291', '座钟挂钟', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('296', '0', '母婴', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('297', '296', '奶粉', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('298', '297', '婴幼奶粉', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('299', '297', '成人奶粉', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('300', '296', '营养辅食', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('301', '300', '益生菌/初乳', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('302', '300', '米粉/菜粉', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('303', '300', '果泥/果汁', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('304', '300', 'DHA', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('305', '300', '宝宝零食', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('306', '300', '钙铁锌/维生素', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('307', '300', '清火/开胃', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('308', '300', '面条/粥', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('309', '296', '尿裤湿巾', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('310', '309', '婴儿尿裤', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('311', '309', '拉拉裤', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('312', '309', '湿巾', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('313', '309', '成人尿裤', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('314', '296', '喂养用品', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('315', '314', '奶瓶奶嘴', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('316', '314', '吸奶器', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('317', '314', '暖奶消毒', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('318', '314', '碗盘叉勺', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('319', '314', '水壶/水杯', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('320', '314', '牙胶安抚', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('321', '314', '辅食料理机', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('322', '296', '洗护用品', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('323', '322', '宝宝护肤', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('324', '322', '宝宝洗浴', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('325', '322', '奶瓶清洗', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('326', '322', '驱蚊防蚊', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('327', '322', '理发器', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('328', '322', '洗衣液/皂', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('329', '322', '日常护理', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('330', '322', '座便器', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('331', '296', '童车童床', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('332', '331', '婴儿推车', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('333', '331', '餐椅摇椅', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('334', '331', '婴儿床', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('335', '331', '学步车', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('336', '331', '三轮车', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('337', '331', '自行车', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('338', '331', '电动车', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('339', '331', '扭扭车', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('340', '331', '滑板车', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('341', '296', '寝居服饰', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('342', '341', '婴儿外出服', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('343', '341', '婴儿内衣', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('344', '341', '婴儿礼盒', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('345', '341', '婴儿鞋帽袜', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('346', '341', '安全防护', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('347', '341', '家居床品', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('348', '296', '妈妈专区', '1', '8', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('349', '348', '妈咪包/背婴带', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('350', '348', '产后塑身', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('351', '348', '文胸/内裤', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('352', '348', '防辐射服', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('353', '348', '孕妇装', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('354', '348', '孕期营养', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('355', '348', '孕妈美容', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('356', '348', '待产/新生', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('357', '348', '月子装', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('358', '296', '童装童鞋', '1', '9', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('359', '358', '套装', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('360', '358', '上衣', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('361', '358', '裤子', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('362', '358', '裙子', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('363', '358', '内衣/家居服', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('364', '358', '羽绒服/棉服', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('365', '358', '亲子装', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('366', '358', '儿童配饰', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('367', '358', '礼服/演出服', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('368', '358', '运动鞋', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('369', '358', '皮鞋/帆布鞋', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('370', '358', '靴子', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('371', '358', '凉鞋', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('372', '358', '功能鞋', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('373', '358', '户外/运动服', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('374', '296', '安全座椅', '1', '10', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('375', '374', '提篮式', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('376', '374', '安全座椅', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('377', '374', '增高垫', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('378', '0', '食品饮料、保健食品', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('379', '378', '进口食品', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('380', '379', '饼干蛋糕', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('381', '379', '糖果/巧克力', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('382', '379', '休闲零食', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('383', '379', '冲调饮品', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('384', '379', '粮油调味', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('385', '379', '牛奶', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('386', '378', '地方特产', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('387', '386', '其他特产', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('388', '386', '新疆', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('389', '386', '北京', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('390', '386', '山西', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('391', '386', '内蒙古', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('392', '386', '福建', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('393', '386', '湖南', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('394', '386', '四川', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('395', '386', '云南', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('396', '386', '东北', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('397', '378', '休闲食品', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('398', '397', '休闲零食', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('399', '397', '坚果炒货', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('400', '397', '肉干肉脯', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('401', '397', '蜜饯果干', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('402', '397', '糖果/巧克力', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('403', '397', '饼干蛋糕', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('404', '397', '无糖食品', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('405', '378', '粮油调味', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('406', '405', '米面杂粮', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('407', '405', '食用油', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('408', '405', '调味品', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('409', '405', '南北干货', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('410', '405', '方便食品', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('411', '405', '有机食品', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('412', '378', '饮料冲调', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('413', '412', '饮用水', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('414', '412', '饮料', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('415', '412', '牛奶乳品', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('416', '412', '咖啡/奶茶', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('417', '412', '冲饮谷物', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('418', '412', '蜂蜜/柚子茶', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('419', '412', '成人奶粉', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('420', '378', '食品礼券', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('421', '420', '月饼', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('422', '420', '大闸蟹', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('423', '420', '粽子', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('424', '420', '卡券', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('425', '378', '茗茶', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('426', '425', '铁观音', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('427', '425', '普洱', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('428', '425', '龙井', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('429', '425', '绿茶', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('430', '425', '红茶', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('431', '425', '乌龙茶', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('432', '425', '花草茶', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('433', '425', '花果茶', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('434', '425', '养生茶', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('435', '425', '黑茶', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('436', '425', '白茶', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('437', '425', '其它茶', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('438', '0', '汽车用品', '1', '8', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('439', '438', '维修保养', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('440', '439', '润滑油', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('441', '439', '添加剂', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('442', '439', '防冻液', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('443', '439', '滤清器', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('444', '439', '火花塞', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('445', '439', '雨刷', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('446', '439', '车灯', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('447', '439', '后视镜', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('448', '439', '轮胎', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('449', '439', '轮毂', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('450', '439', '刹车片/盘', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('451', '439', '喇叭/皮带', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('452', '439', '蓄电池', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('453', '439', '底盘装甲/护板', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('454', '439', '贴膜', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('455', '439', '汽修工具', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('456', '438', '车载电器', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('457', '456', '导航仪', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('458', '456', '安全预警仪', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('459', '456', '行车记录仪', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('460', '456', '倒车雷达', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('461', '456', '蓝牙设备', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('462', '456', '时尚影音', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('463', '456', '净化器', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('464', '456', '电源', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('465', '456', '冰箱', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('466', '456', '吸尘器', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('467', '438', '美容清洗', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('468', '467', '车蜡', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('469', '467', '补漆笔', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('470', '467', '玻璃水', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('471', '467', '清洁剂', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('472', '467', '洗车工具', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('473', '467', '洗车配件', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('474', '438', '汽车装饰', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('475', '474', '脚垫', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('476', '474', '座垫', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('477', '474', '座套', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('478', '474', '后备箱垫', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('479', '474', '头枕腰靠', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('480', '474', '香水', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('481', '474', '空气净化', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('482', '474', '车内饰品', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('483', '474', '功能小件', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('484', '474', '车身装饰件', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('485', '474', '车衣', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('486', '438', '安全自驾', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('487', '486', '安全座椅', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('488', '486', '胎压充气', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('489', '486', '防盗设备', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('490', '486', '应急救援', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('491', '486', '保温箱', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('492', '486', '储物箱', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('493', '486', '自驾野营', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('494', '486', '摩托车装备', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('495', '0', '玩具乐器', '1', '9', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('496', '495', '适用年龄', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('497', '496', '0-6个月', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('498', '496', '6-12个月', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('499', '496', '1-3岁', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('500', '496', '3-6岁', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('501', '496', '6-14岁', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('502', '496', '14岁以上', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('503', '495', '遥控/电动', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('504', '503', '遥控车', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('505', '503', '遥控飞机', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('506', '503', '遥控船', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('507', '503', '机器人/电动', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('508', '503', '轨道/助力', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('509', '495', '毛绒布艺', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('510', '509', '毛绒/布艺', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('511', '509', '靠垫/抱枕', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('512', '495', '娃娃玩具', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('513', '512', '芭比娃娃', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('514', '512', '卡通娃娃', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('515', '512', '智能娃娃', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('516', '495', '模型玩具', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('517', '516', '仿真模型', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('518', '516', '拼插模型', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('519', '516', '收藏爱好', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('520', '495', '健身玩具', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('521', '520', '炫舞毯', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('522', '520', '爬行垫/毯', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('523', '520', '户外玩具', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('524', '520', '戏水玩具', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('525', '495', '动漫玩具', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('526', '525', '电影周边', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('527', '525', '卡通周边', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('528', '525', '网游周边', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('529', '495', '益智玩具', '1', '8', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('530', '529', '摇铃/床铃', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('531', '529', '健身架', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('532', '529', '早教启智', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('533', '529', '拖拉玩具', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('534', '495', '积木拼插', '1', '9', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('535', '534', '积木', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('536', '534', '拼图', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('537', '534', '磁力棒', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('538', '534', '立体拼插', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('539', '495', 'DIY玩具', '1', '10', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('540', '539', '手工彩泥', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('541', '539', '绘画工具', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('542', '539', '情景玩具', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('543', '495', '创意减压', '1', '11', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('544', '543', '减压玩具', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('545', '543', '创意玩具', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('546', '495', '乐器相关', '1', '12', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('547', '546', '钢琴', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('548', '546', '电子琴', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('549', '546', '手风琴', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('550', '546', '吉他/贝斯', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('551', '546', '民族管弦乐器', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('552', '546', '西洋管弦乐', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('553', '546', '口琴/口风琴/竖笛', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('554', '546', '西洋打击乐器', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('555', '546', '各式乐器配件', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('556', '546', '电脑音乐', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('557', '546', '工艺礼品乐器', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('558', '0', '手机', '1', '10', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('559', '558', '手机通讯', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('560', '559', '手机', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('561', '559', '对讲机', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('562', '558', '运营商', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('563', '562', '购机送费', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('564', '562', '“0”元购机', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('565', '562', '选号中心', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('566', '562', '选号入网', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('567', '558', '手机配件', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('568', '567', '手机电池', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('569', '567', '蓝牙耳机', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('570', '567', '充电器/数据线', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('571', '567', '手机耳机', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('572', '567', '手机贴膜', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('573', '567', '手机存储卡', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('574', '567', '手机保护套', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('575', '567', '车载配件', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('576', '567', 'iPhone 配件', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('577', '567', '创意配件', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('578', '567', '便携/无线音响', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('579', '567', '手机饰品', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('580', '0', '数码', '1', '11', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('581', '580', '摄影摄像', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('582', '581', '数码相机', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('583', '581', '单电/微单相机', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('584', '581', '单反相机', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('585', '581', '摄像机', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('586', '581', '拍立得', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('587', '581', '运动相机', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('588', '581', '镜头', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('589', '581', '户外器材', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('590', '581', '影棚器材', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('591', '580', '数码配件', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('592', '591', '存储卡', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('593', '591', '读卡器', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('594', '591', '滤镜', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('595', '591', '闪光灯/手柄', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('596', '591', '相机包', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('597', '591', '三脚架/云台', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('598', '591', '相机清洁', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('599', '591', '相机贴膜', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('600', '591', '机身附件', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('601', '591', '镜头附件', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('602', '591', '电池/充电器', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('603', '591', '移动电源', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('604', '580', '智能设备', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('605', '604', '智能手环', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('606', '604', '智能手表', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('607', '604', '智能眼镜', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('608', '604', '运动跟踪器', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('609', '604', '健康监测', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('610', '604', '智能配饰', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('611', '604', '智能家居', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('612', '604', '体感车', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('613', '604', '其他配件', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('614', '580', '时尚影音', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('615', '614', 'MP3/MP4', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('616', '614', '智能设备', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('617', '614', '耳机/耳麦', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('618', '614', '音箱', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('619', '614', '高清播放器', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('620', '614', 'MP3/MP4配件', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('621', '614', '麦克风', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('622', '614', '专业音频', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('623', '614', '数码相框', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('624', '614', '苹果配件', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('625', '580', '电子教育', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('626', '625', '电子词典', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('627', '625', '电纸书', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('628', '625', '录音笔', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('629', '625', '复读机', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('630', '625', '点读机/笔', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('631', '625', '学生平板', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('632', '625', '早教机', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('633', '0', '家居家装', '1', '12', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('634', '633', '家纺', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('635', '634', '床品套件', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('636', '634', '被子', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('637', '634', '枕芯', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('638', '634', '床单被罩', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('639', '634', '毯子', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('640', '634', '床垫/床褥', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('641', '634', '蚊帐', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('642', '634', '抱枕靠垫', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('643', '634', '毛巾浴巾', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('644', '634', '电热毯', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('645', '634', '窗帘/窗纱', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('646', '634', '布艺软饰', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('647', '634', '凉席', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('648', '633', '灯具', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('649', '648', '台灯', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('650', '648', '节能灯', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('651', '648', '装饰灯', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('652', '648', '落地灯', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('653', '648', '应急灯/手电', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('654', '648', 'LED灯', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('655', '648', '吸顶灯', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('656', '648', '五金电器', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('657', '648', '筒灯射灯', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('658', '648', '吊灯', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('659', '648', '氛围照明', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('660', '633', '生活日用', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('661', '660', '收纳用品', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('662', '660', '雨伞雨具', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('663', '660', '浴室用品', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('664', '660', '缝纫/针织用品', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('665', '660', '洗晒/熨烫', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('666', '660', '净化除味', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('667', '633', '家装软饰', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('668', '667', '桌布/罩件', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('669', '667', '地毯地垫', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('670', '667', '沙发垫套/椅垫', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('671', '667', '相框/照片墙', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('672', '667', '装饰字画', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('673', '667', '节庆饰品', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('674', '667', '手工/十字绣', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('675', '667', '装饰摆件', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('676', '667', '保暖防护', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('677', '667', '帘艺隔断', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('678', '667', '墙贴/装饰贴', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('679', '667', '钟饰', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('680', '667', '花瓶花艺', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('681', '667', '香薰蜡烛', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('682', '667', '创意家居', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('683', '633', '清洁用品', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('684', '683', '纸品湿巾', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('685', '683', '衣物清洁', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('686', '683', '清洁工具', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('687', '683', '驱虫用品', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('688', '683', '家庭清洁', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('689', '683', '皮具护理', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('690', '683', '一次性用品', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('691', '633', '宠物生活', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('692', '691', '宠物主粮', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('693', '691', '宠物零食', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('694', '691', '医疗保健', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('695', '691', '家居日用', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('696', '691', '宠物玩具', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('697', '691', '出行装备', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('698', '691', '洗护美容', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('699', '0', '厨具', '1', '13', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('700', '699', '烹饪锅具', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('701', '700', '炒锅', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('702', '700', '煎锅', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('703', '700', '压力锅', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('704', '700', '蒸锅', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('705', '700', '汤锅', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('706', '700', '奶锅', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('707', '700', '锅具套装', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('708', '700', '煲类', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('709', '700', '水壶', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('710', '700', '火锅', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('711', '699', '刀剪菜板', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('712', '711', '菜刀', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('713', '711', '剪刀', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('714', '711', '刀具套装', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('715', '711', '砧板', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('716', '711', '瓜果刀/刨', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('717', '711', '多功能刀', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('718', '699', '厨房配件', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('719', '718', '保鲜盒', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('720', '718', '烘焙/烧烤', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('721', '718', '饭盒/提锅', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('722', '718', '储物/置物架', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('723', '718', '厨房DIY/小工具', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('724', '699', '水具酒具', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('725', '724', '塑料杯', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('726', '724', '运动水壶', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('727', '724', '玻璃杯', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('728', '724', '陶瓷/马克杯', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('729', '724', '保温杯', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('730', '724', '保温壶', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('731', '724', '酒杯/酒具', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('732', '724', '杯具套装', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('733', '699', '餐具', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('734', '733', '餐具套装', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('735', '733', '碗/碟/盘', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('736', '733', '筷勺/刀叉', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('737', '733', '一次性用品', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('738', '733', '果盘/果篮', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('739', '699', '茶具/咖啡具', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('740', '739', '整套茶具', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('741', '739', '茶杯', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('742', '739', '茶壶', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('743', '739', '茶盘茶托', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('744', '739', '茶叶罐', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('745', '739', '茶具配件', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('746', '739', '茶宠摆件', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('747', '739', '咖啡具', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('748', '739', '其他', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('749', '0', '服饰内衣', '1', '14', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('750', '749', '女装', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('751', '750', 'T恤', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('752', '750', '衬衫', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('753', '750', '针织衫', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('754', '750', '雪纺衫', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('755', '750', '卫衣', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('756', '750', '马甲', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('757', '750', '连衣裙', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('758', '750', '半身裙', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('759', '750', '牛仔裤', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('760', '750', '休闲裤', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('761', '750', '打底裤', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('762', '750', '正装裤', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('763', '750', '小西装', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('764', '750', '短外套', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('765', '750', '风衣', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('766', '750', '毛呢大衣', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('767', '750', '真皮皮衣', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('768', '750', '棉服', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('769', '750', '羽绒服', '1', '19', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('770', '750', '大码女装', '1', '20', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('771', '750', '中老年女装', '1', '21', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('772', '750', '婚纱', '1', '22', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('773', '750', '打底衫', '1', '23', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('774', '750', '旗袍/唐装', '1', '24', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('775', '750', '加绒裤', '1', '25', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('776', '750', '吊带/背心', '1', '26', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('777', '750', '羊绒衫', '1', '27', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('778', '750', '短裤', '1', '28', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('779', '750', '皮草', '1', '29', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('780', '750', '礼服', '1', '30', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('781', '750', '仿皮皮衣', '1', '31', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('782', '750', '羊毛衫', '1', '32', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('783', '750', '设计师/潮牌', '1', '33', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('784', '749', '男装', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('785', '784', '衬衫', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('786', '784', 'T恤', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('787', '784', 'POLO衫', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('788', '784', '针织衫', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('789', '784', '羊绒衫', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('790', '784', '卫衣', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('791', '784', '马甲/背心', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('792', '784', '夹克', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('793', '784', '风衣', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('794', '784', '毛呢大衣', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('795', '784', '仿皮皮衣', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('796', '784', '西服', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('797', '784', '棉服', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('798', '784', '羽绒服', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('799', '784', '牛仔裤', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('800', '784', '休闲裤', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('801', '784', '西裤', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('802', '784', '西服套装', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('803', '784', '大码男装', '1', '19', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('804', '784', '中老年男装', '1', '20', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('805', '784', '唐装/中山装', '1', '21', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('806', '784', '工装', '1', '22', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('807', '784', '真皮皮衣', '1', '23', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('808', '784', '加绒裤', '1', '24', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('809', '784', '卫裤/运动裤', '1', '25', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('810', '784', '短裤', '1', '26', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('811', '784', '设计师/潮牌', '1', '27', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('812', '784', '羊毛衫', '1', '28', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('813', '749', '内衣', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('814', '813', '文胸', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('815', '813', '女式内裤', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('816', '813', '男式内裤', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('817', '813', '睡衣/家居服', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('818', '813', '塑身美体', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('819', '813', '泳衣', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('820', '813', '吊带/背心', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('821', '813', '抹胸', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('822', '813', '连裤袜/丝袜', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('823', '813', '美腿袜', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('824', '813', '商务男袜', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('825', '813', '保暖内衣', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('826', '813', '情侣睡衣', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('827', '813', '文胸套装', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('828', '813', '少女文胸', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('829', '813', '休闲棉袜', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('830', '813', '大码内衣', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('831', '813', '内衣配件', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('832', '813', '打底裤袜', '1', '19', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('833', '813', '打底衫', '1', '20', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('834', '813', '秋衣秋裤', '1', '21', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('835', '813', '情趣内衣', '1', '22', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('836', '749', '服饰配件', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('837', '836', '太阳镜', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('838', '836', '光学镜架/镜片', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('839', '836', '围巾/手套/帽子套装', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('840', '836', '袖扣', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('841', '836', '棒球帽', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('842', '836', '毛线帽', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('843', '836', '遮阳帽', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('844', '836', '老花镜', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('845', '836', '装饰眼镜', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('846', '836', '防辐射眼镜', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('847', '836', '游泳镜', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('848', '836', '女士丝巾/围巾/披肩', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('849', '836', '男士丝巾/围巾', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('850', '836', '鸭舌帽', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('851', '836', '贝雷帽', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('852', '836', '礼帽', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('853', '836', '真皮手套', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('854', '836', '毛线手套', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('855', '836', '防晒手套', '1', '19', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('856', '836', '男士腰带/礼盒', '1', '20', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('857', '836', '女士腰带/礼盒', '1', '21', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('858', '836', '钥匙扣', '1', '22', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('859', '836', '遮阳伞/雨伞', '1', '23', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('860', '836', '口罩', '1', '24', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('861', '836', '耳罩/耳包', '1', '25', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('862', '836', '假领', '1', '26', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('863', '836', '毛线/布面料', '1', '27', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('864', '836', '领带/领结/领带夹', '1', '28', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('865', '0', '鞋靴', '1', '15', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('866', '865', '流行男鞋', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('867', '866', '商务休闲鞋', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('868', '866', '正装鞋', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('869', '866', '休闲鞋', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('870', '866', '凉鞋/沙滩鞋', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('871', '866', '男靴', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('872', '866', '功能鞋', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('873', '866', '拖鞋/人字拖', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('874', '866', '雨鞋/雨靴', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('875', '866', '传统布鞋', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('876', '866', '鞋配件', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('877', '866', '帆布鞋', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('878', '866', '增高鞋', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('879', '866', '工装鞋', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('880', '866', '定制鞋', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('881', '865', '时尚女鞋', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('882', '881', '高跟鞋', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('883', '881', '单鞋', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('884', '881', '休闲鞋', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('885', '881', '凉鞋', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('886', '881', '女靴', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('887', '881', '雪地靴', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('888', '881', '拖鞋/人字拖', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('889', '881', '踝靴', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('890', '881', '筒靴', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('891', '881', '帆布鞋', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('892', '881', '雨鞋/雨靴', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('893', '881', '妈妈鞋', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('894', '881', '鞋配件', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('895', '881', '特色鞋', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('896', '881', '鱼嘴鞋', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('897', '881', '布鞋/绣花鞋', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('898', '881', '马丁靴', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('899', '881', '坡跟鞋', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('900', '881', '松糕鞋', '1', '19', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('901', '881', '内增高', '1', '20', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('902', '881', '防水台', '1', '21', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('903', '0', '礼品箱包', '1', '16', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('904', '903', '潮流女包', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('905', '904', '钱包', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('906', '904', '手拿包/晚宴包', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('907', '904', '单肩包', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('908', '904', '双肩包', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('909', '904', '手提包', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('910', '904', '斜挎包', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('911', '904', '钥匙包', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('912', '904', '卡包/零钱包', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('913', '903', '精品男包', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('914', '913', '钱包/卡包', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('915', '913', '男士手包', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('916', '913', '商务公文包', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('917', '913', '双肩包', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('918', '913', '单肩/斜挎包', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('919', '913', '钥匙包', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('920', '903', '功能箱包', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('921', '920', '电脑包', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('922', '920', '拉杆箱/拉杆包', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('923', '920', '旅行包', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('924', '920', '旅行配件', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('925', '920', '休闲运动包', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('926', '920', '登山包', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('927', '920', '妈咪包', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('928', '920', '书包', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('929', '920', '相机包', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('930', '920', '腰包/胸包', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('931', '903', '礼品', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('932', '931', '火机烟具', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('933', '931', '礼品文具', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('934', '931', '军刀军具', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('935', '931', '收藏品', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('936', '931', '工艺礼品', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('937', '931', '创意礼品', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('938', '931', '礼盒礼券', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('939', '931', '鲜花绿植', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('940', '931', '婚庆用品', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('941', '931', '京东卡', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('942', '931', '美妆礼品', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('943', '931', '地方礼品', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('944', '931', '古董把玩', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('945', '903', '奢侈品', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('946', '945', '箱包', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('947', '945', '钱包', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('948', '945', '服饰', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('949', '945', '腰带', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('950', '945', '太阳镜/眼镜框', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('951', '945', '配件', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('952', '945', '鞋靴', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('953', '945', '饰品', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('954', '945', '名品腕表', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('955', '945', '高档化妆品', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('956', '903', '婚庆', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('957', '956', '婚嫁首饰', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('958', '956', '婚纱摄影', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('959', '956', '婚纱礼服', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('960', '956', '婚庆服务', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('961', '956', '婚庆礼品/用品', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('962', '956', '婚宴', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('963', '0', '珠宝', '1', '17', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('964', '963', '时尚饰品', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('965', '964', '项链', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('966', '964', '手链/脚链', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('967', '964', '戒指', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('968', '964', '耳饰', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('969', '964', '头饰', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('970', '964', '胸针', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('971', '964', '婚庆饰品', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('972', '964', '饰品配件', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('973', '963', '纯金K金饰品', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('974', '973', '吊坠/项链', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('975', '973', '手镯/手链/脚链', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('976', '973', '戒指', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('977', '973', '耳饰', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('978', '963', '金银投资', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('979', '978', '工艺金', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('980', '978', '工艺银', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('981', '963', '银饰', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('982', '981', '吊坠/项链', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('983', '981', '手镯/手链/脚链', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('984', '981', '戒指/耳饰', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('985', '981', '宝宝银饰', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('986', '981', '千足银手镯', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('987', '963', '钻石', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('988', '987', '裸钻', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('989', '987', '戒指', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('990', '987', '项链/吊坠', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('991', '987', '耳饰', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('992', '987', '手镯/手链', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('993', '963', '翡翠玉石', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('994', '993', '项链/吊坠', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('995', '993', '手镯/手串', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('996', '993', '戒指', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('997', '993', '耳饰', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('998', '993', '挂件/摆件/把件', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('999', '993', '高值收藏', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1000', '963', '水晶玛瑙', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1001', '1000', '项链/吊坠', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1002', '1000', '耳饰', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1003', '1000', '手镯/手链/脚链', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1004', '1000', '戒指', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1005', '1000', '头饰/胸针', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1006', '1000', '摆件/挂件', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1007', '963', '彩宝', '1', '8', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1008', '1007', '项链/吊坠', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1009', '1007', '耳饰', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1010', '1007', '手镯/手链', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1011', '1007', '戒指', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1012', '963', '铂金', '1', '9', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1013', '1012', '项链/吊坠', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1014', '1012', '手镯/手链/脚链', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1015', '1012', '戒指', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1016', '1012', '耳饰', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1017', '963', '天然木饰', '1', '10', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1018', '1017', '小叶紫檀', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1019', '1017', '黄花梨', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1020', '1017', '沉香', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1021', '1017', '金丝楠', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1022', '1017', '菩提', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1023', '1017', '其他', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1024', '963', '珍珠', '1', '11', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1025', '1024', '项链', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1026', '1024', '吊坠', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1027', '1024', '耳饰', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1028', '1024', '手链', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1029', '1024', '戒指', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1030', '1024', '胸针', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1031', '0', '运动健康', '1', '18', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1032', '1031', '运动鞋包', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1033', '1032', '休闲鞋', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1034', '1032', '板鞋', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1035', '1032', '帆布鞋', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1036', '1032', '专项运动鞋', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1037', '1032', '跑步鞋', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1038', '1032', '篮球鞋', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1039', '1032', '足球鞋', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1040', '1032', '训练鞋', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1041', '1032', '乒羽网鞋', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1042', '1032', '拖鞋', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1043', '1032', '运动包', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1044', '1031', '运动服饰', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1045', '1044', '运动配饰', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1046', '1044', '羽绒服', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1047', '1044', '毛衫/线衫', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1048', '1044', '乒羽网服', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1049', '1044', '训练服', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1050', '1044', '运动背心', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1051', '1044', '卫衣/套头衫', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1052', '1044', '夹克/风衣', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1053', '1044', 'T恤', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1054', '1044', '棉服', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1055', '1044', '运动裤', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1056', '1044', '套装', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1057', '1031', '骑行运动', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1058', '1057', '折叠车', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1059', '1057', '山地车/公路车', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1060', '1057', '电动车', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1061', '1057', '其他整车', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1062', '1057', '骑行服', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1063', '1057', '骑行装备', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1064', '1031', '垂钓用品', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1065', '1064', '鱼竿鱼线', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1066', '1064', '浮漂鱼饵', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1067', '1064', '钓鱼桌椅', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1068', '1064', '钓鱼配件', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1069', '1064', '钓箱鱼包', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1070', '1064', '其它', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1071', '1031', '游泳用品', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1072', '1071', '泳镜', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1073', '1071', '泳帽', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1074', '1071', '游泳包防水包', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1075', '1071', '女士泳衣', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1076', '1071', '男士泳衣', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1077', '1071', '比基尼', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1078', '1071', '其它', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1079', '1031', '户外鞋服', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1080', '1079', '冲锋衣裤', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1081', '1079', '速干衣裤', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1082', '1079', '滑雪服', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1083', '1079', '羽绒服/棉服', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1084', '1079', '休闲衣裤', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1085', '1079', '抓绒衣裤', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1086', '1079', '软壳衣裤', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1087', '1079', 'T恤', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1088', '1079', '户外风衣', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1089', '1079', '功能内衣', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1090', '1079', '军迷服饰', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1091', '1079', '登山鞋', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1092', '1079', '雪地靴', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1093', '1079', '徒步鞋', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1094', '1079', '越野跑鞋', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1095', '1079', '休闲鞋', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1096', '1079', '工装鞋', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1097', '1079', '溯溪鞋', '1', '18', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1098', '1079', '沙滩/凉拖', '1', '19', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1099', '1079', '户外袜', '1', '20', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1100', '1031', '户外装备', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1101', '1100', '帐篷/垫子', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1102', '1100', '睡袋/吊床', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1103', '1100', '登山攀岩', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1104', '1100', '背包', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1105', '1100', '户外配饰', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1106', '1100', '户外照明', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1107', '1100', '户外仪表', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1108', '1100', '户外工具', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1109', '1100', '望远镜', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1110', '1100', '旅游用品', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1111', '1100', '便携桌椅床', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1112', '1100', '野餐烧烤', '1', '12', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1113', '1100', '军迷用品', '1', '13', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1114', '1100', '救援装备', '1', '14', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1115', '1100', '滑雪装备', '1', '15', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1116', '1100', '极限户外', '1', '16', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1117', '1100', '冲浪潜水', '1', '17', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1118', '1031', '健身训练', '1', '8', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1119', '1118', '综合训练器', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1120', '1118', '其他大型器械', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1121', '1118', '哑铃', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1122', '1118', '仰卧板/收腹机', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1123', '1118', '其他中小型器材', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1124', '1118', '瑜伽舞蹈', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1125', '1118', '武术搏击', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1126', '1118', '健身车/动感单车', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1127', '1118', '跑步机', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1128', '1118', '运动护具', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1129', '1031', '纤体瑜伽', '1', '9', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1130', '1129', '瑜伽垫', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1131', '1129', '瑜伽服', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1132', '1129', '瑜伽配件', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1133', '1129', '瑜伽套装', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1134', '1129', '舞蹈鞋服', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1135', '1031', '体育用品', '1', '10', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1136', '1135', '羽毛球', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1137', '1135', '乒乓球', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1138', '1135', '篮球', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1139', '1135', '足球', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1140', '1135', '网球', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1141', '1135', '排球', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1142', '1135', '高尔夫', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1143', '1135', '台球', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1144', '1135', '棋牌麻将', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1145', '1135', '轮滑滑板', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1146', '1135', '其他', '1', '11', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1147', '0', '彩票、旅行、充值、票务', '1', '19', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1148', '1147', '彩票', '1', '1', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1149', '1148', '双色球', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1150', '1148', '大乐透', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1151', '1148', '福彩3D', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1152', '1148', '排列三', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1153', '1148', '排列五', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1154', '1148', '七星彩', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1155', '1148', '七乐彩', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1156', '1148', '竞彩足球', '1', '8', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1157', '1148', '竞彩篮球', '1', '9', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1158', '1148', '新时时彩', '1', '10', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1159', '1147', '机票', '1', '2', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1160', '1159', '国内机票', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1161', '1147', '酒店', '1', '3', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1162', '1161', '国内酒店', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1163', '1161', '酒店团购', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1164', '1147', '旅行', '1', '4', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1165', '1164', '度假', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1166', '1164', '景点', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1167', '1164', '租车', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1168', '1164', '火车票', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1169', '1164', '旅游团购', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1170', '1147', '充值', '1', '5', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1171', '1170', '手机充值', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1172', '1147', '游戏', '1', '6', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1173', '1172', '游戏点卡', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1174', '1172', 'QQ充值', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1175', '1147', '票务', '1', '7', '1', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1176', '1175', '电影票', '1', '1', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1177', '1175', '演唱会', '1', '2', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1178', '1175', '话剧歌剧', '1', '3', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1179', '1175', '音乐会', '1', '4', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1180', '1175', '体育赛事', '1', '5', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1181', '1175', '舞蹈芭蕾', '1', '6', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1182', '1175', '戏曲综艺', '1', '7', '0', null, null, '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1183', '0', '品牌周边', '1', '1', '1', null, null, '2018-04-18 20:37:47', '2018-04-18 20:37:49');
INSERT INTO `tb_item_cat` VALUES ('1184', '1183', '品牌周边', '1', '1', '0', null, null, '2018-04-18 20:38:07', '2018-04-18 20:38:09');

-- ----------------------------
-- Table structure for tb_item_desc
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_desc`;
CREATE TABLE `tb_item_desc` (
  `item_id` bigint(20) NOT NULL COMMENT '商品ID',
  `item_desc` text COMMENT '商品描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of tb_item_desc
-- ----------------------------
INSERT INTO `tb_item_desc` VALUES ('562379', '<img src=\"http://image.smartisanos.cn/resource/98521dbfe1dd1e67db3f7ca21e76c9ef.jpg\" style=\"width:1220px;height:7000px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:19:07');
INSERT INTO `tb_item_desc` VALUES ('679532', '<img src=\"http://image.smartisanos.cn/resource/4a7b87fe01ec8339985702ee922d205a.jpg\" style=\"width:1220px;height:4526px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-09 22:31:04');
INSERT INTO `tb_item_desc` VALUES ('679533', '<img src=\"http://image.smartisanos.cn/resource/0bb13cf0b2e0b4817f4914a317fb1445.png\" style=\"width:1220px;height:6481px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:28:04');
INSERT INTO `tb_item_desc` VALUES ('691300', '<img src=\"http://image.smartisanos.cn/resource/d930be42185ab064035d0894f37ea179.jpg\" style=\"width:1220px;height:6478px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-09 22:22:53');
INSERT INTO `tb_item_desc` VALUES ('738388', '<img src=\"http://image.smartisanos.cn/resource/b3d7b420e3e609e858a8d75f19cbfd7c.jpg\" style=\"width:1220px;height:4829px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:21:41');
INSERT INTO `tb_item_desc` VALUES ('741524', '<img src=\"http://image.smartisanos.cn/resource/73fdd5f948cd6248c51521e87acb33e5.jpg\" style=\"width:1220px;height:8703px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:31:05');
INSERT INTO `tb_item_desc` VALUES ('816448', '<img src=\"http://image.smartisanos.cn/resource/e7ed8222dcd7c9f67af3097bd7bd5c2b.jpg\" style=\"width:1220px;height:12257px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:42:22');
INSERT INTO `tb_item_desc` VALUES ('816753', '<img src=\"http://image.smartisanos.cn/resource/62a60be80e9cd3307ef334ede82b430a.jpg\" style=\"width:1220px;height:8267px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:41:18');
INSERT INTO `tb_item_desc` VALUES ('830972', '<img src=\"http://image.smartisanos.cn/resource/102ed8a03b5f4452dda7dc513c016f12.jpg\" style=\"width:1220px;height:8811px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:37:54');
INSERT INTO `tb_item_desc` VALUES ('832739', '<img src=\"http://image.smartisanos.cn/resource/f86802b6a7b207d02f5c69163fa5e347.jpg\" style=\"width:1220px;height:13682px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:39:10');
INSERT INTO `tb_item_desc` VALUES ('844022', '<img src=\"http://image.smartisanos.cn/resource/bcd85c778a0b54b61afe813bd7b674d4.jpg\" style=\"width:1220px;height:12384px;\" alt=\"\" />', '2017-09-05 21:27:54', '2017-11-19 21:40:07');
INSERT INTO `tb_item_desc` VALUES ('847276', '<img src=\"http://image.smartisanos.cn/resource/9be6229b3498749c4afd173a3b1fe165.png\" style=\"width:1220px;height:15514px;\" alt=\"\" />', '2017-09-05 21:27:54', '2018-04-20 22:18:11');
INSERT INTO `tb_item_desc` VALUES ('856645', '<div class=\"ssd-module-wrap\" style=\"margin:0 auto;text-align:left;\">\n	<div class=\"outer-container\">\n		<div class=\" \" id=\"\">\n			<div class=\"ssd-1080\">\n				<div class=\"ssd-j-module item_tit\">\n					<div class=\"tit1\">\n						产品特色\n					</div>\n					<div class=\"tit2\">\n						PRODUCTION\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-1183\">\n				<div class=\"ssd-j-module item_tw_1\" style=\"background:#ffffff url(http://img30.360buyimg.com/sku/jfs/t460/159/849423048/82352/867f75ff/548e5a88N73b12dd9.jpg) no-repeat;\">\n					<div class=\"txt_box\">\n						<div class=\"title1\">\n						</div>\n						<div class=\"title2\">\n						</div>\n					</div>\n					<div class=\"img-pic\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t451/241/814906943/1043/fa877bc/548e4238N585a2a89.png\" alt=\"\" /> \n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-2165\">\n				<div class=\"ssd-j-module item_tw_1\" style=\"background:#ffffff url(http://img30.360buyimg.com/cms/jfs/t217/232/2460673136/4947/e76ec4b7/541a3cf8Ne7d0749d.png) no-repeat;\">\n					<div class=\"img-pic\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t598/141/839042103/90325/3ea2cf8a/548e7e74Nc2025337.jpg\" alt=\"\" /> \n					</div>\n					<div class=\"txt_box\">\n						<div class=\"title1\">\n						</div>\n						<div class=\"title2\">\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-2165\">\n				<div class=\"ssd-j-module item_tw_1\" style=\"background:#ffffff;\">\n					<div class=\"img-pic\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t472/95/847651115/101211/6b98601c/548e7fc5Ncb21ef86.jpg\" alt=\"\" /> \n					</div>\n					<div class=\"txt_box\">\n						<div class=\"title1\">\n							、\n						</div>\n						<div class=\"title2\">\n							、\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \" id=\"\">\n			<div class=\"ssd-1080\">\n				<div class=\"ssd-j-module item_tit\">\n					<div class=\"tit1\">\n						产品功能\n					</div>\n					<div class=\"tit2\">\n						PRODUCT FUNCTION\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-2165\">\n				<div class=\"ssd-j-module item_tw_1\" style=\"background:#ffffff url(http://img30.360buyimg.com/cms/jfs/t217/232/2460673136/4947/e76ec4b7/541a3cf8Ne7d0749d.png) no-repeat;\">\n					<div class=\"img-pic\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t745/150/148843066/79290/604280fc/548e8318Na94c82f9.jpg\" alt=\"\" /> \n					</div>\n					<div class=\"txt_box\">\n						<div class=\"title1\">\n							、\n						</div>\n						<div class=\"title2\">\n							、\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-1829\">\n				<div class=\"ssd-j-module item_tw_1\" style=\"background:#ffffff;\">\n					<div class=\"img-pic\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t769/364/157509045/89868/d97d79ef/548e9d75N18fc06d2.jpg\" alt=\"\" /> \n					</div>\n					<div class=\"txt_box\">\n						<div class=\"title1\">\n						</div>\n						<div class=\"title2\">\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-2136\">\n				<div class=\"ssd-j-module img_box\" style=\"background:#cccccc;\">\n					<div class=\"imglab\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t685/187/809086881/59964/1802066d/548ea270N6853bbcd.jpg\" alt=\"\" /> \n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-2136\">\n				<div class=\"ssd-j-module img_box\" style=\"background:#cccccc;\">\n					<div class=\"imglab\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t685/96/811972813/58610/d1082b4d/548ea4ceN7273b5bd.jpg\" alt=\"\" /> \n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-1243\">\n				<div class=\"ssd-j-module item_tw_1\" style=\"background:#f3f3f3 url(http://img30.360buyimg.com/sku/jfs/t487/290/816270587/57176/b1d5d9d0/548ea5afN026eaf9a.jpg) no-repeat;\">\n					<div class=\"txt_box\">\n						<div class=\"title1\">\n							、\n						</div>\n						<div class=\"title2\">\n							、\n						</div>\n					</div>\n					<div class=\"img-pic\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t547/275/827858003/1121/958dc0d9/548ea626Na2fb0cd4.png\" alt=\"\" /> \n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \" id=\"\">\n			<div class=\"ssd-1080\">\n				<div class=\"ssd-j-module item_tit\">\n					<div class=\"tit1\">\n						产品细节\n					</div>\n					<div class=\"tit2\">\n						PRODUCT DETAILS\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-2165\">\n				<div class=\"ssd-j-module item_tw_1\" style=\"background:#ffffff url(http://img30.360buyimg.com/cms/jfs/t217/232/2460673136/4947/e76ec4b7/541a3cf8Ne7d0749d.png) no-repeat;\">\n					<div class=\"img-pic\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t766/326/165583398/153663/931a1487/548ea712N54c54c32.jpg\" alt=\"\" /> \n					</div>\n					<div class=\"txt_box\">\n						<div class=\"title1\">\n						</div>\n						<div class=\"title2\">\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\" \">\n			<div class=\"ssd-2165\">\n				<div class=\"ssd-j-module item_tw_1\" style=\"background:#ffffff url(http://img30.360buyimg.com/cms/jfs/t217/232/2460673136/4947/e76ec4b7/541a3cf8Ne7d0749d.png) no-repeat;\">\n					<div class=\"img-pic\">\n						<img class=\"ssd-err-product\" src=\"http://img30.360buyimg.com/sku/jfs/t571/63/809585802/77035/720c5d87/548ea7d9N22f04056.jpg\" alt=\"\" /> \n					</div>\n					<div class=\"txt_box\">\n						<div class=\"title1\">\n						</div>\n						<div class=\"title2\">\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>', '2017-09-05 21:27:54', '2017-10-22 22:04:26');
INSERT INTO `tb_item_desc` VALUES ('150635087972564', '<p style=\"text-align:center;\">\n	<img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t7843/137/3005340945/124833/dc7c71f2/59b8ccd1N2bffd055.jpg\" alt=\"\" /><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t8764/314/1380452846/296346/d62490e2/59b8ccd1N96ce760d.jpg\" alt=\"\" /><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t8710/275/1373463301/363710/ebf00bff/59b8ccbaN2d563f74.jpg\" alt=\"\" /><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t8632/330/1390725687/229853/e56f9e1b/59b8ccd1N7b8b6bdb.jpg\" alt=\"\" /><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t9115/290/1376678976/488369/591760dc/59b8ccc6N1563a61b.jpg\" alt=\"\" /><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t8233/331/1431263348/183032/b875528c/59b8ccd1Ne7e633e3.jpg\" alt=\"\" /><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t8785/253/890847377/186916/c467a464/59b8ccd1N4551397c.jpg\" alt=\"\" /> <img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t8728/276/1416802585/172158/1516ec08/59b8ccd1N95aae9c9.jpg\" alt=\"\" /> <img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t9082/133/1223014275/307097/58f97021/59b8ccd2Nebfc633a.jpg\" alt=\"\" /><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t9052/275/1400615286/155643/1b0ecf44/59b8ccd2N46bd82bf.jpg\" alt=\"\" /> <img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t9169/240/1361662217/193435/24ed9b93/59b8ccd4N03cec407.jpg\" alt=\"\" /> <img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t7390/232/3008585906/285016/56cbb12/59b8ccd4Nc8434af8.jpg\" alt=\"\" /> \n</p>', '2017-09-05 21:27:54', '2018-07-13 21:59:05');
INSERT INTO `tb_item_desc` VALUES ('150642571432835', '<br />\n<br />\n<br />\n<span style=\"font-size:18px;\">为什么要捐赠？</span> <br />\n<br />\n<span style=\"font-size:18px;\">在开始之前，首先感谢用户的支持和慷慨解囊，不得不说，你们的支持给予了很大的动力</span> <br />\n<br />\n<span style=\"font-size:18px;\">没有广告和第三方推广的收入，主动捐赠是项目受欢迎程度最直观的体现</span> <br />\n<br />\n<span style=\"font-size:18px;\">当支付宝或微信偶尔收到一笔捐赠，就感觉多了一分认可，多了一分责任</span> <br />\n<br />\n<span style=\"font-size:18px;\">一个非盈利项目仅仅依靠兴趣的支撑，很难确定它还能走多远</span> <br />\n<br />\n<span style=\"font-size:18px;\">它以后会变成怎样，我不知道。我只知道，有些东西，要靠双方去维持</span> <br />\n<br />\n<span style=\"font-size:18px;\">捐赠的渠道</span> <br />\n<br />\n<span style=\"font-size:18px;\">支付宝：</span> <br />\n<br />\n<img src=\"https://i.loli.net/2018/07/13/5b48a7f46be51.png\" width=\"250px\" alt=\"\" /> <br />\n<br />\n<span style=\"font-size:18px;\">微信支付：</span> <br />\n<br />\n<img src=\"https://i.loli.net/2018/07/13/5b48a952de430.png\" width=\"250px\" alt=\"\" /> <br />\n<br />\n<span style=\"font-size:18px;\">微信打赏请留言备注您的信息</span> <br />\n<br />\n<br />\n<br />\n<br />', '2017-09-05 21:27:54', '2018-07-13 21:38:52');
INSERT INTO `tb_item_desc` VALUES ('150642571432836', '<img src=\"https://resource.smartisan.com/resource/36fee45879f4f252492ec552dfd4c323.jpg\" style=\"width:1220px;height:6982px;\" alt=\"\" />', '2018-04-18 20:41:41', '2018-04-20 00:21:01');
INSERT INTO `tb_item_desc` VALUES ('150642571432837', '<img src=\"https://resource.smartisan.com/resource/5dcbe27f36e1f8f2bfdfabb0b2681879.jpg\" style=\"width:1220px;height:3665px;\" alt=\"\" />', '2018-04-19 00:34:06', '2018-04-19 23:49:38');
INSERT INTO `tb_item_desc` VALUES ('150642571432838', '<img src=\"https://resource.smartisan.com/resource/3aa27e8caf798b5e7e3796388190b43b.jpg\" style=\"width:1220px;height:5797px;\" alt=\"\" />', '2018-04-19 00:35:50', '2018-04-20 00:01:08');
INSERT INTO `tb_item_desc` VALUES ('150642571432839', '<img src=\"https://resource.smartisan.com/resource/fda5d962cc2b2e579c5df1c3d9e2f2c8.jpg\" style=\"width:1220px;height:4957px;\" alt=\"\" />', '2018-04-19 00:38:07', '2018-04-20 00:02:54');
INSERT INTO `tb_item_desc` VALUES ('150642571432840', '<img src=\"https://resource.smartisan.com/resource/14497b77e21fc6d0807e57bb9deabe28.jpg\" style=\"width:1220px;height:9527px;\" alt=\"\" />', '2018-04-19 00:40:40', '2018-04-20 00:04:41');
INSERT INTO `tb_item_desc` VALUES ('150642571432841', '<img src=\"https://resource.smartisan.com/resource/4272e7737eed967a8f2f10ebef9b84dc.jpg style=\"width:1220px;height:4990px;\" alt=\"\" />', '2018-04-19 00:43:48', '2018-04-20 00:06:59');
INSERT INTO `tb_item_desc` VALUES ('150642571432842', '<img src=\"https://resource.smartisan.com/resource/4cbe4a14ab225c9466e16f8c8ef4e29e.jpg\" style=\"width:1220px;height:4083px;\" alt=\"\" />', '2018-04-19 00:45:14', '2018-04-20 00:08:21');
INSERT INTO `tb_item_desc` VALUES ('150642571432843', '<img src=\"https://img20.360buyimg.com/vc/jfs/t17368/340/1617561606/1069487/9676971/5ad014b1Nb8463c4e.jpg\" width=\"1220px\" alt=\"\" />\n<img src=\"https://img20.360buyimg.com/vc/jfs/t17278/52/1620296383/1157116/3d0f473/5ad014b8N32c9c183.jpg\" width=\"1220px\" alt=\"\" />\n<img src=\"https://img20.360buyimg.com/vc/jfs/t19420/87/1609028179/1135327/9b3e0f97/5ad014c0N6234ba19.jpg\" width=\"1220px\" alt=\"\" />', '2018-04-19 22:13:31', '2018-07-13 22:03:52');
INSERT INTO `tb_item_desc` VALUES ('150642571432844', '<img src=\"https://img20.360buyimg.com/vc/jfs/t11503/47/1494539812/1725396/3defedb6/5a046e18Ne0a5d5da.jpg\" alt=\"\" />', '2018-04-19 22:16:05', '2018-07-13 22:06:58');
INSERT INTO `tb_item_desc` VALUES ('150642571432845', '<img src=\"https://resource.smartisan.com/resource/27a054301d8e10c40461443928dccd77.jpg\" style=\"width:1220px;height:7451px;\" alt=\"\" />', '2018-04-19 22:22:02', '2018-04-20 00:19:39');
INSERT INTO `tb_item_desc` VALUES ('150642571432846', '<img src=\"https://resource.smartisan.com/resource/65e89427674ee370fa58f5fe98120679.png\" style=\"width:1220px;height:7881px;\" alt=\"\" />', '2018-04-19 22:23:39', '2018-04-20 00:23:09');
INSERT INTO `tb_item_desc` VALUES ('150642571432847', '<img src=\"https://resource.smartisan.com/resource/41338ebac06fc82450f8b8e4867df257.jpg\" style=\"width:1220px;height:5043px;\" alt=\"\" />', '2018-04-19 22:25:41', '2018-04-20 10:51:53');
INSERT INTO `tb_item_desc` VALUES ('150642571432848', '<img src=\"https://resource.smartisan.com/resource/debb893778547fb9d5a6119b376d9ec1.jpg\" style=\"width:1220px;height:6879px;\" alt=\"\" />', '2018-04-19 22:28:11', '2018-04-20 10:53:15');
INSERT INTO `tb_item_desc` VALUES ('150642571432849', '<img src=\"https://resource.smartisan.com/resource/f03a523847e63f28f9238aad45567b37.jpg\" style=\"width:1220px;height:7935px;\" alt=\"\" />', '2018-04-19 22:31:09', '2018-04-21 11:26:31');
INSERT INTO `tb_item_desc` VALUES ('150642571432850', '<img src=\"https://resource.smartisan.com/resource/f6de19257228641b1a0c1964239b19b7.jpg\" style=\"width:1220px;height:9970px;\" alt=\"\" />', '2018-04-19 22:32:38', '2018-04-20 11:17:31');
INSERT INTO `tb_item_desc` VALUES ('150642571432851', '<img src=\"https://resource.smartisan.com/resource/a1f3fbf662376e8684e528f05721b286.jpg\" style=\"width:1220px;height:14998px;\" alt=\"\" />', '2018-04-19 22:36:50', '2018-04-20 00:13:44');

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `request_type` varchar(255) DEFAULT NULL,
  `request_param` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------

-- ----------------------------
-- Table structure for tb_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE `tb_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `sex` varchar(2) DEFAULT '',
  `address` varchar(255) DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  `file` varchar(255) DEFAULT NULL COMMENT '头像',
  `description` varchar(500) DEFAULT NULL,
  `points` int(11) DEFAULT '0' COMMENT '积分',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_member
-- ----------------------------
INSERT INTO `tb_member` VALUES ('62', 'test', '098f6bcd4621d373cade4e832627b4f6', null, null, '2017-09-05 21:27:54', '2017-10-08 18:13:51', null, null, '1', 'http://ow2h3ee9w.bkt.clouddn.com/1507866636672.png', null, null, null);
INSERT INTO `tb_member` VALUES ('63', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, '2017-09-05 21:27:54', '2018-04-18 14:43:32', null, null, '2', 'http://ow2h3ee9w.bkt.clouddn.com/1507875078112.png', null, null, null);
INSERT INTO `tb_member` VALUES ('64', 'xhy', '21232f297a57a5a743894a0e4a801fc3', null, null, '2017-09-05 21:27:54', '2018-04-18 14:43:33', null, null, '2', null, null, null, null);
INSERT INTO `tb_member` VALUES ('65', 'xhy1', '202cb962ac59075b964b07152d234b70', null, null, '2017-09-05 21:27:54', '2017-10-17 21:21:32', null, null, '0', '', null, null, null);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单id',
  `payment` decimal(10,2) DEFAULT NULL COMMENT '实付金额',
  `payment_type` int(1) DEFAULT NULL COMMENT '支付类型 1在线支付 2货到付款',
  `post_fee` decimal(10,2) DEFAULT NULL COMMENT '邮费',
  `status` int(1) DEFAULT NULL COMMENT '状态 0未付款 1已付款 2未发货 3已发货 4交易成功 5交易关闭 6交易失败',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `buyer_message` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `buyer_comment` tinyint(1) DEFAULT NULL COMMENT '买家是否已经评价',
  PRIMARY KEY (`order_id`),
  KEY `create_time` (`create_time`),
  KEY `buyer_nick` (`buyer_nick`),
  KEY `status` (`status`),
  KEY `payment_type` (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('150787555927616', '1.00', null, null, '5', '2017-10-13 14:19:19', '2017-10-13 14:19:19', null, null, null, '2017-10-13 14:19:35', null, null, '63', null, 'admin', null);

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `item_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `order_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单id',
  `num` int(10) DEFAULT NULL COMMENT '商品购买数量',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `total_fee` decimal(10,2) DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------
INSERT INTO `tb_order_item` VALUES ('150787555927880', '150642571432835', '150787555927616', '1', '捐赠商品', '1.00', '1.00', 'http://ow2h3ee9w.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB');

-- ----------------------------
-- Table structure for tb_order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_shipping`;
CREATE TABLE `tb_order_shipping` (
  `order_id` varchar(50) NOT NULL COMMENT '订单ID',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_shipping
-- ----------------------------
INSERT INTO `tb_order_shipping` VALUES ('150787555927616', '4', '4', null, null, null, null, '4', null, '2017-10-13 14:19:19', '2017-10-13 14:19:19');

-- ----------------------------
-- Table structure for tb_panel
-- ----------------------------
DROP TABLE IF EXISTS `tb_panel`;
CREATE TABLE `tb_panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `name` varchar(50) DEFAULT NULL COMMENT '板块名称',
  `type` int(1) DEFAULT NULL COMMENT '类型 0轮播图 1板块种类一 2板块种类二 3板块种类三 ',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号',
  `position` int(1) DEFAULT NULL COMMENT '所属位置 0首页 1商品推荐 2我要捐赠',
  `limit_num` int(4) DEFAULT NULL COMMENT '板块限制商品数量',
  `status` int(1) DEFAULT '1' COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`status`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='内容分类';

-- ----------------------------
-- Records of tb_panel
-- ----------------------------
INSERT INTO `tb_panel` VALUES ('1', '热门商品', '2', '2', '0', '3', '1', '', '2018-04-18 23:49:13', '2018-04-15 19:05:16');
INSERT INTO `tb_panel` VALUES ('2', '官方精选', '3', '3', '0', '8', '1', '', null, '2018-04-19 11:20:59');
INSERT INTO `tb_panel` VALUES ('3', '品牌精选', '3', '5', '0', '7', '1', '', '2018-04-18 23:49:19', '2018-04-17 18:54:15');
INSERT INTO `tb_panel` VALUES ('4', '我要捐赠', '2', '3', '2', '2', '1', '', '2017-09-23 15:20:31', '2017-11-06 13:17:04');
INSERT INTO `tb_panel` VALUES ('6', '为您推荐', '2', '6', '1', '2', '1', '', '2017-11-06 13:17:41', '2017-11-06 13:17:41');
INSERT INTO `tb_panel` VALUES ('7', '轮播图', '0', '0', '0', '5', '1', '', '2018-04-15 12:33:07', '2018-04-15 12:33:07');
INSERT INTO `tb_panel` VALUES ('8', '活动版块', '1', '1', '0', '4', '1', '', '2018-04-15 19:05:00', '2018-04-15 19:05:00');
INSERT INTO `tb_panel` VALUES ('9', '活动版块2', '1', '7', '0', '4', '1', '', null, '2018-04-19 11:57:47');
INSERT INTO `tb_panel` VALUES ('10', '品牌周边', '3', '4', '0', '7', '1', null, '2018-04-18 23:50:32', '2018-04-18 23:50:35');

-- ----------------------------
-- Table structure for tb_panel_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_panel_content`;
CREATE TABLE `tb_panel_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_id` int(11) NOT NULL COMMENT '所属板块id',
  `type` int(1) DEFAULT NULL COMMENT '类型 0关联商品 1其他链接',
  `product_id` bigint(20) DEFAULT NULL COMMENT '关联商品id',
  `sort_order` int(4) DEFAULT NULL,
  `full_url` varchar(500) DEFAULT NULL COMMENT '其他链接',
  `pic_url` varchar(500) DEFAULT NULL,
  `pic_url2` varchar(500) DEFAULT NULL COMMENT '3d轮播图备用',
  `pic_url3` varchar(500) DEFAULT NULL COMMENT '3d轮播图备用',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`panel_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_panel_content
-- ----------------------------
INSERT INTO `tb_panel_content` VALUES ('2', '3', '0', '150642571432851', '1', '', 'https://resource.smartisan.com/resource/7ac3af5a92ad791c2b38bfe1e38ee334.jpg', null, null, '2017-09-23 00:03:02', '2018-04-20 00:23:40');
INSERT INTO `tb_panel_content` VALUES ('7', '3', '0', '816448', '2', '', 'https://resource.smartisan.com/resource/41cb562a47d4831e199ed7e2057f3b61.jpg', null, null, '2017-09-23 22:58:11', '2018-04-20 00:14:29');
INSERT INTO `tb_panel_content` VALUES ('8', '2', '0', '150642571432837', '1', '', 'https://resource.smartisan.com/resource/3a7522290397a9444d7355298248f197.jpg', null, null, '2017-09-25 17:03:48', '2018-04-19 23:23:26');
INSERT INTO `tb_panel_content` VALUES ('9', '2', '0', '150642571432838', '2', '', 'https://resource.smartisan.com/resource/63ea40e5c64db1c6b1d480c48fe01272.jpg', null, null, '2017-09-25 17:04:35', '2018-04-20 10:48:17');
INSERT INTO `tb_panel_content` VALUES ('14', '2', '0', '150642571432839', '3', '', 'https://resource.smartisan.com/resource/5e4b1feddb13639550849f12f6b2e202.jpg', null, null, '2017-10-22 22:14:01', '2018-04-20 10:48:29');
INSERT INTO `tb_panel_content` VALUES ('15', '2', '0', '150642571432840', '4', '', 'https://resource.smartisan.com/resource/10525c4b21f039fc8ccb42cd1586f5cd.jpg', null, null, '2017-10-22 22:14:52', '2018-04-20 10:48:43');
INSERT INTO `tb_panel_content` VALUES ('16', '2', '0', '150642571432841', '5', '', 'https://resource.smartisan.com/resource/b899d9b82c4bc2710492a26af021d484.jpg', null, null, '2017-10-22 22:15:51', '2018-04-20 10:49:02');
INSERT INTO `tb_panel_content` VALUES ('17', '2', '0', '150642571432842', '6', '', 'https://resource.smartisan.com/resource/abb6986430536cd9365352b434f3c568.jpg', null, null, '2017-10-22 22:17:01', '2018-04-20 10:49:17');
INSERT INTO `tb_panel_content` VALUES ('18', '3', '0', '847276', '3', null, 'https://resource.smartisan.com/resource/99c548bfc9848a8c95f4e4f7f2bc1095.png', null, null, '2017-10-22 22:22:52', '2017-10-22 22:22:52');
INSERT INTO `tb_panel_content` VALUES ('19', '3', '0', '150642571432844', '4', '', 'https://resource.smartisan.com/resource/71432ad30288fb860a4389881069b874.png', null, null, '2017-10-22 22:23:35', '2018-04-20 11:25:38');
INSERT INTO `tb_panel_content` VALUES ('20', '3', '0', '847276', '5', '', 'https://resource.smartisan.com/resource/804b82e4c05516e822667a23ee311f7c.jpg', null, null, '2017-10-22 22:24:54', '2018-04-20 00:15:03');
INSERT INTO `tb_panel_content` VALUES ('21', '3', '0', '150642571432852', '6', '', 'https://resource.smartisan.com/resource/367d93db1d58f9f3505bc0ec18efaa44.jpg', null, null, '2017-10-22 22:25:28', '2018-04-20 00:24:11');
INSERT INTO `tb_panel_content` VALUES ('22', '1', '0', '150635087972564', '1', null, 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', null, null, '2017-10-22 22:26:31', '2017-10-22 22:26:31');
INSERT INTO `tb_panel_content` VALUES ('23', '1', '0', '150642571432835', '2', '', 'http://ow2h3ee9w.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB', null, null, '2017-10-22 22:26:40', '2018-04-17 20:59:35');
INSERT INTO `tb_panel_content` VALUES ('25', '8', '0', '150642571432835', '1', 'https://www.smartisan.com/jianguo3-accessories', 'https://resource.smartisan.com/resource/6/610400xinpinpeijian.jpg', null, null, '2018-04-15 19:07:43', '2018-04-19 23:20:34');
INSERT INTO `tb_panel_content` VALUES ('26', '8', '0', '150635087972564', '2', 'https://www.smartisan.com/service/#/tradein', 'https://resource.smartisan.com/resource/6/610400yijiuhuanxin.jpg', null, null, '2018-04-15 19:08:00', '2018-04-19 23:20:48');
INSERT INTO `tb_panel_content` VALUES ('27', '8', '0', '150642571432835', '3', 'https://www.smartisan.com/category?id=69', 'https://resource.smartisan.com/resource/4/489673079577637073.png', null, null, '2018-04-15 19:08:24', '2018-04-19 23:21:01');
INSERT INTO `tb_panel_content` VALUES ('28', '8', '0', '150635087972564', '4', 'https://www.smartisan.com/', 'https://resource.smartisan.com/resource/fe6ab43348a43152b4001b4454d206ac.jpg', null, null, '2018-04-15 19:08:58', '2018-04-19 23:21:13');
INSERT INTO `tb_panel_content` VALUES ('29', '2', '2', '150642571432843', '0', '', 'https://resource.smartisan.com/resource/1/1220858shoujilouceng.jpg', null, null, '2018-04-15 20:14:35', '2018-04-20 11:41:27');
INSERT INTO `tb_panel_content` VALUES ('30', '3', '2', '150642571432850', '0', '', 'https://resource.smartisan.com/resource/a/acillouceng1220856.jpg', null, null, '2018-04-15 20:15:18', '2018-04-20 11:18:03');
INSERT INTO `tb_panel_content` VALUES ('32', '7', '0', '150635087972564', '1', '', 'http://static.smartisanos.cn/index/img/store/home/banner-3d-item-1-box-1_61bdc2f4f9.png', 'http://static.smartisanos.cn/index/img/store/home/banner-3d-item-1-box-3_8fa7866d59.png', 'http://ow2h3ee9w.bkt.clouddn.com/banner-3d-item-1-box-33.png', '2018-04-17 20:41:02', '2018-04-17 20:58:41');
INSERT INTO `tb_panel_content` VALUES ('33', '7', '0', '150642571432835', '2', '', 'http://oweupqzdv.bkt.clouddn.com/bg_left.png', 'http://ow2h3ee9w.bkt.clouddn.com/phone_left2.png', 'http://oweupqzdv.bkt.clouddn.com/erji_left.png', '2018-04-17 21:08:22', '2018-04-20 10:47:19');
INSERT INTO `tb_panel_content` VALUES ('34', '7', '0', '150635087972564', '3', null, 'https://s1.ax1x.com/2018/05/19/Ccdiid.png', '', '', '2018-04-17 21:08:30', '2018-04-17 21:08:32');
INSERT INTO `tb_panel_content` VALUES ('35', '7', '0', '150642571432843', '4', '', 'http://ow2h3ee9w.bkt.clouddn.com/24401108web1.png', null, null, '2018-04-18 23:44:48', '2018-04-20 11:41:46');
INSERT INTO `tb_panel_content` VALUES ('36', '9', '0', '150635087972564', '1', 'https://www.smartisan.com/pr/#/video/conference-jianguopro2', 'https://resource.smartisan.com/resource/88684d7ed5eee77e34f044fa32a9121b.png', null, null, '2018-04-18 23:51:45', '2018-04-20 12:03:05');
INSERT INTO `tb_panel_content` VALUES ('37', '9', '0', '150642571432835', '2', 'https://www.smartisan.com/os/#/4-x', 'https://resource.smartisan.com/resource/6/610400dibu.jpg', null, null, '2018-04-18 23:51:51', '2018-04-20 12:03:19');
INSERT INTO `tb_panel_content` VALUES ('38', '9', '0', '150635087972564', '3', 'https://www.smartisan.com/pr/#/video/changhuxi-jinghuaqi', 'https://resource.smartisan.com/resource/c245ada282824a4a15e68bec80502ad4.jpg', null, null, '2018-04-18 23:51:58', '2018-04-20 12:03:31');
INSERT INTO `tb_panel_content` VALUES ('39', '9', '0', '150642571432835', '4', 'https://www.smartisan.com/pr/#/video/onestep-introduction', 'https://resource.smartisan.com/resource/m/minibanner_03.jpg', null, null, '2018-04-18 23:52:02', '2018-04-20 12:03:41');
INSERT INTO `tb_panel_content` VALUES ('40', '10', '3', null, '0', 'http://xmall.exrick.cn/#/goods?cid=1184', 'https://resource.smartisan.com/resource/z/zhoubianshangpin1220858web.jpg', null, null, '2018-04-19 00:02:53', '2018-04-20 11:15:59');
INSERT INTO `tb_panel_content` VALUES ('41', '10', '0', '150642571432845', '1', '', 'https://resource.smartisan.com/resource/2f9a0f5f3dedf0ed813622003f1b287b.jpg', null, null, '2018-04-19 00:02:56', '2018-04-20 00:24:36');
INSERT INTO `tb_panel_content` VALUES ('42', '10', '0', '150642571432836', '2', '', 'https://resource.smartisan.com/resource/2b05dbca9f5a4d0c1270123f42fb834c.jpg', null, null, '2018-04-19 00:03:00', '2018-04-20 00:25:01');
INSERT INTO `tb_panel_content` VALUES ('43', '10', '0', '150642571432846', '3', '', 'https://resource.smartisan.com/resource/804edf579887b3e1fae4e20a379be5b5.png', null, null, '2018-04-19 00:03:04', '2018-04-20 00:25:17');
INSERT INTO `tb_panel_content` VALUES ('44', '10', '0', '150642571432848', '4', '', 'https://resource.smartisan.com/resource/a1c53b5f12dd7ef790cadec0eaeaf466.jpg', null, null, '2018-04-19 00:03:10', '2018-04-20 10:55:52');
INSERT INTO `tb_panel_content` VALUES ('45', '10', '0', '150642571432847', '5', '', 'https://resource.smartisan.com/resource/daa975651d6d700c0f886718c520ee19.jpg', null, null, '2018-04-19 00:03:15', '2018-04-20 10:54:56');
INSERT INTO `tb_panel_content` VALUES ('46', '10', '0', '150642571432849', '6', '', 'https://resource.smartisan.com/resource/3973d009d182d8023bea6250b9a3959e.jpg', null, null, '2018-04-19 00:03:20', '2018-04-20 10:55:03');
INSERT INTO `tb_panel_content` VALUES ('47', '6', '0', '150635087972564', '1', '', 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', null, null, '2018-04-19 11:15:35', '2018-04-19 11:15:35');
INSERT INTO `tb_panel_content` VALUES ('48', '6', '0', '150642571432835', '2', null, 'http://ow2h3ee9w.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB', null, null, '2018-04-19 11:18:16', '2018-04-19 11:18:18');
INSERT INTO `tb_panel_content` VALUES ('49', '4', '0', '150635087972564', '1', null, 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', null, null, '2018-04-19 11:20:15', '2018-04-19 11:20:17');
INSERT INTO `tb_panel_content` VALUES ('50', '4', '0', '150642571432835', '2', null, 'http://ow2h3ee9w.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB', null, null, '2018-04-19 11:20:19', '2018-04-19 11:20:21');
INSERT INTO `tb_panel_content` VALUES ('51', '7', '0', '150635087972564', '5', '', 'http://ow2h3ee9w.bkt.clouddn.com/417pcchunrihaolishouji.png', null, null, '2018-04-19 15:09:40', '2018-04-19 21:16:04');
INSERT INTO `tb_panel_content` VALUES ('55', '0', '1', null, '1', 'http://xmall.exrick.cn/#/goods?cid=1184', '品牌周边', null, null, '2018-07-27 20:48:21', '2018-07-27 22:32:51');
INSERT INTO `tb_panel_content` VALUES ('58', '0', '1', null, '2', 'http://xmall.exrick.cn/#/thanks', '捐赠名单', null, null, '2018-07-27 20:50:07', '2018-07-27 22:25:18');
INSERT INTO `tb_panel_content` VALUES ('59', '0', '0', null, '3', 'http://xmadmin.exrick.cn', '后台管理系统', null, null, '2018-07-27 22:25:44', '2018-07-27 22:26:54');
INSERT INTO `tb_panel_content` VALUES ('60', '0', '0', null, '4', 'http://xpay.exrick.cn', 'XPay支付系统', null, null, '2018-07-27 22:26:03', '2018-07-27 22:26:50');
INSERT INTO `tb_panel_content` VALUES ('61', '0', '0', null, '5', 'https://github.com/Exrick/x-boot', 'XBoot框架', null, null, '2018-07-27 22:26:21', '2018-07-27 22:26:47');
INSERT INTO `tb_panel_content` VALUES ('62', '0', '0', null, '6', 'https://www.bilibili.com/video/av23121122/', '宣传视频', null, null, '2018-07-27 22:26:44', '2018-07-27 22:26:44');
INSERT INTO `tb_panel_content` VALUES ('63', '0', '0', null, '7', 'https://github.com/Exrick/xmall', 'Github', null, null, '2018-07-27 22:27:22', '2018-07-27 22:27:26');

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES ('17', '添加栏目内容', '/content/add');
INSERT INTO `tb_permission` VALUES ('18', '删除栏目内容', '/content/del/*');
INSERT INTO `tb_permission` VALUES ('19', '编辑栏目内容', '/content/update');
INSERT INTO `tb_permission` VALUES ('20', 'webupload图片上传', '/image/imageUpload');
INSERT INTO `tb_permission` VALUES ('21', 'kindeditor图片上传', '/kindeditor/imageUpload');
INSERT INTO `tb_permission` VALUES ('23', '商品分类编辑', '/item/cat/update');
INSERT INTO `tb_permission` VALUES ('24', '商品分类添加', '/item/cat/add');
INSERT INTO `tb_permission` VALUES ('25', '商品分类删除', '/item/cat/del/*');
INSERT INTO `tb_permission` VALUES ('27', '商品添加', '/item/add');
INSERT INTO `tb_permission` VALUES ('28', '商品删除', '/item/del/*');
INSERT INTO `tb_permission` VALUES ('29', '启用商品', '/item/start/*');
INSERT INTO `tb_permission` VALUES ('30', '停用商品', '/item/stop/*');
INSERT INTO `tb_permission` VALUES ('31', '编辑商品', '/item/update/*');
INSERT INTO `tb_permission` VALUES ('33', '会员添加', '/member/add');
INSERT INTO `tb_permission` VALUES ('34', '修改会员密码', '/member/changePass/*');
INSERT INTO `tb_permission` VALUES ('35', '会员删除', '/member/del/*');
INSERT INTO `tb_permission` VALUES ('36', '会员移除', '/member/remove/*');
INSERT INTO `tb_permission` VALUES ('37', '会员启用', '/member/start/*');
INSERT INTO `tb_permission` VALUES ('38', '会员停用', '/member/stop/*');
INSERT INTO `tb_permission` VALUES ('39', '会员编辑', '/member/update/*');
INSERT INTO `tb_permission` VALUES ('40', '权限添加', '/user/addPermission');
INSERT INTO `tb_permission` VALUES ('41', '角色添加', '/user/addRole');
INSERT INTO `tb_permission` VALUES ('42', '用户添加', '/user/addUser');
INSERT INTO `tb_permission` VALUES ('43', '修改用户密码', '/user/changePass');
INSERT INTO `tb_permission` VALUES ('44', '删除权限', '/user/delPermission/*');
INSERT INTO `tb_permission` VALUES ('45', '删除角色', '/user/delRole/*');
INSERT INTO `tb_permission` VALUES ('46', '删除用户', '/user/delUser/*');
INSERT INTO `tb_permission` VALUES ('47', '用户启用', '/user/start/*');
INSERT INTO `tb_permission` VALUES ('48', '用户停用', '/user/stop/*');
INSERT INTO `tb_permission` VALUES ('49', '编辑权限', '/user/updatePermission');
INSERT INTO `tb_permission` VALUES ('50', '编辑角色', '/user/updateRole');
INSERT INTO `tb_permission` VALUES ('51', '编辑用户', '/user/updateUser');
INSERT INTO `tb_permission` VALUES ('52', '编辑系统基本配置', '/sys/base/update');
INSERT INTO `tb_permission` VALUES ('53', '删除系统日志', '/sys/log/del/*');
INSERT INTO `tb_permission` VALUES ('54', '添加shiro配置', '/sys/shiro/add');
INSERT INTO `tb_permission` VALUES ('55', '删除shiro配置', '/sys/shiro/del/*');
INSERT INTO `tb_permission` VALUES ('56', '编辑shiro配置', '/sys/shiro/update');
INSERT INTO `tb_permission` VALUES ('57', '删除订单', '/order/del/*');
INSERT INTO `tb_permission` VALUES ('58', '添加捐赠', '/thanks/add');
INSERT INTO `tb_permission` VALUES ('59', '删除捐赠', '/thanks/del/*');
INSERT INTO `tb_permission` VALUES ('60', '编辑捐赠', '/thanks/update');
INSERT INTO `tb_permission` VALUES ('61', '添加板块', '/panel/add');
INSERT INTO `tb_permission` VALUES ('62', '删除版块', '/panel/del/*');
INSERT INTO `tb_permission` VALUES ('63', '更新板块', '/panel/update');
INSERT INTO `tb_permission` VALUES ('64', '更新首页缓存', '/redis/index/update');
INSERT INTO `tb_permission` VALUES ('65', '更新推荐板块缓存', '/redis/recommend/update');
INSERT INTO `tb_permission` VALUES ('66', '更新捐赠板块缓存', '/redis/thank/update');
INSERT INTO `tb_permission` VALUES ('67', '同步索引', '/item/importIndex');
INSERT INTO `tb_permission` VALUES ('69', '订单备注', '/order/remark');
INSERT INTO `tb_permission` VALUES ('70', '订单发货', '/order/deliver');
INSERT INTO `tb_permission` VALUES ('71', '取消订单', '/order/cancel/*');
INSERT INTO `tb_permission` VALUES ('72', '快递添加', '/express/add');
INSERT INTO `tb_permission` VALUES ('73', '快递编辑', '/express/update');
INSERT INTO `tb_permission` VALUES ('74', '快递删除', '/express/del/*');
INSERT INTO `tb_permission` VALUES ('75', '词典添加', '/dict/add');
INSERT INTO `tb_permission` VALUES ('76', '词典编辑', '/dict/update');
INSERT INTO `tb_permission` VALUES ('77', '词典删除', '/dict/del/*');
INSERT INTO `tb_permission` VALUES ('78', '捐赠管理页面', '/thanks-list');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('0', '游客', '只是个过客');
INSERT INTO `tb_role` VALUES ('1', '超级管理员', '拥有至高无上的权力');

-- ----------------------------
-- Table structure for tb_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_perm`;
CREATE TABLE `tb_role_perm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_perm
-- ----------------------------
INSERT INTO `tb_role_perm` VALUES ('246', '1', '17');
INSERT INTO `tb_role_perm` VALUES ('247', '1', '18');
INSERT INTO `tb_role_perm` VALUES ('248', '1', '19');
INSERT INTO `tb_role_perm` VALUES ('249', '1', '20');
INSERT INTO `tb_role_perm` VALUES ('250', '1', '21');
INSERT INTO `tb_role_perm` VALUES ('251', '1', '23');
INSERT INTO `tb_role_perm` VALUES ('252', '1', '24');
INSERT INTO `tb_role_perm` VALUES ('253', '1', '25');
INSERT INTO `tb_role_perm` VALUES ('254', '1', '27');
INSERT INTO `tb_role_perm` VALUES ('255', '1', '28');
INSERT INTO `tb_role_perm` VALUES ('256', '1', '29');
INSERT INTO `tb_role_perm` VALUES ('257', '1', '30');
INSERT INTO `tb_role_perm` VALUES ('258', '1', '31');
INSERT INTO `tb_role_perm` VALUES ('259', '1', '33');
INSERT INTO `tb_role_perm` VALUES ('260', '1', '34');
INSERT INTO `tb_role_perm` VALUES ('261', '1', '35');
INSERT INTO `tb_role_perm` VALUES ('262', '1', '36');
INSERT INTO `tb_role_perm` VALUES ('263', '1', '37');
INSERT INTO `tb_role_perm` VALUES ('264', '1', '38');
INSERT INTO `tb_role_perm` VALUES ('265', '1', '39');
INSERT INTO `tb_role_perm` VALUES ('266', '1', '40');
INSERT INTO `tb_role_perm` VALUES ('267', '1', '41');
INSERT INTO `tb_role_perm` VALUES ('268', '1', '42');
INSERT INTO `tb_role_perm` VALUES ('269', '1', '43');
INSERT INTO `tb_role_perm` VALUES ('270', '1', '44');
INSERT INTO `tb_role_perm` VALUES ('271', '1', '45');
INSERT INTO `tb_role_perm` VALUES ('272', '1', '46');
INSERT INTO `tb_role_perm` VALUES ('273', '1', '47');
INSERT INTO `tb_role_perm` VALUES ('274', '1', '48');
INSERT INTO `tb_role_perm` VALUES ('275', '1', '49');
INSERT INTO `tb_role_perm` VALUES ('276', '1', '50');
INSERT INTO `tb_role_perm` VALUES ('277', '1', '51');
INSERT INTO `tb_role_perm` VALUES ('278', '1', '52');
INSERT INTO `tb_role_perm` VALUES ('279', '1', '53');
INSERT INTO `tb_role_perm` VALUES ('280', '1', '54');
INSERT INTO `tb_role_perm` VALUES ('281', '1', '55');
INSERT INTO `tb_role_perm` VALUES ('282', '1', '56');
INSERT INTO `tb_role_perm` VALUES ('283', '1', '57');
INSERT INTO `tb_role_perm` VALUES ('284', '1', '58');
INSERT INTO `tb_role_perm` VALUES ('285', '1', '59');
INSERT INTO `tb_role_perm` VALUES ('286', '1', '60');
INSERT INTO `tb_role_perm` VALUES ('287', '1', '61');
INSERT INTO `tb_role_perm` VALUES ('288', '1', '62');
INSERT INTO `tb_role_perm` VALUES ('289', '1', '63');
INSERT INTO `tb_role_perm` VALUES ('290', '1', '64');
INSERT INTO `tb_role_perm` VALUES ('291', '1', '65');
INSERT INTO `tb_role_perm` VALUES ('292', '1', '66');
INSERT INTO `tb_role_perm` VALUES ('293', '1', '67');
INSERT INTO `tb_role_perm` VALUES ('294', '1', '69');
INSERT INTO `tb_role_perm` VALUES ('295', '1', '70');
INSERT INTO `tb_role_perm` VALUES ('296', '1', '71');
INSERT INTO `tb_role_perm` VALUES ('297', '1', '72');
INSERT INTO `tb_role_perm` VALUES ('298', '1', '73');
INSERT INTO `tb_role_perm` VALUES ('299', '1', '74');
INSERT INTO `tb_role_perm` VALUES ('300', '1', '75');
INSERT INTO `tb_role_perm` VALUES ('301', '1', '76');
INSERT INTO `tb_role_perm` VALUES ('302', '1', '77');
INSERT INTO `tb_role_perm` VALUES ('303', '1', '78');

-- ----------------------------
-- Table structure for tb_shiro_filter
-- ----------------------------
DROP TABLE IF EXISTS `tb_shiro_filter`;
CREATE TABLE `tb_shiro_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `perms` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shiro_filter
-- ----------------------------
INSERT INTO `tb_shiro_filter` VALUES ('1', '/login', 'anon', '1');
INSERT INTO `tb_shiro_filter` VALUES ('2', '/403', 'anon', '2');
INSERT INTO `tb_shiro_filter` VALUES ('3', '/', 'authc', '3');
INSERT INTO `tb_shiro_filter` VALUES ('7', '/index', 'authc', '4');
INSERT INTO `tb_shiro_filter` VALUES ('8', '/welcome', 'authc', '5');
INSERT INTO `tb_shiro_filter` VALUES ('9', '/thanks-pic', 'authc', '6');
INSERT INTO `tb_shiro_filter` VALUES ('10', '/lock-screen', 'authc', '7');
INSERT INTO `tb_shiro_filter` VALUES ('11', '/user/logout', 'authc', '8');
INSERT INTO `tb_shiro_filter` VALUES ('12', '/user/userInfo', 'authc', '9');
INSERT INTO `tb_shiro_filter` VALUES ('17', '/content/cat/add', 'perms[/content/cat/add]', '10');
INSERT INTO `tb_shiro_filter` VALUES ('18', '/content/cat/del/*', 'perms[/content/cat/del/*]', '11');
INSERT INTO `tb_shiro_filter` VALUES ('19', '/content/cat/update', 'perms[/content/cat/update]', '12');
INSERT INTO `tb_shiro_filter` VALUES ('21', '/content/add', 'perms[/content/add]', '13');
INSERT INTO `tb_shiro_filter` VALUES ('22', '/content/del/*', 'perms[/content/del/*]', '14');
INSERT INTO `tb_shiro_filter` VALUES ('23', '/content/update', 'perms[/content/update]', '15');
INSERT INTO `tb_shiro_filter` VALUES ('24', '/image/imageUpload', 'perms[/image/imageUpload]', '16');
INSERT INTO `tb_shiro_filter` VALUES ('25', '/image/update', 'perms[/image/update]', '18');
INSERT INTO `tb_shiro_filter` VALUES ('26', '/kindeditor/imageUpload', 'perms[/kindeditor/imageUpload]', '17');
INSERT INTO `tb_shiro_filter` VALUES ('27', '/item/cat/add', 'perms[/item/cat/add]', '19');
INSERT INTO `tb_shiro_filter` VALUES ('28', '/item/cat/del/*', 'perms[/item/cat/del/*]', '20');
INSERT INTO `tb_shiro_filter` VALUES ('29', '/item/cat/update', 'perms[/item/cat/update]', '21');
INSERT INTO `tb_shiro_filter` VALUES ('30', '/item/add', 'perms[/item/add]', '22');
INSERT INTO `tb_shiro_filter` VALUES ('31', '/item/del/*', 'perms[/item/del/*]', '23');
INSERT INTO `tb_shiro_filter` VALUES ('32', '/item/start/*', 'perms[/item/start/*]', '24');
INSERT INTO `tb_shiro_filter` VALUES ('33', '/item/stop/*', 'perms[/item/stop/*]', '25');
INSERT INTO `tb_shiro_filter` VALUES ('34', '/item/update/*', 'perms[/item/update/*]', '26');
INSERT INTO `tb_shiro_filter` VALUES ('36', '/member/add', 'perms[/member/add]', '28');
INSERT INTO `tb_shiro_filter` VALUES ('37', '/member/changePass/*', 'perms[/member/changePass/*]', '29');
INSERT INTO `tb_shiro_filter` VALUES ('38', '/member/del/*', 'perms[/member/del/*]', '30');
INSERT INTO `tb_shiro_filter` VALUES ('39', '/member/remove/*', 'perms[/member/remove/*]', '31');
INSERT INTO `tb_shiro_filter` VALUES ('40', '/member/start/*', 'perms[/member/start/*]', '32');
INSERT INTO `tb_shiro_filter` VALUES ('41', '/member/stop/*', 'perms[/member/stop/*]', '33');
INSERT INTO `tb_shiro_filter` VALUES ('42', '/member/update/*', 'perms[/member/update/*]', '34');
INSERT INTO `tb_shiro_filter` VALUES ('43', '/user/addPermission', 'perms[/user/addPermission]', '35');
INSERT INTO `tb_shiro_filter` VALUES ('44', '/user/addRole', 'perms[/user/addRole]', '36');
INSERT INTO `tb_shiro_filter` VALUES ('45', '/user/addUser', 'perms[/user/addUser]', '37');
INSERT INTO `tb_shiro_filter` VALUES ('46', '/user/changePass', 'perms[/user/changePass]', '38');
INSERT INTO `tb_shiro_filter` VALUES ('47', '/user/delPermission/*', 'perms[/user/delPermission/*]', '39');
INSERT INTO `tb_shiro_filter` VALUES ('48', '/user/delRole/*', 'perms[/user/delRole/*]', '40');
INSERT INTO `tb_shiro_filter` VALUES ('49', '/user/delUser/*', 'perms[/user/delUser/*]', '41');
INSERT INTO `tb_shiro_filter` VALUES ('50', '/user/start/*', 'perms[/user/start/*]', '42');
INSERT INTO `tb_shiro_filter` VALUES ('51', '/user/stop/*', 'perms[/user/stop/*]', '43');
INSERT INTO `tb_shiro_filter` VALUES ('52', '/user/updatePermission', 'perms[/user/updatePermission]', '44');
INSERT INTO `tb_shiro_filter` VALUES ('53', '/user/updateRole', 'perms[/user/updateRole]', '45');
INSERT INTO `tb_shiro_filter` VALUES ('54', '/user/updateUser', 'perms[/user/updateUser]', '46');
INSERT INTO `tb_shiro_filter` VALUES ('55', '/sys/base/update', 'perms[/sys/base/update]', '47');
INSERT INTO `tb_shiro_filter` VALUES ('56', '/sys/log/del/*', 'perms[/sys/log/del/*]', '48');
INSERT INTO `tb_shiro_filter` VALUES ('57', '/sys/shiro/add', 'perms[/sys/shiro/add]', '49');
INSERT INTO `tb_shiro_filter` VALUES ('58', '/sys/shiro/del/*', 'perms[/sys/shiro/del/*]', '50');
INSERT INTO `tb_shiro_filter` VALUES ('59', '/sys/shiro/update', 'perms[/sys/shiro/update]', '51');
INSERT INTO `tb_shiro_filter` VALUES ('60', '/order/del/*', 'perms[/order/del/*]', '52');
INSERT INTO `tb_shiro_filter` VALUES ('61', '/thanks/add', 'perms[/thanks/add]', '53');
INSERT INTO `tb_shiro_filter` VALUES ('62', '/thanks/del/*', 'perms[/thanks/del/*]', '54');
INSERT INTO `tb_shiro_filter` VALUES ('63', '/thanks/update', 'perms[/thanks/update]', '55');
INSERT INTO `tb_shiro_filter` VALUES ('66', '/*', 'authc', '9');
INSERT INTO `tb_shiro_filter` VALUES ('67', '/geetestInit', 'anon', '3');
INSERT INTO `tb_shiro_filter` VALUES ('68', '/pay-edit', 'anon', '3');
INSERT INTO `tb_shiro_filter` VALUES ('69', '/panel/add', 'perms[/panel/add]', '56');
INSERT INTO `tb_shiro_filter` VALUES ('70', '/panel/del/*', 'perms[/panel/del/*]', '57');
INSERT INTO `tb_shiro_filter` VALUES ('71', '/panel/update', 'perms[/panel/update]', '58');
INSERT INTO `tb_shiro_filter` VALUES ('72', '/redis/index/update', 'perms[/redis/index/update]', '59');
INSERT INTO `tb_shiro_filter` VALUES ('73', '/redis/recommend/update', 'perms[/redis/recommend/update]', '60');
INSERT INTO `tb_shiro_filter` VALUES ('74', '/redis/thank/update', 'perms[/redis/thank/update]', '61');
INSERT INTO `tb_shiro_filter` VALUES ('75', '/item/importIndex', 'perms[/item/importIndex]', '62');
INSERT INTO `tb_shiro_filter` VALUES ('76', '/order/remark', 'perms[/order/remark]', '63');
INSERT INTO `tb_shiro_filter` VALUES ('77', '/order/deliver', 'perms[/order/deliver]', '64');
INSERT INTO `tb_shiro_filter` VALUES ('78', '/order/cancel/*', 'perms[/order/cancel/*]', '65');
INSERT INTO `tb_shiro_filter` VALUES ('79', '/express/add', 'perms[/express/add]', '66');
INSERT INTO `tb_shiro_filter` VALUES ('80', '/express/update', 'perms[/express/update]', '67');
INSERT INTO `tb_shiro_filter` VALUES ('81', '/express/del/*', 'perms[/express/del/*]', '68');
INSERT INTO `tb_shiro_filter` VALUES ('82', '/dict/add', 'perms[/dict/add]', '69');
INSERT INTO `tb_shiro_filter` VALUES ('83', '/dict/update', 'perms[/dict/update]', '70');
INSERT INTO `tb_shiro_filter` VALUES ('84', '/dict/del/*', 'perms[/dict/del/*]', '71');
INSERT INTO `tb_shiro_filter` VALUES ('85', '/thanks-list', 'perms[/thanks-list]', '72');

-- ----------------------------
-- Table structure for tb_thanks
-- ----------------------------
DROP TABLE IF EXISTS `tb_thanks`;
CREATE TABLE `tb_thanks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '通知邮箱',
  `state` int(11) DEFAULT '0' COMMENT '状态 0待审核 1确认显示  2驳回 3通过不展示',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '支付方式',
  `order_id` varchar(255) DEFAULT NULL COMMENT '关联订单id',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_thanks
-- ----------------------------
INSERT INTO `tb_thanks` VALUES ('6', '小黄鱼', '18782059038@163.com', '1.00', '无', null, '1', 'Alipay', null, '2018-03-30 19:03:07');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码 md5加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `sex` varchar(2) DEFAULT '',
  `address` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT '0',
  `file` varchar(255) DEFAULT NULL COMMENT '头像',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '17621230884', '1012139570@qq.com', '男', null, '1', '超级管理员', '1', 'http://ow2h3ee9w.bkt.clouddn.com/1507866340369.png', '2017-09-05 21:27:54', '2017-10-18 22:57:08');
INSERT INTO `tb_user` VALUES ('2', 'test', '098f6bcd4621d373cade4e832627b4f6', '12345678901', '123@qq.com', '女', null, '1', '游客', '0', null, '2017-09-05 21:27:54', '2018-04-18 14:35:19');
