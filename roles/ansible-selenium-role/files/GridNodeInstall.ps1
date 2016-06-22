############################################################################################## 
# Powershell script for installing Selenium Grid Extras in Node Mode with latest version 
# of Chrome and Firefox
# Navigate with internet explorer to:
# http://boxstarter.org/package/nr/url? + raw gist url
#
##############################################################################################

choco install powershell
if (Test-PendingReboot) { Invoke-Reboot }

$seleniumGridPath = "c:\SeleniumGrid"
#$seleniumGridExtraDownloadUrl = "https://github.com/groupon/Selenium-Grid-Extras/releases/download/v1.7.1/SeleniumGridExtras-1.7.1-SNAPSHOT-jar-with-dependencies.jar"
 
 
# Creating Dir
New-Item -Force -ItemType directory -Path $seleniumGridPath
 
# Create grid extras config
$Base64EncodedGridExtrasConfig = "ewogICJ0aGVDb25maWdNYXAiOiB7CiAgICAiYXV0b19zdGFydF9odWIiOiAiMCIsCiAgICAicmVib290X2FmdGVyX3Nlc3Npb25zIjogIjEwIiwKICAgICJkZWZhdWx0X3JvbGUiOiAibm9kZSIsCiAgICAidmlkZW9fcmVjb3JkaW5nX29wdGlvbnMiOiB7CiAgICAgICJ2aWRlb3NfdG9fa2VlcCI6ICI0MCIKICAgIH0sCiAgICAibm9kZV9jb25maWdfZmlsZXMiOiBbCiAgICAgICJub2RlXzU1NTUuanNvbiIKICAgIF0sCiAgICAiaHViX2NvbmZpZyI6IHt9LAogICAgImh1Yl9jb25maWdfZmlsZXMiOiBbXSwKICAgICJpZWRyaXZlciI6IHsKICAgICAgInZlcnNpb24iOiAiMi40NC4wIgogICAgfSwKICAgICJhdXRvX3N0YXJ0X25vZGUiOiAiMSIsCiAgICAiYXV0b191cGRhdGVfZHJpdmVycyI6ICIxIiwKICAgICJjaHJvbWVkcml2ZXIiOiB7CiAgICAgICJ2ZXJzaW9uIjogIjIuMTMiCiAgICB9LAogICAgIndlYmRyaXZlciI6IHsKICAgICAgInZlcnNpb24iOiAiMi40NC4wIgogICAgfQogIH0KfQ=="
$DecodedGridExtrasConfig = [System.Convert]::FromBase64String($Base64EncodedGridExtrasConfig)
Set-Content -Path $seleniumGridPath\selenium_grid_extras_config.json -Value $DecodedGridExtrasConfig -Encoding Byte

# create node config
$Base64EncodedNodeConfig = "ewogICJjYXBhYmlsaXRpZXMiOiBbCiAgICB7CiAgICAgICJwbGF0Zm9ybSI6ICJWSVNUQSIsCiAgICAgICJzZWxlbml1bVByb3RvY29sIjogIldlYkRyaXZlciIsCiAgICAgICJicm93c2VyTmFtZSI6ICJjaHJvbWUiLAogICAgICAibWF4SW5zdGFuY2VzIjogMwogICAgfSwKICAgIHsKICAgICAgInBsYXRmb3JtIjogIlZJU1RBIiwKICAgICAgInNlbGVuaXVtUHJvdG9jb2wiOiAiV2ViRHJpdmVyIiwKICAgICAgImJyb3dzZXJOYW1lIjogImludGVybmV0IGV4cGxvcmVyIiwKICAgICAgIm1heEluc3RhbmNlcyI6IDEKICAgIH0sCiAgICB7CiAgICAgICJwbGF0Zm9ybSI6ICJWSVNUQSIsCiAgICAgICJzZWxlbml1bVByb3RvY29sIjogIldlYkRyaXZlciIsCiAgICAgICJicm93c2VyTmFtZSI6ICJmaXJlZm94IiwKICAgICAgIm1heEluc3RhbmNlcyI6IDMKICAgIH0KICBdLAogICJjb25maWd1cmF0aW9uIjogewogICAgInByb3h5IjogImNvbS5ncm91cG9uLnNlbGVuaXVtZ3JpZGV4dHJhcy5ncmlkLnByb3hpZXMuU2V0dXBUZWFyZG93blByb3h5IiwKICAgICJtYXhTZXNzaW9uIjogMywKICAgICJwb3J0IjogNTU1NSwKICAgICJyZWdpc3RlciI6IHRydWUsCiAgICAidW5yZWdpc3RlcklmU3RpbGxEb3duQWZ0ZXIiOiAxMDAwMCwKICAgICJodWJQb3J0IjogNDQ0NCwKICAgICJodWJIb3N0IjogInNlbGVuaXVtaHViIiwKICAgICJub2RlU3RhdHVzQ2hlY2tUaW1lb3V0IjogMTAwMDAsCiAgICAiZG93blBvbGxpbmdMaW1pdCI6IDAKICB9Cn0="
$DecodedNodeConfig = [System.Convert]::FromBase64String($Base64EncodedNodeConfig)
Set-Content -Path $seleniumGridPath\node_5555.json -Value $DecodedNodeConfig -Encoding Byte

# Create Start.bat file
$javaPath=Get-ChildItem "C:\Program Files\Java\jre*"
Set-Content -Path $seleniumGridPath\startnode.bat -Value "cd $seleniumGridPath & `"$javaPath`"\bin\java -jar selenium-grid-extras.jar"

schtasks.exe /Create /SC ONLOGON /TN "StartSeleniumNode" /TR "cmd /c ""C:\SeleniumGrid\startnode.bat"""

#if (Test-PendingReboot) { Invoke-Reboot }