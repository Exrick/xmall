## IntelliJ IDEA - JRebel 安装使用

### JRebel能做什么

>以前Tomcat中解决方案：
>
>修改server.xml的配置：
`<Context path="/helloapp" docBase="helloapp" reloadable="true"/> `
>
>但改 java代码后果是tomcat会重启整个项目。

JRebel是一款热部署插件。当你的Java-Web项目在Tomcat中run/debug的时候，修改某一个java文件时，JRebel就可以解决在项目运行状态run/debug状态下任意修改java文件并动态反馈实时更新到运行的项目中。

### JRebel插件获取与安装

1. JRebel注册

    https://my.jrebel.com/register
    
    https://zeroturnaround.com/software/jrebel/download/#!/free-trial

    注册后获得激活码

2. 插件安装

    IDEA中 `File-Settings-Plugin` 中搜索JRebel下载安装后重启IDEA

3. 激活
