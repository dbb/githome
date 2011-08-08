" Vim color file
" Maintainer:	N Vineeth <nvineeth a-t yahoo>
" Last Change:	2009 May 27
" Version: 0.3

" This color scheme uses a light grey background.
" Based on "morning" color scheme and 
" Tango color palette : http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines#Color_Palette
" The Terminal colors are based on "morning" color scheme and only the gui colors have been modified

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "tango-morning"

hi Normal ctermfg=Black ctermbg=LightGrey guifg=#2e3436 guibg=#d3d7cf

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=#cc0000 guifg=#d3d7cf
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=reverse ctermbg=grey guibg=#babdb6
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=#fce94f
hi Cursor guibg=#8ae234 guifg=NONE
hi lCursor guibg=#8ae234 guifg=NONE
hi Directory term=bold ctermfg=DarkBlue guifg=#3465a4
hi LineNr term=underline ctermfg=Brown guifg=#5c3566 guibg=#babdb6
hi MatchParen guibg=#ad7fa8 guifg=#d3d7cf
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=#4e9a06
hi NonText term=bold ctermfg=Blue gui=bold guifg=#204a87 guibg=#d3d7cf
hi PmenuSel guibg=#204a87 guifg=#d3d7cf
hi Pmenu guibg=#3465a4 guifg=#d3d7cf
hi PmenuSbar guibg=#729fcf guifg=#204a87
hi PmenuThumb guibg=#729fcf guifg=#204a87
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=#4e9a06
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=#edd400 
"hi SpecialKey term=bold ctermfg=DarkBlue guifg=#3465a4
hi SpecialKey term=bold ctermfg=DarkBlue guifg=#babdb6 
hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=#4e9a06
hi WarningMsg term=standout ctermfg=DarkRed guifg=#cc0000
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=#edd400 guifg=#888a85
hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=#d3d7cf guifg=#204a87
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=#d3d7cf guifg=#204a87
hi DiffAdd term=bold ctermbg=LightBlue guibg=#204a87 guifg=#d3d7cf
hi DiffChange term=bold ctermbg=LightMagenta guibg=#e9b96e
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=#3465a4 guibg=#d3d7cf
hi CursorLine term=underline cterm=underline guibg=#555753
hi CursorColumn term=reverse ctermbg=grey guibg=#555753

" Colors for syntax highlighting
hi Comment guifg=#888a85 gui=italic
hi Constant term=underline ctermfg=DarkRed guifg=#c4a000 
hi Identifier guifg=#204a87
"hi Statement term=bold cterm=bold ctermfg=Brown gui=bold guifg=#8f5902
hi Statement term=bold cterm=bold ctermfg=Brown gui=bold guifg=#a40000
"hi PreProc guifg=#204a87
hi PreProc guifg=#5c3566
hi Type guifg=#4e9a06
"hi Special term=bold ctermfg=DarkMagenta guifg=#ce5c00 guibg=#d3d7cf
hi Underlined guifg=#204a87
hi Ignore ctermfg=LightGrey guifg=#555753
hi Error guibg=#cc0000 guifg=#d3d7cf
hi Todo guibg=#fce94f guifg=#204a87

""
hi Operator		guifg=#5c3566 gui=bold
"hi Special		guibg=#888a85 guifg=#8ae234 gui=bold
hi Special		guifg=#4e9a06 gui=bold
hi String		guifg=#f57900

" vim: sw=2
