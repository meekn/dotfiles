export HISTCONTROL=ignoreboth
export LANG=ja_JP.UTF-8
export GREP_OPTIONS='--binary-files=without-match --color=auto'

# Use `cat' for pager in dumb terminals (like emacs shell mode).
if [[ "$TERM" = "dumb" ]]; then
    export PAGER='cat'
fi

export PS1='\u@\h:\w\$ '
# Escape sequences for screen.
if [[ "$TERM" = *screen* ]]; then
    export PS1=k\\$PS1
fi

# Use Emacs daemon mode.
alias emacs='emacsclient -nw -a ""'

# Use GNU screen in Unicode.
alias screen='screen -U'

# Replace rm with a safer substitute.
if which rmtrash >& /dev/null ; then
    alias rm=rmtrash
elif which trash-put >& /dev/null ; then
    alias rm=trash-put
fi

# Read virtualenvwrapper (for Python).
if which virtualenvwrapper.sh >& /dev/null ; then
    . virtualenvwrapper.sh
fi

# Color ls in each environment.
if ls --color -d . >& /dev/null ; then
    # GNU
    alias ls='ls -F --show-control-chars --color=auto'
elif ls -G -d . >& /dev/null ; then
    # BSD
    alias ls='ls -FG'
fi
