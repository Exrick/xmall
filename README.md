# XMall
[![AUR](https://img.shields.io/aur/license/yaourt.svg)](https://github.com/Exrick/xmall/blob/master/License)
[![](https://img.shields.io/badge/Author-Exrick-orange.svg)](http://blog.exrick.cn)
[![](https://img.shields.io/badge/version-1.0-brightgreen.svg)](https://github.com/Exrick/xmall)
[![GitHub stars](https://img.shields.io/github/stars/Exrick/xmall.svg?style=social&label=Stars)](https://github.com/Exrick/xmall)
[![GitHub forks](https://img.shields.io/github/forks/Exrick/xmall.svg?style=social&label=Fork)](https://github.com/Exrick/xmall)
### 项目已部署，在线Demo
- 前台商城：http://xmall.exrick.cn/
- 后台管理系统：http://xmadmin.exrick.cn/
- 第一次打开可能较慢，请耐心等待
- 此项目将作为作者2018本科毕业设计，单体系统版本(一台tomcat可运行)以及详细文档后续放出
### 前台页面为基于Vue的独立项目 请跳转至 [xmall-front](https://github.com/Exrick/xmall-front) 项目仓库查看
### 开发中，敬请期待！
- Spring Cloud版
- APP

    ![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171231170920.png)
- XMall开放平台(仿微信开放平台)

    ![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171231172014.png)
### 基于SOA架构的分布式购物电商商城
- [x] 后台管理系统：管理商品、订单、类目、商品规格属性、用户、权限、系统统计、系统日志以及前台内容等功能
- [x] 前台系统：用户可以在前台系统中进行注册、登录、浏览商品、首页、下单等操作
- [x] 会员系统：用户可以在该系统中查询已下的订单、管理订单、我的优惠券等信息
- [x] 订单系统：提供下单、查询订单、修改订单状态、定时处理订单
- [x] 搜索系统：提供商品的搜索功能
- [x] 单点登录系统：为多个系统之间提供用户登录凭证以及查询登录用户的信息

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171119130819.jpg "登录界面")

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171022174034.jpg "后台首页")

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171022224322.jpg "商品管理")

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171022225418.jpg "管理员编辑")

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171022183906.jpg "前台首页")

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171109215656.jpg "ES分词搜索")

### 前端所用技术
- 后台页面【新 待开发】
    - [ANT DESIGN PRO](https://pro.ant.design/index-cn)：蚂蚁金服开箱即用中台前端
    - React + dva + G2 + ANTD + ES2015+
- 后台页面【旧】
    - 感谢 [H-ui](http://www.h-ui.net/)、[FlatLab](https://github.com/Exrick/xmall/blob/master/study/FlatLab.md) 提供静态页面支持
    - [Ztree](http://www.treejs.cn/v3/main.php#_zTreeInfo)：jQuery树插件
    - [DataTables](http://www.datatables.club/)：jQuery表格插件
    - [Layer](http://layer.layui.com/)：web弹层组件
    - [Distpicker](https://github.com/fengyuanchen/distpicker)：中国省市区地址三级联动插件
    - [KindEditor](https://github.com/kindsoft/kindeditor)：富文本编辑器 简洁方便 没UEditor那么多坑
    - [WebUploader](http://fex.baidu.com/webuploader/getting-started.html)：百度文件上传插件
    - [HighCharts](http://www.hcharts.cn/)：图表库
    - [不蒜子](http://busuanzi.ibruce.info/)：极简网页计数器
- 前台页面
    - 详情请跳转至 [xmall-front](https://github.com/Exrick/xmall-front) 项目仓库
    - 感谢 [yucccc](https://github.com/yucccc) 的开源 [vue-mall](https://github.com/yucccc/vue-mall) 项目提供前端页面及框架支持
    - Vue2 + Vuex + Vue Router + Element UI + ES6 + webpack + axios + Node.js
    
### 后端所用技术
##### 各框架依赖版本皆使用目前最新版本 可进入xmall-parent中 [pom.xml](https://github.com/Exrick/xmall/blob/master/xmall-parent/pom.xml) 查看
- Spring
- [SpringMVC](https://github.com/Exrick/xmall/blob/master/study/SpringMVC.md)
- MyBatis
- [Dubbo](https://github.com/Exrick/xmall/blob/master/study/Dubbo.md)
- [ZooKeeper](https://github.com/Exrick/xmall/blob/master/study/Zookeeper.md)
- MySQL
- Mycat：数据库分库分表中间件
- [Redis](https://github.com/Exrick/xmall/blob/master/study/Redis.md)：缓存
- [Elasticsearch](https://github.com/Exrick/xmall/blob/master/study/Elasticsearch.md)：基于Lucene分布式搜索引擎
- [ActiveMQ](https://github.com/Exrick/xmall/blob/master/study/ActiveMQ.md)：消息队列
- [Druid](http://druid.io/)：阿里高性能数据库连接池
- Shiro：安全框架
- [Swagger2](https://github.com/Exrick/xmall/blob/master/study/Swagger2.md)：Api文档生成
- Docker
- [Nginx](https://github.com/Exrick/xmall/blob/master/study/Nginx.md)
- Tomcat
- [Maven](https://github.com/Exrick/xmall/blob/master/study/Maven.md)
- 第三方SDK
    - [七牛云文件存储服务](https://developer.qiniu.com/kodo/sdk/1239/java)
    - [极验Test-button人机验证码](http://www.geetest.com/Test-button.html)
- 第三方插件
    - [hotjar](https://github.com/Exrick/xmall/blob/master/study/hotjar.md)：一体化分析和反馈
    - [搜狐畅言评论插件](http://changyan.kuaizhan.com/)
- 第三方接口
    - [Mob全国天气预报接口](http://api.mob.com/#/apiwiki/weather)
- 其它开发工具
    - Jenkins：持续集成
    - [JRebel](https://github.com/Exrick/xmall/blob/master/study/JRebel.md)：开发热部署
    - [阿里JAVA开发规约插件](https://github.com/alibaba/p3c)

### 文件说明
- `dependency` 文件夹提供部分依赖与sql文件
    - xmall.sql：数据库文件
    - dubbo.xsd：需手动配置避免报错
    - redis-3.0.0.gem：Redis集群搭建所需Ruby库
- `generatorSqlmapCustom` 文件夹为 [Mybatis Generator](http://www.mybatis.org/generator/) 逆向生成工具，且已配置好maven插件
### 本地开发运行部署
- 下载zip直接解压或安装git后执行克隆命令 `git clone https://github.com/Exrick/xmall.git`
- 依赖安装：[ZooKeeper](https://github.com/Exrick/xmall/blob/master/study/Zookeeper.md)、[Redis](https://github.com/Exrick/xmall/blob/master/study/Redis.md)、[ActiveMQ](https://github.com/Exrick/xmall/blob/master/study/ActiveMQ.md)、[Elasticsearch](https://github.com/Exrick/xmall/blob/master/study/Elasticsearch.md)
- 修改各依赖相应IP配置(默认本地127.0.0.1)，以及七牛云、极验配置在 `xmall-common - utils` 中找到修改，同步索引在`xmall-manager-web\src\main\webapp\WEB-INF\jsp\refresh-index.jsp`两处ajax中修改Elsticsearch对应IP
- [Maven安装和在IDEA中配置](https://github.com/Exrick/xmall/blob/master/study/Maven.md)
- 使用IDEA([破解/免费注册](http://idea.lanyus.com/)) `File-Open` 直接打开xmall项目，点击右下角 `Import Changes` 等待安装完依赖即可
- MySQL数据库新建 `xmall` 数据库，运行sql文件，注意在 `xmall-manager-service/resources/conf/db.properties` 中修改你的数据库连接配置
- 按照依赖顺序分别在每个模块文件夹根目录执行 `mvn install` 命令
- 项目需按照依赖顺序运行除 `xmall-parent` `xmall-common` 以外其它所有服务，且都已配置好Tomcat插件, 执行命令 `mvn tomcat7:run` 或在IDEA中使用插件(`View - Tool Buttons - 右侧菜单Maven Projects - tomcat7 - tomcat7:run`)运行即可，当然可自行配置
- 后端管理系统默认端口8888 http://localhost:8888 管理员账密admin|123456
- 前端项目接口默认端口7777 前台页面请启动基于Vue的 [xmall-front](https://github.com/Exrick/xmall-front) 项目，并修改其接口配置
### 技术疑问交流
- 给作者项目Star或捐赠后可加入交流群 `475743731`，还可免费获取最新源码和 [UI框架](https://github.com/Exrick/xmall/blob/master/study/FlatLab.md) [![](http://pub.idqqimg.com/wpa/images/group.png)](http://shang.qq.com/wpa/qunwpa?idkey=7b60cec12ba93ebed7568b0a63f22e6e034c0d1df33125ac43ed753342ec6ce7)
- 作者博客：[http://blog.exrick.cn](http://blog.exrick.cn)
### 捐赠
![](http://oweupqzdv.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB.png)

