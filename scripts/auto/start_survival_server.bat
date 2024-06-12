@echo off
setlocal

REM Check if winget is installed
powershell Write-Host "Current Winget version: " -NoNewline -ForegroundColor Yellow
winget --version
if %errorlevel% neq 0 (
    echo Winget is not installed. Installing...
    REM Install winget
    powershell -Command "$ProgressPreference = 'silentlyContinue'; Write-Information 'Downloading WinGet and its dependencies...'; Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle; Add-AppxPackage -Path Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    if %errorlevel% neq 0 (
        echo Failed to install winget. Please ensure you have internet connectivity and try again.
        pause
        exit /b 1
    )
)

REM Function to check if Python is installed
call :check_python
REM Function to check if pip is installed
call :check_pip

REM Function to check if Python is installed
:check_python
    if not "%PYTHON_CHECKED%"=="yes" (
        powershell Write-Host "Current Python version: " -NoNewline -ForegroundColor Yellow
        python --version
        if %errorlevel% neq 0 (
            echo Python is not installed. Installing...
            goto install_python
        )
        set "PYTHON_CHECKED=yes"
    )
    goto :eof

REM Function to check if pip is installed
:check_pip
    powershell Write-Host "Current Pip version: " -NoNewline -ForegroundColor Yellow
    pip --version
    if %errorlevel% neq 0 (
        echo Pip is not installed. Installing...
        goto install_pip
    )
    goto :eof

REM Function to install Python
:install_python
    echo Installing Python via winget...
    winget install --id Python.Python -e
    if %errorlevel% neq 0 (
        echo Failed to install Python. Please ensure you have internet connectivity and try again.
        pause
        exit /b 1
    ) powershell Write-Host "Winget installed." -ForegroundColor Blue
    call :check_pip
    goto :eof

REM Function to install pip
:install_pip
    echo Installing pip...
    python -m ensurepip
    python -m pip install --upgrade pip
    if %errorlevel% neq 0 (
        echo Failed to install pip. Please ensure you have internet connectivity and try again.
        pause
        exit /b 1
    ) powershell Write-Host "Pip is installed." -ForegroundColor Blue

    goto continue

:continue

REM Check if colorama is installed by trying to import it with Python
python -c "import colorama" >nul 2>&1
if %errorlevel% neq 0 (
    echo Colorama not found. Installing...
    pip install colorama
    if %errorlevel% neq 0 (
        echo Failed to install Colorama. Please ensure you have internet connectivity and try again.
        pause
        exit /b 1
    ) else powershell Write-Host "Colorama imported." -ForegroundColor Blue

)

REM Define directories
set "LOG_DIR=docs\logs\errors"
set "LOG_FILE=error_log.html"

REM Generate a unique log file name with the current date and time
set "TIMESTAMP=%DATE:/=-%_%TIME::=-%"
set "TIMESTAMP=%TIMESTAMP: =0%"
set "LOG_FILE_WITH_TIMESTAMP=%LOG_FILE%_%TIMESTAMP%.html"

REM Create necessary directories if they do not exist
if not exist "%LOG_DIR%" (
    echo Creating log directories...
    mkdir "%LOG_DIR%"
)

REM Run the Python script to start the Minecraft server and capture logs
echo Starting Minecraft server and logging errors...
python log_errors.py > "%LOG_DIR%\%LOG_FILE_WITH_TIMESTAMP%"
if %errorlevel% neq 0 (
    echo Failed to start the Minecraft server. Please check the log_errors.py script for errors.
    pause
    exit /b 1
)

REM Inform the user where the log files are located
echo The error log has been saved to %LOG_DIR%\%LOG_FILE_WITH_TIMESTAMP%
pause
exit /b
