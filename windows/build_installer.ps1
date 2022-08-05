Import-Module ps2exe

Push-Location $PSScriptRoot

mkdir angr-management-install
Push-Location angr-management-install

curl -L -o python.tar.zst "https://github.com/indygreg/python-build-standalone/releases/download/20220802/cpython-3.10.6+20220802-x86_64-pc-windows-msvc-shared-install_only.tar.gz"
zstd -d python.tar.zst
7z x python.tar
Remove-Item python.tar.zst
Remove-Item python.tar

mkdir wheels
python\python -m pip download -d wheels angr-management

Pop-Location

ps2exe install.ps1 angr-management-install/install.exe
ps2exe uninstall.ps1 angr-management-install/uninstall.exe

7z a angr-management-installer-windows.zip angr-management-install
