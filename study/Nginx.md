### Ngix安装(Linux) 
1. gcc环境 `yum install gcc-c++`
2. 第三方的开发包
    - PCRE `yum install -y pcre pcre-devel`
    - zlib `yum install -y zlib zlib-devel`
    - openssl `yum install -y openssl openssl-devel`
3. 安装
    - 解压 `[root@localhost ~]# tar zxf nginx-1.8.0.tar.gz`
    - 复制执行以下命令
    `./configure \
    --prefix=/usr/local/nginx \
    --pid-path=/var/run/nginx/nginx.pid \
    --lock-path=/var/lock/nginx.lock \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-http_gzip_static_module \
    --http-client-body-temp-path=/var/temp/nginx/client \
    --http-proxy-temp-path=/var/temp/nginx/proxy \
    --http-fastcgi-temp-path=/var/temp/nginx/fastcgi \
    --http-uwsgi-temp-path=/var/temp/nginx/uwsgi \
    --http-scgi-temp-path=/var/temp/nginx/scgi`
    - `[root@localhost ~]# make`
    - `[root@localhost ~]# make install`
    - `[root@localhost sbin]# mkdir /var/temp/nginx/client -p`
    - 进入目录 `cd /usr/local/nginx/` 
    - 启动 `[root@localhost sbin]# ./nginx`
4. 配置文件目录 
`nginx/conf/nginx.conf`
5. 重新加载配置文件 避免重启
`sbin/nginx -s reload`
6. 配置虚拟主机与反向代理
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

7. 负载均衡（直接添加server即可）
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