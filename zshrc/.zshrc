# defaults
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colors for ls output
# LS_COLORS=$LS_COLORS:'di=1;33:ln=36' ; export LS_COLORS;

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias ga='git add'
alias gap='git add -p'
alias gc='git commit'
alias gca='git commit -a'
alias gcp='git commit -p'
alias gl='git log'
alias gs='git show'
alias ghpr='gh pr list | fzf --height 20% --reverse | xargs gh pr checkout'

# other aliases
alias nnn='NODE_PATH=${pwd} node'
alias vi='nvim'

export GPG_TTY=$(tty)

export CLICOLOR=1

# bun completions
[ -s "/Users/tobiasfried/.bun/_bun" ] && source "/Users/tobiasfried/.bun/_bun"

# bun
export BUN_INSTALL="/Users/tobiasfried/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# python
export PATH=/usr/local/opt/python/libexec/bin:$PATH 

# binaries
export PATH=/Users/tobiasfried/bin:$PATH


# fnm
eval "$(fnm env --use-on-cd)"
# FNM_PATH="/Users/tobiasfried/Library/Application Support/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="/Users/tobiasfried/Library/Application Support/fnm:$PATH"
#   eval "$(fnm env)"
# fi

