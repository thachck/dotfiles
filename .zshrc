export PATH='/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH'
export ANTIBODY_HOME=/Users/eastagile-tc/.antibody
source ~/.zsh_plugins.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

. /usr/local/opt/asdf/asdf.sh
eval "$(direnv hook zsh)"
source ~/.cargo/env

