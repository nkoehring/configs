bindkey -v
source ~/pkg/zgen/zgen.zsh
source ~/.zsh/kitty.compl.zsh

if ! zgen saved; then
  echo "running zgen"

  zgen oh-my-zsh
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/pj
  zgen oh-my-zsh plugins/encode64
  zgen oh-my-zsh plugins/urltools
  zgen oh-my-zsh plugins/nvm

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zaw
  zgen load zsh-users/zsh-completions src

  zgen save
fi
source ~/.zsh/koehr.theme.zsh
setopt HIST_IGNORE_DUPS

COMPLETION_WAITING_DOTS="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -fr*' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf*' 'fg=white,bold,bg=red')

PROJECT_PATHS=(~/src/Spenoki ~/src/koehr ~/src/pkg/)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nk/src/pkg/google-cloud-sdk/path.zsh.inc' ]; then . '/home/nk/src/pkg/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/nk/src/pkg/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/nk/src/pkg/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.profile
