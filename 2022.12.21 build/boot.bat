::Max's Batch based sub-operating system
::https://maxwellcrafter.com
::Source/more recent versions, documentation, and more can be found at https://github.com/Maxwell-Fisher/Batch_sub-OS
 ::a1cbdd7272ff08c2b23eadbd9b92fab96b13e3e6ab8238a47c63075afc9d6870::
::                                                                  ::
::       |\/| ---- _                                                ::
::      =(--)=_____ \                                               ::
::      c___ (______/                                               ::
::                                                                  ::
 ::19ddefabe5c2652a30e671914cf84c49b0a6f45318adacc0aeb3563ae72d134e::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                  ::
::  MIT License                                                                     ::
::                                                                                  ::
::  Copyright (c) 2022 Maxwell Fisher (@Maxwellcrafter)                             ::
::                                                                                  ::
::  Permission is hereby granted, free of charge, to any person obtaining a copy    ::
::  of this software and associated documentation files (the "Software"), to deal   ::
::  in the Software without restriction, including without limitation the rights    ::
::  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       ::
::  copies of the Software, and to permit persons to whom the Software is           ::
::  furnished to do so, subject to the following conditions:                        ::
::                                                                                  ::
::  The above copyright notice and this permission notice shall be included in all  ::
::  copies or substantial portions of the Software.                                 ::
::                                                                                  ::
::  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      ::
::  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        ::
::  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     ::
::  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          ::
::  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   ::
::  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   ::
::  SOFTWARE.                                                                       ::
::                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
title Loading...
@echo off
cls
mode 120, 40
setLocal enableDelayedExpansion
set "rD=%cd%"
set sEC=0
for /F %%a in ('echo prompt $E ^| cmd') do set "esc=%%a"
echo Loading...
del /Q "%rD%\tmp\*"
if not exist "%rD%\tmp" (mkdir "%rD%\tmp")
echo [!date! @ !time!]     OS started... > "%rD%\tmp\systemLog"
if not exist "%rD%\" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! Directory (/) does not exist or is a file >> "%rD%\tmp\systemLog"
if not exist "%rD%\bin\" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! Directory (/bin) does not exist or is a file >> "%rD%\tmp\systemLog"
if not exist "%rD%\etc\" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! Directory (/etc) does not exist or is a file >> "%rD%\tmp\systemLog"
if not exist "%rD%\home\" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! Directory (/home) does not exist or is a file >> "%rD%\tmp\systemLog"
if not exist "%rD%\media\" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! Directory (/media) does not exist or is a file >> "%rD%\tmp\systemLog"
if not exist "%rD%\sbin\" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! Directory (/sbin) does not exist or is a file >> "%rD%\tmp\systemLog"
if not exist "%rD%\tmp\" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! Directory (/tmp) does not exist or is a file >> "%rD%\tmp\systemLog"
if not exist "%rD%\usr\" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! Directory (/usr) does not exist or is a file >> "%rD%\tmp\systemLog"
if not "%sEC%"=="0" echo [!date! @ !time!]     System halted with (%sEC%) errors >> "%rD%\tmp\systemLog" & echo ERROR^^! Please check the log file located at (/tmp/systemLog) for more information & pause & exit
echo Setting region format...
echo. >> "%rD%\tmp\systemLog"
echo [!date! @ !time!]     Setting region format... >> "%rD%\tmp\systemLog"
for /f "tokens=3" %%i in ('reg query "HKCU\Control Panel\International" /v sShortDate') do (set "dateFormat=%%i")
for /f "tokens=3" %%i in ('reg query "HKCU\Control Panel\International" /v sShortTime') do (set "tF=%%i")
echo.     Date format set to (%dateFormat%), time format set to [%tF%]
echo [!date! @ !time!]          Date format set to (%dateFormat%) >> "%rD%\tmp\systemLog"
echo [!date! @ !time!]          Time format set to (%tF%) >> "%rD%\tmp\systemLog"
echo Loading variables from (/etc...)
echo [!date! @ !time!]     Loading variables from (/etc...) >> "%rD%\tmp\systemLog"
for /f %%f in ('dir /b "%rD%\etc"') do (echo.     Loading /etc/%%f... & echo [!date! @ !time!]          Loading ^(/etc/%%f^) >> "%rD%\tmp\systemLog" & set /p %%f=<"%rD%\etc\%%f" & echo [!date! @ !time!]               Loaded ^(/etc/%%f^) as ^(!%%f!^)>> "%rD%\tmp\systemLog")
echo Loading /sbin/bootInit...
echo [!date! @ !time!]     Loading (/sbin/bootInit...) >> "%rD%\tmp\systemLog"
if not exist "%rD%\sbin\bootInit" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! File (/sbin/bootInit) does not exist >> "%rD%\tmp\systemLog" & echo [!date! @ !time!]     System halted with (%sEC%) errors >> "%rD%\tmp\systemLog" & echo ERROR^^! Please check the log file located at (/tmp/systemLog) for more information & pause & exit
call :l "sbin\bootInit" & echo [!date! @ !time!]          Successfully loaded (/sbin/bootInit) >> "%rD%\tmp\systemLog"
echo Reloading variables from (/etc...)
echo [!date! @ !time!]     Reloading variables from (/etc...) >> "%rD%\tmp\systemLog"
for /f %%f in ('dir /b %rD%\etc') do (echo.     Reloading /etc/%%f... & echo [!date! @ !time!]          Reloading ^(/etc/%%f^) >> "%rD%\tmp\systemLog" & set "%%f=!%%f:^^!esc^^!=%esc%!" & echo [!date! @ !time!]               Reloaded ^(/etc/%%f^) as ^(!%%f!^)>> "%rD%\tmp\systemLog")
echo Loading user...
echo [!date! @ !time!]     Loading user... >> "%rD%\tmp\systemLog"
if not exist "%rD%\home\%username%" (mkdir "%rD%\home\%username%"
echo [!date! @ !time!]          User not found, creating home directory... >> "%rD%\tmp\systemLog")
if not exist "%rD%\home\%username%" (echo [!date! @ !time!]          Unable to create home directory >> "%rD%\tmp\systemLog"
echo.     Loaded user (!username!)
echo [!date! @ !time!]          Loaded user (!username!) >> "%rD%\tmp\systemLog"
title Loaded successfully
echo Successfully loaded OS^^!
echo [!date! @ !time!]     Successfully loaded OS^^! >> "%rD%\tmp\systemLog"
echo.
:dSL
echo.     Starting GUI (%dL:\=/%)
echo [!date! @ !time!]     Starting GUI (%dL:\=/%) >> "%rD%\tmp\systemLog"
if not exist "%rD%\%dL%" set /a sEC=sEC+1 & echo [!date! @ !time!]          ERROR^^! File (/%dL:\=/%) does not exist >> "%rD%\tmp\systemLog"
if not "%sEC%"=="0" echo [!date! @ !time!]     System halted with (%sEC%) errors >> "%rD%\tmp\systemLog" & echo ERROR^^! Please check the log file located at (/tmp/systemLog) for more information & pause & exit
call "%rD%\%dL%"
echo. >> "%rD%\tmp\systemLog"
echo echo [!date! @ !time!]     ^^!Desktop GUI crashed with errorlevel (%errorlevel%)^^! >> "%rD%\tmp\systemLog"
echo ERROR^^! Please check the log file located at (/tmp/systemLog) for more information
pause
exit
:l
certutil -decode "%~1" "%rD%\tmp\currentLoadedFile"
type "%rD%\tmp\currentLoadedFile" | cmd /q /k "@echo off"
del "%rD%\tmp\currentLoadedFile"
exit /b 0
:h
ping 127.1 -n 2 > nul & exit /b 0
exit /b 1