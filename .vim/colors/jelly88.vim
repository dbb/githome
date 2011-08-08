" Vim color file
" Maintainer:	Daniel Bolton <danielbarrettbolton at gmail>
" Last Change:	$Date: 2004/06/13 19:30:30 $
" Last Change:	$Date: 2004/06/13 19:30:30 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="jelly88"






" statusline stuff
hi User1 ctermbg=black ctermfg=82
hi User2 ctermbg=black ctermfg=14 
hi User3 ctermbg=black ctermfg=9
hi User4 ctermbg=black ctermfg=13
hi User5 ctermbg=black ctermfg=10

