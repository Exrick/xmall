# Elasticsearch

Elasticsearch是一个基于Apache Lucene(TM)的开源搜索引擎。无论在开源还是专有领域，Lucene可以被认为是迄今为止最先进、性能最好的、功能最全的搜索引擎库。
但是，Lucene只是一个库。想要使用它，你必须使用Java来作为开发语言并将其直接集成到你的应用中，更糟糕的是，Lucene非常复杂，你需要深入了解检索的相关知识来理解它是如何工作的。

Elasticsearch也使用Java开发并使用Lucene作为其核心来实现所有索引和搜索的功能，但是它的目的是通过简单的RESTful API来隐藏Lucene的复杂性，从而让全文搜索变得简单。
不过，Elasticsearch不仅仅是Lucene和全文搜索，我们还能这样去描述它：

- 分布式的实时文件存储，每个字段都被索引并可被搜索
- 分布式的实时分析搜索引擎
- 可以扩展到上百台服务器，处理PB级结构化或非结构化数据

[官方网址](https://www.elastic.co/cn/)

[官方Github](https://github.com/elastic/elasticsearch)

[官方中文权威指南](https://www.elastic.co/guide/cn/elasticsearch/guide/current/index.html)

[官方Java API文档](https://www.elastic.co/guide/en/elasticsearch/client/java-api/current/index.html)

### 推荐学习资源

- [Elasticsearch Java API 手册](https://es.quanke.name/)

- [Elasticsearch权威指南](http://www.learnes.net/index.html)

### 安装环境

- CentOS7
- 依赖 Java 8+

### 安装Elasticsearch

- [官方下载地址](https://www.elastic.co/downloads/elasticsearch)

- 解压安装包 `# tar zxvf elasticsearch-5.6.2.tar.gz`

- 运行elasticsearch脚本启动

    `# cd /elasticsearch-5.6.2/bin`

    `# ./elasticsearch`

    后台启动：`# ./elasticsearch -d`

### 踩坑解决错误

1. 内存不足

    `Java HotSpot(TM) 64-Bit Server VM warning: INFO: os::commit_memory(0x0000000085330000, 2060255232, 0) failed; error='Cannot allocate memory' (errno=12)`

- 因个人服务器只有1g内存，需配置 `elasticsearch/config/jvm.options`，只有根据服务器改小分配堆空间的最大值了([或者启用Swap交换分区](https://github.com/Exrick/xmall/blob/master/study/Linux.md))：

```
################################################################

# Xms represents the initial size of total heap space
# Xmx represents the maximum size of total heap space

-Xms128m
-Xmx128m

################################################################
```

2. root账号错误

    `[WARN ][o.e.b.ElasticsearchUncaughtExceptionHandler] [] uncaught exception in thread [main]
    org.elasticsearch.bootstrap.StartupException: java.lang.RuntimeException: can not run elasticsearch as root
    at org.elasticsearch.bootstrap.Elasticsearch.init(Elasticsearch.java:125) ~[elasticsearch-5.2.0.jar:5.2.0]
    at org.elasticsearch.bootstrap.Elasticsearch.execute(Elasticsearch.java:112) ~[elasticsearch-5.2.0.jar:5.2.0]
    at 
    ... 6 more`

    由于ElasticSearch可以接收用户输入的脚本并且执行，为了系统安全考虑，建议创建一个单独的用户用来运行ElasticSearch

- 创建elsearch用户组及elsearch用户

    `groupadd es`

    `useradd es -g es -p es`
- 更改Elasticsearch文件夹及内部文件的所属用户及组为es:es
    `chown -R es:es  /usr/local/elasticsearch`
- 切换到elsearch用户再启动

    `su es`

    `cd elasticsearch/bin`

    `./elasticsearch`

3. 最大虚拟内存过小错误

    `ERROR: bootstrap checks failed
    max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]`

 - 切换至root用户：`su root`
 - 修改虚拟内存配置至提示的最低值：`sysctl -w vm.max_map_count=262144`

4. 日志权限错误

- 进入 `elasticsearch/logs` 文件夹下修改文件权限：`chmod 744 *`

5. 外网无法访问 `http://你的服务器IP:9200/`

- 修改 `elasticsearch/config/elasticsearch.yml` 配置文件：network.host: 0.0.0.0

```
# ---------------------------------- Network -----------------------------------
#
# Set the bind address to a specific IP (IPv4 or IPv6):
#
network.host: 0.0.0.0
# Set a custom port for HTTP:
#
http.port: 9200
#
# For more information, consult the network module documentation.
#
# --------------------------------- Discovery ----------------------------------
```

### 测试成功

![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170928164116.png)

### 插件Elasticsearch-head安装

[Head-GitHub官网](https://github.com/mobz/elasticsearch-head)

- 依赖：Git Node.js
- 官网安装教程
```
git clone git://github.com/mobz/elasticsearch-head.git
cd elasticsearch-head
npm install
npm run start
```

- 打开浏览器输入：IP:9100

- 正常的话可以看到已经连接了ES，但是看不到连接信息，这时候需要在在 es 的 elasticsearch.yml 里添加如下配置：

    `http.cors.enabled: true`

    `http.cors.allow-origin: "*"`

### 插件Elasticsearch-Analysis-IK安装

[IK Analysis-GitHub官网](https://github.com/medcl/elasticsearch-analysis-ik)
[预编译安装包下载](https://github.com/medcl/elasticsearch-analysis-ik/releases)(请下载对应Elasticsearch版本的IK插件)
- 官网安装教程
```
解压预编译包 `elasticsearch-analysis-ik-{version}.zip` 后拷贝至elasticsearch安装目录plugins文件夹下重命名文件夹为ik `your-es-root/plugins/ik`
```

- 重启Elasticsearch即可（关闭ES：杀进程：`ps -aux|grep elasticsearch`、`kill -9 进程ID号`