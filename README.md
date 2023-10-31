# MinGW's clang toolchain, vscode, cmake on unprivileged Windows.

Installation of the stuff in 'user-land'. No pre-installed software or admin-rights needed. 


## Local Install

Click the green(?) 'Code' button and select "Download as zip".<br>
Extract the downloaded file to, say, the Desktop.<br>
**Don't extract to an network-share** as this would break things.<br>
Open the extracted folder and type `powershell + Enter` in the File Explorer Address bar to open a terminal.
In the terminal, type:

```powershell
.\bootstrap.bat
```

Press `Enter` to start the (lengthy) installation process.<br>
Once the install is done, the script tells you where it has installed stuff, e.g.:

```powershell
Installation succeeded:
* MSYS: C:\Users\user_name\cpp4bio\msys64
* INSTALL_DIR: C:\Users\user_name\cpp4bio
* PROJECT_DIR: C:\Users\user_name\cpp4bio\projects
```

Take a note of the `PROJECT_DIR` as this is the root folder of our journey into C++.<br>
To close the terminal, type:

```powershell
exit
```

And press `Enter`.


## Install to external drive

Click the green(?) 'Code' button and select "Download as zip".<br>
Extract the downloaded file to, say, the Desktop.<br>
**Don't extract to an network-share** as this would break things.<br>
Open the extracted folder and type `powershell` + `Enter` in the File Explorer Address bar to open a terminal.
In the terminal, type:

```powershell
.\bootstrap.bat D:
```

Replace `D:` with the drive-letter of your external drive.<br>
Press `Enter` to start the (lengthy) installation process.<br>
Once the install is done, the script tells you where it has installed stuff, e.g.:

```powershell
Installation succeeded:
* MSYS: D:\msys64
* INSTALL_DIR: D:\cpp4bio
* PROJECT_DIR: D:\cpp4bio\projects
```

Take a note of the `PROJECT_DIR` as this is the root folder of our journey into C++.<br>
To close the terminal, type:

```powershell
exit
```

And press `Enter`.


### Tools

* [Standalone wget.exe](https://github.com/webfolderio/wget-windows.git).
* [Msys2 Software Distribution and Building Platform for Windows](https://www.msys2.org/).
* [Visual Studio Code](https://code.visualstudio.com).
