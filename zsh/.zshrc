# zsh@archlinux

# --- Modes ---
bindkey -v  # vim mode

# --- Aliases ---
alias vi="nvim"
alias vim="nvim"
alias skim="open -a Skim"
alias grep="grep --color=auto"
alias ls="ls -A -C -p --color=auto"

# --- Oh-My-Zsh ---
export ZSH="$HOME/tuxfiles/oh-my-zsh"
ZSH_THEME="awesomepanda"

plugins=(
  git
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# --- Editor & Pager ---
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# --- PATH additions ---
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

# --- Custom keybindings ---
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^t "template\n"
