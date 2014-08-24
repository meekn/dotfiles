Write-Output "Installing NTEmacs..."

$uri = "http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fgnupack%2F46675%2Femacs-24.3-20130316.exe"

Set-Location (Join-Path $Env:USERPROFILE "Downloads")
Invoke-WebRequest -Uri $uri -OutFile "emacs-24.3-20130316.exe"
Start-Process "emacs-24.3-20130316.exe" -Wait -ArgumentList "-o", (Get-Location).Path, "-y"
Move-Item "emacs-24.3-20130316" "C:\"

Write-Output "Done."
