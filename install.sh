#!/usr/bin/env bash

sudo pacman -Syu - < dotfiles/pkglist.txt

git clone https://github.com/voiceroy/dotfiles
bombadil install dotfiles/
bombadil link

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile complete --default-toolchain stable -y

go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/cmd/goimports@latest
fish -c "fish_add_path -U ~/go/bin"

npm install -g prettier pyright typescript-language-server typescript vscode-langservers-extracted
fish -c "fish_add_path -U ~/.npm_packages/bin"

rustup component add rust-analyzer
fish -c "fish_add_path -U ~/.cargo/bin"

python -m venv ~/venv
source ~/venv/bin/activate
pip install -r dotfiles/pip_packages.txt
