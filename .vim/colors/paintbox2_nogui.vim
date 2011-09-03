" Description:	A colourful, happy scheme with high contrast
"  Maintainer:	kamil.stachowski@gmail.com
"     License:	gpl 3+
"     Version:	0.1 (2008.12.05)

"   Changelog:
"         0.1:	2008.12.05
"       		initial version


set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "paintbox"


" black		17171a
" blue		238bcc
" green		9fc439
" grey		5a5a5a
" raspberry	bd0d74
" orange	e08a1f
" violet	904ca8
"
" yellow	d9ba21

" diff*
" pmenu

hi Comment		guifg=#5a5a5a	guibg=#17171a	gui=none
hi Cursor 		guifg=#17171a	guibg=#dddddd	gui=none
hi Constant 	guifg=#24b39b	guibg=#17171a	gui=none
hi CursorLine		          	guibg=#343434	gui=none
hi Folded 		guifg=#dddddd	guibg=#5a5a5a	gui=none
hi MatchParen	guifg=#bd0d74	guibg=#17171a	gui=reverse
hi ModeMsg		guifg=#bd0d74	guibg=#17171a	gui=none
hi Normal 		guifg=#dddddd	guibg=#17171a	gui=none
hi PreProc		guifg=#bd0d74	guibg=#17171a	gui=none
hi Search		guifg=#17171a	guibg=#d9ba21	gui=none
hi Special		guifg=#ff9500	guibg=#17171a	gui=none
hi Statement	guifg=#cc2a14	guibg=#17171a	gui=none
hi StatusLine 	guifg=#bd0d74	guibg=#dddddd	gui=none
hi StatusLineNC guifg=#dddddd	guibg=#585858	gui=none
hi Todo 		guifg=#cf310c	guibg=#17171a	gui=none
hi Type 		guifg=#e08a1f	guibg=#17171a	gui=none
hi Underlined	guifg=#00ff00	guibg=#17171a	gui=underline
hi Visual		guifg=#17171a	guibg=#d9ba21	gui=none

hi! link Boolean		Constant
hi! link Character		Constant
"hi! link Conditional	Statement
hi Conditional guifg=#8a36b3 gui=none
hi! link CursorColumn	CursorLine
hi! link Debug			Special	
hi! link Define			PreProc
"hi! link Delimiter		Special
hi! link Directory		Type
hi! link Error			Todo
hi! link ErrorMsg		Error
hi! link Exception		Statement
hi! link Float			Constant
hi! link FoldColumn		Folded
"hi! link Function		Normal
"hi! link Identifier		Special
hi! link Ignore			Comment
hi! link IncSearch		Search
hi! link Include		PreProc
"hi! link Keyword		Statement
hi! link Label			Statement
hi! link LineNr			Comment
hi! link Macro			PreProc
hi! link MoreMsg		ModeMsg
hi! link NonText		Comment
hi! link Number			Constant
"hi! link Operator		Special
hi! link PreCondit		PreProc
hi! link Question		MoreMsg
"hi! link Repeat			Statement
hi! link SignColumn		FoldColumn
"hi! link SpecialChar	Special
"hi! link SpecialComment	Special
"hi! link SpecialKey		Special
hi! link SpellBad		Error
hi! link SpellCap		Error
hi! link SpellLocal		Error
hi! link SpellRare		Error
hi! link StorageClass	Type
"hi! link String			Constant
hi! link Structure		Type
"hi! link Tag			Special
hi! link Title			ModeMsg
hi! link Typedef		Type
hi! link VertSplit		StatusLineNC
hi! link WarningMsg		Error

hi Delimiter		guifg=#00ff00
hi Function			guifg=#e64588
hi Identifier		guifg=#9fc439
hi LineNr			guibg=#212126 guifg=#44444f
hi Operator			guifg=#801980 gui=none
hi SpecialKey		guifg=#44444f
hi Tag				guifg=#ff0000

hi Repeat guifg=#4b36b3
hi Keyword guifg=#cc5b14
hi String guifg=#238bcc
hi Number guifg=#24b39b
