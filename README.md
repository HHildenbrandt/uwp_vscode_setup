# visual studio code unattended setup

## Install msys2, vscode and vscode extensions

Download the msys2 installer from https://www.msys2.org. Run the installer

### UWP (X-drive)
Choose `X:\msys64` for the installation folder.

Run `setup.bat` from this repository. Accept all default choices and ignore warnings.
The command will take a long time (read: ages) if you are on uwp.rug.nl - grab a coffee and file a complaint with ITC over the poor uplink.

### Regular Windows (C-drive)
Leave the installation folder at dafault (`C:\msys64`)

Run `setup.bat C:` from this repository. Accept all default choices and ignore warnings.

## Launch vscode

After installation, you can find the folder `vscode_projects` on thew installation drive (`X:` or `C:`) and within it the file `launch_vscode.bat`. Use this script to run vscode.

