param(
  [parameter(mandatory=$true)][string]$scriptname
)

$url = "hhttps://github.com/zonzorp/COMP2101F15/raw/master/powershell/$scriptname"
$localdir = pwd
$localfile = "$localdir/$scriptname"
$webclient = New-Object -TypeName System.net.webclient
$webclient.UseDefaultCredentials = $true
$webclient.DownloadFile($url, $localfile)
