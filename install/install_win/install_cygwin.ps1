Write-Output "Installing Cygwin..."

$root = "C:\cygwin64"
$site = "http://ftp.yz.yamagata-u.ac.jp/pub/cygwin/"
$uri = "http://cygwin.com/setup-x86_64.exe"

Set-Location (Join-Path $Env:USERPROFILE "Downloads")
Invoke-WebRequest -Uri $uri -OutFile "setup-x86_64.exe"

$PKG_NAMES = @()
$PKG_NAMES += "pkg-config", "stow", "screen", "tmux", "zsh", "trash-cli", "wget", "rsync", "ssh", "libiconv"
$PKG_NAMES += "emacs", "vim"
$PKG_NAMES += "gcc-g++", "clang", "libboost-devel", "gdb", "make", "cmake", "automake"
$PKG_NAMES += "git", "subversion", "git-svn", "tig"
$PKG_NAMES += "python", "ruby"
$PKG_NAMES += "texlive-collection-langcjk", "gnuplot", "doxygen"
$PKG_NAMES += "gnupg", "openssl"
$PKG_NAMES += "libuuid-devel"
$PKG_NAMES += "libpcre-devel", "liblzma-devel"

$ARGS = @()
$ARGS += "--quiet-mode"
$ARGS += "--root", $root
$ARGS += "--site", $site
$ARGS += "--local-package-dir", (Get-Location).Path
$ARGS += "--packages", [string]::Join(",", $PKG_NAMES)

Start-Process setup-x86_64.exe -Wait -ArgumentList $ARGS

[System.Environment]::SetEnvironmentVariable("HOME", $Env:USERPROFILE, [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable("CYGWIN", "nodosfilewarning winsymlinks", [System.EnvironmentVariableTarget]::Machine)

Write-Output "Done."
