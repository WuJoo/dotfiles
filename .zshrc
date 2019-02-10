if [[ "$OSTYPE" == "darwin"*  ]]; then
  export ZSH="/Users/wj/.oh-my-zsh"
fi

ZSH_THEME="avit"

ENABLE_CORRECTION="true"
ZSH_TMUX_AUTOSTART="true"

plugins=(git bundler rails tmux ruby rvm tmux)

source $ZSH/oh-my-zsh.sh
export PATH="$PATH:$HOME/.rvm/bin"
