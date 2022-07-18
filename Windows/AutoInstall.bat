@echo off

:MYSQLINSTALL
ECHO Mysql的安装路径：
SET /p INSTALLADRESS=
start winrar x mysql-8.0.28-winx64.zip %INSTALLADRESS%
ping -n 10 127.0.0.1>nul

:MYSQLCONF
set My_PATH=%INSTALLADRESS%\mysql-8.0.28-winx64\bin
  
set PATH=%PATH%;%My_PATH%

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Path" /t REG_EXPAND_SZ /d "%PATH%" /f

MD %INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO [mysql]>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO default-character-set=utf8>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO [mysqld]>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO port = 3306>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO basedir = %INSTALLADRESS%\\mysql-8.0.28-winx64>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO datadir = %INSTALLADRESS%\\mysql-8.0.28-winx64\\data>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO max_connections=20>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO character-set-server=utf8>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO default-storage-engine=INNODB>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

ECHO sql_mode = NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES>>%INSTALLADRESS%\mysql-8.0.28-winx64\my.ini

CD %INSTALLADRESS%\mysql-8.0.28-winx64\bin

mysqld --initialize

sc delete mysql

mysqld --install

net start mysql

ECHO MYSQL安装完成...

FOR /R "%INSTALLADRESS%\mysql-8.0.28-winx64\data" %%i in (*.err) do (
ECHO %%i
copy %%i .\a.err
)
for /f "delims=" %%j in ('find "[Note]" a.err') do SET TEMP=%%j

SET PASSWORD=%TEMP:~-12%

del a.err

rem ECHO %PASSWORD:~-12%

MysqlLogin.vbs %PASSWORD% AutoTest_001

:MySqlConnect
ECHO Mysql的用户名：
SET /p UserName=

ECHO Mysql的密码
SET /p UserPass=

MySQLScript.vbs %UserName% %UserPass%


:EOF
