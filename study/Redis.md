# Redis的安装及集群配置
[官方下载地址](https://redis.io/)
### Redis的安装

Redis是c语言开发的，安装需要c语言的编译环境,如果没有gcc需要在线安装: `yum install gcc-c++`

安装步骤：
- 第一步：Redis的源码包上传到Linux
- 第二步：解压缩: `tar -xvf redis-2.6.16.tar.gz -C /usr/local `
- 第三步：编译 进入redis源码目录: `make` 
- 第四步：安装: `make install PREFIX=/usr/local/redis`

    PREFIX参数指定redis的安装目录,一般软件安装到/usr目录下
### Redis的启动：
- 前端启动：在redis的安装目录下直接启动redis-server
`[root@localhost bin]# ./redis-server`

- 后台启动：

```
把 /root/redis-3.0.0/redis.conf 复制到 /usr/local/redis/bin 目录下 cp redis.conf /usr/local/redis/bin/
修改 redis.conf 文件 设置 daemonize yes
启动时添加配置文件 ./redis-server redis.conf
```
- 关闭：`[root@localhost bin]# ./redis-cli shutdown`

### Redis-cli连接
- 默认连接localhost运行在6379端口的redis服务
`[root@localhost bin]# ./redis-cli`
- 自定义连接端口
`[root@localhost bin]# ./redis-cli -h 192.168.25.153 -p 6379`

    -h：连接的服务器的地址
    -p：服务的端口号
- 远程连接：注释掉 `redis.conf` 中 `bind 127.0.0.1` 设置 `protected-mode no` 重启redis

### Redis-cluster集群搭建
由于容错机制，Redis集群中至少应该有三个节点。要保证集群的高可用，需要每个节点有一个备份机，因此，Redis集群至少需要6台服务器。

![](http://oweupqzdv.bkt.clouddn.com/redis-cluster%E5%AE%B9%E9%94%99.jpg)

由于个人只有一台服务器，只有搭建伪分布式：一台服务器运行6个redis实例，需要修改Redis的端口号7001-7006

- 集群搭建环境

1. 使用Ruby脚本搭建集群,需要Ruby的运行环境,安装Ruby

    `yum install ruby`

    `yum install rubygems`

2. 安装Ruby脚本运行使用的包

    上传所需Ruby库文件redis-3.0.0.gem 安装执行： `[root@localhost ~]# gem install redis-3.0.0.gem`

3. 进入 `redis-3.0.0/src` 会找到`redis-trib.rb`文件，为了方便可将其拷贝至下一步创建的 `redis-cluster` 文件夹中

- 搭建Redis集群

1. 拷贝创建6个Redis实例，方便管理将刚复制的6个Redis拷贝至创建 `redis-cluster` 文件夹，每个实例运行在不同的端口。需要修改redis.conf配置文件：把 `cluster-enabled yes` 前的注释去掉，并且分别修改端口 `port 7001~7006`

2. 创建开启集群的脚本：
```
[root@localhost redis-cluster]# vim start-all.sh
cd redis01
./redis-server redis.conf
cd ..
cd redis02
./redis-server redis.conf
cd ..
cd redis03
./redis-server redis.conf
cd ..
cd redis04
./redis-server redis.conf
cd ..
cd redis05
./redis-server redis.conf
cd ..
cd redis06
./redis-server redis.conf
cd ..
//修改脚本文件可执行权限
[root@localhost redis-cluster]# chmod u+x start-all.sh
```
3. 执行脚本启动每个redis实例
4. 使用ruby脚本搭建集群

    `./redis-trib.rb create --replicas 1 123.207.121.135:7001 123.207.121.135:7002 123.207.121.135:7003 123.207.121.135:7004 123.207.121.135:7005 123.207.121.135:7006`

5. 连接集群

    `[root@localhost redis-cluster]# redis01/redis-cli -p 7002 -c`
6. 关闭集群
    杀进程：`ps -aux|grep redis` `kill -9 进程ID`

### 踩坑解决问题
- 重启服务器后重新启动ruby脚本报错
```
[ERR] Node 123.207.121.135:7001 is not empty. Either the node already knows other nodes (check with CLUSTER NODES) or contains some key in database 0.
```

由于非正常关闭集群，需删除每个节点中的数据文件aof、rdb、nodes.conf，实在不行就只有重装一遍...
- 强制停止redis快照导致，redis运行用户没有权限写rdb文件或者磁盘空间满了
```
MISCONF Redis is configured to save RDB snapshots, but is currently not able to persist on disk. Commands that may modify the data set are disabled. Please check Redis logs for details about the error.
```
解决办法：修改配置文件 stop-writes-on-bgsave-error no







