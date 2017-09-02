## XMall
### 基于SOA架构的SSM分布式购物商城
- 后台管理系统：管理商品、订单、类目、商品规格属性、用户管理以及内容发布等功能。
- 前台系统：用户可以在前台系统中进行注册、登录、浏览商品、首页、下单等操作。
- 会员系统：用户可以在该系统中查询已下的订单、收藏的商品、我的优惠券、团购等信息。
- 订单系统：提供下单、查询订单、修改订单状态、定时处理订单。
- 搜索系统：提供商品的搜索功能。
- 单点登录系统：为多个系统之间提供用户登录凭证以及查询登录用户的信息。

![](http://otabkoy17.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170901155605.png)

### 前端所用技术

- 后台页面
    - 感谢[H-ui](http://www.h-ui.net/)提供静态页面支持
    - [Ztree](http://www.treejs.cn/v3/main.php#_zTreeInfo)：jQuery树插件
    - [DataTables](http://www.datatables.club/)：jQuery表格插件
    - [Layer](http://layer.layui.com/)：web弹层组件
    - [Distpicker](https://github.com/fengyuanchen/distpicker)：中国省市区地址三级联动插件
- 前台页面

### 后端所用技术

- Spring
- [SpringMVC](https://github.com/Exrick/xmall/blob/master/study/SpringMVC.md)
- MyBatis
- [Dubbo](https://github.com/Exrick/xmall/blob/master/study/Dubbo.md)
- [ZooKeeper](https://github.com/Exrick/xmall/blob/master/study/Zookeeper.md)
- MySQL
- Redis：缓存
- [Swagger](https://github.com/Exrick/xmall/blob/master/study/Swagger.md)
- Docker
- [Nginx](https://github.com/Exrick/xmall/blob/master/study/Nginx.md)
- Tomcat
- Maven
- JRebel：开发热部署
- 第三方SDK：[七牛云图片存储服务器](https://developer.qiniu.com/kodo/sdk/1239/java)

### dependency文件夹提供部分安装文件与sql文件
- sql文件
- dubbo.xsd 需手动配置避免报错
- zookeeper 
- nginx

### 本地开发运行部署
- 下载git或zip直接解压，git安装后执行克隆命令 `git clone https://github.com/Exrick/xmall.git`
- 使用IDEA([破解/免费注册](http://idea.lanyus.com/)) `File-Open` 直接打开xmall项目点击右下角 `Import Changes` 等待安装完依赖即可
- Maven安装和IDEA配置

    ![](http://otabkoy17.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170901140327.png)
- MySQL数据库新建xmall数据库，运行sql文件，注意在 `xmall-manager-service/resources/conf/db.properties` 中修改你的数据库连接配置
- 按照以下顺序分别在每个模块文件夹根目录执行 `mvn install` 命令: xmall-parent、xmall-common、xmall-manager、xmall-manager-web
- 项目使用Tomcat插件, 需运行 `xmall-manager` 和 `xmall-manager-web` 两个服务，执行命令 `mvn tomcat7:run` 或在IDEA中使用插件(`View - Tool Buttons - 右侧菜单Maven Projects - tomcat7 - tomcat7:run`)运行即可
- 访问 http://localhost:8888

