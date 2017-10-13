# XMall
### 基于SOA架构的分布式购物电商商城
- [x] 后台管理系统：管理商品、订单、类目、商品规格属性、用户管理以及内容发布等功能 //TODO：权限管理
- [x] 前台系统：用户可以在前台系统中进行注册、登录、浏览商品、首页、下单等操作
- [x] 会员系统：用户可以在该系统中查询已下的订单、管理订单、我的优惠券等信息
- [x] 订单系统：提供下单、查询订单、修改订单状态、定时处理订单
- [x] 搜索系统：提供商品的搜索功能
- [x] 单点登录系统：为多个系统之间提供用户登录凭证以及查询登录用户的信息

![](http://ow2h3ee9w.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20171013230914.png)

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170923225945.png)

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170923225916.png)

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170915134720.png)

### 前台页面为基于Vue的独立项目 请跳转至 [xmall-front](https://github.com/Exrick/xmall-front) 项目仓库查看

### 前端所用技术

- 后台页面
    - 感谢 [H-ui](http://www.h-ui.net/) 提供静态页面支持
    - [Ztree](http://www.treejs.cn/v3/main.php#_zTreeInfo)：jQuery树插件
    - [DataTables](http://www.datatables.club/)：jQuery表格插件
    - [Layer](http://layer.layui.com/)：web弹层组件
    - [Distpicker](https://github.com/fengyuanchen/distpicker)：中国省市区地址三级联动插件
    - [KindEditor](https://github.com/kindsoft/kindeditor)：富文本编辑器 简洁方便 没UEditor那么多坑
    - [WebUploader](http://fex.baidu.com/webuploader/getting-started.html)：百度文件上传插件
    - [HighCharts](http://www.hcharts.cn/)：图表库
- 前台页面
    - 详情请跳转至 [xmall-front](https://github.com/Exrick/xmall-front) 项目仓库
    - 感谢 [yucccc](https://github.com/yucccc) 的开源 [vue-mall](https://github.com/yucccc/vue-mall) 项目提供前端页面及框架支持
    - Vue2 + Vuex + Vue Router + Element UI + ES6 + webpack + axios + Node.js
    

### 后端所用技术

- Spring
- SpringBoot(待重构)
- [SpringMVC](https://github.com/Exrick/xmall/blob/master/study/SpringMVC.md)
- MyBatis
- [Dubbo](https://github.com/Exrick/xmall/blob/master/study/Dubbo.md)
- [ZooKeeper](https://github.com/Exrick/xmall/blob/master/study/Zookeeper.md)
- MySQL
- [Redis](https://github.com/Exrick/xmall/blob/master/study/Redis.md)：缓存
- [Elasticsearch](https://github.com/Exrick/xmall/blob/master/study/Elasticsearch.md)：基于Lucene分布式搜索引擎
- [ActiveMQ](https://github.com/Exrick/xmall/blob/master/study/ActiveMQ.md)：消息队列
- [Druid](http://druid.io/)：阿里高性能数据库连接池
- Shiro：安全框架
- Quartz：任务调度框架
- [Swagger2](https://github.com/Exrick/xmall/blob/master/study/Swagger2.md)
- Docker
- [Nginx](https://github.com/Exrick/xmall/blob/master/study/Nginx.md)
- Tomcat
- [Maven](https://github.com/Exrick/xmall/blob/master/study/Maven.md)
- 第三方SDK
    - [七牛云文件存储服务](https://developer.qiniu.com/kodo/sdk/1239/java)
- 第三方插件
    - [搜狐畅言评论插件](http://changyan.kuaizhan.com/)
- 其它开发工具
    - [JRebel](https://github.com/Exrick/xmall/blob/master/study/JRebel.md)：开发热部署

### dependency文件夹提供部分依赖与sql文件
- xmall.sql：数据库文件
- dubbo.xsd：需手动配置避免报错
- redis-3.0.0.gem：Redis集群搭建所需Ruby库

### 本地开发运行部署
- 依赖：[ZooKeeper](https://github.com/Exrick/xmall/blob/master/study/Zookeeper.md)、[Redis](https://github.com/Exrick/xmall/blob/master/study/Redis.md)、[ActiveMQ](https://github.com/Exrick/xmall/blob/master/study/ActiveMQ.md)、[Elasticsearch](https://github.com/Exrick/xmall/blob/master/study/Elasticsearch.md)
- 下载zip直接解压或安装git后执行克隆命令 `git clone https://github.com/Exrick/xmall.git`
- [Maven安装和在IDEA中配置](https://github.com/Exrick/xmall/blob/master/study/Maven.md)
- 使用IDEA([破解/免费注册](http://idea.lanyus.com/)) `File-Open` 直接打开xmall项目，点击右下角 `Import Changes` 等待安装完依赖即可
- MySQL数据库新建 `xmall` 数据库，运行sql文件，注意在 `xmall-manager-service/resources/conf/db.properties` 中修改你的数据库连接配置
- 按照依赖顺序分别在每个模块文件夹根目录执行 `mvn install` 命令
- 项目需按照依赖顺序运行除 `xmall-parent` `xmall-common` 以外其它所有服务，且都已配置好Tomcat插件, 执行命令 `mvn tomcat7:run` 或在IDEA中使用插件(`View - Tool Buttons - 右侧菜单Maven Projects - tomcat7 - tomcat7:run`)运行即可
- 后端管理系统端口8888 http://localhost:8888
- 前端项目接口端口6666

