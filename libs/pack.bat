@echo off

set curdir=%~dp0
set ChSave=%1Text_CH.arc

REM ������ڣ��������
if exist %ChSave% (
	del %ChSave%
)

REM �����ֶ�cd������Ŀ¼
REM Ȼ����Ҫ����txt�ļ�
cd %curdir%
for /f "delims=" %%a in ('dir /b /a-d /o-d "%curdir%\*.txt"') do (
	archivetool %ChSave% -add "%%a" compression 9
)

echo;
echo; �Ѵ����ɣ�%ChSave%

REM ��ת������ֳ��ű�
REM echo; ��ʼ�����ֳ�...
set pakBat=%1libs\clear.bat
%pakBat% %1
