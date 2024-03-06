#!/usr/bin/env bash

# Install all the packages
echo "Installing system packages"
sudo pacman -Syu - < ~/dotfiles/pkglist.txt
echo "Installing system packages done"

# Link all the config files
echo "Setting up dotfiles"
bombadil install ~/dotfiles/
bombadil link
echo "Setting up dotfiles done"

# Install rust toolchain
echo "Installing rust toolchain"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile default --default-toolchain stable -y
echo "Installing rust toolchain done"
echo "Installing rust packages"
source "$HOME/.cargo/env"
cargo install tlrc
cargo install --locked evcxr_repl
cargo install wayshot
echo "Installing rust packages done"

echo "Installing rust-analyser"
# Install rust-analyser
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.cargo/bin/rust-analyzer
chmod +x ~/.cargo/bin/rust-analyzer
echo "Installing rust-analyser done"

# Install go tools
echo "Installing go tools"
go install github.com/nao1215/gup@latest
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/cmd/goimports@latest
echo "Installing go tools done"

# Install pyright lsp
echo "Installing pyright"
npm install -g pyright
echo "Installing pyright done"

# Install python tools
echo "Installing python tools"
python -m venv ~/venv
source ~/venv/bin/activate
pip install black isort ruff ruff-lsp BetterADBSync
deactivate
echo "Installing python tools done"

# Fetch & build treesitter grammars
echo "Installing helix grammars"
helix --grammar fetch
helix --grammar build
echo "Installing helix grammars done"
