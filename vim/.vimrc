" VIMRC for Tobias Fried
" Updated 2021.2.12

" Plugins
packloadall

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_async = 1

" Handle NO EOL
" set binary

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
set sts=2
set ts=2
set sw=2
set expandtab

" Lightline
set laststatus=2
set noshowmode
set background=dark
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active' : {
  \    'left': [ [ 'mode', 'paste' ],
  \              [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
  \  },
  \ 'component': {
  \    'charvaluehex': '0x%B'
  \ },
  \ }

" " Shortcut (Shift-H) to hide/show statusline
" let s:hidden_all = 0
" function! ToggleHiddenAll()
"   if s:hidden_all  == 0
"     let s:hidden_all = 1
"     set noshowmode
"     set noruler
"     set laststatus=0
"     set noshowcmd
"   elseif s:hidden_all == 1
"     let s:hidden_all = 2
"     set showmode
"     set ruler
"     set laststatus=2
"     set showcmd
"   else  " Only Lightline
"     let s:hidden_all = 0
"   	set laststatus=2
"   	set noshowmode
"   	set noruler
"   	set noshowcmd
"   endif
" endfunction
" nnoremap <S-h> :call ToggleHiddenAll()<CR>

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

" Shortcut (jj) to exit insert mode
:imap jj <Esc>

" Shortcut to find/replace highlighted word
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Update time for swap and changes
set updatetime=250
 
" Colors and syntax highlighting
syntax on
" colorscheme default

nnoremap <C-H> :set cursorline!<CR>

highlight LineNr ctermfg=8
highlight CursorLine cterm=NONE ctermbg=BLACK
highlight CursorLineNr cterm=NONE ctermfg=BLACK ctermbg=8
highlight SignColumn ctermbg=BLACK
highlight GitGutterAdd ctermbg=GREEN ctermfg=BLACK
highlight GitGutterChange ctermbg=BLUE ctermfg=BLACK
highlight GitGutterDelete ctermbg=BROWN ctermfg=BLACK
highlight GitGutterChangeDelete ctermbg=BROWN ctermfg=BLACK
highlight Visual ctermbg=16 ctermfg=WHITE
highlight Pmenu ctermbg=0 ctermfg=8
highlight PmenuSel ctermbg=3 ctermfg=BLACK
highlight PmenuSbar ctermbg=0
highlight PmenuThumb ctermbg=3
