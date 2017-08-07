%windir%\Microsoft.NET\Framework\v4.0.30319\MSBuild .\WebAppToTestMsBuild\WebAppToTestMsBuild.csproj /t:ResolveReferences;Compile /t:_WPPCopyWebApplication /p:Configuration=Release /p:platform=x86 /p:VisualStudioVersion=12.0 /p:WebProjectOutputDir=..\webpublish /fl 
::这个命令行暂时没用到 
@IF %ERRORLEVEL% NEQ 0 GOTO err
@ECHO ======================成功=====================
PAUSE
@exit /B 0
:err
@PAUSE
@exit /B 1