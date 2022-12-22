title Settings - Max's Batch OS
cls
:dL
cls
echo.!esc![?25l
call "%rD%\sbin\uWS"
echo.!esc![0;0H
call "%rD%\sbin\dEB" background
if "%l%"=="english" call "%rD%\sbin\d" "Reset to default" 5 2
if "%l%"=="svenska" call "%rD%\sbin\d" "terst„ll till standardinst„llningarna" 5 2
if "%l%"=="english" call "%rD%\sbin\d" "Language:" 5 6
if "%l%"=="svenska" call "%rD%\sbin\d" "Spr†k:" 5 6
call "%rD%\sbin\d" "English" 5 8
call "%rD%\sbin\d" "Svenska" 5 9
if "%l%"=="english" call "%rD%\sbin\d" "Window size:" 35 6
if "%l%"=="svenska" call "%rD%\sbin\d" "Bildsk„rmstorlek:" 35 6
if "%l%"=="english" call "%rD%\sbin\d" "Increase" 35 8
if "%l%"=="english" call "%rD%\sbin\d" "Decrease" 35 9
if "%l%"=="svenska" call "%rD%\sbin\d" "™ka" 35 8
if "%l%"=="svenska" call "%rD%\sbin\d" "Minska" 35 9
"%rD%\sbin\gI.exe"
if %errorlevel% gtr 0 (goto dL) else (set /A "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
set /a col=col+1
set /a row=row+1
if !col! lss 32768 (call "%rD%\sbin\dEB" cIP && exit /b 0
if "%l%"=="english" (if !row! equ 2 (if !col! geq 5 (if !col! leq 20 (set l=english
set wW=120
set wH=40
echo | set /p="english" > "%rD%\etc\l"
echo | set /p="120" > "%rD%\etc\wW"
echo | set /p="40" > "%rD%\etc\wH"))))
if "%l%"=="svenska" (if !row! equ 2 (if !col! geq 5 (if !col! leq 42 (set l=english
set wW=120
set wH=40
echo | set /p="english" > "%rD%\etc\l"
echo | set /p="120" > "%rD%\etc\wW"
echo | set /p="40" > "%rD%\etc\wH"))))
if !row! equ 8 (if !col! geq 5 (if !col! leq 11 (set l=english
echo | set /p="english" > "%rD%\etc\l")))
if !row! equ 9 (if !col! geq 5 (if !col! leq 11 (set l=svenska
echo | set /p="svenska" > "%rD%\etc\l")))
if "%l%"=="english" (if !row! equ 8 (if !col! geq 35 (if !col! leq 41 (set /a wW=wW+3
set /a wH=wH+1)))
if !row! equ 9 (if !col! geq 35 (if !col! leq 41 (set /a wW=wW-3
set /a wH=wH-1))))
if "%l%"=="svenska" (if !row! equ 8 (if !col! geq 35 (if !col! leq 37 (set /a wW=wW+3
set /a wH=wH+1)))
if !row! equ 9 (if !col! geq 35 (if !col! leq 40 (set /a wW=wW-3
set /a wH=wH-1))))))
goto dL
