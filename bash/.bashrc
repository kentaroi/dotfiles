eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"


# When replacing BSD commandline tools with GNU coreutils, uncomment the following:
# if [[ $- == *i* ]]; then
#   PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
# fi

# The following line is needed when the above replacement for GNU coreutils is not enabled.
alias ls='gls --color=auto'

alias tree='tree -aC -I "\.git|node_modules|deps" -N'

[[ -r "$HOME/.bash-config/ripgrep-config.bash" ]] && . "$HOME/.bash-config/ripgrep-config.bash"

[[ -r "$HOME/.bash-config/fzf-config.bash" ]] && . "$HOME/.bash-config/fzf-config.bash"
