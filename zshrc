#!/usr/bin/env sh
#
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 13
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git
    zsh-syntax-highlighting
    zsh-autosuggestions
    vi-mode)
source $ZSH/oh-my-zsh.sh
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode disabled  # disable automatic updates
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
#--------------------------------------------------
#
# easifem environment variables
source ~/.config/easifem/easifemvar.sh
source ${HOME}/.easifemrc
#--------------------------------------------------
#
#my lecture notes
export vikas="${HOME}/Documents/Vikas"
export lectures="${vikas}/lecture-notes"
#--------------------------------------------------
#
# conda environemnt
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/easifem/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/easifem/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/easifem/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/easifem/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

echo "running conda activate easifem"
conda activate easifem
#
# 
#--------------------------------------------------
#
# smartgit 
#
alias smartgit="/opt/smartgit/bin/smartgit.sh"
#--------------------------------------------------
#
# broot  is terminal based file manager
#
source /home/easifem/.config/broot/launcher/bash/br
#--------------------------------------------------
#
# Related to spack
alias less='less -R'
export SPACK_COLOR=always
export SPACK_ROOT=${HOME}/spack
alias load_spack="source $SPACK_ROOT/share/spack/setup-env.sh"
#--------------------------------------------------
#
# fuzzy finder related
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#--------------------------------------------------
#
# openfoam
#source /opt/openfoam-dev/etc/bashrc
#--------------------------------------------------
#
# Nvidia HPC kit
#
MANPATH="${MANPATH}:/opt/nvidia/hpc_sdk/Linux_x86_64/22.3/compilers/man"
MANPATH="${MANPATH}:/opt/nvidia/hpc_sdk/Linux_x86_64/22.3/comm_libs/mpi/man"
PATH="${PATH}:/opt/nvidia/hpc_sdk/Linux_x86_64/22.3/compilers/bin"
PATH="${PATH}:/opt/nvidia/hpc_sdk/Linux_x86_64/22.3/comm_libs/mpi/bin"
#--------------------------------------------------
#
# nodejs pkgs
#
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$PATH:$NPM_PACKAGES/bin"
#--------------------------------------------------
#Preferred editor for local and remote sessions
#
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi
#--------------------------------------------------
#
#export GEM_HOME="${HOME}/gems"
#export PATH="${HOME}/gems/bin:${PATH}"
#--------------------------------------------------
#
eval `dircolors /home/easifem/.dir_colors/`
#--------------------------------------------------
#
# starship prompt
#
eval "$(starship init zsh)"
#--------------------------------------------------
# exports all paths here 
#
export PATH
export MANPATH
#--------------------------------------------------
