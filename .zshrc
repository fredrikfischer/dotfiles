# Enable command auto-completion
autoload -Uz compinit
compinit

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

# Set default editor
export EDITOR=vim

# Add user bin to PATH
export PATH="$HOME/bin:$PATH"

# vim keybindings
bindkey -v

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
