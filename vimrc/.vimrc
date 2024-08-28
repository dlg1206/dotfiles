" Enable syntax highlighting
syntax on

" Set default tabs and shift tabs with 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Set auto-indentation options
set autoindent  " Auto indent tabstop=4 fill with spaces
set smartindent " Provides basic automatic indentation for code.
set smarttab    " Adjusts Tab key behavior to insert spaces based on indentation level.
set expandtab   " Replaces tab characters with spaces.

" Highlight matching parentheses and brackets
set showmatch
" Configure backspace behavior
set backspace=indent,eol,start
" Set minimum height and width for windows
set winminheight=0
set winminwidth=0
" Display cursor position in the status line
set ruler

" Set color scheme
colorscheme industry

" Auto complete braces
inoremap {<CR> {<CR>}<Esc>ko

" Auto close parentheses
inoremap ( (  )<left><left>

" Auto close brackets
inoremap [ []<left>

" Auto comment sections
inoremap /* /*<CR>*/<Esc>ko

" Auto close single and double quotations
inoremap " "'<left>
inoremap ' ''<left>

" Tab/Untab highlighted text
vmap <Tab> >gv
vmap <S-Tab> <gv

" Auto complete author name
inoremap @a @author: Derek Garcia

" Auto complete @param
inoremap @p @param

" Auto complete #include
inoremap #i #include

" Auto complete @return
inoremap @r @return

" Auto complete #define
inoremap #d #define

" F-Key Functions
" --------------------
" F1 - Vim Help
" F2 - Toggle Mouse
" F3 - Toggle 80 char marker
" F4 - Toggle tab between 4 and 8 spaces
" F5 - Toggle line numbers

" Use F2 to toggle mouse
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == "a"
        " disable mouse
        set mouse=
        echo "Mouse off"
    else
        " enable mouse everywhere
        set mouse=a
        echo "Mouse on"
    endif
endfunction
map <F2> <ESC>:call ToggleMouse()<CR>

" Use F3 toggle 80 character line
set colorcolumn=80  " Set line 80 color
function! ToggleColorColumn()
  if &colorcolumn == ""
    " Set colorcolumn to 80 if it is currently not set
    execute "set colorcolumn=80"
    echo "Column on"
  else
    " Clear colorcolumn if it is set
    execute "set colorcolumn="
    echo "Column off"
  endif
endfunction
nnoremap <F3> :call ToggleColorColumn()<CR>

" Use F4 to change tab width
function! ToggleTab()
    if &tabstop == 8
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        echo "Tabstop = 4"
    else
        set tabstop=8
        set shiftwidth=8
        set softtabstop=8
        echo "Tabstop = 8"
    endif
endfunction
map <F4> <ESC>:call ToggleTab() <CR>


" Use F5 to toggle line numbers
set number  " Show line numbers
function! ToggleLineNumbers()
  if &number
    set nonumber norelativenumber
    echo "Line numbers off"
  else
    set number
    echo "Line numbers on"
  endif
endfunction
nnoremap <F5> :call ToggleLineNumbers()<CR>
