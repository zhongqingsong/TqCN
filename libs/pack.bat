@echo off

set curdir=%~dp0
set ChSave=%1Text_CH.arc

REM 如果存在，则先清除
if exist %ChSave% (
	del %ChSave%
)

REM 必须手动cd进译文目录
REM 然后需要过滤txt文件
cd %curdir%
for /f "delims=" %%a in ('dir /b /a-d /o-d "%curdir%\*.txt"') do (
	archivetool %ChSave% -add "%%a" compression 9
)

echo;
echo; 已打包完成：%ChSave%

REM 跳转到清空现场脚本
REM echo; 开始清理现场...
set pakBat=%1libs\clear.bat
%pakBat% %1
