#!/usr/bin/env bash

set -euo pipefail

# Welcome
echo "This will setup Atuin for your machine locally"

# OS Detection
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Linux detected."
        sudo apt install pkg-config libssl-dev build-essential -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
    	echo "Mac detected."    
else
        echo "Unknown OS, abort."
	exit 1
fi

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/unix-terminal-setup/rust-setup/main/setup.sh | bash

# Setup Atuin
bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
atuin import auto

# Install Atuin
cargo install atuin

# Include bash_profile
if [[ "$OSTYPE" == "darwin"* ]]; then
    	echo '[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh' >> ~/.bash_profile
	echo 'eval "$(atuin init bash)"' >> ~/.bash_profile
fi

# Restart Terminals
echo "Please restart your terminals"
