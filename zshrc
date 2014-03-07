# Set up the prompt

# autoload -Uz promptinit
# promptinit
# prompt adam1
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt prompt_subst
# prompt
 
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
 
# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
(command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}
 
# show red star if there are uncommitted changes
parse_git_dirty() {
if command git diff-index --quiet HEAD 2> /dev/null; then
echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
else
echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
fi
}
 
# if in a git repo, show dirty indicator + git branch
git_custom_status() {
local git_where="$(parse_git_branch)"
[ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
 
# show current rbenv version if different from rbenv global
rbenv_version_status() {
local ver=$(rbenv version-name)
[ "$(rbenv global)" != "$ver" ] && echo "[$ver]"
}
 
# put fancy stuff on the right
if which rbenv &> /dev/null; then
RPS1='$(git_custom_status)%{$fg[red]%}$(rbenv_version_status)%{$reset_color%} $EPS1'
else
RPS1='$(git_custom_status) $EPS1'
fi
 
# basic prompt on the left
PROMPT='%{$fg[cyan]%}%~% %(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '


setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
