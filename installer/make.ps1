$launcherExe = "../RXL.WPFClient/bin/Release/RXL.exe"
$versionObj = [System.Reflection.Assembly]::LoadFrom($launcherExe).GetName().Version
$version = $versionObj.Major.ToString() + "." + $versionObj.Minor.ToString() + "." + $versionObj.Build.ToString()

"Building installer, setting version to " + $version + "."

Remove-Item -Force -Recurse "AnyCPU_ReleaseSetupFiles" -ea SilentlyContinue
Remove-Item -Force -Recurse "out" -ea SilentlyContinue
Remove-Item -Force -Recurse "setup-cache" -ea SilentlyContinue

$advInstallerExe = "C:/Program Files (x86)/Caphyon/Advanced Installer 11.0/bin/x86/advinst.exe"

Start-Process -NoNewWindow -Wait $advInstallerExe ("/edit setup.aip /SetVersion " + $version)
Start-Process -NoNewWindow -Wait $advInstallerExe "/rebuild setup.aip"