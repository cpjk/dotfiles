# ctags alias to ignore ctags js null tag warnings for object destructuring (https://github.com/universal-ctags/ctags/issues/1112)
ctags() {
    command ctags "$@" 2> >(
        grep -Ev "^ctags: Warning: ignoring null tag in .+\.js\(line: .+\)$"
    )
}

# exports
export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
export NODE_PATH=/usr/lib/node_modules:$NODE_PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export ECTO_EDITOR=/usr/bin/vim # environment variable allowing `mix ecto.gen.repo` to open config/config.exs
export ANDROID_SDK=/Users/cpjk/Library/Android/sdk
export PATH=$ANDROID_SDK/platform-tools:$PATH
export PATH=/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH

# eval "$(exenv init -)"
fpath=( "$HOME/.zfunctions" $fpath )

# Add pure prompt theme
fpath+=$HOME/.zsh/pure

# 10ms timeout for key sequences
KEYTIMEOUT=1

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# aliases

alias python=python3
alias v=vim
alias be="bundle exec"
alias brr="bundle exec rake routes | less"
alias rs="bundle exec rails server"
alias rc="bundle exec rails console"
alias -g mps="mix phoenix.server" # inline alias for running a phoenix server in iex
alias cl="clear"
alias -g mpv="mpv --ao=alsa"
alias -g ff='$(ag . -l | fzy)'
alias src='source ~/.zshrc'
alias -g agnt='ag --ignore "*test*"'
alias cls='printf "\33c\e[3J"'
alias rbm='git pull --rebase origin main'
alias gca='gc --amend'
alias gw='gws'
alias gpsu='g push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gad='git add .'
alias ga='git add'
alias ggc='g gc --prune=now' # Prune git object tree
alias gcb='git checkout `git branch | fzy`'
alias gdr='git update-ref -d'
alias gwdo='gwd origin/$(git rev-parse --abbrev-ref HEAD)'
alias sps='spin shell'

unalias ggl
alias ggl='git log -10'

# OS X postgres aliases
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

case $(uname -s) in
  Linux)
      hostname -A
    ;;

  Darwin)
      hostname -s
    ;;
esac


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
unsetopt beep # prevent terminal beeping (fuck that noise)
bindkey -v # zsh vim-mode

# set zsh prompt
autoload -U promptinit; promptinit
prompt pure

# Added by compinstall
zstyle :compinstall filename '/home/cpjk/.zshrc'
autoload -Uz compinit
compinit
# End compinstall

# Enable pry
export PRY=1
