param (
    [string]$url = "",
    [string]$dest = ""
 )

$wc = new-object system.net.WebClient

$IESettings = Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'

if ($IESettings.ProxyEnable -eq 1) {
  $proxy = new-object system.net.WebProxy
  $proxy.Address = "http://" + $IESettings.ProxyServer
  $proxy.useDefaultCredentials = $true

  $wc.proxy = $proxy
}

$wc.DownloadFile($url, $dest)
