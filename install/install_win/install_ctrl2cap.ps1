Write-Output "Installing Ctrl2Cap..."

$uri = "http://download.sysinternals.com/files/Ctrl2Cap.zip"

Set-Location (Join-Path $Env:USERPROFILE "Downloads")
Invoke-WebRequest -Uri $uri -OutFile "Ctrl2Cap.zip"

$Expcom = New-Object -ComObject Shell.Application

$zipFile = $Expcom.NameSpace((Join-Path (Get-Location).Path "Ctrl2Cap.zip"))
New-Item "Ctrl2Cap" -itemType Directory
$tgtDir = $Expcom.NameSpace((Join-Path (Get-Location).Path "Ctrl2Cap"))
$zipFile.Items() | ForEach-Object {
        $tgtDir.CopyHere($_.path)
}

Set-Location Ctrl2Cap
Start-Process ctrl2cap.exe -Wait -ArgumentList "/install"

Write-Output "Done."
