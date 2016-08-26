# exports

export VISUAL=vim
export EDITOR="$VISUAL"
export TERMINAL=urxvt
export NODE_PATH=/usr/lib/node_modules:$NODE_PATH

export PATH=~/.gem/ruby/2.1.0/bin:$PATH
export PATH=~/.gem/ruby/1.9.1/bin:$PATH
export PATH=~/.gem/ruby/2.1.3/bin:$PATH
export PATH=~/.gem/ruby/2.0.0/bin:$PATH
export PATH=~/.gem/ruby/2.2.0/bin:$PATH
export PATH=/usr/bin/:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/games/psychonauts:$PATH
export PATH=~/.exenv/bin:$PATH

export ECTO_EDITOR=/usr/local/bin/vim # environment variable allowing `mix ecto.gen.repo` to open config/config.exs


# eval "$(exenv init -)"
fpath=( "$HOME/.zfunctions" $fpath )

# aliases

alias v=vim
alias kr="ps aux | grep redshift | grep -v grep | awk '{print \$2}' | xargs kill"
alias rnm="sudo systemctl restart NetworkManager.service"
alias be="bundle exec"
alias brr="bundle exec rake routes | less"
alias rs="bundle exec rails server"
alias rc="bundle exec rails console"
alias gpo="git push origin HEAD:refs/for/master"
alias -g mps="mix phoenix.server" # inline alias for running a phoenix server in iex
alias mpr="mix phoenix.routes"
alias cl="clear"
alias -g setbg="feh --bg-scale"
alias xmm="xmodmap /home/cpjk/.Xmodmap"
alias gfp='git push origin +$(git rev-parse --abbrev-ref HEAD)'
alias chumbawumba="dev down; dev up"

# linux-specific aliases
# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   alias chrome="google-chrome-stable 2>>! ~/.log/chrome.log &" # start chrome with logging to a file
#   alias redshift="redshift 2>>! ~/.log/redshift.log &" # start redshift with logging to a file
#   alias i3lock="i3lock -i ~/.i3/i3lock_image"
#   alias mouseconfig="roccatkonepuremilitaryconfig" # alias for my mouse's config program
# fi

# 10ms timeout for key sequences
KEYTIMEOUT=1

# make chruby executable visible
source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
unsetopt beep # prevent terminal beeping (fuck that noise)
bindkey -v # zsh vim-mode
#
# virtualenvwrapper config
# export WORKON_HOME=~/.virtualenvs
# source /usr/bin/virtualenvwrapper.sh

# set zsh prompt
autoload -Uz promptinit
promptinit
prompt skwp

# Added by compinstall
zstyle :compinstall filename '/home/cpjk/.zshrc'
autoload -Uz compinit
compinit
# End compinstall

export PRY=1

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
