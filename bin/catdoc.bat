@echo off

REM GREEN BATCH FILE TEMPLATE <you can replace this line with new bat desc>
REM VERSION 0.0.2.2 - enable grep options - Green Jan-26-2009
REM VERSION 0.0.2.1 - Last updated by greenlaw110@gmail.com at Nov-5-2007
REM VERSION 0.0.1   - created by greenlaw110@gmail.com at some time 2006

setlocal & pushd

if {%1}=={} goto _HELP
if {%1}=={-h} goto _HELP
if {%1}=={--help} goto _HELP

if '%GREP%'=='' set GREP=egrep

if exist %~dp0.\lgl_set.bat (
	set _SET_=%~dp0.\lgl_set.bat
	goto _DOIT
)

if exist %_BIN%\lgl_set.bat (
	set _SET_=%_BIN%\lgl_set.bat
	goto _DOIT
)

set _SET_=lgl_set.bat

:_DOIT
call %_SET_%
if %errorlevel% GTR 0 goto _ERR_NO_ENV

if exist %1 (
	set __FILE=%1
) else (
	if exist %_DOC%\%1 (
		set __FILE=%_DOC%\%1
	) else (
		rem last try
		set __FILE=%_DOC%\%1.txt
	)
)

if not exist %__FILE% goto _ERR_NO_TGT

if not {%2}=={} (
	%__EXEC% %LGL_VIEWER% %__FILE% | %GREP% %2 %3 %4 %5 %6 %7 %8 %9
) else (
	%__EXEC% %LGL_VIEWER% %__FILE% 
)


goto _END

:_ERR_NO_TGT
echo Sorry, the target file %__FILE% does not exist.
goto _END

:_ERR_NO_ENV
echo Error: Sorry your green batch utility environment is not well setup, possible cause:
echo - You copied a green batch file from it's package directory and use it separately
echo or
echo - The lgl_set.bat file has been removed accidentially.
goto _END 

:_HELP
echo usage: 
echo       %~nx0 ^<I^>
goto _END

:_END
endlocal & popd
goto:EOF
