" $VIMRUNTIME/syntax/c.vim : c standar
" $HOME/.vim/syntax/c.vim : file
" Highlight all function names
syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
highlight def link cCustomFunc Function
highlight cCustomFunc ctermfg=4

" operations
" + - * / % << >> > < = == += -= *= /= %= >>= <<= != ! ~
syntax match cOperator "\(&\||\|\.\|\~\|!\|+\|=\|-\|%\([^:]\|$\)\|\^\|\*\|>\|<\|/\([^*/]\|$\)\)"
highlight cOperator ctermfg=1

syn keyword cSTDLib free malloc calloc realloc open fopen fread read write fwrite 
syn keyword cSTDLib err errx printf fprintf putc puts fputs fputc putchar fclose
highlight cSTDLib ctermfg=6


highlight cTypedef ctermfg=5
highlight cStructure ctermfg=2
highlight cType ctermfg=2
highlight cStorageClass ctermfg=1
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
highlight cComment ctermfg=0


