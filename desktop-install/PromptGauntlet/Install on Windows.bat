@echo off
rem Prompt Gauntlet installer for Windows.
rem Installs the skill for Claude Code / the Claude desktop app's Code tab,
rem and puts the interactive tool on your Desktop.
setlocal
set "HERE=%~dp0"
set "DEST=%USERPROFILE%\.claude\skills\prompt-gauntlet"
if not exist "%DEST%" mkdir "%DEST%"
xcopy "%HERE%skill\prompt-gauntlet" "%DEST%" /E /I /Y /Q >nul
for /f "usebackq delims=" %%D in (`powershell -NoProfile -Command "[Environment]::GetFolderPath('Desktop')"`) do set "DESK=%%D"
if "%DESK%"=="" set "DESK=%USERPROFILE%\Desktop"
copy /Y "%HERE%Prompt Gauntlet.html" "%DESK%\Prompt Gauntlet.html" >nul
echo.
echo Prompt Gauntlet installed.
echo   Skill: %DEST%
echo   Tool:  %DESK%\Prompt Gauntlet.html
echo.
echo Restart Claude, then say: run this through the gauntlet
echo.
pause
