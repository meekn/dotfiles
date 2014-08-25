$script_dir = (Split-Path $script:myInvocation.MyCommand.path -parent)

$targets = (".emacs.d", ".screenrc", ".zshenv", ".zshrc")

$targets | ForEach-Object {
        $options = ""
        if (Test-Path -LiteralPath $_ -PathType Container) {
                $options += "/D"
        }
        cmd /C mklink $options (Join-Path $Env:USERPROFILE $_) (Join-Path $script_dir $_)
}
