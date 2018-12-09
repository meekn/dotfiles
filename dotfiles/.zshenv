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
    /usr/local/sbin(N-/)
    ${path}
)

case ${OSTYPE} in
    cygwin)
        export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
        ;;
esac
