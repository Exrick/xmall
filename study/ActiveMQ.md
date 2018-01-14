# ActiveMQ

[官方下载地址](http://activemq.apache.org/download.html)

### 安装启动
- 第一步：把ActiveMQ 的压缩包上传到Linux系统
- 第二步：解压缩
- 第三步：启动
```
使用bin目录下的activemq命令启动：
[root@localhost bin]# ./activemq start
关闭：
[root@localhost bin]# ./activemq stop
查看状态：
[root@localhost bin]# ./activemq status

进入管理后台：http://IP:8161/admin
用户名：admin
密码：admin
```

登录用户名密码可在 `conf/jetty-realm.properties` 文件中修改
