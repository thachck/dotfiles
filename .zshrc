##############################################################################
# Paths Configuration
##############################################################################
export PATH='/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH'
export ANTIBODY_HOME=/Users/eastagile-tc/.antibody

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=500               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=500               #Number of history entries to save to disk

setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

##############################################################################
# Compinit lazy loading
##############################################################################
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

##############################################################################
# Sourcing Configuration
##############################################################################
source ~/.zsh_plugins.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"
source ~/.cargo/env
. /usr/local/opt/asdf/asdf.sh


