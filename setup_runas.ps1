$script_dir = (Split-Path $script:myInvocation.MyCommand.path -parent)
$command = "iex " + (Join-Path $script_dir "setup.ps1")

$ARGS = "-NoProfile", "-ExecutionPolicy", "unrestricted", "-Command", $command

Start-Process powershell.exe -Verb runas -ArgumentList $ARGS
