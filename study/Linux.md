# Linux常用命令
- 查看内存使用情况：`free -h`

    -h：显示可用mb单位

- 修改文件权限：`chmod 777 *`

- 切换用户： `su root`

- 解压 tar包：`tar -xvf file.tar`
- 解压tar.gz：`tar -xzvf file.tar.gz`
- 解压tar.xz：`tar xvJf file.tar.xz`
- 解压rar：`unrar e file.rar`
- 解压zip：`unzip file.zip`

- 下载网络文件 `wget http://file.zip`

- 改变文件所有者 `chown [选项] [所有者]:[组] file`

    -R 处理指定目录以及其子目录下的所有文件

- 查看进程  `ps -ef | grep java` 或 `ps -aux | grep java`

　　-aux 显示所有状态
- 查看端口 `netstat -nap|grep 端口号`

- 终止进程 `kill -9 [PID]`

- Tomcat查看日志 `cd logs   tail -f catalina.out`

- `yum -y install` 包名（支持*） ：自动选择y，全自动
- `yum install` 包名（支持*） ：手动选择y or n
- `yum remove` 包名（不支持*）
- `rpm -ivh` 包名（支持*）：安装rpm包
- `rpm -e` 包名（不支持*）：卸载rpm包
# JAVA开发环境常用软件安装及配置
- 更新yum：`yum update`

- JDK1.8安装
    - 查看可安装JDK版本： `yum list java*`
    - 安装指定1.8版本： `yum -y install java-1.8.0-openjdk*`
    - 查看是否安装成功：`java -version`
- MariaDB(MySQL)数据库安装
    - 注：默认CentOS7已没有MySQL源, MySQL隶属的sun公司被甲骨文收购，担心闭源的社区人员维护的一个新的分支
    - 安装：`yum install mariadb-server`
    - 配置初始化 启动服务 `service mariadb start`
    - 初始化命令 `mysql_secure_installation`
    ```
    Set root password? [Y/n] <– 是否设置root用户密码，建议y
    New password: <– 设置root用户的密码
    Re-enter new password: <– 确认你设置的密码

    其他配置

    Remove anonymous users? [Y/n] <– 是否删除匿名用户，建议y

    Disallow root login remotely? [Y/n] <–是否禁止root远程登录，建议n

    Remove test database and access to it? [Y/n] <– 是否删除test数据库，建议y

    Reload privilege tables now? [Y/n] <– 是否重新加载权限表，建议y
    ```
    - 新增远程管理用户 登录数据库：`mysql -u root -p` 输入密码，回车
    - 使用mysql数据库：`use mysql`
    - 新增用户，name用户名，pwd密码，%代表任何客户端机器上能以该用户登录到MySQL服务器：`CREATE USER 'name'@'%' IDENTIFIED BY 'pwd';`
    - 授权
    ```
    //grant 普通 DBA 管理某个 MySQL 数据库的权限
    grant all privileges on 你的某个db名 to 用户名
    //grant 高级 DBA 管理 MySQL 中所有数据库的权限 建议
    grant all on *.* to 用户名
    //刷新权限
    flush privileges;­
    ```
    - 输入exit或Ctrl+c退出，重启MySQL：`service mariadb restart`
    - 设置开机启动：`systemctl enable mariadb`
- Maven安装
    - [官网](http://maven.apache.org/download.cgi) 找到较新版本下载地址：`wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz`
    - 解压：`tar -zvxf apache-maven-3.5.2-bin.tar.gz`
    - 打开/etc/profile，配置环境变量，在末尾加入：
    ```
    MAVEN_HOME=/usr/local/maapache-maven-3.5.2

    PATH=$PATH:$MAVEN_HOME/bin

    export PATH MAVEN_HOME
    ```
    - 使更改生效：`soucre /etc/profile`
    - `mvn -v`
- Git安装
    - `yum -y install git`
    - `git --version`
- Nodejs安装1 推荐
    - 安装更新一些依赖：`yum -y install gcc gcc-c++ openssl-devel make`
    - [官网](https://nodejs.org/en/download/) 找到较新版本下载地址：`wget https://nodejs.org/dist/v8.9.1/node-v8.9.1.tar.gz`
    - 解压：`tar -zvxf node-v8.9.1.tar.gz`
    - 进入解压后文件夹后执行：`./configure`
    - 编译安装：`make && make install`
    - `node -v`
- Nodejs安装2
    - `yum -y install nodejs`
    - `node -v`
- 文件上传安装
    - `yum -y install lrzsz`
- 更换阿里yum源
    - 默认源：`ll /etc/yum.repos.d`
    - 备份 `/etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup`
    - 下载新的CentOS-Base.repo 到/etc/yum.repos.d/
    ```
    CentOS 5
    wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
    CentOS 6
    wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
    CentOS 7
    wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
    ```
    - 生成缓存：`yum makecache`
- 端口开放
    - 以防火墙开放3306端口为例 `firewall-cmd --zone=public --add-port=3306/tcp --permanent`
    - 重启防火墙 `firewall-cmd --reload`
- 防火墙
    - 停止firewall：`systemctl stop firewalld.service`
    - 禁止firewall开机启动：`systemctl disable firewalld.service`
    - 查看默认防火墙状态：`firewall-cmd --state`

- 创建swap空间
    - 通常创建物理内存2~2.5倍大小的文件作为交换区，创建2G的swap交换区空白文件名为swapfile `dd if=/dev/zero of=/root/swapfile bs=1M count=2048`
    - 格式化文件为swap文件系统 `mkswap swapfile`
    - 启用：`swapon swapfile`
    - 设置开机自动启用swap文件交换区，修改/etc/fstab，增加一行 `/root/swapfile swap swap defaults 0 0`
    - 关闭swap：`swapoff swapfile`

