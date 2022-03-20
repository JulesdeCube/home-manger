" $VIMRUNTIME/syntax/python.vim : python standar
" $HOME/.vim/syntax/python.vim : file
" Highlight all function names
syntax match pythonCustomFunc /\w\+\s*(/me=e-1,he=e-1
highlight def link pythonCustomFunc Function
highlight pythonCustomFunc ctermfg=2

" operations
" + - * / % << >> > < = == += -= *= /= %= >>= <<= != ! ~
syntax match pythonOperator "\(&\||\|\~\|!\|+\|=\|-\|%\([^:]\|$\|?\)\|\^\|\*\|>\|<\|/\([^*/]\|$\)\)"
highlight pythonOperator ctermfg=1

syn match pythonParens /[[\](){}.,:]/
highlight pythonParens ctermfg=7

syn match pythonSelfKeyword /self/
highlight pythonSelfKeyword ctermfg=7

