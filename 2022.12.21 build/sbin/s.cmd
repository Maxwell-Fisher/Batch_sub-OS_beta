:s
setLocal
set tSY=%3
set tSX=%2
for /f "tokens=* delims=" %%a in ('type "%rD%\media\%1"') do (echo !esc![!tSY!;!tSX!H!esc![0m%%a!esc![0m!esc![0;0H
set /a tSY=tSY+1)
endLocal
exit /b 0