@echo off
SET CWD=%~dp0..\..\
:: normalize
for %%i in ("%CWD%") do SET "INST_DIR=%%~fi"

rmdir /s /q "build" 2>nul
SET MSYS=%INST_DIR%msys64
SET VSCODE_DIR=%INST_DIR%vscode\bin
SET PATH=%MSYS%\usr\bin\;%MSYS%\mingw64\bin\;%MSYS%\ucrt64\bin\;%VSCODE_DIR%\;%PATH%
%VSCODE_DIR%\code --disable-gpu --no-sandbox .
