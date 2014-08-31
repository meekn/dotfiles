$prefix = "C:"

Write-Output "Installing NTEmacs..."

$archive = "emacs-24.3-20130316.exe"
$dir_name = [System.IO.Path]::GetFileNameWithoutExtension($archive)

$uri = "http://iij.dl.sourceforge.jp/gnupack/46675" + "/" + $archive

Set-Location (Join-Path $Env:USERPROFILE "Downloads")
Invoke-WebRequest -Uri $uri -OutFile $archive
Start-Process $archive -Wait -ArgumentList "-o", (Get-Location).Path, "-y"
Move-Item $dir_name $prefix

Write-Output "Done."
