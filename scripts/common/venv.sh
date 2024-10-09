#!/bin/bash

curl https://pyenv.run | bash

# Add env vars to add `pyenv` to load path
content='
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
'

# Append the content to ~/.bashrc, creating it if it doesn't exist
echo "$content" >> ~/.bashrc

# Print success message
echo "Content has been successfully added to ~/.bashrc"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

content='
eval "$(pyenv virtualenv-init -)"
'

# Append the content to ~/.bashrc, creating it if it doesn't exist
echo "$content" >> ~/.bashrc
