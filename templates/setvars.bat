@echo off
SET CWD=%~dp0
:: normalize
for %%i in ("%CWD%") do SET "INST_DIR=%%~fi"
SETX CPP4BIO %INST_DIR%
SET CPP4BIO_MSYS2=%INST_DIR%msys64
SETX CPP4BIO_MSYS2 %CPP4BIO_MSYS2%
SETX PATH %CPP4BIO_MSYS2%\msys64\usr\bin\;%CPP4BIO_MSYS2%\mingw64\bin\;%CPP4BIO_MSYS2%\ucrt64\bin\;%INST_DIR%vscode\bin\;%PATH%
