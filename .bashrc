# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function kd() {
	  export POD_NAME=$(kubectl get pods -n kubernetes-dashboard -l "app.kubernetes.io/name=kubernetes-dashboard,app.kubernetes.io/instance=dashboard" -o jsonpath="{.items[0].metadata.name}")
	    kubectl -n kubernetes-dashboard port-forward $POD_NAME 8443:8443 &

	      printf "Done, hosting dashboard at https://127.0.0.1:8443/...\n"
      }

alias sock="sudo chmod 666 /var/run/docker.sock"

# GIT
alias gb="git branch | grep \*"
alias gs="git status"
function gp() { git pull "$@"; }
function ga() { git add "$@"; gs; }
function gc() { git commit "$@"; }
function gcm() { git commit -m "$@"; }
function gcam() { git commit -am "$@"; }

# Git 
function gcf() { git checkout -$1; } # Git checkout feature branch for datapalace project.

# SKAFFOLD
function sr() { skaffold run "$@"; }
function sd() { skaffold delete "$@"; }
function sb() { skaffold build "$@"; }
function sp() { skaffold deploy "$@"; }
function sa() { sd; sr "$@"; } # Skaffold delete and run

# BASH
alias rc="vim ~/.bashrc; source ~/.bashrc"

# GO TELEPORT

# GO UPDATE

# SKAFFOLD

# AUTO REVIEW

# UTILS
function rmlocks() { rm $(find -L | grep Chart.lock | xargs); }

# VIM 
alias vrc="vi ~/.vimrc"

# Ansible
function ap() { ansible-playbook "$@"; }

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
