autoload -U compinit
compinit

# Color completion entries.
zstyle ':completion:*' list-colors ''

# Ignore the case in completion.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt hist_ignore_dups
setopt share_history
setopt extended_history
setopt auto_pushd
setopt pushd_ignore_dups
setopt noautoremoveslash
setopt complete_aliases
setopt print_eight_bit

if [[ "$EMACS" = "t" ]]; then
    unsetopt zle
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Prompt settings.
case $TERM in
    # In dumb terminals (w/o escape sequences)
    dumb|emacs|unknown)
        PROMPT="%/%% "
        PROMPT2="%_%% "
        SPROMPT="%r is correct? [n,y,a,e]: "
        [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="${HOST} ${PROMPT}"
        ;;
    # In full-featured terminals
    *)
        case ${UID} in
            # root
            0)
                PROMPT="%B%{[31m%}%/#%{[m%}%b "
                PROMPT2="%B%{[31m%}%_#%{[m%}%b "
                SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
                [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
                ;;
            # others
            *)
                PROMPT="%{[31m%}%/%%%{[m%} "
                PROMPT2="%{[31m%}%_%%%{[m%} "
                SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
                [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
                ;;
        esac
        ;;
esac

# Escape sequences for screen.
if [[ "$TERM" = *screen* ]]; then
    preexec() {
        emulate -L zsh
        local -a cmd
        cmd=(${(z)2})

        local jobname
        case $cmd[1] in
            fg)
                local -a jobstat
                if (( $#cmd == 1 )); then
                    jobstat=(`builtin jobs -l %+`)
                else
                    jobstat=(`builtin jobs -l $cmd[2]`)
                fi
                jobname=$jobstat[5]
                ;;
            %*)
                local -a jobstat
                jobstat=(`builtin jobs -l $cmd[1]`)
                jobname=$jobstat[5]
                ;;
            *)
                jobname=$cmd[1]
                ;;
        esac

        echo -n "k$jobname\\"

        return
    }

    precmd() {
        printf "kshell\\"
        return
    }
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

# Use GNU screen in Unicode.
alias screen='screen -U'

# Skip binary files and color output in grep.
alias grep='grep --binary-files=without-match --color=auto'

# Color ls in each environment.
if ls --color -d . >& /dev/null ; then
    # GNU
    alias ls='ls -F --show-control-chars --color=auto'
elif ls -G -d . >& /dev/null ; then
    # BSD
    alias ls='ls -FG'
fi
