@echo off
echo Starting Console Launcher...

:: Change to the directory where this .bat file is located
cd /d "%~dp0"

:: Start the Python Flask server in a minimized command prompt window
start "Console Backend" /MIN python app.py

:: Wait for 3 seconds to ensure the Flask server has fully started
echo Waiting for server to initialize...
timeout /t 3 /nobreak > NUL

:: Launch Google Chrome in isolated App/Fullscreen mode
echo Launching Interface...

:: Try 64-bit Chrome first, then 32-bit, then fall back to PATH
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --app=http://127.0.0.1:5000 --start-fullscreen
) else if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --app=http://127.0.0.1:5000 --start-fullscreen
) else (
    start "" chrome --app=http://127.0.0.1:5000 --start-fullscreen
)

exit