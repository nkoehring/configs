bindkey -v
source ~/.profile
source /usr/share/zsh/scripts/zgen/zgen.zsh

COMPLETION_WAITING_DOTS="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -fr *' 'fg=white,bold,bg=red')
PROJECT_PATHS=(~/private ~/private/* ~/blacklane)


if ! zgen saved; then
    echo "running zgen"

    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/ruby
    zgen oh-my-zsh plugins/coffee
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/screen
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/pj
    zgen oh-my-zsh plugins/command-not-found

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zaw
    zgen load zsh-users/zsh-completions src

    zgen load https://gist.github.com/9263734.git psy

    zgen save
fi

#antigen theme https://gist.github.com/9263734.git psy
