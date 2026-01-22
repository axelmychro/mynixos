clear -x

BLUE='\[\e[38;2;142;197;255m\]'
PURPLE='\[\e[38;2;218;178;255m\]'
RESET='\[\e[0m\]'

alias maintenance='codium ~/nixos/'
alias kingdomcome='sudo nixos-rebuild switch && reboot'
alias oopsmybad='sudo nixos-rebuild switch --rollback && reboot'

alias ricenow='codium ~/.config/fastfetch/ && codium ~'

alias bb='exec bash'

# PS1="[${BLUE}endmin${RESET}@${PURPLE}\h${RESET} \W]$ "
fastfetch
eval "$(oh-my-posh init bash --config ~/gruvbox.omp.json)"