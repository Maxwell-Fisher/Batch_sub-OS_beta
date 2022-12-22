setLocal
title About - Max's Batch OS
cls
:dL
echo.!esc![?25l
call "%rD%\sbin\uWS"
echo.!esc![0;0H
echo Max's Batch based sub-operating system
echo.
echo !esc![4mhttps://maxwellcrafter.com!esc![0m
echo.
echo !esc![4mhttps://github.com/Maxwell-Fisher/Batch_sub-OS!esc![0m
call "%rD%\sbin\dEB" background
call "%rD%\sbin\s" license 33 15
"%rD%\sbin\gI.exe"
if %errorlevel% gtr 0 (goto dL) else (set /A "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
set /a col=col+1
set /a row=row+1
if !col! lss 32768 (call "%rD%\sbin\dEB" cIP && endLocal && exit /b 0
if !col! geq 0 (if !row! geq 4 (if !col! leq 26 (if !row! leq 4 (start https://maxwellcrafter.com))))
if !col! geq 0 (if !row! geq 6 (if !col! leq 46 (if !row! leq 6 (start https://github.com/Maxwell-Fisher/Batch_sub-OS))))))
goto dL
