""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " get out of horrible vi-compatible mode
filetype on " detect the type of file
set history=10000 " How many lines of history to remember
set cf " enable error files and error jumping
"set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs=unix,dos,mac " support all three, in this order
filetype indent on
filetype plugin on " load filetype plugins
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
set tags=tags;/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark " we are using a dark background
syntax on " syntax highlighting on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
"set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
"set lz " do not redraw while running macros (much faster) (LazyRedraw)
"set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
"set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
"set nohlsearch " do not highlight searched for phrases
set hlsearch "highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set noerrorbells " no noises
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%f%m%r%h%w\ %{&ff}%(\-%{&ft}%)%=\ %1.l,%1.v\ \|\ %3p%%\ of\ %L
set laststatus=2 " always show the status line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ai " autoindent
set si " smartindent
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set et
"set noexpandtab " real tabs please!
set nowrap " do not wrap lines
"set wrap " wrap lines
set textwidth=72
setlocal spelllang=en

"set spell
" set smarttab " use tabs at the start of a line, spaces elsewhere

" tab navigation like firefox
" nmap <C-S-tab> :tabprevious<cr>
" nmap <C-tab> :tabnext<cr>
" map <C-S-tab> :tabprevious<cr>
" map <C-tab> :tabnext<cr>
" imap <C-S-tab> <ESC>:tabprevious<cr>i
" imap <C-tab> <ESC>:tabnext<cr>i
" nmap <C-t> :tabnew<cr>
" imap <C-t> <ESC>:tabnew<cr>

" This highlights stuff beyond column 72.
" for the below, ctermfg=white or guifg=white are also options.
highlight OverLength ctermbg=DarkGray guibg=#592929
match OverLength /\%72v.*/

" This automatically deletes trailing whitespace on file save.
" autocmd BufWritePre * :%s/\s\+$//e

" Ignore whitespace when using vimdiff.
set diffopt+=iwhite

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" The above doesn't actually save the cursor position. This does.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

