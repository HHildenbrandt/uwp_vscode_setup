@echo off
SET CWD=%~dp0
:: normalize
for %%i in ("%CWD%") do SET "INST_DIR=%%~fi"

SETX MSYS "%INST_DIR%msys64"
SETX PATH %MSYS%\usr\bin\;%MSYS%\mingw64\bin\;%MSYS%\ucrt64\bin\;%INST_DIR%vscode\bin\;%PATH%
::code --disable-gpu --no-sandbox projects