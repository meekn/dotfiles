# Remove duplications from path.
typeset -U path

export LANG=ja_JP.UTF-8

# Use `cat' for pager in dumb terminals (like emacs shell mode).
if [[ "$TERM" = "dumb" ]]; then
    export PAGER='cat'
fi

# Add paths.
path=(
    ~/bin(N-/)
    /usr/local/bin(N-/)
    ${path}
)
