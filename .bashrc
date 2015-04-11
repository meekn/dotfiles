export HISTCONTROL=ignoreboth
export LANG=ja_JP.UTF-8

# Use `cat' for pager in dumb terminals (like emacs shell mode).
if [[ "$TERM" = "dumb" ]]; then
    export PAGER='cat'
fi

export PS1='\u@\h:\w\$ '
# Escape sequences for screen.
if [[ "$TERM" = *screen* ]]; then
    export PS1=k\\$PS1
fi

# SSH agent
if [[ -e ~/.ssh-agent-info ]]; then
    source ~/.ssh-agent-info >& /dev/null
fi

ssh-add -l >& /dev/null
if [[ $? = 2 ]] ; then
    ssh-agent > ~/.ssh-agent-info
    source ~/.ssh-agent-info >& /dev/null
fi

# Use Emacs daemon mode.
alias emacs='emacsclient -nw -a ""'

# Use GNU screen in Unicode.
alias screen='screen -U'

# Skip binary files and color output in grep.
alias grep='grep --binary-files=without-match --color=auto'

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
