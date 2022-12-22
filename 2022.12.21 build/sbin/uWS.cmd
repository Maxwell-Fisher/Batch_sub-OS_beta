set wSC=0
for /f "tokens=2" %%i in ('mode con ^| find "Lines:"') do if not "%wH%"=="%%i" (set "wSC=1")
for /f "tokens=2" %%i in ('mode con ^| find "Columns:"') do if not "%wW%"=="%%i" (set "wSC=1")
if "%wSC%"=="1" (mode %wW%, %wH%)
