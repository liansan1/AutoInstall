# AutoInstall
脚本自动安装并配置MySql

AutoInstall:
	\Windows:
			
		MySqlLogin.vbs
			1.登陆MySql
			2.更改默认初始密码
			3.创建数据库
			4.导入脚本
			两个参数：
			1.数据库的用户名
			2.数据库的密码
			
		MySQLScript.vbs
			1.登陆MySql
			2.创建数据库
			3.导入脚本
			两个参数：
			1.数据库的用户名
			2.数据库的密码
			
		AutoInstall.bat
			自动安装iPlature的主脚本
			主要逻辑：
				7.如果没安装则解压Mysql到指定目录
				8.创建My.ini文件
				9.添加Bin路径到系统环境变量
				10.初始化Mysql
				11.运行MySql的安装命令
				12.开启MySql服务
				13.提取后缀名为.err文件里面的密码
				16.如果之前已安装MySql则调用MySqlLogin.vbs脚本
				17.如果未安装MySql调用MySQLScript.vbs脚本
	\linux
		AutoInstall
		主要逻辑：
			7.如果没安装则解压Mysql到指定目录
			8.解压Mysql所有的依赖包到指定目录
			9.运行MySql的服务
			13.登陆MySql并创建数据库
			14.导入数据库表脚本
			
一键安装流程：
	在windows平台进行一键安装需要：
		AutoInstall.bat、mysql安装包、MySqlLogin.vbs脚本、MySQLScript.vbs脚本
		这些需要在同一路径下，执行AutoInstall主脚本完成自动安装
	在Linux平台进行一键安装需要：
		AutoInstall、Mysql安装包
		需要在同一路径下，执行AutoInstall主脚本完成自动安装
