@echo on

@powershell -NoProfile -ExecutionPolicy Bypass -File a:\download.ps1 -url "https://download.microsoft.com/download/B/A/4/BA4A7E71-2906-4B2D-A0E1-80CF16844F5F/dotNetFx45_Full_setup.exe" -dest "C:\Windows\Temp\dotNetFx45_Full_setup.exe"



start /wait "" "C:\Windows\Temp\dotNetFx45_Full_setup.exe" /passive /norestart


@powershell -NoProfile -ExecutionPolicy Bypass -File a:\download.ps1 -url "https://download.microsoft.com/download/3/D/6/3D61D262-8549-4769-A660-230B67E15B25/Windows6.1-KB2819745-x86-MultiPkg.msu" -dest "C:\Windows\Temp\Windows6.1-KB2819745-x86-MultiPkg.msu"




start /wait "" wusa "C:\Windows\Temp\Windows6.1-KB2819745-x86-MultiPkg.msu" /quiet /norestart
