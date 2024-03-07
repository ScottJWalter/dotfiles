setopt promptsubst

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add Android SDK to PATH
ANDROID_HOME=/usr/local/lib/android
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator

# Zinit
zinit light-mode depth=1 for \
	romkatv/powerlevel10k \
	OMZL::history.zsh \
	blockf OMZL::completion.zsh

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# Load PowerLevel10K
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit wait lucid light-mode depth=1 for \
	pasky/speedread \
	atinit"zicompinit; zicdreplay" \
		zdharma-continuum/fast-syntax-highlighting \
	zdharma-continuum/history-search-multi-word \
	atload"bindkey '^[[A' history-substring-search-up; \
			bindkey '^[[B' history-substring-search-down" \
		zsh-users/zsh-history-substring-search

# Plugins.
# plugins=()
# source $ZSH/oh-my-zsh.sh
# Set colors for LS_COLORS.
# eval `dircolors ~/.dircolors`
