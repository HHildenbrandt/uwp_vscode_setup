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
* INSTALL_DIR: C:\Users\<user_name<\Desktop\cpp4bio
* MSYS: C:\Users\<user_name>\Desktop\cpp4bio\msys64
* VSCODE_DIR: C:\Users\<user_name>\Desktop\cpp4bio\vscode
* PROJECT_DIR: C:\Users\<user_name>\Desktop\cpp4bio\projects
```

Take a note of the `PROJECT_DIR` as this is the root folder of our journey into C++.<br>
In most cases, this points to the `projects` folder inside `cpp4bio` on your Desktop.
To close the terminal, type:

```powershell
exit
```

And press `Enter`.


## Install to external drive

Click the green(?) 'Code' button and select "Download as zip".<br>
Extract the downloaded file to, say, the Desktop.<br>
**Don't extract to an network-share, onedrive, google-drive or dropbox** as this would break things.<br>
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
* INSTALL_DIR: D:\cpp4bio
* MSYS: D:\cpp4bio\msys64
* VSCODE_DIR: D\:cpp4bio\vscode
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

## Release notes

### 2023

* `clang-17`, `llvm`, `MImode: lldb` from the `ucrt` branch.
* `bootstrap.bat` downloads and installs msys2.<br>
Selects appropriate default install path (`%HOMEDRIVE%%HOMEPATH%\Desktop` for UWP,<br>
`%HOMEDRIVE%%HOMEPATH%\Desktop` for FSE and local Windows).<br>
No user interaction needed.<br>
Portable install.<br>
Creates `cpp4bio` folder in the installation root (should be portable).
* `bootstrap.bat <DriveLetter>` creates portable install on external drive.
* First project is `cpp4bio\projects\hello_world`.
* New projects can be created by simply 'copy & rename' an existing one (as long as under `projects\`).
* `projects\xyz\.vscode` contains a bunch of specialized `.json` files.<br>
Automates cmake configure (`.vscode\settings.json`).<br>
Empty `"args": []` property in `.vscode\launch.json`.<br>
(Re)build task in `.vscode\tasks.json`.<br>
Much cleaner debugging experience.
* `projects\xyz\CMakeList.txt` copes with whitespaces in project folder names.<br>
`main.cpp` is the only remaining hard-coded dependency.<br>
Binaries are build as `projects\xyz\build\<FolderName>.exe` (whitespaces replaced with `'_'`).<br>
Static link.
* `projects\xyz\open_with_vscode.bat` normalized `PATH` environment variable.<br>
Removes `./build` (read: clears cmake cache).<br>
Calls `vscode` with `--disable-gpu --no-sandbox` flags.
