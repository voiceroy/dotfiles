#!/usr/bin/env bash

# Install all the packages
echo "Installing system packages"
sudo pacman -Syu --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -Syu - < ~/dotfiles/pkglist.txt
echo "Installing system packages done"

# Link all the config files
echo "Setting up dotfiles"
bombadil install ~/dotfiles/
bombadil link
echo "Setting up dotfiles done"

# Install rust toolchain
echo "Installing rust toolchain"
rustup install --profile default stable
echo "Installing rust toolchain done"
echo "Installing rust packages"
source "$HOME/.cargo/env"
cargo install wayshot --locked
cargo install fnm --locked
cargo install taplo-cli --locked
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
go install golang.org/x/perf/cmd/benchfilter@latest
go install golang.org/x/perf/cmd/benchsave@latest
go install golang.org/x/perf/cmd/benchseries@latest
go install golang.org/x/perf/cmd/benchstat@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/aarzilli/gdlv@latest
go install github.com/melkeydev/go-blueprint@latest
go install github.com/joho/godotenv/cmd/godotenv@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest
go install github.com/nametake/golangci-lint-langserver@latest
go install golang.org/x/tools/gopls@latest
go install github.com/google/gops@latest
go install github.com/nao1215/gup@latest
go install github.com/hetznercloud/cli/cmd/hcloud@latest
go install github.com/golang-migrate/migrate/v4/cmd/migrate@latest
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
echo "Installing go tools done"

# Install python tools
echo "Installing python tools"
uv tool install ty
uv tool install isort
uv tool install ipython
uv tool install ruff
echo "Installing python tools done"

# Fetch & build treesitter grammars
echo "Installing helix grammars"
helix --grammar fetch
helix --grammar build
echo "Installing helix grammars done"
