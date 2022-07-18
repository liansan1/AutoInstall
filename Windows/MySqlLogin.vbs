rem 自动获登陆并导入sql脚本

Dim WshShell 
Set WshShell=WScript.CreateObject("WScript.Shell")

password=WScript.Arguments(0)
newpassword=WScript.Arguments(1)

WshShell.Run "cmd.exe"
WScript.Sleep 1500 
WshShell.SendKeys "mysql -uroot -p" &password
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500
WshShell.SendKeys "alter user 'root'@'localhost' identified with mysql_native_password  by '" &newpassword &"';"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500
WshShell.SendKeys "create database auto;"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500