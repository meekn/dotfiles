@set target=%~dp0setup.ps1
@set powershell_script="Start-Process powershell.exe -Verb runas -ArgumentList (\"-NoProfile\", \"-ExecutionPolicy unrestricted\", \"-Command iex %target%\")"
@powershell -NoProfile -ExecutionPolicy unrestricted -Command %powershell_script%
