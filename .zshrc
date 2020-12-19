##############################################################################
# Paths Configuration
##############################################################################
export PATH='/usr/local/opt/asdf/bin:Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
export ANTIBODY_HOME=/Users/thachchau/.antibody
export SPRING_TMP_PATH=/Users/thachchau/.spring
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=1500               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=1500               #Number of history entries to save to disk

setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

##############################################################################
# Alias Configuration
##############################################################################
alias g='git'
##############################################################################
# Sourcing Configuration
##############################################################################
source ~/.zsh_plugins.sh
source ~/.fzf.zsh
source /usr/local/opt/asdf/lib/asdf.sh
_evalcache asdf exec direnv hook zsh
_evalcache starship init zsh
direnv() { asdf exec direnv "$@"; }
export RUBYOPT="--jit"
export ZSH_HIGHLIGHT_MAXLENGTH=20
zstyle ':completion:*' tag-order '! history-words recent-directories recent-files' '-'
zstyle ':autocomplete:tab:*' widget-style menu-complete
