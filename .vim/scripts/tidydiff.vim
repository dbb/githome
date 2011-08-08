" tidydiff.vim
"
" https://github.com/dbbolton/
"
" runs perltidy on the current file, then opens the untidy and tidy versions
" in vimdiff

set splitright
set splitbelow

let pos       = line( "." )
let perl_file = expand( "%:p" )
let tidy_file = perl_file . '.tdy'

call system( "perltidy " . perl_file )

exe ":diffsplit " . tidy_file

wincmd h
wincmd k

exe pos


