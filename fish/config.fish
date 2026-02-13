set -gx EDITOR helix
set -gx VISUAL helix
set -U fish_greeting

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.npm_packages/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin

if status is-interactive
    fish_config theme choose "Base16 Default Dark"
end
