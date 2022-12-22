cls
title Desktop - Max's Batch OS
echo [!date! @ !time!]          GUI started^^! >> "%rD%\tmp\systemLog"
call :dL
pause
exit /b 1
:dL
echo.!esc![?25l
call "%rD%\sbin\uWS"
title Desktop - Max's Batch OS
if "!aL!"=="1" cls
set aL=0
echo|set /p="!esc![0;0H"
call :rDE
"%rD%\sbin\gI.exe" /T 10000
if %errorlevel% gtr 0 (goto dL) else (set /A "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
set /a col=col+1
set /a row=row+1
if !col! lss 32768 (if !col! geq 3 (if !row! geq 30 (if !col! leq 22 (if !row! leq 39 (echo [!date! @ !time!]          Starting ^(/bin/paint^) >> "%rD%\tmp\systemLog"
set aL=1
call "%rD%\bin\paint"
echo [!date! @ !time!]               Program closed with errorlevel ^(!errorlevel!^) >> "%rD%\tmp\systemLog"))))
if !col! geq 3 (if !row! geq 15 (if !col! leq 22 (if !row! leq 24 (echo [!date! @ !time!]          Starting ^(/bin/calculator^) >> "%rD%\tmp\systemLog"
set aL=1
call "%rD%\bin\calculator"
echo [!date! @ !time!]               Program closed with errorlevel ^(!errorlevel!^) >> "%rD%\tmp\systemLog"))))
if !col! geq 108 (if !row! geq 29 (if !col! leq 117 (if !row! leq 39 (echo [!date! @ !time!]          Starting ^(/sbin/about^) >> "%rD%\tmp\systemLog"
set aL=1
call "%rD%\sbin\about"
echo [!date! @ !time!]               Program closed with errorlevel ^(!errorlevel!^) >> "%rD%\tmp\systemLog"))))
call "%rD%\sbin\dEB" cIP && del /Q "%rD%\tmp\*" && exit
if "!row!" equ "2" (if "%l%"=="english" (if !col! geq 102 (if !col! leq 109 (echo [!date! @ !time!]          Starting ^(/sbin/settings^) >> "%rD%\tmp\systemLog"
set aL=1
call "%rD%\sbin\settings"
echo [!date! @ !time!]               Program closed with errorlevel ^(!errorlevel!^) >> "%rD%\tmp\systemLog")))
if "%l%"=="svenska" (if !col! geq 97 (if !col! leq 109 (echo [!date! @ !time!]          Starting ^(/sbin/settings^) >> "%rD%\tmp\systemLog"
set aL=1
call "%rD%\sbin\settings"
echo [!date! @ !time!]               Program closed with errorlevel ^(!errorlevel!^) >> "%rD%\tmp\systemLog"))))))
goto dL
exit /b 1
:rDE
call "%rD%\sbin\dEB" background
if "%l%"=="english" (call "%rD%\sbin\d" "ÚÄÄÄÄÄÄÄÄÄÄ¿" 100 1
call "%rD%\sbin\d" "³ !esc![44m!esc![97m!esc![1mSETTINGS!esc![0m ³" 100 2
call "%rD%\sbin\d" "ÀÄÄÄÄÄÄÄÄÄÄÙ" 100 3)
if "%l%"=="svenska" (call "%rD%\sbin\d" "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿" 95 1
call "%rD%\sbin\d" "³ !esc![44m!esc![97m!esc![1mINSTLLNINGAR!esc![0m ³" 95 2
call "%rD%\sbin\d" "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ" 95 3)
if "%tF%"=="HH:mm" (call "%rD%\sbin\d" "³   %time:~0,5%    ³" 53 1)
if "%tF%"=="h:mm" (call "%rD%\sbin\d" "³   %time:~0,5%    ³" 53 1)
if "%dateFormat%"=="yyyy-MM-dd" (call "%rD%\sbin\d" "³ %date% ³" 53 2)
if "%dateFormat%"=="M/d/yyyy" (call "%rD%\sbin\d" "³ %date:~10,4%-%date:~4,2%-%date:~7,2% ³" 53 2)
call "%rD%\sbin\d" "ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ" 53 3
call "%rD%\sbin\s" calculator-logo 3 15
if "%l%"=="english" call "%rD%\sbin\d" "Calculator" 8 13
if "%l%"=="svenska" call "%rD%\sbin\d" "Calculator" 9 13
call "%rD%\sbin\s" paint-logo 3 30
if "%l%"=="english" call "%rD%\sbin\d" "Paint" 10 28
if "%l%"=="svenska" call "%rD%\sbin\d" "M†la duk" 9 28
call "%rD%\sbin\s" questionmark 108 29
if "%l%"=="english" call "%rD%\sbin\d" "About" 110 27
if "%l%"=="svenska" call "%rD%\sbin\d" "Om datorprogrammet" 102 27
call "%rD%\sbin\d" "!esc![1;31m!esc![1mDevelopment version - unauthorized copying is not permitted!esc![0m" 30 38
call "%rD%\sbin\d" "!esc![1;31m!esc![1mVersion !vN!!esc![0m" 48 39
exit /b 0
