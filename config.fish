if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings

    ####### BEGIN ALIASES #######

    alias g='git'

    alias gws='git status'
    alias gw='gws'

    alias gwd='git diff --no-ext-diff'
    alias gwD='git diff --no-ext-diff --word-diff'

    alias gl='git log'

    alias gad='git add .'
    alias ga='git add'

    alias gc='git commit --verbose'
    alias gca='gc --amend'

    alias gcp='git cherry-pick --ff'

    alias gr='git rebase'
    alias gra='git rebase --abort'
    alias grc='git rebase --continue'
    alias gri='git rebase --interactive'
    alias grs='git rebase --skip'

    alias gwR='git reset --hard'

    alias gs='git stash'
    alias gsa='git stash apply'
    alias gsp='git stash pop'

    alias gp='git push'
    alias gpf='git push --force-with-lease'

    # Push to branch on remote origin.
    # Create the branch on origin if it does not already exist
    alias gpsu='g push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

    alias gco='git checkout'

    ####### END ALIASES #######
end
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add homebrew ruby to PATH
fish_add_path /opt/homebrew/opt/ruby/bin
