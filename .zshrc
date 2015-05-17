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

alias v=vim
alias be="bundle exec"
alias brr="bundle exec rake routes | less"
alias rs="bundle exec rails server"
alias rc="bundle exec rails console"
alias gpo="git push origin HEAD:refs/for/master"
alias mpss="mix phoenix.server start"
alias mpr="mix phoenix.routes"
alias cl="clear"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias chrome="google-chrome-stable 2>>! ~/.log/chrome.log &"
  alias redshift="redshift 2>>! ~/.log/redshift.log &"
  alias i3lock="i3lock -i ~/.i3/i3lock_image"
fi

# 10ms for key sequences
KEYTIMEOUT=1

# make chruby executable visible
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
unsetopt beep # fuck that noise
bindkey -v # vim-mode

# Added by compinstall
zstyle :compinstall filename '/home/cpjk/.zshrc'
autoload -Uz compinit
compinit
# End compinstall

# virtualenv setup
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
