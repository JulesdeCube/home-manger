set encoding=utf-8
set viminfo=""
set noshowmode

syntax on
set number

set softtabstop=4

set colorcolumn=80

noremap ; l
noremap l k
noremap k j
noremap j h
noremap <C-w>j <C-w>h
noremap <C-w>k <C-w>j
noremap <C-w>l <C-w>k
noremap <C-w>; <C-w>l

set noswapfile
set autoread
set autowrite

set foldmethod=syntax

let g:airline_theme='wombat'

highlight EndSpaces ctermbg=173 guibg=#D89B69
match EndSpaces /\s\+$/

highlight Tabs ctermbg=196 guibg=#CB7558
match Tabs /\t/

autocmd BufWinEnter * call Hightlight()
autocmd InsertEnter * call Hightlight()
autocmd InsertLeave * call Hightlight()
autocmd BufWinLeave * call clearmatches()

function Hightlight()
    syntax match EndSpaces /\s\+$/
    syntax match Tabs /\t/
endfunction

autocmd FileType make setlocal noexpandtab

highlight LineNr ctermfg=0
highlight EndOfBuffer ctermfg=0
highlight EndOfBuffer ctermfg=0
highlight ColorColumn ctermbg=8

function FormatBuffer()
   if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
     let cursor_pos = getpos('.')
     :%!clang-format --style=file
     call setpos('.', cursor_pos)
   endif
 endfunction

 autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()
