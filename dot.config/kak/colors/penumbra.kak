# Catppuccin theme for Kakoune

# Color palette
declare-option	str	rosewater			'rgb:CB7459'
declare-option	str	red					'rgb:CA7081'
declare-option	str	mauve				'rgb:CA736C'
declare-option	str	maroon				'rgb:F2E6D4'
declare-option	str	pink				'rgb:BD72A8'
declare-option	str	cyan				'rgb:00A0BE'
declare-option	str	yellow				'rgb:A38F2D'
declare-option	str	green				'rgb:46A473'
declare-option	str	white				'rgb:BEBEBE'
declare-option	str	blue				'rgb:7E87D6'
declare-option	str	sky					'rgb:6E8DD5'
declare-option	str	lavender			'rgb:BC73A4'
declare-option	str	black1				'rgb:24272B'
declare-option	str	black2				'rgb:2F3339'
declare-option	str black3				'rgb:3E4044'
declare-option	str orange				'rgb:C27D40'
declare-option	str teal				'rgb:00A2AF'
declare-option	str	gray0				'rgb:585b70'
declare-option	str	gray1				'rgb:6c7086'
declare-option	str	bright_red			%opt{red}
declare-option	str	bright_green		%opt{green}
declare-option	str	bright_yellow		%opt{yellow}
declare-option	str	bright_blue			%opt{blue}
declare-option	str	bright_cyan			%opt{cyan}
declare-option	str	bright_white		'rgb:FFF7ED'
declare-option	str	foreground			%opt{white}
declare-option	str	background			%opt{black2}

# Markup
set-face	global	title				"%opt{rosewater}"
set-face	global	header				"%opt{bright_red}"
set-face	global	bold				"%opt{mauve}"
set-face	global	italic				"%opt{lavender}"
set-face	global	mono				"%opt{green}"
set-face	global	block				"%opt{cyan}"
set-face	global	link				"%opt{green}"
set-face	global	bullet				"%opt{green}"
set-face	global	list				"%opt{white}"

# Builtins
set-face	global	Default				"%opt{white},%opt{background}"
set-face	global	PrimarySelection	"%opt{bright_white},%opt{rosewater}"
set-face	global	SecondarySelection	"%opt{lavender},%opt{gray0}"
set-face	global	PrimaryCursor		"%opt{background},%opt{rosewater}"
set-face	global	SecondaryCursor		"%opt{black1},%opt{teal}"
set-face	global	PrimaryCursorEol	"%opt{gray0},%opt{mauve}"
set-face	global	SecondaryCursorEol	"%opt{gray0},%opt{maroon}"
set-face	global	LineNumbers			"%opt{gray1},%opt{background}"
set-face	global	LineNumberCursor	"%opt{rosewater},%opt{background}+b"
set-face	global	LineNumbersWrapped	"%opt{teal},%opt{black1}+i"
set-face	global	MenuForeground 		"%opt{white},%opt{gray0}+b"
set-face	global	MenuBackground		"%opt{white},%opt{black3}"
set-face	global	MenuInfo			"%opt{black1},%opt{blue}"
set-face	global	Information			"%opt{black1},%opt{blue}"
set-face	global	Error				"%opt{red},%opt{black2}"
set-face	global	StatusLine			"%opt{white},%opt{black1}"
set-face	global	StatusLineMode		"%opt{black2},%opt{yellow}"
set-face	global	StatusLineInfo		"%opt{background},%opt{green}"
set-face	global	StatusLineValue		"%opt{orange},%opt{gray0}"
set-face	global	StatusCursor		"%opt{black1},%opt{lavender}"
set-face	global	Prompt				"%opt{green},%opt{black2}"
set-face	global	MatchingChar		"%opt{maroon},%opt{black2}"
set-face	global	Whitespace			"%opt{gray1},%opt{background}+f"
set-face	global	WrapMarker			Whitespace
set-face	global	BufferPadding		"%opt{background},%opt{background}"
set-face	global	MatchingChar		"%opt{bright_white},%opt{black1}+b"

# Code
set-face	global	value				"%opt{orange}"
set-face	global	type				"%opt{mauve}"
set-face	global	variable			"%opt{white}"
set-face	global	module				"%opt{maroon}"
set-face	global	function			"%opt{sky}"
set-face	global	string				"%opt{green}"
set-face	global	keyword				"%opt{blue}"
set-face	global	operator			"%opt{blue}"
set-face	global	attribute			"%opt{green}"
set-face	global	comment				"%opt{gray1}"
set-face	global	documentation		comment
set-face	global	meta				"%opt{pink}"
set-face	global	builtin				"%opt{lavender}+b"
