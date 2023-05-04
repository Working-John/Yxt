# 🚀 毕设脚手架

#### 🛫 介绍
毕设脚手架工程，拿来即用，简单便捷，转为新手小白/毕设困难户打造，货真价实，童叟无欺

#### 🚂 软件架构
Java后台：SpringBoot 2.1.0 + SpringData Jpa + hutool工具包 + Apache poi

前台页面：Vue2.0 + ElementUI + Jquery + tinymce（富文本插件）

数据库：Mysql

前后端分离，页面可单独部署，默认放在项目的static文件夹，随后端工程一起访问。


#### 🚁 安装教程

1. 使用git下载本项目

    `git clone https://gitee.com/xqnode/graduation-scaffold.git`

    或者直接下载zip解压

    ![下载zip](https://img-blog.csdnimg.cn/20210321072245227.png)

2. 使用idea打开graduation-scaffold文件夹导入工程
2. 配置maven，下载项目依赖
3. 数据库执行test.sql
4. 项目依赖下载完成后，直接运行 Application 启动SpringBoot即可

#### 🛸 使用说明

1. 登录页面请访问：http://localhost:9999/page/end/login.html
2. 账号：tom ，密码：123456

#### 🎨 界面截图

登录

![](https://img-blog.csdnimg.cn/20210321074415992.png)

注册

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210321074541905.png)

项目主页

![](https://img-blog.csdnimg.cn/20210321074631857.png)

信息管理页

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210321075759576.png)

各种前端插件

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210321080021789.png?)

Websocket在线聊天室

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210321080207619.png)

个人信息页

![在这里插入图片描述](https://img-blog.csdnimg.cn/202103210803534.png)


#### 🏎 问题交流
扫描下方二维码，加我微信

![](https://img-blog.csdnimg.cn/20201030174103759.jpg#pic_center)

#### 🛹 请作者喝杯咖啡

![](https://img-blog.csdnimg.cn/2021032107143511.jpg)

#### 文件传输部署在Linux系统
​        本项目试运行在Windows，如要部署到Linux系统，因为两者的系统路径格式不同，所以需要改配置文件中的文件上传路径，所以为了方便修改配置文件，就把配置文件分离了，**部署的时候在要运行的jar包的同级目录下创建一个config目录，然后把配置文件直接拷贝进去**就能正常使用了。
​		另外可以百度下配置文件的加载顺序及配置文件扫描路径，因为一般项目部署都需要改动一些配置，所以这么做就是为了方便部署。
