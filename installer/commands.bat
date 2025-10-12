@if "%1" == "debug" (
    @echo on
) else (
    @echo off
)
@set retry=0
@set errorlevel=0
:a
REG IMPORT RegTweak.reg
if %errorlevel% == 0 goto EndProgram
set retry=%retry%+1
if retry == 5 goto fatal
goto a
:fatal
echo ERROR: Failed to apply registry tweaks. Please run the installer as Administrator.
pause > nul
echo Click any key to kill the installer and exit...

:EndProgram
@set errorlevel=0
start /min RD /S /Q ..\
if "%1" == "debug" pause
exit