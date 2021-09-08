# visual studio code on UWP

Installation of the stuff in 'user-land'. No pre-installed software or admin-rights needed. On UWP everything goes to the X-drive, on regular Windows to C:.
The regular Windows install is meant for testing only, preferably in the sandbox. 

## Install on UWP (X-drive)

Download the msys2 installer from https://www.msys2.org. Run the installer.
Set `X:\msys64` as installation folder.

Download this repository as zip and extract it to, say, the Desktop.
Run `setup_X.bat`. Accept all default choices and ignore warnings. The command will take a long time (read: ages) if you are on uwp.rug.nl - grab a coffee and file a complaint with ITC over the poor uplink.

## Install on regular Windows (C-drive)

Download the msys2 installer from https://www.msys2.org. Run the installer.
Leave the installation folder at dafault (`C:\msys64`)

Download this repository as zip and extract it to, say, the Desktop.
Run `setup_C.bat`. Accept all default choices and ignore warnings.

## Launch vscode

After installation, you can find the folder `vscode_projects` on the installation drive (`X:` or `C:`) and within it the file `launch_vscode.bat`. 
Use this script to run vscode.

## Alternatives

`setup.bat` pulls a ton of files from the internet to X: - not unlikely that something goes wrong because of the brittle network sharing on uwp.rug.nl. It's very slow too. 30+ students running this script at the same time would be a DoS attack on the poor uplink ;)

We could, instead, have a archive containing pre-configured `msys64`, `vscode` and `vscode_projects` folder. What's left would be to run the part of the `setup.bat` script that installs the vscode extensions locally. That archive would be massive, thus the DoS issue will remain. The creation/configuration of `msys64` could be done on a much more stable system though.
