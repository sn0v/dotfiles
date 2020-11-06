# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

source ~/.git_aliases

# Show git branch in prompt - zsh
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
PS1="\$vcs_info_msg_0_$PS1"
