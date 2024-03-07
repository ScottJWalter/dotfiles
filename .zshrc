export ZSH="${HOME}/.oh-my-zsh"

# Theme.
ZSH_THEME="spaceship"
export SPACESHIP_DIR_TRUNC=0

# source "$ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Plugins.
plugins=(
    command-not-found
)

source $ZSH/oh-my-zsh.sh

# Set colors for LS_COLORS.
eval `dircolors ~/.dircolors`

# Add Android SDK to PATH
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator
