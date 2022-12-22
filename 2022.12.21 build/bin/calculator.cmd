setLocal
:b
title Max's Batch calculator - Loading...
echo !esc![0;0H!esc![100m
echo !esc![0;0H!esc![100m
for /l %%w in (7, 1, 34) do (for /l %%x in (45, 1, 76) do (echo !esc![%%w;%%xH!esc![48;5;236m !esc![0;0H!esc![0m))
for /l %%w in (8, 1, 13) do (for /l %%x in (46, 1, 75) do (echo !esc![%%w;%%xH!esc![48;5;235m !esc![0;0H!esc![0m))
for /l %%w in (9, 1, 11) do (for /l %%x in (47, 1, 74) do (echo !esc![%%w;%%xH!esc![38;5;236m!esc![48;5;65m±!esc![0;0H!esc![0m))
for /l %%x in (46, 1, 76) do (echo !esc![35;%%xH!esc![38;5;234m²!esc![0;0H!esc![0m)
for /l %%w in (8, 1, 35) do (echo !esc![%%w;77H!esc![38;5;234m²!esc![0;0H!esc![0m)
for /l %%w in (16, 2, 33) do (for /l %%x in (47, 6, 73) do (echo !esc![%%w;%%xH!esc![48;5;234m    !esc![0;0H!esc![0m))
echo !esc![32;47H!esc![48;5;234mCE/C!esc![0;0H!esc![0m
for /l %%w in (26, 2, 33) do (for /l %%x in (53, 6, 67) do (echo !esc![%%w;%%xH!esc![48;5;187m    !esc![0;0H!esc![0m))
echo !esc![18;47H!esc![38;5;52m!esc![48;5;187m2nd !esc![0;0H!esc![0m
echo !esc![26;53H!esc![38;5;52m!esc![48;5;187m7   !esc![0;0H!esc![0m
echo !esc![26;59H!esc![38;5;52m!esc![48;5;187m8   !esc![0;0H!esc![0m
echo !esc![26;65H!esc![38;5;52m!esc![48;5;187m9   !esc![0;0H!esc![0m
echo !esc![28;53H!esc![38;5;52m!esc![48;5;187m4   !esc![0;0H!esc![0m
echo !esc![28;59H!esc![38;5;52m!esc![48;5;187m5   !esc![0;0H!esc![0m
echo !esc![28;65H!esc![38;5;52m!esc![48;5;187m6   !esc![0;0H!esc![0m
echo !esc![30;53H!esc![38;5;52m!esc![48;5;187m1   !esc![0;0H!esc![0m
echo !esc![30;59H!esc![38;5;52m!esc![48;5;187m2   !esc![0;0H!esc![0m
echo !esc![30;65H!esc![38;5;52m!esc![48;5;187m3   !esc![0;0H!esc![0m
echo !esc![32;53H!esc![38;5;52m!esc![48;5;187m0   !esc![0;0H!esc![0m
echo !esc![32;59H!esc![38;5;52m!esc![48;5;187m.   !esc![0;0H!esc![0m
echo !esc![32;65H!esc![38;5;52m!esc![48;5;187m+/- !esc![0;0H!esc![0m
for /l %%w in (22, 2, 33) do (echo !esc![%%w;71H!esc![48;5;52m    !esc![0;0H!esc![0m)
echo !esc![31;71H!esc![48;5;52m    !esc![0;0H!esc![0m
echo !esc![30;71H!esc![38;5;153m!esc![48;5;52m=   !esc![0;0H!esc![0m
echo !esc![28;71H!esc![38;5;153m!esc![48;5;52m+   !esc![0;0H!esc![0m
echo !esc![26;71H!esc![38;5;153m!esc![48;5;52m-   !esc![0;0H!esc![0m
echo !esc![24;71H!esc![38;5;153m!esc![48;5;52mx   !esc![0;0H!esc![0m
echo !esc![22;71H!esc![38;5;153m!esc![48;5;52m/   !esc![0;0H!esc![0m
set bDT=±±±±±±±±±±±±±±±±±±±±±±±±±±±
set cDN=
set cNI=
title Max's Batch calculator
:mL
set cDT=%bDT%%cDN%
set cDT=%cDT:~-26%
echo !esc![10;48H!esc![38;5;236m!esc![48;5;65m%cDT%!esc![0;0H!esc![0m
call "%rD%\sbin\uWS"
if "%wSC%"=="1" goto b
"%rD%\sbin\gI.exe"
if %errorlevel% gtr 0 (goto mL) else (set /a "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
set /a "col=col+1, row=row+1"
if !col! lss 32768 (if !col! geq 45 (if !row! geq 7 (if !col! leq 76 (if !row! leq 34 (if !row!==22 (if !col! geq 71 (if !col! leq 74 (set cDN=!cDN!/)))
if !row!==24 (if !col! geq 71 (if !col! leq 74 (set cDN=!cDN!*)))
if !row!==26 (if !col! geq 53 (if !col! leq 56 (set cDN=!cDN!7))
if !col! geq 59 (if !col! leq 62 (set cDN=!cDN!8))
if !col! geq 65 (if !col! leq 68 (set cDN=!cDN!9))
if !col! geq 71 (if !col! leq 74 (set cDN=!cDN!-)))
if !row!==28 (if !col! geq 53 (if !col! leq 56 (set cDN=!cDN!4))
if !col! geq 59 (if !col! leq 62 (set cDN=!cDN!5))
if !col! geq 65 (if !col! leq 68 (set cDN=!cDN!6))
if !col! geq 71 (if !col! leq 74 (set cDN=!cDN!+)))
if !row!==30 (if !col! geq 53 (if !col! leq 56 (set cDN=!cDN!1))
if !col! geq 59 (if !col! leq 62 (set cDN=!cDN!2))
if !col! geq 65 (if !col! leq 68 (set cDN=!cDN!3)))
if !row!==32 (if !col! geq 47 (if !col! leq 50 (set cDN=))
if !col! geq 53 (if !col! leq 56 (set cDN=!cDN!0))
if !col! geq 59 (if !col! leq 62 (set cDN=!cDN!.))
if !col! geq 65 (if !col! leq 68 (set cDN=!cDN!-)))
if !row! geq 30 (if !row! leq 32 (if !col! geq 71 (if !col! leq 74 (set /a cDN=%cDN%))))
goto mL))))) else (goto mL))
exit /b
exit /b 1
