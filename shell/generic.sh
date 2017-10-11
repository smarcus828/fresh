[ -e $HOME/.shell_local.sh ] && . $HOME/.shell_local.sh

# _generic
#export GREP_OPTIONS='--color=auto'

# colorize ls output
export CLICOLOR=''
export GREP_COLOR='3;32'
export PAGER='less -rFX'
export EDITOR='vim'
export ANSIBLE_VAULT_PASSWORD_FILE='~/.vault_pass.txt'

if ls --color=auto > /dev/null 2>&1
then
  alias ls="ls --color=auto"
fi
alias ll="ls -l"
alias l="ls -la"
alias l1h="ls -1t | head"
alias scat="egrep -v '^(\s*)?(#|$)' "
alias cd..="cd .."
alias cda='cd /Users/steven.marcus/ansible'
alias cds='cd /Users/steven.marcus/puppet/sandbox/'
alias cdw='cd /Users/steven.marcus/work/'

function sshh() {
  cd /Users/steven.marcus/zzwork/setup_bash_profile/
  ./setup_bash.sh $1
  ssh $1
}


# shell
function esl {
  if [ ! -z $ZSH_NAME ]
  then
    exec $ZSH_NAME -l
  else
    exec $SHELL -l
  fi
}
alias esl="exec $SHELL -l"

alias tree='tree -FC'
alias vundle_update='vim +BundleUpdate +BundleClean! +qall'

# ssh
function delkey {
  [ -z $1 ] && echo "supply deletion key" && return 2
  ssh-keygen -f "$HOME/.ssh/known_hosts" -R $1
}
