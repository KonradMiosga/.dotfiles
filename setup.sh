#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/.dotfiles"
LOCAL_DIR="$HOME/.local"

# list of config directories to symlink
items=(nvim hypr tmux waybar)

# packages to install
packages=(
    tmux
    telegram-desktop
    zathura
    zathura-pdf-poppler
    bob
)

aur_packages=(
    vesktop
)

remove=(
    signal-desktop
    typora
    obsidian
    obs-studio

)

# --- Generic helper function ---
link_path() {
    local src="$1"
        local dst="$2"

    if [ ! -e "$src" ]; then
        printf 'Source does not exist, skipping: %s\n' "$src" >&2
        return 0
    fi

    # If dst is a symlink pointing to the desired source, skip
    if [ -L "$dst" ] && [ "$(readlink -f "$dst")" = "$(readlink -f "$src")" ]; then
        printf 'Already linked: %s -> %s\n' "$dst" "$src"
        return 0
    fi

    # If destination exists (file/dir/symlink to something else), delete
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        printf 'Deleting %s\n' "$dst"
        rm -fr "$dst"
    fi

    # Create the symlink
    ln -sfn "$src" "$dst"
    printf 'Linked: %s -> %s\n' "$dst" "$src"
}

# configs
for name in "${items[@]}"; do
    link_path "$DOTFILES_DIR/$name" "$CONFIG_DIR/$name"
done

# scripts
link_path "$DOTFILES_DIR/scripts" "$LOCAL_DIR/scripts"

# bashrc
link_path "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

# copy backgroundimages

cp -n "$DOTFILES_DIR/backgrounds/"*.png "$HOME/.config/omarchy/themes/gruvbox/backgrounds/"

sudo pacman -S --needed --noconfirm "${packages[@]}"

yay -S --needed --noconfirm "${aur_packages[@]}"


for pkg in "${remove[@]}"; do
    # Check if installed
    if ! pacman -Q "$pkg" &>/dev/null && ! yay -Q "$pkg" &>/dev/null; then
        echo "$pkg is not installed, skipping."
        continue
    fi

    # Determine source (AUR or official repo)
    repo=$(yay -Qi "$pkg" 2>/dev/null | awk -F': +' '/Repository/ {print $2}')

    if [ "$repo" = "aur" ]; then
        echo "Removing AUR package: $pkg"
        yay -Rns --noconfirm "$pkg"
    else
        echo "Removing repo package: $pkg"
        sudo pacman -Rns --noconfirm "$pkg"
    fi
done

mkdir -p ~/repositories

if [ ! -e "$HOME/.bash_login" ]; then
  touch "$HOME/.bash_login"
fi
