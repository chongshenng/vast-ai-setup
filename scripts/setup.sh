#!/bin/bash

set -e

# echo "Installing Python and other libraries"
sudo apt -y install python3.11 python3.11-venv libgl1-mesa-glx nvidia-cuda-toolkit vim

echo "Appending sensible defaults to ~/.bash_aliases"
# Define the aliases
ALIASES=$(cat << 'EOF'
alias ls='ls -Ga'
alias ll='ls -l'
alias llrt='ll -rth'
alias lls='ll -l --block-size=MB'
alias la='ls -a'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'

alias df='/bin/df -PH'
alias du='/usr/bin/du -kh'
EOF
)

# Append the aliases to ~/.bash_aliases, creating the file if it doesn't exist
if [ ! -f "$HOME/.bash_aliases" ]; then
   touch "$HOME/.bash_aliases"
fi

# Check if aliases are already present to avoid duplication
for alias in "${ALIASES[@]}"; do
  if ! grep -qxF "$alias" "$HOME/.bash_aliases"; then
    echo "$alias" >> "$HOME/.bash_aliases"
  fi
done

# Reload .bash_aliases if the script is run in an interactive shell
if [[ $- == *i* ]]; then
  source "$HOME/.bash_aliases"
fi

echo "Aliases added to ~/.bash_aliases"

echo "Appending sensible defaults to ~/.vimrc"
# Define the Vim settings
VIM_SETTINGS=$(cat << 'EOF'
set shiftwidth=2
set tabstop=4
set expandtab
set softtabstop=2
set laststatus=2
set mouse-=a
set hlsearch
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png
set splitright

set nu
set ruler
EOF
)

# Append the settings to ~/.vimrc, creating the file if it doesn't exist
if [ ! -f "$HOME/.vimrc" ]; then
  touch "$HOME/.vimrc"
fi

# Check if the settings are already present to avoid duplication
for setting in "${VIM_SETTINGS[@]}"; do
  if ! grep -qxF "$setting" "$HOME/.vimrc"; then
    echo "$setting" >> "$HOME/.vimrc"
  fi
done

echo "Vim settings added to ~/.vimrc"
