# zshrc (c)dec2006 - 2011 by pSy
# v0.2


[ -f .zsh/prompt ] && source .zsh/prompt
[ -f .zsh/bindings ] && source .zsh/bindings
[ -f .zsh/env ] && source .zsh/env
[ -d .zsh/completion/ ] && source .zsh/completion/*

# {{{ misc
# zmodload -i zsh/pcre
autoload -U colors
colors
#prompt="$USERNAME@$HOST% ~%(!|%{$fg[yellow]%}|%{$fg_bold[black]%})%(?..%{$fg[red]%})%#%{$fg_no_bold[default]%} "
# }}}

# {{{ Set/unset shell options.
setopt \
    brace_ccl inc_append_history hist_ignore_space \
    hist_no_store hist_no_functions hist_ignore_all_dups \
    hist_expire_dups_first no_hup menucomplete\
    no_check_jobs autocd autolist autopushd autoresume \
    cdablevars extendedglob globdots longlistjobs \
    noclobber notify pushdminus pushdsilent \
    pushdtohome rcquotes recexact sunkeyboardhack \
    complete_in_word ZLE

unsetopt bgnice autoparamslash
# }}}

# {{{ Completion Styles
#menustyle selection
zmodload zsh/complist
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/completion_cache
zstyle ':completion:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# autoquote urls (zshversion >4.2)
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Setup new style completion system. To see examples of the old
# style -- compctl based -- programmable completion, check
# Misc/compctl-examples in the zsh distribution.
autoload -U compinit
compinit

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# Formatting and messages.
zstyle ':completion:*' verbose no #yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

# Offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Command for process lists, the local web server details and host
# completion.
zstyle ':completion:*:processes' command 'ps x -o pid,nice,pcpu,tt,args'

# Hosts to use for completion, see later zstyle.
zstyle '*' hosts $(awk '/^[^#]/ {print $3" "$4" "$5}' /etc/hosts)

# Filename suffixes to ignore during completion, except after rm
# command.
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns \
    '*?.o' '*~' # '*?.orig'

# Ignore completion functions, until the _ignored completer.
zstyle ':completion:*:functions' ignored-patterns '_*'

# Disable unused completers.
compdef _default \
    apachectl apm apt apt-show-versions archie arp arping cvsup \
    debchange debfoster debpackages dictwords domains dpkg \
    dpkgsourceelm fetchmail figlet finger iconv \
    ispell java lp mailboxes mail make-kpkg mysqldiff \
    mysqlutils nedit netscape newsgroups pine printers \
    print rlogin slrn spamassassin texi \
    texinfo tiff tin userathost userson w3m yp urpmi rpm

# }}}

