# zsh@mbookair
# --- Modes ---
bindkey -v  # vim mode

# --- Aliases ---
alias v="nvim"
alias vi="nvim"
alias ls="ls -A -C -p --color=auto"
alias grep="grep --color=auto"

# --- Oh-My-Zsh ---
export ZSH="$HOME/dotfiles/oh-my-zsh"
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
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# --- MacTeX ---
if [[ -d /Library/TeX/texbin ]]; then
  export PATH="/Library/TeX/texbin:$PATH"
fi

# --- Custom keybindings ---
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^t "template\n"

# --- Telemetry ---
export DO_NOT_TRACK=1
