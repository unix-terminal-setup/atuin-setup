#!/usr/bin/env bash

set -euo pipefail

# Welcome
echo "This will setup Atuin for your machine locally"

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/linux-terminal-setup/rust-setup/main/setup.sh | bash

# Required Dependencies
sudo apt install pkg-config libssl-dev build-essential -y

# Setup Atuin
bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
atuin import auto

# Install Atuin
cargo install atuin

# Restart Terminals
echo "Please restart your terminals"
