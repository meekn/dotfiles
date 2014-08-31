$script_dir = (Split-Path $script:myInvocation.MyCommand.path -parent)

$targets = (".inputrc", ".screenrc", ".profile", ".bashrc", ".zshenv", ".zshrc", ".emacs.d")

$targets | ForEach-Object {
        $options = ""
        if (Test-Path -LiteralPath $_ -PathType Container) {
                $options += "/D"
        }
        cmd /C mklink $options (Join-Path $Env:USERPROFILE $_) (Join-Path $script_dir $_)
}
