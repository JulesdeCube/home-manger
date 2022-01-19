set encoding=utf-8
set viminfo=""
set noshowmode

set clipboard=unnamedplus

syntax on
set number

set softtabstop=4

set scrolloff=8
set sidescrolloff=8

set colorcolumn=80

" noremap ; l
" noremap l k
" noremap k j
" noremap j h
" noremap <C-w>j <C-w>h
" noremap <C-w>k <C-w>j
" noremap <C-w>l <C-w>k
" noremap <C-w>; <C-w>l

vnoremap < <gv
vnoremap > >gv

set noswapfile
set autoread
set autowrite

set foldmethod=syntax

let g:airline_theme='wombat'
colorscheme default

function FormatBuffer()
   if executable('clang-format') == 0
       echo "can't find clang-format"
   else
       echo "find clang-format avaible"
   endif

   if &modified && executable('clang-format') && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
     let cursor_pos = getpos('.')
     :%!clang-format --style=file
     call setpos('.', cursor_pos)
   endif
 endfunction

function Hightlight()
    syntax match EndSpaces /\s\+$/
    syntax match Tabs /\t/
endfunction

hi EndSpaces ctermbg=173 guibg=#D89B69
hi Tabs ctermbg=196 guibg=#CB7558
match EndSpaces /\s\+$/
match Tabs /\t/

hi LineNr ctermfg=8
hi EndOfBuffer ctermfg=0
hi ColorColumn ctermbg=0

hi Keyword ctermfg=1
hi Statement ctermfg=1
hi Constant ctermfg=13
hi Number ctermfg=13
hi PreProc ctermfg=1
hi Function ctermfg=2
hi Identifier ctermfg=4
hi Type ctermfg=6 cterm=italic
hi Special ctermfg=5
hi String ctermfg=3
hi Comment ctermfg=8 cterm=italic
hi Comment ctermfg=7
hi Todo ctermfg=6 cterm=bold

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()
autocmd BufWinEnter * call Hightlight()
autocmd InsertEnter * call Hightlight()
autocmd InsertLeave * call Hightlight()
autocmd BufWinLeave * call clearmatches()

autocmd FileType make setlocal noexpandtab

