$script_dir = (Split-Path $script:myInvocation.MyCommand.path -parent)

$command = "iex " + (Join-Path $script_dir "install_ctrl2cap.ps1")
$args = "-NoProfile", "-ExecutionPolicy", "unrestricted", "-Command", $command
Start-Process powershell.exe -Verb runas -ArgumentList $args

$command = "iex " + (Join-Path $script_dir "install_cygwin.ps1")
$args = "-NoProfile", "-ExecutionPolicy", "unrestricted", "-Command", $command
Start-Process powershell.exe -Verb runas -ArgumentList $args

$command = "iex " + (Join-Path $script_dir "install_ntemacs.ps1")
$args = "-NoProfile", "-ExecutionPolicy", "unrestricted", "-Command", $command
Start-Process powershell.exe -Verb runas -ArgumentList $args
