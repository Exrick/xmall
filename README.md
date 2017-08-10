## XMall
### 基于SOA架构的SSM分布式购物商城
- 后台管理系统：管理商品、订单、类目、商品规格属性、用户管理以及内容发布等功能。
- 前台系统：用户可以在前台系统中进行注册、登录、浏览商品、首页、下单等操作。
- 会员系统：用户可以在该系统中查询已下的订单、收藏的商品、我的优惠券、团购等信息。
- 订单系统：提供下单、查询订单、修改订单状态、定时处理订单。
- 搜索系统：提供商品的搜索功能。
- 单点登录系统：为多个系统之间提供用户登录凭证以及查询登录用户的信息。

![](http://otabkoy17.bkt.clouddn.com/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20170802225212.png)

### 前端所用技术

- 后台页面
    - 感谢HUI提供静态页面支持
    - Ztree：jQuery树插件
    - DataTables：jQuery表格插件
- 前台页面

### 后端所用技术

- Spring
- SpringMVC
- MyBatis
- Dubbo
- ZooKeeper
- [Nginx](https://github.com/Exrick/xmall/blob/master/study/Nginx.md)
- Tomcat

### dependency_files文件夹提供部分安装文件
- sql文件
- dubbo.xsd 需手动配置避免报错
- zookeeper 
- nginx


