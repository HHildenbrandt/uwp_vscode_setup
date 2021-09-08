# visual studio code unattended setup

## Install on UWP (X-drive)

Download the msys2 installer from https://www.msys2.org. Run the installer and select `X:\msys64` as installation folder.

Run `setup.bat` from this repository. Accept all default choices and igrnore warnings.
The command will take a long time (read: ages) if you are on uwp.rug.nl - grab a coffee and file a complaint with ITC over the poor uplink.

After completion you will find the folder `X:\vscode_projects` and within it the file `launch_vscode.bat`. Always use this script to start vscode...


## Install on regular Windows (C-drive) for testing

Download the msys2 installer from https://www.msys2.org. Run the installer.

Run `setup.bat C:` from this repository. Accept all default choices and igrnore warnings.

After completion you will find the folder `C:\vscode_projects` and within it the file `launch_vscode.bat`. Always use this script to start vscode...

