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
"set undofile


" ruler with clock
" set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" status bar etc ------------------------------------------------------------
set ruler       " show line and column of cursor
set showcmd
set showmode
set ls=2        " always show status bar
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
set statusline=%<%1*───\ %5*%f%1*%(\ ───\ %4*%h%1*%)%(\ ───\ %4*%m%1*%)%(\ ───\ %4*%r%1*%)\ ───%=───\ %2*%b(0x%B)%1*\ ───\ %3*%l,%c%V%1*\ ───\ %5*%P%1*\ ───%0*

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
let mapleader = ","
let g:mapleader = ","

nmap <leader>a A 
nmap <leader>c 0i#<Esc>
nmap <leader>d :close<CR>
nmap <leader>e :colo 
nmap <leader>f :set guifont=*<CR>
nmap <leader>h iprint <<'EOF';<Esc>^
nmap <leader>i o<Esc>p
nmap <leader>o iopen(my $,  "<",  "");<Esc>^f$a
nmap <leader>r @:
nmap <leader>s ddpk
nmap <leader>t :source ~/.vim/scripts/tidydiff.vim
nmap <leader>v "+gP<CR>
nmap <leader>w :w!<CR>

nmap <leader>I ^i <Esc>i

nmap <leader>$ f$li
nmap <leader>@ f@li
nmap <leader>; A;<Esc>^


nmap <leader># i#!/usr/bin/env perl<CR>use strict;
    \<CR>use warnings;<CR>use 5.010;<cr><esc>:set filetype=perl<ENTER>i<CR>

" maps that override default commands
nmap t :tabnew 
"map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc
" ---------------------------------------------------------------------------

" tabs
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set list " make tabs visible
set listchars=tab:>-,trail:-

" the other kind of tabs
nmap <leader>n :tabnext<cr>
nmap <leader>p :tabprevious<cr>

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
call pathogen#runtime_append_all_bundles()
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
" nmap <silent> <BS> :nohlsearch <BAR> call Toggle_CursorColumn('off')<CR>
nmap <silent> <BS> :nohlsearch <CR>

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


" Make BS/DEL work as expected in visual modes (i.e. delete elected)...
vmap <BS> x

" Make vaa select the entire file...
vmap aa VGo1G

"Square up visual selections...
set virtualedit=block

" When shifting, retain selection over multiple shifts...
vmap <expr> > KeepVisualSelection(">")
vmap <expr> < KeepVisualSelection("<")

function! KeepVisualSelection(cmd)
    if mode() ==# "V"
        return a:cmd . "gv"
    else
        return a:cmd
    endif
endfunction



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
nnoremap <Space> <PageDown>

nmap e :e 
