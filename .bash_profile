# Append these to your existing ~/.bash_profile

source ~/.git_aliases

# Show git branch in prompt - bash
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
if [ -f /Users/utkarshjaiswal/.bashrc ]; then source /Users/utkarshjaiswal/.bashrc; fi