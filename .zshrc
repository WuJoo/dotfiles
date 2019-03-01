if [[ "$OSTYPE" == "darwin"*  ]]; then
  export ZSH="/Users/wj/.oh-my-zsh"
else
  export ZSH="/home/wj/.oh-my-zsh"
fi

ZSH_THEME="avit"

ENABLE_CORRECTION="false"
ZSH_TMUX_AUTOSTART="false"

plugins=(git bundler rails tmux ruby rvm tmux)

source $ZSH/oh-my-zsh.sh
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""' # use silver searcher and show hidden files in fzf
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
