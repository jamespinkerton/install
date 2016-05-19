alias n=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
export PATH=$HOME/.linuxbrew/sbin:$HOME/.linuxbrew/bin:$PATH
export TZ=America/New_York

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

export PROMPT_COMMAND=__prompt_command
function __prompt_command() {
	local EXIT="$?"
	local RCol='\[\e[0m\]' #resets color
	local Red='\[\e[0;31m\]'
	local Green='\[\e[0;32m\]'
	if [ $EXIT != 0 ]; then
		PS1="${Red}\w$ ${RCol}"
	else
		PS1="${Green}\w$ ${RCol}"
	fi
}
