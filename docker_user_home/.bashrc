# Modify the bash prompt as follows:
# * Show the name of the machine in green if last command succeeded, otherwise red.
# * Print the working directory relative to HOME
# * Line break so that command can use full width of window.
PS1="\[\`if [[ \$? = "0" ]]; then echo \e[32m\h\e[0m; else echo \e[31m\h\e[0m ; fi\`"
PS1="$PS1:\w"                             # ":<current directory>"
PS1="$PS1"'\n\$ '                         # new line and "$"


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lh"
alias ll="ls -lah"

function mkcd() {
	mkdir $1
	cd $1
}
