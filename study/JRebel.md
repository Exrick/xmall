# IntelliJ IDEA - JRebel 安装使用

### JRebel能做什么

>以前Tomcat中解决方案：
>
>修改server.xml的配置：
`<Context path="/helloapp" docBase="helloapp" reloadable="true"/> `
>
>但改 java代码后果是tomcat会重启整个项目。

JRebel是一款热部署插件。当你的Java-Web项目在Tomcat中run/debug的时候，修改某一个java文件时，JRebel就可以解决在项目运行状态run/debug状态下任意修改java文件并动态反馈实时更新到运行的项目中。

### JRebel插件获取与安装

1. 插件安装

    IDEA中 `File-Settings-Plugin` 中搜索JRebel下载安装后重启IDEA

2. 激活

    [网友分享激活链接](https://blog.csdn.net/xingbaozhen1210/article/details/81093041)

### JRebel使用

1. 普通Spring Web应用添加Tomcat等服务器容器配置时，`VM option` 下方都勾选Update classes and resources，Spring Boot项目忽略此步骤，但IDEA编译器需设置自动编译

2. 左下角勾选要使用热部署的项目模块，在IDEA上方菜单栏中找到JRebel按钮选择以JRebel启动项目

    ![WX20190410-233204@2x.png](https://i.loli.net/2019/04/10/5cae0c81bbe81.png)
3. 添加热部署的模块可在 `resource` 中看到 `rebel.xml` 配置文件，打开可看到其监听的文件夹，当然可根据自己需求修改
