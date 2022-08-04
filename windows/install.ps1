Push-Location $PSScriptRoot

# TODO make this confiugrable
$install_directory = $env:appdata + "\angr-management"
$python_bin = "$install_directory" + "\python\python"
$wheels = Get-ChildItem wheels
$wheels_to_install = ""
foreach ($wheel in $wheels) {
    $wheels_to_install += "wheels\" + $wheel.name + " "
}
$pip_install = "$python_bin -m pip install $wheels_to_install"

mkdir "$install_directory"
Copy-Item -Recurse python "$install_directory"

Invoke-Expression $pip_install
Copy-Item uninstall.exe "$install_directory"

# TODO: make a launcher icon or something

Write-Host "angr management successfully installed!"
