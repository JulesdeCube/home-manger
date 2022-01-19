" $VIMRUNTIME/syntax/c.vim : c standar
" $HOME/.vim/syntax/c.vim : file
" Highlight all function names
syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
highlight def link cCustomFunc Function
highlight cCustomFunc ctermfg=2

" operations
" + - * / % << >> > < = == += -= *= /= %= >>= <<= != ! ~
syntax match cOperator "\(&\||\|\.\|\~\|!\|+\|=\|-\|%\([^:]\|$\)\|\^\|\*\|>\|<\|/\([^*/]\|$\)\)"
highlight cOperator ctermfg=1

syn match cParens /[(){}]/
syn match cSeparator ",\|;\|->"

syn keyword cSTDLib free malloc calloc realloc open fopen fread read write fwrite 
syn keyword cSTDLib err errx printf fprintf putc puts fputs fputc putchar fclose
highlight cSTDLib ctermfg=2 cterm=italic


highlight cParens ctermfg=7
highlight cSeparator ctermfg=7

highlight cTypedef ctermfg=1 
highlight cStructure ctermfg=6 cterm=italic
highlight cType ctermfg=6 cterm=italic
highlight cStorageClass ctermfg=1 cterm=italic
highlight cInclude ctermfg=1
highlight cIncluded ctermfg=3
highlight cDefine ctermfg=1
highlight cString ctermfg=3
highlight cRepeat ctermfg=1
highlight cConditional ctermfg=1
highlight cStatement ctermfg=1
highlight cLabel ctermfg=1
highlight cSpecial ctermfg=5
highlight cCharacter ctermfg=3
highlight cComment ctermfg=8 cterm=italic
highlight cTodo ctermfg=6 cterm=bold
