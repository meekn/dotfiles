$script_dir = (Split-Path $script:myInvocation.MyCommand.path -parent)

$targets = ("install_ctrl2cap.ps1", "install_cygwin.ps1", "install_ntemacs.ps1")

$targets | ForEach-Object {
    $command = "iex " + (Join-Path $script_dir $_)
    $args = "-NoProfile", "-ExecutionPolicy", "unrestricted", "-Command", $command
    Start-Process powershell.exe -NoNewWindow -Wait -ArgumentList $args
}
