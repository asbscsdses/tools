@echo off
echo 正在初始化环境...
call D:\Pm\vs2013\Common7\Tools\VsDevCmd.bat
echo 初始化完成
set /p a=请输入要查询状态的文件名:
echo 准备查询：%a%
tf status $/abc/SunMeter /user:* /recursive|findstr /i "%a%"
pause