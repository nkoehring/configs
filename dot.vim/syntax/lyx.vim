syntax clear

syntax keyword lyxCommand  \\layout
syntax keyword lyxCommand  \\the_end
syntax keyword lyxKey LatexCommand ERT Graphics Float FloatList 
syntax keyword lyxKey status Open  Closed
syntax keyword lyxKey wide collapsed
syntax keyword lyxBinary true false
syntax keyword lyxBinary Open Close
syntax region lyxInset start=/\\begin_inset/ end=/\\end_inset/ contains=ALL fold
syntax region lyxString start=/"/ end=/"/ 

highlight link lyxCommand Keyword
highlight link lyxKey Keyword
highlight link lyxString String
highlight link lyxInset Comment
highlight link lyxBinary Boolean
