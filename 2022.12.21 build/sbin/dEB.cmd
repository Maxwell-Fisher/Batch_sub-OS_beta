if "%1"=="cIP" (if "%l%"=="english" (if !col! geq 115 (if !row! geq 2 (if !col! leq 118 (if !row! leq 2 (exit /b 0)))))
if "%l%"=="svenska" (if !col! geq 114 (if !row! geq 2 (if !col! leq 118 (if !row! leq 2 (exit /b 0)))))
exit /b 1)
if not "%1"=="cIP" (if "%1"=="background" (if "%l%"=="english" (call "%rD%\sbin\d" "������Ŀ" 113 1
call "%rD%\sbin\d" "� !esc![41m!esc![97m!esc![1mEXIT!esc![0m �" 113 2
call "%rD%\sbin\d" "��������" 113 3)
if "%l%"=="svenska" (call "%rD%\sbin\d" "�������Ŀ" 112 1
call "%rD%\sbin\d" "� !esc![41m!esc![97m!esc![1mSLUTA!esc![0m �" 112 2
call "%rD%\sbin\d" "���������" 112 3)) else (if "%l%"=="english" (call "%rD%\sbin\d" "!esc![41m!esc![97m!esc![1mEXIT!esc![0m" 115 2)
if "%l%"=="svenska" (call "%rD%\sbin\d" "!esc![41m!esc![97m!esc![1mSLUTA!esc![0m" 114 2)))