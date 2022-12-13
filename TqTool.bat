@echo off
cls
title ̩̹֮�÷�������
color 0A

set BasePath=%~dp0
set LibPath=%BasePath%libs\ArchiveTool.exe
set ChPath=%BasePath%Text\Text_CH.arc
set EnPath=%BasePath%Text\Text_EN.arc

REM ������ļ���Ŀ¼
set ChOut=%BasePath%workplace\ch
set EnOut=%BasePath%workplace\en

REM �����Ĵ���Ŀ¼��ֻ��Ҫ���ĵģ�
set ChSave=%BasePath%Text_CH.arc

REM ���ô��ڵĴ�С
mode con cols=80 lines=30

:mainUI
cls
echo.		
echo; ------------------------------------------
echo;            ARC�Ľ������
echo;      ������ʹ�ã�ֱ�ӻس�ȷ�ϣ�
echo; ------------------------------------------
echo.
echo;  H��ʹ������
echo.
echo;  U�����ARC
echo.
echo;  P�����ARC
echo.
echo;  E���˳��ű�
echo.

:chooseMain
set choice=
set /p choice=��ѡ�������
REM ���ж��Ƿ�ΪĬ�ϣ������ȡһ���ַ�������ֵ��choice  
if "%choice%"=="" goto howto
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="h" goto help
if /i "%choice%"=="u" goto unpack
if /i "%choice%"=="p" goto package
if /i "%choice%"=="e" goto end
echo �����������������
echo.
goto chooseMain


:help
echo;
echo;  1���ȴ�̩̹֮�õ���Ϸ��Ŀ¼
echo;
echo;  2������ϷĿ¼�µ�Text���Ƶ������ߵ�TextĿ¼
echo;    ��Titan Quest Anniversary Edition\Text��
echo;    ���߸���ָ���ļ��������ߵ�Text����
echo;    �����룺Text_CH.arc     �����ı�
echo;    ���Ƽ���Text_EN.arc     ԭ�Ķ���
echo;  3�����н��ARCָ��õ������ı�
echo;
echo;  4�������Ϻ󣬿�ʼ�޸��ı�
echo;
echo;  5�����д��ARCָ���ɷ�������
goto return

:howto
echo;
echo;  ����˵������ĸ
echo;
echo;  ��������ĸ��Сд
echo;
echo;  �س�ȷ�ϼ��ɿ�ʼ
echo;
echo;  ������ֻ���steam����Ϸ�����ް汾
echo;
echo;  ������Ϸδ�����ԣ������д���
goto return

:unpack
REM �ж��Ƿ���������ļ�
if exist %ChPath% (
	cls
	%LibPath% %ChPath% -extract %ChOut%
	echo;
	echo;  ARC��������Ľ��
	echo;
	echo;  ע�⣺�������ظ����н��ָ��
) else (
	echo;
    echo;  0 - û���ڹ��ߵ�TextĿ¼���ҵ� Text_CH.arc �����ı�������
	goto return
)

REM �ж��Ƿ����Ӣ���ļ�
if exist %EnPath% (
	cls
	%LibPath% %EnPath% -extract %EnOut%
	echo; 
	echo; ----------------------------------------------------------------------
	echo; 
	echo;  1 - ��������ɽ��������Կ�ʼ�޸���Ϸ�ı���
	echo; 
	echo;  2 - Ӣ������ɽ��������Կ�ʼ�ο���Ϸԭ����
	echo;
	echo;  ע�⣺�������ظ����н��ָ��
) else (
	echo; 
	echo; ----------------------------------------------------------------------
	echo; 
	echo;  1 - ��������ɽ��������Կ�ʼ�޸���Ϸ�ı���
	echo; 
    echo;  2 - δ�ҵ����ߵ�TextĿ¼�µ� Text_EN.arc ԭ�Ķ��գ��������
)
echo; 
echo;    ����Ŀ¼Ϊ��
echo;    %BasePath%workplace
echo;
echo;    ���㷭����������ټ���seeyou~
echo; ----------------------------------------------------------------------
pause>nul
goto end


:package
cls

REM �����ļ�������Ŀ¼
set chexe=%ChOut%\ArchiveTool.exe
set chbat=%ChOut%\pack.bat

echo;
echo;  ������������...
echo;
copy %BasePath%libs\ArchiveTool.exe %chexe%
copy %BasePath%libs\pack.bat %chbat%
echo;
echo;  ��������Ѳ���...

REM �ļ�׼����λ����ʼ���
echo;
echo; ��ʼִ�д��...
set pakBat=%ChOut%\pack.bat
%pakBat% %BasePath%

REM �Ѿ���ת�������ű�
goto end

:return
REM չʾ����Ϣ�󣬻س�����ˢҳ�� BasePath
echo;
pause
goto mainUI

:end
exit 0
