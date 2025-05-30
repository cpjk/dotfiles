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
export XDG_CONFIG_HOME=/Users/cpjk/.config

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

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    # Custom: do'nt source init.zsh if the shell session is running in the context of claude code
    # See https://github.com/anthropics/claude-code/issues/783
    if [[ -z "${CLAUDECODE}" ]]; then
          source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
fi

# aliases

alias v=vim
alias be="bundle exec"
alias brr="bundle exec rake routes | less"
alias rs="bundle exec rails server"
alias rc="bundle exec rails console"
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
alias dur='dev up && dev run'
alias -g dt='dev test'
alias drt='dev retest'
alias dut='dev up && dev test'
alias esrb='be rake elasticsearch:drop && be rake elasticsearch:rebuild'
alias -g agnt='ag --ignore "*test*"'
alias cls='printf "\33c\e[3J"'
alias rbm='git pull --rebase origin main'
alias ds='dev style --include-branch-commits'
alias dti='dev test --include-branch-commits'
alias gpo="git push origin HEAD:refs/for/master"
alias gca='gc --amend'
alias gw='gws'
alias gpsu='g push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gad='git add .'
alias ga='git add'
alias ggc='g gc --prune=now' # Prune git object tree
alias gcb='git checkout `git branch | fzy`'
alias gdr='git update-ref -d'
alias dstc='ds && dev typecheck'
alias cds='cd ~/src/github.com/Shopify/shopify'
alias cdv='cd ~/src/github.com/Shopify/video'
alias cdf='cd ~/src/github.com/Shopify/storefront-renderer'
alias gwdo='gwd origin/$(git rev-parse --abbrev-ref HEAD)'
alias sps='spin shell'
alias ggpf='dstc && dti && gpf'
alias spp='cat /etc/spin/machine/fqdn | sed "s/\\..*//"'
alias duf='dev up && dev flink'

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

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/cpjk/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/cpjk/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }
export PATH="/opt/homebrew/opt/shopify-imagemagick@6/bin:$PATH"

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/cpjk/.kube/config:/Users/cpjk/.kube/config.shopify.cloudplatform
for file in /Users/cpjk/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases
