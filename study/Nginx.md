# Ngix安装(Linux) 

[官方下载地址](http://nginx.org/en/download.html)

### 安装与启动

1. gcc环境 `yum install gcc-c++`
2. 第三方的开发包
    - PCRE `yum install -y pcre pcre-devel`
    - zlib `yum install -y zlib zlib-devel`
    - openssl `yum install -y openssl openssl-devel`
3. 安装
    - 解压 `[root@localhost ~]# tar zxf nginx-1.8.0.tar.gz`
    - 进入解压后文件夹复制执行以下命令
    `./configure  --prefix=/usr/local/nginx  --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --error-log-path=/var/log/nginx/error.log  --http-log-path=/var/log/nginx/access.log  --pid-path=/var/run/nginx/nginx.pid --lock-path=/var/lock/nginx.lock  --user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module --with-http_gzip_static_module --http-client-body-temp-path=/var/tmp/nginx/client/ --http-proxy-temp-path=/var/tmp/nginx/proxy/ --http-fastcgi-temp-path=/var/tmp/nginx/fcgi/ --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi --http-scgi-temp-path=/var/tmp/nginx/scgi --with-pcre`
    - `[root@localhost nginx-1.8.0]# make`
    - `[root@localhost nginx-1.8.0]# make install`
    - `[root@localhost sbin]# mkdir /var/temp/nginx/client -p`
    - 进入目录 `cd /usr/local/nginx/` 
    - 启动 `[root@localhost sbin]# ./nginx`
4. 配置文件目录 
`nginx/conf/nginx.conf`
5. 重新加载配置文件 避免重启
`sbin/nginx -s reload`

### 配置

- 配置虚拟主机与反向代理
```
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    upstream resume{
	server 123.207.121.135:8080;
    }

    server {
        listen       80;
        server_name  localhost;

        location / {
            proxy_pass   http://resume;
            index  index.html index.htm;
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }

    server {
        listen       80;
        server_name  www.img.exrick.cn;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   html81;
            index  index.html index.htm;
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }

    server {
        listen       80;
        server_name  www.xmall.exrick.cn;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   html;
            index  index.html index.htm;
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}
``` 

- 负载均衡（直接添加server即可）
```
...
http {
    ...
    upstream resume{
        server 123.207.121.135:8080;
        server 123.207.121.135:8081;
    } 
    ...
}
``` 
权重调节（weight）
```
...
http {
    ...
    upstream resume{
        server 123.207.121.135:8080;
        server 123.207.121.135:8081 weight=2;
    } 
    ...
}
``` 

- 压缩文件
```
    gzip  on;
    gzip_min_length 1k;
    gzip_buffers 4 16k;
    gzip_comp_level 9;
    gzip_types text/plain application/x-javascript application/javascript text/css application/xml text/javascript application/x-httpd-php image/jpeg image/gif image/png eventsource script png;
```

- 解决代理IP地址
```
server {
        listen       80;
        server_name  xmall.exrick.cn;

        location / {
            proxy_pass   http://xmall;
            index  index.html index.htm;
	        proxy_set_header Host $host;
	        proxy_set_header X-Real-IP $remote_addr;
	        proxy_set_header REMOTE-HOST $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }

        error_page  404              /50x.html;

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

    }
```
### 踩坑解决问题
- [emerg]: getpwnam("nginx") failed

    - 解决方法1：
      在nginx.conf中 把user nobody的注释去掉既可
    - 解决方法2：
      错误的原因是没有创建nginx这个用户，应该在服务器系统中添加nginx用户组和用户nginx，如下命令：
`/usr/sbin/groupadd -f nginx`
`/usr/sbin/useradd -g nginx nginx`
- [emerg] mkdir() "/var/temp/nginx/client" failed (2: No such file or directory)
root下手动创建即可：`mkdir -p /var/temp/nginx/client`
- 重启服务器后启动提示/var/run/nginx找不到
```
nginx: [error] open() "/var/run/nginx.pid" failed (2: No such file or directory)
```
进入`/var/run`新建`nginx`文件夹：`mkdir nginx`
