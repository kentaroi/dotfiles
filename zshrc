case "$TERM" in
  xterm*) TERM=xterm-256color
esac

source ~/.zsh/prompt

alias ls='ls --color=auto'

## I can spell
unsetopt correct
unsetopt correct_all


# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e


# C-x C-e to edit command-line in EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line


# History
setopt inc_append_history

# When you use both local and shared history, hist_ignore_all_dups should not be set.
# Because it can break other terminal's local history.
setopt share_history

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=4096
SAVEHIST=4096
HISTFILE=~/.zsh_history

# Local zsh history (Ctrl+p, Ctrl+n)
bindkey "^P" up-line-or-local-history
bindkey "^N" down-line-or-local-history

# Global zsh history (Alt+p, Alt+n)
bindkey "^[p" up-line-or-history
bindkey "^[n" down-line-or-history

up-line-or-local-history() {
  zle set-local-history 1
  zle up-line-or-history
  zle set-local-history 0
}
zle -N up-line-or-local-history

down-line-or-local-history() {
  zle set-local-history 1
  zle down-line-or-history
  zle set-local-history 0
}
zle -N down-line-or-local-history


# Use modern completion system
autoload -Uz compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done

# set LS_COLORS as bash default
eval `dircolors -b`

zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} ma=0\;32
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
#
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source ~/.oauth_keys_and_secrets_for_development

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

eval "$(direnv hook zsh)"

