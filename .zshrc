# zsh config

# Autocd and interactive comments
setopt autocd		# Automatically cd into typed directory.
setopt interactive_comments

# Enable command auto-completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
zmodload zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Rebind some keys 
bindkey -v '^?' backward-delete-char
bindkey "^[[1;5C" forward-word
bindkey "^L" forward-word
bindkey "^H" backward-word
bindkey "^[[1;5D" backward-word

# Enable command history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Set prompt
PROMPT='%F{green}%n@%m%f:%~%# '

# Enable color in ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Useful aliases
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias vim='nvim'
alias v='nvim'

# Set default editor
export EDITOR=vim

# Add user bin to PATH
export PATH="$HOME/bin:$PATH"

# Vim keybindings
bindkey -v

# Functions for changing cursor shape based on vim-mode (insert/normal)
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    # Normal mode: block cursor
    print -n "\e[2 q"
  else
    # Insert mode: bar cursor
    print -n "\e[6 q"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-init {
  # Set cursor to bar at start (insert mode)
  print -n "\e[6 q"
}
zle -N zle-line-init

function zle-line-finish {
  # Optionally reset cursor to block when leaving line
  print -n "\e[2 q"
}
zle -N zle-line-finish

# Removes ESC lag
KEYTIMEOUT=1


source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
