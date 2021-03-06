﻿$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
Write-Host "Installing 32 bit version"
$embedded_path = gi "$toolsDir\*_x32.exe"

$packageArgs = @{
  packageName    = 'cantata'
  fileType       = 'exe'
  file           = $embedded_path
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'cantata*'
}
Install-ChocolateyInstallPackage @packageArgs
rm $embedded_path -ea 0

$packageName = $packageArgs.packageName
$installLocation = Get-AppInstallLocation $packageName
if (!$installLocation)  { Write-Warning "Can't find $packageName install location"; return }
Write-Host "$packageName installed to '$installLocation'"

Register-Application "$installLocation\$packageName.exe"
Write-Host "$packageName registered as $packageName"
