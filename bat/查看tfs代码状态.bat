@echo off
echo ���ڳ�ʼ������...
call D:\Pm\vs2013\Common7\Tools\VsDevCmd.bat
echo ��ʼ�����
set /p a=������Ҫ��ѯ״̬���ļ���:
echo ׼����ѯ��%a%
tf status $/abc/SunMeter /user:* /recursive|findstr /i "%a%"
pause