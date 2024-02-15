#!/usr/bin/env bash

# Welcome
echo "This will setup Atuin for your machine locally"

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Setup Atuin
bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
atuin import auto

# Install Atuin
cargo install atuin

# Restart Terminals
echo "Please restart your terminals"
