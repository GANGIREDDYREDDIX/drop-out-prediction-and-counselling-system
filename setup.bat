@echo off
REM Dropout Prediction System Setup Script for Windows

setlocal enabledelayedexpansion

REM Color codes
cls
echo.
echo ======================================
echo 🚀 Dropout Prediction System Setup
echo ======================================
echo.

REM Check if Python is installed
echo [1/6] Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed
    echo Please install Python 3.9+ from https://www.python.org/downloads/
    echo During installation, CHECK "Add Python to PATH"
    pause
    exit /b 1
)
python --version
echo ✅ Python found
echo.

REM Check if Node.js is installed
echo [2/6] Checking Node.js installation...
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js is not installed
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)
node --version
echo ✅ Node.js found
echo.

REM Create Python virtual environment
echo [3/6] Creating Python virtual environment...
if exist venv (
    echo Virtual environment already exists. Skipping creation.
) else (
    python -m venv venv
    if errorlevel 1 (
        echo ❌ Failed to create virtual environment
        pause
        exit /b 1
    )
    echo ✅ Virtual environment created
)
echo.

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Install backend dependencies
echo [4/6] Installing Python dependencies...
pip install -q fastapi uvicorn pydantic email-validator
if errorlevel 1 (
    echo ❌ Failed to install backend dependencies
    pause
    exit /b 1
)
echo ✅ Backend dependencies installed
echo.

REM Install frontend dependencies
echo [5/6] Installing Node.js dependencies...
cd frontend-react
call npm install -q
if errorlevel 1 (
    echo ❌ Failed to install frontend dependencies
    cd ..
    pause
    exit /b 1
)
echo ✅ Frontend dependencies installed
cd ..
echo.

REM Create environment files
echo [6/6] Creating environment files...

REM Backend .env.example
(
    echo # Gmail Configuration (Optional - already configured in notifier.py^)
    echo # EMAIL=your-gmail@gmail.com
    echo # PASSWORD=your-app-password
    echo # SMTP_SERVER=smtp.gmail.com
    echo # SMTP_PORT=465
) > backend\.env.example

REM Frontend .env
(
    echo REACT_APP_API_URL=http://127.0.0.1:8000
    echo BROWSER=none
) > frontend-react\.env

echo ✅ Environment files created
echo.

REM Final message
echo ======================================
echo ✅ Setup Complete!
echo ======================================
echo.

echo Next steps:
echo.
echo 1. Start Backend Server (in a new Command Prompt):
echo    cd /path/to/project
echo    venv\Scripts\activate
echo    cd backend
echo    python -m uvicorn app:app --host 127.0.0.1 --port 8000
echo.
echo 2. Start Frontend Server (in another Command Prompt):
echo    cd /path/to/project
echo    cd frontend-react
echo    npm start
echo.
echo 3. Open in Browser:
echo    http://localhost:3000
echo.
echo For detailed instructions, read SETUP_GUIDE.md
echo.

pause
