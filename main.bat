
set CURRENT_DIR=%cd%

:download_jdk11
rem jdk-11.0.2
bitsadmin.exe /transfer "donwnload jdk-11.0.2" https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_windows-x64_bin.zip  %CURRENT_DIR%\openjdk-11.0.2_windows-x64_bin.zip
tar -xf openjdk-11.0.2_windows-x64_bin.zip

:download_agnet
bitsadmin.exe /transfer "donwload jenkins-agent.exe" https://github.com/winsw/winsw/releases/download/v2.11.0/WinSW-x64.exe %CURRENT_DIR%\jenkins-agent.exe

