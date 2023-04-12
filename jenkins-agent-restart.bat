@echo off

REM Set the log file path and name
set CURRENT_DIR="%CD%"
set LOG_FILE=%CURRENT_DIR%\jenkins-agent-restart.log

REM Clear previous logs
echo. >> %LOG_FILE%

REM Change directory and restart Jenkins agent
cd /d C:\agent
echo [%date% %time%] Changed directory to: %CD% >> %LOG_FILE%
echo [%date% %time%] Output of jenkins-agent.exe restart: >> %LOG_FILE%
jenkins-agent.exe restart 2>&1 >> %LOG_FILE%

if %errorlevel% equ 0 (
  echo [%date% %time%] Jenkins agent restarted successfully. >> %LOG_FILE%
) else (
  echo [%date% %time%] Failed to restart Jenkins agent. Error code: %errorlevel% >> %LOG_FILE%
)

REM End of batch file
echo "Batch file finished."
