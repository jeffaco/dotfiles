" Tab Stop handling

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Allow status lines to be selected or hidden (show by default)

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

let s:hidden_all = 0

set showmode
set ruler
set laststatus=2
set showcmd

syntax on
filetype plugin indent on

" Pathogen support (VIM Package Management)

if exists("*pathogen#infect")
    execute pathogen#infect()
endif

" Make it super easy to edit .vimrc

noremap ,vim :new ~/.vimrc<cr>
