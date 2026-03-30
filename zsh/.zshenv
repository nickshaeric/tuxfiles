# zshenv@mbookair
export ZDOTDIR="$HOME"

# Move runtime files out of $HOME
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-$HOST-$ZSH_VERSION"
export ZSH_SESSION_DIR="$HOME/.cache/zsh/sessions"

# Ensure directories exist
mkdir -p "$HOME/.cache/zsh/sessions"
