@echo off
cls
title 泰坦之旅翻译助手
color 0A

set BasePath=%~dp0
set LibPath=%BasePath%libs\ArchiveTool.exe
set ChPath=%BasePath%Text\Text_CH.arc
set EnPath=%BasePath%Text\Text_EN.arc

REM 输出的文件夹目录
set ChOut=%BasePath%workplace\ch
set EnOut=%BasePath%workplace\en

REM 打包后的存在目录（只需要中文的）
set ChSave=%BasePath%Text_CH.arc

REM 设置窗口的大小
mode con cols=80 lines=30

:mainUI
cls
echo.		
echo; ------------------------------------------
echo;            ARC的解包与打包
echo;      （不会使用，直接回车确认）
echo; ------------------------------------------
echo.
echo;  H、使用流程
echo.
echo;  U、解包ARC
echo.
echo;  P、打包ARC
echo.
echo;  E、退出脚本
echo.

:chooseMain
set choice=
set /p choice=请选择操作：
REM 先判定是否为默认；否则截取一个字符，并赋值给choice  
if "%choice%"=="" goto howto
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="h" goto help
if /i "%choice%"=="u" goto unpack
if /i "%choice%"=="p" goto package
if /i "%choice%"=="e" goto end
echo 输入错误，请重新输入
echo.
goto chooseMain


:help
echo;
echo;  1、先打开泰坦之旅的游戏根目录
echo;
echo;  2、将游戏目录下的Text复制到本工具的Text目录
echo;    （Titan Quest Anniversary Edition\Text）
echo;    或者复制指定文件到本工具的Text工具
echo;    （必须：Text_CH.arc     中文文本
echo;    （推荐：Text_EN.arc     原文对照
echo;  3、运行解包ARC指令，得到翻译文本
echo;
echo;  4、解包完毕后，开始修改文本
echo;
echo;  5、运行打包ARC指令，完成翻译流程
goto return

:howto
echo;
echo;  输入菜单项的字母
echo;
echo;  不区分字母大小写
echo;
echo;  回车确认即可开始
echo;
echo;  本工具只针对steam版游戏，不限版本
echo;
echo;  其他游戏未经测试，请自行处理
goto return

:unpack
REM 判定是否存在中文文件
if exist %ChPath% (
	cls
	%LibPath% %ChPath% -extract %ChOut%
	echo;
	echo;  ARC已完成中文解包
	echo;
	echo;  注意：不建议重复运行解包指令
) else (
	echo;
    echo;  0 - 没有在工具的Text目录下找到 Text_CH.arc 中文文本，请检查
	goto return
)

REM 判定是否存在英文文件
if exist %EnPath% (
	cls
	%LibPath% %EnPath% -extract %EnOut%
	echo; 
	echo; ----------------------------------------------------------------------
	echo; 
	echo;  1 - 中文已完成解析，可以开始修改游戏文本了
	echo; 
	echo;  2 - 英文已完成解析，可以开始参考游戏原文了
	echo;
	echo;  注意：不建议重复运行解包指令
) else (
	echo; 
	echo; ----------------------------------------------------------------------
	echo; 
	echo;  1 - 中文已完成解析，可以开始修改游戏文本了
	echo; 
    echo;  2 - 未找到工具的Text目录下的 Text_EN.arc 原文对照，建议添加
)
echo; 
echo;    译文目录为：
echo;    %BasePath%workplace
echo;
echo;    等你翻译完后，我们再见，seeyou~
echo; ----------------------------------------------------------------------
pause>nul
goto end


:package
cls

REM 复制文件到译文目录
set chexe=%ChOut%\ArchiveTool.exe
set chbat=%ChOut%\pack.bat

echo;
echo;  部署打包环境中...
echo;
copy %BasePath%libs\ArchiveTool.exe %chexe%
copy %BasePath%libs\pack.bat %chbat%
echo;
echo;  打包环境已部署...

REM 文件准备就位，开始打包
echo;
echo; 开始执行打包...
set pakBat=%ChOut%\pack.bat
%pakBat% %BasePath%

REM 已经跳转到其他脚本
goto end

:return
REM 展示完消息后，回车，重刷页面 BasePath
echo;
pause
goto mainUI

:end
exit 0
