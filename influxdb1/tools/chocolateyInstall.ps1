$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$pp = Get-PackageParameters
if (!$pp.InstallRoot) { $pp.InstallRoot = 'C:\influxdata' }

$packageArgs = @{
    PackageName    = 'influxdb1'
    FileFullPath64 = gi $toolsPath\*.zip    
    Destination    = $pp.InstallRoot
}

ls $toolsPath\* | ? { $_.PSISContainer } | rm -Recurse -Force #remove older package dirs
Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.zip -ea 0
