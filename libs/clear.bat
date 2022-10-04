@echo off

set BasePath=%1
set chexe=%BasePath%workplace\ch\ArchiveTool.exe
set chbat=%BasePath%workplace\ch\pack.bat

REM 清理打包环境
del %chexe%
del %chbat%
REM echo; 临时环境清除...

echo;
echo; 所有步骤已完成。
pause>nul