@echo off

setlocal & pushd

if {%1}=={-h} goto _HELP

:_DOIT

call lgl_set.bat

"C:\Program Files\Kingsoft\Powerword 2003\ScrollWord.exe"

goto _END

:_HELP
echo ��ɽ���ʱ���usage: 
echo       %~nx0 

:_END
endlocal & popd
goto:EOF
