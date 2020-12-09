" Plugins {{{
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-cutlass'
Plug 'arcticicestudio/nord-vim'
call plug#end()

packadd! matchit
" }}}

" Colors {{{
colorscheme nord
syntax enable
" }}}

" UI {{{
set cursorline
set laststatus=2
set linebreak
set list
set listchars=tab:-->,space:·
set number
set numberwidth=1
set ruler
set scrolloff=4
set showcmd
set showmode
set showmatch
set sidescrolloff=4
set visualbell
set wildmenu
set wildmode=list:longest
set wrap
" }}}

" Indentation {{{
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
" }}}

" Folding {{{
set foldenable
set foldlevelstart=99
set foldmethod=indent
" }}}

" Search {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
" }}}

" Movement {{{
set backspace=indent,eol,start
set nostartofline
noremap j gj
noremap k gk
noremap B ^
noremap E $
noremap $ <nop>
noremap ^ <nop>
" Cutlass {{{
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D
" }}}
" }}}

" Misc {{{
filetype plugin on
filetype indent on

set autoread
set lazyredraw

set splitbelow
set splitright

set modeline
set modelines=1

set noswapfile
set nobackup
set nowritebackup

set confirm

set clipboard+=unnamedplus
" }}}

" Autogroups {{{
augroup config
    autocmd VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    autocmd VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
augroup END
" }}}

" vim:foldmethod=marker:foldlevel=0
