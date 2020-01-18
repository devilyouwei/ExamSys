# 考试系统

## 数据库

1. 导出
使用mysqldump命令工具导出整个数据库，命名按照库名，后缀为sql，内部为sql脚本
或
使用phpmyadmin集成工具导出为sql文件，同上

2. 导入
使用mysql source命令：新建数据库为exam，use exam，source sql文件路径

3. 字符集
utf-8 utf-8_general_ci

4. 必要软件：mysql version>=5.4

5. 辅助软件：php5.4+，nginx（phpmyadmin使用）


## 集成开发环境

1. eclipse
eclipse neon

2. java
jdk version>=1.8 java8

3. tomcat
tomcat apache version>=8.0

4. gradle
gradle=3.4.1，在线包管理器（如需VPN，请自行查阅方法）

5. gradle安装
eclipse marketplace搜索gradle
新建项目为gradle
使用本地gradle目录
右击项目选择properties
选择project facets，勾选Dynamic web module
注意上述步骤不可以失误，工程不可逆，出错后删除项目重建

6. 下载包
右击项目，gradle->Refresh Gradle Project
（等待时间较长需要代理或者vpn）

7. 导入
右击项目，import->import->选择file system->找到解压的项目
导入中出现是否覆盖文件
如果gradle版本为3.4.1则覆盖即可
如果gradle版本非此版本，只能覆盖build.gradle和基本的.project项目其他不能覆盖，否则gradle版本冲突

8. 导出
导出export为file system，压缩为zip即可

9. hibernate逆向工程
安装插件：eclipse marketplace搜索jboss tools
安装只勾选hibernate tools，完成后
菜单栏window->show view->other->搜索hibernate configuration
下方工具小窗口出现hibernate configuration
右击->add configuration 做好相应配置，和数据库对接
菜单栏window->perspective->customize perspective
hibernate code generation configuration配置

10. 启动网站
右击项目，run->run on server，第一次运行创建一个tomcat，指定好下载的tomcat目录，finish运行

## 后端
1. Spring MVC框架
2. hibernate数据库模型
3. java多线程任务

## 前端
1. amzeui
2. sisyphus.js

## 操作系统
Linux windows10 macos UNIX BSD均可