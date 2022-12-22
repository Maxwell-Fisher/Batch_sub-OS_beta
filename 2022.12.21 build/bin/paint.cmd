setLocal
set pS=2
set mP=16
echo. > "%rD%\tmp\paintTmp"
if not exist "%rD%\home\%username%\paintProjects" mkdir "%rD%\home\%username%\paintProjects"
set pPC=0
set lRed=!esc![101m !esc![0m
set lGreen=!esc![102m !esc![0m
set lYellow=!esc![103m !esc![0m
set lBlue=!esc![104m !esc![0m
set lMagenta=!esc![105m !esc![0m
set lCyan=!esc![106m !esc![0m
set lWhite=!esc![107m !esc![0m
set lBlack=!esc![100m !esc![0m
set dRed=!esc![41m !esc![0m
set dGreen=!esc![42m !esc![0m
set dYellow=!esc![43m !esc![0m
set dBlue=!esc![44m !esc![0m
set dMagenta=!esc![45m !esc![0m
set dCyan=!esc![46m !esc![0m
set dWhite=!esc![47m !esc![0m
set dBlack=!esc![40m !esc![0m
set cC=!dBlack!
set wB=!wW!
set hB=!wH!
:b
title Max's Batch paint tool - Loading...
echo !esc![0;0H!esc![100m
for /l %%w in (5, 1, !wH!) do (for /l %%x in (5, 16, !wW!) do (echo !esc![%%w;%%xH!esc![107m                !esc![0;0H!esc![0m))
for /l %%x in (0, 4, !wW!) do (echo !esc![100m!esc![1;%%xH    !esc![2;%%xH    !esc![3;%%xH    !esc![4;%%xH    !esc![0m)
for /l %%w in (1, 1, !wH!) do (echo !esc![%%w;1H!esc![100m    !esc![0;0H!esc![0m)
call "%rD%\sbin\d" "!dBlack!!dBlack!!lBlack!!lBlack!!dRed!!dRed!!dYellow!!dYellow!!dGreen!!dGreen!!dCyan!!dCyan!!dBlue!!dBlue!!dMagenta!!dMagenta!" 70 2
call "%rD%\sbin\d" "!lWhite!!lWhite!!dWhite!!dWhite!!lRed!!lRed!!lYellow!!lYellow!!lGreen!!lGreen!!lCyan!!lCyan!!lBlue!!lBlue!!lMagenta!!lMagenta!" 70 3
call "%rD%\sbin\dEB"
call "%rD%\sbin\d" "!esc![97m!esc![40m!NEW" 10 2
call "%rD%\sbin\d" "!esc![97m!esc![40m!LOAD" 15 2
call "%rD%\sbin\d" "!esc![97m!esc![40m!SAVE" 21 2
call :rFM
:dL
if "%pS%"=="0" if "%pPC%"=="0" title Max's Batch paint tool - New file (Unsaved)
if "%pS%"=="0" if not "%pPC%"=="0" title Max's Batch paint tool - File #%pPC% (Unsaved)
if "%pS%"=="1" title Max's Batch paint tool - File #%pPC% (Saved)
if "%pS%"=="2" title Max's Batch paint tool - New file
if "%pS%"=="3" title Max's Batch paint tool - New file (Unable to save)
call "%rD%\sbin\uWS"
if "%wSC%"=="1" goto b
call "%rD%\sbin\d" "!cC!!cC!" 64 2
"%rD%\sbin\gI.exe" /T 10000
if %errorlevel% gtr 0 (goto dL) else (set /a "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
set /a "col=col+1, row=row+1"
if !col! lss 32768 (if !col! gtr 4 (if !row! gtr 4 (if !col! leq !wW! (if !row! leq !wH! (set pS=0
echo.!esc![!row!;!col!H!cC!!esc![0;0H
echo.!esc![!row!;!col!H!cC!>> "%rD%\tmp\paintTmp"
goto dL))))
if "!row!"=="2" (call "%rD%\sbin\dEB" cIP && endLocal && exit /b 0
if "!col!" geq "10" (if "!col!" leq "12" (if not "!pS!"=="2" (set pPC=0
set pS=2
echo. > "%rD%\tmp\paintTmp"
set col=0 & set row=0
goto b)))
if "!col!" geq "15" (if "!col!" leq "18" (if not "%pS%"=="0" (set col=0 & set row=0
call :lP
goto b)))
if "!col!" geq "21" (if "!col!" leq "24" (if not "%pS%"=="1" (call :sP
goto dL)))
if !col! geq 70 (if !col! leq 85 (if "!col!"=="70" set cC=!dBlack!
if "!col!"=="71" set cC=!dBlack!
if "!col!"=="72" set cC=!lBlack!
if "!col!"=="73" set cC=!lBlack!
if "!col!"=="74" set cC=!dRed!
if "!col!"=="75" set cC=!dRed!
if "!col!"=="76" set cC=!dYellow!
if "!col!"=="77" set cC=!dYellow!
if "!col!"=="78" set cC=!dGreen!
if "!col!"=="79" set cC=!dGreen!
if "!col!"=="80" set cC=!dCyan!
if "!col!"=="81" set cC=!dCyan!
if "!col!"=="82" set cC=!dBlue!
if "!col!"=="83" set cC=!dBlue!
if "!col!"=="84" set cC=!dMagenta!
if "!col!"=="85" set cC=!dMagenta!)))
if "!row!"=="3" (if !col! geq 70 (if !col! leq 85 (if "!col!"=="70" set cC=!lWhite!
if "!col!"=="71" set cC=!lWhite!
if "!col!"=="72" set cC=!dWhite!
if "!col!"=="73" set cC=!dWhite!
if "!col!"=="74" set cC=!lRed!
if "!col!"=="75" set cC=!lRed!
if "!col!"=="76" set cC=!lYellow!
if "!col!"=="77" set cC=!lYellow!
if "!col!"=="78" set cC=!lGreen!
if "!col!"=="79" set cC=!lGreen!
if "!col!"=="80" set cC=!lCyan!
if "!col!"=="81" set cC=!lCyan!
if "!col!"=="82" set cC=!lBlue!
if "!col!"=="83" set cC=!lBlue!
if "!col!"=="84" set cC=!lMagenta!
if "!col!"=="85" set cC=!lMagenta!)))))
goto dL
:sP
	if not "!pS!" == "2" (
		if "!pPC!" == "0" (
			for /l %%x in (1, 1, %mP%) do (
				if "!pPC!" == "0" (
					if not exist "%rD%\home\%username%\paintProjects\project_%%x" set pPC=%%x
				)
			)
		)
		if !pPC! leq %mP% (
			if not "!pPC!" == "0" (
				title Max's Batch paint tool - File #%pPC% (Saving...)
				echo. > "%rD%\home\%username%\paintProjects\project_!pPC!"
				set lSL=
				for /F "usebackq tokens=*" %%x in ("%rD%\tmp\paintTmp") do (
					if not "%%x" == "!lSL!" echo %%x>> "%rD%\home\%username%\paintProjects\project_!pPC!"
					set "lSL=%%x"
				)
				set pS=1
			) else (
				set pS=3
			)
		) else (
			set pS=3
		)
	)
exit /b
:lP
for /l %%x in (1, 1, %mP%) do (if exist "%rD%\home\%username%\paintProjects\project_%%x" set pPH=%%x)
set eP=0
for /l %%x in (1, 1, %mP%) do (if exist "%rD%\home\%username%\paintProjects\project_%%x" (set /a eP=eP+1
set /a pOLocation=eP+4
set pO!pOLocation!=%%x))
set /a pLwH=eP+5
set /a lPH=eP+4
for /l %%w in (2, 1, !pLwH!) do (for /l %%x in (15, 1, 29) do (echo !esc![%%w;%%xH!esc![100m!esc![30m+!esc![0;0H!esc![0m))
echo !esc![3;16H!esc![47m!esc![30mSaved files: !esc![0;0H!esc![0m
echo !esc![4;16H!esc![47m             !esc![0;0H!esc![0m
if "!eP!"=="0" echo !esc![4;16H!esc![47m!esc![30mNone found!esc![0;0H!esc![0m
set pPN=4
for /l %%x in (1, 1, %mP%) do (set pN=0%%x
if exist "%rD%\home\%username%\paintProjects\project_%%x" set /a pPN=pPN+1 & echo !esc![!pPN!;16H!esc![47m!esc![30m[Drawing #!pN:~-2!]!esc![0;0H!esc![0m)
:gIFLM
"%rD%\sbin\gI.exe"
if "%errorlevel%" gtr 0 (exit /b 0) else (set /a "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
set /a "col=col+1, row=row+1"
if !col! lss 32768 (if !col! geq 15 (if !row! geq 2 (if !col! leq 28! (if !row! leq !pLwH! (if !col! geq 16 (if !row! geq 5 (if !col! leq 27! (if !row! leq !lPH! (call :lFC
set pS=1) else (goto gIFLM)) else (goto gIFLM)) else (goto gIFLM)) else (goto gIFLM)) else (exit /b)) else (exit /b)) else (exit /b)) else (exit /b)))
exit /b
:rFM
if exist "%rD%\tmp\paintTmp" (for /F "usebackq tokens=*" %%A in ("%rD%\tmp\paintTmp") do (echo.%%A!esc![0;0H))
exit /b
:lFC
type "%rD%\home\%username%\paintProjects\project_!pO%row%!" > "%rD%\tmp\paintTmp"
set pPC=!pO%row%!
exit /b
exit /b 1
