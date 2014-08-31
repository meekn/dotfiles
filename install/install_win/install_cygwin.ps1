$prefix = "C:"
$site = "http://ftp.yz.yamagata-u.ac.jp/pub/cygwin/"
$proxy_host = ""

Write-Output "Installing Cygwin..."

$cygwin_site = "cygwin.com"

$os = (Get-WMIObject Win32_OperatingSystem)
if ($os.OSArchitecture.IndexOf("64") -ge 0) {
    $installer = "setup-x86_64.exe"
    $root = (Join-Path $prefix "cygwin64")
} else {
    $installer = "setup-x86.exe"
    $root = (Join-Path $prefix "cygwin")
}

$uri = "http://" + $cygwin_site + "/" $installer

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

$arg_list = @()

$options = @{
    "--quiet-mode" = "";
    "--root" = $root;
    "--site" = $site;
    "--local-package-dir" = (Get-Location).Path;
    "--packages" = [string]::Join(",", $pkg_names);
}

if ($proxy_host) {
    $options["--proxy"] = $proxy_host
}

$options.GetEnumerator() | ForEach {
    $arg_list += $_.key
    if ($_.value) {
        $arg_list += $_.value
    }
}

$arg_list += "--quiet-mode"
$arg_list += "--root", $root
$arg_list += "--site", $site
$arg_list += "--local-package-dir", (Get-Location).Path
$arg_list += "--packages", [string]::Join(",", $pkg_names)

Start-Process $installer -Wait -ArgumentList $arg_list

[System.Environment]::SetEnvironmentVariable("HOME", $Env:USERPROFILE, [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable("CYGWIN", "nodosfilewarning winsymlinks", [System.EnvironmentVariableTarget]::Machine)

Write-Output "Done."
