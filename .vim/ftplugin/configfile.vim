" Vim syntax file
" Language: Config::File
" Last Change: 2011-07-20
" Author: Daniel Bolton <dbb008@gmail.com>

syn match       configFileOperator      "[=]"
hi link         configFileOperator      Operator

syn match       configFileComment       /#.*/
hi link         configFileComment Comment

syntax match    configFileEscape /\\./
hi link         configFileEscape Special

syn region      configFileString    start=/=/ skip=/\\=/ end=/$/ contains=configFileOperator,configFileEscape,configFileRef
hi link         configFileString        String

"syn match      configFileRef       /\$\w\+/
syn match       configFileRef       /$[[:alnum:]_\.-]\+/
hi link         configFileRef           Identifier

syn region      configFileVar       start=/^/ skip=/\\=/ end=/=/ contains=configFileOperator,configFileEscape,configFileComment,configFileString
hi link     configFileVar       Identifier

