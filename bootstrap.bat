
:: bootstrap.bat
:: install script for vscode + msys2
::
:: usage:
:: ./setup.bat [Install root path]
::
:: Hanno Hildenbrandt 2021,2023

@echo off
setlocal
SET CWD=%~dp0
SET INSTALL_DIR=%HOMEDRIVE%%HOMEPATH%

IF "%~1" == "" GOTO :USE_DEFAULT_INSTALL_DIR
SET INSTALL_DIR=%~1
GOTO :set_launch_args

:USE_DEFAULT_INSTALL_DIR
:: choose "%INSTALL_DIR%\My Desktop" (UWP)
:: or     "%INSTALL_DIR%\Desktop" (otherwise)
IF exist "%INSTALL_DIR%\My Desktop" ( 
    SET INSTALL_DIR=%INSTALL_DIR%\My Desktop
) ELSE (
    if exist "%INSTALL_DIR%\Desktop" SET INSTALL_DIR=%INSTALL_DIR%\Desktop
)

:set_launch_args
IF "%~2" == "" GOTO :USE_DEFAULT_LAUNCH_ARGS
SET LAUNCH_ARGS=%~2

:USE_DEFAULT_LAUNCH_ARGS
SET INSTALL_DIR=%INSTALL_DIR%\cpp4bio
SET PROJECT_DIR=%INSTALL_DIR%\projects
SET MSYS=%INSTALL_DIR%\msys64
SET VSCODE_DIR=%INSTALL_DIR%\vscode
SET PATH=%MSYS%\usr\bin\;%MSYS%\mingw64\bin\;%MSYS%\ucrt64\bin\;%VSCODE_DIR%\bin\;%PATH%

mkdir "%CWD%\tmp"

:: msys2
echo Installing msys2 installler. This will take some time...
.\wget.exe --no-hsts "https://github.com/msys2/msys2-installer/releases/download/2022-09-04/msys2-x86_64-20220904.exe" -O tmp\msys2.exe
tmp\msys2.exe in -c --root "%MSYS%"
call :update_pacman_repositories
call :update_msys
call :install_develop_shebang

:: vscode
call :fetch_vscode
call :install_code_extension ms-vscode.cpptools-extension-pack
call :install_code_extension ms-vscode.cmake-tools
call :install_code_extension fougas.msys2
call :install_code_extension shd101wyy.markdown-preview-enhanced
call :create_project_dir

:regards
echo:
echo Installation succeeded!
echo * MSYS: %MSYS%
echo * VSCODE: %VSCODE_DIR%
echo * INSTALL_DIR: %INSTALL_DIR%
echo * PROJECT_DIR: %PROJECT_DIR%
echo:
explorer.exe "%INSTALL_DIR%"
exit /B %ERRORLEVEL%

:update_pacman_repositories
:: check disk space seg-faults on UWP - disable it
sed -i 's/^CheckSpace/#CheckSpace/g' "%MSYS%/etc/pacman.conf"
pacman --noconfirm -Suy
exit /B 0

:update_msys
pacman --noconfirm -Su
exit /B 0

:install_develop_shebang
pacman -S --noconfirm --needed unzip git 
pacman -S --noconfirm --needed mingw-w64-ucrt-x86_64-cmake mingw-w64-ucrt-x86_64-ninja
pacman -S --noconfirm --needed mingw-w64-ucrt-x86_64-clang mingw-w64-ucrt-x86_64-lldb-mi
exit /B 0

:fetch_vscode
wget --no-hsts "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -O tmp\vscode.zip
unzip tmp\vscode.zip -d "%VSCODE_DIR%"
:: enable portable mode
mkdir "%VSCODE_DIR%/data"
exit /B 0

:install_code_extension
echo installing %~1
call code %LAUNCHARGS% --install-extension %~1 --force
exit /B 0

:create_project_dir
mkdir "%PROJECT_DIR%"
xcopy /E /I "%CWD%templates" "%PROJECT_DIR%\hello_world"
move /Y "%PROJECT_DIR%\hello_world\setvars.bat" "%INSTALL_DIR%\setvars.bat"
::del /q "%PROJECT_DIR%\hello_world\vscode.cmd"
exit /B 0
