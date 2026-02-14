# zshenv@archlinux
# ensure directories exist
mkdir -p "$HOME/.cache/zsh/sessions"

export ZDOTDIR="$HOME"

# move runtime files out of $HOME
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-$HOST-$ZSH_VERSION"
export ZSH_SESSION_DIR="$HOME/.cache/zsh/sessions"

