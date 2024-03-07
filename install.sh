#!/bin/bash
# https://github.com/ScottJWalter/dotfiles

# Set up symlinks to linke dotfile references in ~ to actual dotfiles in workspace
# (i.e. dotfiles present in this repo)
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

# potential fix for zinit install issues
git config --global core.autocrlf false

echo "Installing fonts ..."
FONT_DIR="$HOME/.fonts"
git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
cd $FONT_DIR
./install.sh

# Link Android SDK into profile
'$ a\export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"' /etc/profile.d/android.sh

echo "Installing zinit ..."
bash -c "NO_EDIT=1 && $(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo "Done!"
exit 0
