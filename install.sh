#!/bin/bash

# Set up symlinks to linke dotfile references in ~ to actual
# dotfiles in workspace
create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}
create_symlinks

# echo "Initializing conda for zsh."
# conda init zsh

echo "Installing fonts."
FONT_DIR="$HOME/.fonts"
git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
cd $FONT_DIR
./install.sh

'$ a\export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"' /etc/profile.d/android.sh

# Create a shortcut to the OhMyZSH custom folder
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

echo "Installing zinit ..."
yes | bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

setopt promptsubst

zinit wait lucid for \
        OMZL::git.zsh \
    atload"unalias grv" \
        OMZP::git

PS1="READY >" # provide a simple prompt till the theme loads

zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::gnzh

zinit wait lucid for \
    atinit"zicompinit; zicdreplay"  \
        zdharma-continuum/fast-syntax-highlighting \
        OMZP::colored-man-pages \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf \
        zsh-users/zsh-completions \
    as"completion" \
        OMZP::docker/_docker

# echo "Adding ZSH syntax highlighting ..."
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
# echo "Adding ZSH plugins ..."
# git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
# git clone --depth=1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# echo "Setting up the Spaceship theme ..."
# git clone --depth=1 -- https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
