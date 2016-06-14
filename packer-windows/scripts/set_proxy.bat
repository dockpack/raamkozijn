setlocal


set SUBKEY=Software\Microsoft\Windows\CurrentVersion\Internet Settings

set PROXY_HOST=%1

set PROXY_PORT=%2


reg add "HKCU\%SUBKEY%" /f /v MigrateProxy /t REG_DWORD /d 0x1

reg add "HKCU\%SUBKEY%" /f /v ProxyEnable /t REG_DWORD /d 0x1

reg add "HKCU\%SUBKEY%" /f /v ProxyServer /t REG_SZ /d "%PROXY_HOST%:%PROXY_PORT%"

reg add "HKCU\%SUBKEY%" /f /v ProxyOverride /t REG_SZ /d "<local>"



Netsh winhttp set proxy %PROXY_HOST%:%PROXY_PORT%



endlocal
