# -*- shell-script -*-
# Setup availables prompts

autoload -U promptinit
promptinit

# Usually needed, and not working within the 'prompt_xx_setup' function
setopt prompt_subst 
setopt transient_rprompt		# Auto-hide rprompt after before executing cmd
prompt asyd

return;
