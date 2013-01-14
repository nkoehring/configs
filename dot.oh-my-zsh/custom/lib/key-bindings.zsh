man-command ()
{
	if [ -n "$BUFFER" ]
	then
		local FirstArg=`echo $BUFFER | awk '{print $1}'`
		man $FirstArg
	fi
}

sudo-command ()
{
	if [ -n "$BUFFER" ]
	then
		local FirstArg=`echo $BUFFER | awk '{print $1}'`
		if [ "$FirstArg" != "sudo" ]
		then
			BUFFER="sudo $BUFFER"
			zle end-of-line
		fi
	fi
}

move-pointer-to-next-arg ()
{
	if [ -n "$BUFFER" ]
	then
			CURSOR=`echo | awk '
			{ curpos=5; arg=$BUFFER; orig=arg;
			arg=substr(arg, curpos);
			if (substr(arg, 1, 1) == "-") arg=substr(arg, 2);
			curpos+=index(arg, "-");
			print curpos; }'`
	fi
}

move-pointer-after-command ()
{
	if [ -n "$BUFFER" ]
	then
		local LenOfFirstArg=`echo $BUFFER | awk '{ print length($1) }'`
		CURSOR=$LenOfFirstArg
	fi
}

bmi ()
{
    echo $(($1/$2/$2))
}

zle -N man-command				# shows the man-page of the written command
zle -N sudo-command				# writes "sudo " in front of the buffer
zle -N move-pointer-after-command	# moves the pointer between command and first parameter
zle -N move-pointer-to-next-arg


bindkey -e
bindkey '\ew' kill-region
bindkey -s '\el' "ls\n"
bindkey '^r' history-incremental-search-backward

bindkey '^[[1~' beginning-of-line	    # [Begin]
bindkey '^[[2~' overwrite-mode		    # [Insert]
bindkey '^[[3~' delete-char		        # [Delete]
bindkey '^[[4~' end-of-line		        # [End]
bindkey "^[[5~" up-line-or-history      # [Page-Up]
bindkey "^[[6~" down-line-or-history    # [Page-Down]

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[H" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[OF" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

#bindkey "^[[1;5C" forward-word
#bindkey "^[[1;5D" backward-word
#TODO: make keybindings ctrl+right and ctrl+left work
bindkey "^[[OC" move-pointer-to-next-arg
bindkey "^[[OD" move-pointer-after-command

bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

bindkey '^N'	man-command
bindkey '^S'	sudo-command
bindkey '^U'	kill-whole-line
bindkey '^Q'	push-input
bindkey '^P'	yank
bindkey '^f'    forward-word
bindkey '^b'    backward-word

# some command shortcuts
alias ls='ls --color=always'
alias lh='ls -lh'
alias ls_sizesorted='ls -lSrah'
alias lad='ls -d .*(/)'                # only show dot-directories
alias lsa='ls -a .*(.)'                # only show dot-files
alias lss='ls -l *(s,S,t)'             # only files with setgid/setuid/sticky flag
alias lsl='ls -l *(@[1,10])'           # only symlinks
alias lsx='ls -l *(*[1,10])'           # only executables
alias lsw='ls -ld *(R,W,X.^ND/)'       # world-{readable,writable,executable} files
alias lsbig="ls -flh *(.OL[1,10])"     # display the biggest files
alias lsd='ls -d ^.*(/)'               # only show directories
alias lse='ls -d *(/^F)'               # only show empty directories
alias lsnew="ls -drl *(Dom[1,10])"     # display the newest files and directories
alias lsold="ls -rtlh *(Dom[1,10])"    # display the oldest files and directories
alias lssmall="ls -Srl *(.oL[1,10])"   # display the smallest files
alias screensaver='clear; for ((;;)); do echo -ne "\033[$((1+RANDOM%LINES));$((1+RANDOM%COLUMNS))H\033[$((RANDOM%2));3$((RANDOM%8))m$((RANDOM%10))"; sleep 0.1 ; done'  # credits to lkj@commandlinefu.com

# global aliases – like aliases working _behind_ the command
alias -g _C='|wc -l'
alias -g _G='|grep'
alias -g _H='|head'
alias -g _L='|less'
alias -g _N='&>/dev/null'
alias -g _R='| tr A-z N-za-m'
alias -g _T='|tail'
#
# Unbind c-s and c-q
stty -ixon

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
#
