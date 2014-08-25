Write-Output "Installing Cygwin..."

$root = "C:\cygwin64"
$site = "http://ftp.yz.yamagata-u.ac.jp/pub/cygwin/"
$uri = "http://cygwin.com/setup-x86_64.exe"

$installer = Split-Path (New-Object System.Uri($uri)).AbsolutePath -Leaf

Set-Location (Join-Path $Env:USERPROFILE "Downloads")
Invoke-WebRequest -Uri $uri -OutFile $installer

$pkg_names = @()
$pkg_names += "pkg-config", "stow", "screen", "tmux", "zsh", "trash-cli", "wget", "rsync", "ssh", "libiconv"
$pkg_names += "emacs", "vim"
$pkg_names += "gcc-g++", "clang", "libboost-devel", "gdb", "make", "cmake", "automake"
$pkg_names += "git", "subversion", "git-svn", "tig"
$pkg_names += "python", "ruby"
$pkg_names += "texlive-collection-langcjk", "gnuplot", "doxygen"
$pkg_names += "gnupg", "openssl"
$pkg_names += "libuuid-devel"
$pkg_names += "libpcre-devel", "liblzma-devel"

$ARGS = @()
$ARGS += "--quiet-mode"
$ARGS += "--root", $root
$ARGS += "--site", $site
$ARGS += "--local-package-dir", (Get-Location).Path
$ARGS += "--packages", [string]::Join(",", $pkg_names)

Start-Process $installer -Wait -ArgumentList $ARGS

[System.Environment]::SetEnvironmentVariable("HOME", $Env:USERPROFILE, [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable("CYGWIN", "nodosfilewarning winsymlinks", [System.EnvironmentVariableTarget]::Machine)

Write-Output "Done."
