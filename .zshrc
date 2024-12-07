#!/bin/zsh
setopt promptsubst

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Add Android SDK to PATH
# ANDROID_HOME=/usr/local/lib/android
# export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/emulator

# Alias to make it more convenient to launch into the vscode editor
# from the command line
alias code="code -r"

# A binary Zsh module which transparently and automatically compiles sourced scripts
module_path+=( "${HOME}/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin &>/dev/null

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
