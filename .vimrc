" dbbolton's .vimrc
"

" don't use vi settings
set nocompatible

" diff options
set diffopt=vertical,iwhite,filler
set noscrollbind

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" diable auto-commenting
set formatoptions=lnq
autocmd FileType * set formatoptions=lnq
autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType gtkrc set commentstring=#\ %s

" web stuff ---------------------------------------------------------
autocmd FileType css        setlocal sw=2 ts=2 sts=2 textwidth=79
autocmd FileType html       setlocal sw=2 ts=2 sts=2 textwidth=0
autocmd FileType javascript setlocal sw=4 ts=4 sts=4 textwidth=79
autocmd FileType xhtml      setlocal sw=2 ts=2 sts=2 textwidth=0
autocmd FileType xml        setlocal sw=2 ts=2 sts=2 textwidth=0

autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags

" end web stuff -----------------------------------------------------

"  xdefaults
autocmd FileType xdefaults set commentstring=!\ %s
autocmd BufWritePost *.Xdefaults :!xrdb -load ~/.Xdefaults



" concealment
if !has('conceal')
    finish
endif

"syntax keyword string \t conceal

" end concealment

" break long lines in plain text files
" use gqq
"set textwidth=78

" copy indentation from preceding line
"set autoindent

" what backsapce can delete in i mode
set backspace=eol,start,indent

" keep x commands/search patterns
set history=50

set hlsearch " highlight search results

set mouse=a " mouse support"

" show line numbers relative to current line
"set relativenumber
set number

" create .un~ file
" set undofile

" use a somewhat secure crypt method
set cryptmethod=blowfish
" use :X to encrypt

" ruler with clock
" set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" highlight trailing whitespace
autocmd BufWritePost *.Xdefaults :!xrdb -load ~/.Xdefaults



" concealment
if !has('conceal')
    finish
endif

"syntax keyword string \t conceal

" end concealment

" break long lines in plain text files
" use gqq
"set textwidth=78

" copy indentation from preceding line
"set autoindent

" what backsapce can delete in i mode
set backspace=eol,start,indent

" keep x commands/search patterns
set history=50

set hlsearch " highlight search results

set mouse=a " mouse support"

" show line numbers relative to current line
"set relativenumber
set number

" create .un~ file
" set undofile

" use a somewhat secure crypt method
set cryptmethod=blowfish
" use :X to encrypt

" highlight trailing whitespace
match ErrorMsg '\s\+$'

" ruler with clock
" set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" status bar etc ------------------------------------------------------------
set ruler       " show line and column of cursor
set showcmd
set showmode
set ls=2        " always show status bar
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"set statusline=%<%1*───\ %6*%f%1*%(\ ───\ %4*%h%1*%)%(\ ───\ %4*%m%1*%)%(\ ───\ %4*%r%1*%)\ ───%=───\ %2*%b(0x%B)%1*\ ───\ %3*%l,%c%V%1*\ ───\ %5*%P%1*\ ───%0*

" For ancient machines and operating systems that can't handle UTF-8
" set statusline=%<%1*---\ %6*%f%1*%(\ ---\ %4*%h%1*%)%(\ ---\ %4*%m%1*%)%(\ ---\ %4*%r%1*%)\ ---%=---\ %2*%b(0x%B)%1*\ ---\ %3*%l,%c%V%1*\ ---\ %5*%P%1*\ ---%0*
set statusline=%<%1*\ \ \ %6*%f%1*%(\ \ \ \ %4*%h%1*%)%(\ \ \ \ %4*%m%1*%)%(\ \ \ \ %4*%r%1*%)\ \ \ %=\ \ \ %2*%b(0x%B)%1*\ \ \ \ %3*%l,%c%V%1*\ \ \ \ %5*%P%1*\ \ \ %0*
" horizontal lines
hi User1 guibg=#090909 guifg=#212121 gui=none
" char info
hi User2 guibg=#090909 guifg=#4c92d9 gui=none
" line, col
hi User3 guibg=#090909 guifg=#cc3629 gui=none
" [+] 
hi User4 guibg=#000000 guifg=#924cd9 gui=bold
" file
hi User5 guibg=#090909 guifg=#67c439 gui=none
"
hi User6 guibg=#090909 guifg=#e6aa00 gui=none

" powerline 

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" highlight the line or column containing the cursor

"
" status bar etc ------------------------------------------------------------
set ruler       " show line and column of cursor
set showcmd
set showmode
set ls=2        " always show status bar
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"set statusline=%<%1*───\ %6*%f%1*%(\ ───\ %4*%h%1*%)%(\ ───\ %4*%m%1*%)%(\ ───\ %4*%r%1*%)\ ───%=───\ %2*%b(0x%B)%1*\ ───\ %3*%l,%c%V%1*\ ───\ %5*%P%1*\ ───%0*

" For ancient machines and operating systems that can't handle UTF-8
" set statusline=%<%1*---\ %6*%f%1*%(\ ---\ %4*%h%1*%)%(\ ---\ %4*%m%1*%)%(\ ---\ %4*%r%1*%)\ ---%=---\ %2*%b(0x%B)%1*\ ---\ %3*%l,%c%V%1*\ ---\ %5*%P%1*\ ---%0*
set statusline=%<%1*\ \ \ %6*%f%1*%(\ \ \ \ %4*%h%1*%)%(\ \ \ \ %4*%m%1*%)%(\ \ \ \ %4*%r%1*%)\ \ \ %=\ \ \ %2*%b(0x%B)%1*\ \ \ \ %3*%l,%c%V%1*\ \ \ \ %5*%P%1*\ \ \ %0*
" horizontal lines
hi User1 guibg=#090909 guifg=#212121 gui=none
" char info
hi User2 guibg=#090909 guifg=#4c92d9 gui=none
" line, col
hi User3 guibg=#090909 guifg=#cc3629 gui=none
" [+] 
hi User4 guibg=#000000 guifg=#924cd9 gui=bold
" file
hi User5 guibg=#090909 guifg=#67c439 gui=none
"
hi User6 guibg=#090909 guifg=#e6aa00 gui=none

" powerline 

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" highlight the line or column containing the cursor

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'

set cursorline
" set cursorcolumn
highlight CursorLine ctermbg=black guibg=black
highlight CursorColumn ctermbg=black guibg=black
set showcmd " show partially entered commands
set showmode " display INSERT when in i mode
set whichwrap=h,l,~,[,],<,>
set wildmode=list:longest,full
set wrap

" allow pasting in the console
"set paste

syntax on


" force a file's syntax highlighting type
au BufNewFile,BufRead .vimperatorrc setf vim
au BufNewFile,BufRead *.md set filetype=md
au BufNewFile,BufRead *.cf set filetype=configfile
au BufNewFile,BufRead *.z* set filetype=zsh

" extra bindings ------------------------------------------------------------
let mapleader = "<Space>"
let g:mapleader = "<Space>"


" classic cut/copy/paste
noremap <leader>a ggVG
noremap <leader>c "+y
noremap <leader>v "+gP
noremap <leader>x "+x

" experimental Pentadactyl-style 
nnoremap <C-v><C-a> ggVG
inoremap <C-v><C-a> <Esc>ggVG

nnoremap <C-v><C-v> "+gP
inoremap <C-v><C-v> <Esc>"+gPi

noremap <C-v><C-c> "+y
noremap <C-v><C-x> "+x

" scroll half-page in normal mode
nnoremap <Space> <C-d> 
nnoremap <S-Space> <C-u> 

nnoremap <leader>l :<Up>
"append with a space
nnoremap <leader>A A 
" alt. to commentary's binding
nnoremap <leader>C \\\<Esc>
" close tab/windows
nnoremap <leader>d :close<CR>
" search
nnoremap <leader>f /
" cd to where most of my editing takes place
nnoremap <leader>g cd ~/src/gh
" Perl heredoc
nnoremap <leader>h iprint <<'EOF';<CR>EOF<Esc>O
" go to the tab on the right
nnoremap <leader>n :tabnext<cr>
" Perl open file for reading
nnoremap <leader>o iopen( my $,  "<",  "" );<Esc>F$a
" go to the tab on the left
nnoremap <leader>p :tabprevious<cr>
" repeat last ex command
nnoremap <leader>r @:
" swap current line with one below it
nnoremap <leader>s ddpk
" toggle the NERDTree window
nnoremap <leader>t :NERDTreeToggle<CR>
" write
nnoremap <leader>w :w!<CR>

" add to beginning of line with a space
nnoremap <leader>I ^i <Esc>i
" open a NERDTree in the dir where the current file is
nnoremap <leader>N :NERDTree %<CR>
" newline padded p
nnoremap <leader>P o<ESC>p


nnoremap <leader>V :'<,'> 

" change a scalar name
nnoremap <leader>$ f$lcw
" change array name
nnoremap <leader>@ f@lcw
" append a semicolon
nnoremap <leader>; A;<Esc>^


nnoremap <leader># i#!/usr/bin/env perl<CR>use strict;
    \<CR>use warnings;<CR>use 5.020;<cr><esc>:set filetype=perl<ENTER>i<CR>

" maps that override default commands
nnoremap e :e 
nnoremap t :tabnew 
"map <leader>e :e! ~/.vimrc<cr>

" Remove Trailing Whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" prevent accidental ex-mode
nnoremap Q <nop>

" disable highlight
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" command maps
cnoremap w!! w !sudo tee > /dev/null %

"autocmd! bufwritepost vimrc source ~/.vimrc
" ---------------------------------------------------------------------------

" tabs
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set list " make tabs visible
set listchars=tab:>-,trail:-
set nolist " Due to a list 'feature' that breaks breakat, we will only enable
           " list as needed.

" text inserted before wrapped lines when wrap is set
set showbreak=\ \ \ 
set linebreak

" the other kind of tabs

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


function! CurDir()
    let curdir = substitute(getcwd(), '/home/dbb/', "~/", "g")
    return curdir
endfunction

if $TERM == 'rxvt-unicode'
	colorscheme lucius88
else
	colorscheme slate
endif

" pthogen
filetype off
call pathogen#infect('bundle/{}')
call pathogen#helptags()

" turn filetype back on
"filetype on
"filetype plugin on " turn off to disable auto-commenting
filetype indent plugin on

" custom function
"function DarkDefault()
"    colo default
"    set background=dark
"    hi Normal guibg=black guifg=white
"endfunction

function! Cdhere()
    :cd %:p:h
endfunction
command! Cd call Cdhere()

function! SetExecutableBit()
  let fname = expand("%:p")
  checktime
  execute "au FileChangedShell " . fname . " :echo"
  silent !chmod a+x %
  checktime
  execute "au! FileChangedShell " . fname
endfunction
command! Xbit call SetExecutableBit()

function! FixCSS()
    let pos = line( "." )
    silent :%s/{/\ {\r/g
    silent :%s/}/\r}\r\r/g
    silent :%s/;/;\r/g
    exe pos
endfunction
command! Fixcss call FixCSS()

if !exists("*ReloadConfigs")
  function ReloadConfigs()
      :source ~/.vimrc
      if has("gui_running")
          :source ~/.gvimrc
      endif
  endfunction
  command! Recfg call ReloadConfigs()
endif
autocmd! BufWritePost .vimrc Recfg
autocmd! BufWritePost .gvimrc Recfg

function! Gpush()
    :Git push origin master
endfunction

" some stuff from Damian Conway's vimrc #####################################

"====[ I'm sick of typing :%s/.../.../g ]=======
nmap S  :%s//g<LEFT><LEFT>
vmap S  :s//g<LEFT><LEFT>

"====[ Set up smarter search behaviour ]=======================
set incsearch                       "Lookahead as search pattern specified
set ignorecase                      "Ignore case in all searches...
set smartcase                       "...unless uppercase letters used
set hlsearch                        "Highlight all search matches

"Delete in normal mode to switch off highlighting till next search and clear messages...
"nmap <silent> <BS> :nohlsearch <BAR> call Toggle_CursorColumn('off')<CR>
nmap <silent> <BS> :nohlsearch<CR>

"Double-delete to remove search highlighting *and* trailing whitespace...
nmap <silent> <BS><BS>  mz:%s/\s\+$//g<CR>`z:nohlsearch<CR>

"======[ Magically build interim directories if necessary ]===================

function! AskQuit (msg, options, quit_option)
    if confirm(a:msg, a:options) == a:quit_option
        exit
    endif
endfunction

function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        call AskQuit("Parent directory '" . required_dir . "' doesn't exist.",
             \       "&Create it\nor &Quit?", 2)

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'",
            \            "&Quit\nor &Continue anyway?", 1)
        endtry
    endif
endfunction

augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END


"=====[ Make Visual modes work better ]==================

" Visual Block mode is far more useful that Visual mode (so swap the commands)...
" nnoremap v <C-V>
" nnoremap <C-V> v

" vnoremap v <C-V>
" vnoremap <C-V> v

" " Make BS/DEL work as expected in visual modes (i.e. delete elected)...
" vmap <BS> x

" " Make vaa select the entire file...
" vmap aa VGo1G

" "Square up visual selections...
" set virtualedit=block

" " When shifting, retain selection over multiple shifts...
" vmap <expr> > KeepVisualSelection(">")
" vmap <expr> < KeepVisualSelection("<")

" function! KeepVisualSelection(cmd)
"     if mode() ==# "V"
"         return a:cmd . "gv"
"     else
"         return a:cmd
"     endif
" endfunction

" " Temporarily add a column indicator when inserting or appending in visual mode...
" " (Should use <C-O> instead, but it doesn't seem to work)
" vnoremap <silent>  I  I<C-R>=TemporaryColumnMarkerOn()<CR>
" vnoremap <silent>  A  A<C-R>=TemporaryColumnMarkerOn()<CR>

" function! TemporaryColumnMarkerOn ()
"     let g:prev_cursorcolumn_state = g:cursorcolumn_visible ? 'on' : 'off'
"     call Toggle_CursorColumn('on')
"     inoremap <silent>  <ESC>  <ESC>:call TemporaryColumnMarkerOff(g:prev_cursorcolumn_state)<CR>
"     return ""
" endfunction

" function! TemporaryColumnMarkerOff (newstate)
"     call Toggle_CursorColumn(a:newstate)
"     iunmap <ESC>
" endfunction


"=====[ Configure % key ]==============================

" Match angle brackets
set matchpairs+=<:>

let TO = ':'
let OR = ','

" Match double-angles, XML tags and Perl keywords
let b:match_words =
\
\                          '<<' .TO. '>>'
\
\.OR.     '<\@<=\(\w\+\)[^>]*>' .TO. '<\@<=/\1>'
\
\.OR. '\<if\>' .TO. '\<elsif\>' .TO. '\<else\>'

" Engage debugging mode to overcome bug in matchpairs matching...
let b:match_debug = 1


"=====[ Miscellaneous features (mainly options) ]=====================

set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings
                                    "but prefer Unix endings

"Adjust keyword characters for Perlish identifiers...
set iskeyword+=$
set iskeyword+=%
set iskeyword+=@
set iskeyword-=,

set scrolloff=2                     "Scroll when 2 lines from top/bottom


"=====[ Remap various keys to something more useful ]========================

" Use space to jump down a page (like browsers do)...
" nnoremap <Space> <PageDown>


