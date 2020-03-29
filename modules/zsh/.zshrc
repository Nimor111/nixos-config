# motd
pfetch

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Source autojump file
source ~/.nix-profile/etc/profile.d/autojump.sh

# Source virtualenvwrapper file
source ~/.nix-profile/bin/virtualenvwrapper.sh

# 256-color terminal
export TERM=xterm-256color

# direnv setup hook
eval "$(direnv hook zsh)"
