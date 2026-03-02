@echo off
title J.A.R.V.I.S. Setup
color 0B
echo.
echo  ================================================================
echo    J.A.R.V.I.S.  ^|  Setup
echo  ================================================================
echo.

python --version >nul 2>&1
if errorlevel 1 ( echo  [ERROR] Python not found. Install 64-bit Python 3.11 from python.org & pause & exit /b 1 )

python -c "import struct; assert struct.calcsize('P')*8==64" >nul 2>&1
if errorlevel 1 ( echo  [ERROR] 32-bit Python detected. Install 64-bit version. & pause & exit /b 1 )
echo  [+] 64-bit Python confirmed.

echo  [+] Creating virtual environment...
python -m venv venv
if errorlevel 1 ( echo  [ERROR] venv failed. Delete the venv folder and try again. & pause & exit /b 1 )

call venv\Scripts\activate.bat

echo  [+] Upgrading pip...
python -m pip install --upgrade pip -q

echo  [+] Installing packages...
pip install flask flask-cors python-dotenv -q
pip install "groq==0.9.0" "httpx==0.27.2" -q
pip install pygame requests keyboard -q
pip install numpy --only-binary=:all: -q
pip install sounddevice soundfile -q
pip install psutil pyautogui Pillow -q
pip install pandas openpyxl --only-binary=:all: -q

echo.
echo  ================================================================
echo    Setup complete!
echo.
echo    1. Open .env and fill in both API keys:
echo         GROQ_API_KEY       -> https://console.groq.com  (free)
echo         ELEVENLABS_API_KEY -> https://elevenlabs.io     (free tier)
echo.
echo    2. Right-click launch.bat -> Run as Administrator
echo       (needed for the ` hotkey to work globally)
echo.
echo    3. Open Chrome/Edge at http://127.0.0.1:5000
echo  ================================================================
echo.
pause
