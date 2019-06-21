# exports
export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
export NODE_PATH=/usr/lib/node_modules:$NODE_PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export ECTO_EDITOR=/usr/bin/vim # environment variable allowing `mix ecto.gen.repo` to open config/config.exs

# eval "$(exenv init -)"
fpath=( "$HOME/.zfunctions" $fpath )

# 10ms timeout for key sequences
KEYTIMEOUT=1

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# aliases

alias v=vim
alias be="bundle exec"
alias brr="bundle exec rake routes | less"
alias rs="bundle exec rails server"
alias rc="bundle exec rails console"
alias gpo="git push origin HEAD:refs/for/master"
alias -g mps="mix phoenix.server" # inline alias for running a phoenix server in iex
alias mpr="mix phoenix.routes"
alias cl="clear"
alias chumbawumba="dev down; dev up"
alias -g mpv="mpv --ao=alsa"
alias -g ff='$(ag . -l | fzy)'
alias src='source ~/.zshrc'
alias fuckit='git push -f'
alias cw='chumbawumba'
alias cr='chumbawumba && dev run'
alias dr='dev run'
alias du='dev up'
alias dt='dev dt'
alias dut='dev up && dev test'
alias gca='gc --amend'
alias gw='gws'
alias esrb='be rake elasticsearch:drop && be rake elasticsearch:rebuild'
alias gpsu='g push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias agnt='ag --ignore "*test*"'
alias gad='git add .'
alias cls='printf "\33c\e[3J"'
alias rbm='g fetch && g rebase origin/master'
alias ggc='g gc --prune=now &' # Prune git object tree in the background
alias gcb='git checkout `git branch | fzy`'

# OS X postgres aliases
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
unsetopt beep # prevent terminal beeping (fuck that noise)
bindkey -v # zsh vim-mode

# set zsh prompt
autoload -Uz promptinit
promptinit
prompt pure

# Added by compinstall
zstyle :compinstall filename '/home/cpjk/.zshrc'
autoload -Uz compinit
compinit
# End compinstall

# Enable pry
export PRY=1

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
