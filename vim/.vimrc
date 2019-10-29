" VIMRC for Tobias Fried
"
" Updated 2019.9.2
" Maintained whenever I feel like it

" Terminal Bell
set visualbell
"set t_vb=

" Line Numbers (number or nonumber)
set number

" Highlight last-used search pattern
set hlsearch

" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Tab size and handling
set sts=4
set ts=4
set sw=4
set expandtab

" Shortcut (Shift-H) to hide/show statusline
let s:hidden_all = 0
function! ToggleHiddenAll()
  if s:hidden_all  == 0
    let s:hidden_all = 1
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
  elseif s:hidden_all == 1
    let s:hidden_all = 2
    set showmode
    set ruler
    set laststatus=2
    set showcmd
  else  " Only Lightline
    let s:hidden_all = 0
  	set laststatus=2
  	set noshowmode
  	set noruler
  	set noshowcmd
  endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>

" Shortcut (Shift-S) to hide/show NERDTree
nnoremap <S-S> :NERDTreeToggle<CR>

" Shortcut (Shift-F) to toggle UNIX/Windows line ending characters
function! ToggleLineEndings()
   if &ff == 'dos'
    :e ++ff=unix
   elseif &ff == 'unix'
    :e ++ff=mac
   else
    :e ++ff=dos
   endif
endfunction
nnoremap <S-F> :call ToggleLineEndings()<CR>
