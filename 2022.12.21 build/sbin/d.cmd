:draw
setLocal
set "pT=%~1"
echo.!esc![0m!esc![%3;%2H!pT!!esc![0;0H!esc![0m
endLocal
exit /b 0