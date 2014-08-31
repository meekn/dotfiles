Write-Output "Installing Ctrl2Cap..."

$uri = "http://download.sysinternals.com/files/Ctrl2Cap.zip"
$installer = "ctrl2cap.exe"

$archive = Split-Path (New-Object System.Uri($uri)).AbsolutePath -Leaf
$dir_name = [System.IO.Path]::GetFileNameWithoutExtension($archive)

Set-Location (Join-Path $Env:USERPROFILE "Downloads")
Invoke-WebRequest -Uri $uri -OutFile $archive

$Expcom = New-Object -ComObject Shell.Application

$zipFile = $Expcom.NameSpace((Join-Path (Get-Location).Path $archive))
New-Item $dir_name -itemType Directory
$tgtDir = $Expcom.NameSpace((Join-Path (Get-Location).Path $dir_name))
$zipFile.Items() | ForEach-Object {
        $tgtDir.CopyHere($_.path)
}

Set-Location Ctrl2Cap
Start-Process $installer -Wait -ArgumentList "/install"

Write-Output "Done."
