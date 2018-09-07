# Append these to your existing ~/.bash_profile

# git aliases
alias ga.='git add .'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias gpl='git pull'
alias grc='git rebase --continue'
alias gs='git status'
alias gsh='git stash'
alias gsl='git stash list'
alias gsp='git stash pop'

# function aliases (for aliases with args)

# git checkout $arg branch
# eg - gco master
function gco { git checkout "$1"; }

# update current branch off master
gup () {
    # define working branch
    branch=$(git symbolic-ref --short HEAD)
    gsh
    gco master
    gpl
    gco $branch
    git rebase master
    gsp
}

# interactive rebase on current branch
# eg - gri 3 to rebase last 3 commits on HEAD
gri () {
    git rebase -i HEAD~"$1"
}

# (non-force) push current branch to origin
gph () {
    branch=$(git symbolic-ref --short HEAD)
    git push origin $branch
}

# (force) push current branch to origin
gpf () {
    branch=$(git symbolic-ref --short HEAD)
    git push -f origin $branch
}

# (force) delete $arg branch
gbd () {
    git branch -D "$1"
}

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
