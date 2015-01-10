"============================================================================
" General settings
"============================================================================
set nocompatible        " Turn off vi compatibility
set undolevels=1000     " Lots and lots of undo
set history=50          " Size of :command history
set modelines=20
set modeline            " Turn on modelines
set showcmd             " Display incomplete commands
set showmatch           " Show matches on bracketc, etc.
set nu                  " Dispaly numbers along border
set visualbell
set noerrorbells
set nowrap              " don't wrap lines
set scrolloff=5         " Lines off the edges of the screen when scrolling
set noswapfile          " They're just annoying. Who likes them?
set wildmenu            " Tab completion
set wildmode=longest:full
set nobackup            " do not keep a backup file, use versions instead
set ruler               " show the cursor position all the time

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable folding by fold markers
set foldmethod=marker 

" Fold methods are automatically saved
au BufWinLeave * mkview
au BufWinEnter * silent loadview

"============================================================================
" Colorscheme
"============================================================================
filetype plugin indent on
syntax on

colorscheme pablo       " blue, darkblue, default, delek, desert, elflord
                        " evening, koehler, morning, murphy, pablo,
                        " peachpuff, ron, shine, slate, torte, zellner
set background=dark     " dark or light

filetype plugin indent on " Enable file type detection.
"
"============================================================================
" Tab standards. 
"============================================================================
"Sorry, 8 spaces are too much for nested loops!
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround          " indent/outdent to nearest tabstops
set expandtab           " enter spaces when tab is pressed
set nojoinspaces        " no extra spaces

"============================================================================
" Statusline
"============================================================================
set laststatus=2        " Always put a status line

"============================================================================
" Search and Replace
"============================================================================
set incsearch           " Show partial matches as search is entered
set hlsearch            " Highlight search patterns
set ignorecase          " Ignore case distinction when searching
set smartcase           " ... unless there are capitals in the search string.
set nowrapscan          " Don't wrap to top of buffer when searching

"============================================================================
" Commands   
"============================================================================
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":CompOrig")
    command CompOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif    
    
" call make on folder
nnoremap <F4> :!make install<cr>
"
" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F5>
"
" cycle through list mode
nnoremap <F6> :set list!<cr>
"
" cycle through number mode
nnoremap <F7> :set number!<cr>
"
" cycle through split windows, and <Shift>+<F6> to cycle backwards
nnoremap <F8> <C-W>w
nnoremap <S-F8> <C-W>W
    
" make tab in v mode ident code
vmap <tab> >gv 
vmap <s-tab> <gv 
    
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Restore the screen when we're exiting
if &term == "xterm"
    let &t_ti = "\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l"
endif

"============================================================================
" MODES
"============================================================================
" Set syntax on non-standard files
au BufRead,BufNewFile *.xpy set filetype=python
au BufRead,BufNewFile *.xpl set filetype=perl
au BufRead,BufNewFile *.pf set filetype=tcsh

"au FileType text call TextMode()
"au FileType mail call TextMode()
"au FileType perl call PerlMode()
"au FileType python call PythonMode()
""============================================================================
"" Functions
""============================================================================
"function! TextMode()
"    set nosmartindent           " Don't indent
"    set noshowmatch             " Don't show matches on parens, brackets, etc.
"    set comments=n:>,n:#,n:/,fn:-   " List of things to be treated as comments
"    set formatoptions=tcrq      " Word wrap, format comments
"endfunction
"
"function! PythonMode()
"    set list
"    set nosmartindent             Don't smart indent
"    set smartindent               smart indent
"    set cindent                 " Use C-indenting
"    set cinwords=if,elif,else,for,while,try,except,finally,def,class
"    set autoindent
"endfunction

match Error /\%81v.\+/	"Marks characters after 80 lines in red
