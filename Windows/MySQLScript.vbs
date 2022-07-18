rem 自动获登陆并导入sql脚本

Dim WshShell 
Set WshShell=WScript.CreateObject("WScript.Shell")

username=WScript.Arguments(0)
password=WScript.Arguments(1)

WshShell.Run "cmd.exe"
WScript.Sleep 1500 
WshShell.SendKeys "mysql -u" &username &" -p" &password
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500
WshShell.SendKeys "create database auto;"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500