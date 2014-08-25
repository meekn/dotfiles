$script_dir = (Split-Path $script:myInvocation.MyCommand.path -parent)

$COMMAND = "iex " + (Join-Path $script_dir "install_ctrl2cap.ps1")
$ARGS = "-NoProfile", "-ExecutionPolicy", "unrestricted", "-Command", $COMMAND
Start-Process powershell.exe -Verb runas -ArgumentList $ARGS

$COMMAND = "iex " + (Join-Path $script_dir "install_cygwin.ps1")
$ARGS = "-NoProfile", "-ExecutionPolicy", "unrestricted", "-Command", $COMMAND
Start-Process powershell.exe -Verb runas -ArgumentList $ARGS

$COMMAND = "iex " + (Join-Path $script_dir "install_ntemacs.ps1")
$ARGS = "-NoProfile", "-ExecutionPolicy", "unrestricted", "-Command", $COMMAND
Start-Process powershell.exe -Verb runas -ArgumentList $ARGS
