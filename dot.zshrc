bindkey -v
source ~/.profile
source /usr/share/zsh/scripts/antigen/antigen.zsh

COMPLETION_WAITING_DOTS="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -fr *' 'fg=white,bold,bg=red')
PROJECT_PATHS=(~/sources ~/sources/*)


antigen use oh-my-zsh

antigen bundle git
antigen bundle git-extras
antigen bundle ruby
antigen bundle archlinux
antigen bundle coffee
antigen bundle compleat
antigen bundle encode64
antigen bundle extract
antigen bundle gem
antigen bundle npm
antigen bundle screen
antigen bundle systemd
antigen bundle urltools
antigen bundle pj

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zaw
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme https://gist.github.com/9263734.git psy

antigen apply
source /usr/share/zsh-dwim/init.zsh
