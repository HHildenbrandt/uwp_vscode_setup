@echo off

:: install script for vscode + msys2 on UWP (X-Drive)
:: Hanno 2021

setlocal

SET CWD=%~dp0
SET INSTALL_DIR=X:

IF "%~1" == "" GOTO :USE_DEFAULT_INSTALL_DIR
SET INSTALL_DIR=%1
:USE_DEFAULT_INSTALL_DIR

SET PROJECT_DIR=%INSTALL_DIR%\vscode_projects

IF "%~2" == "" GOTO :USE_DEFAULT_PROJECT_DIR
SET PROJECT_DIR=$2
:USE_DEFAULT_PROJECT_DIR

SET MSYS=%INSTALL_DIR%/msys64
SET PATH=%MSYS%/usr/bin/;%MSYS%/mingw64/bin/;%INSTALL_DIR%\vscode\bin\;%PATH%

:: msys2
call :update_pacman_repositories
call :update_msys
call :install_develop_shebang

:: vscode
call :fetch_vscode
call :install_code_extension ms-vscode.cmake-tools
call :install_code_extension ms-vscode.cpptools
:: call :install_code_extension fougas.msys2
call :install_code_extension shd101wyy.markdown-preview-enhanced
call :create_project_dir
exit /B %ERRORLEVEL%

:update_pacman_repositories
:: check disk space seg-faults on UWP - disable it
sed -i 's/^CheckSpace/#CheckSpace/g' %MSYS%/etc/pacman.conf
pacman --noconfirm -Suy
exit /B 0

:update_msys
pacman --noconfirm -Su
exit /B 0

:install_develop_shebang
pacman -S unzip git mingw-w64-x86_64-toolchain mingw-w64-x86_64-cmake mingw-w64-x86_64-ninja
exit /B 0

:fetch_vscode
wget "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -O vscode.zip
unzip vscode.zip -d %INSTALL_DIR%\vscode
del vscode.zip
exit /B 0

:install_code_extension
echo installing %~1
call code %DISABLEGPU% --install-extension %~1 --force
exit /B 0

:create_project_dir
mkdir %PROJECT_DIR%
echo SET PATH=%MSYS%/mingw64/bin/;%INSTALL_DIR%\vscode\bin\;%%PATH%% > %PROJECT_DIR%\launch_vscode.bat
echo code %DISABLEGPU% . >> %PROJECT_DIR%\launch_vscode.bat
echo %CWD%cmake_project %PROJECT_DIR%\cmake-project
xcopy /E /I %CWD%cmake-project %PROJECT_DIR%\cmake-project
exit /B 0
