%windir%\Microsoft.NET\Framework\v4.0.30319\MSBuild .\WebAppToTestMsBuild\WebAppToTestMsBuild.csproj /t:ResolveReferences;Compile /t:_WPPCopyWebApplication /p:Configuration=Release /p:platform=x86 /p:VisualStudioVersion=12.0 /p:WebProjectOutputDir=..\webpublish /fl 
::�����������ʱû�õ� 
@IF %ERRORLEVEL% NEQ 0 GOTO err
@ECHO ======================�ɹ�=====================
PAUSE
@exit /B 0
:err
@PAUSE
@exit /B 1